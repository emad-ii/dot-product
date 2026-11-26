// Build the website: site/ -> docs/
//
//   node site/build.mjs          write docs/index.html and its assets
//   node site/build.mjs --check  build, then verify anchors, ids, copies and sizes
//
// The page is written as plain HTML in site/page.html. Mathematics is written in TeX
// between dollar signs and rendered here, once, with KaTeX, so the published page needs
// no script to show its formulas. Styles and scripts are inlined, so docs/index.html also
// opens from the file system. The only other files are the KaTeX fonts and the three
// downloads (paper PDF, LaTeX source, Lean proof).

import { createRequire } from 'node:module';
import { createHash } from 'node:crypto';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const require = createRequire(import.meta.url);
const katex = require('katex');

const SITE = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.dirname(SITE);
const OUT = path.join(ROOT, 'docs');
const read = (...p) => fs.readFileSync(path.join(...p), 'utf8');
const sha = (file) => createHash('sha256').update(fs.readFileSync(file)).digest('hex');

// ---------------------------------------------------------------------------------------
// Mathematics

// The paper's own macros, so its TeX can be used unchanged.
const MACROS = {
  '\\dd': '\\mathrm{d}',
  '\\R': '\\mathbb{R}',
  '\\C': '\\mathbb{C}',
  '\\E': '\\mathbb{E}',
  '\\hh': '\\mathfrak{h}',
  '\\HH': '\\mathcal{H}',
  '\\tr': '\\operatorname{tr}',
  '\\Dom': '\\operatorname{Dom}',
  '\\sinc': '\\operatorname{sinc}',
  '\\RePart': '\\operatorname{Re}',
  '\\ImPart': '\\operatorname{Im}',
};

let mathCount = 0;
function tex(source, displayMode) {
  mathCount += 1;
  try {
    return katex.renderToString(source.trim(), {
      displayMode,
      throwOnError: true,
      strict: 'error',
      output: 'htmlAndMathml',
      macros: { ...MACROS },
    });
  } catch (err) {
    throw new Error(`KaTeX failed on: ${source.trim().slice(0, 120)}\n  ${err.message}`);
  }
}

// Walk the HTML once. Leave <script>, <style>, <pre>, <code> and comments alone; turn
// $$...$$ into display mathematics and $...$ into inline mathematics; \$ is a dollar sign.
const PROTECTED = [
  ['<script', '</script>'],
  ['<style', '</style>'],
  ['<pre', '</pre>'],
  ['<code', '</code>'],
  ['<!--', '-->'],
];
function renderMath(html) {
  let out = '';
  let i = 0;
  while (i < html.length) {
    const guard = PROTECTED.find(([open]) => html.startsWith(open, i));
    if (guard) {
      const end = html.indexOf(guard[1], i);
      if (end < 0) throw new Error(`Unclosed ${guard[0]} near offset ${i}`);
      out += html.slice(i, end + guard[1].length);
      i = end + guard[1].length;
    } else if (html.startsWith('\\$', i)) {
      out += '$';
      i += 2;
    } else if (html.startsWith('$$', i)) {
      const end = html.indexOf('$$', i + 2);
      if (end < 0) throw new Error(`Unclosed $$ near: ${html.slice(i, i + 80)}`);
      out += tex(html.slice(i + 2, end), true);
      i = end + 2;
    } else if (html[i] === '$') {
      const end = html.indexOf('$', i + 1);
      if (end < 0) throw new Error(`Unclosed $ near: ${html.slice(i, i + 80)}`);
      out += tex(html.slice(i + 1, end), false);
      i = end + 1;
    } else {
      out += html[i];
      i += 1;
    }
  }
  return out;
}

// ---------------------------------------------------------------------------------------
// Assets

const escapeHtml = (s) => s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');

// KaTeX's stylesheet with its font URLs pointed at docs/assets/fonts and only the WOFF2
// files kept (every browser that runs this page reads WOFF2).
function katexCss() {
  const css = read(ROOT, 'node_modules', 'katex', 'dist', 'katex.min.css');
  return css.replace(
    /src:url\(fonts\/([A-Za-z0-9_-]+)\.woff2\) format\("woff2"\),url\([^)]*\) format\("woff"\),url\([^)]*\) format\("truetype"\)/g,
    'src:url(assets/fonts/$1.woff2) format("woff2")',
  );
}

function copyFonts() {
  const from = path.join(ROOT, 'node_modules', 'katex', 'dist', 'fonts');
  const to = path.join(OUT, 'assets', 'fonts');
  fs.mkdirSync(to, { recursive: true });
  const fonts = fs.readdirSync(from).filter((f) => f.endsWith('.woff2'));
  for (const f of fonts) fs.copyFileSync(path.join(from, f), path.join(to, f));
  return fonts.length;
}

// The files the page offers for download are copied from their homes in the repo.
const DOWNLOADS = [
  ['paper', 'A_Dot_Product_Is_All_You_Need_Final.pdf'],
  ['paper', 'A_Dot_Product_Is_All_You_Need_Final.tex'],
  ['lean', 'A_Dot_Product_Is_All_You_Need_Final.lean'],
];
function copyDownloads() {
  const to = path.join(OUT, 'files');
  fs.mkdirSync(to, { recursive: true });
  for (const [dir, name] of DOWNLOADS) fs.copyFileSync(path.join(ROOT, dir, name), path.join(to, name));
}

// Scripts: site/js/core.js first, then every other file in name order, each in its own
// scope, in one inline classic script (so the page also runs from the file system).
function scripts() {
  const dir = path.join(SITE, 'js');
  if (!fs.existsSync(dir)) return '';
  const files = fs.readdirSync(dir).filter((f) => f.endsWith('.js')).sort();
  const ordered = [...files.filter((f) => f === 'core.js'), ...files.filter((f) => f !== 'core.js')];
  return ordered
    .map((f) => `// ---- ${f}\n;(() => {\n'use strict';\n${read(dir, f)}\n})();`)
    .join('\n\n');
}

