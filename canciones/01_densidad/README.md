# 01 — Densidad

Fuente: `01 Densidad.psd` (5906×5906 px, CMYK, 5 capas = tintas; 209 MB, no está en el repo).

Arte sin cielo liso → separado por **planos de profundidad** (modo `capas`). Cada plano trae relleno
(inpainting) en la zona que tapan los planos de enfrente, así que se puede mover sin dejar huecos.
El relleno es borroso a propósito: solo asoma unos píxeles cuando el plano de enfrente se desplaza.

## Capas de escena (`capas/escena/`, apilar en este orden)

| Archivo | Contenido | Ideas de movimiento |
|---|---|---|
| `00_fondo.png` | Ciudad dorada, catedrales, edificio gótico, remolinos lejanos | Parallax muy lento, brillo de ventanas |
| `01_mar_y_barca.png` | Gran ola, espumas y la barca | Ondulación (desplazamiento), balanceo |
| `02_auto.png` | Auto antiguo flotando (izq.) | Deriva lenta, ligero giro |
| `03_ola_oscura.png` | Ola oscura con grietas doradas (der.) | Pulso, crecer/encoger, destello en grietas |
| `04_perro.png` | Pug en su manta (abajo izq.) | Respiración |
| `05_mujer.png` | Mujer de espaldas en la barca | Respiración, balanceo con la barca |

Recortes por polígono: los bordes de la mujer y del perro son aproximados (±10 px a 2048). Para
movimientos sutiles no se nota; si se quiere moverlos mucho, afinar el polígono en `tools/separar_psd/01_densidad.json`.

## Tintas (`capas/tintas/`)

| Archivo | Tinta | Color medido | vs. *Por siempre* |
|---|---|---|---|
| `t1_papel.png` | Papel | `#eae3d4` | — |
| `t2_crema.png` | Crema / luces | `#d5be8d` | ≈ igual (`#d6c08e`) |
| `t3_vino.png` | Vino | `#885951` | idéntico |
| `t4_gris.png` | **Gris verdoso** (mar) | `#6f7a75` | tinta nueva |
| `t5_linea.png` | Línea | `#363636` | idéntico |

## Regenerar

```
python3 -I tools/separar_psd/separar.py "<ruta>/01 Densidad.psd" tools/separar_psd/01_densidad.json canciones/01_densidad
```
