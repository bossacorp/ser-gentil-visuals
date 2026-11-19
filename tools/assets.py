#!/usr/bin/env python3
"""
assets.py — archivos pesados (PSD y capas PNG) en un bucket de Google Cloud Storage;
el repo solo guarda código, configuraciones, previews y un candado (assets.lock.json) con el
hash de cada archivo, así que cada commit sabe exactamente qué versión del arte usa.

Configuración: assets.json en la raíz del repo  →  {"bucket": "gs://<bucket>/ser-gentil-visuals"}
Requisito en la Mac: Google Cloud CLI (`gcloud`) con sesión iniciada:
  gcloud auth login                     (tu cuenta de Google con acceso al bucket), o
  gcloud auth activate-service-account --key-file <llave.json>   (nunca guardes la llave en el repo)

Comandos (desde la raíz del repo):
  python3 tools/assets.py lock              recalcula assets.lock.json con lo que hay en disco
  python3 tools/assets.py verify            compara disco vs candado (qué falta / qué cambió)
  python3 tools/assets.py push [cancion]    sube capas, máscaras y PSD fuente al bucket
  python3 tools/assets.py pull [cancion]    baja del bucket lo que falte o haya cambiado y verifica
  python3 tools/assets.py build <cancion>   regenera las capas desde el PSD en canciones/<c>/fuente/

Flujo típico:
  - Después de separar una canción: build → lock → push → commit del candado.
  - En la Mac del show (antes de salir a la sede): git pull → assets.py pull. Max lee de disco,
    así que en la sede no se necesita internet.
"""
import hashlib, json, subprocess, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CANCIONES = ROOT / "canciones"
LOCK = ROOT / "assets.lock.json"
HEAVY = ("capas", "mascaras", "fuente")
HEAVY_EXT = {".png", ".psd", ".psb", ".zip", ".mov", ".mp4"}


def bucket():
    cfg = json.loads((ROOT / "assets.json").read_text())
    b = cfg["bucket"].rstrip("/")
    if "CAMBIAR" in b:
        sys.exit("Configura el bucket en assets.json antes de usar push/pull.")
    return b


def heavy_files(song=None):
    songs = [CANCIONES / song] if song else sorted(p for p in CANCIONES.iterdir() if p.is_dir())
    for s in songs:
        for sub in HEAVY:
            d = s / sub
            if d.exists():
                for f in sorted(d.rglob("*")):
                    if f.is_file() and f.suffix.lower() in HEAVY_EXT:
                        yield f


def sha(f):
    h = hashlib.sha256()
    with open(f, "rb") as fh:
        for chunk in iter(lambda: fh.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest()


def cmd_lock():
    old = json.loads(LOCK.read_text()) if LOCK.exists() else {}
    new = dict(old)
    for f in heavy_files():
        rel = f.relative_to(ROOT).as_posix()
        new[rel] = {"sha256": sha(f), "bytes": f.stat().st_size}
    new = {k: v for k, v in new.items() if (ROOT / k).exists() or k in old}
    LOCK.write_text(json.dumps(dict(sorted(new.items())), indent=1) + "\n")
    print(f"assets.lock.json: {len(new)} archivos")


def cmd_verify(song=None):
    lock = json.loads(LOCK.read_text())
    missing, changed = [], []
    for rel, meta in lock.items():
        if song and not rel.startswith(f"canciones/{song}/"):
            continue
        f = ROOT / rel
        if not f.exists():
            missing.append(rel)
        elif sha(f) != meta["sha256"]:
            changed.append(rel)
    for r in missing:
        print("FALTA     ", r)
    for r in changed:
        print("DISTINTO  ", r)
    print("ok" if not (missing or changed) else f"{len(missing)} faltan · {len(changed)} distintos")
    return not (missing or changed)


def rsync(src, dst):
    print("→", src, "→", dst)
    subprocess.run(["gcloud", "storage", "rsync", "--recursive", str(src), str(dst)], check=True)


def cmd_push(song=None):
    b = bucket()
    songs = [song] if song else [p.name for p in sorted(CANCIONES.iterdir()) if p.is_dir()]
    for s in songs:
        for sub in HEAVY:
            d = CANCIONES / s / sub
            if d.exists():
                rsync(d, f"{b}/canciones/{s}/{sub}")


def cmd_pull(song=None):
    b = bucket()
    lock = json.loads(LOCK.read_text())
    songs = sorted({k.split("/")[1] for k in lock})
    for s in ([song] if song else songs):
        for sub in HEAVY:
            if any(k.startswith(f"canciones/{s}/{sub}/") for k in lock):
                d = CANCIONES / s / sub
                d.mkdir(parents=True, exist_ok=True)
                rsync(f"{b}/canciones/{s}/{sub}", d)
    cmd_verify(song)


def cmd_build(song):
    src = sorted((CANCIONES / song / "fuente").glob("*.psd"))
    if not src:
        sys.exit(f"No hay PSD en canciones/{song}/fuente/")
    cfg = ROOT / "tools" / "separar_psd" / f"{song}.json"
    subprocess.run([sys.executable, "-I", str(ROOT / "tools" / "separar_psd" / "separar.py"),
                    str(src[0]), str(cfg), str(CANCIONES / song)], check=True)


if __name__ == "__main__":
    a = sys.argv[1:]
    if not a:
        print(__doc__); sys.exit()
    c, arg = a[0], (a[1] if len(a) > 1 else None)
    {"lock": lambda: cmd_lock(), "verify": lambda: cmd_verify(arg), "push": lambda: cmd_push(arg),
     "pull": lambda: cmd_pull(arg), "build": lambda: cmd_build(arg)}[c]()
