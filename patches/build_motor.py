#!/usr/bin/env python3
"""
build_motor.py — genera patches/ser_gentil_motor.maxpat (motor de visuales v0.1) con tools/maxpat_builder.py.

  python3 patches/build_motor.py

El patch abre en modo presentación (interfaz del operador). En modo edición (⌘E) todos los
cables están conectados y comentados por bloque. La lógica vive en patches/motor.js.
"""
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / "tools"))
from maxpat_builder import Patch  # noqa: E402

CTX = "ser_gentil"
N_ESC, N_TIN = 8, 5
PADS = ["Negro", "Escena\nsegura", "Flash", "Aislar\nfiguras", "Modo\ntintas", "Mal\nregistro", "Tap\ntempo", "Sig.\npaleta"]
KNOBS = [("K1_Encuadre", "Encuadre", 0.0), ("K2_Deriva", "Deriva", 0.3), ("K3_Figuras", "Figuras", 0.35),
         ("K4_Destellos", "Destellos", 0.3), ("K5_Mecer", "Mecer", 0.3), ("K6_Eco", "Eco dub", 0.0),
         ("K7_Paleta", "Paleta", 0.0), ("K8_Master", "Master", 1.0)]
GREY = [0.72, 0.72, 0.72, 1.0]

p = Patch("Ser Gentil — motor de visuales v0.1", target=8, size=(1080, 720))
p.title_block(pres_xy=(20, 10), subtitle="5 canciones · LPD8 · Max 9 (compatible con Max 8) · lógica en motor.js")

# ------------------------------------------------------------------ paneles de presentación
p.panel((20, 70, 330, 120), x=2000, y=60)
p.panel((360, 70, 330, 120), x=2000, y=200)
p.panel((20, 200, 330, 250), x=2000, y=340)
p.panel((360, 200, 330, 250), x=2000, y=600)
p.panel((700, 70, 360, 380), x=2000, y=860)

# ------------------------------------------------------------------ MOTOR (js)
p.section("CONTROL: motor.js — canciones, LPD8, animación (ver patches/motor.js)", 30, 330, w=520)
js = p.obj("js motor.js", 30, 360, w=520, io=(1, 20))

p.section("INICIO: carga configuración y la primera canción", 30, 60, w=360)
lb = p.obj("loadbang", 30, 90)
dfl = p.obj("deferlow", 30, 120)
m_init = p.msg("init", 30, 150)
p.connect(lb, 0, dfl, 0); p.connect(dfl, 0, m_init, 0); p.connect(m_init, 0, js, 0)
m_on = p.msg("1", 120, 120)
qm = p.obj("qmetro 16", 120, 150)
p.connect(lb, 0, m_on, 0); p.connect(m_on, 0, qm, 0); p.connect(qm, 0, js, 0)
p.comment("qmetro 16 = ~60 cuadros/s de animación", 200, 152, w=260, color=GREY)

# ------------------------------------------------------------------ SALIDA: jit.world
p.section("SALIDA: jit.world → proyector (arrastra la ventana y pantalla completa)", 1000, 60, w=480)
world = p.obj(f"jit.world {CTX} @enable 1 @dim 1920 1080 @fsmenubar 0 @erase_color 0 0 0 1 @output_texture 1",
              1000, 200)
t_render = p.ui("toggle", 1000, 90, 24, 24, pres=(372, 104, 24, 24))
m_render = p.msg("enable $1", 1000, 125)
p.connect(t_render, 0, m_render, 0); p.connect(m_render, 0, world, 0)
m_set1 = p.msg("set 1", 1060, 90)
p.connect(lb, 0, m_set1, 0); p.connect(m_set1, 0, t_render, 0)
p.comment("Render", 1030, 92, w=60, pres=(400, 106, 60, 20))
t_fs = p.ui("toggle", 1120, 90, 24, 24, pres=(470, 104, 24, 24))
m_fs = p.msg("fullscreen $1", 1120, 125)
p.connect(t_fs, 0, m_fs, 0); p.connect(m_fs, 0, world, 0)
p.comment("Pantalla completa", 1150, 92, w=120, pres=(498, 106, 120, 20))
fps = p.ui("jit.fpsgui", 1300, 240, 80, 35, pres=(600, 100, 80, 30))
p.connect(world, 0, fps, 0)
p.connect(js, 17, world, 0)
p.comment("SALIDA (proyector)", 1000, 30, w=200, pres=(370, 76, 300, 20), bold=True)
p.comment("Arrastra la ventana 'ser_gentil' al proyector y activa pantalla completa (Esc la alterna).",
          1000, 160, w=300, pres=(370, 140, 310, 40), size=10.0, color=GREY)

