/*
 * motor.js — motor de visuales de Ser Gentil (objeto [js motor.js] en ser_gentil_motor.maxpat)
 * JavaScript clásico de Max (ES5): funciona en Max 8 y Max 9.
 *
 * Lee (rutas relativas a la raíz del repo, calculada desde la ubicación del patch):
 *   patches/canciones.json   capas de cada canción, movimientos, pivotes, colores (tools/motor_config.py)
 *   patches/paletas.json     paletas alternas (iguales para todas las canciones)
 *   patches/lpd8_map.json    qué nota/CC manda cada pad/perilla (se reescribe con "aprender")
 *
 * Mensajes que recibe:
 *   init                      (re)carga configuración y la primera canción (loadbang)
 *   bang                      un cuadro de animación (qmetro)
 *   note <tono> <vel> <canal> / cc <valor> <num> <canal>   MIDI del LPD8
 *   dial <k> <0-1>            perilla movida con el mouse en la interfaz
 *   uipad <k>                 pad clicado con el mouse en la interfaz
 *   cancion <i>               elegir canción (menú)
 *   key <ascii>               teclado: 1-5 canción, 0 negro, espacio flash, t tap, f pantalla completa
 *   aprender                  modo aprender LPD8 (8 pads y 8 perillas, en orden)
 *   raiz <ruta>               fija a mano la raíz del repo (si el patch no está guardado en patches/)
 *
 * Salidas:
 *   0–7   capas de escena  ("m ..." → jit.matrix, "v ..." → jit.gl.videoplane, vía [route m v])
 *   8–12  capas de tintas  (igual)
 *   13    plano de eco (feedback)   14 plano de flash   15 plano negro
 *   16    interfaz: dial/status/menu/led      17 jit.world (fullscreen)
 *   18–19 barras negras izquierda/derecha (marco del arte cuadrado en salida 16:9)
 */

autowatch = 1;
inlets = 1;
outlets = 20;

var N_ESC = 8, N_TIN = 5;
var O_ECO = 13, O_FLASH = 14, O_NEGRO = 15, O_UI = 16, O_WORLD = 17, O_MARCO_I = 18, O_MARCO_D = 19;

// Geometría: cámara por defecto de jit.world (perspectiva 45°, en z=2) → la mitad de la altura
// visible en z=0 es 2·tan(22.5°) = 0.8284. Un plano con escala 0.8284 llena exacto el alto.
var BASE = 0.8284;
var ASPECTO = 1920 / 1080;

var PERILLAS = ["Encuadre", "Deriva", "Figuras", "Destellos", "Mecer", "Eco dub", "Paleta", "Master"];
var DEFAULTS = [0.0, 0.3, 0.35, 0.3, 0.3, 0.0, 0.0, 1.0];
var PADS = ["Negro", "Escena segura", "Flash", "Aislar figuras", "Modo tintas", "Mal registro", "Tap tempo", "Sig. paleta"];

var RAIZ = null;
var CANCIONES = [];
var PALETAS = [];
var MAPA = null;

var P = [];          // perillas: {v: valor suavizado, t: objetivo, pegado: bool, ultimo: número|null}
var actual = -1;     // canción cargada
var estado = null;   // estado de animación (ver reiniciarEstado)
var cache = {};      // últimos mensajes enviados por salida (evita repetir)
var aprender = null; // {paso, usados}
var reloj0 = (new Date()).getTime();
var tPrev = 0;

// ---------------------------------------------------------------- utilidades
function ahora() { return ((new Date()).getTime() - reloj0) / 1000; }
function lerp(a, b, x) { return a + (b - a) * x; }
function clamp(x, a, b) { return x < a ? a : (x > b ? b : x); }
function ruido(x) { // ruido suave −1..1 (suma de senos con frecuencias irracionales)
    return (Math.sin(x) + 0.6 * Math.sin(x * 1.618 + 1.3) + 0.3 * Math.sin(x * 2.718 + 0.7)) / 1.9;
}
function r4(x) { return Math.round(x * 10000) / 10000; }

