# sim — probar motor.js sin Max

Simulador mínimo del entorno `js` de Max (salidas, archivos, reloj) en Node.

```
node tools/sim/sim_motor.js "$PWD"                         # recorrido de pruebas: cargas, perillas, pads, canciones, aprender
node tools/sim/sim_frame.js "$PWD" <canción 0-4> <segundos> '[K1..K8 en 0-1]' [pads,separados,por,coma] \
  | python3 -I tools/sim/render_frame.py cuadro.jpg       # render 1920x1080 de cómo se vería ese instante
```
Ej.: `node tools/sim/sim_frame.js "$PWD" 3 2 '[0,0.3,0.35,0.3,0.3,0,1,1]' 4,7 | python3 -I tools/sim/render_frame.py cordon_tintas.jpg`
(canción 4 = Cordón, modo tintas + siguiente paleta, K7 al 100 %).
