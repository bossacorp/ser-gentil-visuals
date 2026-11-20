# Validación del motor v0.1 (para hacer en la MacBook Pro)

El patch se **generó por código** (`patches/build_motor.py`) y la lógica (`motor.js`) se probó en un
simulador fuera de Max (cargas, perillas, pads, paletas, cambio de canción, aprender: sin errores),
y la geometría con un render de prueba. **Nunca se ha abierto en Max**: esta lista es para encontrar
lo que solo Max puede decir. Anota en cada punto ✅ / ❌ y lo que diga la consola (⌘M).

## 0. Preparación
- [ ] `git pull` · `python3 tools/assets.py pull` → termina en `ok`.
- [ ] Abrir `patches/ser_gentil_motor.maxpat` desde el repo. ¿Abre en modo presentación?
- [x] Consola (⌘M): ¿algún objeto en rojo / error? → 8× `js: bad outlet index 16` al abrir: corregido en 7923057 (19 nov).
- [ ] Consola: debe decir `motor.js: raíz … · 5 canciones · 4 paletas`.

## 1. Imagen (lo más incierto)
- [ ] ¿Se ve la canción 1 (*Densidad*) en la ventana `ser_gentil`?
  - Si sale negro: revisa la consola. Punto a sospechar: `importmovie` de PNG en `jit.matrix`.
- [ ] ¿Las capas tienen transparencia correcta? (el perro y la mujer sobre el mar, sin cuadros negros)
  - Si se ven bordes oscuros finos alrededor de las figuras: alfa premultiplicado (se arregla en v0.2).
- [x] Con K1 = 0, ¿el arte ocupa **exacto** el alto de la ventana, cuadrado, con barras negras a los lados? ✅ (19 nov)
  - Si queda más grande/chico: cambiar `BASE` en `motor.js` (hoy 0.8284) hasta que llene exacto, y `init`.
- [ ] ¿El orden de capas es correcto? (fondo atrás, figuras al frente)

## 2. Controles
- [ ] Monitor MIDI: anota qué manda el LPD8 — pads: nota ___ a ___, perillas: CC ___ a ___, canal ___.
  - ✅ 19 nov (aprendido): pads = notas 36–43, perillas = CC 1–8, canal cualquiera → `patches/lpd8_map.json`.
  - Si no son notas 36–43 y CC 70–77: botón `aprender` (pads 1–8 y perillas 1–8 en orden).
- [ ] Cada pad hace lo de `docs/operacion.md`. Las luces (toggles) de pads 1, 4 y 5 se encienden.
- [ ] Perillas: al girar, ¿primero piden "tomar" y luego responden? ¿El dial en pantalla las sigue?
- [ ] Clic con el mouse en pads y perillas de la interfaz funciona igual.
- [ ] Teclas `1`–`5`, `0`, `espacio`, `t`, `f`.

## 3. Movimiento y efectos (por canción)
- [ ] Figuras (K3) y tap tempo (pad 7): la respiración sigue el pulso.
- [ ] Mecer (K5): copa (*Mi raíz*) y yuca (*Cordón*) se mecen desde la base, no desde el centro.
- [ ] Deriva (K2) al máximo: ¿se asoma algún borde negro dentro del arte? (debería taparse con el marco)
- [ ] Modo tintas (pad 5) + paleta (pad 8, K7): recolorea limpio, sin halos.
- [ ] Mal registro (pad 6) en modo tintas.
- [ ] Eco dub (K6): estelas. ¿Se satura muy rápido? Anotar a qué % se ve mejor.
- [ ] Flash (pad 3) y negro (pad 1, K8).

## 4. Rendimiento
- [x] fps (en la interfaz) con *Por siempre* (8 capas): 58–60 fps ✅ (19 nov). Pendiente repetir con K6 = 50 % y K2/K3 al máximo.
- [ ] Tiempo de cambio de canción (del negro a la imagen): ___ s.
- [ ] Pantalla completa en el proyector / monitor externo: ¿resolución y proporción correctas?

## 5. Gusto (dirección artística)
- [ ] ¿Las amplitudes de movimiento se sienten bien? (más sutil / más vivo)
- [ ] ¿Las 4 paletas alternas sirven? ¿Cuál falta?
- [ ] ¿Algún personaje debería moverse distinto?

Con esto ajusto `motor.js`, `movimientos.json` y `paletas.json` para la v0.2.
