#!/usr/bin/env python3
"""
separar.py — convierte el arte (PSD por tintas, estilo serigrafía) de una canción en capas
listas para Max/Jitter.

Produce dos familias de capas, todas PNG con alfa, del mismo tamaño (por defecto 2048×2048),
alineadas pixel a pixel para que se puedan apilar sin offsets:

  capas/tintas/   Una capa por tinta del PSD (crema, vino, línea, oculta). Sirven para
                  recolorear cada tinta por separado y para efectos de "mal registro" de serigrafía.
  capas/escena/   Elementos figurativos (cielo, estrellas, luna, nubes, figuras). Apilados en
                  orden 00→07 recomponen el arte completo. Sirven para mover/animar cada elemento.
  mascaras/       La misma información que el alfa de cada capa, en escala de grises
                  (blanco = elemento). Útiles en jit.gl.pix / jit.gl.slab para aplicar efectos
                  solo en una zona.
  preview/        Hoja de contacto, mapa de colores de la segmentación y prueba de recomposición.
  paleta.json     Colores de cada tinta medidos sobre el compuesto del PSD (para homologar).

Uso:
  python3 -I separar.py <arte.psd> <poligonos.json> <carpeta_salida> [--size 2048]

Requisitos: pip install psd-tools opencv-python-headless numpy pillow
"""
import argparse, json, os
import numpy as np, cv2
from PIL import Image, ImageDraw
from psd_tools import PSDImage


def disk(r):
    return cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (2 * r + 1, 2 * r + 1))


def save_rgba(path, rgb, alpha):
    a = np.clip(alpha * 255, 0, 255).astype(np.uint8)
    Image.fromarray(np.dstack([rgb.astype(np.uint8), a]), "RGBA").save(path, optimize=True)


def save_mask(path, alpha):
    Image.fromarray(np.clip(alpha * 255, 0, 255).astype(np.uint8), "L").save(path, optimize=True)


