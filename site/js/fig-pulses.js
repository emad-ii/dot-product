// §2.4 Two opposite pulses at r and 2r. The reflected form K(2r) - 2K(3r) + K(4r),
// divided by r^2 and by K(0) m^2, for the degree-one precision (x + m^2) and the squared
// one (x + m^2)^2, at transverse momentum k = 0 so omega = m.

const { onScales, onTheme, el, text, clear, pathFrom } = window.DP;
const svg = document.getElementById('pulse-svg');
if (svg) {
  let m = 1;
  const W = 720;
  const H = 300;
  const pad = { l: 56, r: 150, t: 20, b: 40 };
  const R = 4;
  const Y = 1.3;
  const k1 = (w, r) => Math.exp(-w * r);
  const k2 = (w, r) => (1 + w * r) * Math.exp(-w * r);
  const form = (k, w, r) => (k(w, 2 * r) - 2 * k(w, 3 * r) + k(w, 4 * r)) / (r * r * w * w);

  function draw() {
    clear(svg);
    const x = (r) => pad.l + (r / R) * (W - pad.l - pad.r);
    const y = (v) => pad.t + ((Y - v) / (2 * Y)) * (H - pad.t - pad.b);
    for (const v of [-1, 0, 1]) {
      el('line', { x1: pad.l, x2: W - pad.r, y1: y(v), y2: y(v), class: v === 0 ? 'axis' : 'grid' }, svg);
      text(svg, pad.l - 8, y(v) + 4, v === 0 ? '0' : `${v > 0 ? '' : '−'}${Math.abs(v)}`, { class: 'lbl', 'text-anchor': 'end' });
    }
    for (let r = 0; r <= R; r += 1) text(svg, x(r), H - pad.b + 18, String(r), { class: 'lbl', 'text-anchor': 'middle' });
    text(svg, W - pad.r, H - 6, 'pulse position r', { class: 'lbl', 'text-anchor': 'end' });
    text(svg, pad.l, 12, 'reflected form ÷ r²K(0)m²', { class: 'lbl' });
    // shade the forbidden half: the reflected test requires a nonnegative form
    el('rect', { x: pad.l, y: y(0), width: W - pad.l - pad.r, height: y(-Y) - y(0), fill: 'var(--hair)', opacity: 0.5 }, svg);
    text(svg, W - pad.r - 6, y(-Y) - 8, 'fails the reflected test', { class: 'lbl', 'text-anchor': 'end' });

    const pts1 = [];
    const pts2 = [];
    for (let i = 1; i <= 240; i += 1) {
      const r = (i / 240) * R;
      pts1.push([x(r), y(form(k1, m, r))]);
      pts2.push([x(r), y(form(k2, m, r))]);
    }
    el('path', { d: pathFrom(pts1), class: 'ln' }, svg);
    el('path', { d: pathFrom(pts2), class: 'ln-2' }, svg);
    const end1 = pts1[pts1.length - 1];
    const end2 = pts2[pts2.length - 1];
    const lab = (p, dy, s, cls) => {
      el('line', { x1: p[0] + 4, x2: p[0] + 22, y1: p[1] + dy - 4, y2: p[1] + dy - 4, class: cls }, svg);
      text(svg, p[0] + 28, p[1] + dy, s, { class: 'lbl-ink' });
    };
    lab(end1, -6, 'degree one', 'ln');
    lab(end2, 14, 'degree two', 'ln-2');
    const minV = Math.min(...pts2.map((p) => p[1]));
    svg.setAttribute('aria-label', `At m = ${m.toFixed(2)}, degree one stays at or above zero; degree two dips below zero for small r, to ${(-1).toFixed(0)} in these units at r = 0.`);
    void minV;
  }
  onScales((s) => { m = s.m; draw(); });
  onTheme(draw);
}
