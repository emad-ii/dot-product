// §3.2 The shift e^{-s omega} continues into Re z > 0 as e^{-z omega}. Left: the ray of z at
// the chosen direction. Right: the values e^{-z omega} along that ray, in the unit disk.
// Along the real axis they slide to 0 (decay); along the imaginary axis they turn on the
// unit circle (a pure phase: unitary time).

const { onScales, onTheme, el, text, clear, pathFrom } = window.DP;
const svg = document.getElementById('cont-svg');
if (svg) {
  const input = document.getElementById('cont-angle');
  const out = document.getElementById('cont-out');
  let psi = 0;
  let m = 1;
  const ZMAX = 4;

  function draw() {
    clear(svg);
    // left panel: the quarter plane Re z >= 0, Im z >= 0
    const L = { x0: 60, y0: 220, s: 42 };
    el('rect', { x: L.x0, y: L.y0 - ZMAX * L.s, width: ZMAX * L.s, height: ZMAX * L.s, fill: 'var(--paper)' }, svg);
    el('line', { x1: L.x0, y1: L.y0, x2: L.x0 + ZMAX * L.s + 14, y2: L.y0, class: 'axis' }, svg);
    el('line', { x1: L.x0, y1: L.y0, x2: L.x0, y2: L.y0 - ZMAX * L.s - 14, class: 'axis' }, svg);
    text(svg, L.x0 + ZMAX * L.s + 16, L.y0 + 4, 'Re z = s', { class: 'lbl' });
    text(svg, L.x0 - 6, L.y0 - ZMAX * L.s - 20, 'Im z = t', { class: 'lbl' });
    const end = [L.x0 + ZMAX * L.s * Math.cos(psi), L.y0 - ZMAX * L.s * Math.sin(psi)];
    el('line', { x1: L.x0, y1: L.y0, x2: end[0], y2: end[1], class: 'ln' }, svg);
    el('circle', { cx: end[0], cy: end[1], r: 4.5, fill: 'var(--steel)' }, svg);
    text(svg, L.x0, L.y0 + 24, 'z along one direction', { class: 'lbl' });

    // right panel: the unit disk and the image curve
    const Rp = { cx: 520, cy: 128, r: 100 };
    el('circle', { cx: Rp.cx, cy: Rp.cy, r: Rp.r, fill: 'var(--paper)', class: 'axis' }, svg);
    el('line', { x1: Rp.cx - Rp.r - 10, x2: Rp.cx + Rp.r + 10, y1: Rp.cy, y2: Rp.cy, class: 'grid' }, svg);
    el('line', { x1: Rp.cx, x2: Rp.cx, y1: Rp.cy - Rp.r - 10, y2: Rp.cy + Rp.r + 10, class: 'grid' }, svg);
    text(svg, Rp.cx + Rp.r + 6, Rp.cy - 6, '1', { class: 'lbl' });
    const pts = [];
    for (let i = 0; i <= 400; i += 1) {
      const rho = (i / 400) * ZMAX;
      const s = rho * Math.cos(psi);
      const t = rho * Math.sin(psi);
      const mod = Math.exp(-m * s);
      const arg = -m * t;
      pts.push([Rp.cx + Rp.r * mod * Math.cos(arg), Rp.cy - Rp.r * mod * Math.sin(arg)]);
    }
    el('path', { d: pathFrom(pts), class: 'ln' }, svg);
    el('circle', { cx: pts[0][0], cy: pts[0][1], r: 4.5, fill: 'var(--steel)' }, svg);
    text(svg, pts[0][0] + 8, pts[0][1] + 16, 'z = 0', { class: 'lbl' });
    const deg = Math.round((psi * 180) / Math.PI);
    const say = deg === 0 ? 'decay: a contraction' : deg === 90 ? 'a pure phase: unitary' : 'decay and turning';
    text(svg, Rp.cx - Rp.r, Rp.cy + Rp.r + 26, `e^(−zω) with ω = m: ${say}`, { class: 'lbl' });
    svg.setAttribute('aria-label', `Direction ${deg} degrees: the values of e to the minus z omega show ${say}.`);
  }
  input.addEventListener('input', () => {
    psi = (Number(input.value) * Math.PI) / 180;
    out.textContent = `${input.value}°`;
    draw();
  });
  onScales((s) => { m = s.m; draw(); });
  onTheme(draw);
}
