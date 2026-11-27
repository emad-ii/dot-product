# Lean verification

[Back to the paper](../README.md)

## Paper 1: Plane

The current source contains 43,934 lines of Lean and pins Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. [Lean source](../lean/A_Dot_Product_Is_All_You_Need_Final.lean) · [Release manifest](../release.json)

**Lean source SHA-256** `c055eb192d4f43a4cc1dcbaaaacbfdeeed52b9375fede240ba81684f1b449a16`

`DotProduct.paper1_determination` reconstructs the free massive field from the paper’s original smeared reading law. It identifies the reflected preparation space with the entire complex L² of the plane law and gives the unitary map from there to Fock space. Its Table 1 component, `DotProduct.theorem1_table1_axioms`, proves the twelve stated rows on that Fock space. For the general laws in §4, `DotProduct.GeneralReflection.measured_evolution` reconstructs time evolution on the accessible state space under the stated conditional independence, reflection, shift and continuity hypotheses. [Proof guide](../docs/plane-proof-guide.md#what-the-plane-lean-file-proves) · [Common analysis errors](../COMMON-ANALYSIS-ERRORS.md)

## Verification results

- **Local checks on the release.** Local CI passed for the original release (SHA-256 `85a332fca1b57c255b105750ad75cf93f90dafebb1fce1180715d92f880bed9d`). The scope edit changes the opening comment only; the proof body and imports are byte-identical. An expanded local audit with warnings treated as errors queried the transitive axiom dependencies of 218 distinct declarations. It found only `propext`, `Classical.choice` and `Quot.sound`.
- **GitHub Actions.** The `files` and `lean` jobs passed on PR #1. The default Lean script type-checks the whole file and queries the transitive axiom dependencies of one declaration, `DotProduct.theorem1_table1_axioms`. [PR #1 run](https://github.com/emad-ii/dot-product/actions/runs/46012254019) · [Workflow](../.github/workflows/verify.yml) · [Lean check script](../scripts/check-lean.sh)

## Reproduce

Run the default Lean and file checks from the repository root.

```sh
(cd lean && lake exe cache get)
bash scripts/check-lean.sh plane
python3 scripts/verify.py
```

The Lean script appends its axiom query to a temporary copy and rejects warnings, errors or dependencies outside the three axioms above. The Python script checks the paper, LaTeX and Lean files against the manifest and verifies the website’s download copies.