def soft(mask):
    """Borde suave de ~1 px para que el recorte no se vea dentado al escalar/mover."""
    return cv2.GaussianBlur(mask.astype(np.float32), (3, 3), 0.8)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("psd"); ap.add_argument("poligonos"); ap.add_argument("out")
    ap.add_argument("--size", type=int, default=2048)
    a = ap.parse_args()
    S = a.size
    O = a.out
    for d in ("capas/escena", "capas/tintas", "mascaras", "preview"):
        os.makedirs(f"{O}/{d}", exist_ok=True)

    psd = PSDImage.open(a.psd)
    sx = S / psd.size[0]
    comp = np.asarray(psd.composite().convert("RGB").resize((S, S), Image.LANCZOS)).astype(np.float32)
    layers = list(psd)
    plates = [np.asarray(l.topil().convert("RGBA").resize((S, S), Image.LANCZOS)).astype(np.float32) / 255
              for l in layers]
    print("PSD", psd.size, "modo", psd.color_mode, "→", S, "px;", len(layers), "capas")

    # Identifica las tintas del PSD por su contenido (orden de abajo hacia arriba)
    #   Fondo = papel, Capa 6 = crema, Capa 7 = vino, Capa 5 (visible) = línea, Capa 5 (oculta) = extra
    names = []
    for l in layers:
        names.append((l.name, l.visible))
    idx_paper, idx_cream, idx_wine = 0, 1, 2
    idx_line = [i for i, (n, v) in enumerate(names) if n == "Capa 5" and v][0]
    idx_hidden = [i for i, (n, v) in enumerate(names) if n == "Capa 5" and not v]

    al = {k: plates[i][..., 3] for k, i in
          (("papel", idx_paper), ("crema", idx_cream), ("vino", idx_wine), ("linea", idx_line))}

    # --- paleta calibrada: color del compuesto donde cada tinta queda arriba ---
    top_line = al["linea"] > 0.9
    top_wine = (al["vino"] > 0.9) & (al["linea"] < 0.1)
    top_cream = (al["crema"] > 0.9) & (al["vino"] < 0.1) & (al["linea"] < 0.1)
    pal = {}
    for k, m in (("linea", top_line), ("vino", top_wine), ("crema", top_cream)):
        pal[k] = [int(v) for v in np.median(comp[m], axis=0)]
    pal["papel"] = [int(v) for v in (plates[idx_paper][..., :3].reshape(-1, 3).mean(0) * 255)]
    hexs = {k: "#%02x%02x%02x" % tuple(v) for k, v in pal.items()}
    print("paleta", hexs)

    # --- tintas ---
    order = [("t1_papel", "papel"), ("t2_crema", "crema"), ("t3_vino", "vino"), ("t4_linea", "linea")]
    for fname, k in order:
        rgb = np.broadcast_to(np.array(pal[k], np.float32), (S, S, 3))
        save_rgba(f"{O}/capas/tintas/{fname}.png", rgb, al[k])
        save_mask(f"{O}/mascaras/{fname}.png", al[k])
    for j, i in enumerate(idx_hidden):
        p = plates[i]
        save_rgba(f"{O}/capas/tintas/t5_oculta{'' if j == 0 else j}.png", p[..., :3] * 255, p[..., 3])

    # --- escena: cielo = zonas negras grandes (la apertura borra las líneas finas) ---
    P = json.load(open(a.poligonos))
    k = 2048 / S  # los polígonos están en coordenadas de 2048
    blk = (al["linea"] > 0.5).astype(np.uint8)
    op = cv2.morphologyEx(blk, cv2.MORPH_OPEN, disk(max(3, int(7 / k))))
    n, lab, st, _ = cv2.connectedComponentsWithStats(op, 8)
    sky = np.isin(lab, [i for i in range(1, n) if st[i, 4] > 3000 / (k * k)])
    not_sky = ~sky

    def poly(pts):
        m = np.zeros((S, S), np.uint8)
        cv2.fillPoly(m, [np.round(np.array(pts) / k).astype(np.int32)], 1)
        return m.astype(bool)

    def figure(region, close_r, grow=5):
        m = (region & not_sky).astype(np.uint8)
        m = cv2.morphologyEx(m, cv2.MORPH_CLOSE, disk(max(1, int(close_r / k)))).astype(bool) & region
        return cv2.dilate(m.astype(np.uint8), disk(max(1, int(grow / k)))).astype(bool) & region

    R = {kk: poly(v) for kk, v in P["poly"].items()}
    figs = {"05_oso": figure(R["oso"], 22), "06_mujer": figure(R["mujer"], 9), "07_leon": figure(R["leon"], 9)}
    for name, (ex, ey, ax, ay, ang) in P.get("fill_ellipse", {}).items():
        m = np.zeros((S, S), np.uint8)
        cv2.ellipse(m, (int(ex / k), int(ey / k)), (int(ax / k), int(ay / k)), ang, 0, 360, 1, -1)
        key = {"mujer": "06_mujer", "leon": "07_leon", "oso": "05_oso"}[name.split("_")[0]]
        figs[key] |= m.astype(bool)
    # una figura no invade a otra (prioridad: león > mujer > oso)
    figs["06_mujer"] &= ~figs["07_leon"]
    figs["05_oso"] &= ~(figs["07_leon"] | figs["06_mujer"])
    anyfig = figs["05_oso"] | figs["06_mujer"] | figs["07_leon"]

    cx, cy, r = [v / k for v in P["luna_circle"]]
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

    escena = {
        "01_estrellas": estrellas,
        "02_luna": luna,
        "03_nubes_masa": masa,
        "04_nubes_sueltas": nubes & ~masa,
        **figs,
    }
    sky_rgb = [int(v) for v in np.median(comp[sky], axis=0)]
    pal["cielo"] = sky_rgb
    hexs["cielo"] = "#%02x%02x%02x" % tuple(sky_rgb)

    save_rgba(f"{O}/capas/escena/00_cielo.png", np.broadcast_to(np.array(sky_rgb, np.float32), (S, S, 3)),
              np.ones((S, S), np.float32))
    stack = np.broadcast_to(np.array(sky_rgb, np.float32), (S, S, 3)).copy()
    for name in sorted(escena):
        alpha = soft(escena[name])
        save_rgba(f"{O}/capas/escena/{name}.png", comp, alpha)
        save_mask(f"{O}/mascaras/{name}.png", alpha)
        stack = stack * (1 - alpha[..., None]) + comp * alpha[..., None]

    # --- verificación: recomposición vs compuesto original ---
    mse = float(np.mean((stack - comp) ** 2))
    psnr = 10 * np.log10(255 ** 2 / max(mse, 1e-9))
    tint = np.broadcast_to(np.array(pal["papel"], np.float32), (S, S, 3)).copy()
    for _, kk in order[1:]:
        aa = al[kk][..., None]
        tint = tint * (1 - aa) + np.array(pal[kk], np.float32) * aa
    psnr_t = 10 * np.log10(255 ** 2 / max(float(np.mean((tint - comp) ** 2)), 1e-9))
    print(f"recomposición escena PSNR {psnr:.1f} dB · tintas PSNR {psnr_t:.1f} dB")

    # --- previews ---
    T = 512
    def thumb(path, checker=True):
        im = Image.open(path).convert("RGBA").resize((T, T), Image.LANCZOS)
        bg = Image.new("RGBA", (T, T), (255, 0, 255, 255)) if checker else Image.new("RGBA", (T, T))
        bg.alpha_composite(im)
        return bg.convert("RGB")
    files = [("capas/escena", f) for f in sorted(os.listdir(f"{O}/capas/escena"))] + \
            [("capas/tintas", f) for f in sorted(os.listdir(f"{O}/capas/tintas"))]
    cols = 4
    rows = (len(files) + cols - 1) // cols
    sheet = Image.new("RGB", (cols * T, rows * (T + 28)), (25, 25, 25))
    d = ImageDraw.Draw(sheet)
    for i, (dd, f) in enumerate(files):
        x, y = (i % cols) * T, (i // cols) * (T + 28)
        sheet.paste(thumb(f"{O}/{dd}/{f}"), (x, y + 28))
        d.text((x + 8, y + 8), f"{dd.split('/')[-1]}/{f}", fill=(240, 240, 240))
    sheet.save(f"{O}/preview/hoja_de_contacto.jpg", quality=88)

    colors = {"01_estrellas": (255, 255, 0), "02_luna": (0, 160, 255), "03_nubes_masa": (0, 200, 0),
              "04_nubes_sueltas": (0, 255, 160), "05_oso": (255, 0, 255), "06_mujer": (255, 120, 0),
              "07_leon": (255, 0, 80)}
    ov = comp.copy()
    for name, m in escena.items():
        ov[m] = ov[m] * 0.45 + np.array(colors[name]) * 0.55
    Image.fromarray(ov.astype(np.uint8)).resize((1024, 1024)).save(f"{O}/preview/mapa_segmentacion.jpg", quality=88)
    side = np.concatenate([comp, stack], axis=1).astype(np.uint8)
    Image.fromarray(side).resize((2048, 1024)).save(f"{O}/preview/original_vs_recompuesto.jpg", quality=88)

    json.dump({"tamano_px": S, "tintas_hex": hexs, "tintas_rgb": pal,
               "max_rgb_0a1": {kk: [round(c / 255, 4) for c in v] for kk, v in pal.items()},
               "verificacion": {"psnr_escena_db": round(psnr, 1), "psnr_tintas_db": round(psnr_t, 1)},
               "cobertura_pct": {kk: round(float(v.mean() * 100), 2) for kk, v in escena.items()}},
              open(f"{O}/paleta.json", "w"), indent=1, ensure_ascii=False)


if __name__ == "__main__":
    main()
