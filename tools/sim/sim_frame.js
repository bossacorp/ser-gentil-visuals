// Corre el motor hasta un instante y vuelca el estado de cada slot en JSON (para render de prueba)
const fs = require('fs'), vm = require('vm');
const [raiz, cancion, segs, perillasJSON, extra] = process.argv.slice(2);
const salidas = []; let cargando = true;
class File { constructor(p, m) { this.isopen = true; this.position = 0; this.buf = fs.readFileSync(p, 'latin1'); this.eof = this.buf.length; }
  readstring(n) { const s = this.buf.substr(this.position, n); this.position += s.length; return s; } close() {} }
let T = 0;
const ctx = { File, post: () => {}, outlet: (o, ...a) => { if (cargando) { console.error('js: bad outlet index ' + o); return; } salidas.push([o].concat(a.flat())); },
  patcher: { filepath: raiz + '/patches/x.maxpat' }, Date: class { getTime() { return T; } }, Math, JSON, messagename: '' };
vm.createContext(ctx); vm.runInContext(fs.readFileSync(raiz + '/patches/motor.js', 'utf8'), ctx); cargando = false;
const call = (n, ...a) => { ctx.messagename = n; (ctx[n] || ctx.anything).apply(ctx, a); };
call('init'); call('cancion', +cancion);
JSON.parse(perillasJSON).forEach((v, k) => call('dial', k, v));
(extra || '').split(',').filter(Boolean).forEach(p => call('note', 36 + (+p), 100, 1));
for (let i = 0; i < segs * 60; i++) { T += 1000 / 60; call('bang'); }
const est = {};
for (const s of salidas) { const o = s[0]; est[o] = est[o] || {};
  if (s[1] === 'v') est[o][s[2]] = s.slice(3); else if (s[1] === 'm' && s[2] === 'importmovie') est[o].archivo = s[3]; else if (o >= 13) est[o][s[1]] = s.slice(2); }
console.log(JSON.stringify(est));
