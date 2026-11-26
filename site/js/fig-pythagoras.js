// Hero: a right triangle on a fixed hypotenuse. The right-angle corner moves on the
// semicircle (Thales), so the angle stays right while the legs change; the squares on the
// legs always add to the square on the hypotenuse.

const { el, text, clear } = window.DP;
const svg = document.querySelector('svg.pyth');
if (svg) {
  svg.setAttribute('viewBox', '0 0 520 380');
  const A = [185, 212];
  const B = [335, 212];
  const mid = [(A[0] + B[0]) / 2, A[1]];
  const R = (B[0] - A[0]) / 2;
  let phi = (62 * Math.PI) / 180; // angle of the corner on the semicircle, from B's side

  const corner = () => [mid[0] + R * Math.cos(phi), mid[1] - R * Math.sin(phi)];

  // square on segment P->Q, on the side away from point O
  function square(P, Q, O) {
    const dx = Q[0] - P[0];
    const dy = Q[1] - P[1];
    let nx = -dy;
    let ny = dx;
    const side = (O[0] - P[0]) * nx + (O[1] - P[1]) * ny;
    if (side > 0) { nx = -nx; ny = -ny; }
    const P2 = [P[0] + nx, P[1] + ny];
    const Q2 = [Q[0] + nx, Q[1] + ny];
    const centre = [(P[0] + Q[0] + P2[0] + Q2[0]) / 4, (P[1] + Q[1] + P2[1] + Q2[1]) / 4];
    return { pts: [P, Q, Q2, P2], centre };
  }
  const poly = (pts) => pts.map((p) => p.map((v) => v.toFixed(1)).join(',')).join(' ');

  function draw() {
    clear(svg);
    const C = corner();
    const c2 = 1;
    const a2 = ((C[0] - B[0]) ** 2 + (C[1] - B[1]) ** 2) / (2 * R) ** 2; // leg opposite A
    const b2 = 1 - a2;
    const sqA = square(B, C, A);
    const sqB = square(C, A, B);
    const sqC = square(A, B, C);
    el('polygon', { points: poly(sqC.pts), class: 'sq-big' }, svg);
    el('polygon', { points: poly(sqA.pts), class: 'sq' }, svg);
    el('polygon', { points: poly(sqB.pts), class: 'sq' }, svg);
    el('polygon', { points: poly([A, B, C]), class: 'tri' }, svg);
    // right-angle mark
    const u = [(A[0] - C[0]), (A[1] - C[1])];
    const v = [(B[0] - C[0]), (B[1] - C[1])];
    const nu = Math.hypot(...u);
    const nv = Math.hypot(...v);
    const k = 11;
    const p1 = [C[0] + (u[0] / nu) * k, C[1] + (u[1] / nu) * k];
    const p3 = [C[0] + (v[0] / nv) * k, C[1] + (v[1] / nv) * k];
    const p2 = [p1[0] + (v[0] / nv) * k, p1[1] + (v[1] / nv) * k];
    el('polyline', { points: poly([p1, p2, p3]), class: 'axis', 'stroke-width': 1.2 }, svg);

    const label = (sq, name, value, big) => {
      const s = Math.sqrt(value) * 2 * R;
      if (s < 40) return;
      text(svg, sq.centre[0], sq.centre[1] - 2, name, { class: 'big-num', 'text-anchor': 'middle', 'font-style': 'italic', 'font-size': big ? 21 : Math.min(19, s / 3.4) });
      text(svg, sq.centre[0], sq.centre[1] + 19, value.toFixed(2), { class: 'lbl', 'text-anchor': 'middle' });
    };
    label(sqA, '‖X‖²', a2);
    label(sqB, '‖Y‖²', b2);
    label(sqC, '‖X+Y‖²', c2, true);

    text(svg, 16, 362, `${a2.toFixed(2)} + ${b2.toFixed(2)} = ${(a2 + b2).toFixed(2)}`, { class: 'lbl-ink big-num' });

    const h = el('circle', { cx: C[0], cy: C[1], r: 9, class: 'handle', tabindex: 0, role: 'slider',
      'aria-label': 'Corner of the right triangle', 'aria-valuemin': 10, 'aria-valuemax': 170,
      'aria-valuenow': Math.round((phi * 180) / Math.PI), 'aria-valuetext': `squares ${a2.toFixed(2)} and ${b2.toFixed(2)}, sum 1.00` }, svg);
    h.addEventListener('keydown', onKey);
    h.addEventListener('pointerdown', onDown);
    return h;
  }

  let handle = draw();
  function setPhi(next, refocus) {
    phi = Math.min(Math.max(next, (10 * Math.PI) / 180), (170 * Math.PI) / 180);
    handle = draw();
    if (refocus) handle.focus();
  }
  function onKey(e) {
    const step = (3 * Math.PI) / 180;
    if (e.key === 'ArrowLeft' || e.key === 'ArrowUp') { setPhi(phi + step, true); e.preventDefault(); }
    if (e.key === 'ArrowRight' || e.key === 'ArrowDown') { setPhi(phi - step, true); e.preventDefault(); }
  }
  function toLocal(e) {
    const pt = svg.createSVGPoint();
    pt.x = e.clientX;
    pt.y = e.clientY;
    return pt.matrixTransform(svg.getScreenCTM().inverse());
  }
  function onDown(e) {
    e.preventDefault();
    svg.setPointerCapture(e.pointerId);
    const move = (ev) => {
      const p = toLocal(ev);
      setPhi(Math.atan2(mid[1] - p.y, p.x - mid[0]), false);
    };
    const up = () => {
      svg.removeEventListener('pointermove', move);
      svg.removeEventListener('pointerup', up);
      svg.removeEventListener('pointercancel', up);
      handle.focus({ preventScroll: true });
    };
    svg.addEventListener('pointermove', move);
    svg.addEventListener('pointerup', up);
    svg.addEventListener('pointercancel', up);
  }

}