# ------------------------------------------------------------------ CAPAS: escena y tintas
p.section("CAPAS: js → [route m v] → m: jit.matrix (carga PNG) · v: jit.gl.videoplane (transformación y color)",
          30, 420, w=700)
y = 450
for k in range(N_ESC + N_TIN):
    layer = 10 + k if k < N_ESC else 20 + (k - N_ESC)
    r = p.obj("route m v", 30, y)
    mat = p.obj("jit.matrix 4 char 2048 2048", 130, y)
    vp = p.obj(f"jit.gl.videoplane {CTX} @layer {layer} @blend_enable 1 @depth_enable 0 @enable 0 @interp 1", 340, y)
    p.connect(js, k, r, 0)
    p.connect(r, 0, mat, 0)
    p.connect(r, 1, vp, 0)
    p.connect(mat, 0, vp, 0)
    lab = f"escena slot {k}" if k < N_ESC else f"tinta slot {k - N_ESC}"
    p.comment(lab, 900, y, w=140, color=GREY)
    y += 30

p.section("EFECTOS: eco (cuadro anterior encima), marco, flash y negro — en este orden de capas", 30, y + 10, w=640)
y += 40
eco = p.obj(f"jit.gl.videoplane {CTX} @layer 40 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1 @color 1 1 1 0", 340, y)
p.connect(world, 0, eco, 0)
p.connect(js, 13, eco, 0)
p.comment("eco dub: textura de jit.world → plano semitransparente", 900, y, w=320, color=GREY)
y += 30
for o, lab in ((18, "marco izq."), (19, "marco der.")):
    g = p.obj(f"jit.gl.gridshape {CTX} @shape plane @layer 50 @blend_enable 1 @depth_enable 0 @lighting_enable 0 "
              f"@color 0 0 0 1 @scale 2 2 1", 340, y)
    p.connect(js, o, g, 0)
    p.comment(lab + ": barra negra a un lado del arte cuadrado", 900, y, w=320, color=GREY)
    y += 30
for o, (lab, col, layer) in ((14, ("flash", "1 1 1 0", 60)), (15, ("negro / master / cambio de canción", "0 0 0 1", 70))):
    g = p.obj(f"jit.gl.gridshape {CTX} @shape plane @layer {layer} @blend_enable 1 @depth_enable 0 @lighting_enable 0 "
              f"@color {col} @scale 3 3 1", 340, y)
    p.connect(js, o, g, 0)
    p.comment(lab, 900, y, w=320, color=GREY)
    y += 30

# ------------------------------------------------------------------ INTERFAZ
p.section("INTERFAZ: js salida 16 → perillas, estado, menú y luces de pads", 1000, 330, w=480)
r_ui = p.obj("route dial status menu led", 1000, 360)
p.connect(js, 16, r_ui, 0)
r_dial = p.obj("route 0 1 2 3 4 5 6 7", 1000, 400)
r_led = p.obj("route 0 1 2 3 4 5 6 7", 1300, 400)
p.connect(r_ui, 0, r_dial, 0)
p.connect(r_ui, 3, r_led, 0)

# canción
p.comment("CANCIÓN", 1500, 30, w=100, pres=(30, 76, 300, 20), bold=True)
um = p.ui("umenu", 1500, 60, 300, 24, pres=(30, 100, 300, 24))
p.connect(r_ui, 2, um, 0)
pre_c = p.obj("prepend cancion", 1500, 95)
p.connect(um, 0, pre_c, 0); p.connect(pre_c, 0, js, 0)
p.comment("Teclas: 1–5 canción · 0 negro · espacio flash · t tap · f pantalla completa (con esta ventana al frente)",
          1500, 125, w=300, pres=(30, 130, 310, 50), size=10.0, color=GREY)
kobj = p.obj("key", 1820, 60, io=(1, 4))
pre_k = p.obj("prepend key", 1820, 95)
p.connect(kobj, 0, pre_k, 0); p.connect(pre_k, 0, js, 0)

# estado
st = p.msg("", 1000, 300, w=600, pres=(20, 460, 1040, 26))
pre_st = p.obj("prepend set", 1000, 270)
p.connect(r_ui, 1, pre_st, 0); p.connect(pre_st, 0, st, 0)

# pads (como el LPD8: fila de arriba 5–8, fila de abajo 1–4)
p.comment("LPD8 · PADS (clic = golpe)", 1500, 330, w=200, pres=(30, 206, 300, 20), bold=True)
for k in range(8):
    col = k % 4
    row_top = k >= 4
    px, py = 38 + col * 78, (232 if row_top else 338)
    ex, ey = 1500 + col * 80, 360 + (0 if row_top else 110)
    b = p.ui("button", ex, ey, 48, 48, pres=(px, py, 48, 48))
    pre = p.obj(f"prepend uipad {k}", ex, ey + 55, w=78)
    p.connect(b, 0, pre, 0); p.connect(pre, 0, js, 0)
    led = p.ui("toggle", ex + 52, ey, 16, 16, pres=(px + 52, py, 16, 16))
    p.connect(r_led, k, led, 0)
    p.comment(f"{k + 1} · {PADS[k]}", ex, ey + 80, w=76, pres=(px - 4, py + 50, 78, 40), size=10.0)

