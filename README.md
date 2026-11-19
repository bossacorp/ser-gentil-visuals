# ser-gentil-visuals

Visuales en vivo para el concierto de reggae: arte de cada canción separado en capas y manipulado
en tiempo real desde Max con un **Akai LPD8**.

- Plan, cronograma y mapa de controles → [`PLAN.md`](PLAN.md)

## Archivos pesados (bucket de GCS)

Los PSD y las capas PNG **no** van en git: viven en el bucket configurado en `assets.json`.
El repo guarda `assets.lock.json` con el hash de cada archivo (cada commit fija su versión del arte).

```
python3 tools/assets.py pull        # baja capas/máscaras/PSD que falten y verifica hashes
python3 tools/assets.py verify      # ¿lo que tengo en disco coincide con este commit?
python3 tools/assets.py push        # sube lo generado (después de: build → lock)
```
Requiere `gcloud` con sesión iniciada. En la sede no hace falta internet: Max lee de disco.

## Estructura

```
canciones/<nn_nombre>/     arte de cada canción listo para Max
  capas/escena/            00_cielo … 07_leon  (PNG 2048² con alfa; apiladas = arte completo)
  capas/tintas/            t1_papel … t5_oculta (una tinta del PSD por archivo)
  mascaras/                lo mismo en escala de grises (para efectos por zona)
  preview/                 hoja de contacto, mapa de segmentación, original vs recompuesto
  paleta.json              colores medidos (hex, RGB y 0–1 para Max)
patches/                   patches de Max (.maxpat) y archivos auxiliares
tools/separar_psd/         script que convierte un PSD en todo lo anterior
docs/                      hojas de operación, notas de ensayo
```

## Canciones

| # | Canción | Modo de separación | Estado |
|---|---|---|---|
| 01 | Densidad | planos de profundidad | capas listas |
| 02 | Mi raíz | planos + ajuste a tinta oscura | capas listas |
| 03 | — | | pendiente PSD |
| 04 | — | | pendiente PSD |
| 05 | Por siempre | cielo + figuras | capas listas |

## Paleta común (homologado)

Las tintas se repiten entre canciones: **vino `#885951`** y **línea `#363636`** idénticas, **crema ≈ `#d6c08e`**.
Cada canción puede sumar una tinta propia (Densidad: gris verdoso `#6f7a75`). Detalle en `canciones/*/paleta.json`.
