{
 "patcher": {
  "fileversion": 1,
  "appversion": {
   "major": 8,
   "minor": 5,
   "revision": 0,
   "architecture": "x64",
   "modernui": 1
  },
  "classnamespace": "box",
  "rect": [
   80.0,
   80.0,
   1080.0,
   720.0
  ],
  "openinpresentation": 1,
  "default_fontsize": 12.0,
  "default_fontface": 0,
  "default_fontname": "Arial",
  "gridonopen": 1,
  "gridsize": [
   15.0,
   15.0
  ],
  "gridsnaponopen": 1,
  "toolbarvisible": 1,
  "boxanimatetime": 200,
  "description": "Ser Gentil — motor de visuales v0.1",
  "digest": "",
  "tags": "",
  "style": "",
  "boxes": [
   {
    "box": {
     "maxclass": "panel",
     "patching_rect": [
      2000,
      60,
      330,
      120
     ],
     "bgcolor": [
      0.13,
      0.13,
      0.15,
      1.0
     ],
     "rounded": 8,
     "mode": 0,
     "id": "obj-3",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      20.0,
      70.0,
      330.0,
      120.0
     ],
     "background": 1
    }
   },
   {
    "box": {
     "maxclass": "panel",
     "patching_rect": [
      2000,
      200,
      330,
      120
     ],
     "bgcolor": [
      0.13,
      0.13,
      0.15,
      1.0
     ],
     "rounded": 8,
     "mode": 0,
     "id": "obj-4",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      360.0,
      70.0,
      330.0,
      120.0
     ],
     "background": 1
    }
   },
   {
    "box": {
     "maxclass": "panel",
     "patching_rect": [
      2000,
      340,
      330,
      250
     ],
     "bgcolor": [
      0.13,
      0.13,
      0.15,
      1.0
     ],
     "rounded": 8,
     "mode": 0,
     "id": "obj-5",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      20.0,
      200.0,
      330.0,
      250.0
     ],
     "background": 1
    }
   },
   {
    "box": {
     "maxclass": "panel",
     "patching_rect": [
      2000,
      600,
      330,
      250
     ],
     "bgcolor": [
      0.13,
      0.13,
      0.15,
      1.0
     ],
     "rounded": 8,
     "mode": 0,
     "id": "obj-6",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      360.0,
      200.0,
      330.0,
      250.0
     ],
     "background": 1
    }
   },
   {
    "box": {
     "maxclass": "panel",
     "patching_rect": [
      2000,
      860,
      360,
      380
     ],
     "bgcolor": [
      0.13,
      0.13,
      0.15,
      1.0
     ],
     "rounded": 8,
     "mode": 0,
     "id": "obj-7",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      700.0,
      70.0,
      360.0,
      380.0
     ],
     "background": 1
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "Ser Gentil — motor de visuales v0.1",
     "patching_rect": [
      30,
      4,
      500,
      20
     ],
     "fontsize": 20.0,
     "linecount": 1,
     "fontface": 1,
     "id": "obj-1",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      20.0,
      10.0,
      600.0,
      30.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "5 canciones · LPD8 · Max 9 (compatible con Max 8) · lógica en motor.js",
     "patching_rect": [
      30,
      28,
      500,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "textcolor": [
      0.7,
      0.7,
      0.7,
      1.0
     ],
     "id": "obj-2",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      20.0,
      40.0,
      600.0,
      20.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "▼ CONTROL: motor.js — canciones, LPD8, animación (ver patches/motor.js)",
     "patching_rect": [
      30,
      330,
      520,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "fontface": 1,
     "textcolor": [
      0.9,
      0.55,
      0.1,
      1.0
     ],
     "id": "obj-8",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "js motor.js",
     "patching_rect": [
      30,
      360,
      520,
      22
     ],
     "id": "obj-9",
     "numinlets": 1,
     "numoutlets": 20,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "▼ INICIO: carga configuración y la primera canción",
     "patching_rect": [
      30,
      60,
      360,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "fontface": 1,
     "textcolor": [
      0.9,
      0.55,
      0.1,
      1.0
     ],
     "id": "obj-10",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "loadbang",
     "patching_rect": [
      30,
      90,
      72,
      22
     ],
     "id": "obj-11",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "deferlow",
     "patching_rect": [
      30,
      120,
      72,
      22
     ],
     "id": "obj-12",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "init",
     "patching_rect": [
      30,
      150,
      42,
      22
     ],
     "id": "obj-13",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "1",
     "patching_rect": [
      120,
      120,
      40,
      22
     ],
     "id": "obj-14",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "qmetro 16",
     "patching_rect": [
      120,
      150,
      79,
      22
     ],
     "id": "obj-15",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "qmetro 16 = ~60 cuadros/s de animación",
     "patching_rect": [
      200,
      152,
      260,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-16",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "▼ SALIDA: jit.world → proyector (arrastra la ventana y pantalla completa)",
     "patching_rect": [
      1000,
      60,
      480,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "fontface": 1,
     "textcolor": [
      0.9,
      0.55,
      0.1,
      1.0
     ],
     "id": "obj-17",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.world ser_gentil @enable 1 @dim 1920 1080 @fsmenubar 0 @erase_color 0 0 0 1 @output_texture 1",
     "patching_rect": [
      1000,
      200,
      695,
      22
     ],
     "id": "obj-18",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "toggle",
     "patching_rect": [
      1000,
      90,
      24,
      24
     ],
     "id": "obj-19",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      372.0,
      104.0,
      24.0,
      24.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "enable $1",
     "patching_rect": [
      1000,
      125,
      77,
      22
     ],
     "id": "obj-20",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "set 1",
     "patching_rect": [
      1060,
      90,
      49,
      22
     ],
     "id": "obj-21",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "Render",
     "patching_rect": [
      1030,
      92,
      60,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "id": "obj-22",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      400.0,
      106.0,
      60.0,
      20.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "toggle",
     "patching_rect": [
      1120,
      90,
      24,
      24
     ],
     "id": "obj-23",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      470.0,
      104.0,
      24.0,
      24.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "fullscreen $1",
     "patching_rect": [
      1120,
      125,
      105,
      22
     ],
     "id": "obj-24",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "Pantalla completa",
     "patching_rect": [
      1150,
      92,
      120,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "id": "obj-25",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      498.0,
      106.0,
      120.0,
      20.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "jit.fpsgui",
     "patching_rect": [
      1300,
      240,
      80,
      35
     ],
     "id": "obj-26",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      600.0,
      100.0,
      80.0,
      30.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "SALIDA (proyector)",
     "patching_rect": [
      1000,
      30,
      200,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "fontface": 1,
     "id": "obj-27",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      370.0,
      76.0,
      300.0,
      20.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "Arrastra la ventana 'ser_gentil' al proyector y activa pantalla completa (Esc la alterna).",
     "patching_rect": [
      1000,
      160,
      300,
      20
     ],
     "fontsize": 10.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-28",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      370.0,
      140.0,
      310.0,
      40.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "▼ CAPAS: js → [route m v] → m: jit.matrix (carga PNG) · v: jit.gl.videoplane (transformación y color)",
     "patching_rect": [
      30,
      420,
      700,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "fontface": 1,
     "textcolor": [
      0.9,
      0.55,
      0.1,
      1.0
     ],
     "id": "obj-29",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route m v",
     "patching_rect": [
      30,
      450,
      79,
      22
     ],
     "id": "obj-30",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.matrix 4 char 2048 2048",
     "patching_rect": [
      130,
      450,
      205,
      22
     ],
     "id": "obj-31",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.gl.videoplane ser_gentil @layer 10 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1",
     "patching_rect": [
      340,
      450,
      646,
      22
     ],
     "id": "obj-32",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "escena slot 0",
     "patching_rect": [
      900,
      450,
      140,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-33",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route m v",
     "patching_rect": [
      30,
      480,
      79,
      22
     ],
     "id": "obj-34",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.matrix 4 char 2048 2048",
     "patching_rect": [
      130,
      480,
      205,
      22
     ],
     "id": "obj-35",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.gl.videoplane ser_gentil @layer 11 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1",
     "patching_rect": [
      340,
      480,
      646,
      22
     ],
     "id": "obj-36",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "escena slot 1",
     "patching_rect": [
      900,
      480,
      140,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-37",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route m v",
     "patching_rect": [
      30,
      510,
      79,
      22
     ],
     "id": "obj-38",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.matrix 4 char 2048 2048",
     "patching_rect": [
      130,
      510,
      205,
      22
     ],
     "id": "obj-39",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.gl.videoplane ser_gentil @layer 12 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1",
     "patching_rect": [
      340,
      510,
      646,
      22
     ],
     "id": "obj-40",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "escena slot 2",
     "patching_rect": [
      900,
      510,
      140,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-41",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route m v",
     "patching_rect": [
      30,
      540,
      79,
      22
     ],
     "id": "obj-42",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.matrix 4 char 2048 2048",
     "patching_rect": [
      130,
      540,
      205,
      22
     ],
     "id": "obj-43",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.gl.videoplane ser_gentil @layer 13 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1",
     "patching_rect": [
      340,
      540,
      646,
      22
     ],
     "id": "obj-44",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "escena slot 3",
     "patching_rect": [
      900,
      540,
      140,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-45",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route m v",
     "patching_rect": [
      30,
      570,
      79,
      22
     ],
     "id": "obj-46",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.matrix 4 char 2048 2048",
     "patching_rect": [
      130,
      570,
      205,
      22
     ],
     "id": "obj-47",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.gl.videoplane ser_gentil @layer 14 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1",
     "patching_rect": [
      340,
      570,
      646,
      22
     ],
     "id": "obj-48",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "escena slot 4",
     "patching_rect": [
      900,
      570,
      140,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-49",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route m v",
     "patching_rect": [
      30,
      600,
      79,
      22
     ],
     "id": "obj-50",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.matrix 4 char 2048 2048",
     "patching_rect": [
      130,
      600,
      205,
      22
     ],
     "id": "obj-51",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.gl.videoplane ser_gentil @layer 15 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1",
     "patching_rect": [
      340,
      600,
      646,
      22
     ],
     "id": "obj-52",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "escena slot 5",
     "patching_rect": [
      900,
      600,
      140,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-53",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route m v",
     "patching_rect": [
      30,
      630,
      79,
      22
     ],
     "id": "obj-54",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.matrix 4 char 2048 2048",
     "patching_rect": [
      130,
      630,
      205,
      22
     ],
     "id": "obj-55",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.gl.videoplane ser_gentil @layer 16 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1",
     "patching_rect": [
      340,
      630,
      646,
      22
     ],
     "id": "obj-56",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "escena slot 6",
     "patching_rect": [
      900,
      630,
      140,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-57",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route m v",
     "patching_rect": [
      30,
      660,
      79,
      22
     ],
     "id": "obj-58",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.matrix 4 char 2048 2048",
     "patching_rect": [
      130,
      660,
      205,
      22
     ],
     "id": "obj-59",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.gl.videoplane ser_gentil @layer 17 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1",
     "patching_rect": [
      340,
      660,
      646,
      22
     ],
     "id": "obj-60",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "escena slot 7",
     "patching_rect": [
      900,
      660,
      140,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-61",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route m v",
     "patching_rect": [
      30,
      690,
      79,
      22
     ],
     "id": "obj-62",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.matrix 4 char 2048 2048",
     "patching_rect": [
      130,
      690,
      205,
      22
     ],
     "id": "obj-63",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.gl.videoplane ser_gentil @layer 20 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1",
     "patching_rect": [
      340,
      690,
      646,
      22
     ],
     "id": "obj-64",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "tinta slot 0",
     "patching_rect": [
      900,
      690,
      140,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-65",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route m v",
     "patching_rect": [
      30,
      720,
      79,
      22
     ],
     "id": "obj-66",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.matrix 4 char 2048 2048",
     "patching_rect": [
      130,
      720,
      205,
      22
     ],
     "id": "obj-67",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.gl.videoplane ser_gentil @layer 21 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1",
     "patching_rect": [
      340,
      720,
      646,
      22
     ],
     "id": "obj-68",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "tinta slot 1",
     "patching_rect": [
      900,
      720,
      140,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-69",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route m v",
     "patching_rect": [
      30,
      750,
      79,
      22
     ],
     "id": "obj-70",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.matrix 4 char 2048 2048",
     "patching_rect": [
      130,
      750,
      205,
      22
     ],
     "id": "obj-71",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.gl.videoplane ser_gentil @layer 22 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1",
     "patching_rect": [
      340,
      750,
      646,
      22
     ],
     "id": "obj-72",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "tinta slot 2",
     "patching_rect": [
      900,
      750,
      140,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-73",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route m v",
     "patching_rect": [
      30,
      780,
      79,
      22
     ],
     "id": "obj-74",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.matrix 4 char 2048 2048",
     "patching_rect": [
      130,
      780,
      205,
      22
     ],
     "id": "obj-75",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.gl.videoplane ser_gentil @layer 23 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1",
     "patching_rect": [
      340,
      780,
      646,
      22
     ],
     "id": "obj-76",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "tinta slot 3",
     "patching_rect": [
      900,
      780,
      140,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-77",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route m v",
     "patching_rect": [
      30,
      810,
      79,
      22
     ],
     "id": "obj-78",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.matrix 4 char 2048 2048",
     "patching_rect": [
      130,
      810,
      205,
      22
     ],
     "id": "obj-79",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.gl.videoplane ser_gentil @layer 24 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1",
     "patching_rect": [
      340,
      810,
      646,
      22
     ],
     "id": "obj-80",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "tinta slot 4",
     "patching_rect": [
      900,
      810,
      140,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-81",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "▼ EFECTOS: eco (cuadro anterior encima), marco, flash y negro — en este orden de capas",
     "patching_rect": [
      30,
      850,
      640,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "fontface": 1,
     "textcolor": [
      0.9,
      0.55,
      0.1,
      1.0
     ],
     "id": "obj-82",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.gl.videoplane ser_gentil @layer 40 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1 @color 1 1 1 0",
     "patching_rect": [
      340,
      880,
      751,
      22
     ],
     "id": "obj-83",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "eco dub: textura de jit.world → plano semitransparente",
     "patching_rect": [
      900,
      880,
      320,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-84",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.gl.gridshape ser_gentil @shape plane @layer 50 @blend_enable 1 @depth_enable 0 @lighting_enable 0 @color 0 0 0 1 @scale 2 2 1",
     "patching_rect": [
      340,
      910,
      919,
      22
     ],
     "id": "obj-85",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "marco izq.: barra negra a un lado del arte cuadrado",
     "patching_rect": [
      900,
      910,
      320,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-86",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.gl.gridshape ser_gentil @shape plane @layer 50 @blend_enable 1 @depth_enable 0 @lighting_enable 0 @color 0 0 0 1 @scale 2 2 1",
     "patching_rect": [
      340,
      940,
      919,
      22
     ],
     "id": "obj-87",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "marco der.: barra negra a un lado del arte cuadrado",
     "patching_rect": [
      900,
      940,
      320,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-88",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.gl.gridshape ser_gentil @shape plane @layer 60 @blend_enable 1 @depth_enable 0 @lighting_enable 0 @color 1 1 1 0 @scale 3 3 1",
     "patching_rect": [
      340,
      970,
      919,
      22
     ],
     "id": "obj-89",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "flash",
     "patching_rect": [
      900,
      970,
      320,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-90",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "jit.gl.gridshape ser_gentil @shape plane @layer 70 @blend_enable 1 @depth_enable 0 @lighting_enable 0 @color 0 0 0 1 @scale 3 3 1",
     "patching_rect": [
      340,
      1000,
      919,
      22
     ],
     "id": "obj-91",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "negro / master / cambio de canción",
     "patching_rect": [
      900,
      1000,
      320,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-92",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "▼ INTERFAZ: js salida 16 → perillas, estado, menú y luces de pads",
     "patching_rect": [
      1000,
      330,
      480,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "fontface": 1,
     "textcolor": [
      0.9,
      0.55,
      0.1,
      1.0
     ],
     "id": "obj-93",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route dial status menu led",
     "patching_rect": [
      1000,
      360,
      198,
      22
     ],
     "id": "obj-94",
     "numinlets": 1,
     "numoutlets": 5,
     "outlettype": [
      "",
      "",
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route 0 1 2 3 4 5 6 7",
     "patching_rect": [
      1000,
      400,
      163,
      22
     ],
     "id": "obj-95",
     "numinlets": 1,
     "numoutlets": 9,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route 0 1 2 3 4 5 6 7",
     "patching_rect": [
      1300,
      400,
      163,
      22
     ],
     "id": "obj-96",
     "numinlets": 1,
     "numoutlets": 9,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "CANCIÓN",
     "patching_rect": [
      1500,
      30,
      100,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "fontface": 1,
     "id": "obj-97",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      30.0,
      76.0,
      300.0,
      20.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "umenu",
     "patching_rect": [
      1500,
      60,
      300,
      24
     ],
     "id": "obj-98",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      30.0,
      100.0,
      300.0,
      24.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend cancion",
     "patching_rect": [
      1500,
      95,
      121,
      22
     ],
     "id": "obj-99",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "Teclas: 1–5 canción · 0 negro · espacio flash · t tap · f pantalla completa (con esta ventana al frente)",
     "patching_rect": [
      1500,
      125,
      300,
      20
     ],
     "fontsize": 10.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-100",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      30.0,
      130.0,
      310.0,
      50.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "key",
     "patching_rect": [
      1820,
      60,
      60,
      22
     ],
     "id": "obj-101",
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "",
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend key",
     "patching_rect": [
      1820,
      95,
      93,
      22
     ],
     "id": "obj-102",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "",
     "patching_rect": [
      1000,
      300,
      600,
      22
     ],
     "id": "obj-103",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      20.0,
      460.0,
      1040.0,
      26.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend set",
     "patching_rect": [
      1000,
      270,
      93,
      22
     ],
     "id": "obj-104",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "LPD8 · PADS (clic = golpe)",
     "patching_rect": [
      1500,
      330,
      200,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "fontface": 1,
     "id": "obj-105",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      30.0,
      206.0,
      300.0,
      20.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "button",
     "patching_rect": [
      1500,
      470,
      48,
      48
     ],
     "id": "obj-106",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      38.0,
      338.0,
      48.0,
      48.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend uipad 0",
     "patching_rect": [
      1500,
      525,
      78,
      22
     ],
     "id": "obj-107",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "toggle",
     "patching_rect": [
      1552,
      470,
      16,
      16
     ],
     "id": "obj-108",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      90.0,
      338.0,
      16.0,
      16.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "1 · Negro",
     "patching_rect": [
      1500,
      550,
      76,
      20
     ],
     "fontsize": 10.0,
     "linecount": 1,
     "id": "obj-109",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      34.0,
      388.0,
      78.0,
      40.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "button",
     "patching_rect": [
      1580,
      470,
      48,
      48
     ],
     "id": "obj-110",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      116.0,
      338.0,
      48.0,
      48.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend uipad 1",
     "patching_rect": [
      1580,
      525,
      78,
      22
     ],
     "id": "obj-111",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "toggle",
     "patching_rect": [
      1632,
      470,
      16,
      16
     ],
     "id": "obj-112",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      168.0,
      338.0,
      16.0,
      16.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "2 · Escena\nsegura",
     "patching_rect": [
      1580,
      550,
      76,
      40
     ],
     "fontsize": 10.0,
     "linecount": 2,
     "id": "obj-113",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      112.0,
      388.0,
      78.0,
      40.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "button",
     "patching_rect": [
      1660,
      470,
      48,
      48
     ],
     "id": "obj-114",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      194.0,
      338.0,
      48.0,
      48.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend uipad 2",
     "patching_rect": [
      1660,
      525,
      78,
      22
     ],
     "id": "obj-115",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "toggle",
     "patching_rect": [
      1712,
      470,
      16,
      16
     ],
     "id": "obj-116",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      246.0,
      338.0,
      16.0,
      16.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "3 · Flash",
     "patching_rect": [
      1660,
      550,
      76,
      20
     ],
     "fontsize": 10.0,
     "linecount": 1,
     "id": "obj-117",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      190.0,
      388.0,
      78.0,
      40.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "button",
     "patching_rect": [
      1740,
      470,
      48,
      48
     ],
     "id": "obj-118",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      272.0,
      338.0,
      48.0,
      48.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend uipad 3",
     "patching_rect": [
      1740,
      525,
      78,
      22
     ],
     "id": "obj-119",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "toggle",
     "patching_rect": [
      1792,
      470,
      16,
      16
     ],
     "id": "obj-120",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      324.0,
      338.0,
      16.0,
      16.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "4 · Aislar\nfiguras",
     "patching_rect": [
      1740,
      550,
      76,
      40
     ],
     "fontsize": 10.0,
     "linecount": 2,
     "id": "obj-121",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      268.0,
      388.0,
      78.0,
      40.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "button",
     "patching_rect": [
      1500,
      360,
      48,
      48
     ],
     "id": "obj-122",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      38.0,
      232.0,
      48.0,
      48.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend uipad 4",
     "patching_rect": [
      1500,
      415,
      78,
      22
     ],
     "id": "obj-123",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "toggle",
     "patching_rect": [
      1552,
      360,
      16,
      16
     ],
     "id": "obj-124",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      90.0,
      232.0,
      16.0,
      16.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "5 · Modo\ntintas",
     "patching_rect": [
      1500,
      440,
      76,
      40
     ],
     "fontsize": 10.0,
     "linecount": 2,
     "id": "obj-125",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      34.0,
      282.0,
      78.0,
      40.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "button",
     "patching_rect": [
      1580,
      360,
      48,
      48
     ],
     "id": "obj-126",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      116.0,
      232.0,
      48.0,
      48.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend uipad 5",
     "patching_rect": [
      1580,
      415,
      78,
      22
     ],
     "id": "obj-127",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "toggle",
     "patching_rect": [
      1632,
      360,
      16,
      16
     ],
     "id": "obj-128",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      168.0,
      232.0,
      16.0,
      16.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "6 · Mal\nregistro",
     "patching_rect": [
      1580,
      440,
      76,
      40
     ],
     "fontsize": 10.0,
     "linecount": 2,
     "id": "obj-129",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      112.0,
      282.0,
      78.0,
      40.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "button",
     "patching_rect": [
      1660,
      360,
      48,
      48
     ],
     "id": "obj-130",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      194.0,
      232.0,
      48.0,
      48.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend uipad 6",
     "patching_rect": [
      1660,
      415,
      78,
      22
     ],
     "id": "obj-131",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "toggle",
     "patching_rect": [
      1712,
      360,
      16,
      16
     ],
     "id": "obj-132",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      246.0,
      232.0,
      16.0,
      16.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "7 · Tap\ntempo",
     "patching_rect": [
      1660,
      440,
      76,
      40
     ],
     "fontsize": 10.0,
     "linecount": 2,
     "id": "obj-133",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      190.0,
      282.0,
      78.0,
      40.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "button",
     "patching_rect": [
      1740,
      360,
      48,
      48
     ],
     "id": "obj-134",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      272.0,
      232.0,
      48.0,
      48.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend uipad 7",
     "patching_rect": [
      1740,
      415,
      78,
      22
     ],
     "id": "obj-135",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "toggle",
     "patching_rect": [
      1792,
      360,
      16,
      16
     ],
     "id": "obj-136",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      324.0,
      232.0,
      16.0,
      16.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "8 · Sig.\npaleta",
     "patching_rect": [
      1740,
      440,
      76,
      40
     ],
     "fontsize": 10.0,
     "linecount": 2,
     "id": "obj-137",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      268.0,
      282.0,
      78.0,
      40.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "LPD8 · PERILLAS (mouse o LPD8)",
     "patching_rect": [
      1850,
      330,
      220,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "fontface": 1,
     "id": "obj-138",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      370.0,
      206.0,
      300.0,
      20.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "parameter_enable": 1,
     "varname": "K1_Encuadre",
     "patching_rect": [
      1850,
      360,
      44,
      48
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "K1_Encuadre",
       "parameter_shortname": "Encuadre",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.0
       ],
       "parameter_unitstyle": 1
      }
     },
     "id": "obj-139",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      378.0,
      236.0,
      44.0,
      48.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend dial 0",
     "patching_rect": [
      1850,
      415,
      78,
      22
     ],
     "id": "obj-140",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend set",
     "patching_rect": [
      1850,
      440,
      78,
      22
     ],
     "id": "obj-141",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "K1",
     "patching_rect": [
      1896,
      360,
      30,
      20
     ],
     "fontsize": 10.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-142",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      424.0,
      238.0,
      30.0,
      18.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "parameter_enable": 1,
     "varname": "K2_Deriva",
     "patching_rect": [
      1930,
      360,
      44,
      48
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "K2_Deriva",
       "parameter_shortname": "Deriva",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.3
       ],
       "parameter_unitstyle": 1
      }
     },
     "id": "obj-143",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      456.0,
      236.0,
      44.0,
      48.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend dial 1",
     "patching_rect": [
      1930,
      415,
      78,
      22
     ],
     "id": "obj-144",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend set",
     "patching_rect": [
      1930,
      440,
      78,
      22
     ],
     "id": "obj-145",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "K2",
     "patching_rect": [
      1976,
      360,
      30,
      20
     ],
     "fontsize": 10.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-146",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      502.0,
      238.0,
      30.0,
      18.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "parameter_enable": 1,
     "varname": "K3_Figuras",
     "patching_rect": [
      2010,
      360,
      44,
      48
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "K3_Figuras",
       "parameter_shortname": "Figuras",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.35
       ],
       "parameter_unitstyle": 1
      }
     },
     "id": "obj-147",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      534.0,
      236.0,
      44.0,
      48.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend dial 2",
     "patching_rect": [
      2010,
      415,
      78,
      22
     ],
     "id": "obj-148",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend set",
     "patching_rect": [
      2010,
      440,
      78,
      22
     ],
     "id": "obj-149",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "K3",
     "patching_rect": [
      2056,
      360,
      30,
      20
     ],
     "fontsize": 10.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-150",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      580.0,
      238.0,
      30.0,
      18.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "parameter_enable": 1,
     "varname": "K4_Destellos",
     "patching_rect": [
      2090,
      360,
      44,
      48
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "K4_Destellos",
       "parameter_shortname": "Destellos",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.3
       ],
       "parameter_unitstyle": 1
      }
     },
     "id": "obj-151",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      612.0,
      236.0,
      44.0,
      48.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend dial 3",
     "patching_rect": [
      2090,
      415,
      78,
      22
     ],
     "id": "obj-152",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend set",
     "patching_rect": [
      2090,
      440,
      78,
      22
     ],
     "id": "obj-153",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "K4",
     "patching_rect": [
      2136,
      360,
      30,
      20
     ],
     "fontsize": 10.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-154",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      658.0,
      238.0,
      30.0,
      18.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "parameter_enable": 1,
     "varname": "K5_Mecer",
     "patching_rect": [
      1850,
      490,
      44,
      48
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "K5_Mecer",
       "parameter_shortname": "Mecer",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.3
       ],
       "parameter_unitstyle": 1
      }
     },
     "id": "obj-155",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      378.0,
      340.0,
      44.0,
      48.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend dial 4",
     "patching_rect": [
      1850,
      545,
      78,
      22
     ],
     "id": "obj-156",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend set",
     "patching_rect": [
      1850,
      570,
      78,
      22
     ],
     "id": "obj-157",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "K5",
     "patching_rect": [
      1896,
      490,
      30,
      20
     ],
     "fontsize": 10.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-158",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      424.0,
      342.0,
      30.0,
      18.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "parameter_enable": 1,
     "varname": "K6_Eco",
     "patching_rect": [
      1930,
      490,
      44,
      48
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "K6_Eco",
       "parameter_shortname": "Eco dub",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.0
       ],
       "parameter_unitstyle": 1
      }
     },
     "id": "obj-159",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      456.0,
      340.0,
      44.0,
      48.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend dial 5",
     "patching_rect": [
      1930,
      545,
      78,
      22
     ],
     "id": "obj-160",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend set",
     "patching_rect": [
      1930,
      570,
      78,
      22
     ],
     "id": "obj-161",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "K6",
     "patching_rect": [
      1976,
      490,
      30,
      20
     ],
     "fontsize": 10.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-162",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      502.0,
      342.0,
      30.0,
      18.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "parameter_enable": 1,
     "varname": "K7_Paleta",
     "patching_rect": [
      2010,
      490,
      44,
      48
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "K7_Paleta",
       "parameter_shortname": "Paleta",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.0
       ],
       "parameter_unitstyle": 1
      }
     },
     "id": "obj-163",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      534.0,
      340.0,
      44.0,
      48.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend dial 6",
     "patching_rect": [
      2010,
      545,
      78,
      22
     ],
     "id": "obj-164",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend set",
     "patching_rect": [
      2010,
      570,
      78,
      22
     ],
     "id": "obj-165",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "K7",
     "patching_rect": [
      2056,
      490,
      30,
      20
     ],
     "fontsize": 10.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-166",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      580.0,
      342.0,
      30.0,
      18.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "parameter_enable": 1,
     "varname": "K8_Master",
     "patching_rect": [
      2090,
      490,
      44,
      48
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "K8_Master",
       "parameter_shortname": "Master",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        1.0
       ],
       "parameter_unitstyle": 1
      }
     },
     "id": "obj-167",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      612.0,
      340.0,
      44.0,
      48.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend dial 7",
     "patching_rect": [
      2090,
      545,
      78,
      22
     ],
     "id": "obj-168",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend set",
     "patching_rect": [
      2090,
      570,
      78,
      22
     ],
     "id": "obj-169",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "K8",
     "patching_rect": [
      2136,
      490,
      30,
      20
     ],
     "fontsize": 10.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-170",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      658.0,
      342.0,
      30.0,
      18.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "▼ MIDI: LPD8 → js (note/cc). El mapa vive en patches/lpd8_map.json",
     "patching_rect": [
      30,
      220,
      520,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "fontface": 1,
     "textcolor": [
      0.9,
      0.55,
      0.1,
      1.0
     ],
     "id": "obj-171",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "notein",
     "patching_rect": [
      30,
      250,
      60,
      22
     ],
     "id": "obj-172",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "pack 0 0 0",
     "patching_rect": [
      30,
      280,
      86,
      22
     ],
     "id": "obj-173",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend note",
     "patching_rect": [
      30,
      305,
      100,
      22
     ],
     "id": "obj-174",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "ctlin",
     "patching_rect": [
      200,
      250,
      60,
      22
     ],
     "id": "obj-175",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "pack 0 0 0",
     "patching_rect": [
      200,
      280,
      86,
      22
     ],
     "id": "obj-176",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend cc",
     "patching_rect": [
      200,
      305,
      86,
      22
     ],
     "id": "obj-177",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "MIDI · LPD8",
     "patching_rect": [
      560,
      220,
      200,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "fontface": 1,
     "id": "obj-178",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      710.0,
      76.0,
      340.0,
      20.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "loadbang",
     "patching_rect": [
      560,
      250,
      72,
      22
     ],
     "id": "obj-179",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "midiinfo",
     "patching_rect": [
      560,
      280,
      72,
      22
     ],
     "id": "obj-180",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "-1",
     "patching_rect": [
      630,
      250,
      40,
      22
     ],
     "id": "obj-181",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "umenu",
     "patching_rect": [
      560,
      310,
      180,
      22
     ],
     "id": "obj-182",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      710.0,
      118.0,
      240.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "Puerto MIDI del LPD8 (vacío = todos)",
     "patching_rect": [
      750,
      310,
      200,
      20
     ],
     "fontsize": 10.0,
     "linecount": 1,
     "textcolor": [
      0.7,
      0.7,
      0.7,
      1.0
     ],
     "id": "obj-183",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      710.0,
      100.0,
      200.0,
      18.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "aprender",
     "patching_rect": [
      560,
      360,
      70,
      22
     ],
     "id": "obj-184",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      710.0,
      152.0,
      80.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "init",
     "patching_rect": [
      660,
      360,
      42,
      22
     ],
     "id": "obj-185",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      800.0,
      152.0,
      120.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "'aprender': toca pads 1–8 y gira perillas 1–8 en orden. 'init': recarga canciones, paletas y mapa.",
     "patching_rect": [
      560,
      390,
      360,
      20
     ],
     "fontsize": 10.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-186",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      710.0,
      180.0,
      340.0,
      40.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "▼ MONITOR MIDI: verifica qué manda cada control",
     "patching_rect": [
      560,
      446,
      340,
      20
     ],
     "fontsize": 12.0,
     "linecount": 1,
     "fontface": 1,
     "textcolor": [
      0.9,
      0.55,
      0.1,
      1.0
     ],
     "id": "obj-187",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "ctlin",
     "patching_rect": [
      560,
      470,
      60,
      22
     ],
     "id": "obj-188",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "notein",
     "patching_rect": [
      730,
      470,
      60,
      22
     ],
     "id": "obj-189",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "maxclass": "number",
     "patching_rect": [
      560,
      510,
      46,
      22
     ],
     "id": "obj-190",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      710.0,
      260.0,
      48.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "number",
     "patching_rect": [
      610,
      510,
      46,
      22
     ],
     "id": "obj-191",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      762.0,
      260.0,
      48.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "number",
     "patching_rect": [
      660,
      510,
      46,
      22
     ],
     "id": "obj-192",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      814.0,
      260.0,
      48.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "number",
     "patching_rect": [
      730,
      510,
      46,
      22
     ],
     "id": "obj-193",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      880.0,
      260.0,
      48.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "number",
     "patching_rect": [
      780,
      510,
      46,
      22
     ],
     "id": "obj-194",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      932.0,
      260.0,
      48.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "number",
     "patching_rect": [
      830,
      510,
      46,
      22
     ],
     "id": "obj-195",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "presentation": 1,
     "presentation_rect": [
      984.0,
      260.0,
      48.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "Monitor MIDI  —  CC: valor · número · canal      Nota: tono · velocidad · canal",
     "patching_rect": [
      560,
      540,
      340,
      20
     ],
     "fontsize": 10.0,
     "linecount": 1,
     "textcolor": [
      0.7,
      0.7,
      0.7,
      1.0
     ],
     "id": "obj-196",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      710.0,
      240.0,
      360.0,
      18.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "Si un control no responde, compara lo que muestra el monitor con patches/lpd8_map.json o usa 'aprender'.",
     "patching_rect": [
      560,
      540,
      360,
      20
     ],
     "fontsize": 10.0,
     "linecount": 1,
     "textcolor": [
      0.72,
      0.72,
      0.72,
      1.0
     ],
     "id": "obj-197",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      710.0,
      290.0,
      340.0,
      40.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "CÓMO USAR\n1. Antes de abrir: en la raíz del repo corre  python3 tools/assets.py pull  (baja las capas del bucket).\n2. Al abrir, carga la canción 1 y se ve en la ventana 'ser_gentil'. Arrástrala al proyector → 'Pantalla completa'.\n3. Conecta el LPD8 por USB (Programa 1). Las perillas se 'toman' al pasar por su valor actual (ver la línea de estado).\n4. PADS: 1 negro · 2 escena segura · 3 flash (fuerza del golpe) · 4 aislar figuras (mantener) · 5 tintas/escena · 6 mal registro · 7 tap tempo · 8 siguiente paleta (mezcla con K7).\n5. PERILLAS: K1 encuadre · K2 deriva · K3 figuras · K4 destellos · K5 mecer · K6 eco dub · K7 paleta · K8 master.\n6. Plan B: todo se opera con el mouse en esta ventana; tecla 0 = negro.  Más detalle: docs/operacion.md",
     "patching_rect": [
      1500,
      700,
      1040,
      200
     ],
     "fontsize": 11.0,
     "linecount": 7,
     "id": "obj-198",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "presentation": 1,
     "presentation_rect": [
      20.0,
      495.0,
      1040.0,
      200.0
     ]
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "obj-11",
      0
     ],
     "destination": [
      "obj-12",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-12",
      0
     ],
     "destination": [
      "obj-13",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-13",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-11",
      0
     ],
     "destination": [
      "obj-14",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-14",
      0
     ],
     "destination": [
      "obj-15",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-15",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-19",
      0
     ],
     "destination": [
      "obj-20",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-20",
      0
     ],
     "destination": [
      "obj-18",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-11",
      0
     ],
     "destination": [
      "obj-21",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-21",
      0
     ],
     "destination": [
      "obj-19",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-23",
      0
     ],
     "destination": [
      "obj-24",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-24",
      0
     ],
     "destination": [
      "obj-18",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-18",
      0
     ],
     "destination": [
      "obj-26",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      17
     ],
     "destination": [
      "obj-18",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      0
     ],
     "destination": [
      "obj-30",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-30",
      0
     ],
     "destination": [
      "obj-31",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-30",
      1
     ],
     "destination": [
      "obj-32",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-31",
      0
     ],
     "destination": [
      "obj-32",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      1
     ],
     "destination": [
      "obj-34",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-34",
      0
     ],
     "destination": [
      "obj-35",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-34",
      1
     ],
     "destination": [
      "obj-36",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-35",
      0
     ],
     "destination": [
      "obj-36",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      2
     ],
     "destination": [
      "obj-38",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-38",
      0
     ],
     "destination": [
      "obj-39",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-38",
      1
     ],
     "destination": [
      "obj-40",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-39",
      0
     ],
     "destination": [
      "obj-40",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      3
     ],
     "destination": [
      "obj-42",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-42",
      0
     ],
     "destination": [
      "obj-43",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-42",
      1
     ],
     "destination": [
      "obj-44",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-43",
      0
     ],
     "destination": [
      "obj-44",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      4
     ],
     "destination": [
      "obj-46",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-46",
      0
     ],
     "destination": [
      "obj-47",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-46",
      1
     ],
     "destination": [
      "obj-48",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-47",
      0
     ],
     "destination": [
      "obj-48",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      5
     ],
     "destination": [
      "obj-50",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-50",
      0
     ],
     "destination": [
      "obj-51",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-50",
      1
     ],
     "destination": [
      "obj-52",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-51",
      0
     ],
     "destination": [
      "obj-52",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      6
     ],
     "destination": [
      "obj-54",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-54",
      0
     ],
     "destination": [
      "obj-55",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-54",
      1
     ],
     "destination": [
      "obj-56",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-55",
      0
     ],
     "destination": [
      "obj-56",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      7
     ],
     "destination": [
      "obj-58",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-58",
      0
     ],
     "destination": [
      "obj-59",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-58",
      1
     ],
     "destination": [
      "obj-60",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-59",
      0
     ],
     "destination": [
      "obj-60",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      8
     ],
     "destination": [
      "obj-62",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-62",
      0
     ],
     "destination": [
      "obj-63",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-62",
      1
     ],
     "destination": [
      "obj-64",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-63",
      0
     ],
     "destination": [
      "obj-64",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      9
     ],
     "destination": [
      "obj-66",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-66",
      0
     ],
     "destination": [
      "obj-67",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-66",
      1
     ],
     "destination": [
      "obj-68",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-67",
      0
     ],
     "destination": [
      "obj-68",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      10
     ],
     "destination": [
      "obj-70",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-70",
      0
     ],
     "destination": [
      "obj-71",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-70",
      1
     ],
     "destination": [
      "obj-72",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-71",
      0
     ],
     "destination": [
      "obj-72",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      11
     ],
     "destination": [
      "obj-74",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-74",
      0
     ],
     "destination": [
      "obj-75",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-74",
      1
     ],
     "destination": [
      "obj-76",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-75",
      0
     ],
     "destination": [
      "obj-76",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      12
     ],
     "destination": [
      "obj-78",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-78",
      0
     ],
     "destination": [
      "obj-79",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-78",
      1
     ],
     "destination": [
      "obj-80",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-79",
      0
     ],
     "destination": [
      "obj-80",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-18",
      0
     ],
     "destination": [
      "obj-83",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      13
     ],
     "destination": [
      "obj-83",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      18
     ],
     "destination": [
      "obj-85",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      19
     ],
     "destination": [
      "obj-87",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      14
     ],
     "destination": [
      "obj-89",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      15
     ],
     "destination": [
      "obj-91",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      16
     ],
     "destination": [
      "obj-94",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-94",
      0
     ],
     "destination": [
      "obj-95",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-94",
      3
     ],
     "destination": [
      "obj-96",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-94",
      2
     ],
     "destination": [
      "obj-98",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-98",
      0
     ],
     "destination": [
      "obj-99",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-99",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-101",
      0
     ],
     "destination": [
      "obj-102",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-102",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-94",
      1
     ],
     "destination": [
      "obj-104",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-104",
      0
     ],
     "destination": [
      "obj-103",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-106",
      0
     ],
     "destination": [
      "obj-107",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-107",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-96",
      0
     ],
     "destination": [
      "obj-108",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-110",
      0
     ],
     "destination": [
      "obj-111",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-111",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-96",
      1
     ],
     "destination": [
      "obj-112",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-114",
      0
     ],
     "destination": [
      "obj-115",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-115",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-96",
      2
     ],
     "destination": [
      "obj-116",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-118",
      0
     ],
     "destination": [
      "obj-119",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-119",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-96",
      3
     ],
     "destination": [
      "obj-120",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-122",
      0
     ],
     "destination": [
      "obj-123",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-123",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-96",
      4
     ],
     "destination": [
      "obj-124",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-126",
      0
     ],
     "destination": [
      "obj-127",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-127",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-96",
      5
     ],
     "destination": [
      "obj-128",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-130",
      0
     ],
     "destination": [
      "obj-131",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-131",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-96",
      6
     ],
     "destination": [
      "obj-132",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-134",
      0
     ],
     "destination": [
      "obj-135",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-135",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-96",
      7
     ],
     "destination": [
      "obj-136",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-139",
      0
     ],
     "destination": [
      "obj-140",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-140",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-95",
      0
     ],
     "destination": [
      "obj-141",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-141",
      0
     ],
     "destination": [
      "obj-139",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-143",
      0
     ],
     "destination": [
      "obj-144",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-144",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-95",
      1
     ],
     "destination": [
      "obj-145",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-145",
      0
     ],
     "destination": [
      "obj-143",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-147",
      0
     ],
     "destination": [
      "obj-148",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-148",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-95",
      2
     ],
     "destination": [
      "obj-149",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-149",
      0
     ],
     "destination": [
      "obj-147",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-151",
      0
     ],
     "destination": [
      "obj-152",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-152",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-95",
      3
     ],
     "destination": [
      "obj-153",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-153",
      0
     ],
     "destination": [
      "obj-151",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-155",
      0
     ],
     "destination": [
      "obj-156",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-156",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-95",
      4
     ],
     "destination": [
      "obj-157",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-157",
      0
     ],
     "destination": [
      "obj-155",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-159",
      0
     ],
     "destination": [
      "obj-160",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-160",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-95",
      5
     ],
     "destination": [
      "obj-161",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-161",
      0
     ],
     "destination": [
      "obj-159",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-163",
      0
     ],
     "destination": [
      "obj-164",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-164",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-95",
      6
     ],
     "destination": [
      "obj-165",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-165",
      0
     ],
     "destination": [
      "obj-163",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-167",
      0
     ],
     "destination": [
      "obj-168",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-168",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-95",
      7
     ],
     "destination": [
      "obj-169",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-169",
      0
     ],
     "destination": [
      "obj-167",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-172",
      0
     ],
     "destination": [
      "obj-173",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-172",
      1
     ],
     "destination": [
      "obj-173",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-172",
      2
     ],
     "destination": [
      "obj-173",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-173",
      0
     ],
     "destination": [
      "obj-174",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-174",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-175",
      0
     ],
     "destination": [
      "obj-176",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-175",
      1
     ],
     "destination": [
      "obj-176",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-175",
      2
     ],
     "destination": [
      "obj-176",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-176",
      0
     ],
     "destination": [
      "obj-177",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-177",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-179",
      0
     ],
     "destination": [
      "obj-181",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-181",
      0
     ],
     "destination": [
      "obj-180",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-180",
      0
     ],
     "destination": [
      "obj-182",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-182",
      1
     ],
     "destination": [
      "obj-172",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-182",
      1
     ],
     "destination": [
      "obj-175",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-184",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-185",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-188",
      0
     ],
     "destination": [
      "obj-190",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-188",
      1
     ],
     "destination": [
      "obj-191",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-188",
      2
     ],
     "destination": [
      "obj-192",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-189",
      0
     ],
     "destination": [
      "obj-193",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-189",
      1
     ],
     "destination": [
      "obj-194",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-189",
      2
     ],
     "destination": [
      "obj-195",
      0
     ]
    }
   }
  ],
  "parameters": {
   "obj-139": [
    "K1_Encuadre",
    "K1_Encuadre",
    0
   ],
   "obj-143": [
    "K2_Deriva",
    "K2_Deriva",
    0
   ],
   "obj-147": [
    "K3_Figuras",
    "K3_Figuras",
    0
   ],
   "obj-151": [
    "K4_Destellos",
    "K4_Destellos",
    0
   ],
   "obj-155": [
    "K5_Mecer",
    "K5_Mecer",
    0
   ],
   "obj-159": [
    "K6_Eco",
    "K6_Eco",
    0
   ],
   "obj-163": [
    "K7_Paleta",
    "K7_Paleta",
    0
   ],
   "obj-167": [
    "K8_Master",
    "K8_Master",
    0
   ],
   "inherited_shortname": 1
  },
  "dependency_cache": [],
  "autosave": 0
 }
}