function enviar(o, partes) {
    // envía solo si cambió respecto del último mensaje con la misma clave (salida + selector)
    var clave = o + ":" + partes[0] + (partes[0] === "v" || partes[0] === "m" ? ":" + partes[1] : "");
    var txt = partes.join(" ");
    if (cache[clave] === txt) return;
    cache[clave] = txt;
    outlet(o, partes);
}
function forzar(o, partes) { cache[o + ":" + partes[0] + ":" + partes[1]] = null; outlet(o, partes); }

function ui() { outlet(O_UI, Array.prototype.slice.call(arguments)); }
function status(txt) { ui("status", txt); }

function leerTexto(ruta) {
    var f = new File(ruta, "read");
    if (!f.isopen) return null;
    var partes = [];
    while (f.position < f.eof) {
        var s = f.readstring(4096);
        if (!s || s.length === 0) break;
        partes.push(s);
    }
    f.close();
    return partes.join("");
}
function leerJSON(rel) {
    var t = leerTexto(RAIZ + "/" + rel);
    if (t === null) { post("motor.js: no pude leer " + RAIZ + "/" + rel + "\n"); return null; }
    try { return JSON.parse(t); } catch (e) { post("motor.js: JSON inválido en " + rel + ": " + e + "\n"); return null; }
}
function escribirTexto(rel, texto) {
    var f = new File(RAIZ + "/" + rel, "write", "TEXT");
    if (!f.isopen) { post("motor.js: no pude escribir " + rel + "\n"); return false; }
    f.writestring(texto);
    f.eof = f.position;
    f.close();
    return true;
}

// ---------------------------------------------------------------- inicio
// OJO: al cargar el script Max aún no ha creado las salidas del objeto [js]; cualquier outlet()
// en código de nivel superior da "bad outlet index". Aquí solo se prepara el estado; la interfaz
// se sincroniza en init() (loadbang).
function reiniciarPerillas() {
    for (var k = 0; k < 8; k++) {
        var v = (P[k] && P[k].v !== undefined) ? P[k].v : DEFAULTS[k];
        P[k] = {v: v, t: DEFAULTS[k], pegado: false, ultimo: null};
    }
}
reiniciarPerillas();

function sincronizarDiales() {
    for (var k = 0; k < 8; k++) ui("dial", k, r4(P[k].t));
}

function reiniciarEstado() {
    estado = {
        negro: false, negroA: 0,
        tintas: false, tm: 0,
        aislar: false, aisA: 0, aislarHasta: 0,
        flashA: 0,
        registro: 0, rr: [],
        paleta: 0,
        bpm: 76, beat0: 0, taps: [],
        cambio: null, cambioA: 1,
        giro: [0, 0, 0, 0, 0, 0, 0, 0],
        pantalla: 0
    };
    for (var j = 0; j < N_TIN; j++) estado.rr.push([0, 0]);
}
reiniciarEstado();

function init() {
    if (RAIZ === null) {
        var fp = this.patcher ? this.patcher.filepath : "";
        if (!fp) { status("Guarda el patch dentro de patches/ del repo o manda 'raiz <ruta>'."); return; }
        var d = fp.substring(0, fp.lastIndexOf("/"));      // .../patches
        RAIZ = d.substring(0, d.lastIndexOf("/"));          // raíz del repo
    }
    var c = leerJSON("patches/canciones.json");
    var p = leerJSON("patches/paletas.json");
    var m = leerJSON("patches/lpd8_map.json");
    if (!c) { status("Falta patches/canciones.json (corre tools/motor_config.py)"); return; }
    CANCIONES = c.canciones;
    PALETAS = p ? p.alternas : [];
    MAPA = m;
    ui("menu", "clear");
    for (var i = 0; i < CANCIONES.length; i++) ui("menu", "append", (i + 1) + ". " + CANCIONES[i].titulo);
    sincronizarDiales();
    cache = {};
    actual = -1;
    estado.cambio = null;
    estado.cambioA = 1;
    cargar(0);
    post("motor.js: raíz " + RAIZ + " · " + CANCIONES.length + " canciones · " + PALETAS.length + " paletas\n");
}

