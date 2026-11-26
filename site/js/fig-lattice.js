// §2.3 One field drawn from the maximum-entropy law on a ring of N sites at mesh a:
// precision alpha I + beta L with alpha = a m^2 / hbar and beta = 1 / (a hbar), the
// lattice form of (3) in one dimension. The ring Laplacian is diagonal in the Fourier
// basis, so a draw is a sum of modes with independent Gaussian amplitudes.

const { onScales, onTheme, token, sharpCanvas, rng, gaussianPair } = window.DP;
const canvas = document.getElementById('lat-canvas');
if (canvas) {
  const N = 96;
  const a = 0.1;
  const readout = document.getElementById('lat-readout');
  const button = document.getElementById('lat-draw');
  const lam = Array.from({ length: N }, (_, k) => 2 - 2 * Math.cos((2 * Math.PI * k) / N));
  let seed = 7;
  let z = [];
  function newNoise() {
    const rand = rng(seed);
    z = [];
    for (let k = 0; k < N; k += 2) z.push(...gaussianPair(rand));
  }
  newNoise();
  let m = 1;
  let hbar = 1;
  // fixed vertical scale: three standard deviations at m = hbar = 1
  const sdAt = (mm, hh) => {
    let v = 0;
    for (let k = 0; k < N; k += 1) v += 1 / ((a * mm * mm) / hh + lam[k] / (a * hh));
    return Math.sqrt(v / N);
  };
  const yMax = 3 * sdAt(1, 1);

  function field() {
    const alpha = (a * m * m) / hbar;
    const beta = 1 / (a * hbar);
    const amp = lam.map((l) => 1 / Math.sqrt(alpha + beta * l));
    const phi = new Array(N).fill(0);
    for (let i = 0; i < N; i += 1) {
      let s = (z[0] * amp[0]) / Math.sqrt(N);
      for (let k = 1; k < N / 2; k += 1) {
        const ang = (2 * Math.PI * k * i) / N;
        s += Math.sqrt(2 / N) * amp[k] * (z[2 * k - 1] * Math.cos(ang) + z[2 * k] * Math.sin(ang));
      }
      s += (z[N - 1] * amp[N / 2] * (i % 2 ? -1 : 1)) / Math.sqrt(N);
      phi[i] = s;
    }
    let trC = 0;
    let trLC = 0;
    for (let k = 0; k < N; k += 1) { const c = 1 / (alpha + beta * lam[k]); trC += c; trLC += lam[k] * c; }
    return { phi, r: trLC / trC, alpha, beta };
  }

  function draw() {
    const { ctx, w, h } = sharpCanvas(canvas);
    ctx.clearRect(0, 0, w, h);
    const { phi, r } = field();
    const left = 12;
    const right = w - 12;
    const mid = (h - 34) / 2 + 4;
    const ys = ((h - 34) / 2 - 8) / yMax;
    const xs = (right - left) / (N - 1);
    ctx.strokeStyle = token('--edge');
    ctx.lineWidth = 1;
    ctx.beginPath(); ctx.moveTo(left, mid); ctx.lineTo(right, mid); ctx.stroke();
    // stems for each site, then the field as a line
    ctx.strokeStyle = token('--hair');
    for (let i = 0; i < N; i += 1) {
      const y = mid - Math.max(-yMax, Math.min(yMax, phi[i])) * ys;
      ctx.beginPath(); ctx.moveTo(left + i * xs, mid); ctx.lineTo(left + i * xs, y); ctx.stroke();
    }
    ctx.strokeStyle = token('--steel');
    ctx.lineWidth = 2;
    ctx.lineJoin = 'round';
    ctx.beginPath();
    for (let i = 0; i < N; i += 1) {
      const y = mid - Math.max(-yMax, Math.min(yMax, phi[i])) * ys;
      if (i) ctx.lineTo(left + i * xs, y); else ctx.moveTo(left + i * xs, y);
    }
    ctx.stroke();
    ctx.fillStyle = token('--steel');
    for (let i = 0; i < N; i += 1) {
      const y = mid - Math.max(-yMax, Math.min(yMax, phi[i])) * ys;
      ctx.beginPath(); ctx.arc(left + i * xs, y, 2.2, 0, 2 * Math.PI); ctx.fill();
    }
    // the correlation length 1/m, drawn as a bar
    const corr = 1 / (m * a);
    ctx.fillStyle = token('--mute');
    ctx.font = '15px KaTeX_SansSerif, system-ui, sans-serif';
    ctx.fillRect(left, h - 24, Math.min(corr * xs, right - left), 2);
    ctx.fillText('correlation length 1/m', left, h - 4);
    readout.textContent = `Edge-to-site ratio r = ${r.toFixed(3)}, below the white-noise value 2: the stiffness β is positive.`;
    canvas.setAttribute('aria-label', `A field on a ring of ${N} sites with m = ${m.toFixed(2)} and hbar = ${hbar.toFixed(2)}; edge-to-site ratio ${r.toFixed(3)}.`);
  }

  button.addEventListener('click', () => { seed += 1; newNoise(); draw(); });
  onScales((s) => { m = s.m; hbar = s.hbar; draw(); });
  onTheme(draw);
}
