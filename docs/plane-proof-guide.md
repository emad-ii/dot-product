# A Dot Product Is All You Need: proof guide

[Back to the paper](../README.md)

## Paper 1: the argument at a glance

**Axiom.** *Displacements are measured by a single positive dot product $g$*, in dimension $D \ge 2$.

The dot product is the one geometric axiom. The axiomatic method uses the separately stated sum, product and equal-values rules, and maximum entropy at specified lattice moments. The field result is a free massive scalar. [Common analysis errors](../COMMON-ANALYSIS-ERRORS.md) separates checks on the proof from questions about its scope and prior art.

1. **Pythagoras, read twice.** Squared lengths of orthogonal parts add. With the product and copy-symmetry rules this fixes the Gaussian form; with the sharp-event rules it fixes the Born weights.
2. **The law.** Two independent copies are unchanged by the rotations that mix them, so $F(u+v)=F(u)F(v)$ and $F(u)=e^{-\hbar u/2}$.
3. **Locality.** Maximizing entropy at the stated lattice moments gives the precision $\alpha I+\beta L$, where $L$ is the graph Laplacian. In the positive-stiffness regime, the continuum covariance is $\hbar(-\Delta_g+m^2)^{-1}$ and the law is reflection positive.
4. **The operator.** For a local precision with positive radial polynomial symbol, two opposite pulses rule out every degree above one.
5. **States.** A state is what a plane knows of its preparation: the state space is a Fock space of identical bosons.
6. **Evolution and relativity.** The shift continues uniquely to unitary evolution $e^{-itH/\hbar}$ with $H\ge 0$ and a mass gap $\hbar m$; rotations continue to Lorentz boosts.
7. **Composition, Born rule, update.** The product rule gives the tensor product and the projection update; a doubling argument gives the Born rule.

For this free massive scalar field, the paper obtains the von Neumann and Wightman statements in Table 1 for each choice of the two positive scales $m$ and $\hbar$.

## What the plane Lean file proves