function raiz(ruta) { RAIZ = ruta.replace(/\/$/, ""); init(); }

// ---------------------------------------------------------------- canciones
function cargar(i) {
    var s = CANCIONES[i];
    if (!s) return;
    for (var k = 0; k < N_ESC; k++) {
        if (k < s.escena.length) {
            forzar(k, ["m", "importmovie", RAIZ + "/" + s.escena[k].archivo]);
            forzar(k, ["m", "bang"]);
        } else {
            forzar(k, ["v", "enable", 0]);
        }
        estado.giro[k] = 0;
    }
    for (var j = 0; j < N_TIN; j++) {
        if (j < s.tintas.length) {
            forzar(N_ESC + j, ["m", "importmovie", RAIZ + "/" + s.tintas[j].archivo]);
            forzar(N_ESC + j, ["m", "bang"]);
        } else {
            forzar(N_ESC + j, ["v", "enable", 0]);
        }
    }
    actual = i;
    ui("menu", "set", i);
    informar();
}

function cancion(i) {
    i = Math.floor(i);
    if (i < 0 || i >= CANCIONES.length || i === actual) return;
    estado.cambio = {etapa: "sale", a: i};
}

// ---------------------------------------------------------------- perillas y pads
function perilla(k, val, desdeMidi) {
    var p = P[k];
    if (desdeMidi) {
        if (!p.pegado) {
            var cruzo = p.ultimo !== null && (p.ultimo - p.t) * (val - p.t) <= 0;
            if (Math.abs(val - p.t) < 0.06 || cruzo) p.pegado = true;
            p.ultimo = val;
            if (!p.pegado) { status("Perilla " + (k + 1) + " (" + PERILLAS[k] + "): gírala hasta " + Math.round(p.t * 100) + "% para tomarla"); return; }
            informar();
        }
        p.t = val;
        ui("dial", k, r4(val));
    } else {
        p.t = val;
        p.pegado = false;
    }
}

function pad(k, vel) {
    var on = vel > 0;
    var e = estado;
    switch (k) {
        case 0: if (on) { e.negro = !e.negro; ui("led", 0, e.negro ? 1 : 0); } break;
        case 1: if (on) escenaSegura(); break;
        case 2: if (on) e.flashA = Math.max(e.flashA, vel / 127); break;
        case 3: e.aislar = on; ui("led", 3, on ? 1 : 0); break;
        case 4: if (on) { e.tintas = !e.tintas; ui("led", 4, e.tintas ? 1 : 0); } break;
        case 5: if (on) golpeRegistro(vel / 127); break;
        case 6: if (on) tap(); break;
        case 7: if (on && PALETAS.length) { e.paleta = (e.paleta + 1) % PALETAS.length; } break;
    }
    if (on) informar();
}

function escenaSegura() {
    var e = estado;
    e.negro = false; e.tintas = false; e.aislar = false; e.registro = 0;
    for (var k = 0; k < 8; k++) { P[k].t = DEFAULTS[k]; P[k].pegado = false; P[k].ultimo = null; ui("dial", k, DEFAULTS[k]); }
    ui("led", 0, 0); ui("led", 3, 0); ui("led", 4, 0);
}

function golpeRegistro(fuerza) {
    estado.registro = Math.max(estado.registro, 0.4 + 0.6 * fuerza);
    for (var j = 0; j < N_TIN; j++) {
        var ang = Math.random() * Math.PI * 2;
        estado.rr[j] = [Math.cos(ang) * (j === 0 ? 0 : 1), Math.sin(ang) * (j === 0 ? 0 : 1)];
    }
}

function tap() {
    var t = ahora(), e = estado;
    if (e.taps.length && t - e.taps[e.taps.length - 1] > 2) e.taps = [];
    e.taps.push(t);
    if (e.taps.length > 5) e.taps.shift();
    if (e.taps.length >= 2) {
        var dur = (e.taps[e.taps.length - 1] - e.taps[0]) / (e.taps.length - 1);
        e.bpm = clamp(60 / dur, 50, 200);
    }
    e.beat0 = t;
}

