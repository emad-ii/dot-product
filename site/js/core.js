// Shared state and helpers. The two free scales m and hbar live here; every figure that
// depends on them subscribes, so one movement of a dial redraws every such figure.

const listeners = [];
const state = { m: 1, hbar: 1 };

function onScales(fn) {
  listeners.push(fn);
  fn(state);
}
function setScales(patch) {
  Object.assign(state, patch);
  for (const fn of listeners) fn(state);
}

// Theme: the reader's choice wins; otherwise the system's.
const root = document.documentElement;
const stored = (() => { try { return localStorage.getItem('dp-theme'); } catch { return null; } })();
if (stored === 'dark' || stored === 'light') root.dataset.theme = stored;
const themeListeners = [];
function isDark() {
  if (root.dataset.theme) return root.dataset.theme === 'dark';
  return window.matchMedia('(prefers-color-scheme: dark)').matches;
}
function onTheme(fn) { themeListeners.push(fn); }
function themeChanged() { for (const fn of themeListeners) fn(); }
window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', themeChanged);
const themeButton = document.querySelector('.theme');
function labelThemeButton() { if (themeButton) themeButton.textContent = isDark() ? 'Light page' : 'Dark page'; }
if (themeButton) {
  labelThemeButton();
  themeButton.addEventListener('click', () => {
    root.dataset.theme = isDark() ? 'light' : 'dark';
    try { localStorage.setItem('dp-theme', root.dataset.theme); } catch { /* private mode */ }
    labelThemeButton();
    themeChanged();
  });
}

// Colours for canvas drawing come from the same CSS tokens as everything else.
function token(name) { return getComputedStyle(root).getPropertyValue(name).trim(); }

// SVG helpers.
const NS = 'http://www.w3.org/2000/svg';
function el(name, attrs = {}, parent) {
  const node = document.createElementNS(NS, name);
  for (const [k, v] of Object.entries(attrs)) node.setAttribute(k, v);
  if (parent) parent.appendChild(node);
  return node;
}
function text(parent, x, y, str, attrs = {}) {
  const node = el('text', { x, y, ...attrs }, parent);
  node.textContent = str;
  return node;
}
function clear(svg) {
  [...svg.childNodes].forEach((c) => { if (c.nodeName !== 'title' && c.nodeName !== 'desc') svg.removeChild(c); });
}
function pathFrom(points) {
  return points.map(([x, y], i) => `${i ? 'L' : 'M'}${x.toFixed(2)},${y.toFixed(2)}`).join('');
}

// Canvas helper: keep the drawing sharp on high-density screens.
function sharpCanvas(canvas) {
  const w = Number(canvas.getAttribute('width'));
  const h = Number(canvas.getAttribute('height'));
  const dpr = Math.min(window.devicePixelRatio || 1, 2);
  canvas.width = w * dpr;
  canvas.height = h * dpr;
  const ctx = canvas.getContext('2d');
  ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
  return { ctx, w, h };
}

// A deterministic random source, so a figure redrawn for a new m or hbar keeps its points.
function rng(seed) {
  let s = seed >>> 0;
  return () => {
    s = (s + 0x6d2b79f5) >>> 0;
    let t = s;
    t = Math.imul(t ^ (t >>> 15), t | 1);
    t ^= t + Math.imul(t ^ (t >>> 7), t | 61);
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
  };
}
function gaussianPair(rand) {
  const u = Math.max(rand(), 1e-12);
  const v = rand();
  const r = Math.sqrt(-2 * Math.log(u));
  return [r * Math.cos(2 * Math.PI * v), r * Math.sin(2 * Math.PI * v)];
}

const reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

window.DP = { state, onScales, setScales, onTheme, isDark, token, el, text, clear, pathFrom, sharpCanvas, rng, gaussianPair, reduceMotion };

// The dials.
const dialM = document.getElementById('dial-m');
const dialH = document.getElementById('dial-hbar');
const outM = document.getElementById('m-out');
const outH = document.getElementById('hbar-out');
function readDials() {
  const m = Number(dialM.value);
  const hbar = Number(dialH.value);
  outM.textContent = m.toFixed(2);
  outH.textContent = hbar.toFixed(2);
  setScales({ m, hbar });
}
dialM.addEventListener('input', readDials);
dialH.addEventListener('input', readDials);
outM.textContent = Number(dialM.value).toFixed(2);
outH.textContent = Number(dialH.value).toFixed(2);

// The rail marks the section being read.
const links = [...document.querySelectorAll('.bands ol a')];
const targets = links.map((a) => document.getElementById(a.getAttribute('href').slice(1))).filter(Boolean);
let ticking = false;
function markCurrent() {
  ticking = false;
  let current = targets[0] ? targets[0].id : null;
  for (const t of targets) if (t.getBoundingClientRect().top < window.innerHeight * 0.3) current = t.id;
  for (const a of links) a.setAttribute('aria-current', a.getAttribute('href') === `#${current}` ? 'true' : 'false');
}
window.addEventListener('scroll', () => { if (!ticking) { ticking = true; requestAnimationFrame(markCurrent); } }, { passive: true });
markCurrent();

// On narrow screens the dials appear only while a figure that depends on them is in view.
const scaleFigures = ['fig-rotation', 'fig-lattice', 'fig-pulses', 'fig-continuation', 'fig-energy']
  .map((id) => document.getElementById(id)).filter(Boolean);
if ('IntersectionObserver' in window) {
  const inView = new Set();
  const io = new IntersectionObserver((entries) => {
    for (const e of entries) { if (e.isIntersecting) inView.add(e.target); else inView.delete(e.target); }
    document.body.classList.toggle('scales-in-view', inView.size > 0);
  });
  scaleFigures.forEach((f) => io.observe(f));
}
