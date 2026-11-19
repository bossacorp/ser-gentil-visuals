# 04 — Cordón

Fuente: `04 Cordon.psd` (5906×5906 px, CMYK, 5 capas = tintas; 100 MB). Vive en el bucket.

La escena más densa del set: una reunión alrededor de una fogata en el desierto. Se separa por
planos de profundidad; los personajes alrededor del fuego van juntos en un plano ("reunión") y la
mujer que baila y la fogata van aparte, porque son los dos focos de movimiento.

## Capas de escena (`capas/escena/`, apilar en este orden)

| Archivo | Contenido | Ideas de movimiento |
|---|---|---|
| `00_fondo.png` | Desierto, colinas, rayos de sol, tienda, yuca chica, base de piedras | Parallax lento, pulso de rayos |
| `01_combi.png` | Combi (izq.) | Casi fija |
| `02_reunion.png` | Felino grande, león, niño con máscara de calavera, leopardo y los que rodean el fuego | Respiración conjunta, luz de fuego |
| `03_mujer.png` | Mujer con rastas bailando con pandero | Balanceo al tempo (tap) |
| `04_fogata.png` | Llamas y leña | Parpadeo, escala, brillo |
| `05_yuca.png` | Yuca grande (der.), recortada sobre la tinta oscura | Mecerse lento, primer plano |
| `06_primer_plano.png` | Cactus y nopales (izq.), plantas (centro), roca moteada (der.) | Parallax de primer plano |

## Tintas (`capas/tintas/`: blancas con alfa; Max les pone el color)

| Archivo | Tinta | Color medido |
|---|---|---|
| `t1_papel.png` | Papel | `#ebe4d6` |
| `t2_crema.png` | Crema (fuego, rayos) | `#d6c08e` |
| `t3_vino.png` | Vino | `#885951` |
| `t4_gris.png` | Gris verdoso | `#6f7a75` |
| `t5_linea.png` | Línea | `#363636` |

Idea: `mascaras/04_fogata.png` × `mascaras/t2_crema.png` = solo las llamas → parpadeo de fuego sin tocar el resto.

## Regenerar

```
python3 tools/assets.py build 04_cordon
```