# perillas (como el LPD8: K1–K4 arriba, K5–K8 abajo)
p.comment("LPD8 · PERILLAS (mouse o LPD8)", 1850, 330, w=220, pres=(370, 206, 300, 20), bold=True)
for k, (longname, label, init) in enumerate(KNOBS):
    col, row = k % 4, k // 4
    px, py = 378 + col * 78, 236 + row * 104
    ex, ey = 1850 + col * 80, 360 + row * 130
    d = p.dial(longname, label, ex, ey, pres=(px, py, 44, 48), lo=0.0, hi=1.0, init=init)
    pre = p.obj(f"prepend dial {k}", ex, ey + 55, w=78)
    p.connect(d, 0, pre, 0); p.connect(pre, 0, js, 0)
    ps = p.obj("prepend set", ex, ey + 80, w=78)
    p.connect(r_dial, k, ps, 0); p.connect(ps, 0, d, 0)
    p.comment(f"K{k + 1}", ex + 46, ey, w=30, pres=(px + 46, py + 2, 30, 18), size=10.0, color=GREY)

# ------------------------------------------------------------------ MIDI
p.section("MIDI: LPD8 → js (note/cc). El mapa vive en patches/lpd8_map.json", 30, 220, w=520)
nin = p.obj("notein", 30, 250)
pk_n = p.obj("pack 0 0 0", 30, 280)
pre_n = p.obj("prepend note", 30, 305)
for i in range(3):
    p.connect(nin, i, pk_n, i)
p.connect(pk_n, 0, pre_n, 0); p.connect(pre_n, 0, js, 0)
cin = p.obj("ctlin", 200, 250)
pk_c = p.obj("pack 0 0 0", 200, 280)
pre_cc = p.obj("prepend cc", 200, 305)
for i in range(3):
    p.connect(cin, i, pk_c, i)
p.connect(pk_c, 0, pre_cc, 0); p.connect(pre_cc, 0, js, 0)
p.comment("MIDI · LPD8", 560, 220, w=200, pres=(710, 76, 340, 20), bold=True)
p.port_menu("Puerto MIDI del LPD8 (vacío = todos)", [nin, cin], 560, 250, pres=(710, 118, 240, 22))
m_apr = p.msg("aprender", 560, 360, pres=(710, 152, 80, 22))
p.connect(m_apr, 0, js, 0)
m_rec = p.msg("init", 660, 360, pres=(800, 152, 120, 22))
p.connect(m_rec, 0, js, 0)
p.comment("'aprender': toca pads 1–8 y gira perillas 1–8 en orden. 'init': recarga canciones, paletas y mapa.",
          560, 390, w=360, pres=(710, 180, 340, 40), size=10.0, color=GREY)
p.midi_monitor(x=560, y=470, pres=(710, 240))
p.comment("Si un control no responde, compara lo que muestra el monitor con patches/lpd8_map.json o usa 'aprender'.",
          560, 540, w=360, pres=(710, 290, 340, 40), size=10.0, color=GREY)

# ------------------------------------------------------------------ CÓMO USAR
p.usage_notes([
    "1. Antes de abrir: en la raíz del repo corre  python3 tools/assets.py pull  (baja las capas del bucket).",
    "2. Al abrir, carga la canción 1 y se ve en la ventana 'ser_gentil'. Arrástrala al proyector → 'Pantalla completa'.",
    "3. Conecta el LPD8 por USB (Programa 1). Las perillas se 'toman' al pasar por su valor actual (ver la línea de estado).",
    "4. PADS: 1 negro · 2 escena segura · 3 flash (fuerza del golpe) · 4 aislar figuras (mantener) · 5 tintas/escena · "
    "6 mal registro · 7 tap tempo · 8 siguiente paleta (mezcla con K7).",
    "5. PERILLAS: K1 encuadre · K2 deriva · K3 figuras · K4 destellos · K5 mecer · K6 eco dub · K7 paleta · K8 master.",
    "6. Plan B: todo se opera con el mouse en esta ventana; tecla 0 = negro.  Más detalle: docs/operacion.md",
], pres=(20, 495, 1040, 200), x=1500, y=700)

warnings = p.validate()
for w in warnings:
    print(w)
out = HERE / "ser_gentil_motor.maxpat"
p.save(out)
p.save_wiring_md(HERE / "ser_gentil_motor_cables.md")
print("ok:", out.name, "·", len(p.boxes), "objetos ·", len(p.lines), "cables")
