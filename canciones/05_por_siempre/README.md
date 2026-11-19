# 05 — Por siempre

Fuente: `05_Por_siempre.psd` (5906×5906 px, CMYK, 5 capas = tintas de serigrafía). No está en el repo.

## Capas de escena (`capas/escena/`, apilar en este orden)

| Archivo | Contenido | Ideas de movimiento |
|---|---|---|
| `00_cielo.png` | Fondo liso `#363636` | Color de fondo / fundido |
| `01_estrellas.png` | ~170 puntos y chispas | Titileo, deriva lenta |
| `02_luna.png` | Luna con cráteres, conejo lunar y corazón (abajo izq.) | Giro lento, brillo |
| `03_nubes_masa.png` | Gran masa de nubes (izquierda + primer plano) | Ondulación, parallax |
| `04_nubes_sueltas.png` | Nubes aisladas (arriba, derecha, fragmentos) | Deriva más rápida (parallax) |
| `05_oso.png` | Oso flotante (arriba izq.) | Flotación, giro leve |
| `06_mujer.png` | Mujer en vuelo (centro) | Flotación, respiración |
| `07_leon.png` | Figura león rasta (derecha) | Flotación, pulso con el bajo |

Recortes aproximados a revisar: el pie del león incluye un poco de nube; algunas chispas junto a
la mujer y al león viajan con ellos. Para movimientos sutiles (< 3 % del cuadro) no se notan.

## Tintas (`capas/tintas/`: blancas con alfa; Max les pone el color)

| Archivo | Tinta | Color medido |
|---|---|---|
| `t1_papel.png` | Papel (queda tapado en el arte) | `#faf1ed` |
| `t2_crema.png` | Crema / luces | `#d6c08e` |
| `t3_vino.png` | Vino / cuerpos y nubes | `#885951` |
| `t4_linea.png` | Línea y cielo | `#363636` |
| `t5_oculta.png` | Capa oculta del PSD (trazos verdes, 0.3 %) | — |

Apiladas t1 → t4 recomponen el arte (sin la oculta). El motor de Max les aplica el color (`@color` del videoplane) desde `paleta.json` o una paleta alterna.

## Cargar en Max (prueba rápida)

`jit.matrix 4 char 2048 2048` ← mensaje `importmovie 06_mujer.png` → `jit.gl.videoplane @blend_enable 1 @depth_enable 0 @layer 6` dentro de un `jit.world`.
Una capa por elemento, `@layer` con el número del archivo.

## Regenerar

```
python3 -I tools/separar_psd/separar.py <ruta>/05_Por_siempre.psd tools/separar_psd/05_por_siempre.json canciones/05_por_siempre
```
