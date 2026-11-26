// §3.5 The doubling argument. A candidate weight f(x) = x + d(x) with a defect
// d(x) = b sin(2 pi x), which already respects f(1) = 1 and d(1 - x) = -d(x).
// Additivity demands d(2x) = 2 d(x) for x <= 1/2; at the extreme point x* that would put
// d above its own largest value. Only b = 0 survives.

const { onTheme, el, text, clear, pathFrom } = window.DP;
const svg = document.getElementById('born-svg');
if (svg) {
  const input = document.getElementById('born-bend');
  const out = document.getElementById('born-out');
  let b = Number(input.value);
  const d = (x) => b * Math.sin(2 * Math.PI * x);

  function panel(x0, y0, w, h, ymin, ymax) {
    return { x: (u) => x0 + u * w, y: (v) => y0 + ((ymax - v) / (ymax - ymin)) * h, x0, y0, w, h };
  }
  function draw() {
    clear(svg);
    // left: f against the diagonal
    const A = panel(40, 30, 230, 230, -0.05, 1.05);
    el('rect', { x: A.x0, y: A.y0, width: A.w, height: A.h, fill: 'var(--paper)' }, svg);
    el('path', { d: pathFrom([[A.x(0), A.y(0)], [A.x(1), A.y(1)]]), class: 'ln-mute' }, svg);
    const fpts = [];
    for (let i = 0; i <= 200; i += 1) { const u = i / 200; fpts.push([A.x(u), A.y(u + d(u))]); }
    el('path', { d: pathFrom(fpts), class: 'ln' }, svg);
    text(svg, A.x0, A.y0 - 10, 'a candidate weight f', { class: 'lbl' });
    text(svg, A.x(1) - 4, A.y(1) + 18, 'f(x) = x', { class: 'lbl', 'text-anchor': 'end' });
    text(svg, A.x(0), A.y0 + A.h + 18, '0', { class: 'lbl', 'text-anchor': 'middle' });
    text(svg, A.x(1), A.y0 + A.h + 18, '1', { class: 'lbl', 'text-anchor': 'middle' });

    // right: the defect d, its extreme M and what doubling demands
    const ab = Math.max(Math.abs(b), 0.02);
    const B = panel(360, 30, 285, 230, -2.3 * ab, 2.3 * ab);
    el('rect', { x: B.x0, y: B.y0, width: B.w, height: B.h, fill: 'var(--paper)' }, svg);
    el('line', { x1: B.x(0), x2: B.x(1), y1: B.y(0), y2: B.y(0), class: 'axis' }, svg);
    const dpts = [];
    for (let i = 0; i <= 200; i += 1) { const u = i / 200; dpts.push([B.x(u), B.y(d(u))]); }
    el('path', { d: pathFrom(dpts), class: 'ln' }, svg);
    text(svg, B.x0, B.y0 - 10, 'its defect d = f − x', { class: 'lbl' });
    if (Math.abs(b) < 0.005) {
      text(svg, B.x(0.5), B.y(0) - 14, 'd = 0: the only weight that survives', { class: 'lbl-ink', 'text-anchor': 'middle' });
      svg.setAttribute('aria-label', 'With no bend, f is the diagonal f(x) = x: the Born rule.');
      return;
    }
    const sign = Math.sign(b);
    const xs = 0.25; // where |d| is largest on [0, 1/2]
    const M = d(xs);
    el('line', { x1: B.x(0), x2: B.x(1), y1: B.y(M), y2: B.y(M), class: 'grid' }, svg);
    el('line', { x1: B.x(0), x2: B.x(1), y1: B.y(2 * M), y2: B.y(2 * M), class: 'ln-2', 'stroke-dasharray': '5 4' }, svg);
    text(svg, B.x(1) + 6, B.y(M) + 4, sign > 0 ? 'M = sup d' : 'inf d', { class: 'lbl' });
    text(svg, B.x(1) + 6, B.y(2 * M) + 4, sign > 0 ? '2M' : '2 inf d', { class: 'lbl' });
    el('circle', { cx: B.x(xs), cy: B.y(M), r: 5, fill: 'var(--steel)' }, svg);
    text(svg, B.x(xs), B.y(0) + (sign > 0 ? 16 : -8), 'x*', { class: 'lbl-ink', 'text-anchor': 'middle' });
    // doubling demands d(2x*) = 2 d(x*)
    el('circle', { cx: B.x(2 * xs), cy: B.y(2 * M), r: 5, fill: 'var(--wash)', stroke: 'var(--curve-2)', 'stroke-width': 2 }, svg);
    el('path', { d: `M${B.x(xs) + 6},${B.y(M)} Q${B.x(0.38)},${B.y(2.25 * M)} ${B.x(2 * xs) - 7},${B.y(2 * M)}`, class: 'ln-2', 'stroke-width': 1.4 }, svg);
    text(svg, B.x(0.5), B.y(0) + (sign > 0 ? 34 : -26), 'doubling demands d(2x*) = 2d(x*)', { class: 'lbl-ink', 'text-anchor': 'middle' });
    svg.setAttribute('aria-label', `Bend ${b.toFixed(2)}: doubling would need the defect to reach ${(2 * M).toFixed(2)}, beyond its extreme ${M.toFixed(2)}, a contradiction.`);
  }
  input.addEventListener('input', () => { b = Number(input.value); out.textContent = b.toFixed(2); draw(); });
  draw();
  onTheme(draw);
}
