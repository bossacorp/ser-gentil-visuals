# separar_psd

Convierte el PSD de una canción en capas para Max (ver docstring de `separar.py`).

```
pip install -r requirements.txt
python3 -I separar.py <arte.psd> <nn_nombre>.poligonos.json ../../canciones/<nn_nombre>
```

## Nueva canción

1. Copia `05_por_siempre.poligonos.json` como `<nn_nombre>.poligonos.json`.
2. Ajusta los polígonos de cada figura (coordenadas sobre el arte a 2048 px) y la luna (o quítalas
   si la canción no las tiene; el script espera las claves `mujer`, `leon`, `oso` y `luna_circle`
   por ahora: se generaliza cuando lleguen los demás PSD).
3. Corre el script y revisa `preview/mapa_segmentacion.jpg` y `preview/original_vs_recompuesto.jpg`.

Supuestos: el PSD viene separado por tintas (papel, crema, vino, línea) como *Por siempre*.
