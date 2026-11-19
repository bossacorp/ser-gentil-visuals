#!/usr/bin/env python3
"""
separar.py — convierte el arte (PSD por tintas, estilo serigrafía) de una canción en capas
listas para Max/Jitter.

Produce dos familias de capas, todas PNG con alfa, del mismo tamaño (por defecto 2048×2048),
alineadas pixel a pixel para que se puedan apilar sin offsets:

  capas/tintas/   Una capa por tinta del PSD. Sirven para recolorear cada tinta por separado
                  y para efectos de "mal registro" de serigrafía.
  capas/escena/   Elementos o planos de la imagen. Apilados en orden 00→NN recomponen el arte.
                  Sirven para mover/animar cada elemento (parallax, flotación, etc.).
  mascaras/       El alfa de cada capa en escala de grises (blanco = elemento), para efectos por zona.
  preview/        Hoja de contacto, mapa de segmentación y prueba de recomposición.
  paleta.json     Colores de cada tinta medidos sobre el compuesto del PSD (para homologar).

Cada canción tiene un archivo de configuración <nn_nombre>.json en esta carpeta:

  "tintas": nombres de las capas VISIBLES del PSD de abajo hacia arriba (p. ej. papel, crema, vino, linea).
            Las capas ocultas se exportan como "oculta".
  "modo":   "cielo"  → arte con cielo liso oscuro (05 Por siempre): figuras = polígono guía ∩ zonas que no
                       son cielo; además luna (círculo), estrellas y nubes automáticas.
            "capas"  → arte sin cielo (01 Densidad): planos definidos por polígonos de atrás hacia
                       adelante. Lo que queda tapado detrás de cada plano se rellena (inpainting) para
                       poder moverlo sin huecos. El plano 00_fondo es todo lo que no es otro plano.
  Coordenadas siempre en px sobre el arte escalado a 2048×2048.

Uso:
  python3 -I separar.py <arte.psd> <config.json> <carpeta_salida> [--size 2048]

Requisitos: pip install -r requirements.txt
"""
import argparse, json, os
import numpy as np, cv2
from PIL import Image, ImageDraw
from psd_tools import PSDImage


def disk(r):
    r = max(1, int(r))
    return cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (2 * r + 1, 2 * r + 1))


def save_rgba(path, rgb, alpha):
    a = np.clip(alpha * 255, 0, 255).astype(np.uint8)
    Image.fromarray(np.dstack([np.clip(rgb, 0, 255).astype(np.uint8), a]), "RGBA").save(path, optimize=True)


def save_mask(path, alpha):
    Image.fromarray(np.clip(alpha * 255, 0, 255).astype(np.uint8), "L").save(path, optimize=True)


def soft(mask, sigma=0.8):
    """Borde suave de ~1 px para que el recorte no se vea dentado al escalar/mover."""
    return cv2.GaussianBlur(mask.astype(np.float32), (0, 0), sigma)


def fill_holes(img, hole, work=512):
    """Rellena `hole` (bool) con inpainting a baja resolución; devuelve imagen float completa.
    El relleno solo se ve si el plano de enfrente se mueve, así que basta una aproximación suave."""
    S = img.shape[0]
    small = cv2.resize(img.astype(np.uint8), (work, work), interpolation=cv2.INTER_AREA)
    hs = cv2.resize(hole.astype(np.uint8), (work, work), interpolation=cv2.INTER_NEAREST)
    hs = cv2.dilate(hs, disk(2))
    filled = cv2.inpaint(small, hs, 6, cv2.INPAINT_TELEA)
    up = cv2.resize(filled, (S, S), interpolation=cv2.INTER_CUBIC).astype(np.float32)
    out = img.astype(np.float32).copy()
    out[hole] = up[hole]
    return out