**`DotProduct.paper1_determination` connects the original reading law to the reconstructed field.** It takes $m>0$ and $\hbar>0$ as inputs in spatial dimension $n+1$ (spacetime dimension $D=n+2$). [Lean statement](../lean/A_Dot_Product_Is_All_You_Need_Final.lean#L42055) · [Proof](../lean/A_Dot_Product_Is_All_You_Need_Final.lean#L42163)

- **Continuum law.** As the lattice spacing tends to zero and the free boxes exhaust space, the joint laws converge weakly for every finite list of original real Schwartz smears. Their limiting covariance is the position-space pairing with $\hbar(-\Delta_g+m^2)^{-1}$. These limits determine the law on the evaluation σ-algebra. The probability measure on tempered distributions uses the cylindrical σ-algebra. Sending each distribution to its Schwartz readings gives exactly the same law. [Resolvent limit](../lean/A_Dot_Product_Is_All_You_Need_Final.lean#L35292) · [Joint laws](../lean/A_Dot_Product_Is_All_You_Need_Final.lean#L35316) · [Equality of laws](../lean/A_Dot_Product_Is_All_You_Need_Final.lean#L42008)
- **States and evolution.** For arbitrary square-integrable positive-side preparations, including nonlinear ones, the reflected pairing equals the inner product of their conditional means on the plane. Conditioning identifies the quotient by zero reflected norm with the entire complex $L^2$ of the massive plane law. The unitary carrying the conditioned Wick preparations to their coherent Fock vectors is unique, and the positive-time shifts have a unique continuation with unitary boundary values. [Nonlinear reflection positivity](../lean/A_Dot_Product_Is_All_You_Need_Final.lean#L32843) · [Conditioning](../lean/A_Dot_Product_Is_All_You_Need_Final.lean#L37338) · [Fock identification](../lean/A_Dot_Product_Is_All_You_Need_Final.lean#L38133) · [Continuation](../lean/A_Dot_Product_Is_All_You_Need_Final.lean#L41989)
- **Spacetime symmetries.** The full orthochronous Poincaré group has a strongly continuous unitary representation on that Fock space. It fixes the vacuum and acts covariantly on the paper-normalized field on the finite-particle core. The translation spectral measures have forward-cone support, and products of spacetime fields applied to the vacuum span a dense subspace. [Group representation](../lean/A_Dot_Product_Is_All_You_Need_Final.lean#L16934) · [Field, continuity, spectrum and cyclicity](../lean/A_Dot_Product_Is_All_You_Need_Final.lean#L42138)

**`DotProduct.theorem1_table1_axioms`** proves the twelve predicates in Table 1 on the Fock space over $L^2(\mathbb R^{n+1})$. The determination theorem includes this result. [Table 1 theorem](../lean/A_Dot_Product_Is_All_You_Need_Final.lean#L33707)

| von Neumann | Lean | Wightman | Lean |
|:--|:--|:--|:--|
| Hilbert space | `Table1HilbertSpace` | Poincaré covariance | `Table1PoincareCovariance` |
| Unitary evolution | `Table1UnitaryEvolution` | Forward-cone spectrum | `Table1ForwardConeSpectrum` |
| Tensor product | `Table1TensorProduct` | Unique vacuum | `Table1UniqueVacuum` |
| Born rule | `Table1BornRule` | Field distributions | `Table1FieldDistributions` |
| Self-adjoint observables | `Table1SelfAdjointObservables` | Spacelike commutativity | `Table1SpacelikeCommutativity` |
| Projection update | `Table1ProjectionUpdate` | Cyclic vacuum | `Table1CyclicVacuum` |

Other steps include the Gaussian law from copy rotations without a moment assumption (`gaussian_of_copyRotation`), the entropy maximizer for interior lattice moments (`lattice_covariance_determination`), the two-pulse obstruction (`positive_polynomial_two_pulses_force_affine`) and the doubling argument (`interval_chord`). For the self-adjoint observables row, the paper uses the spectral theorem in one direction. A Borel projection-valued measure on the real line gives a densely defined self-adjoint operator by spectral integration. [Observable predicate](../lean/A_Dot_Product_Is_All_You_Need_Final.lean#L33386)

**General laws in §4.** For a measure-preserving reflection that fixes plane events up to null sets and pulls positive-side observations into the negative half, conditional independence given the plane yields the reflected pairing. The reconstructed space is the closure of the conditional means. It equals the whole plane space exactly when those means are dense. Under stationary time-reversible shifts and continuity on a family of preparations with dense span, `DotProduct.GeneralReflection.measured_evolution` gives a nonnegative self-adjoint Hamiltonian and the unitary boundary evolution on that accessible space. [Density criterion](../lean/A_Dot_Product_Is_All_You_Need_Final.lean#L42462) · [Evolution theorem](../lean/A_Dot_Product_Is_All_You_Need_Final.lean#L43886)

The Euclidean results use the manuscript's original smeared readings. They establish continuity, symmetry, Euclidean invariance and growth bounds for moments on those Schwartz tests, along with reflection positivity and clustering. A comparison with a named Osterwalder–Schrader axiom system on jointly smeared tests would need a separate argument in that system’s test-function topology. [Source scope notes](../lean/A_Dot_Product_Is_All_You_Need_Final.lean#L46)

## Check the proof

The `lean/` folder pins Lean 4.34.1 and Mathlib `d13f23b`. With [Lean installed](https://leanprover-community.github.io/get_started.html):

```sh
cd lean
lake exe cache get
cd ..
bash scripts/check-lean.sh plane
```

The workflow type-checks the entire companion. Its default axiom query checks the transitive dependencies of `DotProduct.theorem1_table1_axioms` on a temporary copy. A separate local audit queried 218 distinct declarations on this release. The verification record gives the results and the GitHub run. [Verification record](../verification/README.md#paper-1-plane)

`python3 scripts/verify.py` checks the manuscript, its source, the Lean companion and their website downloads against the SHA-256 sums in the [release manifest](../release.json).

## Build the website

The home page is built from the text in `site/page.html`, the Lean descriptions in `site/data/lean.json` and the figures in `site/js/`. KaTeX renders the mathematics in Computer Modern at build time. The [animated HTML explainer](talk/index.html) is a separate page.

```sh
npm install
npm run build        # writes docs/index.html; add -- --check to verify links and copies
npm run serve        # http://localhost:4173
```
