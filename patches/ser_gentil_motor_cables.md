# Mapa de cables — Ser Gentil — motor de visuales v0.1

| # | Desde (outlet) | Hacia (inlet) |
|---|---|---|
| 1 | `loadbang` (0) | `deferlow` (0) |
| 2 | `deferlow` (0) | `[msg] init` (0) |
| 3 | `[msg] init` (0) | `js motor.js` (0) |
| 4 | `loadbang` (0) | `[msg] 1` (0) |
| 5 | `[msg] 1` (0) | `qmetro 16` (0) |
| 6 | `qmetro 16` (0) | `js motor.js` (0) |
| 7 | `[toggle]` (0) | `[msg] enable $1` (0) |
| 8 | `[msg] enable $1` (0) | `jit.world ser_gentil @enable 1 @dim 1920 1080 @fsmenubar 0 @erase_color 0 0 0 1 @output_texture 1` (0) |
| 9 | `loadbang` (0) | `[msg] set 1` (0) |
| 10 | `[msg] set 1` (0) | `[toggle]` (0) |
| 11 | `[toggle]` (0) | `[msg] fullscreen $1` (0) |
| 12 | `[msg] fullscreen $1` (0) | `jit.world ser_gentil @enable 1 @dim 1920 1080 @fsmenubar 0 @erase_color 0 0 0 1 @output_texture 1` (0) |
| 13 | `jit.world ser_gentil @enable 1 @dim 1920 1080 @fsmenubar 0 @erase_color 0 0 0 1 @output_texture 1` (0) | `[jit.fpsgui]` (0) |
| 14 | `js motor.js` (17) | `jit.world ser_gentil @enable 1 @dim 1920 1080 @fsmenubar 0 @erase_color 0 0 0 1 @output_texture 1` (0) |
| 15 | `js motor.js` (0) | `route m v` (0) |
| 16 | `route m v` (0) | `jit.matrix 4 char 2048 2048` (0) |
| 17 | `route m v` (1) | `jit.gl.videoplane ser_gentil @layer 10 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 18 | `jit.matrix 4 char 2048 2048` (0) | `jit.gl.videoplane ser_gentil @layer 10 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 19 | `js motor.js` (1) | `route m v` (0) |
| 20 | `route m v` (0) | `jit.matrix 4 char 2048 2048` (0) |
| 21 | `route m v` (1) | `jit.gl.videoplane ser_gentil @layer 11 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 22 | `jit.matrix 4 char 2048 2048` (0) | `jit.gl.videoplane ser_gentil @layer 11 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 23 | `js motor.js` (2) | `route m v` (0) |
| 24 | `route m v` (0) | `jit.matrix 4 char 2048 2048` (0) |
| 25 | `route m v` (1) | `jit.gl.videoplane ser_gentil @layer 12 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 26 | `jit.matrix 4 char 2048 2048` (0) | `jit.gl.videoplane ser_gentil @layer 12 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 27 | `js motor.js` (3) | `route m v` (0) |
| 28 | `route m v` (0) | `jit.matrix 4 char 2048 2048` (0) |
| 29 | `route m v` (1) | `jit.gl.videoplane ser_gentil @layer 13 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 30 | `jit.matrix 4 char 2048 2048` (0) | `jit.gl.videoplane ser_gentil @layer 13 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 31 | `js motor.js` (4) | `route m v` (0) |
| 32 | `route m v` (0) | `jit.matrix 4 char 2048 2048` (0) |
| 33 | `route m v` (1) | `jit.gl.videoplane ser_gentil @layer 14 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 34 | `jit.matrix 4 char 2048 2048` (0) | `jit.gl.videoplane ser_gentil @layer 14 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 35 | `js motor.js` (5) | `route m v` (0) |
| 36 | `route m v` (0) | `jit.matrix 4 char 2048 2048` (0) |
| 37 | `route m v` (1) | `jit.gl.videoplane ser_gentil @layer 15 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 38 | `jit.matrix 4 char 2048 2048` (0) | `jit.gl.videoplane ser_gentil @layer 15 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 39 | `js motor.js` (6) | `route m v` (0) |
| 40 | `route m v` (0) | `jit.matrix 4 char 2048 2048` (0) |
| 41 | `route m v` (1) | `jit.gl.videoplane ser_gentil @layer 16 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 42 | `jit.matrix 4 char 2048 2048` (0) | `jit.gl.videoplane ser_gentil @layer 16 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 43 | `js motor.js` (7) | `route m v` (0) |
| 44 | `route m v` (0) | `jit.matrix 4 char 2048 2048` (0) |
| 45 | `route m v` (1) | `jit.gl.videoplane ser_gentil @layer 17 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 46 | `jit.matrix 4 char 2048 2048` (0) | `jit.gl.videoplane ser_gentil @layer 17 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 47 | `js motor.js` (8) | `route m v` (0) |
| 48 | `route m v` (0) | `jit.matrix 4 char 2048 2048` (0) |
| 49 | `route m v` (1) | `jit.gl.videoplane ser_gentil @layer 20 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 50 | `jit.matrix 4 char 2048 2048` (0) | `jit.gl.videoplane ser_gentil @layer 20 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 51 | `js motor.js` (9) | `route m v` (0) |
| 52 | `route m v` (0) | `jit.matrix 4 char 2048 2048` (0) |
| 53 | `route m v` (1) | `jit.gl.videoplane ser_gentil @layer 21 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 54 | `jit.matrix 4 char 2048 2048` (0) | `jit.gl.videoplane ser_gentil @layer 21 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 55 | `js motor.js` (10) | `route m v` (0) |
| 56 | `route m v` (0) | `jit.matrix 4 char 2048 2048` (0) |
| 57 | `route m v` (1) | `jit.gl.videoplane ser_gentil @layer 22 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 58 | `jit.matrix 4 char 2048 2048` (0) | `jit.gl.videoplane ser_gentil @layer 22 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 59 | `js motor.js` (11) | `route m v` (0) |
| 60 | `route m v` (0) | `jit.matrix 4 char 2048 2048` (0) |
| 61 | `route m v` (1) | `jit.gl.videoplane ser_gentil @layer 23 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 62 | `jit.matrix 4 char 2048 2048` (0) | `jit.gl.videoplane ser_gentil @layer 23 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 63 | `js motor.js` (12) | `route m v` (0) |
| 64 | `route m v` (0) | `jit.matrix 4 char 2048 2048` (0) |
| 65 | `route m v` (1) | `jit.gl.videoplane ser_gentil @layer 24 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 66 | `jit.matrix 4 char 2048 2048` (0) | `jit.gl.videoplane ser_gentil @layer 24 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1` (0) |
| 67 | `jit.world ser_gentil @enable 1 @dim 1920 1080 @fsmenubar 0 @erase_color 0 0 0 1 @output_texture 1` (0) | `jit.gl.videoplane ser_gentil @layer 40 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1 @color 1 1 1 0` (0) |
| 68 | `js motor.js` (13) | `jit.gl.videoplane ser_gentil @layer 40 @blend_enable 1 @depth_enable 0 @enable 0 @interp 1 @color 1 1 1 0` (0) |
| 69 | `js motor.js` (18) | `jit.gl.gridshape ser_gentil @shape plane @layer 50 @blend_enable 1 @depth_enable 0 @lighting_enable 0 @color 0 0 0 1 @scale 2 2 1` (0) |
| 70 | `js motor.js` (19) | `jit.gl.gridshape ser_gentil @shape plane @layer 50 @blend_enable 1 @depth_enable 0 @lighting_enable 0 @color 0 0 0 1 @scale 2 2 1` (0) |
| 71 | `js motor.js` (14) | `jit.gl.gridshape ser_gentil @shape plane @layer 60 @blend_enable 1 @depth_enable 0 @lighting_enable 0 @color 1 1 1 0 @scale 3 3 1` (0) |
| 72 | `js motor.js` (15) | `jit.gl.gridshape ser_gentil @shape plane @layer 70 @blend_enable 1 @depth_enable 0 @lighting_enable 0 @color 0 0 0 1 @scale 3 3 1` (0) |
| 73 | `js motor.js` (16) | `route dial status menu led` (0) |
| 74 | `route dial status menu led` (0) | `route 0 1 2 3 4 5 6 7` (0) |
| 75 | `route dial status menu led` (3) | `route 0 1 2 3 4 5 6 7` (0) |
| 76 | `route dial status menu led` (2) | `[umenu]` (0) |
| 77 | `[umenu]` (0) | `prepend cancion` (0) |
| 78 | `prepend cancion` (0) | `js motor.js` (0) |
| 79 | `key` (0) | `prepend key` (0) |
| 80 | `prepend key` (0) | `js motor.js` (0) |
| 81 | `route dial status menu led` (1) | `prepend set` (0) |
| 82 | `prepend set` (0) | `[msg] ` (0) |
| 83 | `[button]` (0) | `prepend uipad 0` (0) |
| 84 | `prepend uipad 0` (0) | `js motor.js` (0) |
| 85 | `route 0 1 2 3 4 5 6 7` (0) | `[toggle]` (0) |
| 86 | `[button]` (0) | `prepend uipad 1` (0) |
| 87 | `prepend uipad 1` (0) | `js motor.js` (0) |
| 88 | `route 0 1 2 3 4 5 6 7` (1) | `[toggle]` (0) |
| 89 | `[button]` (0) | `prepend uipad 2` (0) |
| 90 | `prepend uipad 2` (0) | `js motor.js` (0) |
| 91 | `route 0 1 2 3 4 5 6 7` (2) | `[toggle]` (0) |
| 92 | `[button]` (0) | `prepend uipad 3` (0) |
| 93 | `prepend uipad 3` (0) | `js motor.js` (0) |
| 94 | `route 0 1 2 3 4 5 6 7` (3) | `[toggle]` (0) |
| 95 | `[button]` (0) | `prepend uipad 4` (0) |
| 96 | `prepend uipad 4` (0) | `js motor.js` (0) |
| 97 | `route 0 1 2 3 4 5 6 7` (4) | `[toggle]` (0) |
| 98 | `[button]` (0) | `prepend uipad 5` (0) |
| 99 | `prepend uipad 5` (0) | `js motor.js` (0) |
| 100 | `route 0 1 2 3 4 5 6 7` (5) | `[toggle]` (0) |
| 101 | `[button]` (0) | `prepend uipad 6` (0) |
| 102 | `prepend uipad 6` (0) | `js motor.js` (0) |
| 103 | `route 0 1 2 3 4 5 6 7` (6) | `[toggle]` (0) |
| 104 | `[button]` (0) | `prepend uipad 7` (0) |
| 105 | `prepend uipad 7` (0) | `js motor.js` (0) |
| 106 | `route 0 1 2 3 4 5 6 7` (7) | `[toggle]` (0) |
| 107 | `[live.dial] K1_Encuadre` (0) | `prepend dial 0` (0) |
| 108 | `prepend dial 0` (0) | `js motor.js` (0) |
| 109 | `route 0 1 2 3 4 5 6 7` (0) | `prepend set` (0) |
| 110 | `prepend set` (0) | `[live.dial] K1_Encuadre` (0) |
| 111 | `[live.dial] K2_Deriva` (0) | `prepend dial 1` (0) |
| 112 | `prepend dial 1` (0) | `js motor.js` (0) |
| 113 | `route 0 1 2 3 4 5 6 7` (1) | `prepend set` (0) |
| 114 | `prepend set` (0) | `[live.dial] K2_Deriva` (0) |
| 115 | `[live.dial] K3_Figuras` (0) | `prepend dial 2` (0) |
| 116 | `prepend dial 2` (0) | `js motor.js` (0) |
| 117 | `route 0 1 2 3 4 5 6 7` (2) | `prepend set` (0) |
| 118 | `prepend set` (0) | `[live.dial] K3_Figuras` (0) |
| 119 | `[live.dial] K4_Destellos` (0) | `prepend dial 3` (0) |
| 120 | `prepend dial 3` (0) | `js motor.js` (0) |
| 121 | `route 0 1 2 3 4 5 6 7` (3) | `prepend set` (0) |
| 122 | `prepend set` (0) | `[live.dial] K4_Destellos` (0) |
| 123 | `[live.dial] K5_Mecer` (0) | `prepend dial 4` (0) |
| 124 | `prepend dial 4` (0) | `js motor.js` (0) |
| 125 | `route 0 1 2 3 4 5 6 7` (4) | `prepend set` (0) |
| 126 | `prepend set` (0) | `[live.dial] K5_Mecer` (0) |
| 127 | `[live.dial] K6_Eco` (0) | `prepend dial 5` (0) |
| 128 | `prepend dial 5` (0) | `js motor.js` (0) |
| 129 | `route 0 1 2 3 4 5 6 7` (5) | `prepend set` (0) |
| 130 | `prepend set` (0) | `[live.dial] K6_Eco` (0) |
| 131 | `[live.dial] K7_Paleta` (0) | `prepend dial 6` (0) |
| 132 | `prepend dial 6` (0) | `js motor.js` (0) |
| 133 | `route 0 1 2 3 4 5 6 7` (6) | `prepend set` (0) |
| 134 | `prepend set` (0) | `[live.dial] K7_Paleta` (0) |
| 135 | `[live.dial] K8_Master` (0) | `prepend dial 7` (0) |
| 136 | `prepend dial 7` (0) | `js motor.js` (0) |
| 137 | `route 0 1 2 3 4 5 6 7` (7) | `prepend set` (0) |
| 138 | `prepend set` (0) | `[live.dial] K8_Master` (0) |
| 139 | `notein` (0) | `pack 0 0 0` (0) |
| 140 | `notein` (1) | `pack 0 0 0` (1) |
| 141 | `notein` (2) | `pack 0 0 0` (2) |
| 142 | `pack 0 0 0` (0) | `prepend note` (0) |
| 143 | `prepend note` (0) | `js motor.js` (0) |
| 144 | `ctlin` (0) | `pack 0 0 0` (0) |
| 145 | `ctlin` (1) | `pack 0 0 0` (1) |
| 146 | `ctlin` (2) | `pack 0 0 0` (2) |
| 147 | `pack 0 0 0` (0) | `prepend cc` (0) |
| 148 | `prepend cc` (0) | `js motor.js` (0) |
| 149 | `loadbang` (0) | `[msg] -1` (0) |
| 150 | `[msg] -1` (0) | `midiinfo` (1) |
| 151 | `midiinfo` (0) | `[umenu]` (0) |
| 152 | `[umenu]` (1) | `notein` (0) |
| 153 | `[umenu]` (1) | `ctlin` (0) |
| 154 | `[msg] aprender` (0) | `js motor.js` (0) |
| 155 | `[msg] init` (0) | `js motor.js` (0) |
| 156 | `ctlin` (0) | `[number]` (0) |
| 157 | `ctlin` (1) | `[number]` (0) |
| 158 | `ctlin` (2) | `[number]` (0) |
| 159 | `notein` (0) | `[number]` (0) |
| 160 | `notein` (1) | `[number]` (0) |
| 161 | `notein` (2) | `[number]` (0) |
