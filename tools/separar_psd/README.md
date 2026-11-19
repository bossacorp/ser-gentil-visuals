# separar_psd

Convierte el PSD de una canción en capas para Max (detalles en el docstring de `separar.py`).

```
pip install -r requirements.txt
python3 -I separar.py <arte.psd> <nn_nombre>.json ../../canciones/<nn_nombre>
```

## Configuración por canción (`<nn_nombre>.json`)

- `tintas`: nombres de las capas visibles del PSD, de abajo hacia arriba. Las ocultas salen como `oculta`.
- `modo`:
  - `cielo` (ej. `05_por_siempre.json`): arte con cielo liso oscuro. `figuras` = polígonos guía
    (de atrás hacia adelante); el recorte sigue el contorno real del dibujo. Luna (`luna_circulo`),
    estrellas y nubes salen automáticas.
  - `capas` (ej. `01_densidad.json`): arte sin cielo liso. `planos` = polígonos de atrás hacia
    adelante; `00_fondo` es implícito. Lo tapado detrás de cada plano se rellena por inpainting.
- Coordenadas en px sobre el arte escalado a 2048×2048.

## Nueva canción

1. Copia la config del modo que se parezca más y ajusta `tintas` al número de capas visibles del PSD.
2. Ubica cada elemento sobre una cuadrícula del arte a 2048 px y escribe su polígono.
3. Corre el script y revisa `preview/mapa_segmentacion.jpg` y `preview/original_vs_recompuesto.jpg`
   (la recomposición debería dar > 45 dB de PSNR).
