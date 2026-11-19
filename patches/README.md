# patches — motor de visuales

| Archivo | Qué es | ¿A mano? |
|---|---|---|
| `ser_gentil_motor.maxpat` | Patch del show (abre en presentación) | **No**: `python3 patches/build_motor.py` |
| `motor.js` | Lógica: canciones, LPD8, animación, paletas, efectos | Sí |
| `movimientos.json` | Cómo se mueve cada capa (homologado por personaje) | Sí |
| `paletas.json` | Paletas alternas comunes a todas las canciones | Sí |
| `lpd8_map.json` | Nota/CC de cada pad y perilla (lo reescribe 'aprender') | Sí / patch |
| `canciones.json` | Capas, pivotes y colores por canción | **No**: `python3 tools/motor_config.py` |
| `ser_gentil_motor_cables.md` | Mapa de todos los cables del patch | Generado |

Después de editar `movimientos.json` o separar una canción: `python3 tools/motor_config.py` y botón `init` en el patch.
Si se edita el patch a mano en Max, guardarlo con otro nombre para no perder cambios al regenerar.
