# 02 — Mi raíz

Fuente: `02 Mi raiz.psd` (5906×5906 px, CMYK, 5 capas = tintas; 145 MB). Vive en el bucket.

Planos de profundidad (modo `capas`). La copa del árbol y el barco usan `ajuste: oscuro`: el
recorte sigue el borde real de la tinta de línea, así las ondulaciones de la copa quedan intactas.

## Capas de escena (`capas/escena/`, apilar en este orden)

| Archivo | Contenido | Ideas de movimiento |
|---|---|---|
| `00_fondo.png` | Cielo con estrellas, mar, remolinos de nubes | Ondulación lenta |
| `01_barco.png` | Galeón con ventanas encendidas (arriba izq.) | Cabeceo, ventanas que parpadean |
| `02_isla.png` | Piedras moteadas y raíces | Casi fijo (ancla de la imagen) |
| `03_copa.png` | Copa del árbol + tronco con el rostro | Mecerse, respirar |
| `04_luna.png` | Luna creciente en el agua (abajo der.) | Balanceo como barca |
| `05_perro.png` | Bulldog echado (abajo) | Respiración |

Nota: unas pocas hojas sueltas abajo a la izquierda de la copa quedaron en el fondo (ampliar el
recorte metía suelo en la copa).

## Tintas (`capas/tintas/`)

Orden distinto en este PSD (el gris va abajo de la crema):

| Archivo | Tinta | Color medido |
|---|---|---|
| `t1_papel.png` | Papel | `#ebe4d6` |
| `t2_gris.png` | Gris verdoso | `#6f7a75` (= Densidad) |
| `t3_crema.png` | Crema | `#d6c08e` (= Por siempre) |
| `t4_vino.png` | Vino | `#885951` |
| `t5_linea.png` | Línea | `#363636` |

## Regenerar

```
python3 tools/assets.py build 02_mi_raiz      # con el PSD en canciones/02_mi_raiz/fuente/
```