// ---------------------------------------------------------------- MIDI
function coincide(c, tipo, num, canal) {
    return c && c.tipo === tipo && c.num === num && (c.canal === 0 || c.canal === canal);
}

function note(tono, vel, canal) {
    if (aprender) { aprenderMsg("note", tono, vel, canal); return; }
    if (!MAPA) return;
    for (var k = 0; k < 8; k++) if (coincide(MAPA.pads[k], "note", tono, canal)) pad(k, vel);
}

function cc(valor, num, canal) {
    if (aprender) { aprenderMsg("cc", num, valor, canal); return; }
    if (!MAPA) return;
    for (var k = 0; k < 8; k++) {
        if (coincide(MAPA.perillas[k], "cc", num, canal)) perilla(k, valor / 127, true);
        if (coincide(MAPA.pads[k], "cc", num, canal)) pad(k, valor);
    }
}

function dial(k, v) { if (P[k]) perilla(Math.floor(k), v, false); }

function uipad(k) {
    k = Math.floor(k);
    if (k === 3) { // con el mouse no se puede "mantener": aislar 2 s
        estado.aislarHasta = ahora() + 2;
        pad(3, 127);
        return;
    }
    pad(k, 127);
    if (k === 5 || k === 2) pad(k, 0);
}

function key(a) {
    if (a >= 49 && a <= 53) cancion(a - 49);
    else if (a === 48) pad(0, 127);
    else if (a === 32) pad(2, 127);
    else if (a === 116) pad(6, 127);
    else if (a === 102) { estado.pantalla = estado.pantalla ? 0 : 1; outlet(O_WORLD, "fullscreen", estado.pantalla); }
}

// ---------------------------------------------------------------- aprender LPD8
function aprenderMsg(tipo, num, valor, canal) {
    var a = aprender;
    if (valor === 0) return;
    var clave = tipo + num;
    if (a.usados[clave]) return;
    if (a.paso < 8) {
        a.nuevo.pads.push({tipo: tipo, num: num, canal: 0});
    } else {
        if (tipo !== "cc") return;
        a.nuevo.perillas.push({tipo: "cc", num: num, canal: 0});
    }
    a.usados[clave] = true;
    a.paso++;
    if (a.paso >= 16) {
        MAPA = a.nuevo;
        MAPA._nota = "Aprendido desde el patch. canal 0 = cualquiera. tipo: note | cc.";
        var ok = escribirTexto("patches/lpd8_map.json", JSON.stringify(MAPA, null, 1));
        aprender = null;
        status("LPD8 aprendido" + (ok ? " y guardado en patches/lpd8_map.json" : " (no se pudo guardar el archivo)"));
        return;
    }
    pedirSiguiente();
}
function pedirSiguiente() {
    var a = aprender;
    status(a.paso < 8 ? "APRENDER: toca el PAD " + (a.paso + 1) + " (" + PADS[a.paso] + ")"
                      : "APRENDER: gira la PERILLA " + (a.paso - 7) + " (" + PERILLAS[a.paso - 8] + ")");
}
function anything() {
    if (messagename === "aprender") {
        aprender = {paso: 0, usados: {}, nuevo: {pads: [], perillas: []}};
        pedirSiguiente();
    } else {
        post("motor.js: mensaje desconocido " + messagename + "\n");
    }
}

// ---------------------------------------------------------------- estado visible
function informar() {
    if (aprender || actual < 0) return;
    var e = estado;
    var pal = PALETAS.length ? PALETAS[e.paleta].nombre : "-";
    var sueltas = [];
    for (var k = 0; k < 8; k++) if (!P[k].pegado) sueltas.push(k + 1);
    status((actual + 1) + ". " + CANCIONES[actual].titulo +
           " | " + (e.tintas ? "TINTAS" : "escena") +
           " | paleta→" + pal +
           " | " + Math.round(e.bpm) + " bpm" +
           (e.negro ? " | NEGRO" : "") +
           (sueltas.length ? " | perillas por tomar: " + sueltas.join(",") : ""));
}

