// §3.2 Energy against momentum. One particle: E = sqrt(p^2 + M^2) with M = hbar m.
// Many particles fill the region above sqrt(P^2 + 4M^2). Everything lies inside the
// forward cone E >= |p|, and nothing lies between the vacuum and M.

const { onScales, onTheme, el, text, clear, pathFrom } = window.DP;
const svg = document.getElementById('energy-svg');
if (svg) {
  let M = 1;
  const W = 720;
  const H = 320;
  const pad = { l: 56, r: 170, t: 16, b: 36 };
  const P = 5;
  const E = 8;
  function draw() {
    clear(svg);
    const x = (p) => pad.l + ((p + P) / (2 * P)) * (W - pad.l - pad.r);
    const y = (e) => H - pad.b - (Math.min(e, E + 0.4) / E) * (H - pad.t - pad.b);
    const curve = (f, clip) => {
      const pts = [];
      for (let i = 0; i <= 600; i += 1) {
        const p = -P + (2 * P * i) / 600;
        const e = f(p);
        if (clip && e > E) continue;
        pts.push([x(p), y(e)]);
      }
      return pts;
    };
    // two-particle continuum, shaded
    const lower = curve((p) => Math.sqrt(p * p + 4 * M * M));
    el('path', { d: `${pathFrom(lower)}L${x(P)},${y(E)}L${x(-P)},${y(E)}Z`, fill: 'var(--paper)', stroke: 'none' }, svg);
    el('path', { d: pathFrom(lower), class: 'axis', 'stroke-dasharray': '2 3' }, svg);
    // axes and the light cone
    el('line', { x1: x(-P), x2: x(P), y1: y(0), y2: y(0), class: 'axis' }, svg);
    el('line', { x1: x(0), x2: x(0), y1: y(0), y2: y(E), class: 'axis' }, svg);
    el('path', { d: pathFrom(curve((p) => Math.abs(p))), class: 'ln-mute' }, svg);
    // the Schrodinger approximation and the exact one-particle shell
    el('path', { d: pathFrom(curve((p) => M + (p * p) / (2 * M), true)), class: 'ln-2', 'stroke-dasharray': '6 4' }, svg);
    el('path', { d: pathFrom(curve((p) => Math.sqrt(p * p + M * M), true)), class: 'ln' }, svg);
    // the vacuum and the gap
    el('circle', { cx: x(0), cy: y(0), r: 5, fill: 'var(--steel)', stroke: 'var(--wash)', 'stroke-width': 2 }, svg);
    if (M <= E) {
      el('line', { x1: x(0) - 14, x2: x(0) - 14, y1: y(0) - 2, y2: y(M) + 2, stroke: 'var(--steel)', 'stroke-width': 1.5 }, svg);
      text(svg, x(0) - 20, (y(0) + y(M)) / 2 + 4, 'gap ħm', { class: 'lbl-ink', 'text-anchor': 'end' });
    }
    text(svg, x(0) + 10, y(0) + 16, 'vacuum', { class: 'lbl' });
    for (const e of [0, 2, 4, 6, 8]) text(svg, pad.l - 8, y(e) + 4, String(e), { class: 'lbl', 'text-anchor': 'end' });
    text(svg, x(P), H - 8, 'momentum p', { class: 'lbl', 'text-anchor': 'end' });
    text(svg, pad.l, 12, 'energy E', { class: 'lbl' });
    // legend, keyed by line
    const lx = W - pad.r + 18;
    const key = (yy, cls, dash, label) => {
      el('line', { x1: lx, x2: lx + 24, y1: yy - 4, y2: yy - 4, class: cls, ...(dash ? { 'stroke-dasharray': dash } : {}) }, svg);
      text(svg, lx + 32, yy, label, { class: 'lbl-ink' });
    };
    key(40, 'ln', null, 'one particle');
    key(64, 'ln-2', '6 4', 'M + p²/2M');
    key(88, 'axis', '2 3', 'two particles from');
    key(112, 'ln-mute', null, 'light cone E = |p|');
    svg.setAttribute('aria-label', `Rest mass M = hbar m = ${M.toFixed(2)}: the one-particle shell starts at ${M.toFixed(2)}, the two-particle continuum at ${(2 * M).toFixed(2)}, and nothing lies between the vacuum and M.`);
  }
  onScales((s) => { M = s.hbar * s.m; draw(); });
  onTheme(draw);
}
