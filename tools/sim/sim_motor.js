// Simulador mínimo del entorno js de Max para probar motor.js
const fs = require('fs'), vm = require('vm');
const raiz = process.argv[2];
const salidas = [];
class File {
  constructor(p, mode) { this.p = p; this.mode = mode; this.isopen = true; this.position = 0;
    if (mode === 'read') { try { this.buf = fs.readFileSync(p, 'latin1'); } catch (e) { this.isopen = false; } this.eof = this.buf ? this.buf.length : 0; }
    else { this.out = ''; this.eof = 0; } }
  readstring(n) { const s = this.buf.substr(this.position, n); this.position += s.length; return s; }
  writestring(s) { this.out += s; this.position += s.length; }
  close() { if (this.mode === 'write') fs.writeFileSync(this.p + '.test', this.out); }
}
const ctx = { File, post: (s) => process.stdout.write('[post] ' + s), outlet: (o, ...a) => salidas.push([o].concat(a.flat())),
  patcher: { filepath: raiz + '/patches/ser_gentil_motor.maxpat' }, Date, Math, JSON, messagename: '' };
ctx.this = ctx;
vm.createContext(ctx);
vm.runInContext(fs.readFileSync(raiz + '/patches/motor.js', 'utf8'), ctx);
const call = (name, ...args) => { ctx.messagename = name; (ctx[name] || ctx.anything).apply(ctx, args); };
const fr = (n) => { for (let i = 0; i < n; i++) call('bang'); };
const malos = () => salidas.filter(s => s.some(x => typeof x === 'number' && !isFinite(x)));
const ultimo = (o, sel) => { for (let i = salidas.length - 1; i >= 0; i--) { const s = salidas[i]; if (s[0] === o && (s[1] === sel || s[2] === sel)) return s; } };
call('init');
console.log('menú:', salidas.filter(s => s[0] === 16 && s[1] === 'menu').map(s => s.slice(2).join(' ')).join(' | '));
console.log('cargas 1a canción:', salidas.filter(s => s[2] === 'importmovie').length, ultimo(0, 'importmovie').slice(3).join(' ').replace(raiz, '<raiz>'));
// simular 2 s a 60 fps con tiempo falso
let T = 0; ctx.Date = class { getTime() { return T; } }; 
vm.runInContext('reloj0 = 0; tPrev = 0;', ctx);
const correr = (seg) => { for (let i = 0; i < seg * 60; i++) { T += 1000 / 60; call('bang'); } };
correr(2);
console.log('negro tras entrada:', ultimo(15, 'color').slice(2).join(' '));
console.log('capa 6 (mujer):', ['position', 'scale', 'color'].map(s => ultimo(5, s).slice(3).join(' ')).join(' · '));
// perilla 3 (Figuras) por MIDI: CC 72; arranca suelta (soft takeover)
call('cc', 127, 72, 1); console.log('status:', ultimo(16, 'status').slice(2).join(' '));
call('cc', 40, 72, 1); call('cc', 45, 72, 1); call('cc', 127, 72, 1);
correr(1); console.log('Figuras =', vm.runInContext('P[2].v.toFixed(3)', ctx));
// pads: negro, tintas, flash, tap tempo
call('note', 36, 100, 1); correr(1); console.log('negro on:', ultimo(15, 'color').slice(2).join(' '));
call('note', 36, 100, 1); correr(1);
call('note', 40, 100, 1); correr(1.5); console.log('tintas on: escena0', ultimo(0, 'enable').slice(3).join(' '), '· tinta0', ultimo(8, 'color').slice(3).join(' '));
call('note', 43, 100, 1); call('cc', 0, 76, 1); call('cc', 127, 76, 1); correr(1); console.log('paleta →', ultimo(9, 'color').slice(3).join(' '));
call('note', 38, 127, 1); call('bang'); console.log('flash:', ultimo(14, 'color').slice(2).join(' '));
for (let i = 0; i < 4; i++) { call('note', 42, 100, 1); T += 750; } console.log('bpm:', vm.runInContext('estado.bpm.toFixed(1)', ctx));
call('note', 37, 100, 1); correr(1); console.log('escena segura → tintas:', vm.runInContext('estado.tintas', ctx));
// cambio de canción y recorrido por todas
for (let i = 1; i < 5; i++) { call('cancion', i); correr(1.2); console.log('canción', i + 1, '→ actual', vm.runInContext('actual', ctx), '| slots escena activos:', [0,1,2,3,4,5,6,7].filter(k => (ultimo(k, 'enable') || [0,0,0,0])[3] === 1).length); }
// eco
call('dial', 5, 0.8); correr(1); console.log('eco:', ultimo(13, 'color').slice(1).join(' '), ultimo(13, 'scale').slice(1).join(' '));
// aprender
call('aprender'); for (let i = 0; i < 8; i++) call('note', 60 + i, 90, 2); for (let i = 0; i < 8; i++) { call('cc', 10, 20 + i, 2); call('cc', 11, 20 + i, 2); }
console.log('aprender:', ultimo(16, 'status').slice(2).join(' '), '| archivo:', fs.existsSync(raiz + '/patches/lpd8_map.json.test'));
console.log('mensajes con NaN/Inf:', malos().length, '| total mensajes:', salidas.length);