# ---------------------------------------------------------------- modo "cielo"
def escena_cielo(comp, al_line, P, S, k):
    blk = (al_line > 0.5).astype(np.uint8)
    op = cv2.morphologyEx(blk, cv2.MORPH_OPEN, disk(max(3, 7 / k)))
    n, lab, st, _ = cv2.connectedComponentsWithStats(op, 8)
    sky = np.isin(lab, [i for i in range(1, n) if st[i, 4] > 3000 / (k * k)])
    not_sky = ~sky

    def poly(pts):
        m = np.zeros((S, S), np.uint8)
        cv2.fillPoly(m, [np.round(np.array(pts) / k).astype(np.int32)], 1)
        return m.astype(bool)

    def figure(region, close_r, grow=5):
        m = (region & not_sky).astype(np.uint8)
        m = cv2.morphologyEx(m, cv2.MORPH_CLOSE, disk(close_r / k)).astype(bool) & region
        return cv2.dilate(m.astype(np.uint8), disk(grow / k)).astype(bool) & region

    figs = {}
    for f in P["figuras"]:
        figs[f["nombre"]] = figure(poly(f["poly"]), f.get("cierre", 22))
        for (ex, ey, ax, ay, ang) in f.get("rellenos_elipse", []):
            m = np.zeros((S, S), np.uint8)
            cv2.ellipse(m, (int(ex / k), int(ey / k)), (int(ax / k), int(ay / k)), ang, 0, 360, 1, -1)
            figs[f["nombre"]] |= m.astype(bool)
    # una figura no invade a las que están delante (orden del archivo = de atrás hacia adelante)
    names = [f["nombre"] for f in P["figuras"]]
    for i, nm in enumerate(names):
        for front in names[i + 1:]:
            figs[nm] &= ~figs[front]
    anyfig = np.zeros((S, S), bool)
    for m in figs.values():
        anyfig |= m

    cx, cy, r = [v / k for v in P["luna_circulo"]]
    yy, xx = np.mgrid[0:S, 0:S]
    luna = (((xx - cx) ** 2 + (yy - cy) ** 2) <= r * r) & ~anyfig

    ns = (not_sky & ~anyfig & ~luna).astype(np.uint8)
    n2, lab2, st2, _ = cv2.connectedComponentsWithStats(ns, 8)
    star_ids = [i for i in range(1, n2) if st2[i, 4] < 900 / (k * k) and max(st2[i, 2], st2[i, 3]) < 45 / k]
    estrellas = cv2.dilate(np.isin(lab2, star_ids).astype(np.uint8), disk(2)).astype(bool) & ~anyfig & ~luna

    nubes = cv2.dilate((not_sky & ~anyfig & ~luna & ~estrellas).astype(np.uint8), disk(3)).astype(bool)
    nubes &= ~anyfig & ~luna & ~estrellas
    n3, lab3, st3, _ = cv2.connectedComponentsWithStats(nubes.astype(np.uint8), 8)
    big = 1 + int(np.argmax(st3[1:, 4]))
    masa = lab3 == big

    sky_rgb = np.median(comp[sky], axis=0)
    capas = [("00_cielo", np.broadcast_to(sky_rgb.astype(np.float32), (S, S, 3)), np.ones((S, S), np.float32))]
    elems = {"01_estrellas": estrellas, "02_luna": luna, "03_nubes_masa": masa,
             "04_nubes_sueltas": nubes & ~masa, **figs}
    for nm in sorted(elems):
        capas.append((nm, comp, soft(elems[nm])))
    return capas, {"cielo": [int(v) for v in sky_rgb]}


