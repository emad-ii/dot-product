// §2.2 The rotation test. Two independent copies of one law, before and after a rotation
// that mixes them, with the law of the first coordinate under each. The Gaussian
// (variance hbar) is unchanged at every angle; the fair sign and the uniform law are not.

const { onScales, onTheme, token, sharpCanvas, rng, gaussianPair } = window.DP;
const canvas = document.getElementById('rot-canvas');
if (canvas) {
  const angleInput = document.getElementById('rot-angle');
  const angleOut = document.getElementById('rot-angle-out');
  const lawInputs = [...document.querySelectorAll('input[name="rot-law"]')];
  const N = 3000;
  const SHOWN = 700;
  const RANGE = 4;

  // unit-variance samples, fixed once so the picture is stable under the controls
  const rand = rng(20261126);
  const base = { gauss: [], sign: [], uniform: [] };
  for (let i = 0; i < N; i += 1) {
    const [g1, g2] = gaussianPair(rand);
    base.gauss.push([g1, g2]);
    base.sign.push([rand() < 0.5 ? -1 : 1, rand() < 0.5 ? -1 : 1]);
    const s3 = Math.sqrt(3);
    base.uniform.push([(2 * rand() - 1) * s3, (2 * rand() - 1) * s3]);
  }

  let hbar = 1;
  let law = 'gauss';
  let theta = (45 * Math.PI) / 180;

  function draw() {
    const { ctx, w, h } = sharpCanvas(canvas);
    const ink = token('--ink');
    const mute = token('--mute');
    const steel = token('--steel');
    const edge = token('--edge');
    const paper = token('--paper');
    ctx.clearRect(0, 0, w, h);
    const sigma = Math.sqrt(hbar);
    const pts = base[law].map(([x, y]) => [x * sigma, y * sigma]);
    const c = Math.cos(theta);
    const s = Math.sin(theta);
    const rotated = pts.map(([x, y]) => [c * x + s * y, -s * x + c * y]);

    const panelW = (w - 40) / 2;
    const scatterH = 200;
    const histTop = 230;
    const histH = 80;
    const panels = [
      { x0: 10, data: pts, title: 'Two copies' },
      { x0: 30 + panelW, data: rotated, title: `Rotated by ${Math.round((theta * 180) / Math.PI)}°` },
    ];
    ctx.font = '15px KaTeX_SansSerif, system-ui, sans-serif';

    for (const p of panels) {
      const cx = p.x0 + panelW / 2;
      const cy = 18 + scatterH / 2;
      const scale = (scatterH / 2 - 6) / RANGE;
      // axes
      ctx.strokeStyle = edge;
      ctx.lineWidth = 1;
      ctx.beginPath();
      ctx.moveTo(cx - (scatterH / 2), cy); ctx.lineTo(cx + (scatterH / 2), cy);
      ctx.moveTo(cx, cy - scatterH / 2); ctx.lineTo(cx, cy + scatterH / 2);
      ctx.stroke();
      ctx.fillStyle = ink;
      ctx.fillText(p.title, p.x0, 14);
      // points
      ctx.fillStyle = steel;
      const big = law === 'sign';
      ctx.globalAlpha = big ? 1 : 0.32;
      for (let i = 0; i < (big ? N : SHOWN); i += 1) {
        const [x, y] = p.data[i];
        ctx.beginPath();
        ctx.arc(cx + x * scale, cy - y * scale, big ? 5 : 1.9, 0, 2 * Math.PI);
        ctx.fill();
      }
      ctx.globalAlpha = 1;

      // histogram of the first coordinate
      const bins = 41;
      const counts = new Array(bins).fill(0);
      for (const [x] of p.data) {
        const b = Math.floor(((x + RANGE) / (2 * RANGE)) * bins);
        if (b >= 0 && b < bins) counts[b] += 1;
      }
      const binW = panelW / bins;
      const density = counts.map((k) => k / N / ((2 * RANGE) / bins));
      const yMax = 0.8;
      const yScale = histH / yMax;
      ctx.strokeStyle = edge;
      ctx.beginPath(); ctx.moveTo(p.x0, histTop + histH); ctx.lineTo(p.x0 + panelW, histTop + histH); ctx.stroke();
      ctx.fillStyle = steel;
      for (let b = 0; b < bins; b += 1) {
        const hh = Math.min(density[b] * yScale, histH + 8);
        if (hh <= 0) continue;
        const x = p.x0 + b * binW + 1;
        const bw = Math.max(binW - 2, 1);
        ctx.beginPath();
        if (ctx.roundRect) ctx.roundRect(x, histTop + histH - hh, bw, hh, [2, 2, 0, 0]);
        else ctx.rect(x, histTop + histH - hh, bw, hh);
        ctx.fill();
      }
      // the Gaussian with the same variance, for reference
      ctx.strokeStyle = mute;
      ctx.setLineDash([4, 4]);
      ctx.lineWidth = 1.2;
      ctx.beginPath();
      for (let i = 0; i <= 200; i += 1) {
        const x = -RANGE + (2 * RANGE * i) / 200;
        const y = Math.exp(-(x * x) / (2 * hbar)) / Math.sqrt(2 * Math.PI * hbar);
        const px = p.x0 + ((x + RANGE) / (2 * RANGE)) * panelW;
        const py = histTop + histH - Math.min(y * yScale, histH + 8);
        if (i) ctx.lineTo(px, py); else ctx.moveTo(px, py);
      }
      ctx.stroke();
      ctx.setLineDash([]);
      // mass at zero, the fair-sign witness
      if (law === 'sign') {
        const atZero = p.data.filter(([x]) => Math.abs(x) < 1e-9).length / N;
        ctx.fillStyle = ink;
        ctx.fillText(`P(first coordinate = 0) = ${atZero.toFixed(2)}`, p.x0, histTop - 6);
      }
    }
    ctx.fillStyle = mute;
    ctx.fillText('dashed: the Gaussian with the same variance', 10, h - 4);
    canvas.setAttribute('aria-label', `${law === 'gauss' ? 'Gaussian' : law === 'sign' ? 'Fair-sign' : 'Uniform'} copies rotated by ${Math.round((theta * 180) / Math.PI)} degrees; ` +
      (law === 'gauss' ? 'the law is unchanged.' : 'the law of the first coordinate changes.'));
    void paper;
  }

  angleInput.addEventListener('input', () => {
    theta = (Number(angleInput.value) * Math.PI) / 180;
    angleOut.textContent = `${angleInput.value}°`;
    draw();
  });
  lawInputs.forEach((r) => r.addEventListener('change', () => { law = r.value; draw(); }));
  onScales((s) => { hbar = s.hbar; draw(); });
  onTheme(draw);
}
