# Compone un cuadro 1920x1080 con las capas transformadas como lo haría jit.world (cámara 45°, z=2)
import json, sys, math
import numpy as np
from PIL import Image
est = json.loads(sys.stdin.read()); out = sys.argv[1]
W, H, HALF = 1920, 1080, 0.8284
canvas = np.zeros((H, W, 3), np.float32)
def comp(o):
    e = est.get(str(o)) or {}
    if not e.get('archivo') or e.get('enable', [0])[0] != 1: return
    cx, cy, _ = e['position']; sx, sy, _ = e['scale']; th = math.radians(e['rotatexyz'][2]); r, g, b, a = e['color']
    img = Image.open(e['archivo']).convert('RGBA')
    S = img.size[0]
    # píxel de salida (px,py) → mundo → arte (u,v) → píxel del arte (X,Y): afín inversa
    k = H / 2 / HALF                       # px por unidad de mundo
    # mundo = c + R·diag(sx,sy)·q ; q = (X/(S/2)-1, -(Y/(S/2)-1)); px = W/2 + k·wx ; py = H/2 − k·wy
    c, s_ = math.cos(th), math.sin(th)
    A = np.array([[k*sx*c/(S/2), k*sy*s_/(S/2)], [-k*sx*s_/(S/2), k*sy*c/(S/2)]])  # d(px,py)/d(X,Y)
    t0 = np.array([W/2 + k*(cx - sx*c - sy*s_), H/2 - k*(cy - sx*s_ + sy*c)])     # (X,Y)=(0,0)
    Ai = np.linalg.inv(A); ti = -Ai @ t0
    lay = img.transform((W, H), Image.AFFINE, (Ai[0,0], Ai[0,1], ti[0], Ai[1,0], Ai[1,1], ti[1]), Image.BILINEAR)
    L = np.asarray(lay).astype(np.float32) / 255
    al = L[..., 3:4] * a
    rgb = L[..., :3] * np.array([r, g, b])
    canvas[:] = canvas * (1 - al) + rgb * 255 * al
for o in range(13): comp(o)
for o in (18, 19):
    e = est.get(str(o), {}).get("position")
    if e:
        k = H / 2 / HALF; x0 = W/2 + k*(e[0]-2); x1 = W/2 + k*(e[0]+2)
        canvas[:, max(0,int(x0)):max(0,min(W,int(x1)))] = 0
for o, col in ((14, (255, 255, 255)), (15, (0, 0, 0))):
    e = est.get(str(o), {}).get('color')
    if e: canvas[:] = canvas * (1 - e[3]) + np.array(col) * e[3]
Image.fromarray(np.clip(canvas, 0, 255).astype(np.uint8)).save(out, quality=85)
