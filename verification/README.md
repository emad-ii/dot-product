# Lean verification

[Back to the paper](../README.md)

Local checks completed on 26 November 2026 using Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. This record applies to the exact attached source below. No GitHub Actions pass is claimed.

## Paper 1: Plane

**Table 1 capstone proved in Lean.** [Exact Lean source](../lean/A_Dot_Product_Is_All_You_Need_Final.lean)

SHA-256: `f5fac8264bdc0ca24d83f92bda1d2c26a3e79b12665bf7ba80eaa11ac6689552`

```text
'DotProduct.theorem1_table1_axioms' depends on axioms: [propext, Classical.choice, Quot.sound]
```

The capstone collects the twelve Table 1 statements on the specified Fock space. The formal source describes the bridges left to the manuscript.

## Reproduce

```sh
cd lean
lake exe cache get
cd ..
bash scripts/check-lean.sh plane
python3 scripts/verify.py
```

The checks add the axiom query to a temporary copy. The deposited files remain unmodified. The repository workflow runs the same entry points when hosted runners are available.
