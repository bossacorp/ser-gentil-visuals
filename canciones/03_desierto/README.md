# 03 — Desierto

Fuente: `03_Desierto.psd` (5906×5906 px, CMYK, 5 capas = tintas; 61 MB). Vive en el bucket.

Planos de profundidad (modo `capas`). Las sombras largas de la mujer y el oso se quedan en el
fondo: si las figuras se mueven poco, la sombra sigue siendo creíble.

## Capas de escena (`capas/escena/`, apilar en este orden)

| Archivo | Contenido | Ideas de movimiento |
|---|---|---|
| `00_fondo.png` | Dunas, rayos de sol, huellas, sombras, franja de cielo | Calor (ondulación), pulso de los rayos |
| `01_calavera.png` | Calavera (izq.) | Casi fija; ojos como máscara para destellos |
| `02_oso.png` | Oso de pie (el mismo de *Por siempre*) | Respiración |
| `03_mujer.png` | Mujer de pie mirando al sol | Respiración, ondeo del vestido |
| `04_rocas.png` | Dos grupos de rocas moteadas (abajo izq. y der.) | Parallax de primer plano |

## Tintas (`capas/tintas/`: blancas con alfa; Max les pone el color)

| Archivo | Tinta | Color medido |
|---|---|---|
| `t1_papel.png` | Papel | `#ebe4d6` |
| `t2_vino.png` | Vino (arena; cubre 98 %) | `#885951` |
| `t3_gris.png` | Gris verdoso | `#6f7a75` |
| `t4_crema.png` | Crema (rayos, luces) | `#d6c08e` |
| `t5_linea.png` | Línea | `#363636` |

La máscara `mascaras/t4_crema.png` aísla los rayos de sol: útil para hacerlos pulsar sin tocar lo demás.

## Regenerar

```
python3 tools/assets.py build 03_desierto
```
