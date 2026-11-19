#!/usr/bin/env python3
"""
motor_config.py — genera patches/canciones.json, lo único que lee el motor de Max (motor.js) para
saber qué capas tiene cada canción, cómo se mueve cada una, dónde está su pivote y qué color lleva
cada tinta.

Entradas:  patches/movimientos.json  (escrito a mano: movimiento por capa)
           canciones/<nn>/capas/escena/*.png, capas/tintas/*.png, mascaras/*.png, paleta.json
Salida:    patches/canciones.json

Uso: python3 tools/motor_config.py
Requisitos: numpy, pillow
"""
import json, sys
from pathlib import Path
import numpy as np
from PIL import Image

ROOT = Path(__file__).resolve().parent.parent
MAX_ESCENA, MAX_TINTAS = 8, 5


def pivot(mask_path, kind):
    """Pivote en coordenadas normalizadas del arte: u,v ∈ [-1, 1], v hacia arriba."""
    m = np.asarray(Image.open(mask_path).convert("L")) > 128
    ys, xs = np.nonzero(m)
    if len(xs) == 0:
        return [0.0, 0.0], [0, 0, 0, 0]
    S = m.shape[0]
    x0, x1, y0, y1 = xs.min(), xs.max(), ys.min(), ys.max()
    cx = (x0 + x1) / 2
    cy = y1 if kind == "base" else (y0 + y1) / 2
    u = cx / (S / 2) - 1
    v = -(cy / (S / 2) - 1)
    return [round(float(u), 4), round(float(v), 4)], [int(x0), int(y0), int(x1), int(y1)]


def main():
    M = json.loads((ROOT / "patches" / "movimientos.json").read_text())
    out = {"_nota": "GENERADO por tools/motor_config.py — no editar a mano (edita patches/movimientos.json).",
           "canciones": []}
    problems = []
    for key in M["orden"]:
        cfg = M["canciones"][key]
        d = ROOT / "canciones" / key
        pal = json.loads((d / "paleta.json").read_text())["max_rgb_0a1"]
        escena = sorted((d / "capas" / "escena").glob("*.png"))
        tintas = [p for p in sorted((d / "capas" / "tintas").glob("*.png")) if "oculta" not in p.stem]
        if len(escena) > MAX_ESCENA or len(tintas) > MAX_TINTAS:
            problems.append(f"{key}: más capas que slots ({len(escena)}/{MAX_ESCENA}, {len(tintas)}/{MAX_TINTAS})")
        capas = []
        for p in escena:
            c = cfg["capas"].get(p.stem)
            if c is None:
                problems.append(f"{key}/{p.stem}: falta en movimientos.json (queda 'fijo')")
                c = {"mov": "fijo", "prof": 0.5}
            kind = c.get("pivote", "centro")
            mpath = d / "mascaras" / f"{p.stem}.png"
            piv, bbox = pivot(mpath, kind) if mpath.exists() else ([0.0, 0.0], [0, 0, 2047, 2047])
            if "pivote_px" in c:  # pivote fijado a mano (p. ej. centro real de la luna, fuera del cuadro)
                px, py = c["pivote_px"]
                piv = [round(px / 1024 - 1, 4), round(-(py / 1024 - 1), 4)]
            capas.append({"nombre": p.stem, "archivo": p.relative_to(ROOT).as_posix(),
                          "mov": c["mov"], "prof": c.get("prof", 0.5), "figura": bool(c.get("figura", False)),
                          "pivote": piv, "bbox_px": bbox})
        for stem in cfg["capas"]:
            if not (d / "capas" / "escena" / f"{stem}.png").exists():
                problems.append(f"{key}/{stem}: está en movimientos.json pero no hay PNG")
        tl = []
        for p in tintas:
            ink = p.stem.split("_", 1)[1]
            tl.append({"nombre": p.stem, "archivo": p.relative_to(ROOT).as_posix(), "tinta": ink,
                       "color": pal.get(ink, [1, 1, 1])})
        out["canciones"].append({"id": key, "titulo": cfg["titulo"], "escena": capas, "tintas": tl})
    (ROOT / "patches" / "canciones.json").write_text(json.dumps(out, indent=1, ensure_ascii=True) + "\n")
    for p in problems:
        print("AVISO:", p)
    print(f"patches/canciones.json: {len(out['canciones'])} canciones")
    return 1 if any("más capas" in p for p in problems) else 0


if __name__ == "__main__":
    sys.exit(main())
