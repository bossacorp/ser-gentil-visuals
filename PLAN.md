# Plan de trabajo — visuales en vivo (concierto reggae)

**Entrega:** concierto en ~15 días (≈ 3 dic 2026, fecha por confirmar).
**v1:** un operador dispara y manipula el arte de cada canción con un **Akai LPD8** desde un patch de Max.
**Principio de diseño:** visual *homologado* → la **misma gramática de control y de movimiento** en todas las canciones; lo que cambia por canción es el arte, su paleta y sus presets.

---

## 1. Pipeline de arte (por canción)

```
PSD del diseñador ──► tools/separar_psd/separar.py ──► canciones/<nn_nombre>/
                         (+ poligonos.json por canción)        capas/escena/ 00–07  (elementos)
                                                               capas/tintas/ t1–t5  (tintas de serigrafía)
                                                               mascaras/            (grises para efectos)
                                                               paleta.json          (colores medidos)
```

- **Tintas** (exactas, salen del PSD): permiten recolorear cada tinta y hacer "mal registro".
- **Escena** (recortes): cielo → estrellas → luna → nubes → figuras. Apiladas recomponen el arte
  (verificado: PSNR 54 dB en *Por siempre*). Permiten mover cada elemento.
- Todo a **2048×2048**: deja margen para zoom/paneo en salida 1920×1080 y es manejable en la Mac mini Intel.
- Tiempo estimado por canción nueva: 30–45 min (ajustar polígonos de las figuras + revisión).

**Hecho:** `05_por_siempre` ✅

## 2. Dirección artística (propuesta, una sola gramática)

| Capa del lenguaje | Qué hace | Referencias |
|---|---|---|
| **Diorama** (base) | Las capas flotan con parallax lento; figuras respiran; nubes derivan | Recortes de Lotte Reiniger (1926); teatro de papel *kamishibai*; las nubes en espiral del arte dialogan con las nubes auspiciosas (*xiangyun* / *kumo*) de Asia oriental |
| **Serigrafía viva** (acentos) | Recolorear tintas por canción, golpes de mal registro, paleta que vira | Carteles de concierto en serigrafía (escena *gig poster*); bocetos de color de Zach Lieberman |
| **Dub** (clímax) | Eco visual (feedback) como el delay del dub: estelas, repeticiones | Estética de *sound system* jamaiquino; feedback de video de Nam June Paik / Vasulka |

**Patrones algorítmicos:** ruido de Perlin para la deriva de nubes y figuras (*The Nature of Code*, cap. 0);
osciladores para flotación y titileo de estrellas (cap. 3); recursión/feedback para el eco dub
(*Form+Code*, "Repetir"); desplazamiento por mapa para ondular nubes (ofBook, procesamiento de imagen).

## 3. Arquitectura del patch (Max 8 compatible → corre en ambas Macs)

```
ENTRADA                 PROCESO (GPU, texturas)                         SALIDA
canciones/<nn>/*.png ─► jit.matrix importmovie ─► jit.gl.videoplane ×8 ─► jit.world (proyector, fullscreen)
selector de canción     (una capa por elemento, @blend_enable 1)        └► jit.gl.syphonserver → OBS (opcional)
                        + modo tintas (4 videoplanes recoloreables)
                        + jit.gl.pix: desplazamiento / mal registro
                        + feedback (eco dub) + capa de flash + capa negra
CONTROL
LPD8 (USB en función) ─► notein/ctlin ─► soft-takeover ─► slide ─► parámetros
pattrstorage: presets por canción · UI en modo presentación (operable con mouse = plan B)
```

## 4. Mapa LPD8 (borrador, igual para todas las canciones)

| Control | Función | Tipo |
|---|---|---|
| Pad 1 | **Negro** (pánico) | toggle |
| Pad 2 | **Arte completo / escena segura** | disparo |
| Pad 3 | Flash (intensidad = velocidad del golpe) | momentáneo |
| Pad 4 | Aislar figuras (nubes y luna bajan) | momentáneo |
| Pad 5 | Modo tintas ↔ modo escena | toggle |
| Pad 6 | Golpe de mal registro (tintas se desfasan) | momentáneo |
| Pad 7 | Tap tempo (pulso de respiración) | disparo |
| Pad 8 | Siguiente preset de la canción | disparo |
| Perilla 1 | Cámara: zoom/paneo (Ken Burns) | continuo |
| Perilla 2 | Deriva de nubes (desplazamiento) | continuo |
| Perilla 3 | Flotación de figuras (amplitud) | continuo |
| Perilla 4 | Estrellas: titileo | continuo |
| Perilla 5 | Luna: giro/brillo | continuo |
| Perilla 6 | Eco dub (feedback) | continuo |
| Perilla 7 | Paleta: original → paleta alterna | continuo |
| Perilla 8 | Master (fundido general) | continuo |

Notas: las perillas del LPD8 son absolutas → el patch usa *soft-takeover* (no salta al cambiar de canción).
Bluetooth agrega latencia: en función, **USB**. CC/notas reales se verifican con el monitor MIDI del patch.

## 5. Cronograma (≈15 días)

| Días | Fechas aprox. | Entregable |
|---|---|---|
| 1–2 | 18–19 nov | Repo + separación de *Por siempre* ✅ · recibir PSDs y setlist · confirmar Mac y pantalla |
| 3–5 | 20–22 nov | **Patch v0.1** con *Por siempre*: stack de capas, LPD8 mapeado, negro/segura, monitor MIDI · prueba de fps en la Mac destino |
| 6–8 | 23–25 nov | Separar el resto de canciones · presets y paleta por canción · selector de canción |
| 9–10 | 26–27 nov | Efectos firma (tintas, eco dub, ondulación) · sesión con el operador → ajustar mapa |
| 11–12 | 28–29 nov | Ensayo con audio/banda · salida al proyector/LED/OBS |
| 13 | 30 nov–1 dic | **Congelar v1.0** (tag `v1.0-concierto`) · plan B · hoja de operación del LPD8 |
| 14–15 | 2–3 dic | Técnica en sede · ensayo general · función |

## 6. Versionado

- `main` = siempre abrible en función. Trabajo nuevo en ramas (`cancion/<nn>`, `patch/<feature>`) y merge al probar.
- Tags: `v0.1`, `v0.5-ensayo`, `v1.0-concierto`.
- Los `.psd` **no** se suben (53 MB c/u); viven en la carpeta del diseñador. Todo se regenera con `separar.py`.
  Si se quiere versionar los PSD → activar Git LFS (pendiente de decidir).

## 7. Pendientes por confirmar

1. ¿Qué Mac corre la función (MacBook Pro Max 9 o Mac mini Intel)? → define límites de efectos.
2. ¿Salida: proyector 16:9, LED (resolución), o también stream?
3. Setlist y PSDs del resto de canciones (¿todas con el mismo sistema de tintas?).
4. ¿Hay audio o MIDI de la banda disponible para sincronía, o todo a mano del operador?
5. Nombre del artista/fecha exacta para el README.
