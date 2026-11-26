// §1 The proof map: the paper's Figure 1, drawn from the same coordinates as its TikZ
// source. Each box is a link to the step it names.

const { el, text } = window.DP;
const svg = document.querySelector('svg.proofmap');
if (svg) {
  const X = (x) => 10 + x * 58.75;
  const Y = (y) => 10 + (5.12 - y) * 60;
  const CHAR = 6.7;

  const bands = [
    [4.46, 5.12, '1  The axiom'],
    [2.38, 4.32, '2  The law and the operator'],
    [0.62, 2.24, '3  The quantum structure'],
    [-0.06, 0.5, '4  The axioms'],
  ];
  const nodes = {
    axiom: { x: 9.25, y: 4.79, label: 'Axiom: one dot product g', to: 's1', top: true, w: 12.6 },
    loc: { x: 4.3, y: 3.84, label: 'Local law, −Δ + m²  §2.3', to: 's2-3' },
    rp: { x: 9.65, y: 3.84, label: 'Reflection positivity  §2.3', to: 's2-3' },
    pyth: { x: 14.15, y: 3.84, label: 'Pythagoras  §2.1', to: 's2-1' },
    op: { x: 4.85, y: 2.74, label: 'Higher local degrees excluded  §2.4', to: 's2-4', dashed: true },
    gauss: { x: 11.45, y: 2.74, label: 'Gaussian law  §2.2', to: 's2-2' },
    fock: { x: 8.25, y: 1.82, label: 'Unique state space (Fock)  §3.1', to: 's3-1' },
    born: { x: 14.15, y: 1.82, label: 'Born rule  §3.5', to: 's3-5' },
    evol: { x: 4.85, y: 0.96, label: 'Evolution, relativity  §3.2, 3.3', to: 's3-2' },
    tens: { x: 9.75, y: 0.96, label: 'Tensor product  §3.4', to: 's3-4' },
    proj: { x: 14.15, y: 0.96, label: 'Projection update  §3.6', to: 's3-6' },
    ax: { x: 9.25, y: 0.22, label: 'von Neumann and Wightman axioms  Table 1', to: 's4', top: true, w: 12.6 },
  };
  const H = 24;
  for (const n of Object.values(nodes)) {
    n.cx = X(n.x);
    n.cy = Y(n.y);
    n.hw = n.w ? (n.w * 58.75) / 2 : (n.label.length * CHAR) / 2 + 10;
  }
  const S = (n, dx = 0) => [n.cx + dx * 58.75, n.cy + H / 2];
  const N = (n, dx = 0) => [n.cx + dx * 58.75, n.cy - H / 2];
  const E = (n) => [n.cx + n.hw, n.cy];
  const Wt = (n) => [n.cx - n.hw, n.cy];

  // arrowhead
  const defs = el('defs', {}, svg);
  const marker = el('marker', { id: 'pm-arrow', viewBox: '0 0 10 10', refX: 9, refY: 5, markerWidth: 7, markerHeight: 7, orient: 'auto-start-reverse' }, defs);
  el('path', { d: 'M0,1 L10,5 L0,9 Z', class: 'pm-head' }, marker);

  for (const [y0, y1, name] of bands) {
    el('rect', { x: X(0), y: Y(y1), width: X(16) - X(0), height: Y(y0) - Y(y1), rx: 4, fill: 'var(--paper)', opacity: 0.85 }, svg);
    const words = name.split('  ');
    text(svg, X(0.14), (Y(y0) + Y(y1)) / 2 + 4, words.join('  '), { class: 'pm-band' });
  }

  const arrows = [
    [S(nodes.axiom, -4.95), N(nodes.loc), 'maximum entropy', 'left'],
    [S(nodes.axiom, 4.9), N(nodes.pyth), 'sum rule, product rule', 'left'],
    [E(nodes.loc), Wt(nodes.rp), 'product rule', 'above'],
    [S(nodes.rp, -0.85), N(nodes.op, 1.25), 'two pulses', 'left', true],
    [S(nodes.pyth, -0.75), N(nodes.gauss, 0.65), 'product rule, equal values', 'left'],
    [S(nodes.rp, -0.2), N(nodes.fock, 0.15), 'reflection', 'left'],
    [S(nodes.gauss, -0.75), N(nodes.fock, 1.15), '', ''],
    [S(nodes.pyth), N(nodes.born), 'sum rule, equal values', 'right'],
    [E(nodes.fock), Wt(nodes.born), 'dim = ∞', 'above'],
    [S(nodes.fock, -1.1), N(nodes.evol, 1.55), 'continuation', 'left'],
    [S(nodes.fock, 0.75), N(nodes.tens, -0.35), 'product rule', 'right'],
    [S(nodes.born), N(nodes.proj), 'product rule', 'right'],
  ];
  for (const [a, b, label, where, dashed] of arrows) {
    el('line', { x1: a[0], y1: a[1], x2: b[0], y2: b[1], class: `pm-arrow${dashed ? ' pm-dash' : ''}`, 'marker-end': 'url(#pm-arrow)' }, svg);
    if (!label) continue;
    const mx = (a[0] + b[0]) / 2;
    const my = (a[1] + b[1]) / 2;
    if (where === 'above') text(svg, mx, my - 6, label, { class: 'pm-rule', 'text-anchor': 'middle' });
    else if (where === 'left') text(svg, mx - 8, my + 4, label, { class: 'pm-rule', 'text-anchor': 'end' });
    else text(svg, mx + 8, my + 4, label, { class: 'pm-rule' });
  }

  for (const n of Object.values(nodes)) {
    const g = el('a', { href: `#${n.to}`, class: 'pm-node' }, svg);
    el('rect', { x: n.cx - n.hw, y: n.cy - H / 2, width: 2 * n.hw, height: H, rx: 4, class: n.top ? 'pm-top' : 'pm-box', ...(n.dashed ? { 'stroke-dasharray': '4 3' } : {}) }, g);
    text(g, n.cx, n.cy + 4.5, n.label, { class: 'pm-text', 'text-anchor': 'middle', 'font-weight': n.top ? 700 : 400 });
  }
}