// ---------------------------------------------------------------------------------------
// The Lean section is generated from site/data/lean.json, so its numbers and statements
// have one home.

function leanSection(data) {
  const rows = (list) =>
    list
      .map(
        (r) => `<tr>
  <th scope="row"><a href="#${r.anchor}">${escapeHtml(r.row)}</a><span class="where">${escapeHtml(r.section)}</span></th>
  <td>${r.plain}</td>
  <td><code>${escapeHtml(r.lean)}</code></td>
</tr>`,
      )
      .join('\n');
  const table = (caption, list) => `<table class="lean-table">
<caption>${escapeHtml(caption)}</caption>
<thead><tr><th scope="col">Row of Table 1</th><th scope="col">What the Lean file proves</th><th scope="col">Statement</th></tr></thead>
<tbody>
${rows(list)}
</tbody>
</table>`;
  const steps = data.steps
    .map(
      (s) => `<tr>
  <th scope="row"><a href="#${s.anchor}">${escapeHtml(s.section)}</a></th>
  <td>${s.plain}</td>
  <td><code>${escapeHtml(s.lean)}</code></td>
</tr>`,
    )
    .join('\n');
  const outside = data.outside.map((o) => `<li>${o}</li>`).join('\n');
  return {
    LEAN_VON_NEUMANN: table('von Neumann', data.vonNeumann),
    LEAN_WIGHTMAN: table('Wightman', data.wightman),
    LEAN_STEPS: `<table class="lean-table">
<caption>The law, before any Hilbert space</caption>
<thead><tr><th scope="col">Step</th><th scope="col">What the Lean file proves</th><th scope="col">Statement</th></tr></thead>
<tbody>
${steps}
</tbody>
</table>`,
    LEAN_OUTSIDE: `<ul class="outside">\n${outside}\n</ul>`,
  };
}

// ---------------------------------------------------------------------------------------
// Build

function build() {
  fs.mkdirSync(OUT, { recursive: true });
  let page = read(SITE, 'page.html');

  const leanFile = path.join(ROOT, 'lean', 'A_Dot_Product_Is_All_You_Need_Final.lean');
  const leanText = fs.readFileSync(leanFile, 'utf8');
  const facts = {
    LEAN_LINES: leanText.split('\n').length - 1,
    LEAN_THEOREMS: (leanText.match(/^(?:private )?(?:theorem|lemma) /gm) || []).length,
  };
  const number = (n) => n.toLocaleString('en-US');
  const data = JSON.parse(read(SITE, 'data', 'lean.json'));
  const slots = {
    ...Object.fromEntries(Object.entries(facts).map(([k, v]) => [k, number(v)])),
    ...leanSection(data),
  };
  for (const [key, value] of Object.entries(slots)) page = page.split(`{{${key}}}`).join(value);
  const left = page.match(/\{\{[A-Z_]+\}\}/g);
  if (left) throw new Error(`Unfilled slots: ${[...new Set(left)].join(', ')}`);

  page = renderMath(page);
  page = page.replace('/*@katex*/', () => katexCss());
  page = page.replace('/*@css*/', () => read(SITE, 'style.css'));
  page = page.replace('/*@js*/', () => scripts());

  fs.writeFileSync(path.join(OUT, 'index.html'), page);
  fs.writeFileSync(path.join(OUT, '.nojekyll'), '');
  const fonts = copyFonts();
  copyDownloads();
  return { facts, fonts, bytes: Buffer.byteLength(page) };
}

function check() {
  const html = read(OUT, 'index.html');
  const problems = [];
  const ids = [...html.matchAll(/\sid="([^"]+)"/g)].map((m) => m[1]);
  const seen = new Set();
  for (const id of ids) {
    if (seen.has(id)) problems.push(`duplicate id: ${id}`);
    seen.add(id);
  }
  for (const m of html.matchAll(/href="#([^"]+)"/g)) {
    if (!seen.has(m[1])) problems.push(`link to missing anchor: #${m[1]}`);
  }
  for (const m of html.matchAll(/(?:href|src)="((?:files|assets)\/[^"]+)"/g)) {
    if (!fs.existsSync(path.join(OUT, m[1]))) problems.push(`missing file: ${m[1]}`);
  }
  for (const m of html.matchAll(/url\((assets\/fonts\/[^)]+)\)/g)) {
    if (!fs.existsSync(path.join(OUT, m[1]))) problems.push(`missing font: ${m[1]}`);
  }
  for (const [dir, name] of DOWNLOADS) {
    if (sha(path.join(ROOT, dir, name)) !== sha(path.join(OUT, 'files', name))) problems.push(`stale copy: files/${name}`);
  }
  if (/katex-error/.test(html)) problems.push('KaTeX error markup in the page');
  if (/https?:\/\/(?!www\.w3\.org)[^"'\s)]+\.(?:js|css|woff2?)/.test(html)) problems.push('external asset referenced');
  return problems;
}

const result = build();
console.log(
  `docs/index.html  ${(result.bytes / 1024).toFixed(0)} KB, ${mathCount} formulas, ${result.fonts} fonts; ` +
    `Lean file: ${result.facts.LEAN_LINES} lines, ${result.facts.LEAN_THEOREMS} theorems and lemmas`,
);
if (process.argv.includes('--check')) {
  const problems = check();
  if (problems.length) {
    console.error(problems.map((p) => `  ✗ ${p}`).join('\n'));
    process.exit(1);
  }
  console.log('check: anchors, ids, files and copies are consistent');
}