# ---------------------------------------------------------------- modo "capas"
def escena_capas(comp, al_line, P, S, k):
    def poly(pts):
        m = np.zeros((S, S), np.uint8)
        cv2.fillPoly(m, [np.round(np.array(pts) / k).astype(np.int32)], 1)
        return m.astype(bool)

    def ajuste_oscuro(region, close_r):
        """Ajusta el plano al borde real de una masa de tinta de línea (copa de árbol, casco):
        cierra huecos chicos, rellena el interior y respeta las entradas abiertas (p. ej. un tronco)."""
        m = ((al_line > 0.5) & region).astype(np.uint8)
        m = cv2.morphologyEx(m, cv2.MORPH_CLOSE, disk(close_r / k))
        cnts, _ = cv2.findContours(m, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)
        filled = np.zeros_like(m)
        cnts = [c for c in cnts if cv2.contourArea(c) > 400 / (k * k)]
        cv2.drawContours(filled, cnts, -1, 1, -1)
        return cv2.dilate(filled, disk(3 / k)).astype(bool) & region

    planos = []  # de atrás hacia adelante
    for p in P["planos"]:
        m = poly(p["poly"])
        if p.get("ajuste") == "oscuro":
            m = ajuste_oscuro(m, p.get("cierre", 15))
        planos.append((p["nombre"], m))
    masks = [np.ones((S, S), bool)] + [m for _, m in planos]
    names = ["00_fondo"] + [n for n, _ in planos]
    capas = []
    for i, (nm, m) in enumerate(zip(names, masks)):
        front = np.zeros((S, S), bool)
        for mf in masks[i + 1:]:
            front |= mf
        hole = m & front                       # zona del plano tapada por planos de enfrente
        rgb = fill_holes(comp, hole) if hole.any() else comp
        alpha = np.ones((S, S), np.float32) if i == 0 else soft(m, 1.2)
        capas.append((nm, rgb, alpha))
    return capas, {}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("psd"); ap.add_argument("config"); ap.add_argument("out")
    ap.add_argument("--size", type=int, default=2048)
    a = ap.parse_args()
    S, O = a.size, a.out
    k = 2048 / S
    for d in ("capas/escena", "capas/tintas", "mascaras", "preview"):
        os.makedirs(f"{O}/{d}", exist_ok=True)
    P = json.load(open(a.config))

    psd = PSDImage.open(a.psd)
    comp = np.asarray(psd.composite().convert("RGB").resize((S, S), Image.LANCZOS)).astype(np.float32)
    layers = list(psd)
    print("PSD", psd.size, "modo", psd.color_mode, "→", S, "px;", len(layers), "capas")

    vis = [l for l in layers if l.visible]
    hid = [l for l in layers if not l.visible]
    if len(vis) != len(P["tintas"]):
        raise SystemExit(f"El PSD tiene {len(vis)} capas visibles y la config nombra {len(P['tintas'])} tintas")

    def rgba(l):
        return np.asarray(l.topil().convert("RGBA").resize((S, S), Image.LANCZOS)).astype(np.float32) / 255

    tint_names = P["tintas"]
    al = {}
    for nm, l in zip(tint_names, vis):
        al[nm] = rgba(l)[..., 3]

    # --- paleta calibrada: color del compuesto donde cada tinta queda arriba ---
    pal = {}
    for i, nm in enumerate(tint_names):
        top = al[nm] > 0.9
        for above in tint_names[i + 1:]:
            top &= al[above] < 0.1
        if top.sum() > 100:
            pal[nm] = [int(v) for v in np.median(comp[top], axis=0)]
        else:
            pal[nm] = [int(v) for v in (rgba(vis[i])[..., :3].reshape(-1, 3).mean(0) * 255)]

    # --- tintas ---
    for i, nm in enumerate(tint_names):
        fname = f"t{i + 1}_{nm}"
        save_rgba(f"{O}/capas/tintas/{fname}.png",
                  np.broadcast_to(np.array(pal[nm], np.float32), (S, S, 3)), al[nm])
        save_mask(f"{O}/mascaras/{fname}.png", al[nm])
    for j, l in enumerate(hid):
        p = rgba(l)
        save_rgba(f"{O}/capas/tintas/t{len(tint_names) + 1 + j}_oculta.png", p[..., :3] * 255, p[..., 3])

    # --- escena ---
    if P["modo"] == "cielo":
        capas, extra = escena_cielo(comp, al[tint_names[-1]], P, S, k)
    else:
        capas, extra = escena_capas(comp, al[tint_names[-1]], P, S, k)
    pal.update(extra)
    hexs = {kk: "#%02x%02x%02x" % tuple(v) for kk, v in pal.items()}
    print("paleta", hexs)

    stack = np.zeros((S, S, 3), np.float32)
    cobertura = {}
    for nm, rgb, alpha in capas:
        save_rgba(f"{O}/capas/escena/{nm}.png", rgb, alpha)
        if not nm.startswith("00_"):
            save_mask(f"{O}/mascaras/{nm}.png", alpha)
        stack = stack * (1 - alpha[..., None]) + rgb * alpha[..., None]
        cobertura[nm] = round(float((alpha > 0.5).mean() * 100), 2)

    # --- verificación: recomposición vs compuesto original ---
    def psnr(x):
        return 10 * np.log10(255 ** 2 / max(float(np.mean((x - comp) ** 2)), 1e-9))
    tint = np.zeros((S, S, 3), np.float32)
    for nm in tint_names:
        aa = al[nm][..., None]
        tint = tint * (1 - aa) + np.array(pal[nm], np.float32) * aa
    ps, pt = psnr(stack), psnr(tint)
    print(f"recomposición escena PSNR {ps:.1f} dB · tintas PSNR {pt:.1f} dB")

    # --- previews ---
    T = 512
    files = [("capas/escena", f) for f in sorted(os.listdir(f"{O}/capas/escena"))] + \
            [("capas/tintas", f) for f in sorted(os.listdir(f"{O}/capas/tintas"))]
    cols = 4
    rows = (len(files) + cols - 1) // cols
    sheet = Image.new("RGB", (cols * T, rows * (T + 28)), (25, 25, 25))
    d = ImageDraw.Draw(sheet)
    for i, (dd, f) in enumerate(files):
        x, y = (i % cols) * T, (i // cols) * (T + 28)
        im = Image.open(f"{O}/{dd}/{f}").convert("RGBA").resize((T, T), Image.LANCZOS)
        bg = Image.new("RGBA", (T, T), (255, 0, 255, 255)); bg.alpha_composite(im)
        sheet.paste(bg.convert("RGB"), (x, y + 28))
        d.text((x + 8, y + 8), f"{dd.split('/')[-1]}/{f}", fill=(240, 240, 240))
    sheet.save(f"{O}/preview/hoja_de_contacto.jpg", quality=88)

    palette = [(255, 255, 0), (0, 160, 255), (0, 200, 0), (0, 255, 160), (255, 0, 255), (255, 120, 0),
               (255, 0, 80), (120, 80, 255), (255, 200, 120)]
    ov = comp.copy()
    for i, (nm, _, alpha) in enumerate(capas[1:]):
        m = alpha > 0.5
        ov[m] = ov[m] * 0.45 + np.array(palette[i % len(palette)]) * 0.55
    Image.fromarray(ov.astype(np.uint8)).resize((1024, 1024)).save(f"{O}/preview/mapa_segmentacion.jpg", quality=88)
    side = np.concatenate([comp, stack], axis=1).astype(np.uint8)
    Image.fromarray(side).resize((2048, 1024)).save(f"{O}/preview/original_vs_recompuesto.jpg", quality=88)

    json.dump({"tamano_px": S, "modo": P["modo"], "tintas_hex": hexs, "tintas_rgb": pal,
               "max_rgb_0a1": {kk: [round(c / 255, 4) for c in v] for kk, v in pal.items()},
               "verificacion": {"psnr_escena_db": round(ps, 1), "psnr_tintas_db": round(pt, 1)},
               "cobertura_pct": cobertura},
              open(f"{O}/paleta.json", "w"), indent=1, ensure_ascii=False)


if __name__ == "__main__":
    main()