// ---------------------------------------------------------------- animación (un cuadro)
function bang() {
    if (actual < 0) return;
    var t = ahora();
    var dt = clamp(t - tPrev, 0, 0.1);
    tPrev = t;
    var e = estado;
    var k, j;

    for (k = 0; k < 8; k++) P[k].v += (P[k].t - P[k].v) * 0.18;
    var K = [];
    for (k = 0; k < 8; k++) K.push(P[k].v);

    // transiciones
    if (e.aislarHasta && t > e.aislarHasta) { e.aislarHasta = 0; pad(3, 0); }
    e.negroA += ((e.negro ? 1 : 0) - e.negroA) * clamp(dt * 6, 0, 1);
    e.tm += ((e.tintas ? 1 : 0) - e.tm) * clamp(dt * 4, 0, 1);
    e.aisA += ((e.aislar ? 1 : 0) - e.aisA) * clamp(dt * 5, 0, 1);
    e.flashA *= Math.exp(-dt / 0.12);
    e.registro *= Math.exp(-dt / 0.35);
    if (e.cambio) {
        if (e.cambio.etapa === "sale") {
            e.cambioA = Math.min(1, e.cambioA + dt / 0.25);
            if (e.cambioA >= 1) { cargar(e.cambio.a); e.cambio.etapa = "entra"; }
        } else {
            e.cambio = null;
        }
    } else {
        e.cambioA = Math.max(0, e.cambioA - dt / 0.4);
    }

    var beats = (t - e.beat0) * e.bpm / 60;
    var fBeat = beats - Math.floor(beats);
    var fCompas = beats / 4 - Math.floor(beats / 4);

    // encuadre (perilla 1): zoom 1 = arte completo; 1.78 = llena el ancho 16:9; paneo lento
    var zoom = 1 + 0.78 * K[0];
    var base = BASE * zoom;
    var panY = BASE * (zoom - 1) * 0.8 * Math.sin(2 * Math.PI * t / 45);
    var panX = 0.06 * K[0] * Math.sin(2 * Math.PI * t / 60);

    // paleta (perilla 7)
    var pal = PALETAS.length ? PALETAS[e.paleta] : null;
    var tono = pal ? [lerp(1, pal.tono[0], K[6]), lerp(1, pal.tono[1], K[6]), lerp(1, pal.tono[2], K[6])] : [1, 1, 1];

    var s = CANCIONES[actual];

    // --- capas de escena
    for (k = 0; k < s.escena.length && k < N_ESC; k++) {
        var c = s.escena[k];
        var seed = k * 7.31 + actual * 3.7;
        var du = 0, dv = 0, esc = 1, rot = 0, a = 1, br = 1;
        switch (c.mov) {
            case "parallax":
                var amp = 0.035 * K[1] * c.prof;
                du = amp * ruido(t * 0.11 + seed); dv = 0.6 * amp * ruido(t * 0.09 + seed * 2.3);
                if (k === 0) esc = 1 + 2 * amp; // el fondo llena el cuadro: sobre-escala para que la deriva no deje bordes
                break;
            case "flota":
                var af = 0.025 * K[2];
                dv = af * Math.sin(2 * Math.PI * t / 5.5 + seed); du = 0.5 * af * ruido(t * 0.13 + seed);
                rot = 2.0 * K[2] * ruido(t * 0.1 + seed * 1.7);
                break;
            case "respira":
                esc = 1 + 0.018 * K[2] * (0.5 - 0.5 * Math.cos(2 * Math.PI * fCompas));
                break;
            case "baila":
                rot = 3.0 * K[2] * Math.sin(2 * Math.PI * (beats / 2));
                esc = 1 + 0.01 * K[2] * Math.exp(-fBeat * 6);
                break;
            case "mece":
                rot = 2.5 * K[4] * Math.sin(2 * Math.PI * t / 6 + seed);
                break;
            case "gira":
                e.giro[k] += dt * 6 * K[4];
                rot = e.giro[k];
                break;
            case "titila":
                a = 1 - 0.7 * K[3] * (0.5 + 0.5 * ruido(t * 2.3 + seed));
                break;
            case "fuego":
                a = 1 - 0.35 * K[3] * (0.5 + 0.5 * ruido(t * 9 + seed));
                esc = 1 + 0.03 * K[3] * (0.5 + 0.5 * ruido(t * 7 + seed * 3));
                br = 1 + 0.15 * K[3] * ruido(t * 11 + seed);
                break;
        }
        if (!c.figura && k > 0) a *= 1 - 0.85 * e.aisA;
        if (!c.figura && k === 0) a *= 1 - 0.6 * e.aisA;
        a *= 1 - e.tm;
        aplicar(k, c.pivote, du, dv, esc, rot, base, panX, panY,
                [clamp(tono[0] * br, 0, 1), clamp(tono[1] * br, 0, 1), clamp(tono[2] * br, 0, 1)], a);
    }

    // --- capas de tintas
    for (j = 0; j < s.tintas.length && j < N_TIN; j++) {
        var ti = s.tintas[j];
        var col = ti.color;
        if (pal && pal.tintas[ti.tinta]) {
            var d = pal.tintas[ti.tinta];
            col = [lerp(col[0], d[0], K[6]), lerp(col[1], d[1], K[6]), lerp(col[2], d[2], K[6])];
        }
        var off = 0.025 * e.registro;
        var deriva = j === 0 ? 0 : 0.004 * K[1];
        var du2 = off * e.rr[j][0] + deriva * ruido(t * 0.5 + j * 2.1);
        var dv2 = off * e.rr[j][1] + deriva * ruido(t * 0.43 + j * 3.3);
        aplicar(N_ESC + j, [0, 0], du2, dv2, 1, 0, base, panX, panY, col, e.tm);
    }

    // --- eco dub (perilla 6): el cuadro anterior encima, un poco más grande
    var eco = K[5];
    if (eco > 0.01) {
        var ez = 1 + 0.015 * eco;
        enviar(O_ECO, ["enable", 1]);
        enviar(O_ECO, ["scale", r4(BASE * ASPECTO * ez), r4(BASE * ez), 1]);
        enviar(O_ECO, ["rotatexyz", 0, 0, r4(0.4 * eco * ruido(t * 0.2))]);
        enviar(O_ECO, ["color", 1, 1, 1, r4(0.92 * eco)]);
    } else {
        enviar(O_ECO, ["enable", 0]);
    }

    // --- marco: barras negras a los lados del arte cuadrado (tapan lo que se asome al mover capas)
    enviar(O_MARCO_I, ["position", r4(panX - base - 2), 0, 0]);
    enviar(O_MARCO_D, ["position", r4(panX + base + 2), 0, 0]);

    // --- flash y negro (master = perilla 8)
    enviar(O_FLASH, ["color", 1, 1, 1, r4(e.flashA)]);
    var negro = Math.max(e.negroA, 1 - K[7], e.cambioA);
    enviar(O_NEGRO, ["color", 0, 0, 0, r4(clamp(negro, 0, 1))]);
}

function aplicar(o, piv, du, dv, esc, rot, base, panX, panY, col, a) {
    if (a < 0.002) { enviar(o, ["v", "enable", 0]); return; }
    enviar(o, ["v", "enable", 1]);
    var th = rot * Math.PI / 180;
    var pu = piv[0], pv = piv[1];
    var rpu = pu * Math.cos(th) - pv * Math.sin(th);
    var rpv = pu * Math.sin(th) + pv * Math.cos(th);
    var cx = panX + base * (du + pu - esc * rpu);
    var cy = panY + base * (dv + pv - esc * rpv);
    enviar(o, ["v", "position", r4(cx), r4(cy), 0]);
    enviar(o, ["v", "scale", r4(base * esc), r4(base * esc), 1]);
    enviar(o, ["v", "rotatexyz", 0, 0, r4(rot)]);
    enviar(o, ["v", "color", r4(col[0]), r4(col[1]), r4(col[2]), r4(clamp(a, 0, 1))]);
}
