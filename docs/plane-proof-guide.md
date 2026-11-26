# A Dot Product Is All You Need: proof guide

[Back to the paper](../README.md)

## Paper 1: the argument at a glance

**Axiom.** *Displacements are measured by a single positive dot product $g$*, in dimension $D \ge 2$.

What the axiom leaves open is governed by probability: its sum and product rules, symmetry (equal values) and maximum entropy. By the axiomatic method nothing else is assumed.

1. **Pythagoras, read twice.** Squared lengths of orthogonal parts add. With the product rule this makes the law of the readings Gaussian; with the sum rule it gives the Born rule.
2. **The law.** Two independent copies are unchanged by the rotations that mix them, so $F(u+v)=F(u)F(v)$ and $F(u)=e^{-\hbar u/2}$.
3. **Locality.** Maximizing entropy at fixed lattice site and edge mean squares gives the precision $\alpha I+\beta L$, so the law is local of degree one, with covariance $\hbar(-\Delta_g+m^2)^{-1}$, and reflection positive.
4. **The operator.** Two opposite pulses rule out every higher degree.
5. **States.** A state is what a plane knows of its preparation: the state space is a Fock space of identical bosons.
6. **Evolution and relativity.** The shift continues uniquely to unitary evolution $e^{-itH/\hbar}$ with $H\ge 0$ and a mass gap $\hbar m$; rotations continue to Lorentz boosts.
7. **Composition, Born rule, update.** The product rule gives the tensor product and the projection update; a doubling argument gives the Born rule.

The von Neumann and Wightman axioms follow. Only two scales remain free: $m$ and $\hbar$.

## What the plane Lean file proves

Its capstone, `theorem1_table1_axioms`, proves all twelve rows of the paper's Table 1 at once, on one Hilbert space (the Fock space over $L^2(\mathbb R^{n+1})$), for every spatial dimension $n+1$ (every $D\ge 2$), every $\hbar>0$ and every $m>0$:

| von Neumann | Lean | Wightman | Lean |
|:--|:--|:--|:--|
| Hilbert space | `Table1HilbertSpace` | Poincaré covariance | `Table1PoincareCovariance` |
| Unitary evolution | `Table1UnitaryEvolution` | Forward-cone spectrum | `Table1ForwardConeSpectrum` |
| Tensor product | `Table1TensorProduct` | Unique vacuum | `Table1UniqueVacuum` |
| Born rule | `Table1BornRule` | Field distributions | `Table1FieldDistributions` |
| Self-adjoint observables | `Table1SelfAdjointObservables` | Spacelike commutativity | `Table1SpacelikeCommutativity` |
| Projection update | `Table1ProjectionUpdate` | Cyclic vacuum | `Table1CyclicVacuum` |

Each row is a definition in the file, stated in full; the website gives each one in plain words. The steps before the Hilbert space are proved too: the Gaussian law from rotation invariance with no moment assumption (`gaussian_of_copyRotation`), lattice maximum entropy on every finite graph (`lattice_covariance_determination`), the two-pulse no-go (`positive_polynomial_two_pulses_force_affine`, `smooth_normal_nogo_unconditional`) and the doubling argument (`interval_chord`).

The verification script checks the capstone's transitive axiom dependencies. The final Lean file is kept byte-for-byte as supplied; audit commands are added only to a temporary copy.

<details>
<summary><strong>What the file leaves to the paper</strong></summary>

The header of the Lean file names five things it does not formalize:

- a single countably additive measure on tempered distributions (Bochner–Minlos); the paper's law is the family of finite-list laws, which is what the file works with;
- the position-space bridge from finite free boxes to $(-\Delta+m^2)^{-1}$ on $L^2(\mathbb R^D)$; the momentum-space limit is proved;
- continuum reflection positivity for general nonlinear preparations, and positivity and nonconstancy of the symbol, which enter §2.4 as hypotheses;
- the identification of the Fock space with $L^2$ of a measure on the plane, and the multiplication law of the full Poincaré group (translations, rotations and boosts are each proved to fix the vacuum and intertwine the field);
- the converse spectral theorem; the direction the paper uses is proved.

</details>

## Check the proof

The `lean/` folder pins Lean 4.34.1 and Mathlib `d13f23b`. With [Lean installed](https://leanprover-community.github.io/get_started.html):

```sh
cd lean
lake exe cache get
cd ..
bash scripts/check-lean.sh plane
```

The workflow type-checks the Paper 1 companion and audits its capstone. It fails on Lean diagnostics or nonstandard axiom dependencies.

`python3 scripts/verify.py` checks the manuscript, its source and the Lean companion against the SHA-256 sums in `release.json`.

## Build the website

The site is one static page in `docs/`, served as is (GitHub Pages can publish the `docs/` folder). Its sources are in `site/`: the text in `site/page.html`, the Lean descriptions in `site/data/lean.json`, the figures in `site/js/`. Mathematics is rendered once, at build time, with KaTeX, and set in Computer Modern, the paper's own typeface.

```sh
npm install
npm run build        # writes docs/index.html; add -- --check to verify links and copies
npm run serve        # http://localhost:4173
```
