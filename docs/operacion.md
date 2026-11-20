# Hoja de operación — motor v0.1

Patch: `patches/ser_gentil_motor.maxpat` · Lógica: `patches/motor.js` · Max 9 (también abre en Max 8).

## Antes de la función

1. `git pull` y `python3 tools/assets.py pull` en la raíz del repo (baja y verifica las capas).
2. Abrir `patches/ser_gentil_motor.maxpat` **desde la carpeta del repo** (el motor ubica las imágenes
   a partir de dónde está el patch).
3. Se abre la interfaz y una ventana `ser_gentil` con la canción 1.
4. Arrastrar la ventana `ser_gentil` al proyector → activar **Pantalla completa** (o tecla `f`;
   `Esc` alterna).
5. Conectar el LPD8 **por USB**, programa 1 (pads = notas 36–43, perillas = CC 1–8). Verificar en el monitor MIDI que llegan.
6. Recorrer las 5 canciones una vez (la primera carga de cada una tarda un poco; ocurre detrás de un negro).

## LPD8

```
PADS                                              PERILLAS
[5 Tintas] [6 Registro] [7 Tap]   [8 Paleta]      (K1 Encuadre) (K2 Deriva) (K3 Figuras) (K4 Destellos)
[1 NEGRO]  [2 Segura]   [3 Flash] [4 Aislar]      (K5 Mecer)    (K6 Eco)    (K7 Paleta)  (K8 Master)
```

| Control | Qué hace | Notas |
|---|---|---|
| Pad 1 | **Negro** (alterna) | Fundido de 0.2 s. Pánico. |
| Pad 2 | **Escena segura** | Todo a valores por defecto, apaga negro/tintas/aislar. Las perillas físicas quedan "por tomar". |
| Pad 3 | Flash blanco | Intensidad = fuerza del golpe. |
| Pad 4 | Aislar figuras | Mientras se mantiene: el entorno se oscurece y quedan las figuras. |
| Pad 5 | Modo tintas ↔ escena | Tintas: el arte reconstruido tinta por tinta, recoloreable. |
| Pad 6 | Mal registro | Golpe: las tintas se desfasan y regresan (se ve en modo tintas). |
| Pad 7 | Tap tempo | 2+ golpes al pulso. La respiración y el baile de las figuras siguen ese tempo. |
| Pad 8 | Siguiente paleta | dub_noche → fuego → raíces → negativo. Cuánto se aplica lo decide K7. |
| K1 | Encuadre | 0 = arte completo (barras a los lados) · 1 = llena el ancho 16:9 con paneo lento. |
| K2 | Deriva | Parallax de fondo, nubes, mar, rocas (más en primer plano). |
| K3 | Figuras | Flotar / respirar / bailar de los personajes. |
| K4 | Destellos | Titileo de estrellas y fuego. |
| K5 | Mecer | Copa del árbol, yuca, barco, lunas. |
| K6 | Eco dub | Estelas (feedback). Muy alto = la imagen se "queda". |
| K7 | Paleta | 0 = colores originales · 1 = paleta elegida con pad 8 (tintas completas; escena entonada). |
| K8 | Master | Fundido general a negro. Empieza en 100 %: sube la perilla física al máximo para tomarla. |

**Perillas "por tomar":** al abrir el patch, al cambiar con el mouse o después de "Escena segura", una
perilla física no actúa hasta que pasa por el valor actual (la línea de estado lo indica). Evita saltos.

## Teclado (ventana del patch al frente)

`1`–`5` canción · `0` negro · `espacio` flash · `t` tap tempo · `f` pantalla completa.

## Movimiento por canción (homologado)

| Personaje / elemento | Movimiento | Canciones |
|---|---|---|
| Mujer | respira (flota en *Por siempre*, baila en *Cordón*) | 01, 03, 04, 05 |
| Perro | respira | 01, 02 |
| Oso | respira / flota | 03, 05 |
| León y reunión | respira / flota | 04, 05 |
| Árbol, yuca, barco, lunas | mece | 02, 04, 05 |
| Fondos, nubes, mar, rocas | parallax según profundidad | todas |
| Estrellas, fuego | titila / fuego | 05, 04 |

Se ajusta en `patches/movimientos.json` → `python3 tools/motor_config.py` → botón `init` en el patch.

## Plan B

- Si se cae el LPD8: todo se opera con el mouse en la interfaz; tecla `0` = negro.
- Si algo se ve mal: Pad 2 (escena segura). Si persiste: Pad 1 (negro) y `init`.
- Si Max se cierra: reabrir el patch (carga la canción 1). Ten a la mano el orden del setlist.
