import Mathlib

/-!
==============================================================================
  A DOT PRODUCT IS ALL YOU NEED — UNIFIED LEAN 4 COMPANION
==============================================================================

Formalization accompanying:
  *A Dot Product Is All You Need* (Emad Mostaque, $D \ge 2$ route).

- **Lean 4 formalization:** GPT 6.2 Astra and Gemini Neon.
- **Toolchain:** Lean 4.34.1; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- **Single-file build:** `lake env lean "A Dot Product Is All You Need Final.lean"`
- **Imports:** `import Mathlib` only (0 local imports).
- **Axiom guarantee:** All theorems depend strictly on Lean's standard logical
  foundations `{propext, Classical.choice, Quot.sound}`, with zero `sorry`,
  `admit`, `axiom`, `native_decide`, `set_option`, `unsafe`, `partial`,
  `opaque`, or `#print` commands.

==============================================================================
  MASTER CAPSTONE: THEOREM 1 & TABLE 1 (ALL 12 AXIOM ROWS ON ONE SPACE)
==============================================================================

`DotProduct.theorem1_table1_axioms` (`PART 11`, `section Table1Capstone`) proves,
for every spatial dimension `d = n + 1` (`D = d + 1 ≥ 2`) and every pair of
positive scales `ħ > 0`, `m > 0`, all 12 rows of **Table 1** simultaneously on
the single concrete Hilbert space
  `H := momentumFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))`,
with vacuum `Ω := fockVacuum`, unitary evolution `U := fockUnitary`, Hamiltonian
`fockH`, and tempered field `Φ := wightmanField` on `FiniteParticleFock`:

| Table 1 Row (von Neumann) | Paper § | Lean Declaration (`DotProduct.*`) |
|---|---|---|
| 1. Hilbert space | §3.1 | `Table1HilbertSpace` (`momentumFock_separable`, `momentumFock_infinite_dim`, `coherentVec_realSchwartz_dense`, `gram_total_unique`) |
| 2. Unitary evolution | §3.2 | `Table1UnitaryEvolution` (`fockUnitary_*`, `fockUnitary_hasDerivAt_iff`, `fockH_symm`, `modeFockH_nonneg`) |
| 3. Tensor product | §3.4 | `Table1TensorProduct` (`momentumFock_tensor_unique`, `momentumFockTensorEquiv_*`) |
| 4. Born rule | §3.5 | `Table1BornRule` (`existsUnique_event_weights`, `born_satisfies_event_rules`) |
| 5. Self-adjoint observables | §3.5 | `Table1SelfAdjointObservables` (`pvmDom_dense`, `pvmOp_selfAdjoint`, `pvmOp_expectation`) |
| 6. Projection update | §3.6 | `Table1ProjectionUpdate` (`pure_update_exists_unique`, `normal_mixture_luders_update`, `densityOp_basis_trace_eq_mixTrace`) |

| Table 1 Row (Wightman) | Paper § | Lean Declaration (`DotProduct.*`) |
|---|---|---|
| 7. Poincaré covariance | §3.3 | `Table1PoincareCovariance` (`fockTranslation_intertwines_wightmanField`, `fockRotation_intertwines_wightmanField`, `fockDirectionalBoost_*`) |
| 8. Forward-cone spectrum | §3.2 | `Table1ForwardConeSpectrum` (`sector_forward`, `sector_energy_spectrum`, `fockShift_sector_norm_le`) |
| 9. Unique vacuum | §3.2 | `Table1UniqueVacuum` (`fockH_vacuum`, `fockShift_fixed_iff_mem_vacuum`, `sector_zero_iff`) |
| 10. Field distributions | §3.3 | `Table1FieldDistributions` (`finiteParticle_dense`, `wightman_matrixElement_continuous`, `wightmanField_symm_real`) |
| 11. Spacelike commutativity | §3.3 | `Table1SpacelikeCommutativity` (`wightman_spacelike_locality`, `spacelike_commutator_zero_nd`) |
| 12. Cyclic vacuum | §3.3 | `Table1CyclicVacuum` (`contField_vacuum_cyclic_realSchwartz`, `contField_vacuum_cyclic`) |

==============================================================================
  TABLE OF CONTENTS (PAPER 1 SECTIONS → LEAN PARTS & HEADLINE THEOREMS)
==============================================================================

- **PART 1 (§5, §2.2, §3.5) — Unified One-Equation Rigidity (`section Rigidity`):**
  Doubling-map chord rigidity on `[0, 1]` (`interval_chord`,
  `unitInterval_weight_determined`), continuous product-law rate determination
  (`positive_real_profile`, `positiveKernel_rate_of_bounded`,
  `positiveKernel_unique_rate`), and the verbatim §5 one-equation reduction
  `x ↦ log φ(a x) / log φ(a)` (`one_equation_bridge`).
- **PART 2 (§2.1, §2.2) — Gaussian Determination (`section Gaussian`):**
  Copy-rotation axis law (`copyRotation_axis`, `charFun_gaussian_of_axis`), 1D
  and Banach/Hilbert Gaussian determination (`gaussian_of_copyRotation`,
  `finiteGaussian_of_copyRotation`, `vectorGaussian_of_copyRotation`,
  `eq_iff_covariance`), linear field reading reduction
  (`linearField_finiteGaussian_of_copyRotation`), §2.2 → §3.1 characteristic
  bridge (`charFun_of_copyRotation_variance`), and the 45°-rotated fair ±1 coin
  counterexample (`fairSign_not_rotationInvariant`, `fairSign_rot45_zeros_half`).
- **PART 3 (§2.3) — Lattice Max-Entropy, Gibbs Law, Box RP & Continuum Limit:**
  * `section Lattice`: incidence Laplacian `L = Bᵀ B` (`edge_trace`), stiffness
    contrast identity `N (ℓ̄ - r) = β ∑ w_i (ℓ_i - r)²` (`stiffness_contrast`,
    `stiffness_sign_iff`, `trace_threshold`), smoothness condition `r < ℓ̄` and
    constant mode `ℓ₁ = 0` forcing `ħ = 1/β > 0`, `m² = α/β > 0`
    (`smoothness_forces_positive_scales`), Rolle feasibility and strict global
    determinant optimality (`affine_precision_strict_max`,
    `interior_targets_determine_covariance`).
  * `section Gibbs`, `section GibbsBridge`, `section LatticeDetermination`:
    KL differential-entropy gap (`entropy_gap`, `lattice_maxent`), multivariate
    Gaussian Gibbs bridge (`gibbs_bridge`), end-to-end covariance determination
    (`lattice_covariance_determination`).
  * `section GibbsCharAndBoxRP`: Gibbs zero mean, Gaussian characteristic
    function, and finite free-box reflection positivity (`freeBox_reflection_pos`,
    `freeBox_lattice_gibbs_reflection_pos`).
  * `section ContinuumLimit`: cubic-lattice to continuum convergence of
    covariance forms and finite joint Gaussian characteristic functions
    (`tendsto_latticeCovariance`, `tendsto_finite_gaussian_charFun`).
- **PART 4 (§2.4) — Radial Polynomials, Reflection Positivity & Two-Pulse No-Go:**
  * `section Kernel`: `O(D)`-invariant polynomial radial reduction
    (`orthogonal_invariant_polynomial_radial`), squared-operator Gram witness
    (`sqKernel_det`, `sqKernel_det_neg`), opposite-pulse `sinc` identity and
    higher-degree no-go (`cosine_two_pulse_negative`,
    `positive_polynomial_two_pulses_force_affine`,
    `polynomial_smeared_two_pulse_negative`), and surviving degree-one kernel
    factorization (`expKernel_fourier`, `expKernel_factor`,
    `expKernel_reflection_pos`).
  * `section SmoothNormalNoGo`: smooth compactly supported derivative-bump
    negative reflected test in `s > 0` (`smooth_normal_nogo`,
    `smooth_normal_nogo_unconditional`).
- **PART 5 (§3.1) — Hilbert State Space, Feature Density & Fock Realization:**
  * `section States`, `section CoherentFock`, `section ContinuumFeature`,
    `section FockOperators`: labelled Gram uniqueness (`gram_total_unique`),
    Wick overlap (`gaussian_phase_overlap`), separability and Vandermonde
    `dim H = ∞` (`separable_phase_span`, `gaussian_infinite_dimension`),
    feature factorization `C(θf̄, f') = ⟨Jf, Jf'⟩` (`reflectedCov_eq_feature_inner`,
    `laplace_pos_of_nonneg_bump`), discrete-mode Fock CCR and cyclicity.
  * `section SchwartzFeatureDensity`: dense range of real Schwartz features
    (`dense_fixed_profile`, `dense_complex_span_real_fixed_profile`).
  * `section MomentumFock`: continuous-momentum symmetric Fock space
    `momentumFock μ`, coherent Gram table, real-Schwartz totality
    (`coherentVec_realSchwartz_dense`), contraction shift `fockShift` and
    unitary group `fockUnitary`, vacuum uniqueness (`fockShift_fixed_iff_mem_vacuum`).
- **PART 6 (§3.2) — Unitary Evolution, `Dom(H)`, Uncertainty & Nonrel Limit:**
  * `section MomentumFockDomH`: exact Stone-generator domain `fockDomH` and
    Schrödinger equation `i ħ ψ̇ = H ψ` directly on `momentumFock μ`
    (`fockUnitary_hasDerivAt_iff`, `fockUnitary_schrodinger`, `fockH_symm`,
    `modeFockH_nonneg`).
  * `section Dynamics`: shifted overlaps, right half-plane unique analytic
    continuation (`unique_halfplane_continuation`), exact `ℓ²` multiplier domain
    (`multiplier_domain_exact`), 2×2 Gram Heisenberg bounds
    (`heisenberg_uncertainty`, `heisenberg_uncertainty_weak`).
  * `section PlaneCCRHeisenberg`: concrete finite-particle plane CCR and
    uncertainty (`plane_ccr`, `plane_heisenberg_uncertainty`).
  * `section NonrelativisticLimit`: Einstein's relation `E(p)² = ‖p‖² + M²`,
    rest energy `E(0) = M = ħ m` (`einstein_energy_momentum`,
    `rest_energy_eq_mass`), momentum dispersion limit
    (`nonrelativistic_dispersion_limit`, `nonrelativistic_energy_limit`), and
    strong `L²` convergence to free Schrödinger evolution
    (`nonrelativistic_schrodinger_l2_limit`).
- **PART 7 (§3.3 & §3.2) — Special Relativity, Heat Kernel & Continuum Wightman Field:**
  * `section Relativity`, `section SpacelikeCausality`, `section HeatKernel`:
    1D Lorentz boost measure invariance (`boost_measure_invariant`), Cauchy
    rectangle Pauli–Jordan vanishing (`spacelike_commutator_zero`), heat-kernel
    `G_E(w)` holomorphy on `Re w > 0` (`heatKernel_differentiableOn`) and
    uniform spacelike boundary convergence (`heatKernel_spacelike_uniform_tendsto`).
  * `section MassShellBoosts`: forward cone, mass gap `{0} ∪ [ħm, ∞)`, unique
    zero-energy vacuum (`sector_forward`, `sector_energy_spectrum`,
    `sector_zero_iff`), arbitrary-dimension `O(d)` and directional Lorentz boost
    invariance and strongly continuous 1-parameter boost groups.
  * `section ContinuumWightmanField`: dense core `FiniteParticleFock`,
    continuous creation/annihilation/field operators and CCR (`cont_ccr`,
    `contField_symm`, `contField_commutator`, `contField_vacuum_cyclic_realSchwartz`);
    `section WeakCommutatorDomain` extending the weak commutator identity and
    Heisenberg uncertainty `ΔQ ΔP ≥ ħ/2` to all of `Dom Q ∩ Dom P` on
    `momentumFock` via `N → 2N` tapered particle-number cutoffs
    (`fockField_weak_commutator`, `fockField_heisenberg_uncertainty_domain`,
    `planeField_heisenberg_uncertainty_domain`); tempered-distribution
    `wightmanField`, unitary Poincaré covariance, unconditional `D ≥ 2`
    spacelike microcausality (`wightman_spacelike_locality`), and
    `wightman_axioms_on_momentumFock`.
- **PART 8 (§3.4) — Composition (`section Composition`, `ProductL2Tensor`, `MomentumFockTensor`):**
  Fock tensor factorization uniqueness (`fock_tensor_unique`), completed `L²`
  tensor equivalence (`tensor_product_L2_unique`), and concrete unitary
  equivalence `momentumFock μ ⊗̂ momentumFock ν ≃ₗᵢ[ℂ] momentumFock (μ ⊕ ν)`
  (`momentumFock_tensor_unique`, `momentumFockTensorEquiv_*`).
- **PART 9 (§3.5) — Born Rule & Self-Adjoint PVM Observables:**
  * `section Born`, `section MeasuredDetermination`: stabilizer ray transitivity,
    perpendicular null events, full infinite-dimensional Born existence &
    uniqueness (`born_of_event_rules`, `existsUnique_event_weights`), and
    end-to-end join (`measured_determination`).
  * `section PVMObservable`: densely defined genuinely self-adjoint unbounded
    observables `A = ∫ a dP(a)` from Borel PVMs (`pvmDom_dense`,
    `pvmOp_selfAdjoint`, `pvmOp_expectation`).
- **PART 10 (§3.6) — Lüders Projection Update, Normal Mixtures & Operator Trace:**
  * `section Update`, `section PureRayUniqueness`: certainty support, trace-free
    compression uniqueness (`update_of_certain`), pure-ray Lüders uniqueness up
    to unit phase (`pure_update_exists_unique`).
  * `section NormalMixtures`, `section OperatorTrace`: normal-mixture density
    operators, trace-normalized Lüders update (`normal_mixture_luders_update`),
    and basis-independent Hilbert-space trace `Tr(ρ P_K) = mixTrace ρ K`
    (`densityOp_basis_trace_eq_mixTrace`, `densityOp_trace_independent_of_basis`).
- **PART 11 (§1, §4) — Master Capstone (`section Table1Capstone`):**
  `momentumFock_separable`, `momentumFock_infinite_dim`, and
  `theorem1_table1_axioms` uniting all 12 rows of Table 1 on `momentumFock volume`.

## Scope Notes
- Finite-list Gaussian laws are formalized directly (per §1's definition of the
  law), without requiring a nuclear-space Bochner–Minlos measure on `𝒮'(ℝ^D)`.
- In §2.3, finite-lattice max-entropy determination, free-box reflection
  positivity, and momentum-space lattice-to-continuum covariance/characteristic
  convergence are all proved; the position-space free-box resolvent bridge is
  cited analytically.
- In §3.3, translations, `O(d)` rotations, and strongly continuous 1-parameter
  directional Lorentz boosts are each proved to fix `Ω` and intertwine the field;
  in §3.5, the forward spectral integral `P ↦ A = ∫ a dP(a)` is proved.
-/

namespace DotProduct

/-!
==============================================================================
  PART 1: UNIFIED ONE-EQUATION RIGIDITY (§5, §2.2, §3.5)
==============================================================================
-/
section Rigidity

open Set Filter
open scoped Topology NNReal

/-- Restricted additivity and a one-sided upper bound force the chord on `[0, 1]`
via the doubling map `d(x) = f(x) - x f(1)`. Single scalar engine for both §2.2 and §3.5. -/
theorem interval_chord (f : ℝ → ℝ) (hbounded : BddAbove (f '' Icc 0 1))
    (hadd : ∀ x y : ℝ, 0 ≤ x → 0 ≤ y → x + y ≤ 1 → f (x + y) = f x + f y)
    {x : ℝ} (hx : x ∈ Icc (0 : ℝ) 1) : f x = x * f 1 := by
  let d (u : ℝ) := f u - u * f 1
  have dadd (u v : ℝ) (hu : 0 ≤ u) (hv : 0 ≤ v) (h : u + v ≤ 1) : d (u + v) = d u + d v := by
    simp only [d, hadd u v hu hv h]; ring
  have compl (u : ℝ) (hu : u ∈ Icc (0 : ℝ) 1) : d (1 - u) = -d u := by
    have he := dadd u (1 - u) hu.1 (sub_nonneg.mpr hu.2) (by linarith)
    rw [show u + (1 - u) = 1 by ring] at he
    have h1 : d 1 = 0 := by simp [d]
    linarith
  let S := d '' Icc 0 1
  obtain ⟨B, hB⟩ := hbounded
  have hS : BddAbove S := ⟨B + |f 1|, by
    rintro _ ⟨u, hu, rfl⟩
    dsimp [d]
    linarith [hB (mem_image_of_mem f hu), mul_le_mul_of_nonneg_left (neg_le_abs (f 1)) hu.1,
      mul_le_mul_of_nonneg_right hu.2 (abs_nonneg (f 1))]⟩
  have half : sSup S ≤ sSup S / 2 := csSup_le ⟨d x, mem_image_of_mem d hx⟩ <| by
    rintro _ ⟨u, ⟨hu0, hu1⟩, rfl⟩
    by_cases h : u + u ≤ 1
    · have e := le_csSup hS (mem_image_of_mem d (show u + u ∈ Icc (0 : ℝ) 1 from ⟨by linarith, h⟩))
      rw [dadd u u hu0 hu0 h] at e; linarith
    · have hv : u + u - 1 ∈ Icc (0 : ℝ) 1 := ⟨by linarith, by linarith⟩
      have e := dadd (u + u - 1) (1 - u) hv.1 (by linarith) (by linarith)
      rw [show u + u - 1 + (1 - u) = u by ring, compl u ⟨hu0, hu1⟩] at e
      linarith [le_csSup hS (mem_image_of_mem d hv)]
  have upper (u : ℝ) (hu : u ∈ Icc (0 : ℝ) 1) : d u ≤ 0 := by
    linarith [le_csSup hS (mem_image_of_mem d hu)]
  have hc := upper (1 - x) ⟨sub_nonneg.mpr hx.2, by linarith [hx.1]⟩
  rw [compl x hx] at hc
  exact sub_eq_zero.mp (le_antisymm (upper x hx) (by linarith))

/-- Scalar Born step (§3.5) derived directly from `interval_chord`. -/
theorem unitInterval_weight_determined (f : ℝ → ℝ)
    (hnonneg : ∀ x : ℝ, 0 ≤ x → x ≤ 1 → 0 ≤ f x) (hone : f 1 = 1)
    (hadd : ∀ x y : ℝ, 0 ≤ x → 0 ≤ y → x + y ≤ 1 → f (x + y) = f x + f y) :
    ∀ x : ℝ, 0 ≤ x → x ≤ 1 → f x = x := by
  have hb : BddAbove (f '' Icc 0 1) := ⟨1, by
    rintro _ ⟨u, ⟨hu, hu'⟩, rfl⟩
    have h := hadd u (1 - u) hu (by linarith) (by linarith)
    rw [show u + (1 - u) = 1 by ring, hone] at h
    linarith [hnonneg (1 - u) (by linarith) (by linarith)]⟩
  exact fun x hx hx' => by simpa [hone] using interval_chord f hb hadd (x := x) ⟨hx, hx'⟩

/-- Continuity, `K 0 = 1`, and multiplicativity force strict positivity everywhere on `ℝ≥0`. -/
theorem positive_real_profile {K : ℝ≥0 → ℝ} (hK : Continuous K)
    (h0 : K 0 = 1) (hm : ∀ s t, K (s + t) = K s * K t) (u : ℝ≥0) :
    0 < K u := by
  have hpow (x : ℝ≥0) (k : ℕ) : K (k • x) = K x ^ k := by
    induction k with
    | zero => simpa using h0
    | succ k ih => rw [succ_nsmul, hm, ih, pow_succ]
  have ht : Tendsto (fun n : ℕ => u / ((n + 1 : ℕ) : ℝ≥0)) atTop (𝓝 0) := by
    rw [← NNReal.tendsto_coe]; push_cast
    exact tendsto_const_nhds.div_atTop (tendsto_natCast_atTop_atTop.atTop_add tendsto_const_nhds)
  obtain ⟨n, hn⟩ := ((h0 ▸ hK.continuousAt.tendsto.comp ht).eventually (Ioi_mem_nhds zero_lt_one)).exists
  have hrec : (n + 1) • (u / ((n + 1 : ℕ) : ℝ≥0)) = u := by
    rw [nsmul_eq_mul, mul_div_cancel₀ _ (Nat.cast_ne_zero.mpr (Nat.succ_ne_zero n))]
  calc 0 < K (u / ((n + 1 : ℕ) : ℝ≥0)) ^ (n + 1) := pow_pos hn _
    _ = K u := by rw [← hpow, hrec]

/-- One-sided boundedness of `log ∘ K` on `[0, 1]` determines the unique exponential rate
on the whole half-line `ℝ≥0` via `interval_chord`. -/
theorem positiveKernel_rate_of_bounded (K : ℝ≥0 → ℝ)
    (hb : BddAbove ((fun t => Real.log (K t)) '' Icc 0 1))
    (hp : ∀ t, 0 < K t) (hm : ∀ s t, K (s + t) = K s * K t) :
    ∃! rate : ℝ, ∀ t : ℝ≥0, K t = Real.exp (-rate * (t : ℝ)) := by
  let A : ℝ≥0 →+ ℝ := AddMonoidHom.mk' (fun t => Real.log (K t)) fun s t =>
    (congrArg Real.log (hm s t)).trans (Real.log_mul (hp s).ne' (hp t).ne')
  have unit (u : ℝ≥0) (hu : u ≤ 1) : A u = (u : ℝ) * A 1 := by
    obtain ⟨B, hB⟩ := hb
    have bound : BddAbove ((fun x : ℝ => A x.toNNReal) '' Icc 0 1) :=
      ⟨B, by rintro _ ⟨x, hx, rfl⟩; exact hB (mem_image_of_mem _ ⟨zero_le, Real.toNNReal_le_one.mpr hx.2⟩)⟩
    simpa using interval_chord (fun x : ℝ => A x.toNNReal) bound
      (fun x y hx hy _ => by simp only [Real.toNNReal_add hx hy, map_add]) (x := (u : ℝ)) ⟨u.2, hu⟩
  have linear (t : ℝ≥0) : A t = (t : ℝ) * A 1 := by
    obtain ⟨n, hn⟩ := exists_nat_gt t
    have h0 : 0 < (n : ℝ≥0) := lt_of_le_of_lt zero_le hn
    have h := map_nsmul A n (t / (n : ℝ≥0))
    rw [nsmul_eq_mul, mul_comm, div_mul_cancel₀ _ h0.ne', unit _ ((div_le_one h0).2 hn.le), nsmul_eq_mul] at h
    rw [h, NNReal.coe_div, NNReal.coe_natCast, ← mul_assoc, mul_comm (n : ℝ),
      div_mul_cancel₀ _ (by exact_mod_cast h0.ne')]
  refine ⟨-A 1, fun t => by rw [neg_neg, mul_comm (A 1), ← linear]; exact (Real.exp_log (hp t)).symm, fun r hr => ?_⟩
  have e := congrArg Real.log (hr 1)
  simp only [NNReal.coe_one, mul_one, Real.log_exp] at e
  change r = -Real.log (K 1); linarith

/-- Continuous product law on `ℝ≥0`: continuity, `K 0 = 1`, and multiplicativity alone
uniquely determine the exponential rate (positivity is derived, not assumed). -/
theorem positiveKernel_unique_rate (K : ℝ≥0 → ℝ)
    (hcont : Continuous K) (hzero : K 0 = 1)
    (hmul : ∀ s t, K (s + t) = K s * K t) :
    ∃! rate : ℝ, ∀ t : ℝ≥0, K t = Real.exp (-rate * (t : ℝ)) :=
  have hp := positive_real_profile hcont hzero hmul
  positiveKernel_rate_of_bounded K
    (isCompact_Icc.bddAbove_image (hcont.log (fun t => (hp t).ne')).continuousOn) hp hmul

/-- Verbatim §5 one-equation bridge: for any multiplicative solution `φ(s + t) = φ(s) φ(t)` with
`0 < φ ≤ 1` and `φ(a) < 1` (`a > 0`), the rescaled map `f(x) = log φ(a x) / log φ(a)` is an
additive solution on `[0, 1]` taking values in `[0, 1]` with `f(1) = 1`; the doubling-map proof
(`unitInterval_weight_determined`) therefore forces `f(x) = x` and uniquely determines the
positive decay rate `rate = -log(φ a) / a > 0`. -/
theorem one_equation_bridge (φ : ℝ≥0 → ℝ)
    (hpos : ∀ t, 0 < φ t) (hle : ∀ t, φ t ≤ 1)
    (hmul : ∀ s t, φ (s + t) = φ s * φ t)
    {a : ℝ≥0} (ha : 0 < a) (hφa : φ a < 1) :
    let f : ℝ → ℝ := fun x => Real.log (φ (a * x.toNNReal)) / Real.log (φ a)
    (∀ x ∈ Icc (0 : ℝ) 1, f x ∈ Icc (0 : ℝ) 1) ∧
    f 1 = 1 ∧
    (∀ x y : ℝ, 0 ≤ x → 0 ≤ y → x + y ≤ 1 → f (x + y) = f x + f y) ∧
    (∀ x ∈ Icc (0 : ℝ) 1, f x = x) ∧
    (∃! rate : ℝ, 0 < rate ∧ ∀ t : ℝ≥0, φ t = Real.exp (-rate * (t : ℝ))) := by
  intro f
  have hlog_neg : Real.log (φ a) < 0 := Real.log_neg (hpos a) hφa
  have hmem : ∀ x ∈ Icc (0 : ℝ) 1, f x ∈ Icc (0 : ℝ) 1 := by
    rintro x ⟨hx0, hx1⟩
    have hlog_le0 : Real.log (φ (a * x.toNNReal)) ≤ 0 :=
      Real.log_nonpos (hpos _).le (hle _)
    have hle_a : φ a ≤ φ (a * x.toNNReal) := by
      have hdecomp : a = a * x.toNNReal + a * (1 - x).toNNReal := by
        apply NNReal.eq
        simp [Real.coe_toNNReal _ hx0, Real.coe_toNNReal _ (sub_nonneg.mpr hx1)]
        ring
      calc φ a = φ (a * x.toNNReal) * φ (a * (1 - x).toNNReal) := by
            conv_lhs => rw [hdecomp]; exact hmul _ _
        _ ≤ φ (a * x.toNNReal) * 1 :=
            mul_le_mul_of_nonneg_left (hle _) (hpos _).le
        _ = φ (a * x.toNNReal) := mul_one _
    have hlog_ge : Real.log (φ a) ≤ Real.log (φ (a * x.toNNReal)) :=
      Real.log_le_log (hpos a) hle_a
    exact ⟨div_nonneg_of_nonpos hlog_le0 hlog_neg.le,
      (div_le_iff_of_neg hlog_neg).mpr (by simpa using hlog_ge)⟩
  have hone : f 1 = 1 := by simp [f, hlog_neg.ne]
  have hadd : ∀ x y : ℝ, 0 ≤ x → 0 ≤ y → x + y ≤ 1 → f (x + y) = f x + f y := by
    intro x y hx hy _
    simp only [f, Real.toNNReal_add hx hy, mul_add, hmul,
      Real.log_mul (hpos _).ne' (hpos _).ne', add_div]
  have hid : ∀ x ∈ Icc (0 : ℝ) 1, f x = x := fun x hx =>
    unitInterval_weight_determined f (fun u hu0 hu1 => (hmem u ⟨hu0, hu1⟩).1) hone hadd x hx.1 hx.2
  refine ⟨hmem, hone, hadd, hid, ?_⟩
  let r : ℝ := -Real.log (φ a) / (a : ℝ)
  have ha_pos : (0 : ℝ) < (a : ℝ) := ha
  have hr_pos : 0 < r := div_pos (neg_pos.mpr hlog_neg) ha_pos
  have hpow_nat : ∀ (n : ℕ) (u : ℝ≥0), φ (n • u) = φ u ^ n := by
    intro n u
    induction n with
    | zero =>
      have h0 : φ 0 = 1 := by
        have := hmul 0 0; rw [add_zero] at this
        exact mul_left_cancel₀ (hpos 0).ne' (by linarith)
      simp [h0]
    | succ k ih => rw [succ_nsmul, hmul, ih, pow_succ]
  have hform : ∀ t : ℝ≥0, φ t = Real.exp (-r * (t : ℝ)) := by
    intro t
    obtain ⟨n, hn⟩ := exists_nat_gt ((t : ℝ) / (a : ℝ))
    have hn_pos : 0 < (n : ℕ) := by
      by_contra h0
      have hn0 : n = 0 := Nat.eq_zero_of_not_pos h0
      rw [hn0, Nat.cast_zero] at hn
      have : 0 ≤ (t : ℝ) / (a : ℝ) := div_nonneg t.2 ha_pos.le
      linarith
    have hn_rpos : (0 : ℝ) < (n : ℝ) := Nat.cast_pos.mpr hn_pos
    let x : ℝ := (t : ℝ) / ((n : ℝ) * (a : ℝ))
    have hx0 : 0 ≤ x := div_nonneg t.2 (mul_nonneg hn_rpos.le ha_pos.le)
    have hx1 : x ≤ 1 := by
      dsimp [x]
      rw [div_le_one (mul_pos hn_rpos ha_pos)]
      exact ((div_lt_iff₀ ha_pos).mp hn).le
    have hfx : f x = x := hid x ⟨hx0, hx1⟩
    have hlog_ax : Real.log (φ (a * x.toNNReal)) = x * Real.log (φ a) :=
      (div_eq_iff hlog_neg.ne).mp hfx
    have hnt : n • (a * x.toNNReal) = t := by
      apply NNReal.eq
      rw [nsmul_eq_mul, NNReal.coe_mul, NNReal.coe_natCast, NNReal.coe_mul,
        Real.coe_toNNReal x hx0]
      dsimp [x]
      field_simp [hn_rpos.ne', ha_pos.ne']
    have hlog_t : Real.log (φ t) = -r * (t : ℝ) := by
      calc Real.log (φ t)
          = Real.log (φ (n • (a * x.toNNReal))) := by rw [hnt]
        _ = Real.log (φ (a * x.toNNReal) ^ n) := by rw [hpow_nat]
        _ = (n : ℝ) * Real.log (φ (a * x.toNNReal)) := Real.log_pow _ _
        _ = (n : ℝ) * (x * Real.log (φ a)) := by rw [hlog_ax]
        _ = -r * (t : ℝ) := by dsimp [r, x]; field_simp [hn_rpos.ne', ha_pos.ne']
    rw [← hlog_t, Real.exp_log (hpos t)]
  refine ⟨r, ⟨hr_pos, hform⟩, fun r' ⟨_, hr'⟩ => ?_⟩
  have h1 := congrArg Real.log (hr' a)
  rw [Real.log_exp] at h1
  dsimp [r]
  field_simp [ha_pos.ne'] at h1 ⊢
  linarith

end Rigidity

/-!
==============================================================================
  PART 2: GAUSSIAN DETERMINATION UNDER COPY ROTATIONS (§2.1, §2.2)
==============================================================================
-/
section Gaussian

open MeasureTheory ProbabilityTheory Filter Set
open scoped Topology NNReal

def pairRot {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (c s : ℝ) (p : E × E) : E × E :=
  (c • p.1 + s • p.2, (-s) • p.1 + c • p.2)

def RotationInvariantCopies {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [MeasurableSpace E] (μ : Measure E) : Prop :=
  ∀ c s : ℝ, c ^ 2 + s ^ 2 = 1 → (μ.prod μ).map (pairRot c s) = μ.prod μ

theorem gaussianLaw_and_variance_of_charFun
    (μ : Measure ℝ) [IsFiniteMeasure μ] (r : ℝ) (hr : 0 ≤ r)
    (hφ : ∀ t : ℝ, charFun μ t = (Real.exp (-r * t ^ 2) : ℂ)) :
    μ = gaussianReal 0 ⟨2 * r, mul_nonneg zero_le_two hr⟩ ∧
      variance (id : ℝ → ℝ) μ = 2 * r := by
  let v : ℝ≥0 := ⟨2 * r, mul_nonneg zero_le_two hr⟩
  have hv : (v : ℝ) = 2 * r := rfl
  have hlaw : μ = gaussianReal 0 v := Measure.ext_of_charFun <| funext fun t => by
    rw [hφ t, charFun_gaussianReal, Complex.ofReal_exp]; congr 1; rw [hv]; push_cast; ring
  exact ⟨hlaw, by rw [hlaw, variance_id_gaussianReal, hv]⟩

theorem copyRotation_axis (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (h : RotationInvariantCopies μ) (a b : ℝ) :
    charFun μ a * charFun μ b = charFun μ (Real.sqrt (a ^ 2 + b ^ 2)) := by
  by_cases hz : a ^ 2 + b ^ 2 = 0
  · simp [sq_eq_zero_iff.mp (by nlinarith [sq_nonneg a, sq_nonneg b] : a ^ 2 = 0),
      sq_eq_zero_iff.mp (by nlinarith [sq_nonneg a, sq_nonneg b] : b ^ 2 = 0)]
  let r := Real.sqrt (a ^ 2 + b ^ 2)
  have hr : 0 < r := Real.sqrt_pos.2 (lt_of_le_of_ne (by positivity) (Ne.symm hz))
  have hcs : (a / r) ^ 2 + (b / r) ^ 2 = 1 := by
    rw [div_pow, div_pow, ← add_div, Real.sq_sqrt (by positivity), div_self hz]
  have hconv : (μ.map ((a / r) * ·)) ∗ (μ.map ((b / r) * ·)) = μ := by
    rw [Measure.conv, Measure.map_prod_map _ _ (by fun_prop) (by fun_prop),
      Measure.map_map (by fun_prop) (by fun_prop),
      show (fun p : ℝ × ℝ => p.1 + p.2) ∘ Prod.map ((a / r) * ·) ((b / r) * ·) =
        Prod.fst ∘ pairRot (a / r) (b / r) by ext p; simp [pairRot],
      ← Measure.map_map measurable_fst (by unfold pairRot; fun_prop), h _ _ hcs,
      Measure.map_fst_prod, measure_univ, one_smul]
  have := congrArg (fun ν => charFun ν r) hconv
  rw [charFun_conv, charFun_map_mul, charFun_map_mul, div_mul_cancel₀ _ hr.ne',
    div_mul_cancel₀ _ hr.ne'] at this
  exact this

/-- Opposite frequencies express the axis-law characteristic function as a squared norm. -/
theorem charFun_eq_normSq_of_axis {μ : Measure ℝ} [IsProbabilityMeasure μ]
    (axis : ∀ x y : ℝ, charFun μ x * charFun μ y =
      charFun μ (Real.sqrt (x ^ 2 + y ^ 2))) (t : ℝ) :
    charFun μ t = ((‖charFun μ (Real.sqrt (t ^ 2 / 2))‖ ^ 2 : ℝ) : ℂ) := by
  let a := Real.sqrt (t ^ 2 / 2)
  have h : a ^ 2 + (-a) ^ 2 = t ^ 2 := by
    rw [neg_sq, show a ^ 2 = t ^ 2 / 2 from Real.sq_sqrt (by positivity)]; ring
  calc charFun μ t = charFun μ (Real.sqrt (t ^ 2)) := by simpa using axis t 0
    _ = charFun μ a * charFun μ (-a) := by rw [axis, h]
    _ = _ := by rw [charFun_neg, Complex.mul_conj', Complex.ofReal_pow]

/-- Passing to norms preserves the full complex characteristic function and yields a
multiplicative radial profile on `ℝ≥0`. -/
theorem radial_norm_profile {μ : Measure ℝ} [IsProbabilityMeasure μ]
    (axis : ∀ x y : ℝ, charFun μ x * charFun μ y =
      charFun μ (Real.sqrt (x ^ 2 + y ^ 2))) :
    let K := fun u : ℝ≥0 => ‖charFun μ (Real.sqrt (u : ℝ))‖
    (∀ x y, K (x + y) = K x * K y) ∧ ∀ t : ℝ, charFun μ t = (K ⟨t ^ 2, sq_nonneg t⟩ : ℂ) := by
  refine ⟨fun x y => by
    simpa [Real.sq_sqrt x.property, Real.sq_sqrt y.property] using
      congrArg norm (axis (Real.sqrt (x : ℝ)) (Real.sqrt (y : ℝ))).symm, fun t => ?_⟩
  have h₀ : charFun μ t = charFun μ (Real.sqrt (t ^ 2)) := by simpa using axis t 0
  change charFun μ t = (‖charFun μ (Real.sqrt (t ^ 2))‖ : ℂ)
  rw [← h₀, charFun_eq_normSq_of_axis axis t]; simp

/-- The axis law forces a Gaussian characteristic function via the unified `interval_chord` engine. -/
theorem charFun_gaussian_of_axis {μ : Measure ℝ} [IsProbabilityMeasure μ]
    (axis : ∀ a b : ℝ, charFun μ a * charFun μ b = charFun μ (Real.sqrt (a ^ 2 + b ^ 2))) :
    ∃ r : ℝ, 0 ≤ r ∧ ∀ t : ℝ, charFun μ t = (Real.exp (-r * t ^ 2) : ℂ) := by
  let K (u : ℝ≥0) := ‖charFun μ (Real.sqrt (u : ℝ))‖
  obtain ⟨hm, hφ⟩ := radial_norm_profile axis
  have hp : ∀ u, 0 < K u := positive_real_profile (by dsimp [K]; fun_prop) (by simp [K]) hm
  obtain ⟨r, hr, _⟩ := positiveKernel_rate_of_bounded K
    ⟨0, by rintro _ ⟨u, _, rfl⟩; exact Real.log_nonpos (hp u).le (norm_charFun_le_one _)⟩ hp hm
  have hr₀ : Real.exp (-r) ≤ Real.exp 0 := by
    have h₁ : K 1 ≤ 1 := norm_charFun_le_one _
    rw [hr 1] at h₁; simpa using h₁
  exact ⟨r, by linarith [Real.exp_le_exp.mp hr₀],
    fun t => (hφ t).trans (congrArg Complex.ofReal (hr ⟨t ^ 2, sq_nonneg t⟩))⟩

theorem gaussian_of_copyRotation (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (h : RotationInvariantCopies μ) : ∃ v : ℝ≥0, μ = gaussianReal 0 v := by
  obtain ⟨r, hr, hφ⟩ := charFun_gaussian_of_axis (copyRotation_axis μ h)
  exact ⟨⟨2 * r, mul_nonneg zero_le_two hr⟩, (gaussianLaw_and_variance_of_charFun μ r hr hφ).1⟩

theorem gaussian_of_copyRotation_pos (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (h : RotationInvariantCopies μ) (hnd : μ ≠ Measure.dirac 0) :
    ∃ v : ℝ≥0, 0 < v ∧ μ = gaussianReal 0 v := by
  obtain ⟨v, hv⟩ := gaussian_of_copyRotation μ h
  exact ⟨v, pos_iff_ne_zero.mpr fun h0 => hnd (by rw [hv, h0, gaussianReal_zero_var]), hv⟩

theorem rotationInvariantCopies_map {E F : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [MeasurableSpace E] [BorelSpace E] [SecondCountableTopology E]
    [NormedAddCommGroup F] [NormedSpace ℝ F] [MeasurableSpace F] [BorelSpace F] [SecondCountableTopology F]
    (μ : Measure E) [SFinite μ] (hrot : RotationInvariantCopies μ)
    (L : E →L[ℝ] F) : RotationInvariantCopies (μ.map L) := fun c s hcs => by
  have hL : Measurable L := L.continuous.measurable
  rw [Measure.map_prod_map _ _ hL hL, Measure.map_map (by unfold pairRot; fun_prop) (hL.prodMap hL),
    show pairRot c s ∘ Prod.map L L = Prod.map L L ∘ pairRot c s by
      ext ⟨x, y⟩ <;> simp [pairRot, map_add, map_smul],
    ← Measure.map_map (hL.prodMap hL) (by unfold pairRot; fun_prop), hrot c s hcs]

theorem finiteGaussian_of_copyRotation {Ω E : Type*} [MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [MeasurableSpace E] [BorelSpace E]
    [SecondCountableTopology E] [CompleteSpace E]
    (P : Measure Ω) [IsProbabilityMeasure P] (X : Ω → E) (hX : Measurable X)
    (hcopies : ∀ L : E →L[ℝ] ℝ, RotationInvariantCopies (P.map (fun ω => L (X ω)))) :
    HasGaussianLaw X P ∧
      ∀ L : E →L[ℝ] ℝ,
        (∫ x, L x ∂(P.map X)) = 0 ∧
        (P.map X).map L = gaussianReal 0 (variance L (P.map X)).toNNReal := by
  have hscalar (L : E →L[ℝ] ℝ) : ∃ v : ℝ≥0, (P.map X).map L = gaussianReal 0 v := by
    have : IsProbabilityMeasure (P.map (fun ω => L (X ω))) :=
      (Measure.isProbabilityMeasure_map_iff (L.continuous.measurable.comp hX).aemeasurable).2 inferInstance
    obtain ⟨v, hv⟩ := gaussian_of_copyRotation _ (hcopies L)
    exact ⟨v, (Measure.map_map L.continuous.measurable hX).trans hv⟩
  have hg : IsGaussian (P.map X) := isGaussian_of_map_eq_gaussianReal fun L =>
    let ⟨v, hv⟩ := hscalar L; ⟨0, v, hv⟩
  refine ⟨⟨hX.aemeasurable, hg⟩, fun L => ?_⟩
  obtain ⟨v, hv⟩ := hscalar L
  have hcan := IsGaussian.map_eq_gaussianReal (μ := P.map X) L
  have hmean := (gaussianReal_ext_iff.mp (hcan.symm.trans hv)).1
  exact ⟨hmean, by simpa only [hmean] using hcan⟩

theorem jointCharacteristic_centered {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]
    [MeasurableSpace E] [BorelSpace E] [SecondCountableTopology E]
    (μ : Measure E) [IsGaussian μ]
    (hmean : ∀ L : E →L[ℝ] ℝ, (∫ x, L x ∂μ) = 0) :
    (∫ x, x ∂μ) = 0 ∧
      ∀ t : E, charFun μ t = Complex.exp (-(covarianceBilin μ t t : ℂ) / 2) := by
  have hz : (∫ x, x ∂μ) = 0 := SeparatingDual.eq_zero_of_forall_dual_eq_zero (R := ℝ) fun L => by
    rw [← L.integral_comp_id_comm IsGaussian.integrable_id]; exact hmean L
  exact ⟨hz, fun t => by simpa [id_eq, hz, neg_div] using IsGaussian.charFun_eq' (μ := μ) t⟩

theorem vectorGaussian_of_copyRotation {Ω E : Type*} [MeasurableSpace Ω]
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]
    [MeasurableSpace E] [BorelSpace E] [SecondCountableTopology E]
    (P : Measure Ω) [IsProbabilityMeasure P] (X : Ω → E) (hX : Measurable X)
    (hcopies : RotationInvariantCopies (P.map X)) :
    HasGaussianLaw X P ∧ (∫ x, x ∂(P.map X)) = 0 ∧
      ∀ t : E, charFun (P.map X) t = Complex.exp (-(covarianceBilin (P.map X) t t : ℂ) / 2) := by
  have : IsProbabilityMeasure (P.map X) :=
    (Measure.isProbabilityMeasure_map_iff hX.aemeasurable).2 inferInstance
  have h := finiteGaussian_of_copyRotation P X hX fun L => by
    rw [show (fun ω => L (X ω)) = L ∘ X from rfl, ← Measure.map_map L.continuous.measurable hX]
    exact rotationInvariantCopies_map (P.map X) hcopies L
  have := h.1.isGaussian_map
  exact ⟨h.1, jointCharacteristic_centered (P.map X) fun L => (h.2 L).1⟩

/-- Two copy-rotation-invariant laws on a Banach space agree iff all linear variances agree. -/
theorem eq_iff_covariance {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [MeasurableSpace E] [BorelSpace E] [SecondCountableTopology E] [CompleteSpace E]
    {μ ν : Measure E} [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (hμ : RotationInvariantCopies μ) (hν : RotationInvariantCopies ν) :
    μ = ν ↔ ∀ L : E →L[ℝ] ℝ, variance L μ = variance L ν := by
  refine ⟨fun e => e ▸ fun _ => rfl, fun h => Measure.ext_of_charFunDual <| funext fun L => ?_⟩
  have hproj (ρ : Measure E) [IsProbabilityMeasure ρ] (hρ : RotationInvariantCopies ρ) :
      ρ.map L = gaussianReal 0 (variance L ρ).toNNReal := by
    simpa using ((finiteGaussian_of_copyRotation ρ id measurable_id fun M => by
      simpa using rotationInvariantCopies_map ρ hρ M).2 L).2
  rw [charFunDual_eq_charFun_map_one, charFunDual_eq_charFun_map_one, hproj μ hμ, hproj ν hν, h]

/-- Linearity reduces every finite list of field readings `(Φ(f₁), …, Φ(fₖ))` to single readings. -/
theorem linearField_finiteGaussian_of_copyRotation {Ω V : Type*} [MeasurableSpace Ω]
    [AddCommGroup V] [Module ℝ V] (P : Measure Ω) [IsProbabilityMeasure P]
    (Φ : Ω → V →ₗ[ℝ] ℝ) (hmeas : ∀ v : V, Measurable (fun ω => Φ ω v))
    (hrot : ∀ v : V, RotationInvariantCopies (P.map (fun ω => Φ ω v)))
    {k : ℕ} (f : Fin k → V) :
    let X : Ω → EuclideanSpace ℝ (Fin k) := fun ω => WithLp.toLp 2 (fun i => Φ ω (f i))
    HasGaussianLaw X P ∧ (∫ x, x ∂(P.map X)) = 0 ∧
      ∀ ξ : Fin k → ℝ,
        charFun (P.map X) (WithLp.toLp 2 ξ) =
          (Real.exp (-variance (fun ω => Φ ω (∑ i, ξ i • f i)) P / 2) : ℂ) := by
  intro X
  have hX : Measurable X :=
    (MeasurableEquiv.toLp 2 (Fin k → ℝ)).measurable.comp (Measurable.of_eval fun i => hmeas (f i))
  have hlin (L : EuclideanSpace ℝ (Fin k) →L[ℝ] ℝ) (ω : Ω) :
      L (X ω) = Φ ω (∑ i, L (EuclideanSpace.single i 1) • f i) := by
    rw [map_sum]; simp_rw [map_smul, smul_eq_mul]
    conv_lhs => rw [← (EuclideanSpace.basisFun (Fin k) ℝ).sum_repr (X ω)]
    rw [map_sum]; exact Finset.sum_congr rfl fun i _ => by simp [X, mul_comm]
  have hfg := finiteGaussian_of_copyRotation P X hX fun L => by
    simpa only [hlin L] using hrot (∑ i, L (EuclideanSpace.single i 1) • f i)
  have := hfg.1.isGaussian_map
  have hjc := jointCharacteristic_centered (P.map X) fun L => (hfg.2 L).1
  refine ⟨hfg.1, hjc.1, fun ξ => ?_⟩
  set t := WithLp.toLp 2 ξ
  have hinner : (fun u => inner ℝ t u) ∘ X = fun ω => Φ ω (∑ i, ξ i • f i) := funext fun ω => by
    rw [Function.comp_apply, EuclideanSpace.inner_eq_star_dotProduct, map_sum]
    simp [t, X, dotProduct, mul_comm]
  rw [hjc.2 t, covarianceBilin_self IsGaussian.memLp_two_id,
    variance_map (by fun_prop) hX.aemeasurable, hinner, Complex.ofReal_exp]
  simp [neg_div]

/-- Direct §2.2 → §3.1 bridge: copy-rotation symmetry plus variance `‖v‖²` supplies the
exact characteristic-function hypothesis of the Wick overlap identity. -/
theorem charFun_of_copyRotation_variance {Ω E : Type*} [MeasurableSpace Ω]
    [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (P : Measure Ω) [IsProbabilityMeasure P] (Φ : Ω → E →ₗ[ℝ] ℝ)
    (hmeas : ∀ v : E, Measurable (fun ω => Φ ω v))
    (hrot : ∀ v : E, RotationInvariantCopies (P.map (fun ω => Φ ω v)))
    (hvar : ∀ v : E, variance (fun ω => Φ ω v) P = ‖v‖ ^ 2) (v : E) :
    (∫ ω, Complex.exp ((Φ ω v : ℂ) * Complex.I) ∂P) = (Real.exp (-(‖v‖ ^ 2) / 2) : ℂ) := by
  have : IsProbabilityMeasure (P.map (fun ω => Φ ω v)) :=
    (Measure.isProbabilityMeasure_map_iff (hmeas v).aemeasurable).2 inferInstance
  obtain ⟨r, hr, hφ⟩ := charFun_gaussian_of_axis (copyRotation_axis _ (hrot v))
  have hv := (gaussianLaw_and_variance_of_charFun _ r hr hφ).2
  rw [variance_map measurable_id.aemeasurable (hmeas v).aemeasurable] at hv
  change variance (fun ω => Φ ω v) P = 2 * r at hv
  have h1 := hφ 1
  rw [charFun_apply_real, integral_map (hmeas v).aemeasurable (by fun_prop)] at h1
  simpa [show r = ‖v‖ ^ 2 / 2 by linarith [hvar v], neg_div] using h1

theorem no_copyRotation_of_nonzero_atom (μ : Measure ℝ) [IsProbabilityMeasure μ]
    {x : ℝ} (hx : x ≠ 0) (hm : μ {x} ≠ 0) : ¬ RotationInvariantCopies μ := fun h => by
  obtain ⟨v, rfl⟩ := gaussian_of_copyRotation μ h
  by_cases h0 : v = 0
  · exact hm (by simp [h0, Ne.symm hx])
  · have := nullSingletonClass_gaussianReal (μ := 0) h0; exact hm (by simp)

noncomputable def fairSign : Measure ℝ :=
  (1 / 2 : ENNReal) • Measure.dirac (1 : ℝ) + (1 / 2 : ENNReal) • Measure.dirac (-1 : ℝ)

theorem fairSign_not_rotationInvariant : ¬ RotationInvariantCopies fairSign := by
  have : IsProbabilityMeasure fairSign := ⟨by
    simp only [fairSign, Measure.coe_add, Measure.coe_smul, Pi.add_apply, Pi.smul_apply,
      Measure.dirac_apply_of_mem (Set.mem_univ _), smul_eq_mul, mul_one, ENNReal.add_halves]⟩
  exact no_copyRotation_of_nonzero_atom fairSign one_ne_zero (by simp [fairSign])

/-- Rotating two independent fair ±1 coins by 45° puts probability `1/2` on `0`. -/
theorem fairSign_rot45_zeros_half :
    (fairSign.prod fairSign) {p : ℝ × ℝ | p.1 = 0} = 0 ∧
    ((fairSign.prod fairSign).map (pairRot (1 / Real.sqrt 2) (1 / Real.sqrt 2)))
      {p : ℝ × ℝ | p.1 = 0} = 1 / 2 := by
  have hm : MeasurableSet {p : ℝ × ℝ | p.1 = 0} :=
    (isClosed_eq continuous_fst continuous_const).measurableSet
  have h14 : (1 / 4 : ENNReal) + 1 / 4 = 1 / 2 := by
    rw [show (1 / 4 : ENNReal) + 1 / 4 = 2 * (1 / 4) by rw [two_mul],
      show (4 : ENNReal) = 2 * 2 by norm_num, one_div,
      ENNReal.mul_inv (Or.inl (by norm_num)) (Or.inl (by norm_num)),
      ← mul_assoc, ENNReal.mul_inv_cancel (by norm_num) (by norm_num), one_mul, one_div]
  have h22 : (1 / 2 : ENNReal) * (1 / 2) = 1 / 4 := by
    rw [one_div, one_div, ← ENNReal.mul_inv (Or.inl (by norm_num)) (Or.inl (by norm_num))]; norm_num
  have hprod : fairSign.prod fairSign =
      (1 / 4 : ENNReal) • Measure.dirac ((1 : ℝ), (1 : ℝ)) +
      (1 / 4 : ENNReal) • Measure.dirac ((-1 : ℝ), (1 : ℝ)) +
      (1 / 4 : ENNReal) • Measure.dirac ((1 : ℝ), (-1 : ℝ)) +
      (1 / 4 : ENNReal) • Measure.dirac ((-1 : ℝ), (-1 : ℝ)) := by
    simp only [fairSign, Measure.prod_add, Measure.add_prod, Measure.prod_smul_left,
      Measure.prod_smul_right, smul_add, Measure.dirac_prod_dirac, smul_smul, h22, add_assoc]
  refine ⟨by rw [hprod]; simp [Set.indicator], ?_⟩
  have hrm : Measurable (pairRot (E := ℝ) (1 / Real.sqrt 2) (1 / Real.sqrt 2)) := by
    unfold pairRot; fun_prop
  rw [Measure.map_apply hrm hm, hprod]
  simp [Set.indicator, pairRot]
  simpa [one_div] using h14

end Gaussian

/-!
==============================================================================
  PART 3: LATTICE MAX-ENTROPY, GIBBS LAW, BOX RP & CONTINUUM LIMIT (§2.3)
==============================================================================
-/
section Lattice

open Matrix
open scoped BigOperators MatrixOrder

/-- The rows of the incidence matrix are the supplied oriented nearest-neighbour differences. -/
def incidence {V E : Type*} [Fintype V] [DecidableEq V] [Fintype E]
    (u v : E → V) : Matrix E V ℝ := fun e =>
  Pi.single (u e) 1 - Pi.single (v e) 1

/-- The covariance moment of the selected differences is `tr(L C)` with `L = Bᵀ B`. -/
theorem edge_trace {V E : Type*} [Fintype V] [DecidableEq V] [Fintype E]
    (u v : E → V) (C : Matrix V V ℝ) :
    ((incidence u v)ᵀ * incidence u v * C).trace =
      ∑ e, (C (u e) (u e) - C (v e) (u e) - C (u e) (v e) + C (v e) (v e)) := by
  let B := incidence u v
  change (Bᵀ * B * C).trace = _
  rw [Matrix.mul_assoc, Matrix.trace_mul_comm]
  refine Finset.sum_congr rfl fun e _ => ?_
  have hrow (i : V) : (B * C) e i = C (u e) i - C (v e) i := by
    change (Pi.single (u e) (1 : ℝ) - Pi.single (v e) 1) ⬝ᵥ (fun k => C k i) = _
    rw [sub_dotProduct, single_dotProduct, single_dotProduct, one_mul, one_mul]
  change (fun i => (B * C) e i) ⬝ᵥ (Pi.single (u e) (1 : ℝ) - Pi.single (v e) 1) = _
  rw [dotProduct_sub, dotProduct_single, dotProduct_single, mul_one, mul_one, hrow, hrow]; ring

/-- Free-boundary four-site square Laplacian, vertices numbered cyclically. -/
def squareLap : Matrix (Fin 4) (Fin 4) ℝ :=
  !![2, -1, 0, -1; -1, 2, -1, 0; 0, -1, 2, -1; -1, 0, -1, 2]

/-- Symmetry alone does not force affine precision: on the 4-site square, `I + L²` is
positive definite, commutes with every symmetry of `L`, and lies outside `span(I, L)`. -/
theorem square_symmetry_allows_extra_precision :
    let L := squareLap
    let Q := 1 + L ^ 2
    Q.PosDef ∧ (∀ U, Commute U L → Commute U Q) ∧
      ¬ ∃ a b : ℝ, Q = a • (1 : Matrix (Fin 4) (Fin 4) ℝ) + b • L := by
  have hs : squareLapᴴ = squareLap := by
    ext i j; fin_cases i <;> fin_cases j <;> norm_num [squareLap, Matrix.conjTranspose_apply]
  refine ⟨Matrix.PosDef.one.add_posSemidef (by
      simpa only [hs, pow_two] using Matrix.posSemidef_conjTranspose_mul_self squareLap),
    fun U h => (Commute.one_right U).add_right (h.pow_right 2), fun ⟨a, b, h⟩ => ?_⟩
  have h02 := congrArg (fun M : Matrix (Fin 4) (Fin 4) ℝ => M 0 2) h
  norm_num [squareLap, pow_two, Matrix.mul_apply, Fin.sum_univ_four, Matrix.one_apply] at h02

/-- Exact lattice stiffness identity: `N (ℓ̄ - r) = β ∑ w_i (ℓ_i - r)²`. -/
theorem stiffness_contrast {ι : Type*} [Fintype ι] (ℓ w : ι → ℝ) (a k m x : ℝ)
    (hinv : ∀ i, (a + k * ℓ i) * w i = 1)
    (hm : (Fintype.card ι : ℝ) * m = ∑ i, ℓ i)
    (hx : (∑ i, w i) * x = ∑ i, ℓ i * w i) :
    (Fintype.card ι : ℝ) * (m - x) = k * ∑ i, w i * (ℓ i - x) ^ 2 := by
  have center : ∑ i, (ℓ i - x) * w i = 0 := by
    simp only [sub_mul, Finset.sum_sub_distrib, ← Finset.mul_sum]; linarith
  have expand (i : ι) : ℓ i - x = (a + k * x) * ((ℓ i - x) * w i) + k * (w i * (ℓ i - x) ^ 2) := by
    linear_combination (x - ℓ i) * hinv i
  calc (Fintype.card ι : ℝ) * (m - x)
      = ∑ i, (ℓ i - x) := by simp [Finset.sum_sub_distrib, ← hm, mul_sub]
    _ = _ := by
      rw [Finset.sum_congr rfl fun i _ => expand i]
      simp [Finset.sum_add_distrib, ← Finset.mul_sum, center]

/-- Sign trichotomy for stiffness `k` whenever the spectrum has two distinct eigenvalues. -/
theorem stiffness_sign_iff {ι : Type*} [Fintype ι] [Nonempty ι] (ℓ w : ι → ℝ) (a k m x : ℝ)
    (hinv : ∀ i, (a + k * ℓ i) * w i = 1) (hw : ∀ i, 0 < w i)
    (hm : (Fintype.card ι : ℝ) * m = ∑ i, ℓ i)
    (hx : (∑ i, w i) * x = ∑ i, ℓ i * w i) (hv : ∃ i j, ℓ i ≠ ℓ j) :
    (x < m ↔ 0 < k) ∧ (x = m ↔ k = 0) ∧ (m < x ↔ k < 0) := by
  obtain ⟨i, j, hij⟩ := hv
  obtain ⟨t, ht⟩ : ∃ t, ℓ t ≠ x := by by_contra! h; exact hij ((h i).trans (h j).symm)
  have hV : 0 < ∑ i, w i * (ℓ i - x) ^ 2 := Finset.sum_pos'
    (fun i _ => mul_nonneg (hw i).le (sq_nonneg _))
    ⟨t, Finset.mem_univ _, mul_pos (hw t) (sq_pos_of_ne_zero (sub_ne_zero.mpr ht))⟩
  have hn : (0 : ℝ) < Fintype.card ι := by exact_mod_cast Fintype.card_pos
  have h := stiffness_contrast ℓ w a k m x hinv hm hx
  exact ⟨by rw [← sub_pos, ← mul_pos_iff_of_pos_left hn, h, mul_pos_iff_of_pos_right hV],
    by rw [eq_comm, ← sub_eq_zero, ← mul_eq_zero_iff_left hn.ne', h, mul_eq_zero]; simp [hV.ne'],
    by
      have hn' : (Fintype.card ι : ℝ) * (x - m) = (-k) * (∑ i, w i * (ℓ i - x) ^ 2) := by
        linear_combination -h
      rw [← sub_pos, ← mul_pos_iff_of_pos_left hn, hn', mul_pos_iff_of_pos_right hV, neg_pos]⟩

/-- Quotient form of the lattice stiffness threshold at `ℓ̄ = (∑ ℓ_i) / N`. -/
theorem trace_threshold {ι : Type*} [Fintype ι] [Nonempty ι] (ℓ : ι → ℝ) (a k : ℝ)
    (hp : ∀ i, 0 < a + k * ℓ i) (hv : ∃ i j, ℓ i ≠ ℓ j) :
    let w i := (a + k * ℓ i)⁻¹
    let m := (∑ i, ℓ i) / Fintype.card ι
    let x := (∑ i, ℓ i * w i) / (∑ i, w i)
    (x < m ↔ 0 < k) ∧ (x = m ↔ k = 0) ∧ (m < x ↔ k < 0) := by
  dsimp only
  have hn : (0 : ℝ) < Fintype.card ι := by exact_mod_cast Fintype.card_pos
  have hw i := inv_pos.mpr (hp i)
  have hS := Finset.sum_pos (fun i _ => hw i) Finset.univ_nonempty
  exact stiffness_sign_iff ℓ _ a k _ _ (fun i => mul_inv_cancel₀ (hp i).ne') hw
    (mul_div_cancel₀ _ hn.ne') (mul_div_cancel₀ _ hS.ne') hv

/-- Arithmetic and harmonic means of the precision differ by `k² / N` times the weighted dispersion. -/
theorem arithmetic_harmonic {ι : Type*} [Fintype ι] [Nonempty ι] (ℓ w : ι → ℝ) (a k m x : ℝ)
    (hinv : ∀ i, (a + k * ℓ i) * w i = 1) (hw : ∀ i, 0 < w i)
    (hm : (Fintype.card ι : ℝ) * m = ∑ i, ℓ i)
    (hx : (∑ i, w i) * x = ∑ i, ℓ i * w i) :
    let N : ℝ := Fintype.card ι
    let S := ∑ i, w i
    N / S = a + k * x ∧ N * ((a + k * m) - N / S) = k ^ 2 * ∑ i, w i * (ℓ i - x) ^ 2 := by
  have hS := Finset.sum_pos (fun i _ => hw i) Finset.univ_nonempty
  have he := Finset.sum_congr (s₁ := Finset.univ) rfl (fun i _ => hinv i)
  simp only [add_mul, mul_assoc, Finset.sum_add_distrib, ← Finset.mul_sum,
    Finset.sum_const, Finset.card_univ, nsmul_eq_mul, mul_one, ← hx] at he
  have hH : (Fintype.card ι : ℝ) / (∑ i, w i) = a + k * x :=
    (div_eq_iff hS.ne').mpr (by linear_combination -he)
  exact ⟨hH, by rw [hH]; linear_combination k * stiffness_contrast ℓ w a k m x hinv hm hx⟩

/-- Two positive affine precisions fitting the same two traces agree at every mode;
coefficients agree uniquely whenever the spectrum varies. -/
theorem affine_precision_determined {ι : Type*} [Fintype ι] (ℓ w z : ι → ℝ) (a k b l : ℝ)
    (hw : ∀ i, 0 < w i) (hz : ∀ i, 0 < z i)
    (hi : ∀ i, (a + k * ℓ i) * w i = 1) (hj : ∀ i, (b + l * ℓ i) * z i = 1)
    (hs : ∑ i, z i = ∑ i, w i) (he : ∑ i, ℓ i * z i = ∑ i, ℓ i * w i) :
    w = z ∧ ((∃ i j, ℓ i ≠ ℓ j) → a = b ∧ k = l) := by
  let d i := a - b + (k - l) * ℓ i
  have diff (i) : z i - w i = d i * (w i * z i) := by
    dsimp [d]; linear_combination w i * hj i - z i * hi i
  have expand (i) : (d i) ^ 2 * (w i * z i) =
      (a - b) * (z i - w i) + (k - l) * (ℓ i * z i - ℓ i * w i) := by
    rw [show (d i) ^ 2 * (w i * z i) = d i * (d i * (w i * z i)) by ring, ← diff]; dsimp [d]; ring
  have hzero : ∑ i, (d i) ^ 2 * (w i * z i) = 0 := by
    simp_rw [expand, Finset.sum_add_distrib, ← Finset.mul_sum, Finset.sum_sub_distrib, hs, he]; ring
  have hd (i) : d i = 0 := by
    have h := (Finset.sum_eq_zero_iff_of_nonneg (s := Finset.univ) fun j _ =>
      mul_nonneg (sq_nonneg (d j)) (mul_nonneg (hw j).le (hz j).le)).mp hzero i (Finset.mem_univ i)
    exact sq_eq_zero_iff.mp ((mul_eq_zero.mp h).resolve_right (mul_pos (hw i) (hz i)).ne')
  refine ⟨funext fun i => (sub_eq_zero.mp (by rw [diff, hd, zero_mul])).symm, fun ⟨i, j, hij⟩ => ?_⟩
  have hk := sub_eq_zero.mp ((mul_eq_zero.mp (show (k - l) * (ℓ i - ℓ j) = 0 by
    linear_combination hd i - hd j)).resolve_right (sub_ne_zero.mpr hij))
  exact ⟨sub_eq_zero.mp (by simpa [d, hk] using hd i), hk⟩

/-- With constant spectrum, stiffness is unobservable from site and edge moments alone. -/
theorem constant_ambiguity {ι : Type*} (ℓ : ι → ℝ) (c a k t : ℝ) (hc : ∀ i, ℓ i = c) (i : ι) :
    (a - t * c) + (k + t) * ℓ i = a + k * ℓ i := by rw [hc]; ring

private theorem centered_inverse_exists {ι : Type*} [Fintype ι] (x : ι → ℝ)
    (lo hi : ι) (hlo : x lo < 0) (hhi : 0 < x hi)
    (hmin : ∀ i, x lo ≤ x i) (hmax : ∀ i, x i ≤ x hi) :
    ∃ b : ℝ, (∀ i, 0 < 1 + b * x i) ∧ ∑ i, x i * (1 + b * x i)⁻¹ = 0 := by
  classical
  let d (i : ι) (b : ℝ) := 1 + b * x i
  let D (b : ℝ) := ∏ i, d i b
  let a : ℝ := -(x hi)⁻¹; let z : ℝ := -(x lo)⁻¹
  have hahi : d hi a = 0 := by simp [d, a, hhi.ne']
  have hzlo : d lo z = 0 := by simp [d, z, hlo.ne]
  have hder (b : ℝ) : HasDerivAt D (∑ i, (∏ j ∈ Finset.univ.erase i, d j b) * x i) b :=
    HasDerivAt.fun_finsetProd fun i _ => by
      simpa [d] using ((hasDerivAt_id b).mul_const (x i)).const_add (1 : ℝ)
  obtain ⟨b, hb, hzero⟩ := exists_hasDerivAt_eq_zero
    ((neg_neg_of_pos (inv_pos.mpr hhi)).trans (neg_pos.mpr (inv_lt_zero.mpr hlo)))
    (continuous_iff_continuousAt.mpr fun t => (hder t).continuousAt).continuousOn
    ((Finset.prod_eq_zero (Finset.mem_univ hi) hahi).trans
      (Finset.prod_eq_zero (Finset.mem_univ lo) hzlo).symm)
    (fun t _ => hder t)
  have hd (i : ι) : 0 < d i b := by
    change 0 < 1 + b * x i; change 1 + a * x hi = 0 at hahi; change 1 + z * x lo = 0 at hzlo
    by_cases hs : 0 ≤ b
    · linarith only [hzlo, mul_lt_mul_of_neg_right hb.2 hlo, mul_le_mul_of_nonneg_left (hmin i) hs]
    · linarith only [hahi, mul_lt_mul_of_pos_right hb.1 hhi,
        mul_le_mul_of_nonpos_left (hmax i) (le_of_not_ge hs)]
  have hD : 0 < D b := Finset.prod_pos fun i _ => hd i
  change ∃ b, (∀ i, 0 < d i b) ∧ ∑ i, x i * (d i b)⁻¹ = 0
  refine ⟨b, hd, (mul_eq_zero.mp ?_).resolve_left hD.ne'⟩
  rw [Finset.mul_sum]
  convert hzero using 1
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [show D b = (∏ j ∈ Finset.univ.erase i, d j b) * d i b from
    (Finset.prod_erase_mul _ _ (Finset.mem_univ i)).symm]
  field_simp [(hd i).ne']

/-- Rolle's theorem on `∏ (1 + t(ℓ_i - r))` produces a positive affine precision
realizing any positive site trace `S` and interior ratio `ℓ_min < r < ℓ_max`. -/
theorem affine_precision_realizes_targets {ι : Type*} [Fintype ι]
    (ell : ι → ℝ) (S r : ℝ) (hS : 0 < S) (lo hi : ι)
    (hmin : ∀ i, ell lo ≤ ell i) (hmax : ∀ i, ell i ≤ ell hi)
    (hl : ell lo < r) (hr : r < ell hi) :
    ∃ α β : ℝ, (∀ i, 0 < α + β * ell i) ∧
      (∑ i, (α + β * ell i)⁻¹) = S ∧ (∑ i, ell i * (α + β * ell i)⁻¹) = r * S := by
  obtain ⟨b, hd, hzero⟩ := centered_inverse_exists (fun i => ell i - r) lo hi
    (sub_neg.mpr hl) (sub_pos.mpr hr) (fun i => sub_le_sub_right (hmin i) r)
    (fun i => sub_le_sub_right (hmax i) r)
  let w (i : ι) := (1 + b * (ell i - r))⁻¹
  let T : ℝ := ∑ i, w i
  have hT : 0 < T := Finset.sum_pos (fun i _ => inv_pos.mpr (hd i)) ⟨lo, Finset.mem_univ _⟩
  have hE : ∑ i, ell i * w i = r * T := by
    simpa only [sub_mul, Finset.sum_sub_distrib, ← Finset.mul_sum, sub_eq_zero] using hzero
  let c := T / S
  have hq (i : ι) : c * (1 - b * r) + c * b * ell i = c * (1 + b * (ell i - r)) := by ring
  refine ⟨c * (1 - b * r), c * b, fun i => (hq i).symm ▸ mul_pos (div_pos hT hS) (hd i), ?_, ?_⟩
  · simp_rw [hq, mul_inv, ← Finset.mul_sum]; change c⁻¹ * T = S; dsimp [c]; field_simp
  · simp_rw [hq, mul_inv, mul_left_comm _ c⁻¹, ← Finset.mul_sum]; change c⁻¹ * ∑ i, ell i * w i = r * S
    rw [hE]; dsimp [c]; field_simp

/-- The open interval `(ℓ_min, ℓ_max)` is the exact feasible range of the edge-to-site ratio. -/
theorem affine_precision_targets_iff {ι : Type*} [Fintype ι]
    (ell : ι → ℝ) (S r : ℝ) (lo hi : ι)
    (hmin : ∀ i, ell lo ≤ ell i) (hmax : ∀ i, ell i ≤ ell hi) (hne : ell lo < ell hi) :
    (∃ α β : ℝ, (∀ i, 0 < α + β * ell i) ∧
      (∑ i, (α + β * ell i)⁻¹) = S ∧ (∑ i, ell i * (α + β * ell i)⁻¹) = r * S) ↔
      0 < S ∧ ell lo < r ∧ r < ell hi := by
  refine ⟨fun ⟨α, β, hd, hs, he⟩ => ?_, fun ⟨hS, hl, hr⟩ =>
    affine_precision_realizes_targets ell S r hS lo hi hmin hmax hl hr⟩
  have hw (i : ι) : 0 < (α + β * ell i)⁻¹ := inv_pos.mpr (hd i)
  have hS : 0 < S := hs ▸ Finset.sum_pos (fun i _ => hw i) ⟨lo, Finset.mem_univ _⟩
  have hl : 0 < ∑ i, (ell i - ell lo) * (α + β * ell i)⁻¹ := Finset.sum_pos'
    (fun i _ => mul_nonneg (sub_nonneg.mpr (hmin i)) (hw i).le)
    ⟨hi, Finset.mem_univ _, mul_pos (sub_pos.mpr hne) (hw hi)⟩
  have hh : 0 < ∑ i, (ell hi - ell i) * (α + β * ell i)⁻¹ := Finset.sum_pos'
    (fun i _ => mul_nonneg (sub_nonneg.mpr (hmax i)) (hw i).le)
    ⟨lo, Finset.mem_univ _, mul_pos (sub_pos.mpr hne) (hw lo)⟩
  simp only [sub_mul, Finset.sum_sub_distrib, ← Finset.mul_sum, he, hs, sub_pos] at hl hh
  exact ⟨hS, (mul_lt_mul_iff_of_pos_right hS).mp hl, (mul_lt_mul_iff_of_pos_right hS).mp hh⟩

/-- Strict matrix log-det tangent inequality: `log(det A) < tr(A) - N` for positive definite `A ≠ I`. -/
theorem logdet_lt_trace_sub_card {n : Type*} [Fintype n] [DecidableEq n]
    {A : Matrix n n ℝ} (hA : A.PosDef) (h : A ≠ 1) :
    Real.log A.det < A.trace - Fintype.card n := by
  classical
  let e := hA.isHermitian.eigenvalues
  have hp (i : n) : 0 < e i := hA.eigenvalues_pos i
  obtain ⟨i, hi⟩ : ∃ i, e i ≠ 1 := by
    by_contra! he
    exact h (hA.isHermitian.spectral_theorem.trans <| by
      change Unitary.conjStarAlgAut ℝ _ _ (diagonal (RCLike.ofReal ∘ e)) = 1
      simp [show e = fun _ => 1 from funext he])
  have hs := Finset.sum_lt_sum (fun j _ => Real.log_le_sub_one_of_pos (hp j))
    ⟨i, Finset.mem_univ _, Real.log_lt_sub_one_of_pos (hp i) hi⟩
  rw [hA.isHermitian.det_eq_prod_eigenvalues, hA.isHermitian.trace_eq_sum_eigenvalues]
  change Real.log (∏ i, e i) < (∑ i, e i) - _
  rw [Real.log_prod fun j _ => (hp j).ne']
  simpa [Finset.sum_sub_distrib] using hs

/-- Whitening certificate: a covariance with positive affine precision `a I + b L` strictly
maximizes `det C` among all positive definite matrices matching `tr(C)` and `tr(L C)`. -/
theorem affine_precision_strict_max {n : Type*} [Fintype n] [DecidableEq n]
    {C D L : Matrix n n ℝ} (hC : C.PosDef) (hD : D.PosDef)
    (a b : ℝ) (hprec : C⁻¹ = a • (1 : Matrix n n ℝ) + b • L)
    (hsite : D.trace = C.trace) (hedge : (L * D).trace = (L * C).trace)
    (hne : D ≠ C) : D.det < C.det := by
  classical
  let := hC.isUnit.invertible
  obtain ⟨S, hS, hfac⟩ := CStarAlgebra.isStrictlyPositive_iff_eq_star_mul_self.mp
    hC.inv.isStrictlyPositive
  have hwhite : S * C * star S = 1 := hS.mul_right_cancel <| by
    rw [mul_assoc (S * C), ← hfac, mul_assoc S, Matrix.mul_inv_of_invertible, mul_one, one_mul]
  have hne' : S * D * star S ≠ 1 := fun heq =>
    hne (hS.mul_left_cancel ((isUnit_star.mpr hS).mul_right_cancel (heq.trans hwhite.symm)))
  have ht : (S * D * star S).trace = Fintype.card n := by
    rw [Matrix.trace_mul_cycle, ← hfac,
      show (C⁻¹ * D).trace = (C⁻¹ * C).trace by
        simp only [hprec, add_mul, Matrix.smul_mul, one_mul, Matrix.trace_add, Matrix.trace_smul,
          hsite, hedge],
      Matrix.inv_mul_of_invertible, Matrix.trace_one]
  have hp : (S * D * star S).PosDef :=
    hD.mul_mul_conjTranspose_same (B := S) (Matrix.vecMul_injective_iff_isUnit.mpr hS)
  have hlog := logdet_lt_trace_sub_card hp hne'
  rw [ht, sub_self, ← Real.log_one] at hlog
  have hdet := (Real.log_lt_log_iff hp.det_pos zero_lt_one).mp hlog
  rw [← Matrix.det_one (n := n) (R := ℝ), ← hwhite] at hdet
  simp only [Matrix.det_mul, Matrix.star_eq_conjTranspose, Matrix.det_conjTranspose, star_trivial] at hdet
  by_contra! hle
  nlinarith [mul_nonneg (sub_nonneg.mpr hle) (sq_nonneg S.det)]

/-- Spectral evaluation of `tr(Q⁻¹)` and `tr(L Q⁻¹)` for an arbitrary symmetric regulator `L`. -/
theorem affine_covariance_traces {n : Type*} [Fintype n] [DecidableEq n]
    {L : Matrix n n ℝ} (hL : L.IsHermitian)
    (a b : ℝ) (hp : ∀ i, 0 < a + b * hL.eigenvalues i) :
    let Q := a • (1 : Matrix n n ℝ) + b • L
    let w (i : n) := (a + b * hL.eigenvalues i)⁻¹
    Q⁻¹.PosDef ∧ (Q⁻¹)⁻¹ = Q ∧ Q⁻¹.trace = ∑ i, w i ∧
      (L * Q⁻¹).trace = ∑ i, hL.eigenvalues i * w i := by
  let e := hL.eigenvalues; let q (i : n) := a + b * e i; let w (i : n) := (q i)⁻¹
  let T := Unitary.conjStarAlgAut ℝ _ hL.eigenvectorUnitary
  let Q := a • (1 : Matrix n n ℝ) + b • L
  have hLdiag : L = T (diagonal e) := hL.spectral_theorem
  have hQ : Q = T (diagonal q) := by
    rw [show diagonal q = a • (1 : Matrix n n ℝ) + b • diagonal e by
      rw [smul_one_eq_diagonal, ← diagonal_smul, diagonal_add]; rfl,
      map_add, map_smul, map_smul, map_one, ← hLdiag]
  have hC : Q⁻¹ = T (diagonal w) := Matrix.inv_eq_left_inv <| by
    rw [hQ, ← map_mul, diagonal_mul_diagonal,
      show (fun i => w i * q i) = fun _ => 1 from funext fun i => inv_mul_cancel₀ (hp i).ne',
      diagonal_one, map_one]
  have trD (d : n → ℝ) : (T (diagonal d)).trace = ∑ i, d i := by
    dsimp only [T, Unitary.conjStarAlgAut_apply]
    rw [trace_mul_cycle, Unitary.coe_star_mul_self, one_mul, trace_diagonal]
  change Q⁻¹.PosDef ∧ (Q⁻¹)⁻¹ = Q ∧ Q⁻¹.trace = ∑ i, w i ∧ (L * Q⁻¹).trace = ∑ i, e i * w i
  refine ⟨hC ▸ (posDef_diagonal_iff.mpr fun i => inv_pos.mpr (hp i)).mul_mul_conjTranspose_same
      (B := (hL.eigenvectorUnitary : Matrix n n ℝ))
      (Matrix.vecMul_injective_iff_isUnit.mpr Unitary.isUnit_coe),
    Matrix.inv_eq_left_inv (by
      rw [hC, hQ, ← map_mul, diagonal_mul_diagonal,
        show (fun i => q i * w i) = fun _ => 1 from funext fun i => mul_inv_cancel₀ (hp i).ne',
        diagonal_one, map_one]),
    hC ▸ trD w, by rw [hLdiag, hC, ← map_mul, diagonal_mul_diagonal, trD]⟩

/-- Complete matrix-level determination: interior targets uniquely determine the
determinant-maximizing covariance `C = (a I + b L)⁻¹` and the sign of `b`. -/
theorem interior_targets_determine_covariance {n : Type*} [Fintype n] [DecidableEq n]
    {L : Matrix n n ℝ} (hL : L.IsHermitian)
    (S r : ℝ) (hS : 0 < S) (lo hi : n)
    (hmin : ∀ i, hL.eigenvalues lo ≤ hL.eigenvalues i)
    (hmax : ∀ i, hL.eigenvalues i ≤ hL.eigenvalues hi)
    (hl : hL.eigenvalues lo < r) (hr : r < hL.eigenvalues hi) :
    ∃ a b : ℝ, ∃ C : Matrix n n ℝ,
      C.PosDef ∧ C⁻¹ = a • (1 : Matrix n n ℝ) + b • L ∧
      C.trace = S ∧ (L * C).trace = r * S ∧
      (r < L.trace / Fintype.card n ↔ 0 < b) ∧
      (r = L.trace / Fintype.card n ↔ b = 0) ∧
      (L.trace / Fintype.card n < r ↔ b < 0) ∧
      ∀ D : Matrix n n ℝ, D.PosDef → D.trace = S → (L * D).trace = r * S →
        D ≠ C → D.det < C.det := by
  let : Nonempty n := ⟨lo⟩
  obtain ⟨a, b, hp, hs, he⟩ :=
    affine_precision_realizes_targets hL.eigenvalues S r hS lo hi hmin hmax hl hr
  obtain ⟨hc, hprec, hs', he'⟩ := affine_covariance_traces hL a b hp
  have hsgn := trace_threshold _ a b hp ⟨lo, hi, (hl.trans hr).ne⟩
  dsimp only at hsgn
  have htrace : L.trace = ∑ i, hL.eigenvalues i := hL.trace_eq_sum_eigenvalues
  rw [he, hs, mul_div_cancel_right₀ _ hS.ne', ← htrace] at hsgn
  exact ⟨a, b, _, hc, hprec, hs'.trans hs, he'.trans he, hsgn.1, hsgn.2.1, hsgn.2.2,
    fun D hD hDs hDe => affine_precision_strict_max hc hD a b hprec
      (hDs.trans (hs'.trans hs).symm) (hDe.trans (he'.trans he).symm)⟩

/-- Verbatim §2.3 smoothness-to-scales determination: on a finite lattice whose symmetric
Laplacian `L` has a zero constant mode (`eigenvalues lo = 0 ≤ eigenvalues i`), imposing the
smoothness condition `0 < r < L.trace / N` (readings smoother than white noise) forces both
`β > 0` (by the stiffness identity) and `α > 0` (by the constant mode `ℓ₁ = 0`), yielding
strictly positive physical scales `ħ = β⁻¹ > 0` and `m² = α / β > 0` with
`C⁻¹ = ħ⁻¹ • (m² • 1 + L)`. -/
theorem smoothness_forces_positive_scales {n : Type*} [Fintype n] [DecidableEq n]
    {L : Matrix n n ℝ} (hL : L.IsHermitian)
    (S r : ℝ) (hS : 0 < S) (lo hi : n)
    (hlo : hL.eigenvalues lo = 0)
    (hnonneg : ∀ i, 0 ≤ hL.eigenvalues i)
    (hmax : ∀ i, hL.eigenvalues i ≤ hL.eigenvalues hi)
    (hr_pos : 0 < r) (hr_smooth : r < L.trace / Fintype.card n) (hr_hi : r < hL.eigenvalues hi) :
    ∃ α β ħ msq : ℝ, ∃ C : Matrix n n ℝ,
      0 < α ∧ 0 < β ∧ 0 < ħ ∧ 0 < msq ∧
      ħ = β⁻¹ ∧ msq = α / β ∧
      C.PosDef ∧ C⁻¹ = α • (1 : Matrix n n ℝ) + β • L ∧
      C⁻¹ = ħ⁻¹ • (msq • (1 : Matrix n n ℝ) + L) ∧
      C.trace = S ∧ (L * C).trace = r * S ∧
      ∀ D : Matrix n n ℝ, D.PosDef → D.trace = S → (L * D).trace = r * S →
        D ≠ C → D.det < C.det := by
  have hmin : ∀ i, hL.eigenvalues lo ≤ hL.eigenvalues i := fun i => hlo ▸ hnonneg i
  have hl : hL.eigenvalues lo < r := hlo ▸ hr_pos
  obtain ⟨α, β, C, hC, hprec, htrC, hedgeC, hβpos, _, _, hmaxdet⟩ :=
    interior_targets_determine_covariance hL S r hS lo hi hmin hmax hl hr_hi
  have hβ : 0 < β := hβpos.mp hr_smooth
  have hα : 0 < α := by
    let v : n → ℝ := fun i => (hL.eigenvectorBasis lo) i
    have hv_ne : v ≠ 0 := by
      intro h0
      have hnorm := hL.eigenvectorBasis.orthonormal.1 lo
      have hv0 : (hL.eigenvectorBasis lo : EuclideanSpace ℝ n) = 0 := by
        ext i; exact congrFun h0 i
      rw [hv0, norm_zero] at hnorm
      exact zero_ne_one hnorm
    have hLv : L *ᵥ v = 0 := by
      have heig := hL.mulVec_eigenvectorBasis lo
      simpa [v, hlo] using heig
    have hpos_qf := hC.inv.dotProduct_mulVec_pos hv_ne
    rw [hprec, add_mulVec, smul_mulVec, smul_mulVec, one_mulVec, hLv, smul_zero, add_zero,
      dotProduct_smul] at hpos_qf
    have hvv : 0 < v ⬝ᵥ v := by
      have hnorm := hL.eigenvectorBasis.orthonormal.1 lo
      have hsq : v ⬝ᵥ v = ‖(hL.eigenvectorBasis lo : EuclideanSpace ℝ n)‖ ^ 2 := by
        rw [EuclideanSpace.norm_sq_eq]
        simp [v, dotProduct, sq]
      rw [hsq, hnorm]; norm_num
    exact pos_of_mul_pos_left hpos_qf hvv.le
  refine ⟨α, β, β⁻¹, α / β, C, hα, hβ, inv_pos.mpr hβ, div_pos hα hβ, rfl, rfl,
    hC, hprec, ?_, htrC, hedgeC, hmaxdet⟩
  rw [hprec, inv_inv, smul_add, smul_smul, mul_div_cancel₀ _ hβ.ne']

end Lattice

section Gibbs

open MeasureTheory InformationTheory Real

/-- Differential entropy relative to the base measure `ν`. -/
noncomputable def entropy {Ω : Type*} [MeasurableSpace Ω] (μ ν : Measure Ω) : ℝ :=
  -(∫ x, llr μ ν x ∂μ)

/-- A feasible law has an entropy deficit equal to its finite KL divergence from the Gibbs law. -/
theorem entropy_gap {Ω : Type*} [MeasurableSpace Ω] {ν μ : Measure Ω}
    [SigmaFinite ν] [NeZero ν] [IsProbabilityMeasure μ] {f : Ω → ℝ}
    (hac : μ ≪ ν) (hZ : Integrable (fun x ↦ exp (f x)) ν)
    (hent : Integrable (llr μ ν) μ) (hμ : Integrable f μ) (hG : Integrable f (ν.tilted f))
    (hmean : ∫ x, f x ∂μ = ∫ x, f x ∂(ν.tilted f)) :
    let G := ν.tilted f
    klDiv μ G = ENNReal.ofReal (entropy G ν - entropy μ ν) ∧
      entropy μ ν ≤ entropy G ν ∧ (entropy μ ν = entropy G ν ↔ μ = G) := by
  let G := ν.tilted f
  have : IsProbabilityMeasure G := isProbabilityMeasure_tilted hZ
  have hμG : μ ≪ G := hac.trans (absolutelyContinuous_tilted hZ)
  have hfin : Integrable (llr μ G) μ := integrable_llr_tilted_right hac hμ hent hZ
  have hlog : ∫ x, llr G ν x ∂G = ∫ x, f x ∂G - log (∫ x, exp (f x) ∂ν) := by
    have hd : llr G ν =ᵐ[G] fun x ↦ f x - log (∫ y, exp (f y) ∂ν) :=
      (tilted_absolutelyContinuous ν f).ae_le (log_rnDeriv_tilted_left_self hZ)
    rw [integral_congr_ae hd, integral_sub hG (integrable_const _)]; simp [G]
  have hgap : ∫ x, llr μ G x ∂μ = entropy G ν - entropy μ ν := by
    rw [integral_llr_tilted_right hac hμ hZ hent, hmean]; unfold entropy; rw [hlog]; ring
  have hk : klDiv μ G = ENNReal.ofReal (entropy G ν - entropy μ ν) := by
    simpa only [probReal_univ, add_sub_cancel_right, hgap] using klDiv_of_ac_of_integrable hμG hfin
  have hp := integral_llr_add_sub_measure_univ_nonneg hμG hfin
  simp only [probReal_univ, add_sub_cancel_right, hgap, sub_nonneg] at hp
  exact ⟨hk, hp, ⟨fun he ↦ klDiv_eq_zero_iff.mp (by change klDiv μ G = 0; simp [hk, show entropy μ ν = entropy G ν from he]),
    fun he ↦ by rw [he]⟩⟩

theorem matching_energy {Ω : Type*} [MeasurableSpace Ω] {μ G : Measure Ω}
    (S E : Ω → ℝ) (a b : ℝ)
    (hS : Integrable S μ) (hE : Integrable E μ) (gS : Integrable S G) (gE : Integrable E G)
    (hs : ∫ x, S x ∂μ = ∫ x, S x ∂G) (he : ∫ x, E x ∂μ = ∫ x, E x ∂G) :
    (∫ x, a * S x + b * E x ∂μ) = ∫ x, a * S x + b * E x ∂G := by
  simp [integral_add (hS.const_mul a) (hE.const_mul b),
    integral_add (gS.const_mul a) (gE.const_mul b), integral_const_mul, hs, he]

def site {V : Type*} [Fintype V] (x : V → ℝ) : ℝ := ∑ i, x i ^ 2

def edge {V I : Type*} [Fintype I] (u v : I → V) (x : V → ℝ) : ℝ :=
  ∑ i, (x (u i) - x (v i)) ^ 2

def exponent {V I : Type*} [Fintype V] [Fintype I] (u v : I → V) (a b : ℝ) (x : V → ℝ) : ℝ :=
  -a * site x + -b * edge u v x

/-- Positive mass makes the finite-lattice partition integral finite for every nonnegative stiffness. -/
theorem integrable_boltzmann {V I : Type*} [Fintype V] [Fintype I] (u v : I → V)
    {a b : ℝ} (ha : 0 < a) (hb : 0 ≤ b) :
    Integrable (fun x ↦ exp (exponent u v a b x)) := by
  refine (Integrable.fintype_prod (ι := V) fun _ ↦ integrable_exp_neg_mul_sq ha).mono'
    (by unfold exponent site edge; fun_prop) (ae_of_all _ fun x => ?_)
  rw [Real.norm_of_nonneg (exp_pos _).le, ← Real.exp_sum, ← Finset.mul_sum, exp_le_exp]
  have he : 0 ≤ edge u v x := Finset.sum_nonneg fun i _ ↦ sq_nonneg _
  change -a * site x + -b * edge u v x ≤ -a * site x
  linarith [mul_nonneg hb he]

/-- With positive coefficients, both designated moments are finite under the normalized Gibbs law. -/
theorem gibbs_moments {V I : Type*} [Fintype V] [Fintype I] (u v : I → V)
    {a b : ℝ} (ha : 0 < a) (hb : 0 < b) :
    let G := volume.tilted (exponent u v a b)
    Integrable site G ∧ Integrable (edge u v) G := by
  let f := exponent u v a b; let G := volume.tilted f
  have hZ := integrable_boltzmann u v ha hb.le
  have hhalf : Integrable (fun x ↦ exp (f x / 2)) := by
    convert integrable_boltzmann u v (half_pos ha) (half_pos hb).le using 2 with x
    congr 1; simp [f, exponent]; ring
  have hs (x : V → ℝ) : 0 ≤ site x := Finset.sum_nonneg fun i _ ↦ sq_nonneg _
  have he (x : V → ℝ) : 0 ≤ edge u v x := Finset.sum_nonneg fun i _ ↦ sq_nonneg _
  have hf (x) : f x ≤ 0 := by dsimp [f, exponent]; nlinarith [mul_nonneg ha.le (hs x), mul_nonneg hb.le (he x)]
  have hi : Integrable f G := (integrable_tilted_iff hZ f).mpr <|
    (hhalf.const_mul 2).mono' (by dsimp [f, exponent, site, edge]; fun_prop) (ae_of_all _ fun x => by
      rw [smul_eq_mul, Real.norm_eq_abs, abs_mul, abs_of_pos (exp_pos _), abs_of_nonpos (hf x)]
      have hh := mul_le_mul_of_nonneg_left (by linarith [add_one_le_exp (-(f x / 2))] :
        -(f x / 2) ≤ exp (-(f x / 2))) (exp_pos (f x)).le
      rw [← exp_add, show f x + -(f x / 2) = f x / 2 by ring] at hh; linarith)
  have bound (g : (V → ℝ) → ℝ) (c : ℝ) (hc : 0 < c) (hg : Continuous g)
      (hn : ∀ x, 0 ≤ g x) (hle : ∀ x, c * g x ≤ -f x) : Integrable g G :=
    (hi.neg.div_const c).mono' hg.aestronglyMeasurable (ae_of_all _ fun x => by
      rw [Real.norm_of_nonneg (hn x), le_div_iff₀ hc, mul_comm]; exact hle x)
  exact ⟨bound site a ha (by unfold site; fun_prop) hs (fun x ↦ by dsimp [f, exponent]; nlinarith [mul_nonneg hb.le (he x)]),
    bound (edge u v) b hb (by unfold edge; fun_prop) he (fun x ↦ by dsimp [f, exponent]; nlinarith [mul_nonneg ha.le (hs x)])⟩

/-- Density-level finite-lattice MaxEnt uniqueness: the normalized Gibbs law uniquely maximizes
Lebesgue differential entropy among densities with finite entropy and matching moments. -/
theorem lattice_maxent {V I : Type*} [Fintype V] [Fintype I] (u v : I → V)
    {a b : ℝ} (ha : 0 < a) (hb : 0 < b)
    (μ : Measure (V → ℝ)) [IsProbabilityMeasure μ] (hac : μ ≪ volume)
    (hent : Integrable (llr μ volume) μ) (hs : Integrable site μ) (he : Integrable (edge u v) μ)
    (hsite : ∫ x, site x ∂μ = ∫ x, site x ∂volume.tilted (exponent u v a b))
    (hedge : ∫ x, edge u v x ∂μ = ∫ x, edge u v x ∂volume.tilted (exponent u v a b)) :
    let G := volume.tilted (exponent u v a b)
    klDiv μ G = ENNReal.ofReal (entropy G volume - entropy μ volume) ∧
      entropy μ volume ≤ entropy G volume ∧ (entropy μ volume = entropy G volume ↔ μ = G) := by
  obtain ⟨gs, ge⟩ := gibbs_moments u v ha hb
  exact entropy_gap hac (integrable_boltzmann u v ha hb.le) hent ((hs.const_mul _).add (he.const_mul _))
    ((gs.const_mul _).add (ge.const_mul _)) (matching_energy _ _ _ _ hs he gs ge hsite hedge)

end Gibbs

/-! ### §2.3 Bridge: Multivariate Gaussian Gibbs Density to Matrix Covariance -/
section GibbsBridge

open MeasureTheory Real Matrix
open scoped BigOperators

section OneDimAndDiagonal

private lemma integrable_g1 {q : ℝ} (hq : 0 < q) :
    Integrable (fun x : ℝ => exp (-(1 / 2) * (q * x ^ 2))) := by
  convert integrable_exp_neg_mul_sq (half_pos hq) using 1; ext x; congr 1; ring

private lemma integrable_sq_g1 {q : ℝ} (hq : 0 < q) :
    Integrable (fun x : ℝ => x ^ 2 * exp (-(1 / 2) * (q * x ^ 2))) := by
  have hc : 0 < q / 4 := by linarith
  refine ((integrable_exp_neg_mul_sq hc).const_mul (q / 4)⁻¹).mono' (by fun_prop) (ae_of_all _ fun x => ?_)
  rw [Real.norm_of_nonneg (by positivity), le_inv_mul_iff₀ hc]
  calc (q / 4) * (x ^ 2 * exp (-(1 / 2) * (q * x ^ 2)))
      = (q / 4 * x ^ 2) * exp (-(1 / 2) * (q * x ^ 2)) := by ring
    _ ≤ exp (q / 4 * x ^ 2) * exp (-(1 / 2) * (q * x ^ 2)) :=
        mul_le_mul_of_nonneg_right (by linarith [add_one_le_exp (q / 4 * x ^ 2)]) (exp_pos _).le
    _ = exp (-(q / 4) * x ^ 2) := by rw [← exp_add]; congr 1; ring

private lemma integrable_mul_g1 {q : ℝ} (hq : 0 < q) :
    Integrable (fun x : ℝ => x * exp (-(1 / 2) * (q * x ^ 2))) := by
  refine ((integrable_g1 hq).add (integrable_sq_g1 hq)).mono' (by fun_prop) (ae_of_all _ fun x => ?_)
  rw [Real.norm_eq_abs, abs_mul, abs_of_pos (exp_pos _)]
  have : |x| ≤ 1 + x ^ 2 := by nlinarith [sq_nonneg (|x| - 1), sq_abs x]
  dsimp; nlinarith [exp_pos (-(1 / 2) * (q * x ^ 2))]

private lemma integral_g1 {q : ℝ} (hq : 0 < q) :
    ∫ x : ℝ, exp (-(1 / 2) * (q * x ^ 2)) = √(2 * π / q) := by
  have h : (fun x : ℝ => exp (-(1 / 2) * (q * x ^ 2))) = fun x => exp (-(q / 2) * x ^ 2) := by
    ext x; congr 1; ring
  rw [h, integral_gaussian (q / 2)]; congr 1; field_simp

private lemma integral_mul_g1 (q : ℝ) :
    ∫ x : ℝ, x * exp (-(1 / 2) * (q * x ^ 2)) = 0 := by
  have h := integral_neg_eq_self (fun x : ℝ => x * exp (-(1 / 2) * (q * x ^ 2))) volume
  simp only [neg_sq] at h
  rw [show (fun x : ℝ => (-x) * exp (-(1 / 2) * (q * x ^ 2))) =
    fun x => -(x * exp (-(1 / 2) * (q * x ^ 2))) from funext fun _ => neg_mul _ _, integral_neg] at h
  linarith

private lemma integral_sq_g1 {q : ℝ} (hq : 0 < q) :
    ∫ x : ℝ, x ^ 2 * exp (-(1 / 2) * (q * x ^ 2)) = q⁻¹ * √(2 * π / q) := by
  have hdv (x : ℝ) : HasDerivAt (fun t : ℝ => exp (-(1 / 2) * (q * t ^ 2)))
      ((-q * x) * exp (-(1 / 2) * (q * x ^ 2))) x := by
    convert (((hasDerivAt_pow 2 x).const_mul q).const_mul (-(1 / 2 : ℝ))).exp using 1; ring
  have hparts := integral_mul_deriv_eq_deriv_mul_of_integrable
    (fun x _ => hasDerivAt_id x) (fun x _ => hdv x)
    (by convert (integrable_sq_g1 hq).const_mul (-q) using 1; ext x; simp; ring)
    (by convert integrable_g1 hq using 1; ext x; simp)
    (by convert integrable_mul_g1 hq using 1; ext x; simp)
  have h1 : (-q) * ∫ x : ℝ, x ^ 2 * exp (-(1 / 2) * (q * x ^ 2)) = -√(2 * π / q) := by
    rw [← integral_const_mul, ← integral_g1 hq]
    convert hparts using 1
    · congr 1; ext x; simp; ring
    · simp
  exact (eq_inv_mul_iff_mul_eq₀ hq.ne').mpr (by linarith)

variable {V : Type*} [Fintype V] [DecidableEq V]

omit [DecidableEq V] in
private lemma prod_sqrt_two_pi_div (q : V → ℝ) (hq : ∀ k, 0 < q k) :
    ∏ k : V, √(2 * π / q k) = (2 * π) ^ ((Fintype.card V : ℝ) / 2) / √(∏ k : V, q k) := by
  have h2pi : (0 : ℝ) ≤ 2 * π := by positivity
  have hprod : ∀ s : Finset V, ∏ k ∈ s, √(q k) = √(∏ k ∈ s, q k) := fun s =>
    Finset.cons_induction (by simp) (fun a s _ ih => by
      rw [Finset.prod_cons, Finset.prod_cons, ih, ← Real.sqrt_mul (hq a).le]) s
  simp_rw [Real.sqrt_div h2pi]
  rw [Finset.prod_div_distrib, Finset.prod_const, Finset.card_univ, hprod, Real.sqrt_eq_rpow,
    ← Real.rpow_natCast, ← Real.rpow_mul h2pi]
  congr 2; ring

omit [DecidableEq V] in
private lemma diagExp_eq_prod (q : V → ℝ) (y : V → ℝ) :
    exp (-(1 / 2) * ∑ k : V, q k * y k ^ 2) = ∏ k : V, exp (-(1 / 2) * (q k * y k ^ 2)) := by
  rw [Finset.mul_sum, Real.exp_sum]

private noncomputable def coordFactor (q : V → ℝ) (k l m : V) (t : ℝ) : ℝ :=
  (if m = k then t else 1) * (if m = l then t else 1) * exp (-(1 / 2) * (q m * t ^ 2))

private lemma prod_coordFactor (q : V → ℝ) (k l : V) (y : V → ℝ) :
    ∏ m : V, coordFactor q k l m (y m) =
      (y k * y l) * exp (-(1 / 2) * ∑ m : V, q m * y m ^ 2) := by
  simp only [coordFactor, Finset.prod_mul_distrib, Finset.prod_ite_eq', Finset.mem_univ, ↓reduceIte,
    diagExp_eq_prod]

private lemma integrable_coord_mul_diagExp {q : V → ℝ} (hq : ∀ m, 0 < q m) (k l : V) :
    Integrable (fun y : V → ℝ => (y k * y l) * exp (-(1 / 2) * ∑ m : V, q m * y m ^ 2)) := by
  simp_rw [← prod_coordFactor, volume_pi]
  refine Integrable.fintype_prod fun m => ?_
  by_cases hmk : m = k <;> by_cases hml : m = l
  · convert integrable_sq_g1 (hq m) using 1; ext t; simp only [coordFactor]; split_ifs; simp_all [sq]
  · convert integrable_mul_g1 (hq m) using 1; ext t; simp only [coordFactor]; split_ifs; simp_all
  · convert integrable_mul_g1 (hq m) using 1; ext t; simp only [coordFactor]; split_ifs; simp_all
  · convert integrable_g1 (hq m) using 1; ext t; simp only [coordFactor]; split_ifs; simp_all

private lemma integral_coord_mul_diagExp {q : V → ℝ} (hq : ∀ m, 0 < q m) (k l : V) :
    ∫ y : V → ℝ, (y k * y l) * exp (-(1 / 2) * ∑ m : V, q m * y m ^ 2) =
      (if k = l then (q k)⁻¹ else 0) * ∏ m : V, √(2 * π / q m) := by
  simp_rw [← prod_coordFactor, volume_pi]
  rw [integral_fintype_prod_eq_prod (f := fun m t => coordFactor q k l m t)]
  by_cases hkl : k = l
  · subst hkl; simp only [↓reduceIte]
    rw [← Finset.mul_prod_erase Finset.univ _ (Finset.mem_univ k),
      ← Finset.mul_prod_erase Finset.univ _ (Finset.mem_univ k), ← mul_assoc]
    congr 1
    · simpa [coordFactor, sq] using integral_sq_g1 (hq k)
    · refine Finset.prod_congr rfl fun m hm => ?_
      simpa [coordFactor, (Finset.mem_erase.mp hm).1] using integral_g1 (hq m)
  · simp only [hkl, ↓reduceIte, zero_mul]
    exact Finset.prod_eq_zero (Finset.mem_univ k) (by simpa [coordFactor, hkl] using integral_mul_g1 (q k))

end OneDimAndDiagonal

section MultivariateGaussian

variable {V : Type*} [Fintype V] [DecidableEq V]

private lemma unitary_mul_t (U : unitaryGroup V ℝ) : (U : Matrix V V ℝ) * (U : Matrix V V ℝ)ᵀ = 1 := by
  simpa [Matrix.star_eq_conjTranspose, Matrix.conjTranspose_eq_transpose_of_trivial] using
    Unitary.coe_mul_star_self U

private lemma unitary_t_mul (U : unitaryGroup V ℝ) : (U : Matrix V V ℝ)ᵀ * (U : Matrix V V ℝ) = 1 := by
  simpa [Matrix.star_eq_conjTranspose, Matrix.conjTranspose_eq_transpose_of_trivial] using
    Unitary.coe_star_mul_self U

/-- Linear equivalence `y ↦ U y` induced by an orthogonal matrix `U ∈ O(V)`. -/
def orthLinearEquiv (U : unitaryGroup V ℝ) : (V → ℝ) ≃ₗ[ℝ] (V → ℝ) :=
  LinearEquiv.ofLinearMap (toLin' (U : Matrix V V ℝ)) (toLin' (U : Matrix V V ℝ)ᵀ)
    (LinearMap.ext fun x => by simp [toLin'_apply, mulVec_mulVec, unitary_mul_t])
    (LinearMap.ext fun x => by simp [toLin'_apply, mulVec_mulVec, unitary_t_mul])

private lemma measurePreserving_orth (U : unitaryGroup V ℝ) :
    MeasurePreserving (orthLinearEquiv U).toContinuousLinearEquiv.toHomeomorph.toMeasurableEquiv
      volume volume := by
  let e := (orthLinearEquiv U).toContinuousLinearEquiv.toHomeomorph.toMeasurableEquiv
  have hdet : |(U : Matrix V V ℝ).det| = 1 := by
    have h : (U : Matrix V V ℝ).det ^ 2 = 1 := by
      calc (U : Matrix V V ℝ).det ^ 2 = (U : Matrix V V ℝ).det * (U : Matrix V V ℝ)ᵀ.det := by rw [sq, det_transpose]
        _ = ((U : Matrix V V ℝ) * (U : Matrix V V ℝ)ᵀ).det := (det_mul _ _).symm
        _ = 1 := by rw [unitary_mul_t, det_one]
    rcases sq_eq_one_iff.mp h with h1 | h1 <;> simp [h1]
  refine ⟨e.measurable, Measure.ext fun s hs => ?_⟩
  rw [Measure.map_apply e.measurable hs]
  change volume ((orthLinearEquiv U) ⁻¹' s) = volume s
  rw [Measure.addHaar_preimage_linearEquiv,
    show LinearMap.det (orthLinearEquiv U).symm.toLinearMap = (U : Matrix V V ℝ).det by
      change LinearMap.det (toLin' (U : Matrix V V ℝ)ᵀ) = _; rw [LinearMap.det_toLin', det_transpose],
    hdet, ENNReal.ofReal_one, one_mul]

/-- Partition function `Z_Q = (2π)^{|V|/2} / √(det Q)` of the precision-`Q` Gaussian. -/
noncomputable def gaussianPartition (Q : Matrix V V ℝ) : ℝ :=
  (2 * π) ^ ((Fintype.card V : ℝ) / 2) / √Q.det

/-- Quadratic Gibbs exponent `-(1/2) xᵀ Q x`. -/
noncomputable def gaussianExponent (Q : Matrix V V ℝ) (x : V → ℝ) : ℝ :=
  -(1 / 2) * (x ⬝ᵥ Q *ᵥ x)

/-- Normalized multivariate Gaussian density `p_Q(x) = Z_Q⁻¹ exp(-(1/2) xᵀ Q x)`. -/
noncomputable def gaussianDensity (Q : Matrix V V ℝ) (x : V → ℝ) : ℝ :=
  (gaussianPartition Q)⁻¹ * exp (gaussianExponent Q x)

lemma gaussianPartition_pos {Q : Matrix V V ℝ} (hQ : Q.PosDef) : 0 < gaussianPartition Q :=
  div_pos (Real.rpow_pos_of_pos (by positivity) _) (Real.sqrt_pos.mpr hQ.det_pos)

private lemma spectral_t {Q : Matrix V V ℝ} (hQ : Q.PosDef) :
    Q = (hQ.isHermitian.eigenvectorUnitary : Matrix V V ℝ) *
      diagonal hQ.isHermitian.eigenvalues *
      (hQ.isHermitian.eigenvectorUnitary : Matrix V V ℝ)ᵀ := by
  simpa [Unitary.conjStarAlgAut_apply, Matrix.star_eq_conjTranspose,
    Matrix.conjTranspose_eq_transpose_of_trivial] using hQ.isHermitian.spectral_theorem

private lemma quadForm_eigenvector {Q : Matrix V V ℝ} (hQ : Q.PosDef) (y : V → ℝ) :
    ((hQ.isHermitian.eigenvectorUnitary : Matrix V V ℝ) *ᵥ y) ⬝ᵥ
      (Q *ᵥ ((hQ.isHermitian.eigenvectorUnitary : Matrix V V ℝ) *ᵥ y)) =
      ∑ k : V, hQ.isHermitian.eigenvalues k * y k ^ 2 := by
  let Uu := hQ.isHermitian.eigenvectorUnitary; let U : Matrix V V ℝ := Uu; let q := hQ.isHermitian.eigenvalues
  have hQeq : Q = U * diagonal q * Uᵀ := spectral_t hQ
  have h1 : Q *ᵥ (U *ᵥ y) = U *ᵥ (diagonal q *ᵥ y) := by
    rw [hQeq, mulVec_mulVec, Matrix.mul_assoc, Matrix.mul_assoc, unitary_t_mul Uu, Matrix.mul_one, ← mulVec_mulVec]
  change (U *ᵥ y) ⬝ᵥ (Q *ᵥ (U *ᵥ y)) = ∑ k : V, q k * y k ^ 2
  rw [h1, dotProduct_mulVec, ← mulVec_transpose, mulVec_mulVec, unitary_t_mul Uu, one_mulVec]
  simp only [dotProduct, mulVec_diagonal]
  exact Finset.sum_congr rfl fun k _ => by ring

/-- The unnormalized Gaussian density `exp(-(1/2) xᵀ Q x)` is Lebesgue-integrable for `Q ≻ 0`. -/
theorem integrable_gaussian_unnorm {Q : Matrix V V ℝ} (hQ : Q.PosDef) :
    Integrable (fun x : V → ℝ => exp (gaussianExponent Q x)) := by
  let Uu := hQ.isHermitian.eigenvectorUnitary
  let e := (orthLinearEquiv Uu).toContinuousLinearEquiv.toHomeomorph.toMeasurableEquiv
  rw [← (measurePreserving_orth Uu).integrable_comp_emb e.measurableEmbedding]
  have h : (fun x => exp (gaussianExponent Q x)) ∘ e =
      fun y => ∏ k : V, exp (-(1 / 2) * (hQ.isHermitian.eigenvalues k * y k ^ 2)) := funext fun y => by
    change exp (-(1 / 2) * (((Uu : Matrix V V ℝ) *ᵥ y) ⬝ᵥ (Q *ᵥ ((Uu : Matrix V V ℝ) *ᵥ y)))) = _
    rw [quadForm_eigenvector hQ, diagExp_eq_prod]
  rw [h, volume_pi]
  exact Integrable.fintype_prod fun k => integrable_g1 (hQ.eigenvalues_pos k)

/-- Partition function identity: `∫ exp(-(1/2) xᵀ Q x) = (2π)^{|V|/2} / √(det Q)`. -/
theorem integral_gaussian_unnorm {Q : Matrix V V ℝ} (hQ : Q.PosDef) :
    ∫ x : V → ℝ, exp (gaussianExponent Q x) = gaussianPartition Q := by
  let Uu := hQ.isHermitian.eigenvectorUnitary
  let e := (orthLinearEquiv Uu).toContinuousLinearEquiv.toHomeomorph.toMeasurableEquiv
  rw [← (measurePreserving_orth Uu).integral_comp' (f := e)]
  have h : (fun y => exp (gaussianExponent Q (e y))) =
      fun y => ∏ k : V, exp (-(1 / 2) * (hQ.isHermitian.eigenvalues k * y k ^ 2)) := funext fun y => by
    change exp (-(1 / 2) * (((Uu : Matrix V V ℝ) *ᵥ y) ⬝ᵥ (Q *ᵥ ((Uu : Matrix V V ℝ) *ᵥ y)))) = _
    rw [quadForm_eigenvector hQ, diagExp_eq_prod]
  rw [h, volume_pi, integral_fintype_prod_eq_prod (f := fun k t => exp (-(1 / 2) * (hQ.isHermitian.eigenvalues k * t ^ 2)))]
  simp_rw [integral_g1 (hQ.eigenvalues_pos _)]
  rw [prod_sqrt_two_pi_div _ hQ.eigenvalues_pos, gaussianPartition]
  congr 2; simpa using hQ.isHermitian.det_eq_prod_eigenvalues.symm

/-- Normalization: for `Q ≻ 0`, `p_Q(x) = Z_Q⁻¹ exp(-(1/2) xᵀ Q x)` integrates to `1`. -/
theorem integral_gaussian_density {Q : Matrix V V ℝ} (hQ : Q.PosDef) :
    ∫ x : V → ℝ, gaussianDensity Q x = 1 := by
  unfold gaussianDensity
  rw [integral_const_mul, integral_gaussian_unnorm hQ, inv_mul_cancel₀ (gaussianPartition_pos hQ).ne']

private lemma expand_coord_mul_density {Q : Matrix V V ℝ} (hQ : Q.PosDef) (i j : V) (y : V → ℝ) :
    (((hQ.isHermitian.eigenvectorUnitary : Matrix V V ℝ) *ᵥ y) i *
      ((hQ.isHermitian.eigenvectorUnitary : Matrix V V ℝ) *ᵥ y) j) *
      gaussianDensity Q ((hQ.isHermitian.eigenvectorUnitary : Matrix V V ℝ) *ᵥ y) =
      ∑ k : V, ∑ l : V,
        ((hQ.isHermitian.eigenvectorUnitary : Matrix V V ℝ) i k *
          (hQ.isHermitian.eigenvectorUnitary : Matrix V V ℝ) j l * (gaussianPartition Q)⁻¹) *
        ((y k * y l) * exp (-(1 / 2) * ∑ m : V, hQ.isHermitian.eigenvalues m * y m ^ 2)) := by
  let U : Matrix V V ℝ := hQ.isHermitian.eigenvectorUnitary
  change ((U *ᵥ y) i * (U *ᵥ y) j) * gaussianDensity Q (U *ᵥ y) = _
  rw [show gaussianDensity Q (U *ᵥ y) = (gaussianPartition Q)⁻¹ *
    exp (-(1 / 2) * ∑ m : V, hQ.isHermitian.eigenvalues m * y m ^ 2) by
      simp only [gaussianDensity, gaussianExponent, U, quadForm_eigenvector hQ],
    show (U *ᵥ y) i * (U *ᵥ y) j = ∑ k : V, ∑ l : V, (U i k * U j l) * (y k * y l) by
      simp only [mulVec, dotProduct]; rw [Finset.sum_mul]
      exact Finset.sum_congr rfl fun k _ => by rw [Finset.mul_sum]; exact Finset.sum_congr rfl fun l _ => by ring]
  rw [Finset.sum_mul]
  exact Finset.sum_congr rfl fun k _ => by rw [Finset.sum_mul]; exact Finset.sum_congr rfl fun l _ => by ring

/-- Second-order coordinate products against `p_Q` are Lebesgue-integrable. -/
theorem integrable_mul_gaussianDensity {Q : Matrix V V ℝ} (hQ : Q.PosDef) (i j : V) :
    Integrable (fun x : V → ℝ => (x i * x j) * gaussianDensity Q x) := by
  let Uu := hQ.isHermitian.eigenvectorUnitary
  let e := (orthLinearEquiv Uu).toContinuousLinearEquiv.toHomeomorph.toMeasurableEquiv
  rw [← (measurePreserving_orth Uu).integrable_comp_emb e.measurableEmbedding]
  have h : (fun x => (x i * x j) * gaussianDensity Q x) ∘ e =
      fun y => ∑ k : V, ∑ l : V,
        ((Uu : Matrix V V ℝ) i k * (Uu : Matrix V V ℝ) j l * (gaussianPartition Q)⁻¹) *
        ((y k * y l) * exp (-(1 / 2) * ∑ m : V, hQ.isHermitian.eigenvalues m * y m ^ 2)) :=
    funext fun y => expand_coord_mul_density hQ i j y
  rw [h]
  exact integrable_finsetSum _ fun k _ => integrable_finsetSum _ fun l _ =>
    (integrable_coord_mul_diagExp hQ.eigenvalues_pos k l).const_mul _

/-- Multivariate Gaussian covariance identity: `∫ (x_i x_j) p_Q(x) dx = (Q⁻¹)_{ij}`. -/
theorem integral_gaussian_cov {Q : Matrix V V ℝ} (hQ : Q.PosDef) (i j : V) :
    ∫ x : V → ℝ, (x i * x j) * gaussianDensity Q x = Q⁻¹ i j := by
  let Uu := hQ.isHermitian.eigenvectorUnitary
  let U : Matrix V V ℝ := Uu
  let q := hQ.isHermitian.eigenvalues
  let e := (orthLinearEquiv Uu).toContinuousLinearEquiv.toHomeomorph.toMeasurableEquiv
  have hZ : ∏ m : V, √(2 * π / hQ.isHermitian.eigenvalues m) = gaussianPartition Q := by
    rw [prod_sqrt_two_pi_div _ hQ.eigenvalues_pos, gaussianPartition]
    congr 2; simpa using hQ.isHermitian.det_eq_prod_eigenvalues.symm
  have hQeq : Q = U * diagonal q * Uᵀ := spectral_t hQ
  have hinv : Q⁻¹ = U * diagonal (fun k => (q k)⁻¹) * Uᵀ := Matrix.inv_eq_left_inv <| by
    calc (U * diagonal (fun k => (q k)⁻¹) * Uᵀ) * Q
        = U * (diagonal (fun k => (q k)⁻¹) * ((Uᵀ * U) * diagonal q)) * Uᵀ := by rw [hQeq]; simp only [Matrix.mul_assoc]
      _ = U * Uᵀ := by
          rw [unitary_t_mul Uu, Matrix.one_mul, diagonal_mul_diagonal,
            show (fun k => (q k)⁻¹ * q k) = fun _ => 1 from funext fun k => inv_mul_cancel₀ (hQ.eigenvalues_pos k).ne',
            diagonal_one, Matrix.mul_one]
      _ = 1 := unitary_mul_t Uu
  rw [← (measurePreserving_orth Uu).integral_comp' (f := e)]
  simp_rw [show ∀ y, (e y i * e y j) * gaussianDensity Q (e y) =
      ∑ k : V, ∑ l : V, (U i k * U j l * (gaussianPartition Q)⁻¹) *
        ((y k * y l) * exp (-(1 / 2) * ∑ m : V, hQ.isHermitian.eigenvalues m * y m ^ 2)) from
      expand_coord_mul_density hQ i j]
  rw [integral_finsetSum _ fun k _ => integrable_finsetSum _ fun l _ =>
    (integrable_coord_mul_diagExp hQ.eigenvalues_pos k l).const_mul _]
  have hterm (k : V) : (∫ y : V → ℝ, ∑ l : V, (U i k * U j l * (gaussianPartition Q)⁻¹) *
        ((y k * y l) * exp (-(1 / 2) * ∑ m : V, hQ.isHermitian.eigenvalues m * y m ^ 2))) =
      U i k * (q k)⁻¹ * U j k := by
    rw [integral_finsetSum _ fun l _ => (integrable_coord_mul_diagExp hQ.eigenvalues_pos k l).const_mul _]
    simp_rw [integral_const_mul, integral_coord_mul_diagExp hQ.eigenvalues_pos, hZ]
    rw [Finset.sum_eq_single k (fun l _ hlk => by simp [Ne.symm hlk]) (fun hk => (hk (Finset.mem_univ k)).elim)]
    simp only [↓reduceIte]; have := (gaussianPartition_pos hQ).ne'; field_simp [this]; rfl
  rw [Finset.sum_congr rfl fun k _ => hterm k, hinv]
  simp only [Matrix.mul_apply, Matrix.diagonal_apply, mul_ite, mul_zero,
    Finset.sum_ite_eq', Finset.mem_univ, ↓reduceIte, Matrix.transpose_apply]

/-- Covariance identity in the `volume.tilted` representation of `lattice_maxent`. -/
theorem tilted_gaussian_cov {Q : Matrix V V ℝ} (hQ : Q.PosDef) (i j : V) :
    ∫ x : V → ℝ, x i * x j ∂volume.tilted (gaussianExponent Q) = Q⁻¹ i j := by
  rw [integral_tilted, integral_gaussian_unnorm hQ]
  convert integral_gaussian_cov hQ i j using 1
  congr 1; ext x; simp [gaussianDensity, smul_eq_mul, div_eq_inv_mul]; ring

/-- `Fin n` specialization of Gaussian normalization with explicit `(2π)^{n/2} / √(det Q)`. -/
theorem integral_gaussian_density_fin {n : ℕ} {Q : Matrix (Fin n) (Fin n) ℝ} (hQ : Q.PosDef) :
    ∫ x : Fin n → ℝ,
      ((2 * π) ^ ((n : ℝ) / 2) / √Q.det)⁻¹ * exp (-(1 / 2) * (x ⬝ᵥ Q *ᵥ x)) = 1 := by
  simpa [gaussianDensity, gaussianPartition, gaussianExponent, Fintype.card_fin] using
    integral_gaussian_density hQ

/-- `Fin n` specialization of Gaussian covariance `∫ (x_i x_j) p_Q(x) = Q⁻¹ i j`. -/
theorem integral_gaussian_cov_fin {n : ℕ} {Q : Matrix (Fin n) (Fin n) ℝ} (hQ : Q.PosDef)
    (i j : Fin n) :
    ∫ x : Fin n → ℝ,
      (x i * x j) * (((2 * π) ^ ((n : ℝ) / 2) / √Q.det)⁻¹ * exp (-(1 / 2) * (x ⬝ᵥ Q *ᵥ x))) =
      Q⁻¹ i j := by
  simpa [gaussianDensity, gaussianPartition, gaussianExponent, Fintype.card_fin] using
    integral_gaussian_cov hQ i j

end MultivariateGaussian

section LatticeBridge

variable {V E : Type*} [Fintype V] [DecidableEq V] [Fintype E]

/-- Graph Laplacian `L = Bᵀ B` from the lattice incidence matrix. -/
def laplacian (u v : E → V) : Matrix V V ℝ := (incidence u v)ᵀ * incidence u v

/-- Affine precision matrix `Q = 2a I + 2b L`. -/
def precision (u v : E → V) (a b : ℝ) : Matrix V V ℝ :=
  (2 * a) • (1 : Matrix V V ℝ) + (2 * b) • laplacian u v

/-- Exact identification `-a ‖x‖² - b ‖Dx‖² = -(1/2) xᵀ (2a I + 2b L) x`. -/
theorem exponent_eq_gaussianExponent (u v : E → V) (a b : ℝ) (x : V → ℝ) :
    exponent u v a b x = gaussianExponent (precision u v a b) x := by
  have hlap : x ⬝ᵥ (laplacian u v *ᵥ x) = edge u v x := by
    have hrow (e : E) : (incidence u v *ᵥ x) e = x (u e) - x (v e) := by
      change (Pi.single (u e) (1 : ℝ) - Pi.single (v e) 1) ⬝ᵥ x = _
      rw [sub_dotProduct, single_dotProduct, single_dotProduct, one_mul, one_mul]
    change x ⬝ᵥ (((incidence u v)ᵀ * incidence u v) *ᵥ x) = _
    rw [← mulVec_mulVec, dotProduct_mulVec, vecMul_transpose]
    simp only [dotProduct, hrow, edge, sq]
  have hQ : x ⬝ᵥ (precision u v a b *ᵥ x) = (2 * a) * site x + (2 * b) * edge u v x := by
    unfold precision
    rw [add_mulVec, smul_mulVec, smul_mulVec, one_mulVec, dotProduct_add,
      dotProduct_smul, dotProduct_smul, smul_eq_mul, smul_eq_mul, hlap]
    simp only [dotProduct, site, sq]
  unfold exponent gaussianExponent; rw [hQ]; ring

/-- Positive mass `a > 0` and nonnegative stiffness `b ≥ 0` ensure `Q = 2a I + 2b L ≻ 0`. -/
theorem precision_posDef (u v : E → V) {a b : ℝ} (ha : 0 < a) (hb : 0 ≤ b) :
    (precision u v a b).PosDef :=
  (Matrix.PosDef.one.smul (by linarith)).add_posSemidef <|
    (by simpa [laplacian, Matrix.conjTranspose_eq_transpose_of_trivial] using
      Matrix.posSemidef_conjTranspose_mul_self (incidence u v) : (laplacian u v).PosSemidef).smul (by linarith)

/-- Site second moment under `p_Q` equals `tr(Q⁻¹)`. -/
theorem gibbs_site_moment_density {Q : Matrix V V ℝ} (hQ : Q.PosDef) :
    ∫ x : V → ℝ, site x * gaussianDensity Q x = Q⁻¹.trace := by
  simp_rw [site, sq, Finset.sum_mul]
  rw [integral_finsetSum _ fun i _ => integrable_mul_gaussianDensity hQ i i]
  simp_rw [integral_gaussian_cov hQ]; rfl

/-- Edge second moment under `p_Q` equals `tr(L Q⁻¹)`. -/
theorem gibbs_edge_moment_density (u v : E → V) {Q : Matrix V V ℝ} (hQ : Q.PosDef) :
    ∫ x : V → ℝ, edge u v x * gaussianDensity Q x = (laplacian u v * Q⁻¹).trace := by
  have hint := integrable_mul_gaussianDensity hQ
  have h12 (e : E) : Integrable (fun x : V → ℝ =>
      (x (u e) * x (u e)) * gaussianDensity Q x - (x (v e) * x (u e)) * gaussianDensity Q x) :=
    (hint _ _).sub (hint _ _)
  have h123 (e : E) : Integrable (fun x : V → ℝ =>
      ((x (u e) * x (u e)) * gaussianDensity Q x - (x (v e) * x (u e)) * gaussianDensity Q x) -
        (x (u e) * x (v e)) * gaussianDensity Q x) := (h12 e).sub (hint _ _)
  have hexp (e : E) : (fun x : V → ℝ => (x (u e) - x (v e)) ^ 2 * gaussianDensity Q x) = fun x =>
      (((x (u e) * x (u e)) * gaussianDensity Q x - (x (v e) * x (u e)) * gaussianDensity Q x) -
        (x (u e) * x (v e)) * gaussianDensity Q x) + (x (v e) * x (v e)) * gaussianDensity Q x :=
    funext fun x => by ring
  simp_rw [edge, Finset.sum_mul]
  rw [integral_finsetSum _ fun e _ => by rw [hexp e]; exact (h123 e).add (hint _ _)]
  have hterm (e : E) : ∫ x : V → ℝ, (x (u e) - x (v e)) ^ 2 * gaussianDensity Q x =
      Q⁻¹ (u e) (u e) - Q⁻¹ (v e) (u e) - Q⁻¹ (u e) (v e) + Q⁻¹ (v e) (v e) := by
    rw [hexp e, integral_add (h123 e) (hint _ _), integral_sub (h12 e) (hint _ _),
      integral_sub (hint _ _) (hint _ _)]
    simp_rw [integral_gaussian_cov hQ]
  simp_rw [hterm]
  exact (edge_trace u v Q⁻¹).symm

/-- Complete finite-dimensional bridge connecting the tilted lattice Gibbs measure of
`lattice_maxent` directly to `Q = 2aI + 2bL`, its inverse covariance `Q⁻¹`, site trace
`tr(Q⁻¹)`, and edge trace `tr(L Q⁻¹)`. -/
theorem gibbs_bridge (u v : E → V) {a b : ℝ} (ha : 0 < a) (hb : 0 ≤ b) :
    let Q := precision u v a b
    let G := volume.tilted (exponent u v a b)
    Q.PosDef ∧
      Q⁻¹.PosDef ∧
      (Q⁻¹)⁻¹ = Q ∧
      (∫ x : V → ℝ, gaussianDensity Q x = 1) ∧
      (∀ i j : V, ∫ x : V → ℝ, x i * x j ∂G = Q⁻¹ i j) ∧
      (∫ x : V → ℝ, site x ∂G = Q⁻¹.trace) ∧
      (∫ x : V → ℝ, edge u v x ∂G = (laplacian u v * Q⁻¹).trace) := by
  intro Q G
  have hQ : Q.PosDef := precision_posDef u v ha hb
  have hG : G = volume.tilted (gaussianExponent Q) :=
    congrArg volume.tilted (funext (exponent_eq_gaussianExponent u v a b))
  have htilted (f : (V → ℝ) → ℝ) : ∫ x : V → ℝ, f x ∂G = ∫ x : V → ℝ, f x * gaussianDensity Q x := by
    rw [hG, integral_tilted, integral_gaussian_unnorm hQ]
    congr 1; ext x; simp [gaussianDensity, smul_eq_mul, div_eq_inv_mul]; ring
  exact ⟨hQ, hQ.inv, Matrix.nonsing_inv_nonsing_inv Q hQ.det_pos.ne'.isUnit,
    integral_gaussian_density hQ, fun i j => hG ▸ tilted_gaussian_cov hQ i j,
    (htilted site).trans (gibbs_site_moment_density hQ),
    (htilted (edge u v)).trans (gibbs_edge_moment_density u v hQ)⟩

end LatticeBridge

end GibbsBridge

/-! ### §2.3 End-to-End Join: `lattice_covariance_determination` -/
section LatticeDetermination

open MeasureTheory InformationTheory Real Matrix
open scoped BigOperators MatrixOrder

/-- Extended differential entropy in `EReal`: equals `entropy μ ν` when `μ ≪ ν` and
`llr μ ν` is `μ`-integrable, and `⊥` (`-∞`) otherwise. -/
noncomputable def extEntropy {Ω : Type*} [MeasurableSpace Ω] (μ ν : Measure Ω) : EReal :=
  letI := Classical.propDecidable (μ ≪ ν ∧ Integrable (llr μ ν) μ)
  if μ ≪ ν ∧ Integrable (llr μ ν) μ then (entropy μ ν : EReal) else ⊥

/-- Extended KL–entropy identity for any probability measure `μ` matching the Gibbs energy
expectation `∫ f ∂μ = ∫ f ∂(ν.tilted f)`, allowing singular laws and competitors with
non-integrable `log p` (entropy `-∞`). -/
theorem extEntropy_gap {Ω : Type*} [MeasurableSpace Ω] {ν μ : Measure Ω}
    [SigmaFinite ν] [NeZero ν] [IsProbabilityMeasure μ] {f : Ω → ℝ}
    (hZ : Integrable (fun x ↦ exp (f x)) ν)
    (hμ : Integrable f μ) (hG : Integrable f (ν.tilted f))
    (hmean : ∫ x, f x ∂μ = ∫ x, f x ∂(ν.tilted f)) :
    let G := ν.tilted f
    extEntropy G ν = (entropy G ν : EReal) ∧
      extEntropy μ ν = (entropy G ν : EReal) - (klDiv μ G : EReal) ∧
      extEntropy μ ν ≤ extEntropy G ν ∧
      (extEntropy μ ν = extEntropy G ν ↔ μ = G) := by
  let G := ν.tilted f
  have : IsProbabilityMeasure G := isProbabilityMeasure_tilted hZ
  have hGac : G ≪ ν := tilted_absolutelyContinuous ν f
  have hGent : Integrable (llr G ν) G := by
    have hd : llr G ν =ᵐ[G] fun x ↦ f x - log (∫ y, exp (f y) ∂ν) :=
      hGac.ae_le (log_rnDeriv_tilted_left_self hZ)
    exact (hG.sub (integrable_const _)).congr hd.symm
  have hGext : extEntropy G ν = (entropy G ν : EReal) := by simp [extEntropy, hGac, hGent]
  have hident : extEntropy μ ν = (entropy G ν : EReal) - (klDiv μ G : EReal) := by
    by_cases hfin : μ ≪ ν ∧ Integrable (llr μ ν) μ
    · obtain ⟨hkl, hle, _⟩ := entropy_gap hfin.1 hZ hfin.2 hμ hG hmean
      rw [show extEntropy μ ν = (entropy μ ν : EReal) by simp [extEntropy, hfin.1, hfin.2],
        hkl, EReal.coe_ennreal_ofReal, max_eq_left (sub_nonneg.mpr hle), ← EReal.coe_sub,
        EReal.coe_eq_coe_iff]
      ring
    · have hkl : klDiv μ G = ⊤ := by
        by_cases hac : μ ≪ ν
        · refine klDiv_of_not_integrable fun hi ↦ hfin ⟨hac, ?_⟩
          have hrew : llr μ ν =ᵐ[μ] fun x ↦ llr μ G x + f x - log (∫ z, exp (f z) ∂ν) :=
            (llr_tilted_right hac hZ).mono fun x hx ↦ by dsimp only at hx ⊢; linarith
          exact ((hi.add hμ).sub (integrable_const _)).congr hrew.symm
        · exact klDiv_of_not_ac fun hμG ↦ hac (hμG.trans hGac)
      simp [extEntropy, hfin, hkl]
  refine ⟨hGext, hident, ?_, ?_⟩
  · rw [hident, hGext]
    cases klDiv μ G with
    | top => simp
    | coe r =>
      change (entropy G ν : EReal) - ((r : ℝ) : EReal) ≤ _
      rw [← EReal.coe_sub, EReal.coe_le_coe_iff]; linarith [r.2]
  · rw [hident, hGext]
    refine ⟨fun heq ↦ klDiv_eq_zero_iff.mp ?_, ?_⟩
    · cases h : klDiv μ G with
      | top => simp [h] at heq
      | coe r =>
        rw [h] at heq
        have hcast : ((r : ENNReal) : EReal) = ((r : ℝ) : EReal) := rfl
        rw [hcast, ← EReal.coe_sub, EReal.coe_eq_coe_iff] at heq
        simpa [ENNReal.coe_eq_zero, NNReal.coe_eq_zero] using (by linarith : (r : ℝ) = 0)
    · rintro rfl
      have h0 : klDiv G G = 0 := klDiv_eq_zero_iff.mpr rfl
      rw [h0]; simp

/-- The graph Laplacian `L = Bᵀ B` is positive semidefinite. -/
theorem laplacian_posSemidef {V I : Type*} [Fintype V] [DecidableEq V] [Fintype I]
    (u v : I → V) : (laplacian u v).PosSemidef := by
  simpa [laplacian, Matrix.conjTranspose_eq_transpose_of_trivial] using
    Matrix.posSemidef_conjTranspose_mul_self (incidence u v)

/-- For any positive-definite affine precision `Q = 2a I + 2b L` (including negative stiffness `b < 0`
above white noise), the site and edge observables are integrable under the tilted Gibbs law. -/
theorem gibbs_moments_posDef {V I : Type*} [Fintype V] [DecidableEq V] [Fintype I]
    (u v : I → V) {a b : ℝ} (hQ : (precision u v a b).PosDef) :
    let G := volume.tilted (exponent u v a b)
    Integrable site G ∧ Integrable (edge u v) G := by
  let Q := precision u v a b
  have hexp : exponent u v a b = gaussianExponent Q := funext (exponent_eq_gaussianExponent u v a b)
  have hZ := integrable_gaussian_unnorm hQ
  have hcoord (i j : V) :
      Integrable (fun x : V → ℝ ↦ x i * x j) (volume.tilted (gaussianExponent Q)) := by
    rw [integrable_tilted_iff hZ]
    have hZne : gaussianPartition Q ≠ 0 := (gaussianPartition_pos hQ).ne'
    refine ((integrable_mul_gaussianDensity hQ i j).const_mul (gaussianPartition Q)).congr
      (Filter.Eventually.of_forall fun x ↦ ?_)
    change gaussianPartition Q * (x i * x j * gaussianDensity Q x) = exp (gaussianExponent Q x) • (x i * x j)
    simp only [gaussianDensity, smul_eq_mul]; field_simp [hZne]
  rw [hexp]
  refine ⟨?_, ?_⟩
  · rw [show (site : (V → ℝ) → ℝ) = fun x ↦ ∑ i : V, x i * x i by ext x; simp [site, sq]]
    exact integrable_finsetSum _ fun i _ ↦ hcoord i i
  · rw [show edge u v = fun x : V → ℝ ↦
        ∑ e : I, (((x (u e) * x (u e) - x (v e) * x (u e)) - x (u e) * x (v e)) + x (v e) * x (v e)) by
      ext x; simp only [edge]; exact Finset.sum_congr rfl fun e _ ↦ by ring]
    exact integrable_finsetSum _ fun e _ ↦
      (((hcoord (u e) (u e)).sub (hcoord (v e) (u e))).sub (hcoord (u e) (v e))).add (hcoord (v e) (v e))

/-- End-to-end §2.3 determination: on any finite graph with Laplacian `L = Bᵀ B` and any
interior moment target `(S, rS)` (`0 < S`, `0 = λ_min < r < λ_max`), the unique global
maximum-entropy probability law matching site and edge moments (allowing singular laws and
competitors with entropy `-∞`) is the normalized Gaussian Gibbs law `volume.tilted (exponent u v a b)`
with positive mass `a > 0`, exact covariance `Q⁻¹ = (2a I + 2b L)⁻¹`, exact traces
`tr(Q⁻¹) = S` and `tr(L Q⁻¹) = rS`, strict determinant optimality, and stiffness sign
`b > 0 ↔ r < tr(L) / |V|`. -/
theorem lattice_covariance_determination {V I : Type*} [Fintype V] [DecidableEq V] [Fintype I]
    [Nonempty V] (u v : I → V) (S r : ℝ) (hS : 0 < S) (hr0 : 0 < r)
    (hrmax : ∃ i, r < (laplacian_posSemidef u v).isHermitian.eigenvalues i) :
    let L := laplacian u v
    ∃ a b : ℝ,
      let Q := precision u v a b
      let G := volume.tilted (exponent u v a b)
      0 < a ∧ Q.PosDef ∧ IsProbabilityMeasure G ∧
      (r < L.trace / Fintype.card V ↔ 0 < b) ∧
      (r = L.trace / Fintype.card V ↔ b = 0) ∧
      (L.trace / Fintype.card V < r ↔ b < 0) ∧
      (∀ i j : V, ∫ x : V → ℝ, x i * x j ∂G = Q⁻¹ i j) ∧
      Q⁻¹.trace = S ∧ (L * Q⁻¹).trace = r * S ∧
      (∫ x : V → ℝ, site x ∂G = S) ∧ (∫ x : V → ℝ, edge u v x ∂G = r * S) ∧
      (∀ D : Matrix V V ℝ, D.PosDef → D.trace = S → (L * D).trace = r * S →
        D ≠ Q⁻¹ → D.det < Q⁻¹.det) ∧
      (∀ μ : Measure (V → ℝ), IsProbabilityMeasure μ →
        Integrable site μ → Integrable (edge u v) μ →
        (∫ x, site x ∂μ = S) → (∫ x, edge u v x ∂μ = r * S) →
        extEntropy μ volume = (entropy G volume : EReal) - (klDiv μ G : EReal) ∧
        extEntropy μ volume ≤ extEntropy G volume ∧
        (extEntropy μ volume = extEntropy G volume ↔ μ = G)) := by
  let L := laplacian u v
  have hpsd : L.PosSemidef := laplacian_posSemidef u v
  let vals := hpsd.isHermitian.eigenvalues
  have hfree : L *ᵥ (1 : V → ℝ) = 0 := by
    have hD : incidence u v *ᵥ (1 : V → ℝ) = 0 := by
      ext e; change (Pi.single (u e) (1 : ℝ) - Pi.single (v e) 1) ⬝ᵥ (1 : V → ℝ) = 0
      simp [sub_dotProduct]
    change ((incidence u v)ᵀ * incidence u v) *ᵥ (1 : V → ℝ) = 0
    rw [← mulVec_mulVec, hD, mulVec_zero]
  have hdet : L.det = 0 := by
    by_contra hd
    exact (one_ne_zero : (1 : V → ℝ) ≠ 0) <|
      (mulVec_injective_iff_isUnit.mpr (L.isUnit_iff_isUnit_det.mpr (isUnit_iff_ne_zero.mpr hd)))
        (hfree.trans (mulVec_zero _).symm)
  obtain ⟨lo, _, hzero_raw⟩ := Finset.prod_eq_zero_iff.mp
    (hpsd.isHermitian.det_eq_prod_eigenvalues.symm.trans hdet)
  have hzero : vals lo = 0 := by simpa [vals] using hzero_raw
  obtain ⟨hi, _, hhi⟩ := Finset.exists_max_image Finset.univ vals Finset.univ_nonempty
  obtain ⟨j, hj⟩ := hrmax
  obtain ⟨α, β, C, hC, hQeq, htrC, hedgeC, hβpos, hβzero, hβneg, hdetmax⟩ :=
    interior_targets_determine_covariance hpsd.isHermitian S r hS lo hi
      (fun i ↦ show vals lo ≤ vals i by rw [hzero]; exact hpsd.eigenvalues_nonneg i)
      (fun i ↦ hhi i (Finset.mem_univ _))
      (show vals lo < r by rwa [hzero]) (hj.trans_le (hhi j (Finset.mem_univ _)))
  have hα : 0 < α := by
    have hmass := hC.inv.dotProduct_mulVec_pos (one_ne_zero : (1 : V → ℝ) ≠ 0)
    rw [hQeq, add_mulVec, smul_mulVec, smul_mulVec, one_mulVec, hfree, smul_zero, add_zero,
      dotProduct_smul] at hmass
    exact pos_of_mul_pos_left (by simpa [dotProduct] using hmass : 0 < α * Fintype.card V)
      (Nat.cast_pos.mpr Fintype.card_pos).le
  let a := α / 2; let b := β / 2; let Q := precision u v a b; let G := volume.tilted (exponent u v a b)
  have hQC : Q = C⁻¹ := by
    rw [hQeq]; simp only [Q, precision, a, b, L, show 2 * (α / 2) = α by ring, show 2 * (β / 2) = β by ring]
  have hQinv : Q⁻¹ = C := by rw [hQC, Matrix.nonsing_inv_nonsing_inv C hC.det_pos.ne'.isUnit]
  have hQ : Q.PosDef := hQC ▸ hC.inv
  have hexp : exponent u v a b = gaussianExponent Q := funext (exponent_eq_gaussianExponent u v a b)
  have hZ : Integrable (fun x : V → ℝ ↦ exp (exponent u v a b x)) := hexp ▸ integrable_gaussian_unnorm hQ
  have htilted (g : (V → ℝ) → ℝ) : ∫ x : V → ℝ, g x ∂G = ∫ x : V → ℝ, g x * gaussianDensity Q x := by
    change ∫ x, g x ∂volume.tilted (exponent u v a b) = _
    rw [hexp, integral_tilted, integral_gaussian_unnorm hQ]
    congr 1; ext x; simp [gaussianDensity, smul_eq_mul, div_eq_inv_mul]; ring
  have hsiteG : ∫ x : V → ℝ, site x ∂G = S := by rw [htilted, gibbs_site_moment_density hQ, hQinv, htrC]
  have hedgeG : ∫ x : V → ℝ, edge u v x ∂G = r * S := by
    rw [htilted, gibbs_edge_moment_density u v hQ, hQinv, hedgeC]
  obtain ⟨gs, ge⟩ := gibbs_moments_posDef u v hQ
  have hb_eq : b = β / 2 := rfl
  refine ⟨a, b, half_pos hα, hQ, isProbabilityMeasure_tilted hZ,
    hβpos.trans ⟨fun h ↦ by linarith [hb_eq], fun h ↦ by linarith [hb_eq]⟩,
    hβzero.trans ⟨fun h ↦ by linarith [hb_eq], fun h ↦ by linarith [hb_eq]⟩,
    hβneg.trans ⟨fun h ↦ by linarith [hb_eq], fun h ↦ by linarith [hb_eq]⟩,
    fun i j ↦ by rw [hexp]; exact tilted_gaussian_cov hQ i j,
    hQinv ▸ htrC, hQinv ▸ hedgeC, hsiteG, hedgeG,
    fun D hD hDs hDe hne ↦ hQinv ▸ hdetmax D hD hDs hDe (hQinv ▸ hne), fun μ hprobμ hsμ heμ hsiteμ hedgeμ ↦ ?_⟩
  have hgap := extEntropy_gap hZ ((hsμ.const_mul (-a)).add (heμ.const_mul (-b)))
    ((gs.const_mul (-a)).add (ge.const_mul (-b)))
    (matching_energy site (edge u v) (-a) (-b) hsμ heμ gs ge
      (hsiteμ.trans hsiteG.symm) (hedgeμ.trans hedgeG.symm))
  exact ⟨hgap.2.1, hgap.2.2.1, hgap.2.2.2⟩

end LatticeDetermination

/-! ### §2.3 Finite-Lattice Gibbs Zero Mean, Characteristic Function & Box Reflection Positivity -/
section GibbsCharAndBoxRP

open MeasureTheory Real Matrix
open scoped BigOperators

/-- Zero mean of the centered multivariate Gaussian Gibbs density `p_Q(x)` by reflection oddness
`x ↦ -x` (§2.3). -/
theorem gibbs_mean_zero {V : Type*} [Fintype V] [DecidableEq V]
    (Q : Matrix V V ℝ) (i : V) :
    ∫ x : V → ℝ, x i * gaussianDensity Q x = 0 := by
  have h := MeasureTheory.integral_neg_eq_self
    (fun x : V → ℝ => x i * gaussianDensity Q x) volume
  have hodd : (fun x : V → ℝ => (-x) i * gaussianDensity Q (-x)) =
      fun x => -(x i * gaussianDensity Q x) := by
    funext x
    have hexp : gaussianExponent Q (-x) = gaussianExponent Q x := by
      simp [gaussianExponent, mulVec_neg, dotProduct_neg, neg_dotProduct]
    simp [gaussianDensity, hexp]
  rw [hodd, MeasureTheory.integral_neg] at h
  linarith

/-- Zero mean in the `volume.tilted (gaussianExponent Q)` representation of `lattice_maxent`. -/
theorem tilted_gibbs_mean_zero {V : Type*} [Fintype V] [DecidableEq V]
    {Q : Matrix V V ℝ} (hQ : Q.PosDef) (i : V) :
    ∫ x : V → ℝ, x i ∂volume.tilted (gaussianExponent Q) = 0 := by
  rw [MeasureTheory.integral_tilted, integral_gaussian_unnorm hQ]
  convert gibbs_mean_zero Q i using 1
  congr 1; ext x; simp [gaussianDensity, smul_eq_mul, div_eq_inv_mul]; ring

private lemma seam_integral_cexp_g1 {q : ℝ} (hq : 0 < q) (a : ℝ) :
    (∫ t : ℝ, Complex.exp (Complex.I * ((a * t : ℝ) : ℂ)) *
      (Real.exp (-(1 / 2) * (q * t ^ 2)) : ℂ)) =
    (Real.sqrt (2 * Real.pi / q) : ℂ) * (Real.exp (-(1 / 2) * (a ^ 2 / q)) : ℂ) := by
  let b : ℂ := -((q / 2 : ℝ) : ℂ)
  have hb : b.re < 0 := by
    simp only [b, Complex.neg_re, Complex.ofReal_re]
    linarith
  have hfun : (fun t : ℝ => Complex.exp (Complex.I * ((a * t : ℝ) : ℂ)) *
        (Real.exp (-(1 / 2) * (q * t ^ 2)) : ℂ)) =
      fun t : ℝ => Complex.exp (b * (t : ℂ) ^ 2 + (Complex.I * (a : ℂ)) * (t : ℂ) + 0) := by
    funext t
    rw [Complex.ofReal_exp, ← Complex.exp_add]
    congr 1
    simp only [b]
    push_cast
    ring
  rw [hfun, integral_cexp_quadratic hb (Complex.I * (a : ℂ)) 0]
  have hfac1 : ((Real.pi : ℂ) / -b) ^ ((1 : ℂ) / 2) = (Real.sqrt (2 * Real.pi / q) : ℂ) := by
    have hdiv : (Real.pi : ℂ) / -b = ((2 * Real.pi / q : ℝ) : ℂ) := by
      have hq' : (q : ℂ) ≠ 0 := Complex.ofReal_ne_zero.mpr hq.ne'
      simp only [b, neg_neg]
      push_cast
      field_simp [hq']
    rw [hdiv, show ((1 : ℂ) / 2) = (((1 / 2 : ℝ) : ℂ)) by norm_num,
      ← Complex.ofReal_cpow (by positivity), Real.sqrt_eq_rpow]
  have hfac2 : Complex.exp (0 - (Complex.I * (a : ℂ)) ^ 2 / (4 * b)) =
      (Real.exp (-(1 / 2) * (a ^ 2 / q)) : ℂ) := by
    rw [Complex.ofReal_exp]
    congr 1
    have hq' : (q : ℂ) ≠ 0 := Complex.ofReal_ne_zero.mpr hq.ne'
    simp only [b]
    rw [mul_pow, Complex.I_sq]
    push_cast
    field_simp [hq']
    ring
  rw [hfac1, hfac2]

private lemma seam_unitary_mul_t {V : Type*} [Fintype V] [DecidableEq V] (U : unitaryGroup V ℝ) :
    (U : Matrix V V ℝ) * (U : Matrix V V ℝ)ᵀ = 1 := by
  simpa [Matrix.star_eq_conjTranspose, Matrix.conjTranspose_eq_transpose_of_trivial] using
    Unitary.coe_mul_star_self U

private lemma seam_unitary_t_mul {V : Type*} [Fintype V] [DecidableEq V] (U : unitaryGroup V ℝ) :
    (U : Matrix V V ℝ)ᵀ * (U : Matrix V V ℝ) = 1 := by
  simpa [Matrix.star_eq_conjTranspose, Matrix.conjTranspose_eq_transpose_of_trivial] using
    Unitary.coe_star_mul_self U

private lemma seam_measurePreserving_orth {V : Type*} [Fintype V] [DecidableEq V]
    (U : unitaryGroup V ℝ) :
    MeasurePreserving (orthLinearEquiv U).toContinuousLinearEquiv.toHomeomorph.toMeasurableEquiv
      volume volume := by
  let e := (orthLinearEquiv U).toContinuousLinearEquiv.toHomeomorph.toMeasurableEquiv
  have hdet : |(U : Matrix V V ℝ).det| = 1 := by
    have h : (U : Matrix V V ℝ).det ^ 2 = 1 := by
      calc (U : Matrix V V ℝ).det ^ 2 = (U : Matrix V V ℝ).det * (U : Matrix V V ℝ)ᵀ.det := by
            rw [sq, det_transpose]
        _ = ((U : Matrix V V ℝ) * (U : Matrix V V ℝ)ᵀ).det := (det_mul _ _).symm
        _ = 1 := by rw [seam_unitary_mul_t, det_one]
    rcases sq_eq_one_iff.mp h with h1 | h1 <;> simp [h1]
  refine ⟨e.measurable, Measure.ext fun s hs => ?_⟩
  rw [Measure.map_apply e.measurable hs]
  change volume ((orthLinearEquiv U) ⁻¹' s) = volume s
  rw [Measure.addHaar_preimage_linearEquiv,
    show LinearMap.det (orthLinearEquiv U).symm.toLinearMap = (U : Matrix V V ℝ).det by
      change LinearMap.det (toLin' (U : Matrix V V ℝ)ᵀ) = _; rw [LinearMap.det_toLin', det_transpose],
    hdet, ENNReal.ofReal_one, one_mul]

private lemma seam_spectral_t {V : Type*} [Fintype V] [DecidableEq V]
    {Q : Matrix V V ℝ} (hQ : Q.PosDef) :
    Q = (hQ.isHermitian.eigenvectorUnitary : Matrix V V ℝ) *
      diagonal hQ.isHermitian.eigenvalues *
      (hQ.isHermitian.eigenvectorUnitary : Matrix V V ℝ)ᵀ := by
  simpa [Unitary.conjStarAlgAut_apply, Matrix.star_eq_conjTranspose,
    Matrix.conjTranspose_eq_transpose_of_trivial] using hQ.isHermitian.spectral_theorem

private lemma seam_quadForm_eigenvector {V : Type*} [Fintype V] [DecidableEq V]
    {Q : Matrix V V ℝ} (hQ : Q.PosDef) (y : V → ℝ) :
    ((hQ.isHermitian.eigenvectorUnitary : Matrix V V ℝ) *ᵥ y) ⬝ᵥ
      (Q *ᵥ ((hQ.isHermitian.eigenvectorUnitary : Matrix V V ℝ) *ᵥ y)) =
      ∑ k : V, hQ.isHermitian.eigenvalues k * y k ^ 2 := by
  let Uu := hQ.isHermitian.eigenvectorUnitary
  let U : Matrix V V ℝ := Uu
  let q := hQ.isHermitian.eigenvalues
  have hQeq : Q = U * diagonal q * Uᵀ := seam_spectral_t hQ
  have h1 : Q *ᵥ (U *ᵥ y) = U *ᵥ (diagonal q *ᵥ y) := by
    rw [hQeq, mulVec_mulVec, Matrix.mul_assoc, Matrix.mul_assoc, seam_unitary_t_mul Uu,
      Matrix.mul_one, ← mulVec_mulVec]
  change (U *ᵥ y) ⬝ᵥ (Q *ᵥ (U *ᵥ y)) = ∑ k : V, q k * y k ^ 2
  rw [h1, dotProduct_mulVec, ← mulVec_transpose, mulVec_mulVec, seam_unitary_t_mul Uu, one_mulVec]
  simp only [dotProduct, mulVec_diagonal]
  exact Finset.sum_congr rfl fun k _ => by ring

private lemma seam_prod_sqrt_two_pi_div {V : Type*} [Fintype V] (q : V → ℝ) (hq : ∀ k, 0 < q k) :
    ∏ k : V, √(2 * π / q k) = (2 * π) ^ ((Fintype.card V : ℝ) / 2) / √(∏ k : V, q k) := by
  have h2pi : (0 : ℝ) ≤ 2 * π := by positivity
  have hprod : ∀ s : Finset V, ∏ k ∈ s, √(q k) = √(∏ k ∈ s, q k) := fun s =>
    Finset.cons_induction (by simp) (fun a s _ ih => by
      rw [Finset.prod_cons, Finset.prod_cons, ih, ← Real.sqrt_mul (hq a).le]) s
  simp_rw [Real.sqrt_div h2pi]
  rw [Finset.prod_div_distrib, Finset.prod_const, Finset.card_univ, hprod, Real.sqrt_eq_rpow,
    ← Real.rpow_natCast, ← Real.rpow_mul h2pi]
  congr 2; ring

/-- Exact Gaussian characteristic function of the finite-lattice Gibbs density `p_Q(x)` with
covariance `C = Q⁻¹`: `∫ exp(i ξ · x) p_Q(x) dx = exp(-(1/2) ξᵀ Q⁻¹ ξ)`, connecting §2.3's
finite Gibbs law directly to §2.2's Eq. (2). -/
theorem gibbs_charFun {V : Type*} [Fintype V] [DecidableEq V]
    {Q : Matrix V V ℝ} (hQ : Q.PosDef) (ξ : V → ℝ) :
    (∫ x : V → ℝ, Complex.exp (Complex.I * ((∑ i : V, ξ i * x i : ℝ) : ℂ)) *
      (gaussianDensity Q x : ℂ)) =
    (Real.exp (-(1 / 2) * (ξ ⬝ᵥ Q⁻¹ *ᵥ ξ)) : ℂ) := by
  let Uu := hQ.isHermitian.eigenvectorUnitary
  let U : Matrix V V ℝ := Uu
  let q := hQ.isHermitian.eigenvalues
  let η : V → ℝ := Uᵀ *ᵥ ξ
  let e := (orthLinearEquiv Uu).toContinuousLinearEquiv.toHomeomorph.toMeasurableEquiv
  have hQeq : Q = U * diagonal q * Uᵀ := seam_spectral_t hQ
  have hinv : Q⁻¹ = U * diagonal (fun k => (q k)⁻¹) * Uᵀ := Matrix.inv_eq_left_inv <| by
    calc (U * diagonal (fun k => (q k)⁻¹) * Uᵀ) * Q
        = U * (diagonal (fun k => (q k)⁻¹) * ((Uᵀ * U) * diagonal q)) * Uᵀ := by
            rw [hQeq]; simp only [Matrix.mul_assoc]
      _ = U * Uᵀ := by
            rw [seam_unitary_t_mul Uu, Matrix.one_mul, diagonal_mul_diagonal,
              show (fun k => (q k)⁻¹ * q k) = fun _ => 1 from
                funext fun k => inv_mul_cancel₀ (hQ.eigenvalues_pos k).ne',
              diagonal_one, Matrix.mul_one]
      _ = 1 := seam_unitary_mul_t Uu
  have hquad_inv : ξ ⬝ᵥ Q⁻¹ *ᵥ ξ = ∑ k : V, η k ^ 2 / q k := by
    rw [hinv, ← mulVec_mulVec, ← mulVec_mulVec, dotProduct_mulVec, ← mulVec_transpose]
    change η ⬝ᵥ (diagonal (fun k => (q k)⁻¹) *ᵥ η) = ∑ k : V, η k ^ 2 / q k
    simp only [dotProduct, mulVec_diagonal, sq, div_eq_mul_inv]
    exact Finset.sum_congr rfl fun k _ => by ring
  have hZ : ∏ k : V, √(2 * π / q k) = gaussianPartition Q := by
    rw [seam_prod_sqrt_two_pi_div q hQ.eigenvalues_pos, gaussianPartition]
    congr 2; simpa using hQ.isHermitian.det_eq_prod_eigenvalues.symm
  rw [← (seam_measurePreserving_orth Uu).integral_comp' (f := e)]
  have hrew : (fun y : V → ℝ =>
        Complex.exp (Complex.I * ((∑ i : V, ξ i * e y i : ℝ) : ℂ)) * (gaussianDensity Q (e y) : ℂ)) =
      fun y : V → ℝ => ((gaussianPartition Q)⁻¹ : ℂ) *
        ∏ k : V, (Complex.exp (Complex.I * ((η k * y k : ℝ) : ℂ)) *
          (Real.exp (-(1 / 2) * (q k * y k ^ 2)) : ℂ)) := by
    funext y
    have hlin : (∑ i : V, ξ i * e y i) = ∑ k : V, η k * y k := by
      have hdot : ξ ⬝ᵥ (U *ᵥ y) = η ⬝ᵥ y := by
        rw [dotProduct_mulVec, ← mulVec_transpose]
      simpa [e, orthLinearEquiv, dotProduct] using hdot
    have hexp : gaussianExponent Q (e y) = -(1 / 2) * ∑ k : V, q k * y k ^ 2 := by
      change -(1 / 2) * ((U *ᵥ y) ⬝ᵥ (Q *ᵥ (U *ᵥ y))) = _
      rw [seam_quadForm_eigenvector hQ]
    rw [hlin, gaussianDensity, hexp, Complex.ofReal_mul, Complex.ofReal_inv,
      Finset.prod_mul_distrib, ← Complex.exp_sum, ← Complex.ofReal_prod, ← Real.exp_sum,
      ← Finset.mul_sum, ← Finset.mul_sum, Complex.ofReal_sum]
    ring
  rw [hrew, integral_const_mul, volume_pi,
    integral_fintype_prod_eq_prod (f := fun k t =>
      Complex.exp (Complex.I * ((η k * t : ℝ) : ℂ)) * (Real.exp (-(1 / 2) * (q k * t ^ 2)) : ℂ))]
  rw [Finset.prod_congr rfl fun k _ => seam_integral_cexp_g1 (hQ.eigenvalues_pos k) (η k)]
  rw [Finset.prod_mul_distrib, ← Complex.ofReal_prod, ← Complex.ofReal_prod,
    ← Real.exp_sum, ← Finset.mul_sum, hZ, ← hquad_inv, ← mul_assoc,
    ← Complex.ofReal_inv, ← Complex.ofReal_mul, inv_mul_cancel₀ (gaussianPartition_pos hQ).ne',
    Complex.ofReal_one, one_mul]

/-- Characteristic function in the `volume.tilted (gaussianExponent Q)` representation. -/
theorem tilted_gibbs_charFun {V : Type*} [Fintype V] [DecidableEq V]
    {Q : Matrix V V ℝ} (hQ : Q.PosDef) (ξ : V → ℝ) :
    (∫ x : V → ℝ, Complex.exp (Complex.I * ((∑ i : V, ξ i * x i : ℝ) : ℂ))
      ∂volume.tilted (gaussianExponent Q)) =
    (Real.exp (-(1 / 2) * (ξ ⬝ᵥ Q⁻¹ *ᵥ ξ)) : ℂ) := by
  rw [MeasureTheory.integral_tilted, integral_gaussian_unnorm hQ]
  convert gibbs_charFun hQ ξ using 1
  congr 1; ext x
  simp only [gaussianDensity, Complex.real_smul, Complex.ofReal_mul, Complex.ofReal_inv,
    div_eq_inv_mul]
  ring

/-- General finite-box / plane-factorized reflection positivity (Eq. 4 of the paper):
if a symmetric density splits across a plane variable `φ₀` into identical left/right halves
`p(φ₀, φL, φR) = ρ₀(φ₀) k(φ₀, φL) k(φ₀, φR)` with `ρ₀ ≥ 0`, `k ≥ 0`, then for every `L²`
preparation `X(φ₀, φR)`, the reflected expectation `∫ (θX · X) p` equals the nonnegative
plane integral `∫ (∫ X(φ₀, φR) k(φ₀, φR) dμ₁)² ρ₀(φ₀) dμ₀ ≥ 0`. -/
theorem freeBox_reflection_pos {Ω₀ Ω₁ : Type*}
    [MeasurableSpace Ω₀] [MeasurableSpace Ω₁]
    (μ₀ : Measure Ω₀) (μ₁ : Measure Ω₁) [SFinite μ₀] [SFinite μ₁]
    (ρ₀ : Ω₀ → ℝ) (k : Ω₀ → Ω₁ → ℝ) (X : Ω₀ → Ω₁ → ℝ)
    (hρ₀ : ∀ φ₀, 0 ≤ ρ₀ φ₀)
    (hk : ∀ φ₀ φ₁, 0 ≤ k φ₀ φ₁)
    (hXmeas : AEStronglyMeasurable
      (fun z : Ω₀ × (Ω₁ × Ω₁) =>
        (X z.1 z.2.1 * X z.1 z.2.2) * (ρ₀ z.1 * k z.1 z.2.1 * k z.1 z.2.2))
      (μ₀.prod (μ₁.prod μ₁)))
    (hXL2 : Integrable
      (fun z : Ω₀ × (Ω₁ × Ω₁) =>
        (X z.1 z.2.2) ^ 2 * (ρ₀ z.1 * k z.1 z.2.1 * k z.1 z.2.2))
      (μ₀.prod (μ₁.prod μ₁))) :
    (∫ z : Ω₀ × (Ω₁ × Ω₁),
        (X z.1 z.2.1 * X z.1 z.2.2) * (ρ₀ z.1 * k z.1 z.2.1 * k z.1 z.2.2)
        ∂(μ₀.prod (μ₁.prod μ₁))) =
      (∫ φ₀ : Ω₀, (∫ φR : Ω₁, X φ₀ φR * k φ₀ φR ∂μ₁) ^ 2 * ρ₀ φ₀ ∂μ₀) ∧
    0 ≤ ∫ z : Ω₀ × (Ω₁ × Ω₁),
        (X z.1 z.2.1 * X z.1 z.2.2) * (ρ₀ z.1 * k z.1 z.2.1 * k z.1 z.2.2)
        ∂(μ₀.prod (μ₁.prod μ₁)) := by
  let θ : (Ω₀ × (Ω₁ × Ω₁)) ≃ᵐ (Ω₀ × (Ω₁ × Ω₁)) :=
    (MeasurableEquiv.refl Ω₀).prodCongr (MeasurableEquiv.prodComm)
  have hθ : MeasurePreserving θ (μ₀.prod (μ₁.prod μ₁)) (μ₀.prod (μ₁.prod μ₁)) :=
    (MeasurePreserving.id μ₀).prod Measure.measurePreserving_swap
  have hXL2_left : Integrable
      (fun z : Ω₀ × (Ω₁ × Ω₁) =>
        (X z.1 z.2.1) ^ 2 * (ρ₀ z.1 * k z.1 z.2.1 * k z.1 z.2.2))
      (μ₀.prod (μ₁.prod μ₁)) := by
    have hcomp := (hθ.integrable_comp_emb θ.measurableEmbedding).mpr hXL2
    refine hcomp.congr (ae_of_all _ fun z => ?_)
    change (X z.1 z.2.1) ^ 2 * (ρ₀ z.1 * k z.1 z.2.2 * k z.1 z.2.1) = _
    ring
  have hint : Integrable
      (fun z : Ω₀ × (Ω₁ × Ω₁) =>
        (X z.1 z.2.1 * X z.1 z.2.2) * (ρ₀ z.1 * k z.1 z.2.1 * k z.1 z.2.2))
      (μ₀.prod (μ₁.prod μ₁)) := by
    refine ((hXL2_left.add hXL2).const_mul (1 / 2 : ℝ)).mono' hXmeas (ae_of_all _ fun z => ?_)
    have hp : 0 ≤ ρ₀ z.1 * k z.1 z.2.1 * k z.1 z.2.2 :=
      mul_nonneg (mul_nonneg (hρ₀ z.1) (hk z.1 z.2.1)) (hk z.1 z.2.2)
    rw [Real.norm_eq_abs, abs_mul, abs_of_nonneg hp, abs_mul]
    have hamgm : |X z.1 z.2.1| * |X z.1 z.2.2| ≤ (1 / 2 : ℝ) * ((X z.1 z.2.1) ^ 2 + (X z.1 z.2.2) ^ 2) := by
      nlinarith [sq_nonneg (|X z.1 z.2.1| - |X z.1 z.2.2|), sq_abs (X z.1 z.2.1), sq_abs (X z.1 z.2.2)]
    simp only [Pi.add_apply]
    nlinarith
  have heq : (∫ z : Ω₀ × (Ω₁ × Ω₁),
        (X z.1 z.2.1 * X z.1 z.2.2) * (ρ₀ z.1 * k z.1 z.2.1 * k z.1 z.2.2)
        ∂(μ₀.prod (μ₁.prod μ₁))) =
      ∫ φ₀ : Ω₀, (∫ φR : Ω₁, X φ₀ φR * k φ₀ φR ∂μ₁) ^ 2 * ρ₀ φ₀ ∂μ₀ := by
    rw [MeasureTheory.integral_prod _ hint]
    refine integral_congr_ae (ae_of_all _ fun φ₀ => ?_)
    dsimp only
    have hinner : (fun q : Ω₁ × Ω₁ =>
          (X φ₀ q.1 * X φ₀ q.2) * (ρ₀ φ₀ * k φ₀ q.1 * k φ₀ q.2)) =
        fun q : Ω₁ × Ω₁ => ρ₀ φ₀ * ((X φ₀ q.1 * k φ₀ q.1) * (X φ₀ q.2 * k φ₀ q.2)) := by
      funext q; ring
    rw [hinner, integral_const_mul,
      MeasureTheory.integral_prod_mul (f := fun φR => X φ₀ φR * k φ₀ φR)
        (g := fun φR => X φ₀ φR * k φ₀ φR), ← sq, mul_comm]
  exact ⟨heq, heq ▸ integral_nonneg fun φ₀ => mul_nonneg (sq_nonneg _) (hρ₀ φ₀)⟩

/-- Explicit finite-box lattice Gibbs factorization and reflection positivity (Eq. (3) → Eq. (4)):
on a reflection-symmetric box split across plane sites `V₀` into identical halves `VR ⊕ VR`
with plane edges `E₀` and half-box edges `ER` (no direct edge between left and right halves),
the unnormalized Boltzmann density `exp(-a ∑ φ² - b ∑ (Δφ)²)` satisfies Eq. (4) for every
`L²` preparation `X(φ₀, φR)`. -/
theorem freeBox_lattice_gibbs_reflection_pos
    {V₀ VR E₀ ER : Type*} [Fintype V₀] [Fintype VR] [Fintype E₀] [Fintype ER]
    (u₀ v₀ : E₀ → V₀) (uR vR : ER → V₀ ⊕ VR) (a b : ℝ)
    (X : (V₀ → ℝ) → (VR → ℝ) → ℝ)
    (p : (V₀ → ℝ) × ((VR → ℝ) × (VR → ℝ)) → ℝ)
    (hp : ∀ z, p z = Real.exp (-(a * (∑ i : V₀, z.1 i ^ 2 + ∑ j : VR, z.2.1 j ^ 2 + ∑ j : VR, z.2.2 j ^ 2) +
      b * (∑ e : E₀, (z.1 (u₀ e) - z.1 (v₀ e)) ^ 2 +
        ∑ e : ER, (Sum.elim z.1 z.2.1 (uR e) - Sum.elim z.1 z.2.1 (vR e)) ^ 2 +
        ∑ e : ER, (Sum.elim z.1 z.2.2 (uR e) - Sum.elim z.1 z.2.2 (vR e)) ^ 2))))
    (hXmeas : AEStronglyMeasurable
      (fun z : (V₀ → ℝ) × ((VR → ℝ) × (VR → ℝ)) => (X z.1 z.2.1 * X z.1 z.2.2) * p z)
      (volume.prod (volume.prod volume)))
    (hXL2 : Integrable
      (fun z : (V₀ → ℝ) × ((VR → ℝ) × (VR → ℝ)) => (X z.1 z.2.2) ^ 2 * p z)
      (volume.prod (volume.prod volume))) :
    0 ≤ ∫ z : (V₀ → ℝ) × ((VR → ℝ) × (VR → ℝ)),
        (X z.1 z.2.1 * X z.1 z.2.2) * p z ∂(volume.prod (volume.prod volume)) := by
  let ρ₀ : (V₀ → ℝ) → ℝ := fun φ₀ =>
    Real.exp (-(a * ∑ i : V₀, φ₀ i ^ 2 + b * ∑ e : E₀, (φ₀ (u₀ e) - φ₀ (v₀ e)) ^ 2))
  let k : (V₀ → ℝ) → (VR → ℝ) → ℝ := fun φ₀ φ₁ =>
    Real.exp (-(a * ∑ j : VR, φ₁ j ^ 2 +
      b * ∑ e : ER, (Sum.elim φ₀ φ₁ (uR e) - Sum.elim φ₀ φ₁ (vR e)) ^ 2))
  have hfac : ∀ z : (V₀ → ℝ) × ((VR → ℝ) × (VR → ℝ)),
      p z = ρ₀ z.1 * k z.1 z.2.1 * k z.1 z.2.2 := fun z => by
    rw [hp z]
    simp only [ρ₀, k, ← Real.exp_add]
    congr 1
    ring
  have hmeas' : AEStronglyMeasurable
      (fun z : (V₀ → ℝ) × ((VR → ℝ) × (VR → ℝ)) =>
        (X z.1 z.2.1 * X z.1 z.2.2) * (ρ₀ z.1 * k z.1 z.2.1 * k z.1 z.2.2))
      (volume.prod (volume.prod volume)) := by
    simpa [hfac] using hXmeas
  have hL2' : Integrable
      (fun z : (V₀ → ℝ) × ((VR → ℝ) × (VR → ℝ)) =>
        (X z.1 z.2.2) ^ 2 * (ρ₀ z.1 * k z.1 z.2.1 * k z.1 z.2.2))
      (volume.prod (volume.prod volume)) := by
    simpa [hfac] using hXL2
  have hres := (freeBox_reflection_pos (volume : Measure (V₀ → ℝ)) (volume : Measure (VR → ℝ))
    ρ₀ k X (fun _ => (Real.exp_pos _).le) (fun _ _ => (Real.exp_pos _).le) hmeas' hL2').2
  simpa [hfac] using hres

end GibbsCharAndBoxRP

/-! ### §2.3 Lattice → Continuum Covariance & Finite-Joint-Law Convergence -/
section ContinuumLimit

open MeasureTheory Filter Set
open scoped Topology BigOperators

/-- Lattice dispersion relation on a `D`-dimensional cubic lattice of spacing `a` and mass `m`. -/
noncomputable def latticeDispersion {D : ℕ} (a m : ℝ) (p : EuclideanSpace ℝ (Fin D)) : ℝ :=
  (4 / a ^ 2) * ∑ j, Real.sin (a * p j / 2) ^ 2 + m ^ 2

/-- Continuum Euclidean dispersion relation `‖p‖² + m²`. -/
noncomputable def continuumDispersion {D : ℕ} (m : ℝ) (p : EuclideanSpace ℝ (Fin D)) : ℝ :=
  ‖p‖ ^ 2 + m ^ 2

/-- First Brillouin zone `[-π / a, π / a]^D` for lattice spacing `a`. -/
def brillouinZone (D : ℕ) (a : ℝ) : Set (EuclideanSpace ℝ (Fin D)) :=
  {p | ∀ j, |p j| ≤ Real.pi / a}

/-- Lattice momentum-space covariance bilinear form integrated over the Brillouin zone. -/
noncomputable def latticeCov {D : ℕ} (ħ a m : ℝ)
    (fhat ghat : EuclideanSpace ℝ (Fin D) → ℂ) : ℂ :=
  (ħ : ℂ) * ∫ p in brillouinZone D a,
    star (fhat p) * ghat p * (latticeDispersion a m p)⁻¹

/-- Continuum momentum-space covariance bilinear form on `ℝ^D`. -/
noncomputable def continuumCov {D : ℕ} (ħ m : ℝ)
    (fhat ghat : EuclideanSpace ℝ (Fin D) → ℂ) : ℂ :=
  (ħ : ℂ) * ∫ p, star (fhat p) * ghat p * (continuumDispersion m p)⁻¹

/-- Elementary Jordan lower bound: `(2 / π) * |x| ≤ |sin x|` on `[-π/2, π/2]`. -/
theorem jordan_sin_bound {x : ℝ} (hx : |x| ≤ Real.pi / 2) :
    (2 / Real.pi) * |x| ≤ |Real.sin x| := by
  have hle : |x| ≤ Real.pi := by linarith [Real.pi_pos]
  have hsin : Real.sin |x| = |Real.sin x| := by
    rcases le_total 0 x with h0 | h0
    · rw [abs_of_nonneg h0,
        abs_of_nonneg (Real.sin_nonneg_of_nonneg_of_le_pi h0 (by rwa [abs_of_nonneg h0] at hle))]
    · have hnn := Real.sin_nonneg_of_nonneg_of_le_pi (neg_nonneg.mpr h0)
        (by rwa [abs_of_nonpos h0] at hle)
      rw [abs_of_nonpos h0]
      rw [Real.sin_neg] at hnn ⊢
      rw [abs_of_nonpos (by linarith)]
  exact hsin ▸ Real.mul_le_sin (abs_nonneg x) hx

/-- Squared Jordan lower bound: `(4 / π²) * x² ≤ sin² x` on `[-π/2, π/2]`. -/
theorem sin_sq_lower_bound {x : ℝ} (hx : |x| ≤ Real.pi / 2) :
    (4 / Real.pi ^ 2) * x ^ 2 ≤ Real.sin x ^ 2 := by
  have hsq : ((2 / Real.pi) * |x|) ^ 2 ≤ |Real.sin x| ^ 2 :=
    pow_le_pow_left₀ (by positivity) (jordan_sin_bound hx) 2
  rw [mul_pow, div_pow, sq_abs, sq_abs] at hsq
  norm_num at hsq
  exact hsq

/-- Uniform elliptic lower bound on the Brillouin zone:
`(4 / π²) * ‖p‖² + m² ≤ latticeDispersion a m p`. -/
theorem latticeDispersion_lower_bound {D : ℕ} {a m : ℝ} (ha : 0 < a)
    {p : EuclideanSpace ℝ (Fin D)} (hp : p ∈ brillouinZone D a) :
    (4 / Real.pi ^ 2) * ‖p‖ ^ 2 + m ^ 2 ≤ latticeDispersion a m p := by
  unfold latticeDispersion
  have hterm : ∀ j : Fin D,
      (4 / Real.pi ^ 2) * (p j) ^ 2 ≤ (4 / a ^ 2) * Real.sin (a * p j / 2) ^ 2 := by
    intro j
    have hj : |a * p j / 2| ≤ Real.pi / 2 := by
      rw [abs_div, abs_mul, abs_of_pos ha, abs_of_pos (two_pos : (0 : ℝ) < 2)]
      have h1 : a * |p j| ≤ Real.pi := by
        simpa [mul_div_cancel₀ _ ha.ne'] using mul_le_mul_of_nonneg_left (hp j) ha.le
      linarith
    have hmul := mul_le_mul_of_nonneg_left (sin_sq_lower_bound hj) (by positivity : (0 : ℝ) ≤ 4 / a ^ 2)
    have hEq : (4 / a ^ 2) * ((4 / Real.pi ^ 2) * (a * p j / 2) ^ 2) =
        (4 / Real.pi ^ 2) * (p j) ^ 2 := by field_simp [ha.ne']; ring
    linarith
  have hsum : (4 / Real.pi ^ 2) * ‖p‖ ^ 2 ≤
      (4 / a ^ 2) * ∑ j : Fin D, Real.sin (a * p j / 2) ^ 2 := by
    rw [EuclideanSpace.norm_sq_eq, Finset.mul_sum, Finset.mul_sum]
    exact Finset.sum_le_sum fun j _ => by simpa [Real.norm_eq_abs, sq_abs] using hterm j
  linarith

/-- The lattice dispersion is everywhere bounded below by `m²`. -/
theorem sq_le_latticeDispersion {D : ℕ} (a m : ℝ) (p : EuclideanSpace ℝ (Fin D)) :
    m ^ 2 ≤ latticeDispersion a m p := by
  unfold latticeDispersion
  have hnn : 0 ≤ (4 / a ^ 2) * ∑ j : Fin D, Real.sin (a * p j / 2) ^ 2 :=
    mul_nonneg (by positivity) (Finset.sum_nonneg fun _ _ => sq_nonneg _)
  linarith

/-- Strict positivity of the lattice dispersion for `m > 0`. -/
theorem latticeDispersion_pos {D : ℕ} (a : ℝ) {m : ℝ} (hm : 0 < m)
    (p : EuclideanSpace ℝ (Fin D)) : 0 < latticeDispersion a m p :=
  lt_of_lt_of_le (sq_pos_of_pos hm) (sq_le_latticeDispersion a m p)

/-- Brillouin-zone UV-decaying upper bound on the lattice propagator:
`(latticeDispersion a m p)⁻¹ ≤ ((4 / π²) * ‖p‖² + m²)⁻¹`. -/
theorem latticeDispersion_inv_le {D : ℕ} {a m : ℝ} (ha : 0 < a) (hm : 0 < m)
    {p : EuclideanSpace ℝ (Fin D)} (hp : p ∈ brillouinZone D a) :
    (latticeDispersion a m p)⁻¹ ≤ ((4 / Real.pi ^ 2) * ‖p‖ ^ 2 + m ^ 2)⁻¹ :=
  inv_anti₀ (by positivity) (latticeDispersion_lower_bound ha hp)

/-- Uniform `m⁻²` upper bound on the lattice propagator. -/
theorem latticeDispersion_inv_le_inv_sq {D : ℕ} (a : ℝ) {m : ℝ} (hm : 0 < m)
    (p : EuclideanSpace ℝ (Fin D)) : (latticeDispersion a m p)⁻¹ ≤ m⁻¹ ^ 2 := by
  rw [inv_pow]
  exact inv_anti₀ (sq_pos_of_pos hm) (sq_le_latticeDispersion a m p)

/-- The Brillouin-zone upper bound is itself bounded by `m⁻²`. -/
theorem jordan_inv_le_inv_sq {D : ℕ} {m : ℝ} (hm : 0 < m) (p : EuclideanSpace ℝ (Fin D)) :
    ((4 / Real.pi ^ 2) * ‖p‖ ^ 2 + m ^ 2)⁻¹ ≤ m⁻¹ ^ 2 := by
  rw [inv_pow]
  exact inv_anti₀ (sq_pos_of_pos hm) (by linarith [show 0 ≤ (4 / Real.pi ^ 2) * ‖p‖ ^ 2 by positivity])

/-- The Brillouin zone is closed, hence measurable. -/
theorem measurableSet_brillouinZone (D : ℕ) (a : ℝ) : MeasurableSet (brillouinZone D a) := by
  have hEq : brillouinZone D a =
      ⋂ j : Fin D, {p : EuclideanSpace ℝ (Fin D) | |p j| ≤ Real.pi / a} := by
    ext p; simp [brillouinZone]
  rw [hEq]
  exact (isClosed_iInter fun j =>
    isClosed_le (continuous_abs.comp (EuclideanSpace.proj j).continuous) continuous_const).measurableSet

/-- Every fixed momentum `p` eventually lies inside the Brillouin zone as `a → 0+`. -/
theorem eventually_mem_brillouinZone {D : ℕ} (p : EuclideanSpace ℝ (Fin D)) :
    ∀ᶠ a in 𝓝[>] (0 : ℝ), p ∈ brillouinZone D a := by
  filter_upwards [Ioo_mem_nhdsGT (by positivity : 0 < Real.pi / (‖p‖ + 1))] with a ha j
  have hnorm : |p j| ≤ ‖p‖ := by simpa [Real.norm_eq_abs] using PiLp.norm_apply_le p j
  have hlt : a * (‖p‖ + 1) < Real.pi := (lt_div_iff₀ (by positivity)).mp ha.2
  exact (le_div_iff₀ ha.1).mpr (by nlinarith [ha.1])

/-- Pointwise convergence of the lattice dispersion to the continuum dispersion as `a → 0+`. -/
theorem tendsto_latticeDispersion {D : ℕ} (m : ℝ) (p : EuclideanSpace ℝ (Fin D)) :
    Tendsto (fun a => latticeDispersion a m p) (𝓝[>] 0) (𝓝 (continuumDispersion m p)) := by
  have hterm : ∀ j : Fin D,
      Tendsto (fun a => (4 / a ^ 2) * Real.sin (a * p j / 2) ^ 2) (𝓝[>] 0) (𝓝 ((p j) ^ 2)) := by
    intro j
    have hderiv : HasDerivAt (fun a : ℝ => Real.sin (a * p j / 2)) (p j / 2) 0 := by
      have hlin := (hasDerivAt_id (0 : ℝ)).mul_const (p j / 2)
      simpa [Function.comp_def, mul_div_assoc] using (Real.hasDerivAt_sin (0 * (p j / 2))).comp (0 : ℝ) hlin
    have h2 : Tendsto (fun a : ℝ => 2 * (a⁻¹ * Real.sin (a * p j / 2))) (𝓝[>] 0) (𝓝 (p j)) := by
      simpa [smul_eq_mul, Real.sin_zero, sub_zero, mul_div_cancel₀] using
        hderiv.tendsto_slope_zero_right.const_mul 2
    refine (h2.pow 2).congr' ?_
    filter_upwards [self_mem_nhdsWithin] with a (ha : 0 < a)
    field_simp [ha.ne']; ring
  have hadd := (tendsto_finsetSum Finset.univ fun j _ => hterm j).add (tendsto_const_nhds (x := m ^ 2))
  have hnorm : (∑ j : Fin D, (p j) ^ 2) + m ^ 2 = continuumDispersion m p := by
    unfold continuumDispersion
    rw [EuclideanSpace.norm_sq_eq]
    congr 1; exact Finset.sum_congr rfl fun j _ => by simp [Real.norm_eq_abs, sq_abs]
  rw [hnorm] at hadd
  exact hadd.congr fun a => by simp [latticeDispersion, Finset.mul_sum]

/-- Pointwise convergence of the Brillouin-zone truncated lattice propagator to the continuum
propagator as `a → 0+`. -/
theorem tendsto_latticeDispersion_inv {D : ℕ} {m : ℝ} (hm : 0 < m)
    (p : EuclideanSpace ℝ (Fin D)) :
    Tendsto
      (fun a => (brillouinZone D a).indicator (fun q => (latticeDispersion a m q)⁻¹) p)
      (𝓝[>] 0) (𝓝 ((continuumDispersion m p)⁻¹)) := by
  have hne : continuumDispersion m p ≠ 0 := by unfold continuumDispersion; positivity
  refine ((tendsto_latticeDispersion m p).inv₀ hne).congr' ?_
  filter_upwards [eventually_mem_brillouinZone p] with a ha
  rw [indicator_of_mem ha]

/-- Dominated convergence of the lattice covariance to the continuum covariance as `a → 0+`,
for any momentum-space pair whose pointwise product `star (fhat p) * ghat p` is integrable. -/
theorem tendsto_latticeCovariance_of_integrable {D : ℕ} (ħ : ℝ) {m : ℝ} (hm : 0 < m)
    {fhat ghat : EuclideanSpace ℝ (Fin D) → ℂ}
    (hfg : Integrable (fun p => star (fhat p) * ghat p) volume) :
    Tendsto (fun a => latticeCov ħ a m fhat ghat) (𝓝[>] 0) (𝓝 (continuumCov ħ m fhat ghat)) := by
  let F : ℝ → EuclideanSpace ℝ (Fin D) → ℂ := fun a =>
    (brillouinZone D a).indicator (fun p => star (fhat p) * ghat p * (latticeDispersion a m p)⁻¹)
  let f : EuclideanSpace ℝ (Fin D) → ℂ := fun p =>
    star (fhat p) * ghat p * (continuumDispersion m p)⁻¹
  let bound : EuclideanSpace ℝ (Fin D) → ℝ := fun p => ‖star (fhat p) * ghat p‖ * m⁻¹ ^ 2
  have hmeas : ∀ᶠ a in 𝓝[>] (0 : ℝ), AEStronglyMeasurable (F a) volume :=
    Eventually.of_forall fun a => by
      have hcont_real : Continuous (fun p : EuclideanSpace ℝ (Fin D) => latticeDispersion a m p) := by
        unfold latticeDispersion
        exact (continuous_const.mul (continuous_finsetSum _ fun j _ =>
          (Real.continuous_sin.comp
            ((continuous_const.mul (EuclideanSpace.proj j).continuous).div_const 2)).pow 2)).add
          continuous_const
      have hcont : Continuous (fun p : EuclideanSpace ℝ (Fin D) => ((latticeDispersion a m p : ℂ))⁻¹) :=
        (Complex.continuous_ofReal.comp hcont_real).inv₀
          fun p => Complex.ofReal_ne_zero.mpr (latticeDispersion_pos a hm p).ne'
      simpa [F, Pi.mul_def] using
        (hfg.aestronglyMeasurable.mul hcont.aestronglyMeasurable).indicator
          (measurableSet_brillouinZone D a)
  have hbound : ∀ᶠ a in 𝓝[>] (0 : ℝ), ∀ᵐ p ∂volume, ‖F a p‖ ≤ bound p :=
    Eventually.of_forall fun a => Eventually.of_forall fun p => by
      by_cases hp : p ∈ brillouinZone D a
      · simp only [F, bound, indicator_of_mem hp, norm_mul, norm_inv, Complex.norm_real,
          Real.norm_eq_abs, abs_of_nonneg (latticeDispersion_pos a hm p).le]
        exact mul_le_mul_of_nonneg_left (latticeDispersion_inv_le_inv_sq a hm p) (by positivity)
      · simp only [F, bound, indicator_of_notMem hp, norm_zero]; positivity
  have hlim : ∀ᵐ p ∂volume, Tendsto (fun a => F a p) (𝓝[>] 0) (𝓝 (f p)) :=
    Eventually.of_forall fun p => by
      have hEq : ∀ a, F a p = star (fhat p) * ghat p *
          (((brillouinZone D a).indicator (fun q => (latticeDispersion a m q)⁻¹) p : ℝ) : ℂ) :=
        fun a => by by_cases hp : p ∈ brillouinZone D a <;> simp [F, hp]
      simp_rw [hEq]
      have htarget : star (fhat p) * ghat p * (((continuumDispersion m p)⁻¹ : ℝ) : ℂ) = f p := by
        simp [f]
      rw [← htarget]
      exact (Complex.continuous_ofReal.continuousAt.tendsto.comp
        (tendsto_latticeDispersion_inv hm p)).const_mul _
  have hint : Tendsto (fun a => ∫ p, F a p) (𝓝[>] 0) (𝓝 (∫ p, f p)) :=
    tendsto_integral_filter_of_dominated_convergence bound hmeas hbound
      (hfg.norm.mul_const (m⁻¹ ^ 2)) hlim
  have hcov : ∀ a, latticeCov ħ a m fhat ghat = (ħ : ℂ) * ∫ p, F a p := fun a => by
    unfold latticeCov; rw [integral_indicator (measurableSet_brillouinZone D a)]
  simp_rw [hcov]
  exact hint.const_mul (ħ : ℂ)

/-- Continuum covariance limit for any `L²(ℝ^D, ℂ)` momentum-space test functions `fhat, ghat`. -/
theorem tendsto_latticeCovariance {D : ℕ} (ħ : ℝ) {m : ℝ} (hm : 0 < m)
    {fhat ghat : EuclideanSpace ℝ (Fin D) → ℂ}
    (hf : MemLp fhat 2 volume) (hg : MemLp ghat 2 volume) :
    Tendsto (fun a => latticeCov ħ a m fhat ghat) (𝓝[>] 0) (𝓝 (continuumCov ħ m fhat ghat)) :=
  tendsto_latticeCovariance_of_integrable ħ hm <|
    (hf.norm.integrable_mul hg.norm).mono'
      ((continuous_star.comp_aestronglyMeasurable hf.aestronglyMeasurable).mul
        hg.aestronglyMeasurable)
      (Eventually.of_forall fun p => by simp)

/-- Finite-dimensional joint Gaussian characteristic function convergence (§2.3): for every
finite list of `L²` test functions `fhat : Fin k → ℝ^D → ℂ` and real coefficients `ξ`, the
centred lattice Gaussian joint characteristic function converges to the continuum Gaussian joint
characteristic function as `a → 0+`. -/
theorem tendsto_finite_gaussian_charFun {D k : ℕ} (ħ : ℝ) {m : ℝ} (hm : 0 < m)
    (fhat : Fin k → EuclideanSpace ℝ (Fin D) → ℂ)
    (hf : ∀ i, MemLp (fhat i) 2 volume) (ξ : Fin k → ℝ) :
    Tendsto
      (fun a => Complex.exp
        (-(latticeCov ħ a m
            (fun p => ∑ i, (ξ i : ℂ) * fhat i p)
            (fun p => ∑ i, (ξ i : ℂ) * fhat i p)) / 2))
      (𝓝[>] 0)
      (𝓝 (Complex.exp
        (-(continuumCov ħ m
            (fun p => ∑ i, (ξ i : ℂ) * fhat i p)
            (fun p => ∑ i, (ξ i : ℂ) * fhat i p)) / 2))) := by
  have hlin : MemLp (fun p => ∑ i : Fin k, (ξ i : ℂ) * fhat i p) 2 volume := by
    simpa [Finset.sum_apply] using
      memLp_finsetSum (Finset.univ : Finset (Fin k)) fun i _ => (hf i).const_mul (ξ i : ℂ)
  exact Complex.continuous_exp.continuousAt.tendsto.comp
    (((tendsto_latticeCovariance ħ hm hlin hlin).neg).div_const 2)

end ContinuumLimit

/-!
==============================================================================
  PART 4: RADIAL POLYNOMIALS, REFLECTION POSITIVITY & TWO-PULSE NO-GO (§2.4)
==============================================================================
-/
section Kernel

open Polynomial MeasureTheory Filter Set
open scoped Topology

noncomputable def pulseDifference (K : ℝ → ℝ) (r : ℝ) : ℝ := K (2 * r) - 2 * K (3 * r) + K (4 * r)
noncomputable def sqKernel (w t : ℝ) : ℝ := (1 + w * t) * Real.exp (-w * t)
noncomputable def reflectedDet (K : ℝ → ℝ) (r s : ℝ) : ℝ := K (2 * r) * K (2 * s) - K (r + s) ^ 2
noncomputable def pulseGram (K : ℝ → ℝ) (r s u v : ℝ) : ℝ :=
  u ^ 2 * K (2 * r) + 2 * u * v * K (r + s) + v ^ 2 * K (2 * s)

theorem pulseDifference_eq_pulseGram (K : ℝ → ℝ) (r : ℝ) :
    pulseDifference K r = pulseGram K r (2 * r) 1 (-1) := by
  unfold pulseDifference pulseGram; ring_nf

theorem sqKernel_det (w r s : ℝ) :
    reflectedDet (sqKernel w) r s = -(w ^ 2 * (r - s) ^ 2 * Real.exp (-2 * w * (r + s))) := by
  unfold reflectedDet sqKernel
  rw [mul_mul_mul_comm, ← Real.exp_add, mul_pow, pow_two (Real.exp _), ← Real.exp_add,
    show -w * (2 * r) + -w * (2 * s) = -2 * w * (r + s) by ring,
    show -w * (r + s) + -w * (r + s) = -2 * w * (r + s) by ring]; ring

theorem sqKernel_det_neg {w r s : ℝ} (hw : 0 < w) (hrs : r ≠ s) :
    reflectedDet (sqKernel w) r s < 0 := by
  rw [sqKernel_det]; have := sub_ne_zero.mpr hrs; exact neg_lt_zero.mpr (by positivity)

theorem explicitGramWitness {K : ℝ → ℝ} {r s : ℝ} (hA : 0 < K (2 * r))
    (hD : reflectedDet K r s < 0) :
    pulseGram K r s (K (r + s)) (-(K (2 * r))) < 0 := by
  rw [show pulseGram K r s (K (r + s)) (-(K (2 * r))) = K (2 * r) * reflectedDet K r s by
    unfold pulseGram reflectedDet; ring]
  exact mul_neg_of_pos_of_neg hA hD

/-- Householder reflection maps any two equal-norm vectors in a real inner product space. -/
theorem exists_isometry_map_eq {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {u v : E} (huv : ‖u‖ = ‖v‖) : ∃ U : E ≃ₗᵢ[ℝ] E, U u = v := by
  by_cases h : u = v
  · exact ⟨LinearIsometryEquiv.refl ℝ E, h⟩
  let w : E := u - v
  have hw0 : ‖w‖ ≠ 0 := norm_ne_zero_iff.mpr (sub_ne_zero.mpr h)
  let T : E →ₗ[ℝ] E := LinearMap.id - ((2 / ‖w‖ ^ 2 : ℝ) • (innerSL ℝ w).toLinearMap).smulRight w
  have hT (x : E) : T x = x - (2 * inner ℝ w x / ‖w‖ ^ 2) • w := by simp [T, div_mul_eq_mul_div]
  have hnorm (x : E) : ‖T x‖ = ‖x‖ := by
    have hsq : ‖T x‖ ^ 2 = ‖x‖ ^ 2 := by
      rw [hT, norm_sub_sq_real, norm_smul, Real.norm_eq_abs, mul_pow, sq_abs,
        real_inner_smul_right, real_inner_comm x w]; field_simp [hw0]; ring
    nlinarith [norm_nonneg (T x), norm_nonneg x]
  have hinv (x : E) : T (T x) = x := by
    rw [hT, hT, inner_sub_right, inner_smul_right, real_inner_self_eq_norm_sq,
      show 2 * (inner ℝ w x - 2 * inner ℝ w x / ‖w‖ ^ 2 * ‖w‖ ^ 2) / ‖w‖ ^ 2 =
        -(2 * inner ℝ w x / ‖w‖ ^ 2) by field_simp [hw0]; ring, neg_smul, sub_neg_eq_add, sub_add_cancel]
  refine ⟨⟨LinearEquiv.ofLinearMap T T (LinearMap.ext hinv) (LinearMap.ext hinv), hnorm⟩, ?_⟩
  have hwu : 2 * inner ℝ w u = ‖w‖ ^ 2 := by
    have := norm_sub_sq_real u v; rw [← huv] at this
    simp only [w, inner_sub_left, real_inner_self_eq_norm_sq]; linarith [real_inner_comm u v]
  change T u = v; rw [hT, hwu, div_self (pow_ne_zero 2 hw0), one_smul]; simp [w]

/-- An `O(D)`-invariant polynomial on `ℝ^D` is a univariate polynomial in `‖p‖²` (§2.4). -/
theorem orthogonal_invariant_polynomial_radial {D : ℕ} (hD : 0 < D)
    (Q : MvPolynomial (Fin D) ℝ)
    (hinv : ∀ (U : EuclideanSpace ℝ (Fin D) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin D))
      (p : EuclideanSpace ℝ (Fin D)),
      MvPolynomial.eval (fun i => U p i) Q = MvPolynomial.eval (fun i => p i) Q) :
    ∃ P : Polynomial ℝ, ∀ p : EuclideanSpace ℝ (Fin D),
      MvPolynomial.eval (fun i => p i) Q = P.eval (‖p‖ ^ 2) := by
  let i0 : Fin D := ⟨0, hD⟩
  let e0 : EuclideanSpace ℝ (Fin D) := EuclideanSpace.single i0 (1 : ℝ)
  have hg_gen (R : MvPolynomial (Fin D) ℝ) (t : ℝ) :
      (MvPolynomial.aeval (fun i => if i = i0 then Polynomial.X else 0) R).eval t =
        MvPolynomial.eval (fun i => (t • e0) i) R := by
    induction R using MvPolynomial.induction_on with
    | C r => simp
    | add p q hp hq => simp [hp, hq]
    | mul_X p i hp =>
      simp only [map_mul, Polynomial.eval_mul, hp, MvPolynomial.aeval_X, MvPolynomial.eval_X]
      by_cases hi : i = i0 <;> simp [hi, e0, PiLp.single_apply]
  let g : Polynomial ℝ := MvPolynomial.aeval (fun i => if i = i0 then Polynomial.X else 0) Q
  have hg (t : ℝ) : g.eval t = MvPolynomial.eval (fun i => (t • e0) i) Q := hg_gen Q t
  have heven : g.comp (-Polynomial.X) = g := Polynomial.funext fun t => by
    obtain ⟨U, hU⟩ := exists_isometry_map_eq (u := (-t) • e0) (v := t • e0) (by simp [norm_smul])
    rw [Polynomial.eval_comp, Polynomial.eval_neg, Polynomial.eval_X, hg, hg, ← hU, hinv]
  have hodd (k : ℕ) : g.coeff (2 * k + 1) = 0 := by
    have hcoeff (p : Polynomial ℝ) (n : ℕ) : (p.comp (-Polynomial.X)).coeff n = (-1) ^ n * p.coeff n := by
      refine Polynomial.induction_on' p (fun a b ha hb => by simp [Polynomial.add_comp, ha, hb, mul_add])
        fun m a => ?_
      rw [← Polynomial.C_mul_X_pow_eq_monomial, Polynomial.mul_comp, Polynomial.C_comp,
        Polynomial.pow_comp, Polynomial.X_comp, neg_eq_neg_one_mul, mul_pow,
        show (-1 : Polynomial ℝ) ^ m = Polynomial.C ((-1 : ℝ) ^ m) by rw [map_pow, map_neg, map_one],
        ← mul_assoc, ← map_mul, Polynomial.coeff_C_mul, Polynomial.coeff_X_pow]
      by_cases hnm : n = m
      · subst hnm; simp; ring
      · simp [hnm]
    have h := congrArg (fun p : Polynomial ℝ => p.coeff (2 * k + 1)) heven
    rw [hcoeff] at h; norm_num [pow_add, pow_mul] at h; linarith
  have hsplit (a : ℕ → ℝ) (N : ℕ) :
      (∑ k ∈ Finset.range N, a (2 * k)) + (∑ k ∈ Finset.range N, a (2 * k + 1)) =
        ∑ n ∈ Finset.range (2 * N), a n := by
    induction N with
    | zero => simp
    | succ N ih =>
      rw [show 2 * (N + 1) = 2 * N + 1 + 1 by omega, Finset.sum_range_succ, Finset.sum_range_succ,
        Finset.sum_range_succ, Finset.sum_range_succ, ← ih]; ring
  refine ⟨∑ k ∈ Finset.range (g.natDegree + 1), Polynomial.C (g.coeff (2 * k)) * Polynomial.X ^ k, fun p => ?_⟩
  obtain ⟨U, hU⟩ := exists_isometry_map_eq (u := p) (v := ‖p‖ • e0) (by simp [norm_smul, e0])
  rw [← hinv U p, hU, ← hg, Polynomial.eval_eq_sum_range' (n := 2 * (g.natDegree + 1)) (by omega),
    ← hsplit, show (∑ k ∈ Finset.range (g.natDegree + 1), g.coeff (2 * k + 1) * ‖p‖ ^ (2 * k + 1)) = 0 from
      Finset.sum_eq_zero fun k _ => by rw [hodd k, zero_mul], add_zero, Polynomial.eval_finsetSum]
  exact Finset.sum_congr rfl fun k _ => by simp [pow_mul]

noncomputable def cosineKernel (f : ℝ → ℝ) (x : ℝ) : ℝ := ∫ q : ℝ, f q * Real.cos (q * x)

private noncomputable def pulseWeight (r q : ℝ) : ℝ :=
  Real.cos (q * (3 * r)) * Real.sinc (q * r / 2) ^ 2

noncomputable def normalizedPulseCoeff (f : ℝ → ℝ) (r : ℝ) : ℝ :=
  ∫ q : ℝ, -(q ^ 2 * f q) * pulseWeight r q

private theorem abs_pulseWeight_le_one (r q : ℝ) : |pulseWeight r q| ≤ 1 := by
  rw [pulseWeight, abs_mul, abs_pow]
  exact (mul_le_mul (Real.abs_cos_le_one _) (pow_le_one₀ (abs_nonneg _) (Real.abs_sinc_le_one _))
    (by positivity) zero_le_one).trans_eq (one_mul 1)

private theorem cosPulse (r q : ℝ) :
    Real.cos (q * (2 * r)) - 2 * Real.cos (q * (3 * r)) + Real.cos (q * (4 * r)) =
      -(r ^ 2 * q ^ 2) * pulseWeight r q := by
  have hs (x : ℝ) : x * Real.sinc x = Real.sin x :=
    if h : x = 0 then by simp [h] else by rw [Real.sinc_of_ne_zero h, mul_div_cancel₀ _ h]
  rw [show q * (2 * r) = q * (3 * r) - 2 * (q * r / 2) by ring,
    show q * (4 * r) = q * (3 * r) + 2 * (q * r / 2) by ring,
    Real.cos_sub, Real.cos_add, Real.cos_two_mul_eq_one_sub, ← hs (q * r / 2), pulseWeight]; ring

/-- Exact `sinc` two-pulse representation (Eq. 6 of the paper). -/
theorem pulseDifference_cosineKernel_eq {f : ℝ → ℝ} (hf : Continuous f)
    (hi : Integrable f) (r : ℝ) :
    pulseDifference (cosineKernel f) r = r ^ 2 * normalizedPulseCoeff f r := by
  have ha (u : ℝ) : Integrable (fun q : ℝ => f q * Real.cos (q * u)) :=
    hi.abs.mono' (show Continuous fun q => f q * Real.cos (q * u) by fun_prop).aestronglyMeasurable
      (ae_of_all _ fun q => by
        simpa [Real.norm_eq_abs, abs_mul] using
          mul_le_mul_of_nonneg_left (Real.abs_cos_le_one (q * u)) (abs_nonneg (f q)))
  have hab : Integrable (fun q : ℝ => f q * Real.cos (q * (2 * r)) - 2 * (f q * Real.cos (q * (3 * r)))) :=
    (ha _).sub ((ha _).const_mul 2)
  unfold pulseDifference cosineKernel normalizedPulseCoeff
  rw [← integral_const_mul, ← integral_sub (ha _) ((ha _).const_mul 2),
    ← integral_add hab (ha _), ← integral_const_mul]
  exact integral_congr_ae (ae_of_all _ fun q => by linear_combination f q * cosPulse r q)

theorem cosine_pulse_normalized_extension {f : ℝ → ℝ} (hf : Continuous f)
    (hi : Integrable f) (h2 : Integrable (fun q : ℝ => q ^ 2 * f q))
    (hp : ∀ q : ℝ, 0 < f q) :
    ∃ G : ℝ → ℝ, Continuous G ∧ G 0 = -(∫ q : ℝ, q ^ 2 * f q) ∧ G 0 < 0 ∧
      ∀ r, pulseDifference (cosineKernel f) r = r ^ 2 * G r := by
  have hc : Continuous (normalizedPulseCoeff f) := continuous_of_dominated (bound := fun q => |q ^ 2 * f q|)
    (fun r => (show Continuous fun q => -(q ^ 2 * f q) * pulseWeight r q by
      unfold pulseWeight; fun_prop).aestronglyMeasurable)
    (fun r => ae_of_all _ fun q => by
      rw [Real.norm_eq_abs, abs_mul, abs_neg]
      exact (mul_le_mul_of_nonneg_left (abs_pulseWeight_le_one r q) (abs_nonneg _)).trans_eq (mul_one _))
    h2.abs (ae_of_all _ fun q => by unfold pulseWeight; fun_prop)
  have hz : normalizedPulseCoeff f 0 = -(∫ q : ℝ, q ^ 2 * f q) := by
    simp [normalizedPulseCoeff, pulseWeight, integral_neg]
  have hpos : 0 < ∫ q : ℝ, q ^ 2 * f q :=
    integral_pos_of_integrable_nonneg_nonzero (x := (1 : ℝ)) ((continuous_id.pow 2).mul hf) h2
      (fun q => mul_nonneg (sq_nonneg q) (hp q).le) (by simpa using (hp 1).ne')
  exact ⟨normalizedPulseCoeff f, hc, hz, hz ▸ neg_lt_zero.mpr hpos, pulseDifference_cosineKernel_eq hf hi⟩

theorem cosine_two_pulse_negative {f : ℝ → ℝ} (hf : Continuous f)
    (hi : Integrable f) (h2 : Integrable (fun q : ℝ => q ^ 2 * f q))
    (hp : ∀ q : ℝ, 0 < f q) :
    ∃ R : ℝ, 0 < R ∧ ∀ r : ℝ, 0 < r → r < R → pulseDifference (cosineKernel f) r < 0 := by
  obtain ⟨G, hc, _, hn, hG⟩ := cosine_pulse_normalized_extension hf hi h2 hp
  obtain ⟨R, hR, hball⟩ := Metric.mem_nhds_iff.mp (hc.continuousAt.tendsto.eventually (Iio_mem_nhds hn))
  exact ⟨R, hR, fun r hr hrR => hG r ▸ mul_neg_of_pos_of_neg (sq_pos_of_pos hr)
    (hball (by simpa [Real.dist_eq, abs_of_pos hr] using hrR))⟩

noncomputable def polynomialSlice (P : Polynomial ℝ) (r q : ℝ) : ℝ := (P.eval (q ^ 2 + r))⁻¹

private theorem continuous_polynomialSlice (P : Polynomial ℝ) (r : ℝ) (hr : 0 ≤ r)
    (hpos : ∀ u : ℝ, 0 ≤ u → 0 < P.eval u) : Continuous (polynomialSlice P r) :=
  (P.continuous.comp ((continuous_id.pow 2).add continuous_const)).inv₀
    (fun q => (hpos _ (add_nonneg (sq_nonneg q) hr)).ne')

/-- Uniform domination bound independent of transverse squared momentum `r ≥ 0`. -/
theorem polynomial_uniform_bound (P : Polynomial ℝ)
    (hdeg : 2 ≤ P.natDegree) (hpos : ∀ u : ℝ, 0 ≤ u → 0 < P.eval u) :
    ∃ B : ℝ, ∀ r : ℝ, 0 ≤ r → ∀ q : ℝ,
      (1 + q ^ 2) * polynomialSlice P r q ≤ B * (1 + q ^ 2)⁻¹ := by
  let S : Polynomial ℝ := (X + C 1) ^ 2
  have hle : S.degree ≤ P.degree := by
    rw [degree_eq_natDegree (fun h => by have := congrArg (eval 0) h; simp [S] at this),
      degree_eq_natDegree (by rintro rfl; simp at hdeg), show S.natDegree = 2 by simp [S, natDegree_pow]]
    exact_mod_cast hdeg
  obtain ⟨C, hC⟩ := Asymptotics.isBigO_iff.mp (Polynomial.isBigO_cobounded_of_degree_le hle)
  rw [Metric.cobounded_eq_cocompact] at hC
  obtain ⟨K, hKcomp, hK⟩ := Filter.mem_cocompact.mp hC
  obtain ⟨r₀, hr₀⟩ := hKcomp.bddAbove
  let R : ℝ := max 0 r₀ + 1
  obtain ⟨umax, _, hmax⟩ := isCompact_Icc.exists_isMaxOn ⟨0, le_rfl, le_max_left 0 R⟩
    (S.continuous.continuousOn.div P.continuous.continuousOn fun u hu => (hpos u hu.1).ne')
  refine ⟨max (S.eval umax / P.eval umax) C, fun r hr q => ?_⟩
  have hu : 0 ≤ q ^ 2 + r := by positivity
  have hPu : 0 < P.eval (q ^ 2 + r) := hpos _ hu
  have h1p : (0 : ℝ) < 1 + q ^ 2 := by positivity
  have hB : S.eval (q ^ 2 + r) / P.eval (q ^ 2 + r) ≤ max (S.eval umax / P.eval umax) C := by
    by_cases h : q ^ 2 + r ≤ max 0 R
    · exact (hmax ⟨hu, h⟩).trans (le_max_left _ _)
    · have h1 : ‖S.eval (q ^ 2 + r)‖ ≤ C * ‖P.eval (q ^ 2 + r)‖ :=
        hK (a := q ^ 2 + r) fun hmem => by linarith [hr₀ hmem, le_max_right 0 r₀, le_max_right 0 R]
      rw [Real.norm_eq_abs, Real.norm_eq_abs, abs_of_nonneg (by simp [S]; positivity), abs_of_pos hPu] at h1
      exact ((div_le_iff₀ hPu).mpr h1).trans (le_max_right _ _)
  have h1 : (1 + q ^ 2) ^ 2 ≤ S.eval (q ^ 2 + r) := by
    simp only [S, eval_pow, eval_add, eval_X, eval_C]
    exact pow_le_pow_left₀ (by positivity) (by linarith) 2
  calc (1 + q ^ 2) * polynomialSlice P r q
      = (1 + q ^ 2) ^ 2 / P.eval (q ^ 2 + r) * (1 + q ^ 2)⁻¹ := by
          unfold polynomialSlice; field_simp [hPu.ne', h1p.ne']
    _ ≤ (S.eval (q ^ 2 + r) / P.eval (q ^ 2 + r)) * (1 + q ^ 2)⁻¹ := by gcongr
    _ ≤ max (S.eval umax / P.eval umax) C * (1 + q ^ 2)⁻¹ := by gcongr

theorem polynomial_moments (P : Polynomial ℝ) (r : ℝ) (hr : 0 ≤ r)
    (hdeg : 2 ≤ P.natDegree) (hpos : ∀ u : ℝ, 0 ≤ u → 0 < P.eval u) :
    ∀ j : ℕ, j ≤ 2 → Integrable (fun q : ℝ => q ^ j * polynomialSlice P r q) := by
  obtain ⟨B, hB⟩ := polynomial_uniform_bound P hdeg hpos
  intro j hj
  refine (integrable_inv_one_add_sq.const_mul B).mono'
    ((continuous_id.pow j).mul (continuous_polynomialSlice P r hr hpos)).aestronglyMeasurable
    (ae_of_all _ fun q => ?_)
  have hq : 0 ≤ polynomialSlice P r q := inv_nonneg.mpr (hpos _ (by positivity)).le
  have hjq : |q| ^ j ≤ 1 + q ^ 2 := by
    interval_cases j <;> [simp; simp only [pow_one]; rw [sq_abs]] <;> nlinarith [sq_nonneg (|q| - 1), sq_abs q]
  rw [Real.norm_eq_abs, abs_mul, abs_pow, abs_of_nonneg hq]
  exact (mul_le_mul_of_nonneg_right hjq hq).trans (hB r hr q)

theorem polynomial_slice_opposite_pulses (P : Polynomial ℝ) (r : ℝ) (hr : 0 ≤ r)
    (hdeg : 2 ≤ P.natDegree) (hpos : ∀ u : ℝ, 0 ≤ u → 0 < P.eval u) :
    ∃ R : ℝ, 0 < R ∧ ∀ t : ℝ, 0 < t → t < R →
      pulseDifference (cosineKernel (polynomialSlice P r)) t < 0 := by
  have hm := polynomial_moments P r hr hdeg hpos
  exact cosine_two_pulse_negative (continuous_polynomialSlice P r hr hpos)
    (by simpa using hm 0 (by norm_num)) (hm 2 le_rfl)
    (fun q => inv_pos.mpr (hpos _ (add_nonneg (sq_nonneg q) hr)))

theorem positive_polynomial_two_pulses_force_affine
    (P : Polynomial ℝ) (r : ℝ) (hr : 0 ≤ r)
    (hpos : ∀ u : ℝ, 0 ≤ u → 0 < P.eval u)
    (hnonconstant : 0 < P.natDegree)
    (hpulse : ∀ t : ℝ, 0 < t →
      0 ≤ pulseDifference (cosineKernel (polynomialSlice P r)) t) :
    ∃ a m2 : ℝ, 0 < a ∧ 0 < m2 ∧ ∀ u : ℝ, P.eval u = a * (u + m2) := by
  have hd : P.natDegree ≤ 1 := by
    by_contra! hn
    obtain ⟨R, hR, hneg⟩ := polynomial_slice_opposite_pulses P r hr (by omega) hpos
    exact (not_lt_of_ge (hpulse (R / 2) (by linarith))) (hneg (R / 2) (by linarith) (by linarith))
  obtain ⟨a, b, heq⟩ := exists_eq_X_add_C_of_natDegree_le_one hd
  have ev (t : ℝ) : P.eval t = a * t + b := by rw [heq]; simp
  have hb : 0 < b := by simpa [ev] using hpos 0 le_rfl
  have ha0 : a ≠ 0 := by rintro rfl; simp [heq] at hnonconstant
  have ha : 0 < a := by
    by_contra! hn
    have h := hpos (b / (-a)) (div_nonneg hb.le (by linarith))
    rw [ev, show a * (b / (-a)) + b = 0 by field_simp [neg_ne_zero.mpr ha0]; ring] at h
    exact lt_irrefl 0 h
  exact ⟨a, b / a, ha, div_pos hb ha, fun u => by rw [ev]; field_simp⟩

theorem negative_local_average {X : Type*} [TopologicalSpace X] [MeasurableSpace X]
    {F : X → ℝ} {x : X} (hF : ContinuousAt F x) (hx : F x < 0) :
    ∃ U : Set X, IsOpen U ∧ x ∈ U ∧
      ∀ μ : Measure X, IsProbabilityMeasure μ → (∀ᵐ z ∂μ, z ∈ U) →
        Integrable F μ → (∫ z, F z ∂μ) < 0 := by
  obtain ⟨U, hsub, hopen, hxU⟩ := mem_nhds_iff.mp
    (hF.tendsto.eventually (Iio_mem_nhds (show F x < F x / 2 by linarith)))
  refine ⟨U, hopen, hxU, fun μ hprob hμ hi => ?_⟩
  have := hprob
  calc ∫ z, F z ∂μ ≤ ∫ _ : X, F x / 2 ∂μ :=
          integral_mono_ae hi (integrable_const _) (hμ.mono fun _ hz => (hsub hz).le)
    _ < 0 := by simpa using (show F x / 2 < 0 by linarith)

/-- Two-pulse no-go under every probability average over a neighbourhood in transverse
momentum × pulse spacing (§2.4). -/
theorem polynomial_smeared_two_pulse_negative {d : ℕ} (P : Polynomial ℝ)
    (hdeg : 2 ≤ P.natDegree) (hpos : ∀ u : ℝ, 0 ≤ u → 0 < P.eval u)
    (k₀ : EuclideanSpace ℝ (Fin d)) :
    ∃ t₀ : ℝ, 0 < t₀ ∧
      ∃ V : Set (EuclideanSpace ℝ (Fin d) × ℝ), IsOpen V ∧ (k₀, t₀) ∈ V ∧
        ∀ μ : Measure (EuclideanSpace ℝ (Fin d) × ℝ), IsProbabilityMeasure μ →
          (∀ᵐ z ∂μ, z ∈ V) →
          (∫ z, pulseDifference
            (cosineKernel (polynomialSlice P (‖z.1‖ ^ 2))) z.2 ∂μ) < 0 := by
  obtain ⟨B, hB⟩ := polynomial_uniform_bound P hdeg hpos
  let F : EuclideanSpace ℝ (Fin d) × ℝ → ℝ := fun z =>
    pulseDifference (cosineKernel (polynomialSlice P (‖z.1‖ ^ 2))) z.2
  have hGcont : Continuous (fun z : EuclideanSpace ℝ (Fin d) × ℝ =>
      normalizedPulseCoeff (polynomialSlice P (‖z.1‖ ^ 2)) z.2) :=
    continuous_of_dominated (bound := fun q => B * (1 + q ^ 2)⁻¹)
      (fun z => (show Continuous fun q => -(q ^ 2 * polynomialSlice P (‖z.1‖ ^ 2) q) * pulseWeight z.2 q by
        have := continuous_polynomialSlice P (‖z.1‖ ^ 2) (sq_nonneg _) hpos
        unfold pulseWeight; fun_prop).aestronglyMeasurable)
      (fun z => ae_of_all _ fun q => by
        have hq : 0 ≤ polynomialSlice P (‖z.1‖ ^ 2) q := inv_nonneg.mpr (hpos _ (by positivity)).le
        rw [Real.norm_eq_abs, abs_mul, abs_neg, abs_of_nonneg (mul_nonneg (sq_nonneg q) hq)]
        exact (mul_le_mul (mul_le_mul_of_nonneg_right (by linarith : q ^ 2 ≤ 1 + q ^ 2) hq)
          (abs_pulseWeight_le_one z.2 q) (abs_nonneg _) (by positivity)).trans (by simpa using hB (‖z.1‖ ^ 2) (sq_nonneg _) q))
      (integrable_inv_one_add_sq.const_mul B) (ae_of_all _ fun q => by
        have : Continuous (fun z : EuclideanSpace ℝ (Fin d) × ℝ => polynomialSlice P (‖z.1‖ ^ 2) q) :=
          (P.continuous.comp (continuous_const.add ((continuous_norm.comp continuous_fst).pow 2))).inv₀
            fun z => (hpos _ (add_nonneg (sq_nonneg q) (sq_nonneg ‖z.1‖))).ne'
        unfold pulseWeight; fun_prop)
  have hF_eq (z : EuclideanSpace ℝ (Fin d) × ℝ) :
      F z = z.2 ^ 2 * normalizedPulseCoeff (polynomialSlice P (‖z.1‖ ^ 2)) z.2 :=
    pulseDifference_cosineKernel_eq (continuous_polynomialSlice P _ (sq_nonneg _) hpos)
      (by simpa using polynomial_moments P _ (sq_nonneg _) hdeg hpos 0 (by norm_num)) z.2
  have hFcont : Continuous F := by
    rw [show F = fun z => z.2 ^ 2 * normalizedPulseCoeff (polynomialSlice P (‖z.1‖ ^ 2)) z.2 from funext hF_eq]
    exact (continuous_snd.pow 2).mul hGcont
  obtain ⟨R, hR, hneg⟩ := polynomial_slice_opposite_pulses P (‖k₀‖ ^ 2) (sq_nonneg _) hdeg hpos
  set t₀ := R / 2
  have ht₀ : F (k₀, t₀) < 0 := hneg t₀ (half_pos hR) (half_lt_self hR)
  obtain ⟨U, hUopen, hxU, havg⟩ := negative_local_average hFcont.continuousAt ht₀
  obtain ⟨M, hM⟩ := (isCompact_closedBall (k₀, t₀) 1).exists_bound_of_continuousOn hFcont.continuousOn
  refine ⟨t₀, half_pos hR, U ∩ Metric.ball (k₀, t₀) 1, hUopen.inter Metric.isOpen_ball,
    ⟨hxU, Metric.mem_ball_self zero_lt_one⟩, fun μ hprob hμ => ?_⟩
  have := hprob
  exact havg μ hprob (hμ.mono fun _ hz => hz.1)
    ((integrable_const M).mono' hFcont.aestronglyMeasurable
      (hμ.mono fun z hz => hM z (Metric.ball_subset_closedBall hz.2)))

noncomputable def normalIntegrand (ω q t : ℝ) : ℂ :=
  Complex.exp ((-(ω * |t|) : ℝ) + (q : ℂ) * Complex.I * t)

theorem normal_exponential_fourier (ω q : ℝ) (hω : 0 < ω) :
    (∫ t : ℝ, normalIntegrand ω q t) = (2 * (ω : ℂ)) / ((ω : ℂ) ^ 2 + (q : ℂ) ^ 2) := by
  let A : ℂ := -(ω : ℂ) + (q : ℂ) * Complex.I; let B : ℂ := (ω : ℂ) + (q : ℂ) * Complex.I
  have hAr : A.re < 0 := by simpa [A, Complex.mul_re] using neg_neg_of_pos hω
  have hBr : 0 < B.re := by simpa [B, Complex.mul_re] using hω
  have aeq : EqOn (normalIntegrand ω q) (fun t : ℝ => Complex.exp (A * t)) (Ioi 0) := fun t ht => by
    unfold normalIntegrand A; rw [abs_of_pos ht]; congr 1; push_cast; ring
  have beq : EqOn (normalIntegrand ω q) (fun t : ℝ => Complex.exp (B * t)) (Iic 0) := fun t ht => by
    unfold normalIntegrand B; rw [abs_of_nonpos ht]; congr 1; push_cast; ring
  have ig : Integrable (normalIntegrand ω q) := by
    rw [← integrableOn_univ, ← Set.union_compl_self (Ioi (0 : ℝ)), Set.compl_Ioi]
    exact ((integrableOn_exp_mul_complex_Ioi hAr 0).congr_fun aeq.symm measurableSet_Ioi).union
      ((integrableOn_exp_mul_complex_Iic hBr 0).congr_fun beq.symm measurableSet_Iic)
  rw [← integral_add_compl measurableSet_Ioi ig, Set.compl_Ioi,
    setIntegral_congr_fun measurableSet_Ioi aeq, setIntegral_congr_fun measurableSet_Iic beq,
    integral_exp_mul_complex_Ioi hAr 0, integral_exp_mul_complex_Iic hBr 0]
  have hA : A ≠ 0 := fun h => by simp [h] at hAr
  have hB : B ≠ 0 := fun h => by simp [h] at hBr
  have hAB : A * B = -((ω : ℂ) ^ 2 + (q : ℂ) ^ 2) := by
    dsimp [A, B]; linear_combination (q : ℂ) ^ 2 * Complex.I_sq
  have hden : (ω : ℂ) ^ 2 + (q : ℂ) ^ 2 ≠ 0 := by rw [← neg_ne_zero, ← hAB]; exact mul_ne_zero hA hB
  simp only [Complex.ofReal_zero, mul_zero, Complex.exp_zero]
  field_simp [hA, hB, hden]; rw [hAB]; dsimp [A, B]; ring

noncomputable def expKernel (ω t : ℝ) : ℝ := Real.exp (-ω * |t|) / (2 * ω)

theorem expKernel_fourier (ω q : ℝ) (hω : 0 < ω) :
    (∫ t : ℝ, (expKernel ω t : ℂ) * Complex.exp ((q : ℂ) * Complex.I * t)) =
      1 / ((ω : ℂ) ^ 2 + (q : ℂ) ^ 2) := by
  have hpt (t : ℝ) : (expKernel ω t : ℂ) * Complex.exp ((q : ℂ) * Complex.I * t) =
      (2 * (ω : ℂ))⁻¹ * normalIntegrand ω q t := by
    unfold expKernel normalIntegrand
    rw [Complex.ofReal_div, Complex.ofReal_exp, div_eq_inv_mul, mul_assoc, ← Complex.exp_add]
    congr 1 <;> [push_cast; (congr 1; push_cast)] <;> ring
  simp_rw [hpt]
  rw [integral_const_mul, normal_exponential_fourier ω q hω]
  field_simp [Complex.ofReal_ne_zero.mpr hω.ne']

theorem expKernel_factor (ω r s : ℝ) (hω : 0 < ω) (hr : 0 ≤ r) (hs : 0 ≤ s) :
    expKernel ω (r + s) = expKernel ω r * expKernel ω s / expKernel ω 0 := by
  unfold expKernel
  rw [abs_of_nonneg (add_nonneg hr hs), abs_of_nonneg hr, abs_of_nonneg hs, abs_zero]
  simp only [mul_zero, Real.exp_zero]; field_simp [hω.ne']; rw [← Real.exp_add]; congr 1; ring

theorem expKernel_reflectedDet_zero (ω r s : ℝ) (hω : 0 < ω) (hr : 0 ≤ r) (hs : 0 ≤ s) :
    reflectedDet (expKernel ω) r s = 0 := by
  unfold reflectedDet
  rw [show 2 * r = r + r by ring, show 2 * s = s + s by ring,
    expKernel_factor ω r r hω hr hr, expKernel_factor ω s s hω hs hs,
    expKernel_factor ω r s hω hr hs]; ring

theorem expKernel_reflection_pos {ι : Type*} (S : Finset ι) (ω : ℝ) (hω : 0 < ω)
    (c s : ι → ℝ) (hs : ∀ i ∈ S, 0 ≤ s i) :
    0 ≤ ∑ i ∈ S, ∑ j ∈ S, c i * c j * expKernel ω (s i + s j) := by
  have hsum : (∑ i ∈ S, ∑ j ∈ S, c i * c j * expKernel ω (s i + s j)) =
      (∑ i ∈ S, c i * Real.exp (-ω * s i)) ^ 2 / (2 * ω) := by
    rw [sq, Finset.sum_mul_sum, Finset.sum_div]
    refine Finset.sum_congr rfl fun i hi => by
      rw [Finset.sum_div]
      refine Finset.sum_congr rfl fun j hj => ?_
      unfold expKernel
      rw [abs_of_nonneg (add_nonneg (hs i hi) (hs j hj)),
        show -ω * (s i + s j) = -ω * s i + -ω * s j by ring, Real.exp_add]; ring
  rw [hsum]; positivity

end Kernel

/-! ### §2.4 Actual Smooth Normal-Smeared Derivative-Bump Negative Reflected Test -/
section SmoothNormalNoGo

open MeasureTheory Filter Set Polynomial
open scoped Topology

/-- Normal-direction Fourier transform `h̃(q) = ∫ h(s) e^{-i q s} ds`. -/
noncomputable def normalTransform (h : ℝ → ℝ) (q : ℝ) : ℂ :=
  ∫ s : ℝ, (h s : ℂ) * Complex.exp (-Complex.I * (q : ℂ) * (s : ℂ))

/-- Rescaled derivative bump `h_r(s) = r⁻² ρ'(s / r)` supported in `(r, 2r) ⊂ (0, ∞)`. -/
noncomputable def derivBump (ρ : ℝ → ℝ) (r s : ℝ) : ℝ :=
  r⁻¹ ^ 2 * deriv ρ (s / r)

/-- Unconditional existence of a smooth (`C^∞`) nonnegative probability bump supported in `(1, 2)`. -/
theorem exists_smooth_unit_bump_Ioo_one_two :
    ∃ ρ : ℝ → ℝ, ContDiff ℝ (⊤ : ℕ∞) ρ ∧ (∀ t, 0 ≤ ρ t) ∧
      tsupport ρ ⊆ Set.Ioo 1 2 ∧ ∫ t : ℝ, ρ t = 1 := by
  let b : ContDiffBump (3 / 2 : ℝ) := ⟨1 / 8, 1 / 4, by norm_num, by norm_num⟩
  have hsub : tsupport (b : ℝ → ℝ) ⊆ Set.Ioo 1 2 := by
    rw [b.tsupport_eq]
    intro t ht
    rw [Metric.mem_closedBall, Real.dist_eq, abs_le] at ht
    constructor <;> linarith
  have hint : Integrable (b : ℝ → ℝ) :=
    b.continuous.integrable_of_hasCompactSupport b.hasCompactSupport
  have hpos : 0 < ∫ t : ℝ, (b : ℝ → ℝ) t := by
    refine integral_pos_of_integrable_nonneg_nonzero (x := (3 / 2 : ℝ))
      b.continuous hint (fun t => b.nonneg) ?_
    have h1 : b (3 / 2 : ℝ) = 1 := b.one_of_mem_closedBall (Metric.mem_closedBall_self (by norm_num))
    linarith
  let c : ℝ := (∫ t : ℝ, (b : ℝ → ℝ) t)⁻¹
  have hc : 0 < c := inv_pos.mpr hpos
  refine ⟨fun t => c * b t, (b.contDiff (n := (⊤ : ℕ∞))).const_smul c,
    fun t => mul_nonneg hc.le b.nonneg, ?_, ?_⟩
  · refine (tsupport_mul_subset_right (f := fun _ => c) (g := (b : ℝ → ℝ))).trans hsub
  · rw [integral_const_mul, inv_mul_cancel₀ hpos.ne']

/-- Support containment of `derivBump ρ r` inside `(r, 2r) ⊂ (0, ∞)`. -/
lemma derivBump_tsupport_subset {ρ : ℝ → ℝ} (hsupp : tsupport ρ ⊆ Set.Ioo 1 2)
    {r : ℝ} (hr : 0 < r) :
    tsupport (derivBump ρ r) ⊆ Set.Ioo r (2 * r) := by
  have hcomp : tsupport (fun s : ℝ => ρ (s / r)) ⊆ Set.Ioo r (2 * r) := by
    have hsub_supp : Function.support (fun s : ℝ => ρ (s / r)) ⊆ (fun s => s / r) ⁻¹' tsupport ρ := by
      intro s hs
      exact subset_tsupport ρ (by simpa [Function.mem_support] using hs)
    have hcl : tsupport (fun s : ℝ => ρ (s / r)) ⊆ (fun s => s / r) ⁻¹' tsupport ρ :=
      closure_minimal hsub_supp ((isClosed_tsupport ρ).preimage (continuous_id.div_const r))
    intro s hs
    have hmem := hsupp (hcl hs)
    rw [Set.mem_Ioo] at hmem ⊢
    constructor
    · have h1 := (lt_div_iff₀ hr).mp hmem.1; linarith
    · have h2 := (div_lt_iff₀ hr).mp hmem.2; linarith
  have hderiv_sub : Function.support (derivBump ρ r) ⊆ tsupport (fun s : ℝ => ρ (s / r)) := by
    intro s hs
    by_contra hnot
    have hzero_nhds : (fun u : ℝ => ρ (u / r)) =ᶠ[𝓝 s] fun _ => (0 : ℝ) := by
      have hopen : IsOpen (tsupport (fun u : ℝ => ρ (u / r)))ᶜ := (isClosed_tsupport _).isOpen_compl
      filter_upwards [hopen.mem_nhds hnot] with u hu
      by_contra hne
      exact hu (subset_tsupport _ hne)
    have hd0 : deriv (fun u : ℝ => ρ (u / r)) s = 0 := by
      rw [hzero_nhds.deriv_eq, deriv_const]
    have hchain : deriv (fun u : ℝ => ρ (u / r)) s = deriv ρ (s / r) * r⁻¹ := by
      have hdiv : HasDerivAt (fun u : ℝ => u / r) r⁻¹ s := by
        simpa [div_eq_mul_inv] using (hasDerivAt_id s).mul_const r⁻¹
      by_cases hdiff : DifferentiableAt ℝ ρ (s / r)
      · exact (hdiff.hasDerivAt.comp s hdiv).deriv
      · have hnot' : ¬ DifferentiableAt ℝ (fun u : ℝ => ρ (u / r)) s := by
          intro h1
          have hmul : HasDerivAt (fun u : ℝ => u * r) r (s / r) := by
            simpa using (hasDerivAt_id (s / r)).mul_const r
          have h1' : DifferentiableAt ℝ (fun u : ℝ => ρ (u / r)) ((s / r) * r) := by
            rwa [div_mul_cancel₀ _ hr.ne']
          have h2 : DifferentiableAt ℝ ((fun u : ℝ => ρ (u / r)) ∘ fun u : ℝ => u * r) (s / r) :=
            h1'.comp (s / r) hmul.differentiableAt
          have h3 : ((fun u : ℝ => ρ (u / r)) ∘ fun u : ℝ => u * r) = ρ := funext fun u => by
            simp [mul_div_cancel_right₀ _ hr.ne']
          rw [h3] at h2
          exact hdiff h2
        rw [deriv_zero_of_not_differentiableAt hdiff, zero_mul,
          deriv_zero_of_not_differentiableAt hnot']
    have hdr0 : deriv ρ (s / r) = 0 := by
      rw [hchain] at hd0
      exact (mul_eq_zero.mp hd0).resolve_right (inv_ne_zero hr.ne')
    exact hs (by simp [derivBump, hdr0])
  exact (closure_minimal hderiv_sub (isClosed_tsupport _)).trans hcomp

private lemma seam_hasCompactSupport_of_tsupport_Ioo {f : ℝ → ℝ} {a b : ℝ}
    (h : tsupport f ⊆ Set.Ioo a b) : HasCompactSupport f :=
  HasCompactSupport.of_support_subset_isCompact isCompact_Icc
    ((subset_tsupport f).trans (h.trans Set.Ioo_subset_Icc_self))

/-- Exact normal Fourier transform of the rescaled derivative bump `h_r(s) = r⁻² ρ'(s/r)`:
`h̃_r(q) = i q ρ̃(r q)` by integration by parts and change of variables (§2.4). -/
theorem normalTransform_derivBump {ρ : ℝ → ℝ} (hρ : ContDiff ℝ 1 ρ)
    (hsupp : tsupport ρ ⊆ Set.Ioo 1 2) {r : ℝ} (hr : 0 < r) (q : ℝ) :
    normalTransform (derivBump ρ r) q =
      Complex.I * (q : ℂ) * normalTransform ρ (r * q) := by
  let u : ℝ → ℂ := fun s => ((r⁻¹ * ρ (s / r) : ℝ) : ℂ)
  let u' : ℝ → ℂ := fun s => (derivBump ρ r s : ℂ)
  let v : ℝ → ℂ := fun s => Complex.exp (-Complex.I * (q : ℂ) * (s : ℂ))
  let v' : ℝ → ℂ := fun s => (-Complex.I * (q : ℂ)) * v s
  have hu_deriv (s : ℝ) : HasDerivAt u (u' s) s := by
    have hdiv : HasDerivAt (fun x : ℝ => x / r) r⁻¹ s := by
      simpa [div_eq_mul_inv] using (hasDerivAt_id s).mul_const r⁻¹
    have hρd : HasDerivAt ρ (deriv ρ (s / r)) (s / r) :=
      (hρ.differentiable (by norm_num) (s / r)).hasDerivAt
    have hreal : HasDerivAt (fun x : ℝ => r⁻¹ * ρ (x / r)) (derivBump ρ r s) s := by
      have hc := (hρd.comp s hdiv).const_mul r⁻¹
      refine hc.congr_deriv ?_
      unfold derivBump; ring
    exact hreal.ofReal_comp
  have hv_deriv (s : ℝ) : HasDerivAt v (v' s) s := by
    have hlin : HasDerivAt (fun x : ℝ => (-Complex.I * (q : ℂ)) * (x : ℂ))
        (-Complex.I * (q : ℂ)) s := by
      simpa using (Complex.ofRealCLM.hasDerivAt (x := s)).const_mul (-Complex.I * (q : ℂ))
    simpa [v, v', mul_comm] using hlin.cexp
  have hcomp_u : HasCompactSupport (fun s : ℝ => r⁻¹ * ρ (s / r)) := by
    refine HasCompactSupport.of_support_subset_isCompact (isCompact_Icc (a := r) (b := 2 * r)) ?_
    intro s hs
    have hne : ρ (s / r) ≠ 0 := by
      intro h0; exact hs (by simp [h0])
    have hmem := hsupp (subset_tsupport ρ hne)
    rw [Set.mem_Ioo] at hmem
    rw [Set.mem_Icc]
    constructor
    · have := (lt_div_iff₀ hr).mp hmem.1; linarith
    · have := (div_lt_iff₀ hr).mp hmem.2; linarith
  have hcomp_u' : HasCompactSupport (derivBump ρ r) :=
    seam_hasCompactSupport_of_tsupport_Ioo (derivBump_tsupport_subset hsupp hr)
  have hu_cont : Continuous u :=
    Complex.continuous_ofReal.comp (continuous_const.mul (hρ.continuous.comp (continuous_id.div_const r)))
  have hu'_cont : Continuous u' :=
    Complex.continuous_ofReal.comp
      (continuous_const.mul ((hρ.continuous_deriv le_rfl).comp (continuous_id.div_const r)))
  have hv_cont : Continuous v := by unfold v; fun_prop
  have hv'_cont : Continuous v' := continuous_const.mul hv_cont
  have hcs_u : HasCompactSupport u := hcomp_u.comp_left Complex.ofReal_zero
  have hcs_u' : HasCompactSupport u' := hcomp_u'.comp_left Complex.ofReal_zero
  have hint_uv' : Integrable (u * v') :=
    (hu_cont.mul hv'_cont).integrable_of_hasCompactSupport (hcs_u.mul_right)
  have hint_u'v : Integrable (u' * v) :=
    (hu'_cont.mul hv_cont).integrable_of_hasCompactSupport (hcs_u'.mul_right)
  have hint_uv : Integrable (u * v) :=
    (hu_cont.mul hv_cont).integrable_of_hasCompactSupport (hcs_u.mul_right)
  have hibp := MeasureTheory.integral_mul_deriv_eq_deriv_mul_of_integrable
    (fun s _ => hu_deriv s) (fun s _ => hv_deriv s) hint_uv' hint_u'v hint_uv
  have hstep1 : normalTransform (derivBump ρ r) q =
      Complex.I * (q : ℂ) * ∫ s : ℝ, u s * v s := by
    have h1 : ∫ s : ℝ, u' s * v s = -∫ s : ℝ, u s * v' s := by
      have := congrArg Neg.neg hibp
      simpa using this.symm
    change ∫ s : ℝ, u' s * v s = _
    rw [h1]
    have h2 : (fun s : ℝ => u s * v' s) = fun s => (-Complex.I * (q : ℂ)) * (u s * v s) := by
      funext s; simp only [v']; ring
    rw [h2, integral_const_mul]
    ring
  rw [hstep1]
  congr 1
  have hsub := MeasureTheory.Measure.integral_comp_mul_left (fun s : ℝ => u s * v s) r
  have hval : (∫ t : ℝ, (r : ℂ) * (u (r * t) * v (r * t))) = normalTransform ρ (r * q) := by
    unfold normalTransform
    refine integral_congr_ae (ae_of_all _ fun t => ?_)
    dsimp only [u, v]
    rw [mul_div_cancel_left₀ t hr.ne', Complex.ofReal_mul]
    have hr' : (r : ℂ) ≠ 0 := Complex.ofReal_ne_zero.mpr hr.ne'
    push_cast
    rw [show -Complex.I * (q : ℂ) * ((r : ℂ) * (t : ℂ)) = -Complex.I * ((r : ℂ) * (q : ℂ)) * (t : ℂ) by ring]
    field_simp [hr']
  rw [← hval, integral_const_mul, hsub, abs_of_pos (inv_pos.mpr hr), Complex.real_smul,
    Complex.ofReal_inv, ← mul_assoc, mul_inv_cancel₀ (Complex.ofReal_ne_zero.mpr hr.ne'), one_mul]

/-- Exact position-space ↔ momentum-space identity for the reflected pairing at transverse
momentum `k`: `∬ h(s) h(t) K_k(s+t) ds dt = (2π)⁻¹ ∫ Re(h̃(q)²) / P(q² + |k|²) dq` (§2.4). -/
theorem position_reflected_eq_momentum_reflected {d : ℕ} (P : Polynomial ℝ)
    (hdeg : 2 ≤ P.natDegree) (hpos : ∀ u : ℝ, 0 ≤ u → 0 < P.eval u)
    (k : EuclideanSpace ℝ (Fin d)) {h : ℝ → ℝ} (hcont : Continuous h)
    (hsupp : HasCompactSupport h) :
    (∫ s : ℝ, ∫ t : ℝ, h s * h t *
      ((2 * Real.pi)⁻¹ * ∫ q : ℝ, Real.cos (q * (s + t)) / P.eval (q ^ 2 + ‖k‖ ^ 2))) =
    (2 * Real.pi)⁻¹ * ∫ q : ℝ, (normalTransform h q ^ 2).re / P.eval (q ^ 2 + ‖k‖ ^ 2) := by
  obtain ⟨B, hB⟩ := polynomial_uniform_bound P hdeg hpos
  have hh_int : Integrable h := hcont.integrable_of_hasCompactSupport hsupp
  have hPcont : Continuous (fun q : ℝ => (P.eval (q ^ 2 + ‖k‖ ^ 2))⁻¹) :=
    (P.continuous.comp ((continuous_id.pow 2).add continuous_const)).inv₀
      (fun q => (hpos _ (add_nonneg (sq_nonneg _) (sq_nonneg _))).ne')
  have hPint : Integrable (fun q : ℝ => (P.eval (q ^ 2 + ‖k‖ ^ 2))⁻¹) := by
    refine (integrable_inv_one_add_sq.const_mul B).mono' hPcont.aestronglyMeasurable
      (ae_of_all _ fun q => ?_)
    have hp : 0 ≤ (P.eval (q ^ 2 + ‖k‖ ^ 2))⁻¹ :=
      inv_nonneg.mpr (hpos _ (add_nonneg (sq_nonneg _) (sq_nonneg _))).le
    rw [Real.norm_of_nonneg hp]
    have h1 := hB (‖k‖ ^ 2) (sq_nonneg _) q
    unfold polynomialSlice at h1
    nlinarith [sq_nonneg q, hp]
  have hjoint : Integrable (fun z : (ℝ × ℝ) × ℝ =>
      (h z.1.1 * h z.1.2) * (Real.cos (z.2 * (z.1.1 + z.1.2)) / P.eval (z.2 ^ 2 + ‖k‖ ^ 2)))
      ((volume.prod volume).prod volume) := by
    have hdom : Integrable (fun z : (ℝ × ℝ) × ℝ =>
        (|h z.1.1| * |h z.1.2|) * (P.eval (z.2 ^ 2 + ‖k‖ ^ 2))⁻¹)
        ((volume.prod volume).prod volume) :=
      (hh_int.abs.mul_prod hh_int.abs).mul_prod hPint
    have hmeas : Continuous (fun z : (ℝ × ℝ) × ℝ =>
        (h z.1.1 * h z.1.2) * (Real.cos (z.2 * (z.1.1 + z.1.2)) / P.eval (z.2 ^ 2 + ‖k‖ ^ 2))) := by
      have hP1 : Continuous (fun z : (ℝ × ℝ) × ℝ => (P.eval (z.2 ^ 2 + ‖k‖ ^ 2))⁻¹) :=
        hPcont.comp continuous_snd
      simp_rw [div_eq_mul_inv]
      fun_prop
    refine hdom.mono' hmeas.aestronglyMeasurable (ae_of_all _ fun z => ?_)
    have hp : 0 ≤ (P.eval (z.2 ^ 2 + ‖k‖ ^ 2))⁻¹ :=
      inv_nonneg.mpr (hpos _ (add_nonneg (sq_nonneg _) (sq_nonneg _))).le
    rw [Real.norm_eq_abs, abs_mul, abs_mul, div_eq_mul_inv, abs_mul, abs_of_nonneg hp]
    calc |h z.1.1| * |h z.1.2| * (|Real.cos (z.2 * (z.1.1 + z.1.2))| * (P.eval (z.2 ^ 2 + ‖k‖ ^ 2))⁻¹)
        ≤ |h z.1.1| * |h z.1.2| * (1 * (P.eval (z.2 ^ 2 + ‖k‖ ^ 2))⁻¹) := by
          gcongr; exact Real.abs_cos_le_one _
      _ = |h z.1.1| * |h z.1.2| * (P.eval (z.2 ^ 2 + ‖k‖ ^ 2))⁻¹ := by ring
  have hcos_eq (q : ℝ) :
      (∫ p : ℝ × ℝ, h p.1 * h p.2 * Real.cos (q * (p.1 + p.2)) ∂(volume.prod volume)) =
      (normalTransform h q ^ 2).re := by
    have hsq : normalTransform h q ^ 2 =
        ∫ p : ℝ × ℝ, ((h p.1 * h p.2 : ℝ) : ℂ) * Complex.exp (-Complex.I * (q : ℂ) * ((p.1 + p.2 : ℝ) : ℂ))
          ∂(volume.prod volume) := by
      rw [sq, normalTransform, ← MeasureTheory.integral_prod_mul]
      refine integral_congr_ae (ae_of_all _ fun p => ?_)
      dsimp only
      rw [Complex.ofReal_mul, Complex.ofReal_add]
      calc (h p.1 : ℂ) * Complex.exp (-Complex.I * (q : ℂ) * (p.1 : ℂ)) *
            ((h p.2 : ℂ) * Complex.exp (-Complex.I * (q : ℂ) * (p.2 : ℂ)))
          = (h p.1 : ℂ) * (h p.2 : ℂ) *
              (Complex.exp (-Complex.I * (q : ℂ) * (p.1 : ℂ)) *
                Complex.exp (-Complex.I * (q : ℂ) * (p.2 : ℂ))) := by ring
        _ = (h p.1 : ℂ) * (h p.2 : ℂ) * Complex.exp (-Complex.I * (q : ℂ) * ((p.1 : ℂ) + (p.2 : ℂ))) := by
              rw [← Complex.exp_add]; congr 2; ring
    have hint_c : Integrable (fun p : ℝ × ℝ =>
        ((h p.1 * h p.2 : ℝ) : ℂ) * Complex.exp (-Complex.I * (q : ℂ) * ((p.1 + p.2 : ℝ) : ℂ)))
        (volume.prod volume) := by
      refine (hh_int.abs.mul_prod hh_int.abs).mono' (by fun_prop) (ae_of_all _ fun p => ?_)
      rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_mul]
      have hunit : ‖Complex.exp (-Complex.I * (q : ℂ) * ((p.1 + p.2 : ℝ) : ℂ))‖ = 1 := by
        rw [show -Complex.I * (q : ℂ) * ((p.1 + p.2 : ℝ) : ℂ) =
          ((-(q * (p.1 + p.2)) : ℝ) : ℂ) * Complex.I by push_cast; ring,
          Complex.norm_exp_ofReal_mul_I]
      rw [hunit, mul_one]
    rw [hsq, ← Complex.reCLM_apply, ← ContinuousLinearMap.integral_comp_comm Complex.reCLM hint_c]
    refine integral_congr_ae (ae_of_all _ fun p => ?_)
    dsimp only
    simp only [Complex.reCLM_apply,
      show -Complex.I * (q : ℂ) * ((p.1 + p.2 : ℝ) : ℂ) =
        ((-(q * (p.1 + p.2)) : ℝ) : ℂ) * Complex.I by push_cast; ring,
      Complex.exp_ofReal_mul_I_re, Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im,
      zero_mul, sub_zero, Real.cos_neg]
  have h1 : (∫ s : ℝ, ∫ t : ℝ, h s * h t *
        ((2 * Real.pi)⁻¹ * ∫ q : ℝ, Real.cos (q * (s + t)) / P.eval (q ^ 2 + ‖k‖ ^ 2))) =
      (2 * Real.pi)⁻¹ * ∫ p : ℝ × ℝ, ∫ q : ℝ,
        (h p.1 * h p.2) * (Real.cos (q * (p.1 + p.2)) / P.eval (q ^ 2 + ‖k‖ ^ 2))
        ∂volume ∂(volume.prod volume) := by
    have hrew (s t : ℝ) : h s * h t *
        ((2 * Real.pi)⁻¹ * ∫ q : ℝ, Real.cos (q * (s + t)) / P.eval (q ^ 2 + ‖k‖ ^ 2)) =
        (2 * Real.pi)⁻¹ * ∫ q : ℝ, (h s * h t) * (Real.cos (q * (s + t)) / P.eval (q ^ 2 + ‖k‖ ^ 2)) := by
      rw [integral_const_mul]; ring
    simp_rw [hrew]
    rw [show (∫ s : ℝ, ∫ t : ℝ, (2 * Real.pi)⁻¹ *
        ∫ q : ℝ, (h s * h t) * (Real.cos (q * (s + t)) / P.eval (q ^ 2 + ‖k‖ ^ 2))) =
      (2 * Real.pi)⁻¹ * ∫ s : ℝ, ∫ t : ℝ,
        ∫ q : ℝ, (h s * h t) * (Real.cos (q * (s + t)) / P.eval (q ^ 2 + ‖k‖ ^ 2)) by
      simp_rw [integral_const_mul]]
    congr 1
    exact (MeasureTheory.integral_prod
      (fun p : ℝ × ℝ => ∫ q : ℝ, (h p.1 * h p.2) * (Real.cos (q * (p.1 + p.2)) / P.eval (q ^ 2 + ‖k‖ ^ 2)))
      hjoint.integral_prod_left).symm
  rw [h1, MeasureTheory.integral_integral_swap hjoint]
  congr 1
  refine integral_congr_ae (ae_of_all _ fun q => ?_)
  dsimp only
  have hdiv : (fun p : ℝ × ℝ => (h p.1 * h p.2) * (Real.cos (q * (p.1 + p.2)) / P.eval (q ^ 2 + ‖k‖ ^ 2))) =
      fun p : ℝ × ℝ => (h p.1 * h p.2 * Real.cos (q * (p.1 + p.2))) / P.eval (q ^ 2 + ‖k‖ ^ 2) := by
    funext p; ring
  rw [hdiv, integral_div, hcos_eq]

/-- Momentum-space reflected pairing `C(θ f, f)` for a product test `f(s, x) = h(s) g(x)`
with transverse Fourier transform `gHat` and radial precision polynomial `P`. -/
noncomputable def smoothNormalReflectedForm {d : ℕ} (ħ : ℝ) (P : Polynomial ℝ)
    (gHat : EuclideanSpace ℝ (Fin d) → ℂ) (h : ℝ → ℝ) : ℝ :=
  ħ * (2 * Real.pi)⁻¹ *
    ∫ z : EuclideanSpace ℝ (Fin d) × ℝ,
      ‖gHat z.1‖ ^ 2 * ((normalTransform h z.2 ^ 2).re / P.eval (z.2 ^ 2 + ‖z.1‖ ^ 2))

/-- Exact momentum-space reflected pairing of the rescaled derivative bump `h_r(s) = r⁻² ρ'(s/r)`:
`C(θ f_r, f_r) = -ħ (2π)⁻¹ ∬ |ĝ(k)|² q² Re(ρ̃(r q)²) / P(q² + |k|²) dk dq`. -/
theorem smoothNormalReflectedForm_derivBump {d : ℕ} (ħ : ℝ) (P : Polynomial ℝ)
    (gHat : EuclideanSpace ℝ (Fin d) → ℂ) {ρ : ℝ → ℝ} (hρ : ContDiff ℝ 1 ρ)
    (hsupp : tsupport ρ ⊆ Set.Ioo 1 2) {r : ℝ} (hr : 0 < r) :
    smoothNormalReflectedForm ħ P gHat (derivBump ρ r) =
      -ħ * (2 * Real.pi)⁻¹ *
        ∫ z : EuclideanSpace ℝ (Fin d) × ℝ,
          ‖gHat z.1‖ ^ 2 *
            (z.2 ^ 2 * (normalTransform ρ (r * z.2) ^ 2).re / P.eval (z.2 ^ 2 + ‖z.1‖ ^ 2)) := by
  unfold smoothNormalReflectedForm
  have hsq (q : ℝ) : (normalTransform (derivBump ρ r) q ^ 2).re =
      -(q ^ 2 * (normalTransform ρ (r * q) ^ 2).re) := by
    rw [normalTransform_derivBump hρ hsupp hr q]
    have h1 : (Complex.I * (q : ℂ) * normalTransform ρ (r * q)) ^ 2 =
        -((q ^ 2 : ℝ) : ℂ) * normalTransform ρ (r * q) ^ 2 := by
      rw [mul_pow, mul_pow, Complex.I_sq]; push_cast; ring
    rw [h1, neg_mul, Complex.neg_re, Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im,
      zero_mul, sub_zero]
  simp_rw [hsq, neg_div, mul_neg]
  rw [integral_neg]
  ring

private lemma seam_norm_normalTransform_le_one {ρ : ℝ → ℝ}
    (hnonneg : ∀ t, 0 ≤ ρ t) (hone : ∫ t : ℝ, ρ t = 1) (ξ : ℝ) :
    ‖normalTransform ρ ξ‖ ≤ 1 := by
  calc ‖normalTransform ρ ξ‖
      ≤ ∫ t : ℝ, ‖(ρ t : ℂ) * Complex.exp (-Complex.I * (ξ : ℂ) * (t : ℂ))‖ :=
        norm_integral_le_integral_norm _
    _ = ∫ t : ℝ, ρ t := by
        refine integral_congr_ae (ae_of_all _ fun t => ?_)
        dsimp only
        rw [norm_mul, Complex.norm_real, Real.norm_of_nonneg (hnonneg t),
          show -Complex.I * (ξ : ℂ) * (t : ℂ) = ((-(ξ * t) : ℝ) : ℂ) * Complex.I by push_cast; ring,
          Complex.norm_exp_ofReal_mul_I, mul_one]
    _ = 1 := hone

private lemma seam_tendsto_normalTransform_zero {ρ : ℝ → ℝ} (hcont : Continuous ρ)
    (hsupp : tsupport ρ ⊆ Set.Ioo 1 2) (hone : ∫ t : ℝ, ρ t = 1) (q : ℝ) :
    Tendsto (fun r : ℝ => normalTransform ρ (r * q)) (𝓝[>] 0) (𝓝 (1 : ℂ)) := by
  have hint : Integrable ρ :=
    hcont.integrable_of_hasCompactSupport (seam_hasCompactSupport_of_tsupport_Ioo hsupp)
  have hlim : Tendsto (fun r : ℝ => normalTransform ρ (r * q)) (𝓝[>] 0)
      (𝓝 (∫ t : ℝ, (ρ t : ℂ))) := by
    refine tendsto_integral_filter_of_dominated_convergence (fun t => |ρ t|)
      (Eventually.of_forall fun r => (by fun_prop : Continuous fun t : ℝ =>
        (ρ t : ℂ) * Complex.exp (-Complex.I * ((r * q : ℝ) : ℂ) * (t : ℂ))).aestronglyMeasurable)
      (Eventually.of_forall fun r => ae_of_all _ fun t => by
        rw [norm_mul, Complex.norm_real, Real.norm_eq_abs,
          show -Complex.I * ((r * q : ℝ) : ℂ) * (t : ℂ) =
            ((-(r * q * t) : ℝ) : ℂ) * Complex.I by push_cast; ring,
          Complex.norm_exp_ofReal_mul_I, mul_one])
      hint.abs
      (ae_of_all _ fun t => by
        have hct : Continuous (fun r : ℝ =>
            (ρ t : ℂ) * Complex.exp (-Complex.I * ((r * q : ℝ) : ℂ) * (t : ℂ))) := by fun_prop
        simpa using (hct.continuousAt (x := 0)).tendsto.mono_left nhdsWithin_le_nhds)
  have h1 : (∫ t : ℝ, (ρ t : ℂ)) = 1 := by
    have := ContinuousLinearMap.integral_comp_comm Complex.ofRealCLM hint
    simpa [hone] using this
  rwa [h1] at hlim

/-- Dominated-convergence limit of the smooth normal-smeared reflected pairing as `r → 0⁺` (§2.4):
`C(θ f_r, f_r) → -ħ (2π)⁻¹ ∬ |ĝ(k)|² q² / P(q² + |k|²) dk dq`. -/
theorem tendsto_smoothNormalReflectedForm_derivBump {d : ℕ} (ħ : ℝ) (P : Polynomial ℝ)
    (hdeg : 2 ≤ P.natDegree) (hpos : ∀ u : ℝ, 0 ≤ u → 0 < P.eval u)
    (gHat : EuclideanSpace ℝ (Fin d) → ℂ)
    (hg : Integrable (fun k : EuclideanSpace ℝ (Fin d) => ‖gHat k‖ ^ 2))
    {ρ : ℝ → ℝ} (hρ : ContDiff ℝ 1 ρ) (hnonneg : ∀ t, 0 ≤ ρ t)
    (hsupp : tsupport ρ ⊆ Set.Ioo 1 2) (hone : ∫ t : ℝ, ρ t = 1) :
    Tendsto (fun r : ℝ => smoothNormalReflectedForm ħ P gHat (derivBump ρ r)) (𝓝[>] 0)
      (𝓝 (-ħ * (2 * Real.pi)⁻¹ *
        ∫ z : EuclideanSpace ℝ (Fin d) × ℝ,
          ‖gHat z.1‖ ^ 2 * (z.2 ^ 2 / P.eval (z.2 ^ 2 + ‖z.1‖ ^ 2)))) := by
  obtain ⟨B, hB⟩ := polynomial_uniform_bound P hdeg hpos
  have hdom : Integrable (fun z : EuclideanSpace ℝ (Fin d) × ℝ =>
      ‖gHat z.1‖ ^ 2 * (B * (1 + z.2 ^ 2)⁻¹)) := by
    rw [Measure.volume_eq_prod]
    exact hg.mul_prod (integrable_inv_one_add_sq.const_mul B)
  have hcont_norm (r : ℝ) : Continuous (fun q : ℝ => (normalTransform ρ (r * q) ^ 2).re) := by
    have hint : Integrable ρ :=
      hρ.continuous.integrable_of_hasCompactSupport (seam_hasCompactSupport_of_tsupport_Ioo hsupp)
    have hct : Continuous (fun q : ℝ => normalTransform ρ (r * q)) :=
      continuous_of_dominated
        (fun q => (by fun_prop : Continuous fun t : ℝ =>
          (ρ t : ℂ) * Complex.exp (-Complex.I * ((r * q : ℝ) : ℂ) * (t : ℂ))).aestronglyMeasurable)
        (fun q => ae_of_all _ fun t => by
          rw [norm_mul, Complex.norm_real, Real.norm_eq_abs,
            show -Complex.I * ((r * q : ℝ) : ℂ) * (t : ℂ) =
              ((-(r * q * t) : ℝ) : ℂ) * Complex.I by push_cast; ring,
            Complex.norm_exp_ofReal_mul_I, mul_one])
        hint.abs (ae_of_all _ fun t => by fun_prop)
    exact Complex.continuous_re.comp (hct.pow 2)
  have hPcont : Continuous (fun z : EuclideanSpace ℝ (Fin d) × ℝ =>
      (P.eval (z.2 ^ 2 + ‖z.1‖ ^ 2))⁻¹) :=
    (P.continuous.comp ((continuous_snd.pow 2).add ((continuous_norm.comp continuous_fst).pow 2))).inv₀
      (fun z => (hpos _ (add_nonneg (sq_nonneg _) (sq_nonneg _))).ne')
  have hint_lim : Tendsto
      (fun r : ℝ => ∫ z : EuclideanSpace ℝ (Fin d) × ℝ,
        ‖gHat z.1‖ ^ 2 *
          (z.2 ^ 2 * (normalTransform ρ (r * z.2) ^ 2).re / P.eval (z.2 ^ 2 + ‖z.1‖ ^ 2)))
      (𝓝[>] 0)
      (𝓝 (∫ z : EuclideanSpace ℝ (Fin d) × ℝ,
        ‖gHat z.1‖ ^ 2 * (z.2 ^ 2 / P.eval (z.2 ^ 2 + ‖z.1‖ ^ 2)))) := by
    refine tendsto_integral_filter_of_dominated_convergence
      (fun z : EuclideanSpace ℝ (Fin d) × ℝ => ‖gHat z.1‖ ^ 2 * (B * (1 + z.2 ^ 2)⁻¹))
      (Eventually.of_forall fun r => ?_)
      (Eventually.of_forall fun r => ae_of_all _ fun z => ?_)
      hdom
      (ae_of_all _ fun z => ?_)
    · rw [Measure.volume_eq_prod]
      have hmeas1 : AEStronglyMeasurable (fun z : EuclideanSpace ℝ (Fin d) × ℝ => ‖gHat z.1‖ ^ 2)
          (volume.prod volume) := hg.aestronglyMeasurable.comp_fst
      have hmeas2 : Continuous (fun z : EuclideanSpace ℝ (Fin d) × ℝ =>
          z.2 ^ 2 * (normalTransform ρ (r * z.2) ^ 2).re * (P.eval (z.2 ^ 2 + ‖z.1‖ ^ 2))⁻¹) :=
        ((continuous_snd.pow 2).mul ((hcont_norm r).comp continuous_snd)).mul hPcont
      exact (hmeas1.mul hmeas2.aestronglyMeasurable).congr
        (ae_of_all _ fun z => by simp [div_eq_mul_inv])
    · have hre : |(normalTransform ρ (r * z.2) ^ 2).re| ≤ 1 := by
        have h1 : ‖normalTransform ρ (r * z.2)‖ ≤ 1 :=
          seam_norm_normalTransform_le_one hnonneg hone (r * z.2)
        calc |(normalTransform ρ (r * z.2) ^ 2).re|
            ≤ ‖normalTransform ρ (r * z.2) ^ 2‖ := Complex.abs_re_le_norm _
          _ = ‖normalTransform ρ (r * z.2)‖ ^ 2 := norm_pow _ 2
          _ ≤ 1 ^ 2 := pow_le_pow_left₀ (norm_nonneg _) h1 2
          _ = 1 := one_pow 2
      have hPu : 0 < P.eval (z.2 ^ 2 + ‖z.1‖ ^ 2) := hpos _ (add_nonneg (sq_nonneg _) (sq_nonneg _))
      have hB' : z.2 ^ 2 / P.eval (z.2 ^ 2 + ‖z.1‖ ^ 2) ≤ B * (1 + z.2 ^ 2)⁻¹ := by
        have h1 := hB (‖z.1‖ ^ 2) (sq_nonneg _) z.2
        unfold polynomialSlice at h1
        rw [div_eq_mul_inv]
        have hinv : 0 ≤ (P.eval (z.2 ^ 2 + ‖z.1‖ ^ 2))⁻¹ := inv_nonneg.mpr hPu.le
        nlinarith [sq_nonneg z.2]
      rw [Real.norm_eq_abs, abs_mul, abs_of_nonneg (sq_nonneg _), abs_div,
        abs_of_pos hPu, abs_mul, abs_of_nonneg (sq_nonneg _)]
      calc ‖gHat z.1‖ ^ 2 * (z.2 ^ 2 * |(normalTransform ρ (r * z.2) ^ 2).re| / P.eval (z.2 ^ 2 + ‖z.1‖ ^ 2))
          ≤ ‖gHat z.1‖ ^ 2 * (z.2 ^ 2 * 1 / P.eval (z.2 ^ 2 + ‖z.1‖ ^ 2)) := by gcongr
        _ = ‖gHat z.1‖ ^ 2 * (z.2 ^ 2 / P.eval (z.2 ^ 2 + ‖z.1‖ ^ 2)) := by ring
        _ ≤ ‖gHat z.1‖ ^ 2 * (B * (1 + z.2 ^ 2)⁻¹) := by gcongr
    · have h1 := seam_tendsto_normalTransform_zero hρ.continuous hsupp hone z.2
      have h2 : Tendsto (fun r : ℝ => (normalTransform ρ (r * z.2) ^ 2).re) (𝓝[>] 0) (𝓝 1) := by
        have hcomp : Tendsto (Complex.re ∘ fun r : ℝ => normalTransform ρ (r * z.2) ^ 2)
            (𝓝[>] 0) (𝓝 ((1 : ℂ) ^ 2).re) :=
          (Complex.continuous_re.continuousAt.tendsto).comp (h1.pow 2)
        simpa [Function.comp_def] using hcomp
      have h3 := ((h2.const_mul (z.2 ^ 2)).div_const (P.eval (z.2 ^ 2 + ‖z.1‖ ^ 2))).const_mul (‖gHat z.1‖ ^ 2)
      simpa [mul_one] using h3
  have hmul := hint_lim.const_mul (-ħ * (2 * Real.pi)⁻¹)
  refine hmul.congr' ?_
  filter_upwards [self_mem_nhdsWithin] with r hr
  exact (smoothNormalReflectedForm_derivBump ħ P gHat hρ hsupp hr).symm

/-- Smooth normal-smeared derivative-bump no-go (§2.4): for every positive precision polynomial
`P` of degree `≥ 2`, every `ħ > 0`, every nonzero transverse `L²` packet `gHat`, and every
`C¹` probability bump `ρ` supported in `(1, 2)`, the reflected pairing `C(θ f_r, f_r)` is
strictly negative for all sufficiently small `r > 0`. -/
theorem smooth_normal_nogo {d : ℕ} {ħ : ℝ} (hħ : 0 < ħ) (P : Polynomial ℝ)
    (hdeg : 2 ≤ P.natDegree) (hpos : ∀ u : ℝ, 0 ≤ u → 0 < P.eval u)
    (gHat : EuclideanSpace ℝ (Fin d) → ℂ)
    (hg : Integrable (fun k : EuclideanSpace ℝ (Fin d) => ‖gHat k‖ ^ 2))
    (hg_pos : 0 < ∫ k : EuclideanSpace ℝ (Fin d), ‖gHat k‖ ^ 2)
    {ρ : ℝ → ℝ} (hρ : ContDiff ℝ 1 ρ) (hnonneg : ∀ t, 0 ≤ ρ t)
    (hsupp : tsupport ρ ⊆ Set.Ioo 1 2) (hone : ∫ t : ℝ, ρ t = 1) :
    ∃ R : ℝ, 0 < R ∧ ∀ r : ℝ, 0 < r → r < R →
      smoothNormalReflectedForm ħ P gHat (derivBump ρ r) < 0 := by
  obtain ⟨B, hB⟩ := polynomial_uniform_bound P hdeg hpos
  have hPcont : Continuous (fun z : EuclideanSpace ℝ (Fin d) × ℝ =>
      (P.eval (z.2 ^ 2 + ‖z.1‖ ^ 2))⁻¹) :=
    (P.continuous.comp ((continuous_snd.pow 2).add ((continuous_norm.comp continuous_fst).pow 2))).inv₀
      (fun z => (hpos _ (add_nonneg (sq_nonneg _) (sq_nonneg _))).ne')
  have hlim_int : Integrable (fun z : EuclideanSpace ℝ (Fin d) × ℝ =>
      ‖gHat z.1‖ ^ 2 * (z.2 ^ 2 / P.eval (z.2 ^ 2 + ‖z.1‖ ^ 2))) (volume.prod volume) := by
    have hdom : Integrable (fun z : EuclideanSpace ℝ (Fin d) × ℝ =>
        ‖gHat z.1‖ ^ 2 * (B * (1 + z.2 ^ 2)⁻¹)) (volume.prod volume) :=
      hg.mul_prod (integrable_inv_one_add_sq.const_mul B)
    refine hdom.mono' ?_ (ae_of_all _ fun z => ?_)
    · have h1 : AEStronglyMeasurable (fun z : EuclideanSpace ℝ (Fin d) × ℝ => ‖gHat z.1‖ ^ 2)
          (volume.prod volume) := hg.aestronglyMeasurable.comp_fst
      have h2 : Continuous (fun z : EuclideanSpace ℝ (Fin d) × ℝ =>
          z.2 ^ 2 * (P.eval (z.2 ^ 2 + ‖z.1‖ ^ 2))⁻¹) := (continuous_snd.pow 2).mul hPcont
      exact (h1.mul h2.aestronglyMeasurable).congr (ae_of_all _ fun z => by simp [div_eq_mul_inv])
    · have hPu : 0 < P.eval (z.2 ^ 2 + ‖z.1‖ ^ 2) := hpos _ (add_nonneg (sq_nonneg _) (sq_nonneg _))
      rw [Real.norm_of_nonneg (mul_nonneg (sq_nonneg _) (div_nonneg (sq_nonneg _) hPu.le))]
      have h1 := hB (‖z.1‖ ^ 2) (sq_nonneg _) z.2
      unfold polynomialSlice at h1
      have hinv : 0 ≤ (P.eval (z.2 ^ 2 + ‖z.1‖ ^ 2))⁻¹ := inv_nonneg.mpr hPu.le
      rw [div_eq_mul_inv]
      exact mul_le_mul_of_nonneg_left (by nlinarith [sq_nonneg z.2]) (sq_nonneg _)
  have hlim_pos : 0 < ∫ z : EuclideanSpace ℝ (Fin d) × ℝ,
      ‖gHat z.1‖ ^ 2 * (z.2 ^ 2 / P.eval (z.2 ^ 2 + ‖z.1‖ ^ 2)) := by
    rw [Measure.volume_eq_prod, MeasureTheory.integral_prod _ hlim_int]
    have hinner_pos (k : EuclideanSpace ℝ (Fin d)) :
        0 < ∫ q : ℝ, q ^ 2 / P.eval (q ^ 2 + ‖k‖ ^ 2) := by
      have hct : Continuous (fun q : ℝ => q ^ 2 / P.eval (q ^ 2 + ‖k‖ ^ 2)) :=
        (continuous_id.pow 2).div
          (P.continuous.comp ((continuous_id.pow 2).add continuous_const))
          (fun q => (hpos _ (add_nonneg (sq_nonneg _) (sq_nonneg _))).ne')
      have hint_q : Integrable (fun q : ℝ => q ^ 2 / P.eval (q ^ 2 + ‖k‖ ^ 2)) := by
        refine (integrable_inv_one_add_sq.const_mul B).mono' hct.aestronglyMeasurable
          (ae_of_all _ fun q => ?_)
        have hPu : 0 < P.eval (q ^ 2 + ‖k‖ ^ 2) := hpos _ (add_nonneg (sq_nonneg _) (sq_nonneg _))
        rw [Real.norm_of_nonneg (div_nonneg (sq_nonneg _) hPu.le), div_eq_mul_inv]
        have h1 := hB (‖k‖ ^ 2) (sq_nonneg _) q
        unfold polynomialSlice at h1
        have hinv : 0 ≤ (P.eval (q ^ 2 + ‖k‖ ^ 2))⁻¹ := inv_nonneg.mpr hPu.le
        nlinarith [sq_nonneg q]
      refine integral_pos_of_integrable_nonneg_nonzero (x := (1 : ℝ)) hct hint_q
        (fun q => div_nonneg (sq_nonneg _) (hpos _ (add_nonneg (sq_nonneg _) (sq_nonneg _))).le) ?_
      have hp1 : 0 < (1 : ℝ) ^ 2 / P.eval ((1 : ℝ) ^ 2 + ‖k‖ ^ 2) :=
        div_pos (by norm_num) (hpos _ (add_nonneg (sq_nonneg _) (sq_nonneg _)))
      exact hp1.ne'
    have hF_nonneg : ∀ k : EuclideanSpace ℝ (Fin d),
        0 ≤ ‖gHat k‖ ^ 2 * ∫ q : ℝ, q ^ 2 / P.eval (q ^ 2 + ‖k‖ ^ 2) :=
      fun k => mul_nonneg (sq_nonneg _) (hinner_pos k).le
    have hF_int : Integrable (fun k : EuclideanSpace ℝ (Fin d) =>
        ‖gHat k‖ ^ 2 * ∫ q : ℝ, q ^ 2 / P.eval (q ^ 2 + ‖k‖ ^ 2)) := by
      simpa [integral_const_mul] using hlim_int.integral_prod_left
    have hnonneg_int : 0 ≤ ∫ k : EuclideanSpace ℝ (Fin d),
        ‖gHat k‖ ^ 2 * ∫ q : ℝ, q ^ 2 / P.eval (q ^ 2 + ‖k‖ ^ 2) :=
      integral_nonneg hF_nonneg
    have hrew : (∫ k : EuclideanSpace ℝ (Fin d), ∫ q : ℝ,
        ‖gHat k‖ ^ 2 * (q ^ 2 / P.eval (q ^ 2 + ‖k‖ ^ 2))) =
        ∫ k : EuclideanSpace ℝ (Fin d),
          ‖gHat k‖ ^ 2 * ∫ q : ℝ, q ^ 2 / P.eval (q ^ 2 + ‖k‖ ^ 2) := by
      simp_rw [integral_const_mul]
    rw [hrew]
    by_contra hle
    have hzero : ∫ k : EuclideanSpace ℝ (Fin d),
        ‖gHat k‖ ^ 2 * ∫ q : ℝ, q ^ 2 / P.eval (q ^ 2 + ‖k‖ ^ 2) = 0 :=
      le_antisymm (not_lt.mp hle) hnonneg_int
    have hae : (fun k : EuclideanSpace ℝ (Fin d) =>
        ‖gHat k‖ ^ 2 * ∫ q : ℝ, q ^ 2 / P.eval (q ^ 2 + ‖k‖ ^ 2)) =ᵐ[volume] 0 :=
      (integral_eq_zero_iff_of_nonneg hF_nonneg hF_int).mp hzero
    have hg0 : (fun k : EuclideanSpace ℝ (Fin d) => ‖gHat k‖ ^ 2) =ᵐ[volume] 0 := by
      filter_upwards [hae] with k hk
      exact (mul_eq_zero.mp hk).resolve_right (hinner_pos k).ne'
    have hgint0 : ∫ k : EuclideanSpace ℝ (Fin d), ‖gHat k‖ ^ 2 = 0 := by
      rw [integral_congr_ae hg0]; simp
    linarith
  have hneg_lim : -ħ * (2 * Real.pi)⁻¹ *
      ∫ z : EuclideanSpace ℝ (Fin d) × ℝ,
        ‖gHat z.1‖ ^ 2 * (z.2 ^ 2 / P.eval (z.2 ^ 2 + ‖z.1‖ ^ 2)) < 0 := by
    have hcoeff : 0 < ħ * (2 * Real.pi)⁻¹ := by positivity
    nlinarith
  have htend := tendsto_smoothNormalReflectedForm_derivBump ħ P hdeg hpos gHat hg hρ hnonneg hsupp hone
  have hev := htend.eventually (Iio_mem_nhds hneg_lim)
  obtain ⟨R, hR, hball⟩ := Metric.mem_nhdsWithin_iff.mp hev
  refine ⟨R, hR, fun r hr hrR => hball ⟨?_, hr⟩⟩
  rw [Metric.mem_ball, Real.dist_eq, sub_zero, abs_of_pos hr]
  exact hrR

/-- Unconditional §2.4 smooth normal-direction no-go: for every `ħ > 0`, every positive precision
polynomial `P` of degree `≥ 2`, and every nonzero transverse `L²` packet `gHat`, there exists a
concrete smooth (`C^∞`) normal profile `h` compactly supported in `(0, ∞)` whose reflected
pairing `smoothNormalReflectedForm ħ P gHat h` is strictly negative. -/
theorem smooth_normal_nogo_unconditional {d : ℕ} {ħ : ℝ} (hħ : 0 < ħ) (P : Polynomial ℝ)
    (hdeg : 2 ≤ P.natDegree) (hpos : ∀ u : ℝ, 0 ≤ u → 0 < P.eval u)
    (gHat : EuclideanSpace ℝ (Fin d) → ℂ)
    (hg : Integrable (fun k : EuclideanSpace ℝ (Fin d) => ‖gHat k‖ ^ 2))
    (hg_pos : 0 < ∫ k : EuclideanSpace ℝ (Fin d), ‖gHat k‖ ^ 2) :
    ∃ h : ℝ → ℝ, ContDiff ℝ (⊤ : ℕ∞) h ∧ HasCompactSupport h ∧
      tsupport h ⊆ Set.Ioi 0 ∧ smoothNormalReflectedForm ħ P gHat h < 0 := by
  obtain ⟨ρ, hρsmooth, hρnn, hρsupp, hρone⟩ := exists_smooth_unit_bump_Ioo_one_two
  have hρ1 : ContDiff ℝ 1 ρ := hρsmooth.of_le (by simp)
  obtain ⟨R, hR, hneg⟩ := smooth_normal_nogo hħ P hdeg hpos gHat hg hg_pos hρ1 hρnn hρsupp hρone
  let r : ℝ := R / 2
  have hr : 0 < r := half_pos hR
  have hsub : tsupport (derivBump ρ r) ⊆ Set.Ioo r (2 * r) := derivBump_tsupport_subset hρsupp hr
  refine ⟨derivBump ρ r, ?_, seam_hasCompactSupport_of_tsupport_Ioo hsub,
    hsub.trans (fun s hs => lt_trans hr hs.1), hneg r hr (half_lt_self hR)⟩
  have hd : ContDiff ℝ (⊤ : ℕ∞) (deriv ρ) :=
    contDiff_infty.mpr fun n => (contDiff_succ_iff_deriv.mp (contDiff_infty.mp hρsmooth (n + 1))).2.2
  exact contDiff_const.mul (hd.comp (contDiff_id.div_const r))

end SmoothNormalNoGo

/-!
==============================================================================
  PART 5: HILBERT STATE SPACE, FEATURE DENSITY & FOCK REALIZATION (§3.1)
==============================================================================
-/
section States

open MeasureTheory Submodule
open scoped InnerProductSpace

/-- Total labelled Gram uniqueness: two complete minimal realizations with the same
Gram table are related by a unique label-preserving unitary. -/
theorem gram_total_unique {ι E F : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
    [NormedAddCommGroup F] [InnerProductSpace ℂ F] [CompleteSpace F]
    (a : ι → E) (b : ι → F)
    (ha : Dense ((Submodule.span ℂ (Set.range a) : Submodule ℂ E) : Set E))
    (hb : Dense ((Submodule.span ℂ (Set.range b) : Submodule ℂ F) : Set F))
    (hg : ∀ i j, inner ℂ (a i) (a j) = inner ℂ (b i) (b j)) :
    ∃! U : E ≃ₗᵢ[ℂ] F, ∀ i, U (a i) = b i := by
  classical
  let A := Finsupp.linearCombination ℂ a; let B := Finsupp.linearCombination ℂ b
  have da : DenseRange A := by change Dense (Set.range A); rw [← LinearMap.coe_range, Finsupp.range_linearCombination]; exact ha
  have db : DenseRange B := by change Dense (Set.range B); rw [← LinearMap.coe_range, Finsupp.range_linearCombination]; exact hb
  have hn (c : ι →₀ ℂ) : ‖B c‖ = ‖A c‖ := by
    rw [norm_eq_sqrt_re_inner (𝕜 := ℂ) (B c), norm_eq_sqrt_re_inner (𝕜 := ℂ) (A c)]
    congr 2; simp only [A, B, Finsupp.linearCombination_apply, Finsupp.sum, sum_inner, inner_sum,
      inner_smul_left, inner_smul_right, hg]
  let U : E ≃ₗᵢ[ℂ] F := (LinearEquiv.refl ℂ (ι →₀ ℂ)).extendOfIsometry A B da db hn
  have hu := (LinearEquiv.refl ℂ (ι →₀ ℂ)).extendOfIsometry_eq A B da db hn
  refine ⟨U, fun i => by simpa [A, B] using hu (Finsupp.single i 1), fun V hv => DFunLike.ext _ _ fun x => ?_⟩
  refine da.induction ?_ (isClosed_eq V.continuous U.continuous) x
  rintro _ ⟨c, rfl⟩
  rw [hu]; simp [A, B, Finsupp.linearCombination_apply, Finsupp.sum, hv]

/-- Wick exponential phase overlap for a centered Gaussian field (§3.1). -/
theorem gaussian_phase_overlap {E Ω : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [MeasurableSpace Ω] (μ : Measure Ω)
    (Φ : Ω → E →ₗ[ℝ] ℝ)
    (hchar : ∀ v : E, (∫ w, Complex.exp (((Φ w v : ℝ) : ℂ) * Complex.I) ∂μ) =
      (Real.exp (-(‖v‖ ^ 2) / 2) : ℂ))
    (a b : E) :
    (∫ w, star (Complex.exp ((‖a‖ ^ 2 / 2 : ℝ) + (Φ w a : ℂ) * Complex.I)) *
      Complex.exp ((‖b‖ ^ 2 / 2 : ℝ) + (Φ w b : ℂ) * Complex.I) ∂μ) =
      (Real.exp (inner ℝ a b) : ℂ) := by
  have hpoint (w : Ω) :
      star (Complex.exp ((‖a‖ ^ 2 / 2 : ℝ) + (Φ w a : ℂ) * Complex.I)) *
        Complex.exp ((‖b‖ ^ 2 / 2 : ℝ) + (Φ w b : ℂ) * Complex.I) =
      Complex.exp (((‖a‖ ^ 2 + ‖b‖ ^ 2) / 2 : ℝ) : ℂ) * Complex.exp ((Φ w (b - a) : ℂ) * Complex.I) := by
    rw [Complex.star_def, ← Complex.exp_conj, ← Complex.exp_add, ← Complex.exp_add]
    congr 1; simp only [map_add, map_mul, Complex.conj_ofReal, Complex.conj_I, map_sub]; push_cast; ring
  simp_rw [hpoint]
  rw [integral_const_mul, hchar, Complex.ofReal_exp, ← Complex.exp_add, Complex.ofReal_exp]
  congr 1
  exact_mod_cast (by linarith [norm_sub_sq_real b a, real_inner_comm a b] :
    (‖a‖ ^ 2 + ‖b‖ ^ 2) / 2 + -(‖b - a‖ ^ 2) / 2 = inner ℝ a b)

section PhaseGeometry

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]

theorem ray_fraction (u v : H) :
    ‖(ℂ ∙ u).starProjection v‖ ^ 2 / ‖v‖ ^ 2 = ‖inner ℂ u v‖ ^ 2 / (‖u‖ ^ 2 * ‖v‖ ^ 2) := by
  by_cases h : u = 0
  · simp [h]
  rw [starProjection_singleton, norm_smul, norm_div, RCLike.norm_ofReal, abs_of_nonneg (sq_nonneg _)]
  field_simp [norm_ne_zero_iff.mpr h]

theorem gram_expansion {ι : Type*} (a : ι → H) (G : ι → ι → ℂ)
    (hg : ∀ i j, inner ℂ (a i) (a j) = G i j) (c d : ι →₀ ℂ) :
    inner ℂ (Finsupp.linearCombination ℂ a c) (Finsupp.linearCombination ℂ a d) =
      c.sum (fun i z => d.sum (fun j t => star z * (t * G i j))) := by
  simp [Finsupp.linearCombination_apply, Finsupp.sum, hg, Finset.mul_sum]
  rw [Finset.sum_comm]; simp only [mul_comm, mul_left_comm, mul_assoc]

theorem gaussian_ray_fraction {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (a : E → H) (hg : ∀ x y, inner ℂ (a x) (a y) = (Real.exp (inner ℝ x y) : ℂ))
    (x y : E) :
    ‖(ℂ ∙ a x).starProjection (a y)‖ ^ 2 / ‖a y‖ ^ 2 = Real.exp (-‖x - y‖ ^ 2) := by
  have hd (z : E) : ‖a z‖ ^ 2 = Real.exp (‖z‖ ^ 2) := by
    rw [norm_sq_eq_re_inner (𝕜 := ℂ), hg, real_inner_self_eq_norm_sq]; rfl
  rw [ray_fraction, hg, hd, hd, Complex.norm_real, Real.norm_of_nonneg (Real.exp_pos _).le,
    pow_two (Real.exp _), ← Real.exp_add, ← Real.exp_add, ← Real.exp_sub, norm_sub_sq_real]
  congr 1; ring

theorem continuous_phase {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (a : E → H) (hg : ∀ x y, inner ℂ (a x) (a y) = (Real.exp (inner ℝ x y) : ℂ)) :
    Continuous a := by
  apply continuous_iff_continuous_dist.mpr
  have hd (x y : E) : dist (a x) (a y) = Real.sqrt
      (Real.exp (inner ℝ x x) - 2 * Real.exp (inner ℝ x y) + Real.exp (inner ℝ y y)) := by
    rw [dist_eq_norm, ← Real.sqrt_sq (norm_nonneg (a x - a y)), norm_sub_sq (𝕜 := ℂ),
      norm_sq_eq_re_inner (𝕜 := ℂ), norm_sq_eq_re_inner (𝕜 := ℂ), hg, hg, hg]; rfl
  simp_rw [hd]; fun_prop

/-- Minimality transfers separability of the one-particle feature space to the state space. -/
theorem separable_phase_span {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [TopologicalSpace.SeparableSpace E] (a : E → H)
    (hg : ∀ x y, inner ℂ (a x) (a y) = (Real.exp (inner ℝ x y) : ℂ))
    (ht : Dense (Submodule.span ℂ (Set.range a) : Set H)) : TopologicalSpace.SeparableSpace H :=
  ht.isSeparable_iff.mp (TopologicalSpace.isSeparable_range (continuous_phase a hg)).span

/-- Vandermonde determinant: one nonzero feature direction forces `n` linearly independent
states for every `n`, hence infinite dimension (`gaussian_infinite_dimension`). -/
theorem gaussian_ray_independent {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (a : E → H) (hg : ∀ x y, inner ℂ (a x) (a y) = (Real.exp (inner ℝ x y) : ℂ))
    (u : E) (hu : u ≠ 0) (n : ℕ) :
    LinearIndependent ℂ (fun i : Fin n => a ((i.val : ℝ) • u)) := by
  let t (i : Fin n) : ℂ := (Real.exp (i.val * ‖u‖ ^ 2) : ℝ)
  have ht : Function.Injective t := fun i j h => Fin.ext <| by
    have he := Real.exp_injective (Complex.ofReal_inj.mp h)
    exact_mod_cast mul_right_cancel₀ (pow_ne_zero 2 (norm_ne_zero_iff.mpr hu)) he
  apply Matrix.linearIndependent_of_det_gram_ne_zero
  convert Matrix.det_vandermonde_ne_zero_iff.mpr ht using 2
  ext i j
  rw [Matrix.gram_apply, hg, Matrix.vandermonde_apply]
  simp only [real_inner_smul_left, real_inner_smul_right, real_inner_self_eq_norm_sq,
    t, ← Complex.ofReal_pow, ← Real.exp_nat_mul]

theorem gaussian_infinite_dimension {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (a : E → H) (hg : ∀ x y, inner ℂ (a x) (a y) = (Real.exp (inner ℝ x y) : ℂ))
    (u : E) (hu : u ≠ 0) : ¬FiniteDimensional ℂ H := fun h => by
  have hbound := (gaussian_ray_independent a hg u hu (Module.finrank ℂ H + 1)).fintype_card_le_finrank
  simp at hbound

theorem unit_perpendicular_to_finite (hdim : ¬FiniteDimensional ℂ H)
    (K : Submodule ℂ H) [hK : FiniteDimensional ℂ K] : ∃ v ∈ Kᗮ, ‖v‖ = 1 := by
  have hne : Kᗮ ≠ ⊥ := fun h => by
    have htop := (Submodule.orthogonal_eq_bot_iff (K := K)).mp h
    subst K; exact hdim (Submodule.topEquiv (R := ℂ) (M := H)).finiteDimensional
  obtain ⟨u, hu, hu₀⟩ := Submodule.exists_mem_ne_zero_of_ne_bot hne
  exact ⟨(‖u‖⁻¹ : ℂ) • u, Kᗮ.smul_mem _ hu, norm_smul_inv_norm hu₀⟩

theorem exists_three_frame (hdim : ¬FiniteDimensional ℂ H) (ψ : H) (hψ : ‖ψ‖ = 1) :
    ∃ e : Fin 3 → H, Orthonormal ℂ e ∧ e 0 = ψ := by
  obtain ⟨u, hu, hnu⟩ := unit_perpendicular_to_finite hdim (ℂ ∙ ψ)
  obtain ⟨v, hv, hnv⟩ := unit_perpendicular_to_finite hdim ((ℂ ∙ ψ) ⊔ (ℂ ∙ u))
  refine ⟨![ψ, u, v], ?_, rfl⟩
  simp [orthonormal_vecCons_iff, Fin.forall_fin_succ, hψ, hnu, hnv,
    Submodule.mem_orthogonal_singleton_iff_inner_right.mp hu,
    hv ψ (Submodule.mem_sup_left (Submodule.mem_span_singleton_self _)),
    hv u (Submodule.mem_sup_right (Submodule.mem_span_singleton_self _))]

/-- Closed ray `ℂ ∙ u` (the zero subspace when `u = 0`). -/
def ray (u : H) : ClosedSubmodule ℂ H := ⟨ℂ ∙ u, (ℂ ∙ u).closed_of_finiteDimensional⟩

theorem event_eq_projected_ray [CompleteSpace H] (ψ : H) (p : ClosedSubmodule ℂ H → ℝ)
    (hadd : ∀ A B : ClosedSubmodule ℂ H, B ≤ Aᗮ → p (A ⊔ B) = p A + p B)
    (hnull : ∀ B : ClosedSubmodule ℂ H, B ≤ (ray ψ)ᗮ → p B = 0)
    (K : ClosedSubmodule ℂ H) :
    p K = p (ray (K.toSubmodule.starProjection ψ)) := by
  let R := ray (K.toSubmodule.starProjection ψ); let B := Rᗮ ⊓ K
  have hRK : R ≤ K := (Submodule.span_singleton_le_iff_mem _ _).mpr (K.toSubmodule.starProjection_apply_mem ψ)
  have hsplit : R ⊔ B = K := le_antisymm (sup_le hRK inf_le_right) <| by
    change K.toSubmodule ≤ (R ⊔ B).toSubmodule
    exact (Submodule.sup_orthogonal_inf_of_hasOrthogonalProjection
      (show R.toSubmodule ≤ K.toSubmodule from hRK)).symm.trans_le (Submodule.le_topologicalClosure _)
  have hB : B ≤ (ray ψ)ᗮ := fun v hv => Submodule.mem_orthogonal_singleton_iff_inner_right.mpr <| by
    have ho := K.toSubmodule.starProjection_inner_eq_zero ψ v hv.2
    rwa [inner_sub_left, Submodule.mem_orthogonal_singleton_iff_inner_right.mp hv.1, sub_zero] at ho
  calc p K = p (R ⊔ B) := congrArg p hsplit.symm
    _ = p R + p B := hadd R B inf_le_left
    _ = p R := by rw [hnull B hB, add_zero]

end PhaseGeometry

/-! ### §3.1 Concrete Coherent Fock Space Realization (`coherentFock`) -/
section CoherentFock

open Filter
open scoped BigOperators Topology InnerProductSpace

/-- Occupation-number exponential vector coefficient
`ε(u)(α) = ∏_{m ∈ supp α} u(m)^{α(m)} / √(α(m)!)`. -/
noncomputable def fockCoeff (u : ℕ → ℂ) (α : ℕ →₀ ℕ) : ℂ :=
  ∏ m ∈ α.support, (u m) ^ (α m) / (Real.sqrt ((α m).factorial) : ℂ)

private noncomputable def fockTerm (w : ℕ → ℂ) (α : ℕ →₀ ℕ) : ℂ :=
  ∏ m ∈ α.support, (w m) ^ (α m) / ((α m).factorial : ℂ)

private noncomputable def fockTermReal (r : ℕ → ℝ) (α : ℕ →₀ ℕ) : ℝ :=
  ∏ m ∈ α.support, (r m) ^ (α m) / ((α m).factorial : ℝ)

private lemma fockTerm_eq_finProd (w : ℕ → ℂ) {N : ℕ} {α : ℕ →₀ ℕ} (hα : α.support ⊆ Finset.range N) :
    fockTerm w α = ∏ i : Fin N, (w i.1) ^ (α i.1) / ((α i.1).factorial : ℂ) := by
  unfold fockTerm
  rw [Finset.prod_subset hα (fun m _ hm ↦ by simp [Finsupp.notMem_support_iff.mp hm]), Finset.prod_range]

private lemma fockTermReal_eq_finProd (r : ℕ → ℝ) {N : ℕ} {α : ℕ →₀ ℕ} (hα : α.support ⊆ Finset.range N) :
    fockTermReal r α = ∏ i : Fin N, (r i.1) ^ (α i.1) / ((α i.1).factorial : ℝ) := by
  unfold fockTermReal
  rw [Finset.prod_subset hα (fun m _ hm ↦ by simp [Finsupp.notMem_support_iff.mp hm]), Finset.prod_range]

private noncomputable def finToOcc {N : ℕ} (g : Fin N → ℕ) : ℕ →₀ ℕ :=
  Finsupp.onFinset (Finset.range N) (fun m ↦ if h : m < N then g ⟨m, h⟩ else 0)
    fun m hm ↦ by by_contra h; exact hm (by simp [show ¬ m < N by simpa [Finset.mem_range] using h])

private def finSnocEquiv (N : ℕ) : (Fin N → ℕ) × ℕ ≃ (Fin (N + 1) → ℕ) where
  toFun p i := if h : i.1 < N then p.1 ⟨i.1, h⟩ else p.2
  invFun g := (fun i ↦ g i.castSucc, g (Fin.last N))
  left_inv p := Prod.ext (funext fun i ↦ by simp [i.2]) (by simp)
  right_inv g := funext fun i ↦ by
    dsimp only; split_ifs with h
    · congr 1
    · rw [show i = Fin.last N from Fin.ext (by have := i.2; simp only [Fin.val_last]; omega)]

private lemma finSnocEquiv_castSucc {N : ℕ} (g : Fin N → ℕ) (k : ℕ) (i : Fin N) :
    finSnocEquiv N (g, k) i.castSucc = g i := by simp [finSnocEquiv, i.2]

private lemma finSnocEquiv_last {N : ℕ} (g : Fin N → ℕ) (k : ℕ) :
    finSnocEquiv N (g, k) (Fin.last N) = k := by simp [finSnocEquiv]

private lemma hasSum_fin_exp_real (r : ℕ → ℝ) (hr : ∀ m, 0 ≤ r m) (N : ℕ) :
    HasSum (fun g : Fin N → ℕ ↦ ∏ i : Fin N, (r i.1) ^ (g i) / ((g i).factorial : ℝ))
      (Real.exp (∑ i : Fin N, r i.1)) := by
  induction N with
  | zero => simp only [Finset.univ_eq_empty, Finset.sum_empty, Real.exp_zero, Finset.prod_empty]; exact hasSum_unique _
  | succ N ih =>
    let f : (Fin N → ℕ) → ℝ := fun g ↦ ∏ i : Fin N, (r i.1) ^ (g i) / ((g i).factorial : ℝ)
    let h : ℕ → ℝ := fun k ↦ (r N) ^ k / (k.factorial : ℝ)
    have hf : HasSum f (Real.exp (∑ i : Fin N, r i.1)) := ih
    have hh : HasSum h (Real.exp (r N)) := by
      simpa [h, Real.exp_eq_exp_ℝ] using NormedSpace.expSeries_div_hasSum_exp (𝔸 := ℝ) (r N)
    have hmul := hf.mul hh <| summable_mul_of_summable_norm
      (hf.summable.congr fun g ↦ (Real.norm_of_nonneg (Finset.prod_nonneg fun i _ ↦
        div_nonneg (pow_nonneg (hr i.1) _) (Nat.cast_nonneg _))).symm)
      (hh.summable.congr fun k ↦ (Real.norm_of_nonneg (div_nonneg (pow_nonneg (hr N) _) (Nat.cast_nonneg _))).symm)
    rw [show ∑ i : Fin (N + 1), r i.1 = (∑ i : Fin N, r i.1) + r N by
      simpa using Fin.sum_univ_castSucc (fun i : Fin (N + 1) ↦ r i.1),
      Real.exp_add, ← (finSnocEquiv N).hasSum_iff]
    exact hmul.congr_fun fun ⟨g, k⟩ ↦ by
      simp only [f, h, Function.comp_apply, Fin.prod_univ_castSucc, finSnocEquiv_castSucc,
        finSnocEquiv_last, Fin.val_castSucc, Fin.val_last]

private lemma hasSum_fin_exp_complex (w : ℕ → ℂ) (N : ℕ) :
    HasSum (fun g : Fin N → ℕ ↦ ∏ i : Fin N, (w i.1) ^ (g i) / ((g i).factorial : ℂ))
      (Complex.exp (∑ i : Fin N, w i.1)) := by
  induction N with
  | zero => simp only [Finset.univ_eq_empty, Finset.sum_empty, Complex.exp_zero, Finset.prod_empty]; exact hasSum_unique _
  | succ N ih =>
    let f : (Fin N → ℕ) → ℂ := fun g ↦ ∏ i : Fin N, (w i.1) ^ (g i) / ((g i).factorial : ℂ)
    let h : ℕ → ℂ := fun k ↦ (w N) ^ k / (k.factorial : ℂ)
    have hf : HasSum f (Complex.exp (∑ i : Fin N, w i.1)) := ih
    have hh : HasSum h (Complex.exp (w N)) := by
      simpa [h, Complex.exp_eq_exp_ℂ] using NormedSpace.expSeries_div_hasSum_exp (𝔸 := ℂ) (w N)
    have hmul := hf.mul hh <| summable_mul_of_summable_norm
      ((hasSum_fin_exp_real (fun m ↦ ‖w m‖) (fun _ ↦ norm_nonneg _) N).summable.congr fun g ↦ by
        simp [f, norm_prod, norm_pow])
      ((NormedSpace.expSeries_div_hasSum_exp (𝔸 := ℝ) ‖w N‖).summable.congr fun k ↦ by simp [h, norm_pow])
    rw [show ∑ i : Fin (N + 1), w i.1 = (∑ i : Fin N, w i.1) + w N by
      simpa using Fin.sum_univ_castSucc (fun i : Fin (N + 1) ↦ w i.1),
      Complex.exp_add, ← (finSnocEquiv N).hasSum_iff]
    exact hmul.congr_fun fun ⟨g, k⟩ ↦ by
      simp only [f, h, Function.comp_apply, Fin.prod_univ_castSucc, finSnocEquiv_castSucc,
        finSnocEquiv_last, Fin.val_castSucc, Fin.val_last]

private lemma summable_fockTermReal (r : ℕ → ℝ) (hr : ∀ m, 0 ≤ r m) (hsum : Summable r) :
    Summable (fockTermReal r) := by
  refine summable_of_sum_le (fun α ↦ Finset.prod_nonneg fun m _ ↦
    div_nonneg (pow_nonneg (hr m) _) (Nat.cast_nonneg _)) (c := Real.exp (∑' m, r m)) fun F ↦ ?_
  let N : ℕ := (F.biUnion Finsupp.support).sup id + 1
  have hsub : ∀ α ∈ F, α.support ⊆ Finset.range N := fun α hα m hm ↦
    Finset.mem_range.mpr (Nat.lt_succ_of_le (Finset.le_sup (f := id) (Finset.mem_biUnion.mpr ⟨α, hα, hm⟩)))
  have hhas := hasSum_fin_exp_real r hr N
  calc ∑ α ∈ F, fockTermReal r α
      = ∑ α ∈ F, ∏ i : Fin N, (r i.1) ^ (α i.1) / ((α i.1).factorial : ℝ) :=
        Finset.sum_congr rfl fun α hα ↦ fockTermReal_eq_finProd r (hsub α hα)
    _ = ∑ g ∈ F.image (fun α (i : Fin N) ↦ α i.1), ∏ i : Fin N, (r i.1) ^ (g i) / ((g i).factorial : ℝ) := by
        symm
        refine Finset.sum_image fun α₁ hα₁ α₂ hα₂ heq ↦ Finsupp.ext fun m ↦ ?_
        by_cases hm : m < N
        · exact congrFun heq ⟨m, hm⟩
        · rw [Finsupp.notMem_support_iff.mp fun h ↦ hm (Finset.mem_range.mp (hsub α₁ hα₁ h)),
            Finsupp.notMem_support_iff.mp fun h ↦ hm (Finset.mem_range.mp (hsub α₂ hα₂ h))]
    _ ≤ Real.exp (∑ i : Fin N, r i.1) :=
        (hhas.summable.sum_le_tsum _ fun g _ ↦ Finset.prod_nonneg fun i _ ↦
          div_nonneg (pow_nonneg (hr i.1) _) (Nat.cast_nonneg _)).trans_eq hhas.tsum_eq
    _ ≤ Real.exp (∑' m, r m) := Real.exp_le_exp.mpr <| by
        rw [← Finset.sum_range (f := r)]; exact hsum.sum_le_tsum (Finset.range N) (fun m _ ↦ hr m)

private lemma tsum_fockTerm (w : ℕ → ℂ) (hw : Summable (fun m ↦ ‖w m‖)) :
    ∑' α : ℕ →₀ ℕ, fockTerm w α = Complex.exp (∑' m, w m) := by
  have hnorm : Summable (fun α ↦ ‖fockTerm w α‖) := by
    have heq (α) : ‖fockTerm w α‖ = fockTermReal (fun m ↦ ‖w m‖) α := by
      unfold fockTerm fockTermReal; rw [norm_prod]; exact Finset.prod_congr rfl fun m _ ↦ by simp [norm_pow]
    simp_rw [heq]; exact summable_fockTermReal (fun m ↦ ‖w m‖) (fun _ ↦ norm_nonneg _) hw
  let S (N : ℕ) : Set (ℕ →₀ ℕ) := {α | α.support ⊆ Finset.range N}
  have hrange (N : ℕ) : Set.range (finToOcc (N := N)) = S N := Set.ext fun α ↦
    ⟨fun ⟨g, hg⟩ ↦ hg ▸ Finsupp.support_onFinset_subset, fun hα ↦ ⟨fun i ↦ α i.1, Finsupp.ext fun m ↦ by
      simp only [finToOcc, Finsupp.onFinset_apply]; split_ifs with hm
      · rfl
      · exact (Finsupp.notMem_support_iff.mp fun hmem ↦ hm (Finset.mem_range.mp (hα hmem))).symm⟩⟩
  have htrunc (N : ℕ) :
      ∑' α : ℕ →₀ ℕ, (S N).indicator (fockTerm w) α = Complex.exp (∑ m ∈ Finset.range N, w m) := by
    have hinj : Function.Injective (finToOcc (N := N)) := fun g₁ g₂ h ↦ funext fun i ↦ by
      simpa [finToOcc, i.2] using congrArg (fun α : ℕ →₀ ℕ ↦ α i.1) h
    have hsupp (g : Fin N → ℕ) : (finToOcc g).support ⊆ Finset.range N := Finsupp.support_onFinset_subset
    rw [← hinj.tsum_eq (Set.support_indicator_subset.trans (hrange N).symm.subset),
      show (fun g : Fin N → ℕ ↦ (S N).indicator (fockTerm w) (finToOcc g)) =
        fun g : Fin N → ℕ ↦ ∏ i : Fin N, (w i.1) ^ (g i) / ((g i).factorial : ℂ) from funext fun g ↦ by
          rw [Set.indicator_of_mem (hsupp g), fockTerm_eq_finProd w (hsupp g)]
          exact Finset.prod_congr rfl fun i _ ↦ by simp [finToOcc, i.2],
      (hasSum_fin_exp_complex w N).tsum_eq, Finset.sum_range]
  have ht1 : Tendsto (fun N : ℕ ↦ ∑' α : ℕ →₀ ℕ, (S N).indicator (fockTerm w) α)
      atTop (𝓝 (Complex.exp (∑' m, w m))) := by
    simp_rw [htrunc]; exact Complex.continuous_exp.continuousAt.tendsto.comp hw.of_norm.hasSum.tendsto_sum_nat
  have ht2 : Tendsto (fun N : ℕ ↦ ∑' α : ℕ →₀ ℕ, (S N).indicator (fockTerm w) α)
      atTop (𝓝 (∑' α : ℕ →₀ ℕ, fockTerm w α)) :=
    tendsto_tsum_of_dominated_convergence hnorm
      (fun α ↦ tendsto_const_nhds.congr' <| by
        filter_upwards [eventually_ge_atTop (α.support.sup id + 1)] with N hN
        have hmem : α ∈ S N := fun m hm ↦ Finset.mem_range.mpr
          (lt_of_lt_of_le (Nat.lt_succ_of_le (Finset.le_sup (f := id) hm)) hN)
        exact (Set.indicator_of_mem hmem (fockTerm w)).symm)
      (Eventually.of_forall fun N α ↦ by
        by_cases h : α ∈ S N <;> simp [Set.indicator_of_mem, Set.indicator_of_notMem, h, norm_nonneg])
  exact tendsto_nhds_unique ht2 ht1

/-- Every `ℓ²(ℕ, ℂ)` feature vector yields a square-summable occupation-number exponential vector. -/
theorem fockCoeff_memℓp (u : lp (fun _ : ℕ ↦ ℂ) 2) : Memℓp (fockCoeff u) 2 := by
  have h2 : (2 : ENNReal).toReal = 2 := by norm_num
  rw [memℓp_gen_iff (by norm_num : (0 : ℝ) < (2 : ENNReal).toReal), h2]
  have hnorm_sq (α : ℕ →₀ ℕ) : ‖fockCoeff u α‖ ^ (2 : ℝ) = fockTermReal (fun m ↦ ‖u m‖ ^ 2) α := by
    rw [Real.rpow_two, fockCoeff, norm_prod, ← Finset.prod_pow]; unfold fockTermReal
    refine Finset.prod_congr rfl fun m _ ↦ ?_
    rw [norm_div, norm_pow, Complex.norm_real, Real.norm_of_nonneg (Real.sqrt_nonneg _),
      div_pow, ← pow_mul, mul_comm (α m) 2, pow_mul, Real.sq_sqrt (Nat.cast_nonneg _)]
  simp_rw [hnorm_sq]
  exact summable_fockTermReal (fun m ↦ ‖u m‖ ^ 2) (fun _ ↦ sq_nonneg _)
    (by simpa using (lp.hasSum_norm (p := 2) (by norm_num) u).summable)

/-- Concrete occupation-number coherent Fock map `ε : ℓ²(ℕ, ℂ) → ℓ²(ℕ →₀ ℕ, ℂ)`. -/
noncomputable def coherentFock (u : lp (fun _ : ℕ ↦ ℂ) 2) : lp (fun _ : ℕ →₀ ℕ ↦ ℂ) 2 :=
  ⟨fockCoeff u, fockCoeff_memℓp u⟩

@[simp]
theorem coherentFock_apply (u : lp (fun _ : ℕ ↦ ℂ) 2) (α : ℕ →₀ ℕ) :
    coherentFock u α = ∏ m ∈ α.support, (u m) ^ (α m) / (Real.sqrt ((α m).factorial) : ℂ) := rfl

/-- Unconditional existence of the §3.1 exponential Gram realization on concrete Fock space:
`⟨ε(u), ε(v)⟩ = exp⟨u, v⟩` for all `u, v ∈ ℓ²(ℕ, ℂ)`. -/
theorem coherentFock_inner (u v : lp (fun _ : ℕ ↦ ℂ) 2) :
    inner ℂ (coherentFock u) (coherentFock v) = Complex.exp (inner ℂ u v) := by
  rw [lp.inner_eq_tsum, lp.inner_eq_tsum]
  have hterm (α : ℕ →₀ ℕ) :
      inner ℂ (coherentFock u α) (coherentFock v α) = fockTerm (fun m ↦ inner ℂ (u m) (v m)) α := by
    simp only [coherentFock_apply, RCLike.inner_apply, fockTerm, map_prod, ← Finset.prod_mul_distrib]
    refine Finset.prod_congr rfl fun m _ ↦ ?_
    simp only [map_div₀, map_pow, Complex.conj_ofReal]
    rw [div_mul_div_comm, ← mul_pow, mul_comm (v m), ← Complex.ofReal_mul, Real.mul_self_sqrt (Nat.cast_nonneg _)]
    push_cast; rfl
  have hw : Summable (fun m ↦ ‖inner ℂ (u m) (v m)‖) := by
    have hu : Summable (fun m ↦ ‖u m‖ ^ 2) := by simpa using (lp.hasSum_norm (p := 2) (by norm_num) u).summable
    have hv : Summable (fun m ↦ ‖v m‖ ^ 2) := by simpa using (lp.hasSum_norm (p := 2) (by norm_num) v).summable
    refine Summable.of_nonneg_of_le (fun _ ↦ norm_nonneg _) (fun m ↦ ?_) ((hu.add hv).div_const 2)
    have hcs : ‖inner ℂ (u m) (v m)‖ ≤ ‖u m‖ * ‖v m‖ := norm_inner_le_norm (u m) (v m)
    nlinarith [sq_nonneg (‖u m‖ - ‖v m‖)]
  simp_rw [hterm]
  exact tsum_fockTerm (fun m ↦ inner ℂ (u m) (v m)) hw

/-- Real-feature specialization: embedding `ℓ²(ℕ, ℝ)` into `ℓ²(ℕ, ℂ)` gives an explicit
Hilbert-space realization of the §3.1 real-feature Gram table `exp⟨u, v⟩_ℝ`. -/
noncomputable def coherentFockReal (u : lp (fun _ : ℕ ↦ ℝ) 2) : lp (fun _ : ℕ →₀ ℕ ↦ ℂ) 2 :=
  coherentFock ⟨fun m ↦ (u m : ℂ), by
    change Memℓp (fun m ↦ (u m : ℂ)) 2
    rw [memℓp_gen_iff (by norm_num : (0 : ℝ) < (2 : ENNReal).toReal)]
    simpa [Complex.norm_real] using (lp.hasSum_norm (p := 2) (by norm_num) u).summable⟩

theorem coherentFockReal_inner (u v : lp (fun _ : ℕ ↦ ℝ) 2) :
    inner ℂ (coherentFockReal u) (coherentFockReal v) = (Real.exp (inner ℝ u v) : ℂ) := by
  unfold coherentFockReal
  rw [coherentFock_inner, Complex.ofReal_exp]
  congr 1; rw [lp.inner_eq_tsum, lp.inner_eq_tsum, Complex.ofReal_tsum]
  exact tsum_congr fun m ↦ by simp [RCLike.inner_apply]

end CoherentFock

/-! ### §3.1 Continuum Feature Map `Jf` & Reflection Identity `C(θf̄, f') = ⟨Jf, Jf'⟩` -/
section ContinuumFeature

open MeasureTheory Set Filter
open scoped Topology

/-- Relativistic `d`-dimensional mass-shell dispersion `ω(k) = √(‖k‖² + m²)`. -/
noncomputable def modeDispersion {d : ℕ} (m : ℝ) (k : EuclideanSpace ℝ (Fin d)) : ℝ :=
  Real.sqrt (‖k‖ ^ 2 + m ^ 2)

lemma modeDispersion_pos {d : ℕ} {m : ℝ} (hm : 0 < m) (k : EuclideanSpace ℝ (Fin d)) :
    0 < modeDispersion m k :=
  Real.sqrt_pos.mpr (by positivity)

/-- Continuum positive-half-space feature map `Jf(k) = √(ħ / (2 ω(k))) ∫_{s > 0} e^{-s ω(k)} f̂(s, k) ds`. -/
noncomputable def featureMap {d : ℕ} (ħ m : ℝ)
    (fhat : ℝ → EuclideanSpace ℝ (Fin d) → ℂ) (k : EuclideanSpace ℝ (Fin d)) : ℂ :=
  ((Real.sqrt (ħ / (2 * modeDispersion m k)) : ℝ) : ℂ) *
    ∫ s in Ioi (0 : ℝ), ((Real.exp (-s * modeDispersion m k) : ℝ) : ℂ) * fhat s k

/-- Continuum reflected Euclidean covariance on positive-half-space tests. -/
noncomputable def reflectedCov {d : ℕ} (ħ m : ℝ)
    (fhat ghat : ℝ → EuclideanSpace ℝ (Fin d) → ℂ) : ℂ :=
  ∫ k, ∫ s in Ioi (0 : ℝ), ∫ t in Ioi (0 : ℝ),
    star (fhat s k) * ghat t k *
      ((ħ * Real.exp (-(s + t) * modeDispersion m k) / (2 * modeDispersion m k) : ℝ) : ℂ)

/-- §3.1 factorization of the reflected half-space kernel `ħ e^{-ω(s+t)} / (2ω)` as
`⟨Jf, Jf'⟩_𝔥`, the identity `C(θf̄, f') = ⟨Jf, Jf'⟩_𝔥` of (7) once the normal Fourier integral
(`expKernel_fourier`) is done. -/
theorem reflectedCov_eq_feature_inner {d : ℕ} {ħ m : ℝ} (hħ : 0 ≤ ħ) (hm : 0 < m)
    (fhat ghat : ℝ → EuclideanSpace ℝ (Fin d) → ℂ) :
    reflectedCov ħ m fhat ghat =
      ∫ k, star (featureMap ħ m fhat k) * featureMap ħ m ghat k := by
  unfold reflectedCov featureMap
  refine integral_congr_ae (Eventually.of_forall fun k => ?_)
  dsimp only
  set ω : ℝ := modeDispersion m k
  have hω : 0 < ω := modeDispersion_pos hm k
  have hfrac_nn : 0 ≤ ħ / (2 * ω) := div_nonneg hħ (by positivity)
  set c : ℂ := ((Real.sqrt (ħ / (2 * ω)) : ℝ) : ℂ)
  have hc_sq : c * c = ((ħ / (2 * ω) : ℝ) : ℂ) := by
    dsimp [c]
    rw [← Complex.ofReal_mul, Real.mul_self_sqrt hfrac_nn]
  have hinner (s : ℝ) :
      (∫ t in Ioi (0 : ℝ),
        star (fhat s k) * ghat t k *
          ((ħ * Real.exp (-(s + t) * ω) / (2 * ω) : ℝ) : ℂ)) =
      (((ħ / (2 * ω) : ℝ) : ℂ) * (((Real.exp (-s * ω) : ℝ) : ℂ) * star (fhat s k))) *
        ∫ t in Ioi (0 : ℝ), ((Real.exp (-t * ω) : ℝ) : ℂ) * ghat t k := by
    rw [← integral_const_mul]
    refine setIntegral_congr_fun measurableSet_Ioi fun t _ => ?_
    have hexp : Real.exp (-(s + t) * ω) = Real.exp (-s * ω) * Real.exp (-t * ω) := by
      rw [← Real.exp_add]; congr 1; ring
    rw [hexp, mul_div_right_comm]
    push_cast
    ring
  rw [setIntegral_congr_fun measurableSet_Ioi fun s _ => hinner s]
  rw [integral_mul_const, integral_const_mul, ← hc_sq]
  have hconj :
      (∫ s in Ioi (0 : ℝ), ((Real.exp (-s * ω) : ℝ) : ℂ) * star (fhat s k)) =
        star (∫ s in Ioi (0 : ℝ), ((Real.exp (-s * ω) : ℝ) : ℂ) * fhat s k) := by
    have hpt :
        (fun s : ℝ => ((Real.exp (-s * ω) : ℝ) : ℂ) * star (fhat s k)) =
          fun s : ℝ => (starRingEnd ℂ) (((Real.exp (-s * ω) : ℝ) : ℂ) * fhat s k) := by
      funext s
      rw [map_mul, Complex.conj_ofReal, RCLike.star_def]
    rw [hpt, integral_conj, RCLike.star_def]
  rw [hconj, star_mul', RCLike.star_def, show (starRingEnd ℂ) c = c from Complex.conj_ofReal _]
  ring

/-- §3.1 dense-range positivity step: the Laplace transform of any continuous nonnegative
nontrivial bump on `(0, ∞)` is strictly positive for all `ω > 0`. -/
theorem laplace_pos_of_nonneg_bump {φ : ℝ → ℝ} (hcont : Continuous φ)
    (hnn : ∀ s, 0 ≤ φ s) (hpos : ∃ s > 0, 0 < φ s)
    (hint : IntegrableOn φ (Ioi (0 : ℝ))) {ω : ℝ} (hω : 0 < ω) :
    0 < ∫ s in Ioi (0 : ℝ), Real.exp (-s * ω) * φ s := by
  let g : ℝ → ℝ := fun s => Real.exp (-s * ω) * φ s
  have hg_cont : Continuous g :=
    (Real.continuous_exp.comp (continuous_id.neg.mul continuous_const)).mul hcont
  have hg_nn : ∀ s, 0 ≤ g s := fun s => mul_nonneg (Real.exp_nonneg _) (hnn s)
  have hg_int : IntegrableOn g (Ioi (0 : ℝ)) := by
    refine hint.mono' hg_cont.aestronglyMeasurable ?_
    filter_upwards [ae_restrict_mem measurableSet_Ioi] with s hs
    have hs_pos : 0 < s := hs
    have hexp_le : Real.exp (-s * ω) ≤ 1 := Real.exp_le_one_iff.mpr (by nlinarith)
    rw [Real.norm_of_nonneg (hg_nn s)]
    calc Real.exp (-s * ω) * φ s ≤ 1 * φ s :=
          mul_le_mul_of_nonneg_right hexp_le (hnn s)
      _ = φ s := one_mul _
  rw [setIntegral_pos_iff_support_of_nonneg_ae (Eventually.of_forall hg_nn) hg_int]
  obtain ⟨s₀, hs₀, hφ₀⟩ := hpos
  have hopen : IsOpen ({s : ℝ | 0 < g s} ∩ Ioi (0 : ℝ)) :=
    (isOpen_lt continuous_const hg_cont).inter isOpen_Ioi
  have hmem : s₀ ∈ {s : ℝ | 0 < g s} ∩ Ioi (0 : ℝ) :=
    ⟨mul_pos (Real.exp_pos _) hφ₀, hs₀⟩
  have hsub : {s : ℝ | 0 < g s} ∩ Ioi (0 : ℝ) ⊆ Function.support g ∩ Ioi (0 : ℝ) :=
    fun s hs => ⟨ne_of_gt hs.1, hs.2⟩
  exact (hopen.measure_pos volume ⟨s₀, hmem⟩).trans_le (measure_mono hsub)

end ContinuumFeature

/-! ### §3.1 & §3.3 Creation/Annihilation `c*(u), c(v)`, CCR, Field `Φ(f)`, & Cyclic Vacuum -/
section FockOperators

open scoped BigOperators

/-- Finite-particle occupation-number Fock space `FockFin := (ℕ →₀ ℕ) →₀ ℂ`. -/
abbrev FockFin := (ℕ →₀ ℕ) →₀ ℂ

/-- Fock vacuum vector `|0⟩`. -/
noncomputable def fockVac : FockFin := Finsupp.single 0 1

/-- Conjugate-linear-in-first-argument inner product on `FockFin`. -/
def fockFinInner (ψ φ : FockFin) : ℂ :=
  ψ.sum fun α c => star c * φ α

/-- Conjugate-linear-in-first-argument inner product on finitely supported mode vectors `ℕ →₀ ℂ`. -/
def modeInner (v u : ℕ →₀ ℂ) : ℂ :=
  v.sum fun m c => star c * u m

@[simp]
lemma fockFinInner_zero_left (φ : FockFin) : fockFinInner 0 φ = 0 := by
  simp [fockFinInner]

@[simp]
lemma fockFinInner_zero_right (ψ : FockFin) : fockFinInner ψ 0 = 0 := by
  simp [fockFinInner]

lemma fockFinInner_add_left (ψ₁ ψ₂ φ : FockFin) :
    fockFinInner (ψ₁ + ψ₂) φ = fockFinInner ψ₁ φ + fockFinInner ψ₂ φ := by
  unfold fockFinInner
  exact Finsupp.sum_add_index' (fun _ => by simp) (fun _ _ _ => by simp [add_mul])

lemma fockFinInner_add_right (ψ φ₁ φ₂ : FockFin) :
    fockFinInner ψ (φ₁ + φ₂) = fockFinInner ψ φ₁ + fockFinInner ψ φ₂ := by
  unfold fockFinInner
  simp only [Finsupp.coe_add, Pi.add_apply, mul_add]
  exact Finset.sum_add_distrib

lemma fockFinInner_smul_left (c : ℂ) (ψ φ : FockFin) :
    fockFinInner (c • ψ) φ = star c * fockFinInner ψ φ := by
  unfold fockFinInner
  rw [Finsupp.sum_smul_index' (fun _ => by simp), Finsupp.mul_sum]
  refine Finset.sum_congr rfl fun α _ => ?_
  simp only [smul_eq_mul, star_mul', mul_assoc]

lemma fockFinInner_smul_right (c : ℂ) (ψ φ : FockFin) :
    fockFinInner ψ (c • φ) = c * fockFinInner ψ φ := by
  unfold fockFinInner
  rw [Finsupp.mul_sum]
  refine Finset.sum_congr rfl fun α _ => ?_
  simp only [Finsupp.coe_smul, Pi.smul_apply, smul_eq_mul]
  ring

lemma fockFinInner_sum_left {ι : Type*} (s : Finset ι) (f : ι → FockFin) (φ : FockFin) :
    fockFinInner (∑ i ∈ s, f i) φ = ∑ i ∈ s, fockFinInner (f i) φ := by
  classical
  induction s using Finset.induction_on with
  | empty => simp
  | insert a s ha ih => rw [Finset.sum_insert ha, fockFinInner_add_left, ih, Finset.sum_insert ha]

lemma fockFinInner_sum_right {ι : Type*} (s : Finset ι) (ψ : FockFin) (f : ι → FockFin) :
    fockFinInner ψ (∑ i ∈ s, f i) = ∑ i ∈ s, fockFinInner ψ (f i) := by
  classical
  induction s using Finset.induction_on with
  | empty => simp
  | insert a s ha ih => rw [Finset.sum_insert ha, fockFinInner_add_right, ih, Finset.sum_insert ha]

lemma fockFinInner_single_left (α : ℕ →₀ ℕ) (c : ℂ) (φ : FockFin) :
    fockFinInner (Finsupp.single α c) φ = star c * φ α := by
  unfold fockFinInner
  exact Finsupp.sum_single_index (by simp)

lemma fockFin_eq_of_inner_eq {φ₁ φ₂ : FockFin}
    (h : ∀ ψ : FockFin, fockFinInner ψ φ₁ = fockFinInner ψ φ₂) : φ₁ = φ₂ := by
  ext α
  simpa [fockFinInner_single_left] using h (Finsupp.single α 1)

/-- Single-mode creation operator `a*_m` on `FockFin`. -/
noncomputable def modeCreate (m : ℕ) : FockFin →ₗ[ℂ] FockFin :=
  Finsupp.lsum ℂ fun α =>
    LinearMap.toSpanSingleton ℂ FockFin
      ((Real.sqrt ((α m + 1 : ℕ) : ℝ) : ℂ) • Finsupp.single (α + Finsupp.single m 1) 1)

/-- Single-mode annihilation operator `a_m` on `FockFin`. -/
noncomputable def modeAnnihil (m : ℕ) : FockFin →ₗ[ℂ] FockFin :=
  Finsupp.lsum ℂ fun α =>
    LinearMap.toSpanSingleton ℂ FockFin
      (if α m = 0 then 0
       else (Real.sqrt ((α m : ℕ) : ℝ) : ℂ) • Finsupp.single (α - Finsupp.single m 1) 1)

@[simp]
lemma modeCreate_single (m : ℕ) (α : ℕ →₀ ℕ) (c : ℂ) :
    modeCreate m (Finsupp.single α c) =
      (c * (Real.sqrt ((α m + 1 : ℕ) : ℝ) : ℂ)) • Finsupp.single (α + Finsupp.single m 1) 1 := by
  simp [modeCreate, mul_smul]

@[simp]
lemma modeAnnihil_single (m : ℕ) (α : ℕ →₀ ℕ) (c : ℂ) :
    modeAnnihil m (Finsupp.single α c) =
      if α m = 0 then 0
      else (c * (Real.sqrt ((α m : ℕ) : ℝ) : ℂ)) • Finsupp.single (α - Finsupp.single m 1) 1 := by
  unfold modeAnnihil
  simp only [Finsupp.lsum_single, LinearMap.toSpanSingleton_apply]
  split_ifs <;> simp [mul_smul]

private lemma modeCreate_adjoint (m : ℕ) (ψ φ : FockFin) :
    fockFinInner (modeCreate m ψ) φ = fockFinInner ψ (modeAnnihil m φ) := by
  induction ψ using Finsupp.induction_linear with
  | zero => simp
  | add ψ₁ ψ₂ ih₁ ih₂ =>
    rw [map_add, fockFinInner_add_left, fockFinInner_add_left, ih₁, ih₂]
  | single α a =>
    induction φ using Finsupp.induction_linear with
    | zero => simp
    | add φ₁ φ₂ ih₁ ih₂ =>
      rw [map_add, fockFinInner_add_right, fockFinInner_add_right, ih₁, ih₂]
    | single β b =>
      simp only [modeCreate_single, modeAnnihil_single, fockFinInner_smul_left,
        fockFinInner_single_left, star_one, one_mul, star_mul', RCLike.star_def,
        Complex.conj_ofReal]
      split_ifs with hβ
      · simp only [Finsupp.coe_zero, Pi.zero_apply, mul_zero]
        have hne : β ≠ α + Finsupp.single m 1 := fun h => by
          have := congrArg (fun f : ℕ →₀ ℕ => f m) h
          simp [hβ] at this
        simp [hne]
      · simp only [Finsupp.coe_smul, Pi.smul_apply, smul_eq_mul, Finsupp.single_apply]
        by_cases heq : β = α + Finsupp.single m 1
        · subst heq
          have hsub : α + Finsupp.single m 1 - Finsupp.single m 1 = α := by
            ext k; simp
          simp [hsub]
          ring
        · have hsub_ne : β - Finsupp.single m 1 ≠ α := fun h => by
            apply heq
            ext k
            have hk := congrArg (fun f : ℕ →₀ ℕ => f k) h
            by_cases hkm : k = m
            · subst hkm
              simp only [Finsupp.coe_tsub, Finsupp.coe_add, Pi.sub_apply, Pi.add_apply,
                Finsupp.single_eq_same] at hk ⊢
              omega
            · simp only [Finsupp.coe_tsub, Finsupp.coe_add, Pi.sub_apply, Pi.add_apply,
                Finsupp.single_eq_of_ne hkm, tsub_zero, add_zero] at hk ⊢
              exact hk
          simp [heq, hsub_ne]

private lemma modeCreate_comm (m n : ℕ) (ψ : FockFin) :
    modeCreate m (modeCreate n ψ) = modeCreate n (modeCreate m ψ) := by
  induction ψ using Finsupp.induction_linear with
  | zero => simp
  | add ψ₁ ψ₂ ih₁ ih₂ => simp [ih₁, ih₂]
  | single α a =>
    by_cases hmn : m = n
    · subst hmn; rfl
    · simp only [modeCreate_single, map_smul, smul_smul, Finsupp.coe_add, Pi.add_apply,
        Finsupp.single_eq_of_ne hmn, Finsupp.single_eq_of_ne (Ne.symm hmn), add_zero]
      rw [add_right_comm α (Finsupp.single n 1) (Finsupp.single m 1)]
      congr 1
      ring

private lemma modeAnnihil_comm (m n : ℕ) (ψ : FockFin) :
    modeAnnihil m (modeAnnihil n ψ) = modeAnnihil n (modeAnnihil m ψ) := by
  refine fockFin_eq_of_inner_eq fun φ => ?_
  rw [← modeCreate_adjoint, ← modeCreate_adjoint, modeCreate_comm,
    modeCreate_adjoint, modeCreate_adjoint]

private lemma mode_ccr (m n : ℕ) (ψ : FockFin) :
    modeAnnihil m (modeCreate n ψ) - modeCreate n (modeAnnihil m ψ) =
      (if m = n then (1 : ℂ) else 0) • ψ := by
  induction ψ using Finsupp.induction_linear with
  | zero => simp
  | add ψ₁ ψ₂ ih₁ ih₂ =>
    rw [map_add, map_add, map_add, map_add, smul_add, ← ih₁, ← ih₂]
    abel
  | single α a =>
    by_cases hmn : m = n
    · subst hmn
      have hsub : α + Finsupp.single m (1 : ℕ) - Finsupp.single m 1 = α := by ext k; simp
      have hsq1 : (Real.sqrt ((α m + 1 : ℕ) : ℝ) : ℂ) * (Real.sqrt ((α m + 1 : ℕ) : ℝ) : ℂ) =
          ((α m + 1 : ℕ) : ℂ) := by
        rw [← Complex.ofReal_mul, Real.mul_self_sqrt (by positivity)]; push_cast; rfl
      simp only [↓reduceIte, one_smul, modeCreate_single, modeAnnihil_single, map_smul,
        Finsupp.coe_add, Pi.add_apply, Finsupp.single_eq_same, Nat.succ_ne_zero, hsub, one_mul]
      split_ifs with hα
      · simp only [hα, zero_add, Nat.cast_one, Real.sqrt_one, Complex.ofReal_one, mul_one,
          map_zero, sub_zero, Finsupp.smul_single, smul_eq_mul]
      · have hadd : α - Finsupp.single m (1 : ℕ) + Finsupp.single m 1 = α := by
          ext k
          by_cases hk : k = m
          · subst hk; simp only [Finsupp.coe_add, Finsupp.coe_tsub, Pi.add_apply, Pi.sub_apply,
              Finsupp.single_eq_same]; omega
          · simp [Finsupp.single_eq_of_ne hk]
        have hval : (α - Finsupp.single m (1 : ℕ)) m + 1 = α m := by
          simp only [Finsupp.coe_tsub, Pi.sub_apply, Finsupp.single_eq_same]; omega
        have hsq0 : (Real.sqrt ((α m : ℕ) : ℝ) : ℂ) * (Real.sqrt ((α m : ℕ) : ℝ) : ℂ) =
            ((α m : ℕ) : ℂ) := by
          rw [← Complex.ofReal_mul, Real.mul_self_sqrt (by positivity)]; push_cast; rfl
        simp only [map_smul, modeCreate_single, hval, hadd, smul_smul, one_mul]
        rw [← sub_smul, Finsupp.smul_single, smul_eq_mul, mul_one]
        congr 1
        have h1 : a * (Real.sqrt ((α m + 1 : ℕ) : ℝ) : ℂ) * (Real.sqrt ((α m + 1 : ℕ) : ℝ) : ℂ) =
            a * ((α m + 1 : ℕ) : ℂ) := by rw [mul_assoc, hsq1]
        have h2 : a * (Real.sqrt ((α m : ℕ) : ℝ) : ℂ) * (Real.sqrt ((α m : ℕ) : ℝ) : ℂ) =
            a * ((α m : ℕ) : ℂ) := by rw [mul_assoc, hsq0]
        rw [h1, h2]
        push_cast
        ring
    · have hne_val : (α + Finsupp.single n (1 : ℕ)) m = α m := by
        simp [Finsupp.single_eq_of_ne hmn]
      simp only [hmn, ↓reduceIte, zero_smul, modeCreate_single, modeAnnihil_single, map_smul,
        hne_val]
      split_ifs with hα
      · simp
      · have hcomm_sub : α + Finsupp.single n (1 : ℕ) - Finsupp.single m 1 =
            α - Finsupp.single m 1 + Finsupp.single n 1 := by
          ext k
          by_cases hkm : k = m
          · subst hkm
            simp only [Finsupp.coe_tsub, Finsupp.coe_add, Pi.sub_apply, Pi.add_apply,
              Finsupp.single_eq_same, Finsupp.single_eq_of_ne hmn, add_zero]
          · by_cases hkn : k = n
            · subst hkn
              simp [Finsupp.single_eq_of_ne (Ne.symm hmn)]
            · simp [Finsupp.single_eq_of_ne hkm, Finsupp.single_eq_of_ne hkn]
        have hn_val : (α - Finsupp.single m (1 : ℕ)) n = α n := by
          simp [Finsupp.single_eq_of_ne (Ne.symm hmn)]
        simp only [map_smul, modeCreate_single, hn_val, hcomm_sub, smul_smul, one_mul]
        rw [← sub_smul]
        have hzero :
            a * (Real.sqrt ((α n + 1 : ℕ) : ℝ) : ℂ) * (Real.sqrt ((α m : ℕ) : ℝ) : ℂ) -
              a * (Real.sqrt ((α m : ℕ) : ℝ) : ℂ) * (Real.sqrt ((α n + 1 : ℕ) : ℝ) : ℂ) = 0 := by
          ring
        rw [hzero, zero_smul]

/-- Smeared bosonic creation operator `c*(u) = ∑_m u_m a*_m` on `FockFin`. -/
noncomputable def fockCreate (u : ℕ →₀ ℂ) : FockFin →ₗ[ℂ] FockFin :=
  u.sum fun m c => c • modeCreate m

/-- Smeared bosonic annihilation operator `c(u) = ∑_m ū_m a_m` on `FockFin`. -/
noncomputable def fockAnnihil (u : ℕ →₀ ℂ) : FockFin →ₗ[ℂ] FockFin :=
  u.sum fun m c => (star c) • modeAnnihil m

/-- Bosonic quantum field operator `Φ(f) = c*(u_f) + c(u_{f̄})` on `FockFin`. -/
noncomputable def fockField (u ubar : ℕ →₀ ℂ) : FockFin →ₗ[ℂ] FockFin :=
  fockCreate u + fockAnnihil ubar

lemma fockCreate_apply (u : ℕ →₀ ℂ) (ψ : FockFin) :
    fockCreate u ψ = ∑ m ∈ u.support, u m • modeCreate m ψ := by
  unfold fockCreate Finsupp.sum
  simp [LinearMap.sum_apply]

lemma fockAnnihil_apply (u : ℕ →₀ ℂ) (ψ : FockFin) :
    fockAnnihil u ψ = ∑ m ∈ u.support, star (u m) • modeAnnihil m ψ := by
  unfold fockAnnihil Finsupp.sum
  simp [LinearMap.sum_apply]

/-- Annihilation operators kill the Fock vacuum: `c(u)|0⟩ = 0`. -/
theorem fockAnnihil_vacuum (u : ℕ →₀ ℂ) : fockAnnihil u fockVac = 0 := by
  rw [fockAnnihil_apply]
  refine Finset.sum_eq_zero fun m _ => ?_
  simp [fockVac]

/-- Creation and annihilation are formal adjoints on `FockFin`. -/
theorem fockCreate_adjoint (u : ℕ →₀ ℂ) (ψ φ : FockFin) :
    fockFinInner (fockCreate u ψ) φ = fockFinInner ψ (fockAnnihil u φ) := by
  rw [fockCreate_apply, fockAnnihil_apply, fockFinInner_sum_left, fockFinInner_sum_right]
  refine Finset.sum_congr rfl fun m _ => ?_
  rw [fockFinInner_smul_left, fockFinInner_smul_right, modeCreate_adjoint]

private lemma fockCreate_comm (u v : ℕ →₀ ℂ) (ψ : FockFin) :
    fockCreate u (fockCreate v ψ) = fockCreate v (fockCreate u ψ) := by
  simp only [fockCreate_apply, map_sum, map_smul, Finset.smul_sum, smul_smul]
  rw [Finset.sum_comm]
  refine Finset.sum_congr rfl fun m _ => Finset.sum_congr rfl fun n _ => ?_
  rw [mul_comm, modeCreate_comm]

private lemma fockAnnihil_comm (u v : ℕ →₀ ℂ) (ψ : FockFin) :
    fockAnnihil u (fockAnnihil v ψ) = fockAnnihil v (fockAnnihil u ψ) := by
  simp only [fockAnnihil_apply, map_sum, map_smul, Finset.smul_sum, smul_smul]
  rw [Finset.sum_comm]
  refine Finset.sum_congr rfl fun m _ => Finset.sum_congr rfl fun n _ => ?_
  rw [mul_comm, modeAnnihil_comm]

/-- Canonical commutation relations `[c(v), c*(u)] = ⟨v, u⟩ I` on `FockFin`. -/
theorem fock_ccr (u v : ℕ →₀ ℂ) (ψ : FockFin) :
    fockAnnihil v (fockCreate u ψ) - fockCreate u (fockAnnihil v ψ) =
      modeInner v u • ψ := by
  simp only [fockAnnihil_apply, fockCreate_apply, map_sum, map_smul, Finset.smul_sum, smul_smul]
  rw [Finset.sum_comm (s := u.support) (t := v.support), ← Finset.sum_sub_distrib]
  have hterm (m : ℕ) :
      (∑ n ∈ u.support, (u n * star (v m)) • modeAnnihil m (modeCreate n ψ)) -
        (∑ n ∈ u.support, (star (v m) * u n) • modeCreate n (modeAnnihil m ψ)) =
      (star (v m) * u m) • ψ := by
    rw [← Finset.sum_sub_distrib]
    have hpt (n : ℕ) :
        (u n * star (v m)) • modeAnnihil m (modeCreate n ψ) -
          (star (v m) * u n) • modeCreate n (modeAnnihil m ψ) =
        if m = n then (star (v m) * u n) • ψ else 0 := by
      rw [mul_comm (u n) (star (v m)), ← smul_sub, mode_ccr, smul_smul]
      split_ifs <;> simp
    simp_rw [hpt]
    by_cases hm : m ∈ u.support
    · simp only [Finset.sum_ite_eq, hm, ↓reduceIte]
    · simp only [Finset.sum_ite_eq, hm, ↓reduceIte, Finsupp.notMem_support_iff.mp hm, mul_zero,
        zero_smul]
  rw [Finset.sum_congr rfl fun m _ => hterm m, ← Finset.sum_smul]
  rfl

/-- Exact §3.3 field commutator `[Φ(f), Φ(f')] = (⟨u_{f̄}, u_{f'}⟩ - ⟨u_{f̄'}, u_f⟩) I`. -/
theorem fockField_commutator (u ubar v vbar : ℕ →₀ ℂ) (ψ : FockFin) :
    fockField u ubar (fockField v vbar ψ) - fockField v vbar (fockField u ubar ψ) =
      (modeInner ubar v - modeInner vbar u) • ψ := by
  have h1 := fockCreate_comm u v ψ
  have h2 := fockAnnihil_comm ubar vbar ψ
  have h3 := fock_ccr v ubar ψ
  have h4 := fock_ccr u vbar ψ
  simp only [fockField, LinearMap.add_apply, map_add, sub_smul]
  rw [← h3, ← h4, h1, h2]
  abel

/-- Hermitian symmetry of `Φ(f)` for real tests (`u_{f̄} = u_f`). -/
theorem fockField_symm (u : ℕ →₀ ℂ) (ψ φ : FockFin) :
    fockFinInner (fockField u u ψ) φ = fockFinInner ψ (fockField u u φ) := by
  simp only [fockField, LinearMap.add_apply, fockFinInner_add_left, fockFinInner_add_right,
    fockCreate_adjoint]
  have hadj : fockFinInner (fockAnnihil u ψ) φ = fockFinInner ψ (fockCreate u φ) := by
    have hsym (a b : FockFin) : fockFinInner a b = star (fockFinInner b a) := by
      induction a using Finsupp.induction_linear with
      | zero => simp
      | add a₁ a₂ ih₁ ih₂ => rw [fockFinInner_add_left, fockFinInner_add_right, star_add, ih₁, ih₂]
      | single α x =>
        induction b using Finsupp.induction_linear with
        | zero => simp
        | add b₁ b₂ ih₁ ih₂ => rw [fockFinInner_add_right, fockFinInner_add_left, star_add, ih₁, ih₂]
        | single β y =>
          simp only [fockFinInner_single_left, Finsupp.single_apply, star_mul']
          by_cases h : α = β
          · subst h; simp [mul_comm]
          · simp [h, Ne.symm h]
    rw [hsym (fockAnnihil u ψ) φ, ← fockCreate_adjoint, ← hsym]
  rw [hadj, add_comm]

/-- Cyclicity of the Fock vacuum: every basis state `|α⟩` is a nonzero scalar multiple
of iterated single-mode creation operators applied to `fockVac`. -/
theorem fockVacuum_cyclic (α : ℕ →₀ ℕ) :
    ∃ (L : List ℕ) (c : ℂ), c ≠ 0 ∧
      Finsupp.single α (1 : ℂ) =
        c • L.foldl (fun ψ m => fockCreate (Finsupp.single m 1) ψ) fockVac := by
  suffices ∀ n : ℕ, ∀ α : ℕ →₀ ℕ, α.sum (fun _ k => k) = n →
      ∃ (L : List ℕ) (c : ℂ), c ≠ 0 ∧
        Finsupp.single α (1 : ℂ) =
          c • L.foldl (fun ψ m => fockCreate (Finsupp.single m 1) ψ) fockVac from
    this (α.sum fun _ k => k) α rfl
  intro n
  induction n with
  | zero =>
    intro α hα
    have h0 : α = 0 := by
      ext m
      by_contra hm
      have hmem : m ∈ α.support := Finsupp.mem_support_iff.mpr hm
      have hpos : 0 < α.sum fun _ k => k :=
        Finset.sum_pos' (fun _ _ => Nat.zero_le _) ⟨m, hmem, Nat.pos_of_ne_zero hm⟩
      omega
    subst h0
    exact ⟨[], 1, one_ne_zero, by simp [fockVac]⟩
  | succ n ih =>
    intro α hα
    have hne : α ≠ 0 := fun h => by simp [h] at hα
    obtain ⟨m, hm⟩ : α.support.Nonempty := Finsupp.support_nonempty_iff.mpr hne
    have hm_pos : 0 < α m := Nat.pos_of_ne_zero (Finsupp.mem_support_iff.mp hm)
    let β : ℕ →₀ ℕ := α - Finsupp.single m 1
    have hβ_add : β + Finsupp.single m 1 = α := by
      ext k
      by_cases hk : k = m
      · subst hk; simp only [β, Finsupp.coe_add, Finsupp.coe_tsub, Pi.add_apply, Pi.sub_apply,
          Finsupp.single_eq_same]; omega
      · simp [β, Finsupp.single_eq_of_ne hk]
    have hβ_sum : β.sum (fun _ k => k) = n := by
      have hadd := Finsupp.sum_add_index' (f := β) (g := Finsupp.single m 1)
        (h := fun (_ : ℕ) (k : ℕ) => k) (fun _ => rfl) (fun _ _ _ => rfl)
      rw [hβ_add, hα, Finsupp.sum_single_index rfl] at hadd
      omega
    obtain ⟨L, c, hc, hL⟩ := ih β hβ_sum
    have hcreate_single (ψ : FockFin) :
        fockCreate (Finsupp.single m 1) ψ = modeCreate m ψ := by
      rw [fockCreate_apply]
      simp
    have hstep := congrArg (fockCreate (Finsupp.single m 1)) hL
    rw [hcreate_single, modeCreate_single, one_mul, map_smul, hβ_add] at hstep
    have hβm : β m + 1 = α m := by
      simp only [β, Finsupp.coe_tsub, Pi.sub_apply, Finsupp.single_eq_same]; omega
    rw [hβm] at hstep
    set r : ℂ := (Real.sqrt ((α m : ℕ) : ℝ) : ℂ)
    have hr : r ≠ 0 := by
      dsimp [r]
      exact Complex.ofReal_ne_zero.mpr (ne_of_gt (Real.sqrt_pos.mpr (Nat.cast_pos.mpr hm_pos)))
    refine ⟨L ++ [m], r⁻¹ * c, mul_ne_zero (inv_ne_zero hr) hc, ?_⟩
    rw [List.foldl_append, List.foldl_cons, List.foldl_nil, mul_smul, ← hstep, smul_smul,
      inv_mul_cancel₀ hr, one_smul]

end FockOperators

end States

/-! ### §3.1 Schwartz Feature Density & Real-to-Complex Span Bridge -/
section SchwartzFeatureDensity

open MeasureTheory Set FourierTransform
open scoped ENNReal ComplexConjugate Topology

namespace FeatureDensity

variable {Ω : Type*} [MeasurableSpace Ω] {ν : Measure Ω}

/-- Bounded complex `L^∞` multiplication operator on `Lp ℂ 2 ν` via Hölder multiplication. -/
noncomputable def complexMultiplier (φ : Ω → ℂ) (hφ : MemLp φ (⊤ : ENNReal) ν) :
    Lp ℂ 2 ν →L[ℂ] Lp ℂ 2 ν :=
  (ContinuousLinearMap.mul ℂ ℂ).holderL ν (⊤ : ENNReal) 2 2 (hφ.toLp φ)

theorem complexMultiplier_apply_ae (φ : Ω → ℂ) (hφ : MemLp φ (⊤ : ENNReal) ν) (v : Lp ℂ 2 ν) :
    (complexMultiplier φ hφ v : Ω → ℂ) =ᵐ[ν] fun x ↦ φ x * v x := by
  let w := hφ.toLp φ
  have hm : (complexMultiplier φ hφ v : Ω → ℂ) =ᵐ[ν] fun x ↦ w x * v x :=
    (ContinuousLinearMap.mul ℂ ℂ).coeFn_holder (r := 2) w v
  filter_upwards [hm, hφ.coeFn_toLp] with x hx hw
  exact hx.trans (congrArg (fun c : ℂ ↦ c * v x) hw)

theorem l2_norm_sq_eq_integral (w : Lp ℂ 2 ν) :
    ‖w‖ ^ 2 = ∫ x, ‖w x‖ ^ 2 ∂ν := by
  have h : (inner ℂ w w).re = Complex.reCLM (∫ x, inner ℂ (w x) (w x) ∂ν) :=
    congrArg Complex.re (L2.inner_def w w)
  rw [← Complex.reCLM.integral_comp_comm (L2.integrable_inner (𝕜 := ℂ) w w)] at h
  have h1 : (inner ℂ w w).re = ‖w‖ ^ 2 := by
    simpa only [RCLike.re_to_complex] using (inner_self_eq_norm_sq (𝕜 := ℂ) w)
  rw [h1] at h
  rw [h]
  refine integral_congr_ae (ae_of_all _ fun x ↦ ?_)
  dsimp only
  rw [Complex.reCLM_apply]
  simpa only [RCLike.re_to_complex] using (inner_self_eq_norm_sq (𝕜 := ℂ) (w x))

theorem complexMultiplier_norm_le (φ : Ω → ℂ) (hφ : MemLp φ (⊤ : ENNReal) ν)
    {C : ℝ} (hC_nn : 0 ≤ C) (hC : ∀ x, ‖φ x‖ ≤ C) (v : Lp ℂ 2 ν) :
    ‖complexMultiplier φ hφ v‖ ≤ C * ‖v‖ := by
  set u := complexMultiplier φ hφ v
  have hu_int : Integrable (fun x ↦ ‖u x‖ ^ 2) ν :=
    (memLp_two_iff_integrable_sq_norm (Lp.aestronglyMeasurable u)).mp (Lp.memLp u)
  have hv_int : Integrable (fun x ↦ ‖v x‖ ^ 2) ν :=
    (memLp_two_iff_integrable_sq_norm (Lp.aestronglyMeasurable v)).mp (Lp.memLp v)
  have hsq : ‖u‖ ^ 2 ≤ (C * ‖v‖) ^ 2 := by
    rw [l2_norm_sq_eq_integral u, mul_pow, l2_norm_sq_eq_integral v, ← integral_const_mul]
    refine integral_mono_ae hu_int (hv_int.const_mul (C ^ 2)) ?_
    filter_upwards [complexMultiplier_apply_ae φ hφ v] with x hx
    rw [hx, norm_mul, mul_pow]
    exact mul_le_mul_of_nonneg_right
      (pow_le_pow_left₀ (norm_nonneg _) (hC x) 2) (sq_nonneg _)
  nlinarith [norm_nonneg u, mul_nonneg hC_nn (norm_nonneg v)]

theorem complexMultiplier_norm_eq (φ : Ω → ℂ) (hφ : MemLp φ (⊤ : ENNReal) ν)
    (h1 : ∀ x, ‖φ x‖ = 1) (v : Lp ℂ 2 ν) :
    ‖complexMultiplier φ hφ v‖ = ‖v‖ := by
  set u := complexMultiplier φ hφ v
  have hsq : ‖u‖ ^ 2 = ‖v‖ ^ 2 := by
    rw [l2_norm_sq_eq_integral u, l2_norm_sq_eq_integral v]
    refine integral_congr_ae ?_
    filter_upwards [complexMultiplier_apply_ae φ hφ v] with x hx
    rw [hx, norm_mul, h1 x, one_mul]
  nlinarith [norm_nonneg u, norm_nonneg v]

theorem complexMultiplier_comp (φ₁ φ₂ : Ω → ℂ)
    (h₁ : MemLp φ₁ (⊤ : ENNReal) ν) (h₂ : MemLp φ₂ (⊤ : ENNReal) ν)
    (h₁₂ : MemLp (fun x ↦ φ₁ x * φ₂ x) (⊤ : ENNReal) ν) (v : Lp ℂ 2 ν) :
    complexMultiplier (fun x ↦ φ₁ x * φ₂ x) h₁₂ v =
      complexMultiplier φ₁ h₁ (complexMultiplier φ₂ h₂ v) := by
  apply Lp.ext
  filter_upwards [complexMultiplier_apply_ae (fun x ↦ φ₁ x * φ₂ x) h₁₂ v,
    complexMultiplier_apply_ae φ₁ h₁ (complexMultiplier φ₂ h₂ v),
    complexMultiplier_apply_ae φ₂ h₂ v] with x h12 h1v h2v
  rw [h12, h1v, h2v, mul_assoc]

theorem complexMultiplier_symmetric_of_real (r : Ω → ℝ)
    (hr : MemLp (fun x ↦ (r x : ℂ)) (⊤ : ENNReal) ν) (u v : Lp ℂ 2 ν) :
    inner ℂ (complexMultiplier (fun x ↦ (r x : ℂ)) hr u) v =
      inner ℂ u (complexMultiplier (fun x ↦ (r x : ℂ)) hr v) := by
  rw [L2.inner_def, L2.inner_def]
  refine integral_congr_ae ?_
  filter_upwards [complexMultiplier_apply_ae (fun x ↦ (r x : ℂ)) hr u,
    complexMultiplier_apply_ae (fun x ↦ (r x : ℂ)) hr v] with x hu hv
  simp only [RCLike.inner_apply, hu, hv, map_mul, Complex.conj_ofReal]
  ring

theorem complexMultiplier_inner_nonneg_of_nonneg (r : Ω → ℝ)
    (hr : MemLp (fun x ↦ (r x : ℂ)) (⊤ : ENNReal) ν) (hnn : ∀ x, 0 ≤ r x) (u : Lp ℂ 2 ν) :
    0 ≤ (inner ℂ (complexMultiplier (fun x ↦ (r x : ℂ)) hr u) u).re ∧
      (inner ℂ (complexMultiplier (fun x ↦ (r x : ℂ)) hr u) u).im = 0 := by
  rw [L2.inner_def]
  have hint := L2.integrable_inner (𝕜 := ℂ) (complexMultiplier (fun x ↦ (r x : ℂ)) hr u) u
  have hpt : ∀ᵐ x ∂ν, inner ℂ ((complexMultiplier (fun x ↦ (r x : ℂ)) hr u) x) (u x) =
      ((r x * ‖u x‖ ^ 2 : ℝ) : ℂ) := by
    filter_upwards [complexMultiplier_apply_ae (fun x ↦ (r x : ℂ)) hr u] with x hx
    rw [hx, RCLike.inner_apply, map_mul, Complex.conj_ofReal]
    have hnorm : u x * starRingEnd ℂ (u x) = ((‖u x‖ ^ 2 : ℝ) : ℂ) := by
      rw [Complex.mul_conj, Complex.normSq_eq_norm_sq]
    rw [Complex.ofReal_mul, ← hnorm]
    ring
  rw [← Complex.reCLM_apply, ← Complex.reCLM.integral_comp_comm hint,
    ← Complex.imCLM_apply, ← Complex.imCLM.integral_comp_comm hint]
  refine ⟨?_, ?_⟩
  · refine integral_nonneg_of_ae ?_
    filter_upwards [hpt] with x hx
    rw [Complex.reCLM_apply, hx, Complex.ofReal_re]
    exact mul_nonneg (hnn x) (sq_nonneg _)
  · refine integral_eq_zero_of_ae ?_
    filter_upwards [hpt] with x hx
    rw [Complex.imCLM_apply, hx, Complex.ofReal_im]
    rfl

/-- Inclusion of real Schwartz maps into complex Schwartz maps via `Complex.ofRealCLM`. -/
noncomputable def ofRealSchwartz {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] :
    SchwartzMap E ℝ →L[ℝ] SchwartzMap E ℂ :=
  SchwartzMap.postcompCLM Complex.ofRealCLM

/-- Real part of a complex Schwartz map. -/
noncomputable def reSchwartz {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] :
    SchwartzMap E ℂ →L[ℝ] SchwartzMap E ℝ :=
  SchwartzMap.postcompCLM Complex.reCLM

/-- Imaginary part of a complex Schwartz map. -/
noncomputable def imSchwartz {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] :
    SchwartzMap E ℂ →L[ℝ] SchwartzMap E ℝ :=
  SchwartzMap.postcompCLM Complex.imCLM

theorem schwartz_re_add_im {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (g : SchwartzMap E ℂ) :
    g = ofRealSchwartz (reSchwartz g) + Complex.I • ofRealSchwartz (imSchwartz g) := by
  ext x
  change g x = ((g x).re : ℂ) + Complex.I * ((g x).im : ℂ)
  rw [mul_comm]
  exact (Complex.re_add_im (g x)).symm

end FeatureDensity

section RealMultiplier

variable {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}

/-- A bounded real multiplier that is nonzero almost everywhere has dense range in complex `L²`. -/
theorem denseRange_of_realMultiplier (M : Lp ℂ 2 μ →L[ℂ] Lp ℂ 2 μ) (b : Ω → ℝ)
    (hM : ∀ f : Lp ℂ 2 μ, (M f : Ω → ℂ) =ᵐ[μ] fun x ↦ (b x : ℂ) * f x)
    (hb : ∀ᵐ x ∂μ, b x ≠ 0) : DenseRange M := by
  have symmetric (u v : Lp ℂ 2 μ) : inner ℂ (M u) v = inner ℂ u (M v) := by
    rw [L2.inner_def, L2.inner_def]
    apply integral_congr_ae
    filter_upwards [hM u, hM v] with x hu hv
    simp only [RCLike.inner_apply, hu, hv, map_mul, Complex.conj_ofReal]
    ring
  have kernel (v : Lp ℂ 2 μ) (h : M v = 0) : v = 0 := by
    have hzero : (M v : Ω → ℂ) =ᵐ[μ] (0 : Ω → ℂ) := by
      rw [h]
      exact Lp.coeFn_zero ℂ 2 μ
    have hv : (v : Ω → ℂ) =ᵐ[μ] (0 : Ω → ℂ) := by
      filter_upwards [hM v, hzero, hb] with x hmx hzx hbx
      have hprod : (b x : ℂ) * v x = 0 := hmx.symm.trans hzx
      exact (mul_eq_zero.mp hprod).resolve_left (by simpa using hbx)
    exact Lp.eq_zero_iff_ae_eq_zero.mpr hv
  let R := M.toLinearMap.range
  let K := R.topologicalClosure
  have : CompleteSpace K := R.isClosed_topologicalClosure.completeSpace_coe
  have orth (v : Lp ℂ 2 μ) (hv : v ∈ Kᗮ) : v = 0 := by
    have hm : M (M v) ∈ K := R.le_topologicalClosure ⟨M v, rfl⟩
    have he := (K.mem_orthogonal v).1 hv (M (M v)) hm
    rw [symmetric] at he
    exact kernel v (inner_self_eq_zero.mp he)
  intro y
  change y ∈ K
  obtain ⟨w, hw, hr⟩ := Submodule.HasOrthogonalProjection.exists_orthogonal (K := K) y
  exact (sub_eq_zero.mp (orth _ hr)).symm ▸ hw

/-- Bounded real `L^∞` multiplier on `Lp ℂ 2 μ` via Hölder multiplication. -/
noncomputable def realMultiplier (b : Ω → ℝ)
    (hBound : MemLp (fun x ↦ (b x : ℂ)) (⊤ : ENNReal) μ) : Lp ℂ 2 μ →L[ℂ] Lp ℂ 2 μ :=
  FeatureDensity.complexMultiplier (fun x ↦ (b x : ℂ)) hBound

theorem realMultiplier_apply_ae (b : Ω → ℝ)
    (hBound : MemLp (fun x ↦ (b x : ℂ)) (⊤ : ENNReal) μ) (v : Lp ℂ 2 μ) :
    (realMultiplier b hBound v : Ω → ℂ) =ᵐ[μ] fun x ↦ (b x : ℂ) * v x :=
  FeatureDensity.complexMultiplier_apply_ae (fun x ↦ (b x : ℂ)) hBound v

/-- Multiplying a dense test family by a bounded a.e.-positive real weight preserves density. -/
theorem denseRange_realMultiplier_tests {T : Type*} (tests : T → Lp ℂ 2 μ)
    (dense : DenseRange tests) (b : Ω → ℝ)
    (hBound : MemLp (fun x ↦ (b x : ℂ)) (⊤ : ENNReal) μ)
    (hpos : ∀ᵐ x ∂μ, 0 < b x) : DenseRange (fun t ↦ realMultiplier b hBound (tests t)) :=
  (denseRange_of_realMultiplier (realMultiplier b hBound) b (realMultiplier_apply_ae b hBound)
    (hpos.mono fun _ hx ↦ hx.ne')).comp dense (realMultiplier b hBound).continuous

end RealMultiplier

/-- Multiplying complex Schwartz functions by a bounded a.e.-positive weight has dense range in
`Lp ℂ 2 μ` for any temperate measure finite on compacts. -/
theorem denseRange_realMultiplier_schwartz {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    (μ : Measure E) [μ.HasTemperateGrowth] [IsFiniteMeasureOnCompacts μ]
    (b : E → ℝ) (hBound : MemLp (fun x ↦ (b x : ℂ)) (⊤ : ENNReal) μ)
    (hpos : ∀ᵐ x ∂μ, 0 < b x) :
    DenseRange (fun g : SchwartzMap E ℂ ↦ realMultiplier b hBound (g.toLp 2 μ)) :=
  denseRange_realMultiplier_tests (SchwartzMap.toLpCLM ℝ ℂ 2 μ)
    (SchwartzMap.denseRange_toLpCLM (E := E) (F := ℂ) (μ := μ) (p := 2) (by simp)) b hBound hpos

/-- Weighted Fourier transform of complex Schwartz spatial tests has dense range in
`Lp ℂ 2 volume` whenever the real multiplier is bounded and a.e. positive. -/
theorem denseRange_weighted_fourier_schwartz {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
    [MeasurableSpace E] [BorelSpace E]
    (b : E → ℝ) (hb : MemLp (fun x ↦ (b x : ℂ)) (⊤ : ENNReal) volume)
    (hpos : ∀ᵐ x ∂(volume : Measure E), 0 < b x) :
    DenseRange (fun g : SchwartzMap E ℂ ↦ realMultiplier b hb ((𝓕 g).toLp 2)) := by
  refine (denseRange_realMultiplier_schwartz volume b hb hpos).comp ?_ ?_
  · exact (fourierEquiv ℂ (SchwartzMap E ℂ)).surjective.denseRange
  · exact (realMultiplier b hb).continuous.comp (SchwartzMap.toLpCLM ℝ ℂ 2 volume).continuous

/-- Positive-half-space Laplace transform of a temporal bump profile `h`. -/
noncomputable def laplaceBump (h : ℝ → ℝ) (w : ℝ) : ℝ :=
  ∫ t in Ioi (0 : ℝ), h t * Real.exp (-t * w)

theorem laplaceBump_pos_le (h : ℝ → ℝ)
    (hm : Measurable h) (hn : ∀ t, 0 ≤ h t)
    (hi : IntegrableOn h (Ioi (0 : ℝ))) (hh : 0 < ∫ t in Ioi (0 : ℝ), h t)
    {w : ℝ} (hw : 0 ≤ w) :
    0 < laplaceBump h w ∧ laplaceBump h w ≤ ∫ t in Ioi (0 : ℝ), h t := by
  let ν := (volume : Measure ℝ).restrict (Ioi 0)
  let f := fun t : ℝ ↦ h t * Real.exp (-t * w)
  have hfn (t : ℝ) : 0 ≤ f t := mul_nonneg (hn t) (Real.exp_pos _).le
  have hb : f ≤ᵐ[ν] h := by
    filter_upwards [ae_restrict_mem (μ := (volume : Measure ℝ)) measurableSet_Ioi] with t ht
    exact mul_le_of_le_one_right (hn t)
      (Real.exp_le_one_iff.mpr (mul_nonpos_of_nonpos_of_nonneg (neg_nonpos.mpr (le_of_lt ht)) hw))
  have hfi : Integrable f ν := hi.mono'
    (hm.mul (measurable_id.neg.mul measurable_const).exp).aestronglyMeasurable <|
    hb.mono fun t ht ↦ by simpa only [Real.norm_eq_abs, abs_of_nonneg (hfn t)] using ht
  have he : Function.support f = Function.support h := by
    ext t
    simp [f, Function.mem_support, (Real.exp_pos _).ne']
  change 0 < (∫ t, f t ∂ν) ∧ (∫ t, f t ∂ν) ≤ ∫ t, h t ∂ν
  refine ⟨(integral_pos_iff_support_of_nonneg hfn hfi).2 ?_, integral_mono_ae hfi hi hb⟩
  rw [he]
  exact (integral_pos_iff_support_of_nonneg hn hi).1 hh

theorem laplaceBump_measurable (h : ℝ → ℝ) (hm : Measurable h) :
    Measurable (laplaceBump h) := by
  have hf : Measurable (fun p : ℝ × ℝ ↦ h p.2 * Real.exp (-p.2 * p.1)) :=
    (hm.comp measurable_snd).mul (measurable_snd.neg.mul measurable_fst).exp
  exact (hf.stronglyMeasurable.integral_prod_right' (ν := volume.restrict (Ioi 0))).measurable

/-- The fixed-time Laplace feature weight `√(H / (2 ω(k))) ∫_{t > 0} h(t) e^{-t ω(k)} dt` is
measurable, everywhere strictly positive, and essentially bounded whenever `ω(k) ≥ m > 0`. -/
theorem massive_bumpWeight {E : Type*} [MeasurableSpace E] (μ : Measure E)
    (ω : E → ℝ) (hω : Measurable ω) (m H : ℝ) (hm : 0 < m) (hH : 0 < H)
    (hgap : ∀ k, m ≤ ω k) (h : ℝ → ℝ) (hM : Measurable h)
    (hn : ∀ t, 0 ≤ h t) (hi : IntegrableOn h (Ioi (0 : ℝ)))
    (hh : 0 < ∫ t in Ioi (0 : ℝ), h t) :
    let b := fun k ↦ Real.sqrt (H / (2 * ω k)) * laplaceBump h (ω k)
    MemLp (fun k ↦ (b k : ℂ)) (⊤ : ENNReal) μ ∧ ∀ k, 0 < b k := by
  let b := fun k ↦ Real.sqrt (H / (2 * ω k)) * laplaceBump h (ω k)
  have ho (k : E) : 0 < ω k := hm.trans_le (hgap k)
  have hp (k : E) : 0 < b k :=
    mul_pos (Real.sqrt_pos.2 (div_pos hH (mul_pos (by norm_num) (ho k))))
      (laplaceBump_pos_le h hM hn hi hh (ho k).le).1
  refine ⟨?_, hp⟩
  have hb : Measurable b :=
    ((measurable_const.div (measurable_const.mul hω)).sqrt).mul
      ((laplaceBump_measurable h hM).comp hω)
  refine memLp_top_of_bound (Complex.continuous_ofReal.measurable.comp hb).aestronglyMeasurable
    (Real.sqrt (H / (2 * m)) * ∫ t in Ioi (0 : ℝ), h t) (ae_of_all _ fun k ↦ ?_)
  rw [Complex.norm_real, Real.norm_eq_abs, abs_of_pos (hp k)]
  exact mul_le_mul (Real.sqrt_le_sqrt (div_le_div_of_nonneg_left hH.le (by positivity)
    (mul_le_mul_of_nonneg_left (hgap k) (by norm_num))))
    (laplaceBump_pos_le h hM hn hi hh (ho k).le).2
    (laplaceBump_pos_le h hM hn hi hh (ho k).le).1.le (Real.sqrt_nonneg _)

/-- The fixed-time-profile slice of the continuum feature map `J` has dense range in `Lp ℂ 2 volume`
on complex Schwartz spatial tests. -/
theorem dense_fixed_profile {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
    [MeasurableSpace E] [BorelSpace E]
    (ω : E → ℝ) (hω : Measurable ω) (m H : ℝ) (hm : 0 < m) (hH : 0 < H)
    (hgap : ∀ k, m ≤ ω k) (h : ℝ → ℝ) (hM : Measurable h)
    (hn : ∀ t, 0 ≤ h t) (hi : IntegrableOn h (Ioi (0 : ℝ)))
    (hh : 0 < ∫ t in Ioi (0 : ℝ), h t) :
    let b := fun k ↦ Real.sqrt (H / (2 * ω k)) * laplaceBump h (ω k)
    ∃ hb : MemLp (fun k ↦ (b k : ℂ)) (⊤ : ENNReal) volume,
      DenseRange (fun g : SchwartzMap E ℂ ↦ realMultiplier b hb ((𝓕 g).toLp 2)) := by
  intro b
  obtain ⟨hb, hp⟩ := massive_bumpWeight volume ω hω m H hm hH hgap h hM hn hi hh
  exact ⟨hb, denseRange_weighted_fourier_schwartz b hb (ae_of_all _ hp)⟩

/-- The `ℝ`-linear fixed-profile feature map sending a real spatial Schwartz test `g : SchwartzMap E ℝ`
to `b · 𝓕(g)` in `Lp ℂ 2 volume`. -/
noncomputable def realFixedProfileMap {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
    [MeasurableSpace E] [BorelSpace E]
    (b : E → ℝ) (hb : MemLp (fun k ↦ (b k : ℂ)) (⊤ : ENNReal) (volume : Measure E)) :
    SchwartzMap E ℝ →ₗ[ℝ] Lp ℂ 2 (volume : Measure E) :=
  (((realMultiplier b hb).toLinearMap.comp
    ((SchwartzMap.toLpCLM ℂ ℂ 2 (volume : Measure E)).toLinearMap.comp
      (fourierEquiv ℂ (SchwartzMap E ℂ)).toLinearMap)).restrictScalars ℝ).comp
    FeatureDensity.ofRealSchwartz.toLinearMap

theorem realFixedProfileMap_apply {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
    [MeasurableSpace E] [BorelSpace E]
    (b : E → ℝ) (hb : MemLp (fun k ↦ (b k : ℂ)) (⊤ : ENNReal) (volume : Measure E))
    (g : SchwartzMap E ℝ) :
    realFixedProfileMap b hb g =
      realMultiplier b hb ((𝓕 (FeatureDensity.ofRealSchwartz g)).toLp 2) := rfl

/-- Real-to-complex Schwartz bridge: the **complex span** of the fixed-profile feature image of
real spatial Schwartz functions `SchwartzMap E ℝ` is dense in `Lp ℂ 2 volume`. -/
theorem dense_complex_span_real_fixed_profile {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
    [MeasurableSpace E] [BorelSpace E]
    (ω : E → ℝ) (hω : Measurable ω) (m H : ℝ) (hm : 0 < m) (hH : 0 < H)
    (hgap : ∀ k, m ≤ ω k) (h : ℝ → ℝ) (hM : Measurable h)
    (hn : ∀ t, 0 ≤ h t) (hi : IntegrableOn h (Ioi (0 : ℝ)))
    (hh : 0 < ∫ t in Ioi (0 : ℝ), h t) :
    let b := fun k ↦ Real.sqrt (H / (2 * ω k)) * laplaceBump h (ω k)
    ∃ hb : MemLp (fun k ↦ (b k : ℂ)) (⊤ : ENNReal) (volume : Measure E),
      Dense (Submodule.span ℂ (Set.range (realFixedProfileMap b hb)) :
        Set (Lp ℂ 2 (volume : Measure E))) := by
  intro b
  obtain ⟨hb, hdense⟩ := dense_fixed_profile ω hω m H hm hH hgap h hM hn hi hh
  refine ⟨hb, ?_⟩
  let T : SchwartzMap E ℂ →ₗ[ℂ] Lp ℂ 2 (volume : Measure E) :=
    (realMultiplier b hb).toLinearMap.comp
      ((SchwartzMap.toLpCLM ℂ ℂ 2 (volume : Measure E)).toLinearMap.comp
        (fourierEquiv ℂ (SchwartzMap E ℂ)).toLinearMap)
  have hsub : Set.range (fun g : SchwartzMap E ℂ ↦ realMultiplier b hb ((𝓕 g).toLp 2)) ⊆
      (Submodule.span ℂ (Set.range (realFixedProfileMap b hb)) :
        Set (Lp ℂ 2 (volume : Measure E))) := by
    rintro _ ⟨g, rfl⟩
    change T g ∈ Submodule.span ℂ (Set.range (realFixedProfileMap b hb))
    rw [FeatureDensity.schwartz_re_add_im g, map_add, map_smul]
    exact Submodule.add_mem _
      (Submodule.subset_span ⟨FeatureDensity.reSchwartz g, rfl⟩)
      (Submodule.smul_mem _ Complex.I
        (Submodule.subset_span ⟨FeatureDensity.imSchwartz g, rfl⟩))
  exact hdense.mono hsub

end SchwartzFeatureDensity

/-! ### §3.1–§3.2 Continuous-Momentum Symmetric Fock Space, Shift Semigroup & Unitary Evolution -/
section MomentumFock

open MeasureTheory Set
open scoped InnerProductSpace BigOperators Topology

namespace MomentumFock

private theorem prod_le_pow {ι : Type*} (s : Finset ι) (f : ι → ℝ) {C : ℝ}
    (hf0 : ∀ i ∈ s, 0 ≤ f i) (hfC : ∀ i ∈ s, f i ≤ C) :
    ∏ i ∈ s, f i ≤ C ^ s.card := by
  classical
  induction s using Finset.induction_on with
  | empty => simp
  | insert a s ha ih =>
    rw [Finset.prod_insert ha, Finset.card_insert_of_notMem ha, pow_succ']
    have hfa : 0 ≤ f a := hf0 a (Finset.mem_insert_self a s)
    have hCa : f a ≤ C := hfC a (Finset.mem_insert_self a s)
    have hs0 : 0 ≤ ∏ i ∈ s, f i :=
      Finset.prod_nonneg fun i hi ↦ hf0 i (Finset.mem_insert_of_mem hi)
    have ih' := ih (fun i hi ↦ hf0 i (Finset.mem_insert_of_mem hi))
      (fun i hi ↦ hfC i (Finset.mem_insert_of_mem hi))
    exact mul_le_mul hCa ih' hs0 (hfa.trans hCa)

section Sectors

variable {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]

noncomputable abbrev powerMeasure (n : ℕ) : Measure (Fin n → X) :=
  Measure.pi fun _ : Fin n ↦ μ

noncomputable def purePower (n : ℕ) (u : Lp ℂ 2 μ) (x : Fin n → X) : ℂ :=
  ∏ i, u (x i)

theorem purePower_memLp (n : ℕ) (u : Lp ℂ 2 μ) :
    MemLp (purePower μ n u) 2 (powerMeasure μ n) := by
  classical
  have hu : Measurable (u : X → ℂ) := (Lp.stronglyMeasurable u).measurable
  have h2 := (memLp_two_iff_integrable_sq_norm (Lp.aestronglyMeasurable u)).mp (Lp.memLp u)
  have hmeas : Measurable (purePower μ n u) := by
    unfold purePower
    exact Finset.measurable_prod _ (fun i _ ↦ hu.comp (measurable_pi_apply i))
  apply (memLp_two_iff_integrable_sq_norm hmeas.aestronglyMeasurable).2
  simpa only [purePower, norm_prod, Finset.prod_pow] using
    (Integrable.fintype_prod (μ := fun _ : Fin n ↦ μ)
      (f := fun _ : Fin n ↦ fun x : X ↦ ‖u x‖ ^ 2) (fun _ ↦ h2))

noncomputable def powerVec (n : ℕ) (u : Lp ℂ 2 μ) : Lp ℂ 2 (powerMeasure μ n) :=
  (purePower_memLp μ n u).toLp (purePower μ n u)

theorem powerVec_gram (n : ℕ) (u v : Lp ℂ 2 μ) :
    inner ℂ (powerVec μ n u) (powerVec μ n v) = (inner ℂ u v) ^ n := by
  classical
  rw [L2.inner_def, L2.inner_def]
  calc
    _ = ∫ x : Fin n → X, ∏ i, inner ℂ (u (x i)) (v (x i)) ∂(powerMeasure μ n) := by
      apply integral_congr_ae
      filter_upwards [(purePower_memLp μ n u).coeFn_toLp, (purePower_memLp μ n v).coeFn_toLp]
        with x hx hy
      change inner ℂ (((purePower_memLp μ n u).toLp _) x) (((purePower_memLp μ n v).toLp _) x) = _
      rw [hx, hy]
      simp only [purePower, RCLike.inner_apply', map_prod, Finset.prod_mul_distrib]
    _ = _ := by
      simpa only [Fintype.card_fin] using
        (integral_fintype_prod_eq_pow (ι := Fin n) (μ := μ) (fun y ↦ inner ℂ (u y) (v y)))

theorem zero_coeff_of_real_scalings (c : ℕ → ℂ)
    (h : ∀ t : ℝ, HasSum (fun n ↦ t ^ n • c n) 0) (n : ℕ) : c n = 0 := by
  let p : FormalMultilinearSeries ℝ ℝ ℂ := fun j ↦
    ContinuousMultilinearMap.mkPiRing ℝ (Fin j) (c j)
  have hp : HasFPowerSeriesAt (0 : ℝ → ℂ) p 0 := by
    apply hasFPowerSeriesAt_iff.2
    exact Filter.Eventually.of_forall fun t ↦ by
      simpa [p, FormalMultilinearSeries.coeff] using h t
  simpa [p] using hp.apply_eq_zero n (1 : ℝ)

theorem coherent_separates {I : Type*} {E : ℕ → Type*} [∀ n, NormedAddCommGroup (E n)]
    [∀ n, InnerProductSpace ℂ (E n)]
    (v : I → lp E 2) (rescale : ℝ → I → I)
    (hom : ∀ (t : ℝ) i n, v (rescale t i) n = ((t ^ n : ℝ) : ℂ) • v i n)
    (sector : ∀ n (y : E n), (∀ i, inner ℂ y (v i n) = 0) → y = 0)
    (x : lp E 2) (hx : ∀ i, inner ℂ x (v i) = 0) : x = 0 := by
  apply lp.ext
  funext n
  change x n = 0
  apply sector n (x n)
  intro i
  apply zero_coeff_of_real_scalings (fun j ↦ inner ℂ (x j) (v i j)) _ n
  intro t
  have h := lp.hasSum_inner (𝕜 := ℂ) x (v (rescale t i))
  rw [hx] at h
  refine h.congr_fun fun j ↦ ?_
  simp only [hom, inner_smul_right, Complex.real_smul]

noncomputable def fockWeight (n : ℕ) : ℝ := (Real.sqrt (n.factorial : ℝ))⁻¹

theorem fockWeight_sq (n : ℕ) :
    fockWeight n * fockWeight n = (n.factorial : ℝ)⁻¹ := by
  rw [← sq]
  simp [fockWeight, inv_pow, Real.sq_sqrt (Nat.cast_nonneg n.factorial)]

noncomputable def scaledPower (n : ℕ) (u : Lp ℂ 2 μ) : Lp ℂ 2 (powerMeasure μ n) :=
  (fockWeight n : ℂ) • powerVec μ n u

theorem scaledPower_gram (n : ℕ) (u v : Lp ℂ 2 μ) :
    inner ℂ (scaledPower μ n u) (scaledPower μ n v) =
      (inner ℂ u v) ^ n / n.factorial := by
  have hw : (fockWeight n : ℂ) * (fockWeight n : ℂ) = (n.factorial : ℂ)⁻¹ := by
    have hc := congrArg Complex.ofReal (fockWeight_sq n)
    simpa only [Complex.ofReal_mul, Complex.ofReal_inv, Complex.ofReal_natCast] using hc
  simp only [scaledPower, inner_smul_left, inner_smul_right, Complex.conj_ofReal, powerVec_gram]
  rw [← mul_assoc, hw]
  ring

theorem scaledPower_homogeneous (n : ℕ) (z : ℂ) (u : Lp ℂ 2 μ) :
    scaledPower μ n (z • u) = z ^ n • scaledPower μ n u := by
  rw [← sub_eq_zero]
  apply (inner_self_eq_zero (𝕜 := ℂ)).mp
  simp only [inner_sub_right, inner_sub_left, inner_smul_left, inner_smul_right,
    scaledPower_gram, map_pow, mul_pow]
  ring

end Sectors

section LagrangeHelpers

noncomputable def lineWeight (n j : ℕ) (z : ℂ) : ℂ :=
  (Lagrange.basis (Finset.range (n + 1)) (fun k : ℕ ↦ (k : ℂ)) j).eval z

theorem line_interpolate_pow (n : ℕ) (a b z : ℂ) :
    (a + z * b) ^ n = ∑ j ∈ Finset.range (n + 1), lineWeight n j z * (a + (j : ℂ) * b) ^ n := by
  classical
  let p : Polynomial ℂ := (Polynomial.C a + Polynomial.X * Polynomial.C b) ^ n
  have h1 : (Polynomial.C a + Polynomial.X * Polynomial.C b).natDegree ≤ 1 := by
    rw [Polynomial.natDegree_C_add]
    exact (Polynomial.natDegree_mul_C_le _ _).trans_eq Polynomial.natDegree_X
  have hn : p.natDegree ≤ n := by
    simpa [p] using Polynomial.natDegree_pow_le_of_le n h1
  have hd : p.degree < ((Finset.range (n + 1)).card : WithBot ℕ) := by
    apply lt_of_le_of_lt Polynomial.degree_le_natDegree
    rw [Finset.card_range]
    exact_mod_cast Nat.lt_succ_of_le hn
  have hinj : Set.InjOn (fun k : ℕ ↦ (k : ℂ)) (Finset.range (n + 1)) := by
    intro i _ j _ hij
    change (i : ℂ) = (j : ℂ) at hij
    exact_mod_cast hij
  have h := congrArg (Polynomial.eval z) (Lagrange.eq_interpolate hinj hd)
  simp only [p, Lagrange.interpolate_apply, Polynomial.eval_finsetSum, Polynomial.eval_pow,
    Polynomial.eval_add, Polynomial.eval_C, Polynomial.eval_mul, Polynomial.eval_X] at h
  rw [h]
  unfold lineWeight
  refine Finset.sum_congr rfl fun j _ ↦ ?_
  ring

theorem complexSpan_real_decompose {X R : Type*} [MeasurableSpace X] (μ : Measure X)
    [AddCommGroup R] [Module ℝ R] (J : R →ₗ[ℝ] Lp ℂ 2 μ) {w : Lp ℂ 2 μ}
    (hw : w ∈ Submodule.span ℂ (Set.range J)) :
    ∃ a b : R, w = J a + Complex.I • J b := by
  induction hw using Submodule.span_induction with
  | mem x hx =>
    obtain ⟨a, rfl⟩ := hx
    exact ⟨a, 0, by simp⟩
  | zero => exact ⟨0, 0, by simp⟩
  | add x y _ _ ix iy =>
    obtain ⟨a, b, rfl⟩ := ix
    obtain ⟨c, d, rfl⟩ := iy
    refine ⟨a + c, b + d, ?_⟩
    simp only [map_add, smul_add]
    abel
  | smul z x _ ih =>
    obtain ⟨a, b, rfl⟩ := ih
    refine ⟨z.re • a - z.im • b, z.im • a + z.re • b, ?_⟩
    have h1 : J (z.re • a - z.im • b) = (z.re : ℂ) • J a - (z.im : ℂ) • J b := by
      rw [map_sub, map_smul, map_smul, ← algebraMap_smul ℂ z.re, ← algebraMap_smul ℂ z.im]
      rfl
    have h2 : J (z.im • a + z.re • b) = (z.im : ℂ) • J a + (z.re : ℂ) • J b := by
      rw [map_add, map_smul, map_smul, ← algebraMap_smul ℂ z.im, ← algebraMap_smul ℂ z.re]
      rfl
    rw [h1, h2, smul_add, smul_add, smul_smul, smul_smul, smul_smul]
    have hz1 : z = (z.re : ℂ) + Complex.I * (z.im : ℂ) := by
      simpa only [mul_comm] using (Complex.re_add_im z).symm
    have hz2 : z * Complex.I = -((z.im : ℂ)) + Complex.I * (z.re : ℂ) := by
      apply Complex.ext <;> simp
    rw [hz2]
    nth_rw 1 [hz1]
    simp only [add_smul, neg_smul, sub_eq_add_neg]
    abel

end LagrangeHelpers

section Weights

/-- `n`-particle product multiplier weight `x ↦ ∏ i, φ (x i)`. -/
def prodWeight {X : Type*} (n : ℕ) (φ : X → ℂ) (x : Fin n → X) : ℂ :=
  ∏ i : Fin n, φ (x i)

/-- One-particle Euclidean shift weight `k ↦ e^{-s ω(k)}`. -/
noncomputable def shiftWeight {X : Type*} (ω : X → ℝ) (s : ℝ) (k : X) : ℂ :=
  ((Real.exp (-s * ω k) : ℝ) : ℂ)

theorem shiftWeight_measurable {X : Type*} [MeasurableSpace X] (ω : X → ℝ) (hω : Measurable ω)
    (s : ℝ) : Measurable (shiftWeight ω s) :=
  Complex.continuous_ofReal.measurable.comp (Real.continuous_exp.measurable.comp
    (measurable_const.mul hω))

theorem shiftWeight_norm_le_one {X : Type*} (ω : X → ℝ) (hω_nn : ∀ k, 0 ≤ ω k)
    {s : ℝ} (hs : 0 ≤ s) (k : X) :
    ‖shiftWeight ω s k‖ ≤ 1 := by
  rw [shiftWeight, Complex.norm_real, Real.norm_eq_abs, abs_of_pos (Real.exp_pos _)]
  exact Real.exp_le_one_iff.mpr (mul_nonpos_of_nonpos_of_nonneg (neg_nonpos.mpr hs) (hω_nn k))

theorem shiftWeight_norm_le_gap {X : Type*} (ω : X → ℝ) {m : ℝ} (hgap : ∀ k, m ≤ ω k)
    {s : ℝ} (hs : 0 ≤ s) (k : X) :
    ‖shiftWeight ω s k‖ ≤ Real.exp (-s * m) := by
  rw [shiftWeight, Complex.norm_real, Real.norm_eq_abs, abs_of_pos (Real.exp_pos _)]
  exact Real.exp_le_exp.mpr (by nlinarith [hgap k])

theorem shiftWeight_memLp {X : Type*} [MeasurableSpace X] (μ : Measure X)
    (ω : X → ℝ) (hω : Measurable ω) (hω_nn : ∀ k, 0 ≤ ω k) {s : ℝ} (hs : 0 ≤ s) :
    MemLp (shiftWeight ω s) (⊤ : ENNReal) μ :=
  memLp_top_of_bound (shiftWeight_measurable ω hω s).aestronglyMeasurable 1
    (ae_of_all _ (shiftWeight_norm_le_one ω hω_nn hs))

theorem prodWeight_shiftWeight {X : Type*} (n : ℕ) (ω : X → ℝ) (s : ℝ) (k : Fin n → X) :
    prodWeight n (shiftWeight ω s) k = ((Real.exp (-s * ∑ i : Fin n, ω (k i)) : ℝ) : ℂ) := by
  simp only [prodWeight, shiftWeight, ← Complex.ofReal_prod, ← Real.exp_sum, Finset.mul_sum]

/-- One-particle Lorentzian unitary phase weight `k ↦ e^{-i t ω(k)}`. -/
noncomputable def unitaryWeight {X : Type*} (ω : X → ℝ) (t : ℝ) (k : X) : ℂ :=
  Complex.exp (((-(t * ω k) : ℝ) : ℂ) * Complex.I)

theorem unitaryWeight_measurable {X : Type*} [MeasurableSpace X] (ω : X → ℝ) (hω : Measurable ω)
    (t : ℝ) : Measurable (unitaryWeight ω t) :=
  Complex.continuous_exp.measurable.comp
    ((Complex.continuous_ofReal.measurable.comp (measurable_const.mul hω).neg).mul measurable_const)

theorem unitaryWeight_norm {X : Type*} (ω : X → ℝ) (t : ℝ) (k : X) :
    ‖unitaryWeight ω t k‖ = 1 :=
  Complex.norm_exp_ofReal_mul_I (-(t * ω k))

theorem unitaryWeight_memLp {X : Type*} [MeasurableSpace X] (μ : Measure X)
    (ω : X → ℝ) (hω : Measurable ω) (t : ℝ) :
    MemLp (unitaryWeight ω t) (⊤ : ENNReal) μ :=
  memLp_top_of_bound (unitaryWeight_measurable ω hω t).aestronglyMeasurable 1
    (ae_of_all _ fun k ↦ (unitaryWeight_norm ω t k).le)

theorem prodWeight_unitaryWeight {X : Type*} (n : ℕ) (ω : X → ℝ) (t : ℝ) (k : Fin n → X) :
    prodWeight n (unitaryWeight ω t) k =
      Complex.exp (((-(t * ∑ i : Fin n, ω (k i)) : ℝ) : ℂ) * Complex.I) := by
  rw [prodWeight]
  simp only [unitaryWeight, ← Complex.exp_sum, ← Finset.sum_mul, ← Complex.ofReal_sum,
    Finset.mul_sum, Finset.sum_neg_distrib]

theorem prodWeight_memLp {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (n : ℕ) (φ : X → ℂ) (hφ_meas : Measurable φ) {C : ℝ} (hC : ∀ x, ‖φ x‖ ≤ C) :
    MemLp (prodWeight n φ) (⊤ : ENNReal) (powerMeasure μ n) := by
  have hmeas : Measurable (prodWeight n φ) :=
    Finset.measurable_prod _ (fun i _ ↦ hφ_meas.comp (measurable_pi_apply i))
  refine memLp_top_of_bound hmeas.aestronglyMeasurable (C ^ n) (ae_of_all _ fun x ↦ ?_)
  rw [prodWeight, norm_prod]
  simpa only [Finset.card_univ, Fintype.card_fin] using
    prod_le_pow Finset.univ (fun i : Fin n ↦ ‖φ (x i)‖)
      (fun i _ ↦ norm_nonneg _) (fun i _ ↦ hC (x i))

theorem complexMultiplier_powerVec {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (n : ℕ) (φ : X → ℂ) (hφ : MemLp φ (⊤ : ENNReal) μ)
    (hφn : MemLp (prodWeight n φ) (⊤ : ENNReal) (powerMeasure μ n)) (u : Lp ℂ 2 μ) :
    FeatureDensity.complexMultiplier (prodWeight n φ) hφn (powerVec μ n u) =
      powerVec μ n (FeatureDensity.complexMultiplier φ hφ u) := by
  apply Lp.ext
  have hcoord : ∀ᵐ x ∂(powerMeasure μ n), ∀ i : Fin n,
      (FeatureDensity.complexMultiplier φ hφ u) (x i) = φ (x i) * u (x i) := by
    rw [ae_all_iff]
    intro i
    exact (Measure.quasiMeasurePreserving_eval (fun _ : Fin n ↦ μ) i).ae
      (FeatureDensity.complexMultiplier_apply_ae φ hφ u)
  filter_upwards [FeatureDensity.complexMultiplier_apply_ae (prodWeight n φ) hφn (powerVec μ n u),
    (purePower_memLp μ n u).coeFn_toLp,
    (purePower_memLp μ n (FeatureDensity.complexMultiplier φ hφ u)).coeFn_toLp,
    hcoord] with x h1 h2 h3 h4
  change (FeatureDensity.complexMultiplier (prodWeight n φ) hφn (powerVec μ n u)) x =
    (powerVec μ n (FeatureDensity.complexMultiplier φ hφ u)) x
  rw [h1]
  dsimp only [powerVec]
  rw [h2, h3]
  simp only [purePower, prodWeight, h4, Finset.prod_mul_distrib]

theorem complexMultiplier_scaledPower {X : Type*} [MeasurableSpace X] (μ : Measure X)
    [SigmaFinite μ] (n : ℕ) (φ : X → ℂ) (hφ : MemLp φ (⊤ : ENNReal) μ)
    (hφn : MemLp (prodWeight n φ) (⊤ : ENNReal) (powerMeasure μ n)) (u : Lp ℂ 2 μ) :
    FeatureDensity.complexMultiplier (prodWeight n φ) hφn (scaledPower μ n u) =
      scaledPower μ n (FeatureDensity.complexMultiplier φ hφ u) := by
  rw [scaledPower, scaledPower, map_smul, complexMultiplier_powerVec]

end Weights

end MomentumFock

section FockDefs

variable {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]

/-- `n`-particle symmetric momentum sector: closed complex span of normalized pure powers in
`L²(μ^⊗n)`. -/
noncomputable abbrev momentumSector (n : ℕ) :
    Submodule ℂ (Lp ℂ 2 (MomentumFock.powerMeasure μ n)) :=
  (Submodule.span ℂ (Set.range (MomentumFock.scaledPower μ n))).topologicalClosure

/-- `n`-particle coherent sector component `u^⊗n / √(n!)` inside `momentumSector μ n`. -/
noncomputable def sectorVec (n : ℕ) (u : Lp ℂ 2 μ) : momentumSector μ n :=
  ⟨MomentumFock.scaledPower μ n u,
    Submodule.le_topologicalClosure _ (Submodule.subset_span (Set.mem_range_self _))⟩

theorem sectorVec_gram (n : ℕ) (u v : Lp ℂ 2 μ) :
    inner ℂ (sectorVec μ n u) (sectorVec μ n v) = (inner ℂ u v) ^ n / n.factorial :=
  MomentumFock.scaledPower_gram μ n u v

theorem sectorVec_norm_sq (n : ℕ) (u : Lp ℂ 2 μ) :
    ‖sectorVec μ n u‖ ^ 2 = (‖u‖ ^ 2) ^ n / (n.factorial : ℝ) := by
  have h : inner ℂ (MomentumFock.scaledPower μ n u) (MomentumFock.scaledPower μ n u) =
      (inner ℂ u u) ^ n / n.factorial :=
    MomentumFock.scaledPower_gram μ n u u
  rw [inner_self_eq_norm_sq_to_K, inner_self_eq_norm_sq_to_K] at h
  apply Complex.ofReal_injective
  calc
    ((‖sectorVec μ n u‖ ^ 2 : ℝ) : ℂ) = ((‖MomentumFock.scaledPower μ n u‖ : ℝ) : ℂ) ^ 2 := by
      exact Complex.ofReal_pow _ _
    _ = (((‖u‖ : ℝ) : ℂ) ^ 2) ^ n / (n.factorial : ℂ) := h
    _ = _ := by push_cast; rfl

theorem sectorVec_memℓp (u : Lp ℂ 2 μ) : Memℓp (fun n ↦ sectorVec μ n u) 2 := by
  apply memℓp_gen
  apply (NormedSpace.expSeries_div_summable (‖u‖ ^ 2)).congr
  intro n
  rw [← sectorVec_norm_sq μ n u]
  norm_cast

/-- Continuous-momentum symmetric bosonic Fock space `⨁_{n ≥ 0} momentumSector μ n` (`ℓ²` direct
sum). -/
noncomputable abbrev momentumFock := lp (fun n ↦ ↥(momentumSector μ n)) 2

/-- Coherent state vector `E(u) = (u^⊗n / √(n!))_{n ≥ 0}` in `momentumFock μ`. -/
noncomputable def coherentVec (u : Lp ℂ 2 μ) : momentumFock μ :=
  ⟨fun n ↦ sectorVec μ n u, sectorVec_memℓp μ u⟩

/-- Fock vacuum vector `Ω = E(0)` concentrated in sector `0`. -/
noncomputable def fockVacuum : momentumFock μ :=
  coherentVec μ 0

/-- Exponential Gram identity `⟨E(u), E(v)⟩ = exp ⟨u, v⟩` in continuous-momentum Fock space. -/
theorem coherentVec_gram (u v : Lp ℂ 2 μ) :
    inner ℂ (coherentVec μ u) (coherentVec μ v) = Complex.exp (inner ℂ u v) := by
  rw [lp.inner_eq_tsum, Complex.exp_eq_exp_ℂ]
  change (∑' n, inner ℂ (sectorVec μ n u) (sectorVec μ n v)) = _
  simp_rw [sectorVec_gram]
  exact (NormedSpace.expSeries_div_hasSum_exp (inner ℂ u v)).tsum_eq

end FockDefs

namespace MomentumFock

section FockHelpers

variable {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]

theorem sectorVec_separates (n : ℕ) (y : momentumSector μ n)
    (hy : ∀ u, inner ℂ y (sectorVec μ n u) = 0) : y = 0 := by
  let F := innerSL ℂ (y : Lp ℂ 2 (powerMeasure μ n))
  let S := Submodule.span ℂ (Set.range (scaledPower μ n))
  have hS : S ≤ F.ker := by
    apply Submodule.span_le.mpr
    rintro _ ⟨u, rfl⟩
    exact hy u
  have hz := (S.topologicalClosure_minimal hS F.isClosed_ker) y.property
  apply Subtype.ext
  exact (inner_self_eq_zero (𝕜 := ℂ)).mp hz

theorem coherentVec_separates (x : momentumFock μ)
    (h : ∀ u, inner ℂ x (coherentVec μ u) = 0) : x = 0 := by
  apply coherent_separates (coherentVec μ) (fun t u ↦ (t : ℂ) • u) _ _ x h
  · intro t u n
    apply Subtype.ext
    change scaledPower μ n ((t : ℂ) • u) = ((t ^ n : ℝ) : ℂ) • scaledPower μ n u
    rw [Complex.ofReal_pow, scaledPower_homogeneous]
  · exact sectorVec_separates μ

theorem sectorVec_interpolate (n : ℕ) (u v : Lp ℂ 2 μ) (z : ℂ) :
    sectorVec μ n (u + z • v) = ∑ j ∈ Finset.range (n + 1),
      lineWeight n j z • sectorVec μ n (u + (j : ℂ) • v) := by
  rw [← sub_eq_zero]
  apply sectorVec_separates μ n
  intro w
  change inner ℂ ((sectorVec μ n (u + z • v) -
      ∑ j ∈ Finset.range (n + 1), lineWeight n j z • sectorVec μ n (u + (j : ℂ) • v) :
        momentumSector μ n) : Lp ℂ 2 (powerMeasure μ n))
      ((sectorVec μ n w : momentumSector μ n) : Lp ℂ 2 (powerMeasure μ n)) = 0
  apply inner_eq_zero_symm.mpr
  rw [Submodule.coe_sub, AddSubmonoidClass.coe_finsetSum, inner_sub_right, sub_eq_zero, inner_sum]
  change inner ℂ (scaledPower μ n w) (scaledPower μ n (u + z • v)) = _
  rw [scaledPower_gram, inner_add_right, inner_smul_right]
  calc
    (inner ℂ w u + z * inner ℂ w v) ^ n / n.factorial =
        (∑ j ∈ Finset.range (n + 1), lineWeight n j z *
          (inner ℂ w u + (j : ℂ) * inner ℂ w v) ^ n) / n.factorial :=
      congrArg (fun t : ℂ ↦ t / n.factorial)
        (line_interpolate_pow n (inner ℂ w u) (inner ℂ w v) z)
    _ = _ := by
      rw [Finset.sum_div]
      refine Finset.sum_congr rfl fun j _ ↦ ?_
      change _ = inner ℂ (scaledPower μ n w)
        (lineWeight n j z • scaledPower μ n (u + (j : ℂ) • v))
      rw [inner_smul_right, scaledPower_gram, inner_add_right, inner_smul_right]
      ring

theorem sectorVec_continuous (n : ℕ) : Continuous (sectorVec μ n) := by
  let B : Lp ℂ 2 μ → Lp ℂ 2 μ → ℂ := fun u v ↦ (inner ℂ u v) ^ n / n.factorial
  have hB {f g : (Lp ℂ 2 μ × Lp ℂ 2 μ) → Lp ℂ 2 μ}
      (hf : Continuous f) (hg : Continuous g) : Continuous (fun p ↦ B (f p) (g p)) :=
    ((hf.inner hg).pow n).div_const _
  have hd (u v : Lp ℂ 2 μ) :
      dist (sectorVec μ n u) (sectorVec μ n v) =
      Real.sqrt ((B u u - B v u) - (B u v - B v v)).re := by
    rw [dist_eq_norm]
    change ‖scaledPower μ n u - scaledPower μ n v‖ = _
    rw [norm_eq_sqrt_re_inner (𝕜 := ℂ)]
    simp only [inner_sub_right, inner_sub_left, scaledPower_gram, B]
    rfl
  rw [continuous_iff_continuous_dist]
  have hfn : (fun p : Lp ℂ 2 μ × Lp ℂ 2 μ ↦ dist (sectorVec μ n p.1) (sectorVec μ n p.2)) =
      fun p ↦ Real.sqrt ((B p.1 p.1 - B p.2 p.1) - (B p.1 p.2 - B p.2 p.2)).re := by
    funext p
    exact hd p.1 p.2
  rw [hfn]
  exact Real.continuous_sqrt.comp (Complex.continuous_re.comp
    (((hB continuous_fst continuous_fst).sub (hB continuous_snd continuous_fst)).sub
      ((hB continuous_fst continuous_snd).sub (hB continuous_snd continuous_snd))))

theorem realLabels_sector_separate {R : Type*} [AddCommGroup R] [Module ℝ R]
    (J : R →ₗ[ℝ] Lp ℂ 2 μ)
    (hJ : Dense (Submodule.span ℂ (Set.range J) : Set (Lp ℂ 2 μ)))
    (n : ℕ) (y : momentumSector μ n)
    (hy : ∀ a : R, inner ℂ y (sectorVec μ n (J a)) = 0) : y = 0 := by
  let g := fun w : Lp ℂ 2 μ ↦ inner ℂ y (sectorVec μ n w)
  have hc : Continuous g := continuous_const.inner (sectorVec_continuous μ n)
  have hz : (Submodule.span ℂ (Set.range J) : Set (Lp ℂ 2 μ)) ⊆ {w | g w = 0} := by
    intro w hw
    obtain ⟨a, b, rfl⟩ := complexSpan_real_decompose μ J hw
    change inner ℂ y (sectorVec μ n (J a + Complex.I • J b)) = 0
    rw [sectorVec_interpolate]
    change inner ℂ (y : Lp ℂ 2 (powerMeasure μ n))
      ((∑ j ∈ Finset.range (n + 1), lineWeight n j Complex.I •
        sectorVec μ n (J a + (j : ℂ) • J b) : momentumSector μ n) :
        Lp ℂ 2 (powerMeasure μ n)) = 0
    rw [AddSubmonoidClass.coe_finsetSum, inner_sum]
    refine Finset.sum_eq_zero fun j _ ↦ ?_
    have hjv : J a + (j : ℂ) • J b = J (a + (j : ℝ) • b) := by
      rw [J.map_add, J.map_smul]
      change _ = J a + ((↑(j : ℝ)) : ℂ) • J b
      rw [Complex.ofReal_natCast]
    change inner ℂ (y : Lp ℂ 2 (powerMeasure μ n))
      (lineWeight n j Complex.I • scaledPower μ n (J a + (j : ℂ) • J b)) = 0
    rw [inner_smul_right, hjv]
    have h0 := hy (a + (j : ℝ) • b)
    change inner ℂ (y : Lp ℂ 2 (powerMeasure μ n))
      (scaledPower μ n (J (a + (j : ℝ) • b))) = 0 at h0
    rw [h0, mul_zero]
  have hz' := closure_minimal hz (isClosed_eq hc continuous_const)
  apply sectorVec_separates μ n
  exact fun w ↦ hz' (hJ w)

theorem sectorVec_zero_eq (u : Lp ℂ 2 μ) : sectorVec μ 0 u = sectorVec μ 0 0 := by
  apply Subtype.ext
  rw [← sub_eq_zero]
  apply (inner_self_eq_zero (𝕜 := ℂ)).mp
  change inner ℂ (scaledPower μ 0 u - scaledPower μ 0 0)
    (scaledPower μ 0 u - scaledPower μ 0 0) = 0
  simp only [inner_sub_left, inner_sub_right, scaledPower_gram, pow_zero, Nat.factorial_zero,
    Nat.cast_one, div_one]
  ring

theorem sectorVec_succ_zero (n : ℕ) : sectorVec μ (n + 1) 0 = 0 := by
  apply norm_eq_zero.mp
  have h := sectorVec_norm_sq μ (n + 1) 0
  simp only [norm_zero, zero_pow (by positivity : 2 ≠ 0), zero_pow (Nat.succ_ne_zero n),
    zero_div] at h
  nlinarith [norm_nonneg (sectorVec μ (n + 1) 0)]

theorem sector_zero_eq_smul (y : momentumSector μ 0) :
    y = inner ℂ (sectorVec μ 0 0) y • sectorVec μ 0 0 := by
  rw [← sub_eq_zero]
  apply sectorVec_separates μ 0
  intro u
  rw [sectorVec_zero_eq μ u]
  change inner ℂ (y.1 - inner ℂ (sectorVec μ 0 0).1 y.1 • (sectorVec μ 0 0).1)
    (sectorVec μ 0 0).1 = 0
  rw [inner_sub_left, inner_smul_left]
  have h1 : inner ℂ (sectorVec μ 0 0).1 (sectorVec μ 0 0).1 = 1 := by
    change inner ℂ (scaledPower μ 0 0) (scaledPower μ 0 0) = 1
    simpa only [pow_zero, Nat.factorial_zero, Nat.cast_one, div_one] using
      scaledPower_gram μ 0 0 0
  rw [h1, mul_one, inner_conj_symm, sub_self]

/-- Restriction of the `n`-particle product multiplier to `momentumSector μ n`. -/
noncomputable def sectorProdMult (n : ℕ) (φ : X → ℂ) (hφ : MemLp φ (⊤ : ENNReal) μ)
    (hφn : MemLp (prodWeight n φ) (⊤ : ENNReal) (powerMeasure μ n)) :
    momentumSector μ n →L[ℂ] momentumSector μ n :=
  let M := FeatureDensity.complexMultiplier (prodWeight n φ) hφn
  have hinv : ∀ y : momentumSector μ n, M (y : Lp ℂ 2 (powerMeasure μ n)) ∈ momentumSector μ n := by
    have hpre : Submodule.span ℂ (Set.range (scaledPower μ n)) ≤
        (momentumSector μ n).comap M.toLinearMap := by
      refine Submodule.span_le.mpr ?_
      rintro _ ⟨u, rfl⟩
      change M (scaledPower μ n u) ∈ momentumSector μ n
      rw [complexMultiplier_scaledPower μ n φ hφ hφn u]
      exact Submodule.le_topologicalClosure _ (Submodule.subset_span ⟨_, rfl⟩)
    have hclosed : IsClosed ((momentumSector μ n).comap M.toLinearMap :
        Set (Lp ℂ 2 (powerMeasure μ n))) :=
      (Submodule.isClosed_topologicalClosure _).preimage M.continuous
    intro y
    exact (Submodule.span ℂ (Set.range (scaledPower μ n))).topologicalClosure_minimal
      hpre hclosed y.property
  { toLinearMap :=
      { toFun := fun y ↦ ⟨M y.1, hinv y⟩
        map_add' := fun y z ↦ Subtype.ext (M.map_add y.1 z.1)
        map_smul' := fun c y ↦ Subtype.ext (M.map_smul c y.1) }
    cont := (M.continuous.comp continuous_subtype_val).subtype_mk _ }

theorem sectorProdMult_sectorVec (n : ℕ) (φ : X → ℂ) (hφ : MemLp φ (⊤ : ENNReal) μ)
    (hφn : MemLp (prodWeight n φ) (⊤ : ENNReal) (powerMeasure μ n)) (u : Lp ℂ 2 μ) :
    sectorProdMult μ n φ hφ hφn (sectorVec μ n u) =
      sectorVec μ n (FeatureDensity.complexMultiplier φ hφ u) :=
  Subtype.ext (complexMultiplier_scaledPower μ n φ hφ hφn u)

theorem sectorProdMult_norm_le (n : ℕ) (φ : X → ℂ) (hφ : MemLp φ (⊤ : ENNReal) μ)
    (hφn : MemLp (prodWeight n φ) (⊤ : ENNReal) (powerMeasure μ n))
    {C : ℝ} (hC_nn : 0 ≤ C) (hC : ∀ x, ‖φ x‖ ≤ C) (y : momentumSector μ n) :
    ‖sectorProdMult μ n φ hφ hφn y‖ ≤ C ^ n * ‖y‖ := by
  have hprodC : ∀ x : Fin n → X, ‖prodWeight n φ x‖ ≤ C ^ n := fun x ↦ by
    rw [prodWeight, norm_prod]
    simpa only [Finset.card_univ, Fintype.card_fin] using
      prod_le_pow Finset.univ (fun i : Fin n ↦ ‖φ (x i)‖)
        (fun i _ ↦ norm_nonneg _) (fun i _ ↦ hC (x i))
  exact FeatureDensity.complexMultiplier_norm_le (prodWeight n φ) hφn (pow_nonneg hC_nn n)
    hprodC y.1

theorem sectorProdMult_norm_eq (n : ℕ) (φ : X → ℂ) (hφ : MemLp φ (⊤ : ENNReal) μ)
    (hφn : MemLp (prodWeight n φ) (⊤ : ENNReal) (powerMeasure μ n))
    (h1 : ∀ x, ‖φ x‖ = 1) (y : momentumSector μ n) :
    ‖sectorProdMult μ n φ hφ hφn y‖ = ‖y‖ := by
  have hprod1 : ∀ x : Fin n → X, ‖prodWeight n φ x‖ = 1 := fun x ↦ by
    rw [prodWeight, norm_prod]
    simp [h1]
  exact FeatureDensity.complexMultiplier_norm_eq (prodWeight n φ) hφn hprod1 y.1

/-- Diagonal bounded linear operator on `momentumFock μ` assembled from uniformly bounded
sectorwise operators. -/
noncomputable def fockDiag
    (T : ∀ n, momentumSector μ n →L[ℂ] momentumSector μ n)
    {B : ℝ} (hB_nn : 0 ≤ B) (hB : ∀ n y, ‖T n y‖ ≤ B * ‖y‖) :
    momentumFock μ →L[ℂ] momentumFock μ :=
  have hmem : ∀ ψ : momentumFock μ, Memℓp (fun n ↦ T n (ψ n)) 2 := fun ψ ↦ by
    apply memℓp_gen
    have hψ : Summable (fun n ↦ ‖ψ n‖ ^ (2 : ℝ)) := (lp.memℓp ψ).summable (by norm_num)
    refine Summable.of_nonneg_of_le (fun n ↦ by positivity) (fun n ↦ ?_) (hψ.mul_left (B ^ 2))
    have h2 : (2 : ENNReal).toReal = 2 := by norm_num
    rw [h2, Real.rpow_two, Real.rpow_two, ← mul_pow]
    exact pow_le_pow_left₀ (norm_nonneg _) (hB n (ψ n)) 2
  let L : momentumFock μ →ₗ[ℂ] momentumFock μ :=
    { toFun := fun ψ ↦ ⟨fun n ↦ T n (ψ n), hmem ψ⟩
      map_add' := fun ψ φ ↦ lp.ext (funext fun n ↦ (T n).map_add (ψ n) (φ n))
      map_smul' := fun c ψ ↦ lp.ext (funext fun n ↦ (T n).map_smul c (ψ n)) }
  L.mkContinuous B fun ψ ↦ by
    have h2 : (2 : ENNReal).toReal = 2 := by norm_num
    have hψ : Summable (fun n ↦ ‖ψ n‖ ^ (2 : ℝ)) := (lp.memℓp ψ).summable (by norm_num)
    have hLψ : Summable (fun n ↦ ‖T n (ψ n)‖ ^ (2 : ℝ)) :=
      by simpa only [h2] using (hmem ψ).summable (by norm_num)
    have hsq : ‖L ψ‖ ^ 2 ≤ (B * ‖ψ‖) ^ 2 := by
      have hLnorm := lp.norm_rpow_eq_tsum (by norm_num : 0 < (2 : ENNReal).toReal) (L ψ)
      have hψnorm := lp.norm_rpow_eq_tsum (by norm_num : 0 < (2 : ENNReal).toReal) ψ
      simp only [h2, Real.rpow_two] at hLnorm hψnorm
      rw [hLnorm, mul_pow, hψnorm, ← tsum_mul_left]
      have hψ' : Summable (fun n ↦ ‖ψ n‖ ^ 2) := by simpa only [Real.rpow_two] using hψ
      have hLψ' : Summable (fun n ↦ ‖T n (ψ n)‖ ^ 2) := by simpa only [Real.rpow_two] using hLψ
      refine Summable.tsum_le_tsum (fun n ↦ ?_) hLψ' (hψ'.mul_left (B ^ 2))
      change ‖T n (ψ n)‖ ^ 2 ≤ B ^ 2 * ‖ψ n‖ ^ 2
      rw [← mul_pow]
      exact pow_le_pow_left₀ (norm_nonneg _) (hB n (ψ n)) 2
    nlinarith [norm_nonneg (L ψ), mul_nonneg hB_nn (norm_nonneg ψ)]

theorem fockDiag_apply
    (T : ∀ n, momentumSector μ n →L[ℂ] momentumSector μ n)
    {B : ℝ} (hB_nn : 0 ≤ B) (hB : ∀ n y, ‖T n y‖ ≤ B * ‖y‖)
    (ψ : momentumFock μ) (n : ℕ) :
    (fockDiag μ T hB_nn hB ψ) n = T n (ψ n) := rfl

theorem fockDiag_norm_le
    (T : ∀ n, momentumSector μ n →L[ℂ] momentumSector μ n)
    {B : ℝ} (hB_nn : 0 ≤ B) (hB : ∀ n y, ‖T n y‖ ≤ B * ‖y‖) :
    ‖fockDiag μ T hB_nn hB‖ ≤ B := by
  refine ContinuousLinearMap.opNorm_le_bound _ hB_nn fun ψ ↦ ?_
  have h2 : (2 : ENNReal).toReal = 2 := by norm_num
  have hψ : Summable (fun n ↦ ‖ψ n‖ ^ 2) := by
    simpa only [h2, Real.rpow_two] using (lp.memℓp ψ).summable (by norm_num)
  have hLψ : Summable (fun n ↦ ‖(fockDiag μ T hB_nn hB ψ) n‖ ^ 2) := by
    simpa only [h2, Real.rpow_two] using (lp.memℓp (fockDiag μ T hB_nn hB ψ)).summable (by norm_num)
  have hLnorm := lp.norm_rpow_eq_tsum (by norm_num : 0 < (2 : ENNReal).toReal)
    (fockDiag μ T hB_nn hB ψ)
  have hψnorm := lp.norm_rpow_eq_tsum (by norm_num : 0 < (2 : ENNReal).toReal) ψ
  simp only [h2, Real.rpow_two] at hLnorm hψnorm
  have hsq : ‖fockDiag μ T hB_nn hB ψ‖ ^ 2 ≤ (B * ‖ψ‖) ^ 2 := by
    rw [hLnorm, mul_pow, hψnorm, ← tsum_mul_left]
    refine Summable.tsum_le_tsum (fun n ↦ ?_) hLψ (hψ.mul_left (B ^ 2))
    rw [fockDiag_apply, ← mul_pow]
    exact pow_le_pow_left₀ (norm_nonneg _) (hB n (ψ n)) 2
  nlinarith [norm_nonneg (fockDiag μ T hB_nn hB ψ), mul_nonneg hB_nn (norm_nonneg ψ)]

theorem fockDiag_norm_eq
    (T : ∀ n, momentumSector μ n →L[ℂ] momentumSector μ n)
    {B : ℝ} (hB_nn : 0 ≤ B) (hB : ∀ n y, ‖T n y‖ ≤ B * ‖y‖)
    (hiso : ∀ n y, ‖T n y‖ = ‖y‖) (ψ : momentumFock μ) :
    ‖fockDiag μ T hB_nn hB ψ‖ = ‖ψ‖ := by
  have h2 : (2 : ENNReal).toReal = 2 := by norm_num
  have hLnorm := lp.norm_rpow_eq_tsum (by norm_num : 0 < (2 : ENNReal).toReal)
    (fockDiag μ T hB_nn hB ψ)
  have hψnorm := lp.norm_rpow_eq_tsum (by norm_num : 0 < (2 : ENNReal).toReal) ψ
  simp only [h2, Real.rpow_two] at hLnorm hψnorm
  have hsq : ‖fockDiag μ T hB_nn hB ψ‖ ^ 2 = ‖ψ‖ ^ 2 := by
    rw [hLnorm, hψnorm]
    congr 1
    funext n
    rw [fockDiag_apply, hiso]
  nlinarith [norm_nonneg (fockDiag μ T hB_nn hB ψ), norm_nonneg ψ]

end FockHelpers

end MomentumFock

section FockTheorems

variable {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]

/-- The complex linear span of coherent vectors `{E(u) | u ∈ L²(μ)}` is dense in
`momentumFock μ`. -/
theorem coherentVec_dense :
    (Submodule.span ℂ (Set.range (coherentVec μ))).topologicalClosure = ⊤ := by
  apply Submodule.topologicalClosure_eq_top_iff.2
  apply eq_bot_iff.mpr
  intro x hx
  change x = 0
  apply MomentumFock.coherentVec_separates μ x
  intro u
  exact Submodule.inner_left_of_mem_orthogonal
    (Submodule.subset_span (Set.mem_range_self u)) hx

/-- Real-label totality via Lagrange interpolation: if an `ℝ`-linear map `J : R →ₗ[ℝ] L²(μ)` has
dense complex span in the one-particle space `L²(μ)`, then `{E(J a) | a : R}` has dense complex
span in `momentumFock μ`. -/
theorem coherentVec_realLabels_dense {R : Type*} [AddCommGroup R] [Module ℝ R]
    (J : R →ₗ[ℝ] Lp ℂ 2 μ)
    (hJ : Dense (Submodule.span ℂ (Set.range J) : Set (Lp ℂ 2 μ))) :
    (Submodule.span ℂ (Set.range (fun a ↦ coherentVec μ (J a)))).topologicalClosure = ⊤ := by
  apply Submodule.topologicalClosure_eq_top_iff.mpr
  apply eq_bot_iff.mpr
  intro x hx
  change x = 0
  refine MomentumFock.coherent_separates (fun a ↦ coherentVec μ (J a)) (fun t a ↦ t • a) ?_
    (MomentumFock.realLabels_sector_separate μ J hJ) x ?_
  · intro t a n
    apply Subtype.ext
    change MomentumFock.scaledPower μ n (J (t • a)) =
      ((t ^ n : ℝ) : ℂ) • MomentumFock.scaledPower μ n (J a)
    rw [J.map_smul, Complex.ofReal_pow]
    exact MomentumFock.scaledPower_homogeneous μ n (t : ℂ) (J a)
  · intro a
    exact Submodule.inner_left_of_mem_orthogonal
      (Submodule.subset_span (Set.mem_range_self a)) hx

end FockTheorems

/-- End-to-end §3.1 totality theorem: for any measurable massive dispersion `ω(k) ≥ m > 0` and
nontrivial nonnegative integrable positive-time bump `h`, the real positive-half-space Schwartz
feature map `g ↦ realFixedProfileMap b hb g` generates a total coherent family in
`momentumFock volume`. -/
theorem coherentVec_realSchwartz_dense {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
    [MeasurableSpace E] [BorelSpace E]
    (ω : E → ℝ) (hω : Measurable ω) (m H : ℝ) (hm : 0 < m) (hH : 0 < H)
    (hgap : ∀ k, m ≤ ω k) (h : ℝ → ℝ) (hM : Measurable h)
    (hn : ∀ t, 0 ≤ h t) (hi : IntegrableOn h (Ioi (0 : ℝ)))
    (hh : 0 < ∫ t in Ioi (0 : ℝ), h t) :
    let b := fun k ↦ Real.sqrt (H / (2 * ω k)) * laplaceBump h (ω k)
    ∃ hb : MemLp (fun k ↦ (b k : ℂ)) (⊤ : ENNReal) (volume : Measure E),
      (Submodule.span ℂ (Set.range (fun g : SchwartzMap E ℝ ↦
        coherentVec (volume : Measure E) (realFixedProfileMap b hb g)))).topologicalClosure = ⊤ := by
  intro b
  obtain ⟨hb, hdense⟩ :=
    dense_complex_span_real_fixed_profile ω hω m H hm hH hgap h hM hn hi hh
  exact ⟨hb, coherentVec_realLabels_dense (volume : Measure E) (realFixedProfileMap b hb) hdense⟩

/-- Pointwise factorization of the reflected Euclidean exponential kernel into normalized
positive-half-space features. -/
theorem paper_kernel_feature_factor (ω h r s : ℝ) (hω : 0 < ω) (hh : 0 ≤ h) :
    h * (Real.exp (-ω * (r + s)) / (2 * ω)) =
      (Real.sqrt (h / (2 * ω)) * Real.exp (-ω * r)) *
        (Real.sqrt (h / (2 * ω)) * Real.exp (-ω * s)) := by
  have hexp : Real.exp (-ω * (r + s)) = Real.exp (-ω * r) * Real.exp (-ω * s) := by
    rw [← Real.exp_add]
    congr 1
    ring
  rw [hexp]
  calc
    h * (Real.exp (-ω * r) * Real.exp (-ω * s) / (2 * ω)) =
        (h / (2 * ω)) * (Real.exp (-ω * r) * Real.exp (-ω * s)) := by ring
    _ = (Real.sqrt (h / (2 * ω)) * Real.exp (-ω * r)) *
          (Real.sqrt (h / (2 * ω)) * Real.exp (-ω * s)) := by
      nth_rw 1 [← Real.sq_sqrt (div_nonneg hh (by positivity : 0 ≤ 2 * ω))]
      ring

/-! #### Euclidean Contraction Shift Semigroup `fockShift` & Lorentzian Unitary Group `fockUnitary` -/

section ShiftAndUnitary

variable {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]

/-- One-particle Euclidean shift contraction `u(k) ↦ e^{-s ω(k)} u(k)` on `Lp ℂ 2 μ` for `s ≥ 0`. -/
noncomputable def oneParticleShift (ω : X → ℝ) (hω : Measurable ω) (hω_nn : ∀ k, 0 ≤ ω k)
    (s : ℝ) (hs : 0 ≤ s) : Lp ℂ 2 μ →L[ℂ] Lp ℂ 2 μ :=
  FeatureDensity.complexMultiplier (MomentumFock.shiftWeight ω s)
    (MomentumFock.shiftWeight_memLp μ ω hω hω_nn hs)

/-- Second-quantized bounded positive contraction shift `fockShift s` (`s ≥ 0`) on
`momentumFock μ`, multiplying sector `n` by `exp(-s ∑_{j=1}^n ω(k_j))`. -/
noncomputable def fockShift (ω : X → ℝ) (hω : Measurable ω) (hω_nn : ∀ k, 0 ≤ ω k)
    (s : ℝ) (hs : 0 ≤ s) : momentumFock μ →L[ℂ] momentumFock μ :=
  MomentumFock.fockDiag μ
    (fun n ↦ MomentumFock.sectorProdMult μ n (MomentumFock.shiftWeight ω s)
      (MomentumFock.shiftWeight_memLp μ ω hω hω_nn hs)
      (MomentumFock.prodWeight_memLp μ n (MomentumFock.shiftWeight ω s)
        (MomentumFock.shiftWeight_measurable ω hω s)
        (MomentumFock.shiftWeight_norm_le_one ω hω_nn hs)))
    zero_le_one
    (fun n y ↦ by
      simpa only [one_pow] using
        MomentumFock.sectorProdMult_norm_le μ n (MomentumFock.shiftWeight ω s)
          (MomentumFock.shiftWeight_memLp μ ω hω hω_nn hs)
          (MomentumFock.prodWeight_memLp μ n (MomentumFock.shiftWeight ω s)
            (MomentumFock.shiftWeight_measurable ω hω s)
            (MomentumFock.shiftWeight_norm_le_one ω hω_nn hs))
          zero_le_one (MomentumFock.shiftWeight_norm_le_one ω hω_nn hs) y)

/-- On sector `n`, `fockShift s` multiplies a.e. by `exp(-s ∑_{j=1}^n ω(k_j))`. -/
theorem fockShift_apply_sector_ae (ω : X → ℝ) (hω : Measurable ω) (hω_nn : ∀ k, 0 ≤ ω k)
    (s : ℝ) (hs : 0 ≤ s) (ψ : momentumFock μ) (n : ℕ) :
    ((fockShift μ ω hω hω_nn s hs ψ n).1 : (Fin n → X) → ℂ) =ᵐ[MomentumFock.powerMeasure μ n]
      fun k ↦ ((Real.exp (-s * ∑ i : Fin n, ω (k i)) : ℝ) : ℂ) * (ψ n).1 k := by
  filter_upwards [FeatureDensity.complexMultiplier_apply_ae
    (MomentumFock.prodWeight n (MomentumFock.shiftWeight ω s))
    (MomentumFock.prodWeight_memLp μ n (MomentumFock.shiftWeight ω s)
      (MomentumFock.shiftWeight_measurable ω hω s)
      (MomentumFock.shiftWeight_norm_le_one ω hω_nn hs))
    (ψ n).1] with k hk
  rw [← MomentumFock.prodWeight_shiftWeight n ω s k]
  exact hk

/-- Coherent vector equivariance: `fockShift s (E(u)) = E(e^{-s ω} u)`. -/
theorem fockShift_coherent (ω : X → ℝ) (hω : Measurable ω) (hω_nn : ∀ k, 0 ≤ ω k)
    (s : ℝ) (hs : 0 ≤ s) (u : Lp ℂ 2 μ) :
    fockShift μ ω hω hω_nn s hs (coherentVec μ u) =
      coherentVec μ (oneParticleShift μ ω hω hω_nn s hs u) := by
  apply lp.ext
  funext n
  exact MomentumFock.sectorProdMult_sectorVec μ n (MomentumFock.shiftWeight ω s) _ _ u

/-- Contraction bound `‖fockShift s‖ ≤ 1`. -/
theorem fockShift_norm_le (ω : X → ℝ) (hω : Measurable ω) (hω_nn : ∀ k, 0 ≤ ω k)
    (s : ℝ) (hs : 0 ≤ s) :
    ‖fockShift μ ω hω hω_nn s hs‖ ≤ 1 :=
  MomentumFock.fockDiag_norm_le μ _ zero_le_one _

/-- Symmetry (self-adjointness) of `fockShift s`. -/
theorem fockShift_symmetric (ω : X → ℝ) (hω : Measurable ω) (hω_nn : ∀ k, 0 ≤ ω k)
    (s : ℝ) (hs : 0 ≤ s) (ψ φ : momentumFock μ) :
    inner ℂ (fockShift μ ω hω hω_nn s hs ψ) φ =
      inner ℂ ψ (fockShift μ ω hω hω_nn s hs φ) := by
  rw [lp.inner_eq_tsum, lp.inner_eq_tsum]
  congr 1
  funext n
  let r : (Fin n → X) → ℝ := fun k ↦ Real.exp (-s * ∑ i : Fin n, ω (k i))
  have hr : ∀ k : Fin n → X,
      MomentumFock.prodWeight n (MomentumFock.shiftWeight ω s) k = (r k : ℂ) :=
    MomentumFock.prodWeight_shiftWeight n ω s
  have hmem := MomentumFock.prodWeight_memLp μ n (MomentumFock.shiftWeight ω s)
    (MomentumFock.shiftWeight_measurable ω hω s)
    (MomentumFock.shiftWeight_norm_le_one ω hω_nn hs)
  have hmem' : MemLp (fun k ↦ (r k : ℂ)) (⊤ : ENNReal) (MomentumFock.powerMeasure μ n) := by
    simpa only [funext hr] using hmem
  have hsym := FeatureDensity.complexMultiplier_symmetric_of_real r hmem' (ψ n).1 (φ n).1
  change inner ℂ (FeatureDensity.complexMultiplier _ hmem (ψ n).1) (φ n).1 =
    inner ℂ (ψ n).1 (FeatureDensity.complexMultiplier _ hmem (φ n).1)
  have hcongr (y : Lp ℂ 2 (MomentumFock.powerMeasure μ n)) :
      FeatureDensity.complexMultiplier _ hmem y =
        FeatureDensity.complexMultiplier (fun k ↦ (r k : ℂ)) hmem' y := by
    apply Lp.ext
    filter_upwards [FeatureDensity.complexMultiplier_apply_ae _ hmem y,
      FeatureDensity.complexMultiplier_apply_ae (fun k ↦ (r k : ℂ)) hmem' y] with k h1 h2
    rw [h1, h2, hr]
  rw [hcongr (ψ n).1, hcongr (φ n).1, hsym]

/-- Positivity of `fockShift s`: `⟨fockShift s ψ, ψ⟩` is real and nonnegative. -/
theorem fockShift_inner_nonneg (ω : X → ℝ) (hω : Measurable ω) (hω_nn : ∀ k, 0 ≤ ω k)
    (s : ℝ) (hs : 0 ≤ s) (ψ : momentumFock μ) :
    0 ≤ (inner ℂ (fockShift μ ω hω hω_nn s hs ψ) ψ).re ∧
      (inner ℂ (fockShift μ ω hω hω_nn s hs ψ) ψ).im = 0 := by
  have hsum := lp.hasSum_inner (𝕜 := ℂ) (fockShift μ ω hω hω_nn s hs ψ) ψ
  have hsec (n : ℕ) :
      0 ≤ (inner ℂ ((fockShift μ ω hω hω_nn s hs ψ) n) (ψ n)).re ∧
        (inner ℂ ((fockShift μ ω hω hω_nn s hs ψ) n) (ψ n)).im = 0 := by
    let r : (Fin n → X) → ℝ := fun k ↦ Real.exp (-s * ∑ i : Fin n, ω (k i))
    have hr : ∀ k : Fin n → X,
        MomentumFock.prodWeight n (MomentumFock.shiftWeight ω s) k = (r k : ℂ) :=
      MomentumFock.prodWeight_shiftWeight n ω s
    have hmem := MomentumFock.prodWeight_memLp μ n (MomentumFock.shiftWeight ω s)
      (MomentumFock.shiftWeight_measurable ω hω s)
      (MomentumFock.shiftWeight_norm_le_one ω hω_nn hs)
    have hmem' : MemLp (fun k ↦ (r k : ℂ)) (⊤ : ENNReal) (MomentumFock.powerMeasure μ n) := by
      simpa only [funext hr] using hmem
    have hcongr :
        FeatureDensity.complexMultiplier _ hmem (ψ n).1 =
          FeatureDensity.complexMultiplier (fun k ↦ (r k : ℂ)) hmem' (ψ n).1 := by
      apply Lp.ext
      filter_upwards [FeatureDensity.complexMultiplier_apply_ae _ hmem (ψ n).1,
        FeatureDensity.complexMultiplier_apply_ae (fun k ↦ (r k : ℂ)) hmem' (ψ n).1] with k h1 h2
      rw [h1, h2, hr]
    change 0 ≤ (inner ℂ (FeatureDensity.complexMultiplier _ hmem (ψ n).1) (ψ n).1).re ∧
      (inner ℂ (FeatureDensity.complexMultiplier _ hmem (ψ n).1) (ψ n).1).im = 0
    rw [hcongr]
    exact FeatureDensity.complexMultiplier_inner_nonneg_of_nonneg r hmem'
      (fun k ↦ (Real.exp_pos _).le) (ψ n).1
  have hre : HasSum (fun n ↦ (inner ℂ ((fockShift μ ω hω hω_nn s hs ψ) n) (ψ n)).re)
      (inner ℂ (fockShift μ ω hω hω_nn s hs ψ) ψ).re :=
    Complex.reCLM.hasSum hsum
  have him : HasSum (fun n ↦ (inner ℂ ((fockShift μ ω hω hω_nn s hs ψ) n) (ψ n)).im)
      (inner ℂ (fockShift μ ω hω hω_nn s hs ψ) ψ).im :=
    Complex.imCLM.hasSum hsum
  refine ⟨?_, ?_⟩
  · rw [← hre.tsum_eq]
    exact tsum_nonneg fun n ↦ (hsec n).1
  · rw [← him.tsum_eq]
    have him0 : (fun n ↦ (inner ℂ ((fockShift μ ω hω hω_nn s hs ψ) n) (ψ n)).im) = fun _ ↦ 0 :=
      funext fun n ↦ (hsec n).2
    rw [him0, tsum_zero]

/-- Identity at `s = 0`: `fockShift 0 = id`. -/
theorem fockShift_zero (ω : X → ℝ) (hω : Measurable ω) (hω_nn : ∀ k, 0 ≤ ω k) :
    fockShift μ ω hω hω_nn 0 le_rfl = ContinuousLinearMap.id ℂ (momentumFock μ) := by
  apply ContinuousLinearMap.ext; intro ψ
  apply lp.ext; funext n
  apply Subtype.ext; apply Lp.ext
  filter_upwards [fockShift_apply_sector_ae μ ω hω hω_nn 0 le_rfl ψ n] with k hk
  simpa only [ContinuousLinearMap.id_apply, neg_zero, zero_mul, Real.exp_zero,
    Complex.ofReal_one, one_mul] using hk

/-- Semigroup law: `fockShift (s₁ + s₂) = fockShift s₁ ∘ fockShift s₂`. -/
theorem fockShift_add (ω : X → ℝ) (hω : Measurable ω) (hω_nn : ∀ k, 0 ≤ ω k)
    (s₁ s₂ : ℝ) (hs₁ : 0 ≤ s₁) (hs₂ : 0 ≤ s₂) :
    fockShift μ ω hω hω_nn (s₁ + s₂) (add_nonneg hs₁ hs₂) =
      (fockShift μ ω hω hω_nn s₁ hs₁).comp (fockShift μ ω hω hω_nn s₂ hs₂) := by
  apply ContinuousLinearMap.ext; intro ψ
  apply lp.ext; funext n
  apply Subtype.ext; apply Lp.ext
  rw [ContinuousLinearMap.comp_apply]
  filter_upwards [
    fockShift_apply_sector_ae μ ω hω hω_nn (s₁ + s₂) (add_nonneg hs₁ hs₂) ψ n,
    fockShift_apply_sector_ae μ ω hω hω_nn s₁ hs₁ (fockShift μ ω hω hω_nn s₂ hs₂ ψ) n,
    fockShift_apply_sector_ae μ ω hω hω_nn s₂ hs₂ ψ n] with k h12 h1 h2
  have hexp : Real.exp (-(s₁ + s₂) * ∑ i : Fin n, ω (k i)) =
      Real.exp (-s₁ * ∑ i : Fin n, ω (k i)) * Real.exp (-s₂ * ∑ i : Fin n, ω (k i)) := by
    rw [← Real.exp_add]
    congr 1
    ring
  rw [h12, h1, h2, hexp, Complex.ofReal_mul, mul_assoc]

/-- Vacuum invariance under Euclidean time shift: `fockShift s Ω = Ω`. -/
theorem fockShift_vacuum (ω : X → ℝ) (hω : Measurable ω) (hω_nn : ∀ k, 0 ≤ ω k)
    (s : ℝ) (hs : 0 ≤ s) :
    fockShift μ ω hω hω_nn s hs (fockVacuum μ) = fockVacuum μ := by
  unfold fockVacuum
  rw [fockShift_coherent, map_zero]

/-- Mass-gap sector contraction: if `ω(k) ≥ m ≥ 0` everywhere, then sector `n` decays by at least
`exp(-s n m)`. -/
theorem fockShift_sector_norm_le (ω : X → ℝ) (hω : Measurable ω)
    {m : ℝ} (hm : 0 ≤ m) (hgap : ∀ k, m ≤ ω k)
    (s : ℝ) (hs : 0 ≤ s) (ψ : momentumFock μ) (n : ℕ) :
    ‖(fockShift μ ω hω (fun k ↦ hm.trans (hgap k)) s hs ψ) n‖ ≤
      Real.exp (-s * (n : ℝ) * m) * ‖ψ n‖ := by
  have hbound : ‖(fockShift μ ω hω (fun k ↦ hm.trans (hgap k)) s hs ψ) n‖ ≤
      Real.exp (-s * m) ^ n * ‖ψ n‖ :=
    MomentumFock.sectorProdMult_norm_le μ n (MomentumFock.shiftWeight ω s)
      (MomentumFock.shiftWeight_memLp μ ω hω (fun k ↦ hm.trans (hgap k)) hs)
      (MomentumFock.prodWeight_memLp μ n (MomentumFock.shiftWeight ω s)
        (MomentumFock.shiftWeight_measurable ω hω s)
        (MomentumFock.shiftWeight_norm_le_one ω (fun k ↦ hm.trans (hgap k)) hs))
      (Real.exp_pos _).le (MomentumFock.shiftWeight_norm_le_gap ω hgap hs) (ψ n)
  have hexp : Real.exp (-s * m) ^ n = Real.exp (-s * (n : ℝ) * m) := by
    rw [← Real.exp_nat_mul]
    congr 1
    ring
  exact hbound.trans_eq (by rw [hexp])

/-- Vacuum uniqueness from the mass gap: for `m > 0`, `ω(k) ≥ m`, and `s > 0`, the fixed-point
subspace of `fockShift s` is precisely the 1-dimensional vacuum line `ℂ · Ω`. -/
theorem fockShift_fixed_iff_mem_vacuum (ω : X → ℝ) (hω : Measurable ω)
    {m : ℝ} (hm : 0 < m) (hgap : ∀ k, m ≤ ω k)
    {s : ℝ} (hs : 0 < s) (ψ : momentumFock μ) :
    fockShift μ ω hω (fun k ↦ hm.le.trans (hgap k)) s hs.le ψ = ψ ↔
      ψ ∈ Submodule.span ℂ {fockVacuum μ} := by
  constructor
  · intro hfix
    rw [Submodule.mem_span_singleton]
    refine ⟨inner ℂ (sectorVec μ 0 0) (ψ 0), ?_⟩
    apply lp.ext
    funext n
    cases n with
    | zero =>
      exact (MomentumFock.sector_zero_eq_smul μ (ψ 0)).symm
    | succ k =>
      have hsec : ‖ψ (k + 1)‖ ≤ Real.exp (-s * ((k + 1 : ℕ) : ℝ) * m) * ‖ψ (k + 1)‖ := by
        have h := fockShift_sector_norm_le μ ω hω hm.le hgap s hs.le ψ (k + 1)
        rwa [hfix] at h
      have hneg : -s * ((k + 1 : ℕ) : ℝ) * m < 0 := by
        have hk : (0 : ℝ) < ((k + 1 : ℕ) : ℝ) := by positivity
        nlinarith [mul_pos hs hk]
      have hlt : Real.exp (-s * ((k + 1 : ℕ) : ℝ) * m) < 1 := Real.exp_lt_one_iff.mpr hneg
      have hnorm0 : ‖ψ (k + 1)‖ = 0 := by nlinarith [norm_nonneg (ψ (k + 1))]
      have hψ0 : ψ (k + 1) = 0 := norm_eq_zero.mp hnorm0
      change inner ℂ (sectorVec μ 0 0) (ψ 0) • sectorVec μ (k + 1) 0 = ψ (k + 1)
      rw [MomentumFock.sectorVec_succ_zero, smul_zero, hψ0]
  · intro hmem
    rw [Submodule.mem_span_singleton] at hmem
    obtain ⟨c, rfl⟩ := hmem
    rw [map_smul, fockShift_vacuum]

/-- One-particle Lorentzian unitary evolution `u(k) ↦ e^{-i t ω(k)} u(k)` on `Lp ℂ 2 μ`. -/
noncomputable def oneParticleUnitary (ω : X → ℝ) (hω : Measurable ω) (t : ℝ) :
    Lp ℂ 2 μ →L[ℂ] Lp ℂ 2 μ :=
  FeatureDensity.complexMultiplier (MomentumFock.unitaryWeight ω t)
    (MomentumFock.unitaryWeight_memLp μ ω hω t)

/-- Second-quantized unitary time-evolution operator `fockUnitary t` (`t : ℝ`) on `momentumFock μ`,
multiplying sector `n` by `exp(-i t ∑_{j=1}^n ω(k_j))`. -/
noncomputable def fockUnitary (ω : X → ℝ) (hω : Measurable ω) (t : ℝ) :
    momentumFock μ →L[ℂ] momentumFock μ :=
  MomentumFock.fockDiag μ
    (fun n ↦ MomentumFock.sectorProdMult μ n (MomentumFock.unitaryWeight ω t)
      (MomentumFock.unitaryWeight_memLp μ ω hω t)
      (MomentumFock.prodWeight_memLp μ n (MomentumFock.unitaryWeight ω t)
        (MomentumFock.unitaryWeight_measurable ω hω t)
        (fun k ↦ (MomentumFock.unitaryWeight_norm ω t k).le)))
    zero_le_one
    (fun n y ↦ by
      simpa only [one_pow] using
        MomentumFock.sectorProdMult_norm_le μ n (MomentumFock.unitaryWeight ω t)
          (MomentumFock.unitaryWeight_memLp μ ω hω t)
          (MomentumFock.prodWeight_memLp μ n (MomentumFock.unitaryWeight ω t)
            (MomentumFock.unitaryWeight_measurable ω hω t)
            (fun k ↦ (MomentumFock.unitaryWeight_norm ω t k).le))
          zero_le_one (fun k ↦ (MomentumFock.unitaryWeight_norm ω t k).le) y)

/-- On sector `n`, `fockUnitary t` multiplies a.e. by `exp(-i t ∑_{j=1}^n ω(k_j))`. -/
theorem fockUnitary_apply_sector_ae (ω : X → ℝ) (hω : Measurable ω) (t : ℝ)
    (ψ : momentumFock μ) (n : ℕ) :
    ((fockUnitary μ ω hω t ψ n).1 : (Fin n → X) → ℂ) =ᵐ[MomentumFock.powerMeasure μ n]
      fun k ↦ Complex.exp (((-(t * ∑ i : Fin n, ω (k i)) : ℝ) : ℂ) * Complex.I) *
        (ψ n).1 k := by
  filter_upwards [FeatureDensity.complexMultiplier_apply_ae
    (MomentumFock.prodWeight n (MomentumFock.unitaryWeight ω t))
    (MomentumFock.prodWeight_memLp μ n (MomentumFock.unitaryWeight ω t)
      (MomentumFock.unitaryWeight_measurable ω hω t)
      (fun k ↦ (MomentumFock.unitaryWeight_norm ω t k).le))
    (ψ n).1] with k hk
  rw [← MomentumFock.prodWeight_unitaryWeight n ω t k]
  exact hk

/-- Coherent vector equivariance: `fockUnitary t (E(u)) = E(e^{-i t ω} u)`. -/
theorem fockUnitary_coherent (ω : X → ℝ) (hω : Measurable ω) (t : ℝ) (u : Lp ℂ 2 μ) :
    fockUnitary μ ω hω t (coherentVec μ u) =
      coherentVec μ (oneParticleUnitary μ ω hω t u) := by
  apply lp.ext
  funext n
  exact MomentumFock.sectorProdMult_sectorVec μ n (MomentumFock.unitaryWeight ω t) _ _ u

/-- Identity at `t = 0`: `fockUnitary 0 = id`. -/
theorem fockUnitary_zero (ω : X → ℝ) (hω : Measurable ω) :
    fockUnitary μ ω hω 0 = ContinuousLinearMap.id ℂ (momentumFock μ) := by
  apply ContinuousLinearMap.ext; intro ψ
  apply lp.ext; funext n
  apply Subtype.ext; apply Lp.ext
  filter_upwards [fockUnitary_apply_sector_ae μ ω hω 0 ψ n] with k hk
  simpa only [ContinuousLinearMap.id_apply, zero_mul, neg_zero, Complex.ofReal_zero,
    Complex.exp_zero, one_mul] using hk

/-- One-parameter group law: `fockUnitary (t₁ + t₂) = fockUnitary t₁ ∘ fockUnitary t₂`. -/
theorem fockUnitary_add (ω : X → ℝ) (hω : Measurable ω) (t₁ t₂ : ℝ) :
    fockUnitary μ ω hω (t₁ + t₂) =
      (fockUnitary μ ω hω t₁).comp (fockUnitary μ ω hω t₂) := by
  apply ContinuousLinearMap.ext; intro ψ
  apply lp.ext; funext n
  apply Subtype.ext; apply Lp.ext
  rw [ContinuousLinearMap.comp_apply]
  filter_upwards [
    fockUnitary_apply_sector_ae μ ω hω (t₁ + t₂) ψ n,
    fockUnitary_apply_sector_ae μ ω hω t₁ (fockUnitary μ ω hω t₂ ψ) n,
    fockUnitary_apply_sector_ae μ ω hω t₂ ψ n] with k h12 h1 h2
  have hexp :
      Complex.exp (((-((t₁ + t₂) * ∑ i : Fin n, ω (k i)) : ℝ) : ℂ) * Complex.I) =
        Complex.exp (((-(t₁ * ∑ i : Fin n, ω (k i)) : ℝ) : ℂ) * Complex.I) *
          Complex.exp (((-(t₂ * ∑ i : Fin n, ω (k i)) : ℝ) : ℂ) * Complex.I) := by
    rw [← Complex.exp_add]
    congr 1
    push_cast
    ring
  rw [h12, h1, h2, hexp, mul_assoc]

/-- Exact norm preservation (isometry): `‖fockUnitary t ψ‖ = ‖ψ‖`. -/
theorem fockUnitary_norm (ω : X → ℝ) (hω : Measurable ω) (t : ℝ) (ψ : momentumFock μ) :
    ‖fockUnitary μ ω hω t ψ‖ = ‖ψ‖ :=
  MomentumFock.fockDiag_norm_eq μ _ zero_le_one _
    (fun n y ↦ MomentumFock.sectorProdMult_norm_eq μ n (MomentumFock.unitaryWeight ω t) _ _
      (MomentumFock.unitaryWeight_norm ω t) y) ψ

/-- Packaging `fockUnitary t` as a surjective unitary equivalence
`momentumFock μ ≃ₗᵢ[ℂ] momentumFock μ` with inverse `fockUnitary (-t)`. -/
noncomputable def fockUnitaryEquiv (ω : X → ℝ) (hω : Measurable ω) (t : ℝ) :
    momentumFock μ ≃ₗᵢ[ℂ] momentumFock μ where
  toLinearEquiv :=
    { toLinearMap := (fockUnitary μ ω hω t).toLinearMap
      invFun := fockUnitary μ ω hω (-t)
      left_inv := fun ψ ↦ by
        have h := congrArg (fun T : momentumFock μ →L[ℂ] momentumFock μ ↦ T ψ)
          ((fockUnitary_add μ ω hω (-t) t).symm.trans
            (by simpa only [neg_add_cancel] using fockUnitary_zero μ ω hω))
        exact h
      right_inv := fun ψ ↦ by
        have h := congrArg (fun T : momentumFock μ →L[ℂ] momentumFock μ ↦ T ψ)
          ((fockUnitary_add μ ω hω t (-t)).symm.trans
            (by simpa only [add_neg_cancel] using fockUnitary_zero μ ω hω))
        exact h }
  norm_map' := fockUnitary_norm μ ω hω t

/-- Inner-product preservation: `⟨fockUnitary t ψ, fockUnitary t φ⟩ = ⟨ψ, φ⟩`. -/
theorem fockUnitary_inner (ω : X → ℝ) (hω : Measurable ω) (t : ℝ) (ψ φ : momentumFock μ) :
    inner ℂ (fockUnitary μ ω hω t ψ) (fockUnitary μ ω hω t φ) = inner ℂ ψ φ :=
  (fockUnitaryEquiv μ ω hω t).inner_map_map ψ φ

/-- Vacuum invariance under Lorentzian unitary evolution: `fockUnitary t Ω = Ω`. -/
theorem fockUnitary_vacuum (ω : X → ℝ) (hω : Measurable ω) (t : ℝ) :
    fockUnitary μ ω hω t (fockVacuum μ) = fockVacuum μ := by
  unfold fockVacuum
  rw [fockUnitary_coherent, map_zero]

end ShiftAndUnitary

end MomentumFock

/-!
==============================================================================
  PART 6: EVOLUTION, EXACT `Dom(H)`, UNCERTAINTY & NONREL LIMIT (§3.2)
==============================================================================
-/

/-! ### §3.2 Unitary Evolution `i ħ ψ̇ = H ψ` on `Dom(H)` Directly on `momentumFock` -/
section MomentumFockDomH

open MeasureTheory Filter Set
open scoped InnerProductSpace BigOperators Topology

/-- Total `n`-particle energy `E_n(k) = ħ ∑_{j : Fin n} ω(k_j)` for a general dispersion `ω`. -/
def sectorEnergy {X : Type*} (ħ : ℝ) (ω : X → ℝ) (n : ℕ) (k : Fin n → X) : ℝ :=
  ħ * ∑ j : Fin n, ω (k j)

/-- Relativistic `n`-particle sector energy `E_n(k) = ħ ∑_{j : Fin n} √(‖k_j‖² + m²)`. -/
noncomputable def modeSectorEnergy {d : ℕ} (ħ m : ℝ) (n : ℕ)
    (k : Fin n → EuclideanSpace ℝ (Fin d)) : ℝ :=
  sectorEnergy ħ (modeDispersion m) n k

/-- Exact Hamiltonian domain `Dom(H)` on continuous-momentum Fock space `momentumFock μ`:
sectorwise square-integrability of `E_n(k) · ψ_n(k)` together with `ℓ²` summability across
particle sectors `n : ℕ`. -/
def fockDomH {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (ħ : ℝ) (ω : X → ℝ) (ψ : momentumFock μ) : Prop :=
  (∀ n : ℕ, Integrable (fun k : Fin n → X ↦ (sectorEnergy ħ ω n k) ^ 2 * ‖(ψ n).1 k‖ ^ 2)
    (MomentumFock.powerMeasure μ n)) ∧
  Summable (fun n : ℕ ↦
    ∫ k : Fin n → X, (sectorEnergy ħ ω n k) ^ 2 * ‖(ψ n).1 k‖ ^ 2 ∂(MomentumFock.powerMeasure μ n))

namespace MomentumFockDomH

/-- Total `n`-particle frequency `Ω_n(k) = ∑_{j : Fin n} ω(k_j)`. -/
def sectorFreq {X : Type*} (ω : X → ℝ) (n : ℕ) (k : Fin n → X) : ℝ :=
  ∑ j : Fin n, ω (k j)

lemma measurable_sectorFreq {X : Type*} [MeasurableSpace X] (ω : X → ℝ) (hω : Measurable ω)
    (n : ℕ) : Measurable (sectorFreq ω n) := by
  unfold sectorFreq
  exact Finset.measurable_sum _ fun j _ ↦ hω.comp (measurable_pi_apply j)

lemma measurable_sectorEnergy {X : Type*} [MeasurableSpace X] (ħ : ℝ) (ω : X → ℝ)
    (hω : Measurable ω) (n : ℕ) : Measurable (sectorEnergy ħ ω n) :=
  measurable_const.mul (measurable_sectorFreq ω hω n)

lemma sectorEnergy_eq_mul_sectorFreq {X : Type*} (ħ : ℝ) (ω : X → ℝ) (n : ℕ) (k : Fin n → X) :
    sectorEnergy ħ ω n k = ħ * sectorFreq ω n k := rfl

lemma hasDerivAt_phase (r : ℝ) :
    HasDerivAt (fun t : ℝ ↦ Complex.exp (((-(t * r) : ℝ) : ℂ) * Complex.I))
      (-(r : ℂ) * Complex.I) 0 := by
  have hc : HasDerivAt (fun t : ℂ ↦ t * (-(r : ℂ) * Complex.I)) (-(r : ℂ) * Complex.I) 0 := by
    simpa using (hasDerivAt_id (0 : ℂ)).mul_const (-(r : ℂ) * Complex.I)
  convert hc.cexp.comp_ofReal (z := (0 : ℝ)) using 1
  · funext t; congr 1; push_cast; ring
  · simp

lemma phase_slope_bound (r t : ℝ) :
    ‖t⁻¹ • (Complex.exp (((-(t * r) : ℝ) : ℂ) * Complex.I) - 1)‖ ≤ |r| := by
  by_cases ht : t = 0
  · simp [ht]
  rw [show Complex.exp (((-(t * r) : ℝ) : ℂ) * Complex.I) =
      Complex.exp (Complex.I * ((-t * r : ℝ) : ℂ)) by congr 1; push_cast; ring,
    norm_smul, norm_inv]
  calc
    ‖t‖⁻¹ * ‖Complex.exp (Complex.I * ((-t * r : ℝ) : ℂ)) - 1‖
        ≤ ‖t‖⁻¹ * ‖-t * r‖ :=
      mul_le_mul_of_nonneg_left Real.norm_exp_I_mul_ofReal_sub_one_le (by positivity)
    _ = |r| := by
      rw [norm_mul, norm_neg, ← mul_assoc, inv_mul_cancel₀ (norm_ne_zero_iff.mpr ht), one_mul,
        Real.norm_eq_abs]

lemma phase_diff_bound (r t : ℝ) :
    ‖t⁻¹ • (Complex.exp (((-(t * r) : ℝ) : ℂ) * Complex.I) - 1) - (-(r : ℂ) * Complex.I)‖ ≤
      2 * |r| := by
  calc
    ‖t⁻¹ • (Complex.exp (((-(t * r) : ℝ) : ℂ) * Complex.I) - 1) - (-(r : ℂ) * Complex.I)‖
        ≤ ‖t⁻¹ • (Complex.exp (((-(t * r) : ℝ) : ℂ) * Complex.I) - 1)‖ +
            ‖-(r : ℂ) * Complex.I‖ := norm_sub_le _ _
    _ ≤ |r| + |r| := by
      gcongr
      · exact phase_slope_bound r t
      · simp [Complex.norm_real]
    _ = 2 * |r| := by ring

lemma memLp_sectorEnergy_mul {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (ħ : ℝ) (ω : X → ℝ) (hω : Measurable ω) (ψ : momentumFock μ) (n : ℕ)
    (hint : Integrable (fun k : Fin n → X ↦ (sectorEnergy ħ ω n k) ^ 2 * ‖(ψ n).1 k‖ ^ 2)
      (MomentumFock.powerMeasure μ n)) :
    MemLp (fun k : Fin n → X ↦ ((sectorEnergy ħ ω n k : ℝ) : ℂ) * (ψ n).1 k) 2
      (MomentumFock.powerMeasure μ n) := by
  have hmeas : AEStronglyMeasurable
      (fun k : Fin n → X ↦ ((sectorEnergy ħ ω n k : ℝ) : ℂ) * (ψ n).1 k)
      (MomentumFock.powerMeasure μ n) :=
    (Complex.continuous_ofReal.measurable.comp
      (measurable_sectorEnergy ħ ω hω n)).aestronglyMeasurable.mul
      (Lp.aestronglyMeasurable (ψ n).1)
  refine (memLp_two_iff_integrable_sq_norm hmeas).mpr ?_
  refine hint.congr (ae_of_all _ fun k ↦ ?_)
  dsimp only
  rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, mul_pow, sq_abs]

lemma memLp_negI_sectorFreq_mul {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (ω : X → ℝ) (hω : Measurable ω) (ψ : momentumFock μ) (n : ℕ)
    (hint : Integrable (fun k : Fin n → X ↦ (sectorFreq ω n k) ^ 2 * ‖(ψ n).1 k‖ ^ 2)
      (MomentumFock.powerMeasure μ n)) :
    MemLp (fun k : Fin n → X ↦ (-(sectorFreq ω n k : ℂ) * Complex.I) * (ψ n).1 k) 2
      (MomentumFock.powerMeasure μ n) := by
  have hmeas : AEStronglyMeasurable
      (fun k : Fin n → X ↦ (-(sectorFreq ω n k : ℂ) * Complex.I) * (ψ n).1 k)
      (MomentumFock.powerMeasure μ n) :=
    (((Complex.continuous_ofReal.measurable.comp
      (measurable_sectorFreq ω hω n)).neg).mul measurable_const).aestronglyMeasurable.mul
      (Lp.aestronglyMeasurable (ψ n).1)
  refine (memLp_two_iff_integrable_sq_norm hmeas).mpr ?_
  refine hint.congr (ae_of_all _ fun k ↦ ?_)
  dsimp only
  rw [norm_mul, norm_mul, norm_neg, Complex.norm_real, Real.norm_eq_abs, Complex.norm_I, mul_one,
    mul_pow, sq_abs]

/-- On sector `n`, if `Ω_n · ψ_n ∈ L²`, then the difference quotient of `fockUnitary` converges in
`L²` to `(-i Ω_n) · ψ_n` as `t → 0` (`t ≠ 0`), with a uniform `L²`-norm-squared bound
`‖q_n(t) - (-i Ω_n ψ_n)‖² ≤ 4 ∫ Ω_n² ‖ψ_n‖²`. -/
lemma sector_slope_tendsto_and_bound {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (ω : X → ℝ) (hω : Measurable ω) (ψ : momentumFock μ) (n : ℕ)
    (hint : Integrable (fun k : Fin n → X ↦ (sectorFreq ω n k) ^ 2 * ‖(ψ n).1 k‖ ^ 2)
      (MomentumFock.powerMeasure μ n)) :
    (∀ t : ℝ,
      ‖t⁻¹ • ((fockUnitary μ ω hω t ψ n).1 - (ψ n).1) -
        (memLp_negI_sectorFreq_mul μ ω hω ψ n hint).toLp _‖ ^ 2 ≤
      4 * ∫ k, (sectorFreq ω n k) ^ 2 * ‖(ψ n).1 k‖ ^ 2 ∂(MomentumFock.powerMeasure μ n)) ∧
    Tendsto (fun t : ℝ ↦
      ‖t⁻¹ • ((fockUnitary μ ω hω t ψ n).1 - (ψ n).1) -
        (memLp_negI_sectorFreq_mul μ ω hω ψ n hint).toLp _‖ ^ 2)
      (𝓝[≠] 0) (𝓝 0) := by
  let v : Lp ℂ 2 (MomentumFock.powerMeasure μ n) :=
    (memLp_negI_sectorFreq_mul μ ω hω ψ n hint).toLp _
  let F : ℝ → (Fin n → X) → ℝ := fun t k ↦
    ‖(t⁻¹ • (Complex.exp (((-(t * sectorFreq ω n k) : ℝ) : ℂ) * Complex.I) - 1) -
      (-(sectorFreq ω n k : ℂ) * Complex.I)) * (ψ n).1 k‖ ^ 2
  have hnorm_eq : ∀ t : ℝ,
      ‖t⁻¹ • ((fockUnitary μ ω hω t ψ n).1 - (ψ n).1) - v‖ ^ 2 =
        ∫ k, F t k ∂(MomentumFock.powerMeasure μ n) := by
    intro t
    rw [FeatureDensity.l2_norm_sq_eq_integral]
    refine integral_congr_ae ?_
    filter_upwards [
      Lp.coeFn_sub (t⁻¹ • ((fockUnitary μ ω hω t ψ n).1 - (ψ n).1)) v,
      Lp.coeFn_smul t⁻¹ ((fockUnitary μ ω hω t ψ n).1 - (ψ n).1),
      Lp.coeFn_sub (fockUnitary μ ω hω t ψ n).1 (ψ n).1,
      fockUnitary_apply_sector_ae μ ω hω t ψ n,
      (memLp_negI_sectorFreq_mul μ ω hω ψ n hint).coeFn_toLp] with k hsub1 hsmul hsub2 hu hv
    have hv' : (v : (Fin n → X) → ℂ) k =
        (-(sectorFreq ω n k : ℂ) * Complex.I) * (ψ n).1 k := hv
    rw [hsub1, Pi.sub_apply, hsmul, Pi.smul_apply, hsub2, Pi.sub_apply, hu, hv']
    congr 2
    simp only [sectorFreq, Complex.real_smul]
    ring
  have hF_meas : ∀ t : ℝ, AEStronglyMeasurable (F t) (MomentumFock.powerMeasure μ n) := by
    intro t
    have h1 : Measurable (fun k : Fin n → X ↦
        t⁻¹ • (Complex.exp (((-(t * sectorFreq ω n k) : ℝ) : ℂ) * Complex.I) - 1) -
          (-(sectorFreq ω n k : ℂ) * Complex.I)) := by
      have hΩ := measurable_sectorFreq ω hω n
      have hcΩ : Measurable (fun k ↦ (sectorFreq ω n k : ℂ)) :=
        Complex.continuous_ofReal.measurable.comp hΩ
      have hexp : Measurable (fun k ↦
          Complex.exp (((-(t * sectorFreq ω n k) : ℝ) : ℂ) * Complex.I)) :=
        Complex.continuous_exp.measurable.comp
          ((Complex.continuous_ofReal.measurable.comp (measurable_const.mul hΩ).neg).mul
            measurable_const)
      exact ((hexp.sub measurable_const).const_smul t⁻¹).sub (hcΩ.neg.mul measurable_const)
    exact ((h1.aestronglyMeasurable.mul (Lp.aestronglyMeasurable (ψ n).1)).norm).pow 2
  have hF_bound : ∀ t : ℝ, ∀ k : Fin n → X,
      ‖F t k‖ ≤ 4 * ((sectorFreq ω n k) ^ 2 * ‖(ψ n).1 k‖ ^ 2) := by
    intro t k
    rw [Real.norm_of_nonneg (sq_nonneg _)]
    have hb : ‖(t⁻¹ • (Complex.exp (((-(t * sectorFreq ω n k) : ℝ) : ℂ) * Complex.I) - 1) -
        (-(sectorFreq ω n k : ℂ) * Complex.I)) * (ψ n).1 k‖ ≤
        2 * |sectorFreq ω n k| * ‖(ψ n).1 k‖ := by
      rw [norm_mul]
      exact mul_le_mul_of_nonneg_right (phase_diff_bound (sectorFreq ω n k) t) (norm_nonneg _)
    have hsq := pow_le_pow_left₀ (norm_nonneg _) hb 2
    calc
      F t k ≤ (2 * |sectorFreq ω n k| * ‖(ψ n).1 k‖) ^ 2 := hsq
      _ = 4 * ((sectorFreq ω n k) ^ 2 * ‖(ψ n).1 k‖ ^ 2) := by
        rw [mul_pow, mul_pow, sq_abs]
        ring
  have hF_int : ∀ t : ℝ, Integrable (F t) (MomentumFock.powerMeasure μ n) := fun t ↦
    (hint.const_mul 4).mono' (hF_meas t) (ae_of_all _ (hF_bound t))
  constructor
  · intro t
    change ‖t⁻¹ • ((fockUnitary μ ω hω t ψ n).1 - (ψ n).1) - v‖ ^ 2 ≤ _
    rw [hnorm_eq t, ← integral_const_mul]
    refine integral_mono (hF_int t) (hint.const_mul 4) fun k ↦ ?_
    exact (le_abs_self (F t k)).trans (by simpa only [Real.norm_eq_abs] using hF_bound t k)
  · have hlim : ∀ᵐ k ∂(MomentumFock.powerMeasure μ n),
        Tendsto (fun t : ℝ ↦ F t k) (𝓝[≠] 0) (𝓝 0) :=
      ae_of_all _ fun k ↦ by
        have h1 : Tendsto (fun t : ℝ ↦
            t⁻¹ • (Complex.exp (((-(t * sectorFreq ω n k) : ℝ) : ℂ) * Complex.I) - 1))
            (𝓝[≠] 0) (𝓝 (-(sectorFreq ω n k : ℂ) * Complex.I)) := by
          simpa [zero_add, zero_mul, neg_zero, Complex.ofReal_zero, Complex.exp_zero] using
            (hasDerivAt_phase (sectorFreq ω n k)).tendsto_slope_zero
        have h2 := ((h1.sub (tendsto_const_nhds (x := -(sectorFreq ω n k : ℂ) * Complex.I))).mul_const
          ((ψ n).1 k)).norm.pow 2
        simpa [F] using h2
    have hint_lim : Tendsto (fun t : ℝ ↦ ∫ k, F t k ∂(MomentumFock.powerMeasure μ n))
        (𝓝[≠] 0) (𝓝 0) := by
      simpa only [integral_zero] using
        tendsto_integral_filter_of_dominated_convergence
          (fun k ↦ 4 * ((sectorFreq ω n k) ^ 2 * ‖(ψ n).1 k‖ ^ 2))
          (Eventually.of_forall hF_meas)
          (Eventually.of_forall fun t ↦ ae_of_all _ (hF_bound t))
          (hint.const_mul 4) hlim
    exact hint_lim.congr fun t ↦ (hnorm_eq t).symm

/-- Multiplying a symmetric `n`-particle sector state by `E_n(k) = ħ ∑ ω(k_j)` preserves
`momentumSector μ n`, proved via the closedness of `momentumSector μ n` and the `L²` convergence
of the unitary difference quotient. -/
lemma sectorEnergy_mul_mem_sector {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (ħ : ℝ) (ω : X → ℝ) (hω : Measurable ω) (ψ : momentumFock μ) (n : ℕ)
    (hint : Integrable (fun k : Fin n → X ↦ (sectorEnergy ħ ω n k) ^ 2 * ‖(ψ n).1 k‖ ^ 2)
      (MomentumFock.powerMeasure μ n)) :
    (memLp_sectorEnergy_mul μ ħ ω hω ψ n hint).toLp _ ∈ momentumSector μ n := by
  by_cases hħ : ħ = 0
  · have hzero : (memLp_sectorEnergy_mul μ ħ ω hω ψ n hint).toLp _ = 0 := by
      apply Lp.ext
      filter_upwards [
        (memLp_sectorEnergy_mul μ ħ ω hω ψ n hint).coeFn_toLp,
        Lp.coeFn_zero ℂ 2 (MomentumFock.powerMeasure μ n)] with k h1 h2
      rw [h1, h2]
      simp [sectorEnergy, hħ]
    rw [hzero]
    exact (momentumSector μ n).zero_mem
  · have hint_freq : Integrable (fun k : Fin n → X ↦ (sectorFreq ω n k) ^ 2 * ‖(ψ n).1 k‖ ^ 2)
        (MomentumFock.powerMeasure μ n) := by
      have hconst := hint.const_mul (ħ ^ 2)⁻¹
      refine hconst.congr (ae_of_all _ fun k ↦ ?_)
      have hħ2 : ħ ^ 2 ≠ 0 := pow_ne_zero 2 hħ
      simp only [sectorEnergy, sectorFreq, mul_pow]
      field_simp [hħ2]
    let v : Lp ℂ 2 (MomentumFock.powerMeasure μ n) :=
      (memLp_negI_sectorFreq_mul μ ω hω ψ n hint_freq).toLp _
    have hv_lim : Tendsto (fun t : ℝ ↦ t⁻¹ • ((fockUnitary μ ω hω t ψ n).1 - (ψ n).1))
        (𝓝[≠] 0) (𝓝 v) := by
      rw [tendsto_iff_norm_sub_tendsto_zero]
      have hsq : Tendsto (fun t : ℝ ↦ ‖t⁻¹ • ((fockUnitary μ ω hω t ψ n).1 - (ψ n).1) - v‖ ^ 2)
          (𝓝[≠] 0) (𝓝 0) := (sector_slope_tendsto_and_bound μ ω hω ψ n hint_freq).2
      have hsqrt : Tendsto (fun t : ℝ ↦ Real.sqrt (‖t⁻¹ • ((fockUnitary μ ω hω t ψ n).1 - (ψ n).1) - v‖ ^ 2))
          (𝓝[≠] 0) (𝓝 (Real.sqrt 0)) :=
        (Real.continuous_sqrt.continuousAt (x := 0)).tendsto.comp hsq
      rw [Real.sqrt_zero] at hsqrt
      exact hsqrt.congr fun t ↦ Real.sqrt_sq (norm_nonneg _)
    have hv_mem : v ∈ momentumSector μ n := by
      have hclosed : IsClosed (momentumSector μ n : Set (Lp ℂ 2 (MomentumFock.powerMeasure μ n))) :=
        Submodule.isClosed_topologicalClosure _
      have hmem_q : ∀ t : ℝ,
          t⁻¹ • ((fockUnitary μ ω hω t ψ n).1 - (ψ n).1) ∈ momentumSector μ n := fun t ↦ by
        have hsub : (fockUnitary μ ω hω t ψ n).1 - (ψ n).1 ∈ momentumSector μ n :=
          (momentumSector μ n).sub_mem (fockUnitary μ ω hω t ψ n).2 (ψ n).2
        have hsmul : ((t⁻¹ : ℝ) : ℂ) • ((fockUnitary μ ω hω t ψ n).1 - (ψ n).1) ∈ momentumSector μ n :=
          (momentumSector μ n).smul_mem ((t⁻¹ : ℝ) : ℂ) hsub
        rwa [Complex.coe_smul] at hsmul
      exact hclosed.mem_of_tendsto hv_lim (Eventually.of_forall hmem_q)
    have hsmul_eq : (memLp_sectorEnergy_mul μ ħ ω hω ψ n hint).toLp _ =
        (Complex.I * (ħ : ℂ)) • v := by
      apply Lp.ext
      filter_upwards [
        (memLp_sectorEnergy_mul μ ħ ω hω ψ n hint).coeFn_toLp,
        Lp.coeFn_smul (Complex.I * (ħ : ℂ)) v,
        (memLp_negI_sectorFreq_mul μ ω hω ψ n hint_freq).coeFn_toLp] with k h1 h2 h3
      rw [h1, h2, Pi.smul_apply, smul_eq_mul, h3]
      simp only [sectorEnergy, sectorFreq, Complex.ofReal_mul]
      calc
        (ħ : ℂ) * ((∑ j : Fin n, ω (k j) : ℝ) : ℂ) * (ψ n).1 k
            = -(Complex.I ^ 2) * (ħ : ℂ) * ((∑ j : Fin n, ω (k j) : ℝ) : ℂ) * (ψ n).1 k := by
          rw [Complex.I_sq]; ring
        _ = Complex.I * (ħ : ℂ) * (-((∑ j : Fin n, ω (k j) : ℝ) : ℂ) * Complex.I * (ψ n).1 k) := by
          ring
    rw [hsmul_eq]
    exact (momentumSector μ n).smul_mem (Complex.I * (ħ : ℂ)) hv_mem

/-- Sector-`n` component of `fockH`. -/
noncomputable def sectorH {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (ħ : ℝ) (ω : X → ℝ) (hω : Measurable ω) (ψ : momentumFock μ) (n : ℕ)
    (hint : Integrable (fun k : Fin n → X ↦ (sectorEnergy ħ ω n k) ^ 2 * ‖(ψ n).1 k‖ ^ 2)
      (MomentumFock.powerMeasure μ n)) :
    momentumSector μ n :=
  ⟨(memLp_sectorEnergy_mul μ ħ ω hω ψ n hint).toLp _,
    sectorEnergy_mul_mem_sector μ ħ ω hω ψ n hint⟩

lemma sectorH_norm_sq {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (ħ : ℝ) (ω : X → ℝ) (hω : Measurable ω) (ψ : momentumFock μ) (n : ℕ)
    (hint : Integrable (fun k : Fin n → X ↦ (sectorEnergy ħ ω n k) ^ 2 * ‖(ψ n).1 k‖ ^ 2)
      (MomentumFock.powerMeasure μ n)) :
    ‖sectorH μ ħ ω hω ψ n hint‖ ^ 2 =
      ∫ k : Fin n → X, (sectorEnergy ħ ω n k) ^ 2 * ‖(ψ n).1 k‖ ^ 2 ∂(MomentumFock.powerMeasure μ n) := by
  change ‖(sectorH μ ħ ω hω ψ n hint).1‖ ^ 2 = _
  rw [FeatureDensity.l2_norm_sq_eq_integral]
  refine integral_congr_ae ?_
  filter_upwards [(memLp_sectorEnergy_mul μ ħ ω hω ψ n hint).coeFn_toLp] with k hk
  change ‖((memLp_sectorEnergy_mul μ ħ ω hω ψ n hint).toLp _) k‖ ^ 2 = _
  rw [hk, norm_mul, Complex.norm_real, Real.norm_eq_abs, mul_pow, sq_abs]

lemma sectorH_memℓp {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (ħ : ℝ) (ω : X → ℝ) (hω : Measurable ω) (ψ : momentumFock μ)
    (hψ : fockDomH μ ħ ω ψ) :
    Memℓp (fun n ↦ sectorH μ ħ ω hω ψ n (hψ.1 n)) 2 := by
  apply memℓp_gen
  have h2 : (2 : ENNReal).toReal = 2 := by norm_num
  simp_rw [h2, Real.rpow_two, sectorH_norm_sq]
  exact hψ.2

end MomentumFockDomH

/-- The Hamiltonian operator `H` on its exact domain `fockDomH μ ħ ω` in continuous-momentum
Fock space `momentumFock μ`, multiplying sector `n` pointwise by `E_n(k) = ħ ∑_{j=1}^n ω(k_j)`. -/
noncomputable def fockH {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (ħ : ℝ) (ω : X → ℝ) (hω : Measurable ω) (ψ : momentumFock μ)
    (hψ : fockDomH μ ħ ω ψ) : momentumFock μ :=
  ⟨fun n ↦ MomentumFockDomH.sectorH μ ħ ω hω ψ n (hψ.1 n),
    MomentumFockDomH.sectorH_memℓp μ ħ ω hω ψ hψ⟩

/-- Pointwise a.e. action of `fockH` on sector `n`: `(H ψ)_n(k) = E_n(k) · ψ_n(k)`. -/
theorem fockH_apply_sector_ae {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (ħ : ℝ) (ω : X → ℝ) (hω : Measurable ω) (ψ : momentumFock μ)
    (hψ : fockDomH μ ħ ω ψ) (n : ℕ) :
    ((fockH μ ħ ω hω ψ hψ n).1 : (Fin n → X) → ℂ) =ᵐ[MomentumFock.powerMeasure μ n]
      fun k ↦ ((sectorEnergy ħ ω n k : ℝ) : ℂ) * (ψ n).1 k :=
  (MomentumFockDomH.memLp_sectorEnergy_mul μ ħ ω hω ψ n (hψ.1 n)).coeFn_toLp

/-- `fockDomH` contains `0`. -/
theorem fockDomH_zero {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (ħ : ℝ) (ω : X → ℝ) : fockDomH μ ħ ω 0 := by
  have h0 (n : ℕ) :
      (fun k : Fin n → X ↦ (sectorEnergy ħ ω n k) ^ 2 * ‖((0 : momentumFock μ) n).1 k‖ ^ 2)
        =ᵐ[MomentumFock.powerMeasure μ n] (fun _ ↦ (0 : ℝ)) := by
    have h0n : ((0 : momentumFock μ) n).1 = 0 := rfl
    filter_upwards [Lp.coeFn_zero ℂ 2 (MomentumFock.powerMeasure μ n)] with k hk
    rw [h0n, hk]
    simp
  refine ⟨fun n ↦ (integrable_zero _ _ _).congr (h0 n).symm, ?_⟩
  have hz : (fun n : ℕ ↦
      ∫ k : Fin n → X, (sectorEnergy ħ ω n k) ^ 2 * ‖((0 : momentumFock μ) n).1 k‖ ^ 2
        ∂(MomentumFock.powerMeasure μ n)) = fun _ ↦ 0 := by
    funext n
    rw [integral_congr_ae (h0 n), integral_zero]
  rw [hz]
  exact summable_zero

/-- `fockDomH` is closed under addition. -/
theorem fockDomH_add {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (ħ : ℝ) (ω : X → ℝ) (hω : Measurable ω) {φ ψ : momentumFock μ}
    (hφ : fockDomH μ ħ ω φ) (hψ : fockDomH μ ħ ω ψ) :
    fockDomH μ ħ ω (φ + ψ) := by
  have hsec (n : ℕ) :
      Integrable (fun k : Fin n → X ↦ (sectorEnergy ħ ω n k) ^ 2 * ‖((φ + ψ) n).1 k‖ ^ 2)
        (MomentumFock.powerMeasure μ n) := by
    have hmeas : AEStronglyMeasurable
        (fun k : Fin n → X ↦ (sectorEnergy ħ ω n k) ^ 2 * ‖((φ + ψ) n).1 k‖ ^ 2)
        (MomentumFock.powerMeasure μ n) :=
      ((MomentumFockDomH.measurable_sectorEnergy ħ ω hω n).pow_const 2).aestronglyMeasurable.mul
        ((Lp.aestronglyMeasurable ((φ + ψ) n).1).norm.pow 2)
    refine (((hφ.1 n).add (hψ.1 n)).const_mul 2).mono' hmeas ?_
    filter_upwards [Lp.coeFn_add (φ n).1 (ψ n).1] with k hk
    have hadd : ((φ + ψ) n).1 k = (φ n).1 k + (ψ n).1 k := hk
    rw [Real.norm_of_nonneg (mul_nonneg (sq_nonneg _) (sq_nonneg _)), hadd]
    simp only [Pi.add_apply]
    have htr : ‖(φ n).1 k + (ψ n).1 k‖ ^ 2 ≤ 2 * (‖(φ n).1 k‖ ^ 2 + ‖(ψ n).1 k‖ ^ 2) := by
      have h1 : ‖(φ n).1 k + (ψ n).1 k‖ ≤ ‖(φ n).1 k‖ + ‖(ψ n).1 k‖ := norm_add_le _ _
      have h2 := pow_le_pow_left₀ (norm_nonneg _) h1 2
      nlinarith [sq_nonneg (‖(φ n).1 k‖ - ‖(ψ n).1 k‖)]
    have hE : 0 ≤ (sectorEnergy ħ ω n k) ^ 2 := sq_nonneg _
    nlinarith
  refine ⟨hsec, ?_⟩
  refine Summable.of_nonneg_of_le
    (fun n ↦ integral_nonneg fun k ↦ mul_nonneg (sq_nonneg _) (sq_nonneg _))
    (fun n ↦ ?_) ((hφ.2.add hψ.2).mul_left 2)
  rw [← integral_add (hφ.1 n) (hψ.1 n), ← integral_const_mul]
  refine integral_mono_ae (hsec n) (((hφ.1 n).add (hψ.1 n)).const_mul 2) ?_
  filter_upwards [Lp.coeFn_add (φ n).1 (ψ n).1] with k hk
  have hadd : ((φ + ψ) n).1 k = (φ n).1 k + (ψ n).1 k := hk
  rw [hadd]
  have htr : ‖(φ n).1 k + (ψ n).1 k‖ ^ 2 ≤ 2 * (‖(φ n).1 k‖ ^ 2 + ‖(ψ n).1 k‖ ^ 2) := by
    have h1 : ‖(φ n).1 k + (ψ n).1 k‖ ≤ ‖(φ n).1 k‖ + ‖(ψ n).1 k‖ := norm_add_le _ _
    have h2 := pow_le_pow_left₀ (norm_nonneg _) h1 2
    nlinarith [sq_nonneg (‖(φ n).1 k‖ - ‖(ψ n).1 k‖)]
  have hE : 0 ≤ (sectorEnergy ħ ω n k) ^ 2 := sq_nonneg _
  nlinarith

/-- `fockDomH` is closed under complex scalar multiplication. -/
theorem fockDomH_smul {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (ħ : ℝ) (ω : X → ℝ) (c : ℂ) {ψ : momentumFock μ}
    (hψ : fockDomH μ ħ ω ψ) : fockDomH μ ħ ω (c • ψ) := by
  have hae (n : ℕ) :
      (fun k : Fin n → X ↦ (sectorEnergy ħ ω n k) ^ 2 * ‖((c • ψ) n).1 k‖ ^ 2)
        =ᵐ[MomentumFock.powerMeasure μ n]
      (fun k : Fin n → X ↦ ‖c‖ ^ 2 * ((sectorEnergy ħ ω n k) ^ 2 * ‖(ψ n).1 k‖ ^ 2)) := by
    filter_upwards [Lp.coeFn_smul c (ψ n).1] with k hk
    have hsm : ((c • ψ) n).1 k = c * (ψ n).1 k := hk
    rw [hsm, norm_mul, mul_pow]
    ring
  refine ⟨fun n ↦ ((hψ.1 n).const_mul (‖c‖ ^ 2)).congr (hae n).symm, ?_⟩
  refine (hψ.2.mul_left (‖c‖ ^ 2)).congr fun n ↦ ?_
  rw [← integral_const_mul]
  exact integral_congr_ae (hae n).symm

/-- `fockDomH` packaged as a complex subspace of `momentumFock μ`. -/
def fockDomHSubmodule {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (ħ : ℝ) (ω : X → ℝ) (hω : Measurable ω) : Submodule ℂ (momentumFock μ) where
  carrier := {ψ | fockDomH μ ħ ω ψ}
  zero_mem' := fockDomH_zero μ ħ ω
  add_mem' := fun hφ hψ ↦ fockDomH_add μ ħ ω hω hφ hψ
  smul_mem' := fun c _ hψ ↦ fockDomH_smul μ ħ ω c hψ

/-- Additivity of `fockH` on `Dom(H)`. -/
theorem fockH_add {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (ħ : ℝ) (ω : X → ℝ) (hω : Measurable ω) {φ ψ : momentumFock μ}
    (hφ : fockDomH μ ħ ω φ) (hψ : fockDomH μ ħ ω ψ) :
    fockH μ ħ ω hω (φ + ψ) (fockDomH_add μ ħ ω hω hφ hψ) =
      fockH μ ħ ω hω φ hφ + fockH μ ħ ω hω ψ hψ := by
  apply lp.ext; funext n; apply Subtype.ext; apply Lp.ext
  filter_upwards [
    fockH_apply_sector_ae μ ħ ω hω (φ + ψ) (fockDomH_add μ ħ ω hω hφ hψ) n,
    Lp.coeFn_add (fockH μ ħ ω hω φ hφ n).1 (fockH μ ħ ω hω ψ hψ n).1,
    fockH_apply_sector_ae μ ħ ω hω φ hφ n,
    fockH_apply_sector_ae μ ħ ω hω ψ hψ n,
    Lp.coeFn_add (φ n).1 (ψ n).1] with k h1 h2 h3 h4 h5
  have hadd : ((φ + ψ) n).1 k = (φ n).1 k + (ψ n).1 k := h5
  change ((fockH μ ħ ω hω (φ + ψ) (fockDomH_add μ ħ ω hω hφ hψ) n).1 : (Fin n → X) → ℂ) k =
    ((fockH μ ħ ω hω φ hφ n).1 + (fockH μ ħ ω hω ψ hψ n).1 : Lp ℂ 2 _) k
  rw [h1, h2, Pi.add_apply, h3, h4, hadd, mul_add]

/-- Homogeneity of `fockH` on `Dom(H)`. -/
theorem fockH_smul {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (ħ : ℝ) (ω : X → ℝ) (hω : Measurable ω) (c : ℂ) {ψ : momentumFock μ}
    (hψ : fockDomH μ ħ ω ψ) :
    fockH μ ħ ω hω (c • ψ) (fockDomH_smul μ ħ ω c hψ) =
      c • fockH μ ħ ω hω ψ hψ := by
  apply lp.ext; funext n; apply Subtype.ext; apply Lp.ext
  filter_upwards [
    fockH_apply_sector_ae μ ħ ω hω (c • ψ) (fockDomH_smul μ ħ ω c hψ) n,
    Lp.coeFn_smul c (fockH μ ħ ω hω ψ hψ n).1,
    fockH_apply_sector_ae μ ħ ω hω ψ hψ n,
    Lp.coeFn_smul c (ψ n).1] with k h1 h2 h3 h4
  have hsm : ((c • ψ) n).1 k = c * (ψ n).1 k := h4
  change ((fockH μ ħ ω hω (c • ψ) (fockDomH_smul μ ħ ω c hψ) n).1 : (Fin n → X) → ℂ) k =
    (c • (fockH μ ħ ω hω ψ hψ n).1 : Lp ℂ 2 _) k
  rw [h1, h2, Pi.smul_apply, smul_eq_mul, h3, hsm]
  ring

/-- `fockH` packaged as a `ℂ`-linear operator `Dom(H) →ₗ[ℂ] momentumFock μ`. -/
noncomputable def fockHLinear {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (ħ : ℝ) (ω : X → ℝ) (hω : Measurable ω) :
    fockDomHSubmodule μ ħ ω hω →ₗ[ℂ] momentumFock μ where
  toFun ψ := fockH μ ħ ω hω ψ.1 ψ.2
  map_add' φ ψ := fockH_add μ ħ ω hω φ.2 ψ.2
  map_smul' c ψ := fockH_smul μ ħ ω hω c ψ.2

/-- Symmetry of the Hamiltonian on `Dom(H)`: `⟪φ, H ψ⟫ = ⟪H φ, ψ⟫`. -/
theorem fockH_symm {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (ħ : ℝ) (ω : X → ℝ) (hω : Measurable ω) {φ ψ : momentumFock μ}
    (hφ : fockDomH μ ħ ω φ) (hψ : fockDomH μ ħ ω ψ) :
    inner ℂ φ (fockH μ ħ ω hω ψ hψ) = inner ℂ (fockH μ ħ ω hω φ hφ) ψ := by
  rw [lp.inner_eq_tsum, lp.inner_eq_tsum]
  congr 1
  funext n
  change inner ℂ (φ n).1 (fockH μ ħ ω hω ψ hψ n).1 =
    inner ℂ (fockH μ ħ ω hω φ hφ n).1 (ψ n).1
  rw [L2.inner_def, L2.inner_def]
  refine integral_congr_ae ?_
  filter_upwards [
    fockH_apply_sector_ae μ ħ ω hω φ hφ n,
    fockH_apply_sector_ae μ ħ ω hω ψ hψ n] with k hφk hψk
  simp only [RCLike.inner_apply, hφk, hψk, map_mul, Complex.conj_ofReal]
  ring

/-- Nonnegativity and reality of the Hamiltonian expectation value on `Dom(H)` when `ħ ≥ 0` and
`ω ≥ 0`: `0 ≤ Re ⟪ψ, H ψ⟫` and `Im ⟪ψ, H ψ⟫ = 0`. -/
theorem fockH_inner_nonneg {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    {ħ : ℝ} (hħ : 0 ≤ ħ) (ω : X → ℝ) (hω : Measurable ω) (hω_nn : ∀ k, 0 ≤ ω k)
    {ψ : momentumFock μ} (hψ : fockDomH μ ħ ω ψ) :
    0 ≤ (inner ℂ ψ (fockH μ ħ ω hω ψ hψ)).re ∧
      (inner ℂ ψ (fockH μ ħ ω hω ψ hψ)).im = 0 := by
  have hsum := lp.hasSum_inner (𝕜 := ℂ) ψ (fockH μ ħ ω hω ψ hψ)
  have hsec (n : ℕ) :
      0 ≤ (inner ℂ (ψ n) (fockH μ ħ ω hω ψ hψ n)).re ∧
        (inner ℂ (ψ n) (fockH μ ħ ω hω ψ hψ n)).im = 0 := by
    change 0 ≤ (inner ℂ (ψ n).1 (fockH μ ħ ω hω ψ hψ n).1).re ∧
      (inner ℂ (ψ n).1 (fockH μ ħ ω hω ψ hψ n).1).im = 0
    rw [L2.inner_def]
    have hint := L2.integrable_inner (𝕜 := ℂ) (ψ n).1 (fockH μ ħ ω hω ψ hψ n).1
    have hpt : ∀ᵐ k ∂(MomentumFock.powerMeasure μ n),
        inner ℂ ((ψ n).1 k) ((fockH μ ħ ω hω ψ hψ n).1 k) =
          ((sectorEnergy ħ ω n k * ‖(ψ n).1 k‖ ^ 2 : ℝ) : ℂ) := by
      filter_upwards [fockH_apply_sector_ae μ ħ ω hω ψ hψ n] with k hk
      rw [hk, RCLike.inner_apply]
      have hnorm : (ψ n).1 k * starRingEnd ℂ ((ψ n).1 k) = ((‖(ψ n).1 k‖ ^ 2 : ℝ) : ℂ) := by
        rw [Complex.mul_conj, Complex.normSq_eq_norm_sq]
      rw [Complex.ofReal_mul, ← hnorm]
      ring
    rw [← Complex.reCLM_apply, ← Complex.reCLM.integral_comp_comm hint,
      ← Complex.imCLM_apply, ← Complex.imCLM.integral_comp_comm hint]
    refine ⟨?_, ?_⟩
    · refine integral_nonneg_of_ae ?_
      filter_upwards [hpt] with k hk
      rw [Complex.reCLM_apply, hk, Complex.ofReal_re]
      have hE : 0 ≤ sectorEnergy ħ ω n k :=
        mul_nonneg hħ (Finset.sum_nonneg fun j _ ↦ hω_nn (k j))
      exact mul_nonneg hE (sq_nonneg _)
    · rw [show (∫ k, Complex.imCLM (inner ℂ ((ψ n).1 k) ((fockH μ ħ ω hω ψ hψ n).1 k))
          ∂(MomentumFock.powerMeasure μ n)) = ∫ _ : Fin n → X, (0 : ℝ)
          ∂(MomentumFock.powerMeasure μ n) by
        refine integral_congr_ae ?_
        filter_upwards [hpt] with k hk
        rw [Complex.imCLM_apply, hk, Complex.ofReal_im]]
      exact integral_zero _ _
  have hre : HasSum (fun n ↦ (inner ℂ (ψ n) (fockH μ ħ ω hω ψ hψ n)).re)
      (inner ℂ ψ (fockH μ ħ ω hω ψ hψ)).re :=
    Complex.reCLM.hasSum hsum
  have him : HasSum (fun n ↦ (inner ℂ (ψ n) (fockH μ ħ ω hω ψ hψ n)).im)
      (inner ℂ ψ (fockH μ ħ ω hω ψ hψ)).im :=
    Complex.imCLM.hasSum hsum
  refine ⟨?_, ?_⟩
  · rw [← hre.tsum_eq]
    exact tsum_nonneg fun n ↦ (hsec n).1
  · rw [← him.tsum_eq]
    have him0 : (fun n ↦ (inner ℂ (ψ n) (fockH μ ħ ω hω ψ hψ n)).im) = fun _ ↦ 0 :=
      funext fun n ↦ (hsec n).2
    rw [him0, tsum_zero]

/-- Nonnegativity of `fockH`: `0 ≤ (⟪ψ, H ψ⟫_ℂ).re` for `ħ ≥ 0`, `ω ≥ 0`, `ψ ∈ Dom(H)`. -/
theorem fockH_nonneg {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    {ħ : ℝ} (hħ : 0 ≤ ħ) (ω : X → ℝ) (hω : Measurable ω) (hω_nn : ∀ k, 0 ≤ ω k)
    {ψ : momentumFock μ} (hψ : fockDomH μ ħ ω ψ) :
    0 ≤ (inner ℂ ψ (fockH μ ħ ω hω ψ hψ)).re :=
  (fockH_inner_nonneg μ hħ ω hω hω_nn hψ).1

/-- The Fock vacuum belongs to `Dom(H)`. -/
theorem fockDomH_vacuum {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (ħ : ℝ) (ω : X → ℝ) : fockDomH μ ħ ω (fockVacuum μ) := by
  have h0 (n : ℕ) :
      (fun k : Fin n → X ↦ (sectorEnergy ħ ω n k) ^ 2 * ‖((fockVacuum μ) n).1 k‖ ^ 2)
        =ᵐ[MomentumFock.powerMeasure μ n] (fun _ ↦ (0 : ℝ)) := by
    cases n with
    | zero =>
      exact ae_of_all _ fun k ↦ by simp [sectorEnergy]
    | succ m =>
      have hv : ((fockVacuum μ) (m + 1)).1 = 0 := by
        change (sectorVec μ (m + 1) 0).1 = 0
        rw [MomentumFock.sectorVec_succ_zero]
        rfl
      filter_upwards [Lp.coeFn_zero ℂ 2 (MomentumFock.powerMeasure μ (m + 1))] with k hk
      rw [hv, hk]
      simp
  refine ⟨fun n ↦ (integrable_zero _ _ _).congr (h0 n).symm, ?_⟩
  have hz : (fun n : ℕ ↦
      ∫ k : Fin n → X, (sectorEnergy ħ ω n k) ^ 2 * ‖((fockVacuum μ) n).1 k‖ ^ 2
        ∂(MomentumFock.powerMeasure μ n)) = fun _ ↦ 0 := by
    funext n
    rw [integral_congr_ae (h0 n), integral_zero]
  rw [hz]
  exact summable_zero

/-- The vacuum has zero energy: `H Ω = 0`. -/
theorem fockH_vacuum {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (ħ : ℝ) (ω : X → ℝ) (hω : Measurable ω) :
    fockH μ ħ ω hω (fockVacuum μ) (fockDomH_vacuum μ ħ ω) = 0 := by
  apply lp.ext; funext n; apply Subtype.ext; apply Lp.ext
  cases n with
  | zero =>
    filter_upwards [
      fockH_apply_sector_ae μ ħ ω hω (fockVacuum μ) (fockDomH_vacuum μ ħ ω) 0,
      Lp.coeFn_zero ℂ 2 (MomentumFock.powerMeasure μ 0)] with k hk hz
    change ((fockH μ ħ ω hω (fockVacuum μ) (fockDomH_vacuum μ ħ ω) 0).1 : (Fin 0 → X) → ℂ) k =
      ((0 : Lp ℂ 2 (MomentumFock.powerMeasure μ 0)) k)
    rw [hk, hz]
    simp [sectorEnergy]
  | succ m =>
    have hv : ((fockVacuum μ) (m + 1)).1 = 0 := by
      change (sectorVec μ (m + 1) 0).1 = 0
      rw [MomentumFock.sectorVec_succ_zero]
      rfl
    filter_upwards [
      fockH_apply_sector_ae μ ħ ω hω (fockVacuum μ) (fockDomH_vacuum μ ħ ω) (m + 1),
      Lp.coeFn_zero ℂ 2 (MomentumFock.powerMeasure μ (m + 1))] with k hk hz
    change ((fockH μ ħ ω hω (fockVacuum μ) (fockDomH_vacuum μ ħ ω) (m + 1)).1 :
      (Fin (m + 1) → X) → ℂ) k = ((0 : Lp ℂ 2 (MomentumFock.powerMeasure μ (m + 1))) k)
    rw [hk, hv, hz]
    simp

/-- `Dom(H)` is invariant under `fockUnitary t`. -/
theorem fockDomH_fockUnitary {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (ħ : ℝ) (ω : X → ℝ) (hω : Measurable ω) (t : ℝ) {ψ : momentumFock μ}
    (hψ : fockDomH μ ħ ω ψ) :
    fockDomH μ ħ ω (fockUnitary μ ω hω t ψ) := by
  have hae (n : ℕ) :
      (fun k : Fin n → X ↦
        (sectorEnergy ħ ω n k) ^ 2 * ‖(fockUnitary μ ω hω t ψ n).1 k‖ ^ 2)
        =ᵐ[MomentumFock.powerMeasure μ n]
      (fun k : Fin n → X ↦ (sectorEnergy ħ ω n k) ^ 2 * ‖(ψ n).1 k‖ ^ 2) := by
    filter_upwards [fockUnitary_apply_sector_ae μ ω hω t ψ n] with k hk
    rw [hk, norm_mul, Complex.norm_exp_ofReal_mul_I, one_mul]
  refine ⟨fun n ↦ (hψ.1 n).congr (hae n).symm, ?_⟩
  refine hψ.2.congr fun n ↦ integral_congr_ae (hae n).symm

/-- `fockH` commutes with `fockUnitary t` on `Dom(H)`. -/
theorem fockH_fockUnitary {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (ħ : ℝ) (ω : X → ℝ) (hω : Measurable ω) (t : ℝ) {ψ : momentumFock μ}
    (hψ : fockDomH μ ħ ω ψ) :
    fockH μ ħ ω hω (fockUnitary μ ω hω t ψ) (fockDomH_fockUnitary μ ħ ω hω t hψ) =
      fockUnitary μ ω hω t (fockH μ ħ ω hω ψ hψ) := by
  apply lp.ext; funext n; apply Subtype.ext; apply Lp.ext
  filter_upwards [
    fockH_apply_sector_ae μ ħ ω hω (fockUnitary μ ω hω t ψ)
      (fockDomH_fockUnitary μ ħ ω hω t hψ) n,
    fockUnitary_apply_sector_ae μ ω hω t (fockH μ ħ ω hω ψ hψ) n,
    fockUnitary_apply_sector_ae μ ω hω t ψ n,
    fockH_apply_sector_ae μ ħ ω hω ψ hψ n] with k h1 h2 h3 h4
  rw [h1, h2, h3, h4]
  ring

/-- Derivative at `t = 0` of `fockUnitary` on `Dom(H)`:
`d/dt (fockUnitary t ψ)|_{t=0} = -(i / ħ) • H ψ`. -/
theorem fockUnitary_hasDerivAt_zero {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    {ħ : ℝ} (hħ : ħ ≠ 0) (ω : X → ℝ) (hω : Measurable ω) {ψ : momentumFock μ}
    (hψ : fockDomH μ ħ ω ψ) :
    HasDerivAt (fun t : ℝ ↦ fockUnitary μ ω hω t ψ)
      (-(Complex.I / (ħ : ℂ)) • fockH μ ħ ω hω ψ hψ) 0 := by
  rw [hasDerivAt_iff_tendsto_slope_zero, tendsto_iff_norm_sub_tendsto_zero]
  set v : momentumFock μ := -(Complex.I / (ħ : ℂ)) • fockH μ ħ ω hω ψ hψ
  let d : ℝ → momentumFock μ := fun t ↦ t⁻¹ • (fockUnitary μ ω hω t ψ - ψ) - v
  have h2 : (2 : ENNReal).toReal = 2 := by norm_num
  have hnormSq (t : ℝ) : ‖d t‖ ^ 2 = ∑' n : ℕ, ‖d t n‖ ^ 2 := by
    have h := (lp.hasSum_norm (p := 2) (by norm_num) (d t)).tsum_eq
    rw [h2] at h
    simpa [Real.rpow_two] using h.symm
  have hint_freq (n : ℕ) :
      Integrable (fun k : Fin n → X ↦
        (MomentumFockDomH.sectorFreq ω n k) ^ 2 * ‖(ψ n).1 k‖ ^ 2)
        (MomentumFock.powerMeasure μ n) := by
    have hconst := (hψ.1 n).const_mul (ħ ^ 2)⁻¹
    refine hconst.congr (ae_of_all _ fun k ↦ ?_)
    have hħ2 : ħ ^ 2 ≠ 0 := pow_ne_zero 2 hħ
    simp only [sectorEnergy, MomentumFockDomH.sectorFreq, mul_pow]
    field_simp [hħ2]
  have hv_sec (n : ℕ) :
      (v n).1 = (MomentumFockDomH.memLp_negI_sectorFreq_mul μ ω hω ψ n (hint_freq n)).toLp _ := by
    apply Lp.ext
    filter_upwards [
      Lp.coeFn_smul (-(Complex.I / (ħ : ℂ))) (fockH μ ħ ω hω ψ hψ n).1,
      fockH_apply_sector_ae μ ħ ω hω ψ hψ n,
      (MomentumFockDomH.memLp_negI_sectorFreq_mul μ ω hω ψ n (hint_freq n)).coeFn_toLp]
      with k h1 h2 h3
    have hv1 : (v n).1 k = -(Complex.I / (ħ : ℂ)) * (fockH μ ħ ω hω ψ hψ n).1 k := h1
    rw [hv1, h2, h3]
    have hħc : (ħ : ℂ) ≠ 0 := Complex.ofReal_ne_zero.mpr hħ
    simp only [sectorEnergy, MomentumFockDomH.sectorFreq, Complex.ofReal_mul]
    field_simp [hħc]
  have hd_sec (t : ℝ) (n : ℕ) :
      ‖d t n‖ ^ 2 =
        ‖t⁻¹ • ((fockUnitary μ ω hω t ψ n).1 - (ψ n).1) -
          (MomentumFockDomH.memLp_negI_sectorFreq_mul μ ω hω ψ n (hint_freq n)).toLp _‖ ^ 2 := by
    change ‖(d t n).1‖ ^ 2 = _
    congr 2
    rw [← hv_sec n]
    rfl
  have hbound_sum : Summable (fun n : ℕ ↦
      4 * ∫ k : Fin n → X, (MomentumFockDomH.sectorFreq ω n k) ^ 2 * ‖(ψ n).1 k‖ ^ 2
        ∂(MomentumFock.powerMeasure μ n)) := by
    have h1 := (hψ.2.mul_left (ħ ^ 2)⁻¹).mul_left 4
    refine h1.congr fun n ↦ ?_
    rw [← integral_const_mul]
    congr 1
    refine integral_congr_ae (ae_of_all _ fun k ↦ ?_)
    have hħ2 : ħ ^ 2 ≠ 0 := pow_ne_zero 2 hħ
    simp only [sectorEnergy, MomentumFockDomH.sectorFreq, mul_pow]
    field_simp [hħ2]
  have hpt (n : ℕ) : Tendsto (fun t : ℝ ↦ ‖d t n‖ ^ 2) (𝓝[≠] 0) (𝓝 0) := by
    simp_rw [hd_sec]
    exact (MomentumFockDomH.sector_slope_tendsto_and_bound μ ω hω ψ n (hint_freq n)).2
  have hbound : ∀ t : ℝ, ∀ n : ℕ, ‖‖d t n‖ ^ 2‖ ≤
      4 * ∫ k : Fin n → X, (MomentumFockDomH.sectorFreq ω n k) ^ 2 * ‖(ψ n).1 k‖ ^ 2
        ∂(MomentumFock.powerMeasure μ n) := fun t n ↦ by
    rw [Real.norm_of_nonneg (sq_nonneg _), hd_sec]
    exact (MomentumFockDomH.sector_slope_tendsto_and_bound μ ω hω ψ n (hint_freq n)).1 t
  have hsq_lim : Tendsto (fun t : ℝ ↦ ‖d t‖ ^ 2) (𝓝[≠] 0) (𝓝 0) := by
    simp_rw [hnormSq]
    simpa using tendsto_tsum_of_dominated_convergence hbound_sum hpt (Eventually.of_forall hbound)
  have hlim : Tendsto (fun t : ℝ ↦ ‖d t‖) (𝓝[≠] 0) (𝓝 0) := by
    simpa using ((Real.continuous_sqrt.continuousAt (x := 0)).tendsto.comp hsq_lim).congr
      fun t ↦ Real.sqrt_sq (norm_nonneg (d t))
  have hzero : fockUnitary μ ω hω 0 ψ = ψ := by
    rw [fockUnitary_zero, ContinuousLinearMap.id_apply]
  simpa [d, zero_add, hzero] using hlim

private lemma MomentumFockDomH.hasDerivAt_shift_of_zero {E : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    (f g : ℝ → E) (v : E) (t : ℝ)
    (h0 : HasDerivAt g v 0)
    (heq : ∀ s : ℝ, g s = f (t + s)) :
    HasDerivAt f v t := by
  rw [hasDerivAt_iff_tendsto_slope_zero]
  refine (hasDerivAt_iff_tendsto_slope_zero.mp h0).congr fun s ↦ ?_
  rw [zero_add, heq s, heq 0, add_zero]

/-- Full time-evolution Schrödinger derivative on continuous `momentumFock`:
for every `ψ ∈ Dom(H)` and every `t : ℝ`,
`d/ds (fockUnitary s ψ)|_{s=t} = -(i / ħ) • H (fockUnitary t ψ)`. -/
theorem fockUnitary_hasDerivAt {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    {ħ : ℝ} (hħ : ħ ≠ 0) (ω : X → ℝ) (hω : Measurable ω) {ψ : momentumFock μ}
    (hψ : fockDomH μ ħ ω ψ) (t : ℝ) :
    HasDerivAt (fun s : ℝ ↦ fockUnitary μ ω hω s ψ)
      (-(Complex.I / (ħ : ℂ)) •
        fockH μ ħ ω hω (fockUnitary μ ω hω t ψ) (fockDomH_fockUnitary μ ħ ω hω t hψ)) t := by
  refine MomentumFockDomH.hasDerivAt_shift_of_zero
    (fun s ↦ fockUnitary μ ω hω s ψ)
    (fun s ↦ fockUnitary μ ω hω s (fockUnitary μ ω hω t ψ))
    _ t
    (fockUnitary_hasDerivAt_zero μ hħ ω hω (fockDomH_fockUnitary μ ħ ω hω t hψ))
    fun s ↦ ?_
  have hadd := congrArg (fun L : momentumFock μ →L[ℂ] momentumFock μ ↦ L ψ)
    (fockUnitary_add μ ω hω s t)
  simpa only [ContinuousLinearMap.comp_apply, add_comm s t] using hadd.symm

/-- Explicit Schrödinger equation form `i ħ · ψ̇ = H (U(t) ψ)` for `ψ ∈ Dom(H)` and `t : ℝ`. -/
theorem fockUnitary_schrodinger {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    {ħ : ℝ} (hħ : ħ ≠ 0) (ω : X → ℝ) (hω : Measurable ω) {ψ : momentumFock μ}
    (hψ : fockDomH μ ħ ω ψ) (t : ℝ) :
    ∃ χ : momentumFock μ,
      HasDerivAt (fun s : ℝ ↦ fockUnitary μ ω hω s ψ) χ t ∧
      (Complex.I * (ħ : ℂ)) • χ =
        fockH μ ħ ω hω (fockUnitary μ ω hω t ψ) (fockDomH_fockUnitary μ ħ ω hω t hψ) := by
  refine ⟨-(Complex.I / (ħ : ℂ)) •
      fockH μ ħ ω hω (fockUnitary μ ω hω t ψ) (fockDomH_fockUnitary μ ħ ω hω t hψ),
    fockUnitary_hasDerivAt μ hħ ω hω hψ t, ?_⟩
  rw [smul_smul]
  have hħc : (ħ : ℂ) ≠ 0 := Complex.ofReal_ne_zero.mpr hħ
  have h1 : Complex.I * (ħ : ℂ) * -(Complex.I / (ħ : ℂ)) = 1 := by
    have : Complex.I * (ħ : ℂ) * -(Complex.I / (ħ : ℂ)) = -(Complex.I ^ 2) * ((ħ : ℂ) / (ħ : ℂ)) := by
      ring
    rw [this, Complex.I_sq, div_self hħc]
    ring
  rw [h1, one_smul]

namespace MomentumFockDomH

/-- Sectorwise cutoff identification: if the sector-`n` difference quotients of `fockUnitary t ψ`
converge in `L²` to `y`, then `y(k) = (-i Ω_n(k)) ψ_n(k)` almost everywhere. -/
lemma sector_ae_of_slope_tendsto {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    (ω : X → ℝ) (hω : Measurable ω) (ψ : momentumFock μ) (n : ℕ)
    (y : Lp ℂ 2 (MomentumFock.powerMeasure μ n))
    (hq_lim : Tendsto (fun t : ℝ ↦ t⁻¹ • ((fockUnitary μ ω hω t ψ n).1 - (ψ n).1))
      (𝓝[≠] 0) (𝓝 y)) :
    (y : (Fin n → X) → ℂ) =ᵐ[MomentumFock.powerMeasure μ n]
      fun k ↦ (-(sectorFreq ω n k : ℂ) * Complex.I) * (ψ n).1 k := by
  let ν := MomentumFock.powerMeasure μ n
  let Ω := sectorFreq ω n
  have hΩ : Measurable Ω := measurable_sectorFreq ω hω n
  have hcut (M : ℕ) :
      ∀ᵐ k ∂ν, |Ω k| ≤ (M : ℝ) → y k = (-(Ω k : ℂ) * Complex.I) * (ψ n).1 k := by
    let S : Set (Fin n → X) := {k | |Ω k| ≤ (M : ℝ)}
    have hS : MeasurableSet S := measurableSet_le hΩ.norm measurable_const
    let ind : (Fin n → X) → ℂ := S.indicator (fun _ ↦ (1 : ℂ))
    have hind_meas : Measurable ind := measurable_const.indicator hS
    have hind_bound : ∀ k, ‖ind k‖ ≤ 1 := fun k ↦ by
      by_cases hk : k ∈ S <;> simp [ind, hk]
    have hind_mem : MemLp ind (⊤ : ENNReal) ν :=
      memLp_top_of_bound hind_meas.aestronglyMeasurable 1 (ae_of_all _ hind_bound)
    let P : Lp ℂ 2 ν →L[ℂ] Lp ℂ 2 ν := FeatureDensity.complexMultiplier ind hind_mem
    let g : (Fin n → X) → ℂ := fun k ↦ ind k * (-(Ω k : ℂ) * Complex.I)
    have hg_meas : Measurable g :=
      hind_meas.mul (((Complex.continuous_ofReal.measurable.comp hΩ).neg).mul measurable_const)
    have hg_bound : ∀ k, ‖g k‖ ≤ (M : ℝ) := fun k ↦ by
      by_cases hk : k ∈ S
      · have hMk : |Ω k| ≤ (M : ℝ) := hk
        simpa [g, ind, hk, Complex.norm_real] using hMk
      · simp [g, ind, hk]
    have hg_mem : MemLp g (⊤ : ENNReal) ν :=
      memLp_top_of_bound hg_meas.aestronglyMeasurable (M : ℝ) (ae_of_all _ hg_bound)
    let w : Lp ℂ 2 ν := FeatureDensity.complexMultiplier g hg_mem (ψ n).1
    have hlim1 : Tendsto (fun t : ℝ ↦ P (t⁻¹ • ((fockUnitary μ ω hω t ψ n).1 - (ψ n).1)))
        (𝓝[≠] 0) (𝓝 (P y)) :=
      (P.continuous.tendsto _).comp hq_lim
    have hlim2 : Tendsto (fun t : ℝ ↦ P (t⁻¹ • ((fockUnitary μ ω hω t ψ n).1 - (ψ n).1)))
        (𝓝[≠] 0) (𝓝 w) := by
      rw [tendsto_iff_norm_sub_tendsto_zero]
      let G : ℝ → (Fin n → X) → ℝ := fun t k ↦
        ‖ind k * (t⁻¹ • (Complex.exp (((-(t * Ω k) : ℝ) : ℂ) * Complex.I) - 1) -
          (-(Ω k : ℂ) * Complex.I)) * (ψ n).1 k‖ ^ 2
      have hnorm_eq : ∀ t : ℝ,
          ‖P (t⁻¹ • ((fockUnitary μ ω hω t ψ n).1 - (ψ n).1)) - w‖ ^ 2 = ∫ k, G t k ∂ν := by
        intro t
        rw [FeatureDensity.l2_norm_sq_eq_integral]
        refine integral_congr_ae ?_
        filter_upwards [
          Lp.coeFn_sub (P (t⁻¹ • ((fockUnitary μ ω hω t ψ n).1 - (ψ n).1))) w,
          FeatureDensity.complexMultiplier_apply_ae ind hind_mem
            (t⁻¹ • ((fockUnitary μ ω hω t ψ n).1 - (ψ n).1)),
          Lp.coeFn_smul t⁻¹ ((fockUnitary μ ω hω t ψ n).1 - (ψ n).1),
          Lp.coeFn_sub (fockUnitary μ ω hω t ψ n).1 (ψ n).1,
          fockUnitary_apply_sector_ae μ ω hω t ψ n,
          FeatureDensity.complexMultiplier_apply_ae g hg_mem (ψ n).1]
          with k hsub1 hP hsmul hsub2 hu hw
        rw [hsub1, Pi.sub_apply, hP, hsmul, Pi.smul_apply, hsub2, Pi.sub_apply, hu, hw]
        congr 2
        simp only [Ω, sectorFreq, g, Complex.real_smul]
        ring
      have hG_meas : ∀ t : ℝ, AEStronglyMeasurable (G t) ν := fun t ↦ by
        have hcΩ : Measurable (fun k ↦ (Ω k : ℂ)) := Complex.continuous_ofReal.measurable.comp hΩ
        have hexp : Measurable (fun k ↦ Complex.exp (((-(t * Ω k) : ℝ) : ℂ) * Complex.I)) :=
          Complex.continuous_exp.measurable.comp
            ((Complex.continuous_ofReal.measurable.comp (measurable_const.mul hΩ).neg).mul
              measurable_const)
        have hfac : Measurable (fun k ↦
            ind k * (t⁻¹ • (Complex.exp (((-(t * Ω k) : ℝ) : ℂ) * Complex.I) - 1) -
              (-(Ω k : ℂ) * Complex.I))) :=
          hind_meas.mul (((hexp.sub measurable_const).const_smul t⁻¹).sub
            (hcΩ.neg.mul measurable_const))
        exact ((hfac.aestronglyMeasurable.mul (Lp.aestronglyMeasurable (ψ n).1)).norm).pow 2
      have hψ_sq : Integrable (fun k ↦ ‖(ψ n).1 k‖ ^ 2) ν :=
        (memLp_two_iff_integrable_sq_norm (Lp.aestronglyMeasurable (ψ n).1)).mp (Lp.memLp (ψ n).1)
      have hG_bound : ∀ t : ℝ, ∀ k, ‖G t k‖ ≤ (2 * (M : ℝ)) ^ 2 * ‖(ψ n).1 k‖ ^ 2 := fun t k ↦ by
        rw [Real.norm_of_nonneg (sq_nonneg _)]
        have hb : ‖ind k * (t⁻¹ • (Complex.exp (((-(t * Ω k) : ℝ) : ℂ) * Complex.I) - 1) -
            (-(Ω k : ℂ) * Complex.I))‖ ≤ 2 * (M : ℝ) := by
          by_cases hk : k ∈ S
          · have hMk : |Ω k| ≤ (M : ℝ) := hk
            simp only [ind, Set.indicator_of_mem hk, one_mul]
            exact (phase_diff_bound (Ω k) t).trans (by linarith)
          · simp only [ind, Set.indicator_of_notMem hk, zero_mul, norm_zero]
            positivity
        calc
          G t k = ‖ind k * (t⁻¹ • (Complex.exp (((-(t * Ω k) : ℝ) : ℂ) * Complex.I) - 1) -
              (-(Ω k : ℂ) * Complex.I))‖ ^ 2 * ‖(ψ n).1 k‖ ^ 2 := by
            simp only [G, norm_mul, mul_pow]
          _ ≤ (2 * (M : ℝ)) ^ 2 * ‖(ψ n).1 k‖ ^ 2 :=
            mul_le_mul_of_nonneg_right (pow_le_pow_left₀ (norm_nonneg _) hb 2) (sq_nonneg _)
      have hG_lim : ∀ᵐ k ∂ν, Tendsto (fun t : ℝ ↦ G t k) (𝓝[≠] 0) (𝓝 0) :=
        ae_of_all _ fun k ↦ by
          have h1 : Tendsto (fun t : ℝ ↦
              t⁻¹ • (Complex.exp (((-(t * Ω k) : ℝ) : ℂ) * Complex.I) - 1))
              (𝓝[≠] 0) (𝓝 (-(Ω k : ℂ) * Complex.I)) := by
            simpa [zero_add, zero_mul, neg_zero, Complex.ofReal_zero, Complex.exp_zero] using
              (hasDerivAt_phase (Ω k)).tendsto_slope_zero
          have hsub : Tendsto (fun t : ℝ ↦
              t⁻¹ • (Complex.exp (((-(t * Ω k) : ℝ) : ℂ) * Complex.I) - 1) -
                (-(Ω k : ℂ) * Complex.I)) (𝓝[≠] 0) (𝓝 0) := by
            simpa only [sub_self] using h1.sub (tendsto_const_nhds (x := -(Ω k : ℂ) * Complex.I))
          have h2 := (((hsub.const_mul (ind k)).mul_const ((ψ n).1 k)).norm).pow 2
          simpa [G] using h2
      have hsq_lim : Tendsto (fun t : ℝ ↦
          ‖P (t⁻¹ • ((fockUnitary μ ω hω t ψ n).1 - (ψ n).1)) - w‖ ^ 2) (𝓝[≠] 0) (𝓝 0) := by
        simp_rw [hnorm_eq]
        simpa only [integral_zero] using
          tendsto_integral_filter_of_dominated_convergence
            (fun k ↦ (2 * (M : ℝ)) ^ 2 * ‖(ψ n).1 k‖ ^ 2)
            (Eventually.of_forall hG_meas)
            (Eventually.of_forall fun t ↦ ae_of_all _ (hG_bound t))
            (hψ_sq.const_mul ((2 * (M : ℝ)) ^ 2)) hG_lim
      have hsqrt := (Real.continuous_sqrt.continuousAt (x := 0)).tendsto.comp hsq_lim
      rw [Real.sqrt_zero] at hsqrt
      exact hsqrt.congr fun t ↦ Real.sqrt_sq (norm_nonneg _)
    have hPw : P y = w := tendsto_nhds_unique hlim1 hlim2
    filter_upwards [
      FeatureDensity.complexMultiplier_apply_ae ind hind_mem y,
      FeatureDensity.complexMultiplier_apply_ae g hg_mem (ψ n).1] with k h1 h2 hk
    have h3 : (P y : (Fin n → X) → ℂ) k = (w : (Fin n → X) → ℂ) k :=
      congrArg (fun f : Lp ℂ 2 ν ↦ (f : (Fin n → X) → ℂ) k) hPw
    have hkS : k ∈ S := hk
    rw [h1, h2] at h3
    simpa only [g, ind, Set.indicator_of_mem hkS, one_mul] using h3
  filter_upwards [ae_all_iff.mpr hcut] with k hk
  obtain ⟨M, hM⟩ := exists_nat_ge |Ω k|
  exact hk M hM

end MomentumFockDomH

/-- Exact converse (Stone-generator domain characterization on continuous `momentumFock`):
if `t ↦ fockUnitary t ψ` is differentiable at `0` with derivative `χ`, then `ψ ∈ Dom(H)` and
`χ = -(i / ħ) • H ψ`. -/
theorem fockDomH_of_hasDerivAt {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    {ħ : ℝ} (hħ : ħ ≠ 0) (ω : X → ℝ) (hω : Measurable ω) {ψ χ : momentumFock μ}
    (hderiv : HasDerivAt (fun t : ℝ ↦ fockUnitary μ ω hω t ψ) χ 0) :
    ∃ hψ : fockDomH μ ħ ω ψ, χ = -(Complex.I / (ħ : ℂ)) • fockH μ ħ ω hω ψ hψ := by
  have hglobal : Tendsto (fun t : ℝ ↦ ‖t⁻¹ • (fockUnitary μ ω hω t ψ - ψ) - χ‖)
      (𝓝[≠] 0) (𝓝 0) := by
    have h0 : fockUnitary μ ω hω 0 ψ = ψ := by
      rw [fockUnitary_zero, ContinuousLinearMap.id_apply]
    simpa [zero_add, h0] using
      tendsto_iff_norm_sub_tendsto_zero.mp (hasDerivAt_iff_tendsto_slope_zero.mp hderiv)
  have hsec_ae : ∀ n : ℕ,
      ((χ n).1 : (Fin n → X) → ℂ) =ᵐ[MomentumFock.powerMeasure μ n]
        fun k ↦ (-(MomentumFockDomH.sectorFreq ω n k : ℂ) * Complex.I) * (ψ n).1 k := by
    intro n
    apply MomentumFockDomH.sector_ae_of_slope_tendsto μ ω hω ψ n (χ n).1
    rw [tendsto_iff_norm_sub_tendsto_zero]
    refine squeeze_zero (fun _ ↦ norm_nonneg _) (fun t ↦ ?_) hglobal
    have hle := lp.norm_apply_le_norm (by norm_num : (2 : ENNReal) ≠ 0)
      (t⁻¹ • (fockUnitary μ ω hω t ψ - ψ) - χ) n
    exact hle
  have hχ_sq (n : ℕ) :
      (fun k : Fin n → X ↦ (sectorEnergy ħ ω n k) ^ 2 * ‖(ψ n).1 k‖ ^ 2)
        =ᵐ[MomentumFock.powerMeasure μ n]
      (fun k : Fin n → X ↦ ħ ^ 2 * ‖(χ n).1 k‖ ^ 2) := by
    filter_upwards [hsec_ae n] with k hk
    rw [hk, norm_mul, norm_mul, norm_neg, Complex.norm_real, Real.norm_eq_abs, Complex.norm_I,
      mul_one, mul_pow, sq_abs]
    simp only [sectorEnergy, MomentumFockDomH.sectorFreq, mul_pow]
    ring
  have hdom : fockDomH μ ħ ω ψ := by
    refine ⟨fun n ↦ ?_, ?_⟩
    · have hχ_int : Integrable (fun k : Fin n → X ↦ ‖(χ n).1 k‖ ^ 2)
          (MomentumFock.powerMeasure μ n) :=
        (memLp_two_iff_integrable_sq_norm (Lp.aestronglyMeasurable (χ n).1)).mp (Lp.memLp (χ n).1)
      exact (hχ_int.const_mul (ħ ^ 2)).congr (hχ_sq n).symm
    · have h2 : (2 : ENNReal).toReal = 2 := by norm_num
      have hχ_sum : Summable (fun n : ℕ ↦ ‖χ n‖ ^ 2) := by
        simpa only [h2, Real.rpow_two] using (lp.memℓp χ).summable (by norm_num)
      refine (hχ_sum.mul_left (ħ ^ 2)).congr fun n ↦ ?_
      rw [integral_congr_ae (hχ_sq n), integral_const_mul,
        ← FeatureDensity.l2_norm_sq_eq_integral (χ n).1]
      rfl
  refine ⟨hdom, ?_⟩
  apply lp.ext; funext n; apply Subtype.ext; apply Lp.ext
  filter_upwards [
    hsec_ae n,
    Lp.coeFn_smul (-(Complex.I / (ħ : ℂ))) (fockH μ ħ ω hω ψ hdom n).1,
    fockH_apply_sector_ae μ ħ ω hω ψ hdom n] with k h1 h2 h3
  change ((χ n).1 : (Fin n → X) → ℂ) k =
    ((-(Complex.I / (ħ : ℂ)) • (fockH μ ħ ω hω ψ hdom n).1 : Lp ℂ 2 _) k)
  rw [h1, h2, Pi.smul_apply, smul_eq_mul, h3]
  have hħc : (ħ : ℂ) ≠ 0 := Complex.ofReal_ne_zero.mpr hħ
  simp only [sectorEnergy, MomentumFockDomH.sectorFreq, Complex.ofReal_mul]
  field_simp [hħc]

/-- Exact characterization of the Schrödinger generator domain on `momentumFock`:
`t ↦ fockUnitary t ψ` is differentiable at `0` with derivative `χ` if and only if
`ψ ∈ Dom(H)` and `χ = -(i / ħ) • H ψ`. -/
theorem fockUnitary_hasDerivAt_iff {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]
    {ħ : ℝ} (hħ : ħ ≠ 0) (ω : X → ℝ) (hω : Measurable ω) (ψ χ : momentumFock μ) :
    HasDerivAt (fun t : ℝ ↦ fockUnitary μ ω hω t ψ) χ 0 ↔
      ∃ hψ : fockDomH μ ħ ω ψ, χ = -(Complex.I / (ħ : ℂ)) • fockH μ ħ ω hω ψ hψ := by
  constructor
  · exact fockDomH_of_hasDerivAt μ hħ ω hω
  · rintro ⟨hψ, rfl⟩
    exact fockUnitary_hasDerivAt_zero μ hħ ω hω hψ

/-! #### Relativistic Mass-Shell Specialization (`ω(k) = √(‖k‖² + m²)`) -/

/-- Measurability of the relativistic mass-shell dispersion `modeDispersion m`. -/
theorem modeDispersion_measurable {d : ℕ} (m : ℝ) :
    Measurable (modeDispersion (d := d) m) := by
  unfold modeDispersion
  exact (Real.continuous_sqrt.comp
    ((continuous_norm.pow 2).add continuous_const)).measurable

/-- Relativistic mass-shell Hamiltonian nonnegativity on `momentumFock μ` for `ħ > 0, m > 0`. -/
theorem modeFockH_nonneg {d : ℕ} (μ : Measure (EuclideanSpace ℝ (Fin d))) [SigmaFinite μ]
    {ħ m : ℝ} (hħ : 0 < ħ) (hm : 0 < m) {ψ : momentumFock μ}
    (hψ : fockDomH μ ħ (modeDispersion m) ψ) :
    0 ≤ (inner ℂ ψ (fockH μ ħ (modeDispersion m) (modeDispersion_measurable m) ψ hψ)).re :=
  fockH_nonneg μ hħ.le (modeDispersion m) (modeDispersion_measurable m)
    (fun k ↦ (modeDispersion_pos hm k).le) hψ

/-- Relativistic mass-shell unitary evolution derivative on `Dom(H)` for `ħ > 0, m > 0`. -/
theorem modeFockUnitary_hasDerivAt {d : ℕ} (μ : Measure (EuclideanSpace ℝ (Fin d))) [SigmaFinite μ]
    {ħ m : ℝ} (hħ : 0 < ħ) (hm : 0 < m) {ψ : momentumFock μ}
    (hψ : fockDomH μ ħ (modeDispersion m) ψ) (t : ℝ) :
    HasDerivAt (fun s : ℝ ↦ fockUnitary μ (modeDispersion m) (modeDispersion_measurable m) s ψ)
      (-(Complex.I / (ħ : ℂ)) •
        fockH μ ħ (modeDispersion m) (modeDispersion_measurable m)
          (fockUnitary μ (modeDispersion m) (modeDispersion_measurable m) t ψ)
          (fockDomH_fockUnitary μ ħ (modeDispersion m) (modeDispersion_measurable m) t hψ)) t := by
  have _ := hm
  exact fockUnitary_hasDerivAt μ hħ.ne' (modeDispersion m) (modeDispersion_measurable m) hψ t

/-- Exact domain converse for relativistic mass-shell evolution on `momentumFock μ`. -/
theorem modeFockDomH_of_hasDerivAt {d : ℕ} (μ : Measure (EuclideanSpace ℝ (Fin d))) [SigmaFinite μ]
    {ħ m : ℝ} (hħ : 0 < ħ) (hm : 0 < m) {ψ χ : momentumFock μ}
    (hderiv : HasDerivAt
      (fun t : ℝ ↦ fockUnitary μ (modeDispersion m) (modeDispersion_measurable m) t ψ) χ 0) :
    ∃ hψ : fockDomH μ ħ (modeDispersion m) ψ,
      χ = -(Complex.I / (ħ : ℂ)) •
        fockH μ ħ (modeDispersion m) (modeDispersion_measurable m) ψ hψ := by
  have _ := hm
  exact fockDomH_of_hasDerivAt μ hħ.ne' (modeDispersion m) (modeDispersion_measurable m) hderiv

end MomentumFockDomH

/-! ### §3.2 Shifts, Second Quantization, Analytic Continuation, Exact Domain & Uncertainty -/
section Dynamics

open MeasureTheory Filter Set
open scoped InnerProductSpace

theorem shifted_overlaps_ext {ι κ E F : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E] [NormedAddCommGroup F] [InnerProductSpace ℂ F]
    (a : ι → E) (b : κ → F)
    (ha : Dense (Submodule.span ℂ (Set.range a) : Set E))
    (hb : Dense (Submodule.span ℂ (Set.range b) : Set F)) (S T : E →L[ℂ] F)
    (h : ∀ i j, inner ℂ (b i) (S (a j)) = inner ℂ (b i) (T (a j))) : S = T :=
  ContinuousLinearMap.ext_on ha <| by
    rintro _ ⟨j, rfl⟩
    exact ext_inner_left ℂ <| DFunLike.congr_fun <|
      ContinuousLinearMap.ext_on (f := innerSLFlip ℂ (S (a j))) (g := innerSLFlip ℂ (T (a j))) hb <| by
        rintro _ ⟨i, rfl⟩; exact h i j

theorem bounded_label_shift {ι E F : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    [NormedAddCommGroup F] [InnerProductSpace ℂ F] [CompleteSpace F]
    (a : ι → E) (b : ι → F) (ha : Dense (Submodule.span ℂ (Set.range a) : Set E))
    (hbound : ∃ C : ℝ, ∀ c : ι →₀ ℂ,
      ‖Finsupp.linearCombination ℂ b c‖ ≤ C * ‖Finsupp.linearCombination ℂ a c‖) :
    ∃! T : E →L[ℂ] F, ∀ i, T (a i) = b i := by
  let A := Finsupp.linearCombination ℂ a; let B := Finsupp.linearCombination ℂ b
  have hd : DenseRange A := by
    change Dense (Set.range A); rw [← LinearMap.coe_range]; simpa only [A, Finsupp.range_linearCombination] using ha
  have hT (i : ι) : B.extendOfNorm A (a i) = b i := by
    simpa [A, B] using LinearMap.extendOfNorm_eq (f := B) hd hbound (Finsupp.single i 1)
  exact ⟨B.extendOfNorm A, hT, fun S hS => ContinuousLinearMap.ext_on ha <| by
    rintro _ ⟨i, rfl⟩; exact (hS i).trans (hT i).symm⟩

theorem unshifted_multiplier_ambiguous (s : ℝ) (hs : 0 < s) :
    (∀ t u r : ℝ, Real.exp (-(t + u) * r) = Real.exp (-t * r) * Real.exp (-u * r)) ∧
    (∀ r : ℝ, Real.exp (-(0 : ℝ) * r) = 1) ∧
    Real.exp (-s * 1) ≠ Real.exp (-s * 2) :=
  ⟨fun t u r => by rw [← Real.exp_add]; congr 1; ring, fun _ => by simp,
    fun h => by linarith [Real.exp_injective h]⟩

theorem mode_rate_iff (s m ω : ℝ) (hs : 0 < s) (hm : 0 < m) :
    m = Real.exp (-s * ω) ↔ ω = -Real.log m / s :=
  ⟨fun h => by rw [h, Real.log_exp, eq_div_iff hs.ne']; ring,
   fun h => by rw [h, show -s * (-Real.log m / s) = Real.log m by field_simp, Real.exp_log hm]⟩

theorem mode_energy (s m ω ℏ : ℝ) (hs : 0 < s) (h : m = Real.exp (-s * ω)) :
    ℏ * ω = -ℏ * Real.log m / s := by rw [h, Real.log_exp]; field_simp

theorem finite_mode_energy {ι : Type*} (I : Finset ι) (ω : ι → ℝ)
    (s ℏ : ℝ) (hs : 0 < s) :
    -ℏ * Real.log (∏ i ∈ I, Real.exp (-s * ω i)) / s = ∑ i ∈ I, ℏ * ω i := by
  rw [Real.log_prod (fun _ _ => (Real.exp_pos _).ne'), ← Finset.mul_sum]
  simp_rw [Real.log_exp]; rw [← Finset.mul_sum]; field_simp

theorem second_quantization_unique {𝔥 ℋ : Type*}
    [NormedAddCommGroup 𝔥] [InnerProductSpace ℂ 𝔥]
    [NormedAddCommGroup ℋ] [InnerProductSpace ℂ ℋ] [CompleteSpace ℋ]
    (ε : 𝔥 → ℋ)
    (hd : Dense ((Submodule.span ℂ (Set.range ε) : Submodule ℂ ℋ) : Set ℋ))
    (hgram : ∀ u v, inner ℂ (ε u) (ε v) = Complex.exp (inner ℂ u v))
    (u : 𝔥 ≃ₗᵢ[ℂ] 𝔥) :
    ∃! Γ : ℋ ≃ₗᵢ[ℂ] ℋ, ∀ v, Γ (ε v) = ε (u v) :=
  gram_total_unique ε (ε ∘ u) hd
    (by simpa [Set.range_comp, u.surjective.range_eq, Set.image_univ] using hd)
    (fun a b => by simp [hgram, u.inner_map_map])

theorem second_quantization_group {𝔥 ℋ : Type*}
    [NormedAddCommGroup 𝔥] [InnerProductSpace ℂ 𝔥]
    [NormedAddCommGroup ℋ] [InnerProductSpace ℂ ℋ] [CompleteSpace ℋ]
    (ε : 𝔥 → ℋ)
    (hd : Dense ((Submodule.span ℂ (Set.range ε) : Submodule ℂ ℋ) : Set ℋ))
    (hgram : ∀ u v, inner ℂ (ε u) (ε v) = Complex.exp (inner ℂ u v))
    (u : ℝ → 𝔥 ≃ₗᵢ[ℂ] 𝔥) (hgroup : ∀ t s v, u (t + s) v = u t (u s v)) :
    ∃ Γ : ℝ → ℋ ≃ₗᵢ[ℂ] ℋ,
      (∀ t v, Γ t (ε v) = ε (u t v)) ∧
      (∀ t, Γ t (ε 0) = ε 0) ∧
      (∀ t s x, Γ (t + s) x = Γ t (Γ s x)) := by
  choose Γ hΓ huniq using fun t => second_quantization_unique ε hd hgram (u t)
  exact ⟨Γ, hΓ, fun t => by rw [hΓ, map_zero], fun t s x =>
    (DFunLike.congr_fun (huniq (t + s) ((Γ s).trans (Γ t)) fun v => by simp [hΓ, hgroup]) x).symm⟩

/-- Analytic continuation from the positive real half-line to the imaginary axis (Fig. 2c). -/
theorem unique_halfplane_continuation (F G : ℂ → ℂ)
    (hFd : DifferentiableOn ℂ F {z | 0 < z.re}) (hGd : DifferentiableOn ℂ G {z | 0 < z.re})
    (hFc : ContinuousOn F {z | 0 ≤ z.re}) (hGc : ContinuousOn G {z | 0 ≤ z.re})
    (hpos : ∀ s : ℝ, 0 < s → F (s : ℂ) = G (s : ℂ)) :
    ∀ t : ℝ, F (Complex.I * t) = G (Complex.I * t) := by
  have hUopen : IsOpen {z : ℂ | 0 < z.re} := isOpen_lt continuous_const Complex.continuous_re
  have hfreq : ∃ᶠ z in nhdsWithin (1 : ℂ) {(1 : ℂ)}ᶜ, F z = G z := by
    rw [Filter.frequently_iff]; intro s hs
    obtain ⟨r, hr, hball⟩ := Metric.mem_nhdsWithin_iff.mp hs
    refine ⟨((1 + r / 2 : ℝ) : ℂ), hball ⟨?_, fun h => by have := congrArg Complex.re h; simp at this; linarith⟩,
      hpos _ (by linarith)⟩
    rw [Metric.mem_ball, Complex.dist_eq, show ((1 + r / 2 : ℝ) : ℂ) - 1 = ((r / 2 : ℝ) : ℂ) by push_cast; ring,
      Complex.norm_real, Real.norm_eq_abs, abs_of_pos (by linarith)]; linarith
  have heq : Set.EqOn F G {z | 0 < z.re} :=
    (hFd.analyticOnNhd hUopen).eqOn_of_preconnected_of_frequently_eq
      (hGd.analyticOnNhd hUopen) (convex_halfSpace_re_gt (0 : ℝ)).isPreconnected (by simp) hfreq
  intro t
  let γ : ℝ → ℂ := fun ε => (ε : ℂ) + Complex.I * t
  have hγt : Filter.Tendsto γ (nhdsWithin (0 : ℝ) (Set.Ioi 0)) (nhdsWithin (Complex.I * t) {z | 0 ≤ z.re}) :=
    tendsto_nhdsWithin_of_tendsto_nhds_of_eventually_within _
      (by simpa [γ] using (Complex.continuous_ofReal.tendsto 0 |>.mono_left nhdsWithin_le_nhds).add tendsto_const_nhds)
      (by filter_upwards [self_mem_nhdsWithin] with ε (hε : 0 < ε); simp [γ, hε.le])
  exact tendsto_nhds_unique ((hFc _ (by simp)).tendsto.comp hγt)
    (((hGc _ (by simp)).tendsto.comp hγt).congr'
      (by filter_upwards [self_mem_nhdsWithin] with ε (hε : 0 < ε); exact (heq (by simp [γ, hε])).symm))

/-! ### §3.2 Exact Schrödinger Multiplier Domain (`multiplier_domain_exact`) -/
section MultiplierDomain

open Filter
open scoped Topology

/-- Diagonal unitary phase group `U(t) ψ i = exp(-i t ω i) ψ i` on `ℓ²(ι, ℂ)`. -/
noncomputable def multPhase {ι : Type*} (ω : ι → ℝ) (t : ℝ) (i : ι) : ℂ :=
  Complex.exp (-Complex.I * (t : ℂ) * (ω i : ℂ))

private lemma norm_multPhase {ι : Type*} (ω : ι → ℝ) (t : ℝ) (i : ι) : ‖multPhase ω t i‖ = 1 := by
  simp [multPhase, Complex.norm_exp, Complex.mul_re, Complex.mul_im]

private lemma multUnitary_memℓp {ι : Type*} (ω : ι → ℝ) (t : ℝ)
    (ψ : lp (fun _ : ι ↦ ℂ) 2) : Memℓp (fun i ↦ multPhase ω t i * ψ i) 2 := by
  rw [memℓp_gen_iff (by norm_num : (0 : ℝ) < (2 : ENNReal).toReal)]
  simpa [norm_mul, norm_multPhase] using (lp.hasSum_norm (p := 2) (by norm_num) ψ).summable

/-- Unitary multiplier evolution group `t ↦ exp(-i t ω)` on `ℓ²(ι, ℂ)`. -/
noncomputable def multUnitary {ι : Type*} (ω : ι → ℝ) (t : ℝ) :
    lp (fun _ : ι ↦ ℂ) 2 ≃ₗᵢ[ℂ] lp (fun _ : ι ↦ ℂ) 2 where
  toLinearEquiv :=
    { toFun := fun ψ ↦ ⟨fun i ↦ multPhase ω t i * ψ i, multUnitary_memℓp ω t ψ⟩
      invFun := fun ψ ↦ ⟨fun i ↦ multPhase ω (-t) i * ψ i, multUnitary_memℓp ω (-t) ψ⟩
      map_add' := fun ψ₁ ψ₂ ↦ Subtype.ext <| funext fun i ↦ mul_add (multPhase ω t i) (ψ₁ i) (ψ₂ i)
      map_smul' := fun c ψ ↦ Subtype.ext <| funext fun i ↦ by simp [Pi.smul_apply, smul_eq_mul]; ring
      left_inv := fun ψ ↦ Subtype.ext <| funext fun i ↦ by
        simp only [← mul_assoc, multPhase, ← Complex.exp_add, Complex.ofReal_neg]
        rw [show -Complex.I * -(t : ℂ) * (ω i : ℂ) + -Complex.I * (t : ℂ) * (ω i : ℂ) = 0 by ring,
          Complex.exp_zero, one_mul]
      right_inv := fun ψ ↦ Subtype.ext <| funext fun i ↦ by
        simp only [← mul_assoc, multPhase, ← Complex.exp_add, Complex.ofReal_neg]
        rw [show -Complex.I * (t : ℂ) * (ω i : ℂ) + -Complex.I * -(t : ℂ) * (ω i : ℂ) = 0 by ring,
          Complex.exp_zero, one_mul] }
  norm_map' := fun ψ ↦ by
    let y : lp (fun _ : ι ↦ ℂ) 2 := ⟨fun i ↦ multPhase ω t i * ψ i, multUnitary_memℓp ω t ψ⟩
    change ‖y‖ = ‖ψ‖
    have h1 := (lp.hasSum_norm (p := 2) (by norm_num) y).tsum_eq
    have h2 := (lp.hasSum_norm (p := 2) (by norm_num) ψ).tsum_eq
    have hsq : ‖y‖ ^ 2 = ‖ψ‖ ^ 2 := by
      have : (2 : ENNReal).toReal = 2 := by norm_num
      rw [this, Real.rpow_two] at h1 h2
      simp only [y, norm_mul, norm_multPhase, one_mul] at h1; exact h1.symm.trans h2
    nlinarith [norm_nonneg ψ, norm_nonneg y]

@[simp]
theorem multUnitary_apply {ι : Type*} (ω : ι → ℝ) (t : ℝ) (ψ : lp (fun _ : ι ↦ ℂ) 2) (i : ι) :
    multUnitary ω t ψ i = Complex.exp (-Complex.I * (t : ℂ) * (ω i : ℂ)) * ψ i := rfl

theorem multUnitary_zero {ι : Type*} (ω : ι → ℝ) (ψ : lp (fun _ : ι ↦ ℂ) 2) :
    multUnitary ω 0 ψ = ψ := Subtype.ext <| funext fun i ↦ by simp

theorem multUnitary_add {ι : Type*} (ω : ι → ℝ) (t s : ℝ) (ψ : lp (fun _ : ι ↦ ℂ) 2) :
    multUnitary ω (t + s) ψ = multUnitary ω t (multUnitary ω s ψ) :=
  Subtype.ext <| funext fun i ↦ by
    simp only [multUnitary_apply, ← mul_assoc, ← Complex.exp_add, Complex.ofReal_add]; congr 2; ring

private lemma hasDerivAt_multPhase (ω : ℝ) :
    HasDerivAt (fun t : ℝ ↦ Complex.exp (-Complex.I * (t : ℂ) * (ω : ℂ))) (-(ω : ℂ) * Complex.I) 0 := by
  have hc : HasDerivAt (fun t : ℂ ↦ t * (-(ω : ℂ) * Complex.I)) (-(ω : ℂ) * Complex.I) 0 := by
    simpa using (hasDerivAt_id (0 : ℂ)).mul_const (-(ω : ℂ) * Complex.I)
  convert hc.cexp.comp_ofReal (z := (0 : ℝ)) using 1
  · funext t; congr 1; ring
  · simp

private lemma multPhase_slope_bound (ω t : ℝ) :
    ‖t⁻¹ • (Complex.exp (-Complex.I * (t : ℂ) * (ω : ℂ)) - 1)‖ ≤ |ω| := by
  by_cases ht : t = 0
  · simp [ht]
  rw [show Complex.exp (-Complex.I * (t : ℂ) * (ω : ℂ)) = Complex.exp (Complex.I * ((-t * ω : ℝ) : ℂ)) by
    congr 1; push_cast; ring, norm_smul, norm_inv]
  calc ‖t‖⁻¹ * ‖Complex.exp (Complex.I * ((-t * ω : ℝ) : ℂ)) - 1‖
      ≤ ‖t‖⁻¹ * ‖-t * ω‖ := mul_le_mul_of_nonneg_left Real.norm_exp_I_mul_ofReal_sub_one_le (by positivity)
    _ = |ω| := by rw [norm_mul, norm_neg, ← mul_assoc, inv_mul_cancel₀ (norm_ne_zero_iff.mpr ht), one_mul, Real.norm_eq_abs]

/-- Exact norm-differentiability characterization of the Schrödinger generator domain `Dom(H)`
on `ℓ²(ι, ℂ)` for `U(t) ψ i = exp(-i t ω i) ψ i`. -/
theorem multiplier_domain_exact {ι : Type*} (ω : ι → ℝ) (ψ v : lp (fun _ : ι ↦ ℂ) 2) :
    HasDerivAt (fun t : ℝ ↦ multUnitary ω t ψ) v 0 ↔
      Memℓp (fun i ↦ (-(ω i : ℂ) * Complex.I) * ψ i) 2 ∧
        ∀ i, v i = (-(ω i : ℂ) * Complex.I) * ψ i := by
  constructor
  · intro hderiv
    have hcoord (i : ι) : v i = (-(ω i : ℂ) * Complex.I) * ψ i := by
      let ev : lp (fun _ : ι ↦ ℂ) 2 →L[ℝ] ℂ := LinearMap.mkContinuous
        { toFun := fun f ↦ f i, map_add' := fun _ _ ↦ rfl, map_smul' := fun _ _ ↦ rfl } 1 fun f ↦ by
          change ‖f i‖ ≤ 1 * ‖f‖; rw [one_mul]
          exact lp.norm_apply_le_norm (by norm_num : (2 : ENNReal) ≠ 0) f i
      exact (ev.hasFDerivAt.comp_hasDerivAt 0 hderiv).unique ((hasDerivAt_multPhase (ω i)).mul_const (ψ i))
    exact ⟨(funext fun i ↦ (hcoord i).symm) ▸ v.property, hcoord⟩
  · rintro ⟨_, hv⟩
    rw [hasDerivAt_iff_tendsto_slope_zero, tendsto_iff_norm_sub_tendsto_zero]
    let d (t : ℝ) : lp (fun _ : ι ↦ ℂ) 2 := t⁻¹ • (multUnitary ω t ψ - ψ) - v
    have h2 : (2 : ENNReal).toReal = 2 := by norm_num
    have hnormSq (t : ℝ) : ‖d t‖ ^ 2 = ∑' i : ι, ‖d t i‖ ^ 2 := by
      have h := (lp.hasSum_norm (p := 2) (by norm_num) (d t)).tsum_eq; rw [h2] at h
      simpa [Real.rpow_two] using h.symm
    have hv_sum : Summable (fun i : ι ↦ 4 * ‖v i‖ ^ 2) := by
      have h := (lp.hasSum_norm (p := 2) (by norm_num) v).summable; rw [h2] at h
      exact (by simpa [Real.rpow_two] using h : Summable fun i ↦ ‖v i‖ ^ 2).mul_left 4
    have hpt (i : ι) : Tendsto (fun t : ℝ ↦ ‖d t i‖ ^ 2) (𝓝[≠] 0) (𝓝 0) := by
      have hmul := ((hasDerivAt_multPhase (ω i)).tendsto_slope_zero.mul_const (ψ i)).sub (tendsto_const_nhds (x := v i))
      rw [hv i, sub_self] at hmul
      have h1 : Tendsto (fun t : ℝ ↦ d t i) (𝓝[≠] 0) (𝓝 0) := hmul.congr fun t ↦ by
        simp only [d, lp.coeFn_sub, lp.coeFn_smul, Pi.sub_apply, Pi.smul_apply, multUnitary_apply,
          Complex.real_smul, zero_add, Complex.ofReal_zero, mul_zero, zero_mul, Complex.exp_zero, hv i]; ring
      simpa using h1.norm.pow 2
    have hbound : ∀ t : ℝ, ∀ i : ι, ‖‖d t i‖ ^ 2‖ ≤ 4 * ‖v i‖ ^ 2 := fun t i ↦ by
      rw [Real.norm_of_nonneg (sq_nonneg _)]
      have hvi : ‖v i‖ = |ω i| * ‖ψ i‖ := by simp [hv i, Complex.norm_real]
      have hdi : ‖d t i‖ ≤ 2 * ‖v i‖ := by
        rw [show d t i = (t⁻¹ • (Complex.exp (-Complex.I * (t : ℂ) * (ω i : ℂ)) - 1)) * ψ i - v i by
          simp only [d, lp.coeFn_sub, lp.coeFn_smul, Pi.sub_apply, Pi.smul_apply, multUnitary_apply,
            Complex.real_smul]; ring]
        calc ‖(t⁻¹ • (Complex.exp (-Complex.I * (t : ℂ) * (ω i : ℂ)) - 1)) * ψ i - v i‖
            ≤ ‖(t⁻¹ • (Complex.exp (-Complex.I * (t : ℂ) * (ω i : ℂ)) - 1)) * ψ i‖ + ‖v i‖ := norm_sub_le _ _
          _ ≤ |ω i| * ‖ψ i‖ + ‖v i‖ := by rw [norm_mul]; gcongr; exact multPhase_slope_bound (ω i) t
          _ = 2 * ‖v i‖ := by rw [hvi]; ring
      nlinarith [norm_nonneg (d t i), norm_nonneg (v i)]
    have hsq_lim : Tendsto (fun t : ℝ ↦ ‖d t‖ ^ 2) (𝓝[≠] 0) (𝓝 0) := by
      simp_rw [hnormSq]; simpa using tendsto_tsum_of_dominated_convergence hv_sum hpt (Eventually.of_forall hbound)
    have hlim : Tendsto (fun t : ℝ ↦ ‖d t‖) (𝓝[≠] 0) (𝓝 0) := by
      simpa using ((Real.continuous_sqrt.continuousAt (x := 0)).tendsto.comp hsq_lim).congr
        fun t ↦ Real.sqrt_sq (norm_nonneg (d t))
    simpa [d, zero_add, multUnitary_zero] using hlim

/-- Full time-evolution Schrödinger derivative `d/dt (U(t) ψ) = U(t) (-i ω ψ)` on `Dom(H)`. -/
theorem multiplier_hasDerivAt {ι : Type*} (ω : ι → ℝ) (ψ v : lp (fun _ : ι ↦ ℂ) 2)
    (hmem : Memℓp (fun i ↦ (-(ω i : ℂ) * Complex.I) * ψ i) 2)
    (hv : ∀ i, v i = (-(ω i : ℂ) * Complex.I) * ψ i) (t : ℝ) :
    HasDerivAt (fun s : ℝ ↦ multUnitary ω s ψ) (multUnitary ω t v) t := by
  let T := (multUnitary ω t).toContinuousLinearEquiv.toContinuousLinearMap.restrictScalars ℝ
  rw [hasDerivAt_iff_tendsto_slope_zero]
  refine ((T.continuous.tendsto v).comp ((multiplier_domain_exact ω ψ v).mpr ⟨hmem, hv⟩).tendsto_slope_zero).congr fun s ↦ ?_
  change T (s⁻¹ • (multUnitary ω (0 + s) ψ - multUnitary ω 0 ψ)) = s⁻¹ • (multUnitary ω (t + s) ψ - multUnitary ω t ψ)
  rw [zero_add, multUnitary_zero, map_smul, map_sub]
  change s⁻¹ • (multUnitary ω t (multUnitary ω s ψ) - multUnitary ω t ψ) = _
  rw [multUnitary_add]

end MultiplierDomain

theorem gram2_det_nonneg_im {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (u v : H) :
    0 ≤ ‖u‖ ^ 2 * ‖v‖ ^ 2 - ‖inner ℂ u v‖ ^ 2 ∧ |(inner ℂ u v).im| ≤ ‖u‖ * ‖v‖ := by
  have hcs : ‖inner ℂ u v‖ ≤ ‖u‖ * ‖v‖ := norm_inner_le_norm u v
  exact ⟨by nlinarith [norm_nonneg (inner ℂ u v), mul_nonneg (norm_nonneg u) (norm_nonneg v)],
    (Complex.abs_im_le_norm _).trans hcs⟩

/-- Heisenberg uncertainty `|ħ| / 2 ≤ ΔQ · ΔP` directly from the 2×2 Gram determinant (§3.2). -/
theorem heisenberg_uncertainty {D : Type*} [NormedAddCommGroup D] [InnerProductSpace ℂ D]
    (Q P : D →ₗ[ℂ] D) (ψ : D) (ħ : ℝ) (hψ : ‖ψ‖ = 1)
    (hQ : ∀ x y, inner ℂ (Q x) y = inner ℂ x (Q y))
    (hP : ∀ x y, inner ℂ (P x) y = inner ℂ x (P y))
    (hccr : Q (P ψ) - P (Q ψ) = (Complex.I * (ħ : ℂ)) • ψ) :
    |ħ| / 2 ≤ ‖Q ψ - inner ℂ ψ (Q ψ) • ψ‖ * ‖P ψ - inner ℂ ψ (P ψ) • ψ‖ := by
  let q := inner ℂ ψ (Q ψ); let p := inner ℂ ψ (P ψ)
  have hq : star q = q := by rw [Complex.star_def, inner_conj_symm, hQ]
  have hp : star p = p := by rw [Complex.star_def, inner_conj_symm, hP]
  have hnorm1 : inner ℂ ψ ψ = 1 := by rw [inner_self_eq_norm_sq_to_K, hψ]; simp
  have hcov : inner ℂ (Q ψ - q • ψ) (P ψ - p • ψ) = inner ℂ (Q ψ) (P ψ) - q * p := by
    simp only [inner_sub_left, inner_sub_right, inner_smul_left, inner_smul_right, hnorm1, hQ ψ ψ, mul_one]
    rw [← Complex.star_def, hq]; ring
  have hcomm : inner ℂ (Q ψ) (P ψ) - star (inner ℂ (Q ψ) (P ψ)) = Complex.I * (ħ : ℂ) := by
    rw [Complex.star_def, inner_conj_symm, hQ ψ (P ψ), hP ψ (Q ψ), ← inner_sub_right, hccr,
      inner_smul_right, hnorm1, mul_one]
  have him_qp : (inner ℂ (Q ψ) (P ψ)).im = ħ / 2 := by
    have := congrArg Complex.im hcomm
    simp only [Complex.sub_im, Complex.star_def, Complex.conj_im, Complex.mul_im,
      Complex.I_re, Complex.I_im, Complex.ofReal_re, Complex.ofReal_im] at this
    linarith
  have him_prod : (q * p).im = 0 := by
    have hqi : q.im = 0 := by have := congrArg Complex.im hq; simp only [Complex.star_def, Complex.conj_im] at this; linarith
    have hpi : p.im = 0 := by have := congrArg Complex.im hp; simp only [Complex.star_def, Complex.conj_im] at this; linarith
    simp [Complex.mul_im, hqi, hpi]
  have hbound := (gram2_det_nonneg_im (Q ψ - q • ψ) (P ψ - p • ψ)).2
  rwa [hcov, Complex.sub_im, him_qp, him_prod, sub_zero, abs_div, abs_two] at hbound

/-- Weak-commutator Heisenberg uncertainty `|ħ| / 2 ≤ ΔQ · ΔP` directly from the 2×2 Gram
determinant (§3.2), requiring only `qvec = Q ψ` and `pvec = P ψ` (i.e. `ψ ∈ Dom Q ∩ Dom P`)
with real expectations and weak commutator `⟨qvec, pvec⟩ - ⟨pvec, qvec⟩ = i ħ`. -/
theorem heisenberg_uncertainty_weak {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (ψ qvec pvec : H) (ħ : ℝ) (hψ : ‖ψ‖ = 1)
    (hq_real : (inner ℂ ψ qvec).im = 0)
    (hp_real : (inner ℂ ψ pvec).im = 0)
    (hweak : inner ℂ qvec pvec - inner ℂ pvec qvec = Complex.I * (ħ : ℂ)) :
    |ħ| / 2 ≤ ‖qvec - inner ℂ ψ qvec • ψ‖ * ‖pvec - inner ℂ ψ pvec • ψ‖ := by
  let q := inner ℂ ψ qvec; let p := inner ℂ ψ pvec
  have hq : (starRingEnd ℂ) q = q := by
    apply Complex.ext
    · simp
    · simp only [Complex.conj_im]; change -(inner ℂ ψ qvec).im = (inner ℂ ψ qvec).im; linarith [hq_real]
  have hnorm1 : inner ℂ ψ ψ = 1 := by rw [inner_self_eq_norm_sq_to_K, hψ]; simp
  have hcov : inner ℂ (qvec - q • ψ) (pvec - p • ψ) = inner ℂ qvec pvec - q * p := by
    have hq_left : inner ℂ qvec ψ = q := by
      rw [← inner_conj_symm]; exact hq
    simp only [inner_sub_left, inner_sub_right, inner_smul_left, inner_smul_right, hnorm1,
      hq_left, mul_one, hq]
    ring
  have him_qp : (inner ℂ qvec pvec).im = ħ / 2 := by
    have hcomm : inner ℂ qvec pvec - star (inner ℂ qvec pvec) = Complex.I * (ħ : ℂ) := by
      rwa [Complex.star_def, inner_conj_symm]
    have := congrArg Complex.im hcomm
    simp only [Complex.sub_im, Complex.star_def, Complex.conj_im, Complex.mul_im,
      Complex.I_re, Complex.I_im, Complex.ofReal_re, Complex.ofReal_im] at this
    linarith
  have him_prod : (q * p).im = 0 := by simp [Complex.mul_im, q, p, hq_real, hp_real]
  have hbound := (gram2_det_nonneg_im (qvec - q • ψ) (pvec - p • ψ)).2
  rwa [hcov, Complex.sub_im, him_qp, him_prod, sub_zero, abs_div, abs_two] at hbound

end Dynamics

/-! ### §3.2 Concrete Plane-Field CCR Wired into Heisenberg's Uncertainty Bound -/
section PlaneCCRHeisenberg

open scoped BigOperators

/-- Wrapper equipping `FockFin` with its `InnerProductSpace ℂ` structure induced by `fockFinInner`,
allowing direct application of `heisenberg_uncertainty` without polluting `Finsupp` instances. -/
@[ext]
structure FockFinHilb where
  toFockFin : FockFin

noncomputable instance : AddCommGroup FockFinHilb where
  add x y := ⟨x.toFockFin + y.toFockFin⟩
  zero := ⟨0⟩
  neg x := ⟨-x.toFockFin⟩
  sub x y := ⟨x.toFockFin - y.toFockFin⟩
  nsmul n x := ⟨n • x.toFockFin⟩
  zsmul n x := ⟨n • x.toFockFin⟩
  add_assoc a b c := FockFinHilb.ext (add_assoc a.toFockFin b.toFockFin c.toFockFin)
  zero_add a := FockFinHilb.ext (zero_add a.toFockFin)
  add_zero a := FockFinHilb.ext (add_zero a.toFockFin)
  nsmul_zero a := FockFinHilb.ext (zero_nsmul a.toFockFin)
  nsmul_succ n a := FockFinHilb.ext (succ_nsmul a.toFockFin n)
  zsmul_zero' a := FockFinHilb.ext (zero_zsmul a.toFockFin)
  zsmul_succ' n a := FockFinHilb.ext (by
    change ((n + 1 : ℕ) : ℤ) • a.toFockFin = (n : ℤ) • a.toFockFin + a.toFockFin
    rw [Nat.cast_add, Nat.cast_one, add_zsmul, one_zsmul])
  zsmul_neg' n a := FockFinHilb.ext (by
    change Int.negSucc n • a.toFockFin = -(((n + 1 : ℕ) : ℤ) • a.toFockFin)
    rw [Int.negSucc_eq, neg_zsmul]; norm_cast)
  sub_eq_add_neg a b := FockFinHilb.ext (sub_eq_add_neg a.toFockFin b.toFockFin)
  neg_add_cancel a := FockFinHilb.ext (neg_add_cancel a.toFockFin)
  add_comm a b := FockFinHilb.ext (add_comm a.toFockFin b.toFockFin)

noncomputable instance : Module ℂ FockFinHilb where
  smul c x := ⟨c • x.toFockFin⟩
  one_smul x := FockFinHilb.ext (one_smul ℂ x.toFockFin)
  mul_smul c d x := FockFinHilb.ext (mul_smul c d x.toFockFin)
  smul_zero c := FockFinHilb.ext (smul_zero c)
  smul_add c x y := FockFinHilb.ext (smul_add c x.toFockFin y.toFockFin)
  add_smul c d x := FockFinHilb.ext (add_smul c d x.toFockFin)
  zero_smul x := FockFinHilb.ext (zero_smul ℂ x.toFockFin)

private lemma seam_fockFinInner_conj_symm (x y : FockFin) :
    star (fockFinInner y x) = fockFinInner x y := by
  induction x using Finsupp.induction_linear with
  | zero => simp
  | add x₁ x₂ ih₁ ih₂ => rw [fockFinInner_add_right, fockFinInner_add_left, star_add, ih₁, ih₂]
  | single α a =>
    induction y using Finsupp.induction_linear with
    | zero => simp
    | add y₁ y₂ ih₁ ih₂ => rw [fockFinInner_add_left, fockFinInner_add_right, star_add, ih₁, ih₂]
    | single β b =>
      simp only [fockFinInner_single_left, Finsupp.single_apply, star_mul']
      by_cases h : α = β
      · subst h; simp [mul_comm]
      · simp [h, Ne.symm h]

private lemma seam_fockFinInner_self_re (x : FockFin) :
    (fockFinInner x x).re = ∑ α ∈ x.support, ‖x α‖ ^ 2 := by
  unfold fockFinInner Finsupp.sum
  rw [Complex.re_sum]
  refine Finset.sum_congr rfl fun α _ => ?_
  dsimp only
  rw [Complex.star_def, Complex.conj_mul', ← Complex.ofReal_pow, Complex.ofReal_re]

@[instance_reducible]
private noncomputable def fockFinCore : InnerProductSpace.Core ℂ FockFinHilb where
  inner x y := fockFinInner x.toFockFin y.toFockFin
  conj_inner_symm x y := by
    simpa [RCLike.star_def] using seam_fockFinInner_conj_symm x.toFockFin y.toFockFin
  re_inner_nonneg x := by
    change 0 ≤ (fockFinInner x.toFockFin x.toFockFin).re
    rw [seam_fockFinInner_self_re]
    exact Finset.sum_nonneg fun α _ => sq_nonneg _
  definite x hx := by
    have hre : ∑ α ∈ x.toFockFin.support, ‖x.toFockFin α‖ ^ 2 = 0 := by
      rw [← seam_fockFinInner_self_re]
      simpa using congrArg Complex.re hx
    apply FockFinHilb.ext
    ext α
    by_cases hα : α ∈ x.toFockFin.support
    · have h0 := (Finset.sum_eq_zero_iff_of_nonneg (fun β _ => sq_nonneg ‖x.toFockFin β‖)).mp hre α hα
      exact norm_eq_zero.mp (sq_eq_zero_iff.mp h0)
    · exact Finsupp.notMem_support_iff.mp hα
  add_left x y z := fockFinInner_add_left x.toFockFin y.toFockFin z.toFockFin
  smul_left x y c := fockFinInner_smul_left c x.toFockFin y.toFockFin

noncomputable instance : NormedAddCommGroup FockFinHilb :=
  fockFinCore.toNormedAddCommGroup

noncomputable instance : InnerProductSpace ℂ FockFinHilb :=
  InnerProductSpace.ofCore fockFinCore.toCore

@[simp]
lemma fockFinHilb_inner (x y : FockFinHilb) :
    inner ℂ x y = fockFinInner x.toFockFin y.toFockFin := rfl

/-- Lift a linear operator on `FockFin` to `FockFinHilb`. -/
def liftFockOp (T : FockFin →ₗ[ℂ] FockFin) : FockFinHilb →ₗ[ℂ] FockFinHilb where
  toFun x := ⟨T x.toFockFin⟩
  map_add' x y := FockFinHilb.ext (T.map_add x.toFockFin y.toFockFin)
  map_smul' c x := FockFinHilb.ext (T.map_smul c x.toFockFin)

/-- Concrete plane-field mode vector `v_j = √(ħ / (2 ω_j)) h_j` for a finitely supported real
mode profile `h : ℕ →₀ ℝ`. -/
noncomputable def planeFieldMode (ħ : ℝ) (ω : ℕ → ℝ) (h : ℕ →₀ ℝ) : ℕ →₀ ℂ :=
  Finsupp.onFinset h.support (fun j => ((Real.sqrt (ħ / (2 * ω j)) * h j : ℝ) : ℂ))
    fun j hj => Finsupp.mem_support_iff.mpr fun h0 => hj (by simp [h0])

/-- Concrete conjugate-momentum mode vector `w_j = i ω_j v_j` for a finitely supported real
mode profile `h : ℕ →₀ ℝ`. -/
noncomputable def planeMomentumMode (ħ : ℝ) (ω : ℕ → ℝ) (h : ℕ →₀ ℝ) : ℕ →₀ ℂ :=
  Finsupp.onFinset h.support
    (fun j => Complex.I * (ω j : ℂ) * planeFieldMode ħ ω h j)
    fun j hj => Finsupp.mem_support_iff.mpr fun h0 => hj (by simp [planeFieldMode, h0])

/-- Hermitian plane-field reading `Q(h) = fockField v v` on `FockFin`. -/
noncomputable def planeQ (ħ : ℝ) (ω : ℕ → ℝ) (h : ℕ →₀ ℝ) : FockFin →ₗ[ℂ] FockFin :=
  fockField (planeFieldMode ħ ω h) (planeFieldMode ħ ω h)

/-- Hermitian plane-field time derivative `P(h) = fockField (i ω v) (i ω v)` on `FockFin`. -/
noncomputable def planeP (ħ : ℝ) (ω : ℕ → ℝ) (h : ℕ →₀ ℝ) : FockFin →ₗ[ℂ] FockFin :=
  fockField (planeMomentumMode ħ ω h) (planeMomentumMode ħ ω h)

/-- `Q(h)` is formally Hermitian on `FockFin`. -/
theorem planeQ_symm (ħ : ℝ) (ω : ℕ → ℝ) (h : ℕ →₀ ℝ) (ψ φ : FockFin) :
    fockFinInner (planeQ ħ ω h ψ) φ = fockFinInner ψ (planeQ ħ ω h φ) :=
  fockField_symm (planeFieldMode ħ ω h) ψ φ

/-- `P(h)` is formally Hermitian on `FockFin`. -/
theorem planeP_symm (ħ : ℝ) (ω : ℕ → ℝ) (h : ℕ →₀ ℝ) (ψ φ : FockFin) :
    fockFinInner (planeP ħ ω h ψ) φ = fockFinInner ψ (planeP ħ ω h φ) :=
  fockField_symm (planeMomentumMode ħ ω h) ψ φ

/-- Concrete §3.2 canonical commutation relation `[Q(h), P(h)] ψ = (i ħ) • ψ` on `FockFin`
for every normalized real plane test `∑ h_j² = 1` and positive mode frequencies `ω_j > 0`. -/
theorem plane_ccr {ħ : ℝ} (hħ : 0 ≤ ħ) (ω : ℕ → ℝ) (hω : ∀ j, 0 < ω j)
    (h : ℕ →₀ ℝ) (hnorm : ∑ j ∈ h.support, h j ^ 2 = 1) (ψ : FockFin) :
    planeQ ħ ω h (planeP ħ ω h ψ) - planeP ħ ω h (planeQ ħ ω h ψ) =
      (Complex.I * (ħ : ℂ)) • ψ := by
  unfold planeQ planeP
  rw [fockField_commutator]
  congr 1
  let v := planeFieldMode ħ ω h
  let w := planeMomentumMode ħ ω h
  have hv_supp : v.support ⊆ h.support := Finsupp.support_onFinset_subset
  have hw_supp : w.support ⊆ h.support := Finsupp.support_onFinset_subset
  have hvw : modeInner v w = ∑ j ∈ h.support, star (v j) * w j := by
    unfold modeInner Finsupp.sum
    refine Finset.sum_subset hv_supp fun j _ hj => ?_
    simp [Finsupp.notMem_support_iff.mp hj]
  have hwv : modeInner w v = ∑ j ∈ h.support, star (w j) * v j := by
    unfold modeInner Finsupp.sum
    refine Finset.sum_subset hw_supp fun j _ hj => ?_
    simp [Finsupp.notMem_support_iff.mp hj]
  rw [hvw, hwv, ← Finset.sum_sub_distrib]
  have hterm (j : ℕ) : star (v j) * w j - star (w j) * v j =
      Complex.I * (ħ : ℂ) * ((h j ^ 2 : ℝ) : ℂ) := by
    have hvj : v j = ((Real.sqrt (ħ / (2 * ω j)) * h j : ℝ) : ℂ) := rfl
    have hwj : w j = Complex.I * (ω j : ℂ) * v j := rfl
    have hsq : Real.sqrt (ħ / (2 * ω j)) * Real.sqrt (ħ / (2 * ω j)) = ħ / (2 * ω j) :=
      Real.mul_self_sqrt (div_nonneg hħ (by linarith [hω j]))
    rw [hwj, hvj, Complex.star_def, map_mul, map_mul,
      Complex.conj_I, Complex.conj_ofReal, Complex.conj_ofReal]
    have hreal : ((Real.sqrt (ħ / (2 * ω j)) * h j : ℝ) : ℂ) *
        ((Real.sqrt (ħ / (2 * ω j)) * h j : ℝ) : ℂ) =
        ((ħ / (2 * ω j) * h j ^ 2 : ℝ) : ℂ) := by
      rw [← Complex.ofReal_mul]
      congr 1
      calc (Real.sqrt (ħ / (2 * ω j)) * h j) * (Real.sqrt (ħ / (2 * ω j)) * h j)
          = (Real.sqrt (ħ / (2 * ω j)) * Real.sqrt (ħ / (2 * ω j))) * h j ^ 2 := by ring
        _ = ħ / (2 * ω j) * h j ^ 2 := by rw [hsq]
    have hωc : (ω j : ℂ) ≠ 0 := Complex.ofReal_ne_zero.mpr (hω j).ne'
    calc ((Real.sqrt (ħ / (2 * ω j)) * h j : ℝ) : ℂ) *
            (Complex.I * (ω j : ℂ) * ((Real.sqrt (ħ / (2 * ω j)) * h j : ℝ) : ℂ)) -
          (-Complex.I * (ω j : ℂ) * ((Real.sqrt (ħ / (2 * ω j)) * h j : ℝ) : ℂ)) *
            ((Real.sqrt (ħ / (2 * ω j)) * h j : ℝ) : ℂ)
        = (2 * Complex.I * (ω j : ℂ)) *
            (((Real.sqrt (ħ / (2 * ω j)) * h j : ℝ) : ℂ) *
              ((Real.sqrt (ħ / (2 * ω j)) * h j : ℝ) : ℂ)) := by ring
      _ = (2 * Complex.I * (ω j : ℂ)) * ((ħ / (2 * ω j) * h j ^ 2 : ℝ) : ℂ) := by rw [hreal]
      _ = Complex.I * (ħ : ℂ) * ((h j ^ 2 : ℝ) : ℂ) := by push_cast; field_simp [hωc]
  simp_rw [hterm]
  rw [← Finset.mul_sum, ← Complex.ofReal_sum, hnorm, Complex.ofReal_one, mul_one]

/-- Unconditional §3.2 plane-field Heisenberg uncertainty bound wired directly from `plane_ccr`
into `heisenberg_uncertainty`: for every unit state `ψ : FockFinHilb`, every `ħ ≥ 0`, every
positive dispersion `ω`, and every normalized real plane profile `∑ h_j² = 1`,
`ħ / 2 ≤ ΔQ(h)(ψ) · ΔP(h)(ψ)` with zero abstract `hccr` hypothesis. -/
theorem plane_heisenberg_uncertainty {ħ : ℝ} (hħ : 0 ≤ ħ) (ω : ℕ → ℝ) (hω : ∀ j, 0 < ω j)
    (h : ℕ →₀ ℝ) (hnorm : ∑ j ∈ h.support, h j ^ 2 = 1)
    (ψ : FockFinHilb) (hψ : ‖ψ‖ = 1) :
    let Q := liftFockOp (planeQ ħ ω h)
    let P := liftFockOp (planeP ħ ω h)
    ħ / 2 ≤ ‖Q ψ - inner ℂ ψ (Q ψ) • ψ‖ * ‖P ψ - inner ℂ ψ (P ψ) • ψ‖ := by
  let Q := liftFockOp (planeQ ħ ω h)
  let P := liftFockOp (planeP ħ ω h)
  have hQ : ∀ x y : FockFinHilb, inner ℂ (Q x) y = inner ℂ x (Q y) :=
    fun x y => planeQ_symm ħ ω h x.toFockFin y.toFockFin
  have hP : ∀ x y : FockFinHilb, inner ℂ (P x) y = inner ℂ x (P y) :=
    fun x y => planeP_symm ħ ω h x.toFockFin y.toFockFin
  have hccr : Q (P ψ) - P (Q ψ) = (Complex.I * (ħ : ℂ)) • ψ := by
    apply FockFinHilb.ext
    exact plane_ccr hħ ω hω h hnorm ψ.toFockFin
  have hbound := heisenberg_uncertainty Q P ψ ħ hψ hQ hP hccr
  rwa [abs_of_nonneg hħ] at hbound

end PlaneCCRHeisenberg

/-! ### §3.2 Low-Momentum Nonrelativistic Schrödinger Limit -/
section NonrelativisticLimit

open MeasureTheory Filter Set
open scoped Topology

/-- Low-momentum nonrelativistic dispersion limit (§3.2):
for `m > 0` and any momentum `k`, `(ω(ε k) - m) / ε² → ‖k‖² / (2 m)` as `ε → 0⁺`,
via the exact rationalized identity `(√(ε² ‖k‖² + m²) - m) / ε² = ‖k‖² / (√(ε² ‖k‖² + m²) + m)`. -/
theorem nonrelativistic_dispersion_limit {d : ℕ} {m : ℝ} (hm : 0 < m)
    (k : EuclideanSpace ℝ (Fin d)) :
    Tendsto (fun ε : ℝ => (modeDispersion m (ε • k) - m) / ε ^ 2)
      (𝓝[>] 0) (𝓝 (‖k‖ ^ 2 / (2 * m))) := by
  have hrat : ∀ ε : ℝ, 0 < ε →
      (modeDispersion m (ε • k) - m) / ε ^ 2 =
        ‖k‖ ^ 2 / (modeDispersion m (ε • k) + m) := by
    intro ε hε
    have hω_pos : 0 < modeDispersion m (ε • k) :=
      Real.sqrt_pos.mpr (by positivity)
    have hden : modeDispersion m (ε • k) + m ≠ 0 := by linarith
    have hsq : modeDispersion m (ε • k) ^ 2 = ε ^ 2 * ‖k‖ ^ 2 + m ^ 2 := by
      unfold modeDispersion
      rw [Real.sq_sqrt (add_nonneg (sq_nonneg _) (sq_nonneg _)), norm_smul, Real.norm_of_nonneg hε.le,
        mul_pow]
    rw [div_eq_div_iff (pow_ne_zero 2 hε.ne') hden]
    linear_combination hsq
  have hcont : Continuous (fun ε : ℝ => ‖k‖ ^ 2 / (modeDispersion m (ε • k) + m)) := by
    refine continuous_const.div ?_ fun ε => ?_
    · unfold modeDispersion
      exact (Real.continuous_sqrt.comp
        (((continuous_norm.comp (continuous_id.smul continuous_const)).pow 2).add continuous_const)).add
        continuous_const
    · have hω_pos : 0 < modeDispersion m (ε • k) := Real.sqrt_pos.mpr (by positivity)
      linarith
  have hlim : Tendsto (fun ε : ℝ => ‖k‖ ^ 2 / (modeDispersion m (ε • k) + m))
      (𝓝[>] 0) (𝓝 (‖k‖ ^ 2 / (2 * m))) := by
    have h0 : modeDispersion m (0 : EuclideanSpace ℝ (Fin d)) + m = 2 * m := by
      simp [modeDispersion, Real.sqrt_sq hm.le]; ring
    have ht := (hcont.continuousAt (x := 0)).tendsto.mono_left (nhdsWithin_le_nhds (s := Set.Ioi 0))
    simpa [zero_smul, h0] using ht
  refine hlim.congr' ?_
  filter_upwards [self_mem_nhdsWithin] with ε hε
  exact (hrat ε hε).symm

/-- Rescaled one-particle relativistic phase with rest energy removed:
`exp(-i τ (ω(ε k) - m) / ε²)`. -/
noncomputable def relRescaledPhase {d : ℕ} (m τ ε : ℝ)
    (k : EuclideanSpace ℝ (Fin d)) : ℂ :=
  Complex.exp (-Complex.I * (τ : ℂ) * (((modeDispersion m (ε • k) - m) / ε ^ 2 : ℝ) : ℂ))

/-- Free nonrelativistic Schrödinger phase: `exp(-i τ ‖k‖² / (2 m))`. -/
noncomputable def schrodingerPhase {d : ℕ} (m τ : ℝ)
    (k : EuclideanSpace ℝ (Fin d)) : ℂ :=
  Complex.exp (-Complex.I * (τ : ℂ) * ((‖k‖ ^ 2 / (2 * m) : ℝ) : ℂ))

private lemma seam_norm_relRescaledPhase {d : ℕ} (m τ ε : ℝ)
    (k : EuclideanSpace ℝ (Fin d)) :
    ‖relRescaledPhase m τ ε k‖ = 1 := by
  unfold relRescaledPhase
  rw [show -Complex.I * (τ : ℂ) * (((modeDispersion m (ε • k) - m) / ε ^ 2 : ℝ) : ℂ) =
    ((-(τ * ((modeDispersion m (ε • k) - m) / ε ^ 2)) : ℝ) : ℂ) * Complex.I by push_cast; ring,
    Complex.norm_exp_ofReal_mul_I]

private lemma seam_norm_schrodingerPhase {d : ℕ} (m τ : ℝ)
    (k : EuclideanSpace ℝ (Fin d)) :
    ‖schrodingerPhase m τ k‖ = 1 := by
  unfold schrodingerPhase
  rw [show -Complex.I * (τ : ℂ) * ((‖k‖ ^ 2 / (2 * m) : ℝ) : ℂ) =
    ((-(τ * (‖k‖ ^ 2 / (2 * m))) : ℝ) : ℂ) * Complex.I by push_cast; ring,
    Complex.norm_exp_ofReal_mul_I]

/-- Rescaled relativistic one-particle evolution on `L²(ℝ^d, ℂ)` with rest-energy phase removed. -/
noncomputable def relRescaledEvol {d : ℕ} (m τ ε : ℝ)
    (ψ : Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d)))) :
    Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d))) :=
  MemLp.toLp (fun k => relRescaledPhase m τ ε k * ψ k) <|
    (Lp.memLp ψ).of_le_mul
      ((show Continuous (relRescaledPhase m τ ε) by
          unfold relRescaledPhase modeDispersion; fun_prop).aestronglyMeasurable.mul
        (Lp.aestronglyMeasurable ψ))
      (ae_of_all _ fun k => by
        rw [norm_mul, seam_norm_relRescaledPhase, one_mul])

/-- Free nonrelativistic Schrödinger evolution on `L²(ℝ^d, ℂ)`. -/
noncomputable def schrodingerEvol {d : ℕ} (m τ : ℝ)
    (ψ : Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d)))) :
    Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d))) :=
  MemLp.toLp (fun k => schrodingerPhase m τ k * ψ k) <|
    (Lp.memLp ψ).of_le_mul
      ((show Continuous (schrodingerPhase m τ) by
          unfold schrodingerPhase; fun_prop).aestronglyMeasurable.mul
        (Lp.aestronglyMeasurable ψ))
      (ae_of_all _ fun k => by
        rw [norm_mul, seam_norm_schrodingerPhase, one_mul])

/-- Strong `L²` convergence of the rescaled one-particle relativistic evolution (with rest energy
removed) to the free nonrelativistic Schrödinger evolution as `ε → 0⁺` (§3.2). -/
theorem nonrelativistic_schrodinger_l2_limit {d : ℕ} {m : ℝ} (hm : 0 < m) (τ : ℝ)
    (ψ : Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d)))) :
    Tendsto (fun ε : ℝ => relRescaledEvol m τ ε ψ) (𝓝[>] 0) (𝓝 (schrodingerEvol m τ ψ)) := by
  rw [tendsto_iff_norm_sub_tendsto_zero]
  have hnormSq (ε : ℝ) :
      ‖relRescaledEvol m τ ε ψ - schrodingerEvol m τ ψ‖ ^ 2 =
        ∫ k : EuclideanSpace ℝ (Fin d),
          ‖(relRescaledPhase m τ ε k - schrodingerPhase m τ k) * ψ k‖ ^ 2 := by
    let f := relRescaledEvol m τ ε ψ - schrodingerEvol m τ ψ
    have hinner : ‖f‖ ^ 2 = (inner ℂ f f).re := by
      rw [inner_self_eq_norm_sq_to_K]
      norm_cast
    rw [hinner, MeasureTheory.L2.inner_def, ← Complex.reCLM_apply,
      ← ContinuousLinearMap.integral_comp_comm Complex.reCLM (MeasureTheory.L2.integrable_inner f f)]
    have hae : (fun k => Complex.reCLM (inner ℂ (f k) (f k))) =ᵐ[volume]
        fun k => ‖(relRescaledPhase m τ ε k - schrodingerPhase m τ k) * ψ k‖ ^ 2 := by
      have hk2_ae : (relRescaledEvol m τ ε ψ : EuclideanSpace ℝ (Fin d) → ℂ) =ᵐ[volume]
          fun k => relRescaledPhase m τ ε k * ψ k := MemLp.coeFn_toLp _
      have hk3_ae : (schrodingerEvol m τ ψ : EuclideanSpace ℝ (Fin d) → ℂ) =ᵐ[volume]
          fun k => schrodingerPhase m τ k * ψ k := MemLp.coeFn_toLp _
      filter_upwards [Lp.coeFn_sub (relRescaledEvol m τ ε ψ) (schrodingerEvol m τ ψ),
        hk2_ae, hk3_ae] with k hk1 hk2 hk3
      change (inner ℂ (f k) (f k)).re = _
      rw [inner_self_eq_norm_sq_to_K]
      have hf_eq : f k = (relRescaledPhase m τ ε k - schrodingerPhase m τ k) * ψ k := by
        rw [hk1, Pi.sub_apply, hk2, hk3, sub_mul]
      rw [hf_eq]
      norm_cast
    exact integral_congr_ae hae
  have hψ_sq : Integrable (fun k : EuclideanSpace ℝ (Fin d) => 4 * ‖ψ k‖ ^ 2) := by
    have h1 : Integrable (fun k : EuclideanSpace ℝ (Fin d) => ‖ψ k‖ ^ 2) :=
      ((Lp.memLp ψ).norm).integrable_sq
    exact h1.const_mul 4
  have hsq_lim : Tendsto
      (fun ε : ℝ => ∫ k : EuclideanSpace ℝ (Fin d),
        ‖(relRescaledPhase m τ ε k - schrodingerPhase m τ k) * ψ k‖ ^ 2)
      (𝓝[>] 0) (𝓝 0) := by
    have h0 : (0 : ℝ) = ∫ _ : EuclideanSpace ℝ (Fin d), (0 : ℝ) := by simp
    rw [h0]
    refine tendsto_integral_filter_of_dominated_convergence
      (fun k => 4 * ‖ψ k‖ ^ 2)
      (Eventually.of_forall fun ε => ?_)
      (Eventually.of_forall fun ε => ae_of_all _ fun k => ?_)
      hψ_sq
      (ae_of_all _ fun k => ?_)
    · have hc : Continuous (fun k : EuclideanSpace ℝ (Fin d) =>
          relRescaledPhase m τ ε k - schrodingerPhase m τ k) := by
        unfold relRescaledPhase schrodingerPhase modeDispersion; fun_prop
      exact ((hc.aestronglyMeasurable.mul (Lp.aestronglyMeasurable ψ)).norm).pow 2
    · rw [Real.norm_of_nonneg (sq_nonneg _), norm_mul, mul_pow]
      have hdiff : ‖relRescaledPhase m τ ε k - schrodingerPhase m τ k‖ ≤ 2 := by
        calc ‖relRescaledPhase m τ ε k - schrodingerPhase m τ k‖
            ≤ ‖relRescaledPhase m τ ε k‖ + ‖schrodingerPhase m τ k‖ := norm_sub_le _ _
          _ = 1 + 1 := by rw [seam_norm_relRescaledPhase, seam_norm_schrodingerPhase]
          _ = 2 := by norm_num
      have hdiff2 : ‖relRescaledPhase m τ ε k - schrodingerPhase m τ k‖ ^ 2 ≤ 4 := by
        nlinarith [norm_nonneg (relRescaledPhase m τ ε k - schrodingerPhase m τ k)]
      exact mul_le_mul_of_nonneg_right hdiff2 (sq_nonneg _)
    · have hdisp := nonrelativistic_dispersion_limit hm k
      have hphase : Tendsto (fun ε : ℝ => relRescaledPhase m τ ε k) (𝓝[>] 0)
          (𝓝 (schrodingerPhase m τ k)) := by
        unfold relRescaledPhase schrodingerPhase
        exact Complex.continuous_exp.continuousAt.tendsto.comp
          ((Complex.continuous_ofReal.continuousAt.tendsto.comp hdisp).const_mul (-Complex.I * (τ : ℂ)))
      have hsub : Tendsto (fun ε : ℝ => (relRescaledPhase m τ ε k - schrodingerPhase m τ k) * ψ k)
          (𝓝[>] 0) (𝓝 0) := by
        simpa using (hphase.sub (tendsto_const_nhds (x := schrodingerPhase m τ k))).mul_const (ψ k)
      simpa using (hsub.norm.pow 2)
  have hsqrt := (Real.continuous_sqrt.continuousAt (x := 0)).tendsto.comp hsq_lim
  refine (by simpa [Function.comp_def, Real.sqrt_zero] using hsqrt :
      Tendsto (fun ε : ℝ => Real.sqrt (∫ k : EuclideanSpace ℝ (Fin d),
        ‖(relRescaledPhase m τ ε k - schrodingerPhase m τ k) * ψ k‖ ^ 2)) (𝓝[>] 0) (𝓝 0)).congr fun ε => ?_
  rw [← hnormSq ε, Real.sqrt_sq (norm_nonneg _)]

/-- Relativistic particle energy `E(p) = √(‖p‖² + M²)` with rest mass `M = ħ m` (§3.2). -/
noncomputable def particleEnergy {d : ℕ} (ħ m : ℝ) (p : EuclideanSpace ℝ (Fin d)) : ℝ :=
  Real.sqrt (‖p‖ ^ 2 + (ħ * m) ^ 2)

/-- Momentum–wavenumber identity `E(p) = ħ ω_{p / ħ}` for `p = ħ k` and `ħ > 0` (§3.2). -/
theorem particleEnergy_eq_hbar_dispersion {d : ℕ} {ħ : ℝ} (hħ : 0 < ħ) (m : ℝ)
    (p : EuclideanSpace ℝ (Fin d)) :
    ħ * modeDispersion m (ħ⁻¹ • p) = particleEnergy ħ m p := by
  unfold modeDispersion particleEnergy
  calc ħ * Real.sqrt (‖ħ⁻¹ • p‖ ^ 2 + m ^ 2)
      = Real.sqrt (ħ ^ 2) * Real.sqrt (‖ħ⁻¹ • p‖ ^ 2 + m ^ 2) := by rw [Real.sqrt_sq hħ.le]
    _ = Real.sqrt (ħ ^ 2 * (‖ħ⁻¹ • p‖ ^ 2 + m ^ 2)) := (Real.sqrt_mul (sq_nonneg ħ) _).symm
    _ = Real.sqrt (‖p‖ ^ 2 + (ħ * m) ^ 2) := by
        congr 1
        rw [norm_smul, Real.norm_of_nonneg (inv_nonneg.mpr hħ.le), mul_pow]
        field_simp [hħ.ne']

/-- Einstein's energy–momentum relation `E(p)² = ‖p‖² + M²` with rest mass `M = ħ m` (§3.2). -/
theorem einstein_energy_momentum {d : ℕ} (ħ m : ℝ) (p : EuclideanSpace ℝ (Fin d)) :
    particleEnergy ħ m p ^ 2 = ‖p‖ ^ 2 + (ħ * m) ^ 2 :=
  Real.sq_sqrt (add_nonneg (sq_nonneg _) (sq_nonneg _))

/-- Rest energy equals rest mass (`E(0) = M = ħ m`, i.e. `E = M c²` in units `c = 1`, §3.2). -/
theorem rest_energy_eq_mass {d : ℕ} {ħ m : ℝ} (hħ : 0 ≤ ħ) (hm : 0 ≤ m) :
    particleEnergy ħ m (0 : EuclideanSpace ℝ (Fin d)) = ħ * m := by
  unfold particleEnergy
  simp [Real.sqrt_sq (mul_nonneg hħ hm)]

/-- Momentum-form nonrelativistic Schrödinger limit (§3.2): with rest mass `M = ħ m`,
`(E(ε p₀) - M) / ε² → ‖p₀‖² / (2 M)` as `ε → 0⁺`. -/
theorem nonrelativistic_energy_limit {d : ℕ} {ħ m : ℝ} (hħ : 0 < ħ) (hm : 0 < m)
    (p₀ : EuclideanSpace ℝ (Fin d)) :
    Tendsto (fun ε : ℝ => (particleEnergy ħ m (ε • p₀) - ħ * m) / ε ^ 2)
      (𝓝[>] 0) (𝓝 (‖p₀‖ ^ 2 / (2 * (ħ * m)))) := by
  have hM : 0 < ħ * m := mul_pos hħ hm
  have hrat : ∀ ε : ℝ, 0 < ε →
      (particleEnergy ħ m (ε • p₀) - ħ * m) / ε ^ 2 =
        ‖p₀‖ ^ 2 / (particleEnergy ħ m (ε • p₀) + ħ * m) := by
    intro ε hε
    have hE_pos : 0 < particleEnergy ħ m (ε • p₀) := Real.sqrt_pos.mpr (by positivity)
    have hden : particleEnergy ħ m (ε • p₀) + ħ * m ≠ 0 := by linarith [hE_pos, hM]
    have hsq : particleEnergy ħ m (ε • p₀) ^ 2 = ε ^ 2 * ‖p₀‖ ^ 2 + (ħ * m) ^ 2 := by
      rw [einstein_energy_momentum, norm_smul, Real.norm_of_nonneg hε.le, mul_pow]
    rw [div_eq_div_iff (pow_ne_zero 2 hε.ne') hden]
    linear_combination hsq
  have hcont : Continuous (fun ε : ℝ => ‖p₀‖ ^ 2 / (particleEnergy ħ m (ε • p₀) + ħ * m)) := by
    refine continuous_const.div ?_ fun ε => ?_
    · unfold particleEnergy
      exact (Real.continuous_sqrt.comp
        (((continuous_norm.comp (continuous_id.smul continuous_const)).pow 2).add continuous_const)).add
        continuous_const
    · have hE_pos : 0 < particleEnergy ħ m (ε • p₀) := Real.sqrt_pos.mpr (by positivity)
      linarith [hE_pos, hM]
  have hlim : Tendsto (fun ε : ℝ => ‖p₀‖ ^ 2 / (particleEnergy ħ m (ε • p₀) + ħ * m))
      (𝓝[>] 0) (𝓝 (‖p₀‖ ^ 2 / (2 * (ħ * m)))) := by
    have h0 : particleEnergy ħ m (0 : EuclideanSpace ℝ (Fin d)) + ħ * m = 2 * (ħ * m) := by
      rw [rest_energy_eq_mass hħ.le hm.le]; ring
    have ht := (hcont.continuousAt (x := 0)).tendsto.mono_left (nhdsWithin_le_nhds (s := Set.Ioi 0))
    simpa [zero_smul, h0] using ht
  refine hlim.congr' ?_
  filter_upwards [self_mem_nhdsWithin] with ε hε
  exact (hrat ε hε).symm

end NonrelativisticLimit

/-!
==============================================================================
  PART 7: SPECIAL RELATIVITY, HEAT KERNEL & CONTINUUM WIGHTMAN FIELD (§3.3)
==============================================================================
-/
section Relativity

open MeasureTheory Filter Set
open scoped InnerProductSpace

noncomputable def dispersion (m k : ℝ) : ℝ := Real.sqrt (k ^ 2 + m ^ 2)

noncomputable def lorentzBoost (m β k : ℝ) : ℝ := k * Real.cosh β + dispersion m k * Real.sinh β

private lemma dispersion_boost {m : ℝ} (hm : 0 < m) (β k : ℝ) :
    dispersion m (lorentzBoost m β k) = dispersion m k * Real.cosh β + k * Real.sinh β := by
  have hω : 0 < dispersion m k := Real.sqrt_pos.mpr (by positivity)
  have hωsq : dispersion m k ^ 2 = k ^ 2 + m ^ 2 := Real.sq_sqrt (by positivity)
  have hcs := Real.cosh_sq_sub_sinh_sq β
  have hpos : 0 < dispersion m k * Real.cosh β + k * Real.sinh β := by
    have hlt := mul_lt_mul'' (by nlinarith [sq_abs k, abs_nonneg k, hω, hωsq, hm] : |k| < dispersion m k)
      (by nlinarith [sq_abs (Real.sinh β), abs_nonneg (Real.sinh β), Real.cosh_pos β, hcs] :
        |Real.sinh β| < Real.cosh β) (abs_nonneg k) (abs_nonneg _)
    rw [← abs_mul] at hlt; linarith [(abs_lt.mp hlt).1]
  rw [dispersion, ← Real.sqrt_sq hpos.le]; congr 1; unfold lorentzBoost; nlinarith [hωsq, hcs]

private lemma lorentzBoost_inv {m : ℝ} (hm : 0 < m) (β k : ℝ) :
    lorentzBoost m (-β) (lorentzBoost m β k) = k := by
  change lorentzBoost m β k * Real.cosh (-β) + dispersion m (lorentzBoost m β k) * Real.sinh (-β) = k
  rw [dispersion_boost hm, Real.cosh_neg, Real.sinh_neg, lorentzBoost]
  linear_combination k * Real.cosh_sq_sub_sinh_sq β

/-- Lorentz boost invariance of the relativistic one-particle measure `dk / (2 ω_k)` (§3.3). -/
theorem boost_measure_invariant {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    {m : ℝ} (hm : 0 < m) (β : ℝ) (g : ℝ → E) :
    (∫ k : ℝ, (2 * dispersion m k)⁻¹ • g k) =
      ∫ k : ℝ, (2 * dispersion m k)⁻¹ • g (lorentzBoost m β k) := by
  have hderiv (k : ℝ) : HasDerivAt (lorentzBoost m β) (dispersion m (lorentzBoost m β k) / dispersion m k) k := by
    have hω : 0 < dispersion m k := Real.sqrt_pos.mpr (by positivity)
    have hdω : HasDerivAt (dispersion m) (k / dispersion m k) k := by
      have hsq : HasDerivAt (fun x : ℝ => x ^ 2 + m ^ 2) (2 * k) k := by
        simpa using (hasDerivAt_pow 2 k).add_const (m ^ 2)
      have h0 : HasDerivAt (dispersion m) (2 * k / (2 * dispersion m k)) k :=
        hsq.sqrt (by positivity : k ^ 2 + m ^ 2 ≠ 0)
      convert h0 using 1; field_simp [hω.ne']
    have hsum : HasDerivAt (lorentzBoost m β) (1 * Real.cosh β + k / dispersion m k * Real.sinh β) k :=
      ((hasDerivAt_id k).mul_const (Real.cosh β)).add (hdω.mul_const (Real.sinh β))
    convert hsum using 1; rw [dispersion_boost hm]; field_simp [hω.ne']
  have hsurj : lorentzBoost m β '' Set.univ = Set.univ := Set.eq_univ_of_forall fun y =>
    ⟨lorentzBoost m (-β) y, trivial, by simpa [neg_neg] using lorentzBoost_inv hm (-β) y⟩
  have h := MeasureTheory.integral_image_eq_integral_abs_deriv_smul (s := Set.univ) MeasurableSet.univ
    (fun k _ => (hderiv k).hasDerivWithinAt)
    (fun a _ b _ h => by simpa [lorentzBoost_inv hm] using congrArg (lorentzBoost m (-β)) h)
    (fun k => (2 * dispersion m k)⁻¹ • g k)
  rw [hsurj, MeasureTheory.Measure.restrict_univ] at h
  refine h.trans (MeasureTheory.integral_congr_ae (ae_of_all _ fun k => ?_))
  have hω1 : 0 < dispersion m k := Real.sqrt_pos.mpr (by positivity)
  have hω2 : 0 < dispersion m (lorentzBoost m β k) := Real.sqrt_pos.mpr (by positivity)
  dsimp only; rw [abs_of_pos (div_pos hω2 hω1), smul_smul]; congr 1; field_simp [hω1.ne', hω2.ne']

/-! ### §3.3 Spacelike Commutativity via Entire-Function Cauchy Rectangle Theorem -/
section SpacelikeCausality

open MeasureTheory Filter Set
open scoped Topology

/-- Entire Pauli–Jordan normal-momentum kernel `sin(τ √(z² + M²)) / √(z² + M²)` defined
by its everywhere-convergent power series in `z² + M²` (zero branch cuts!). -/
noncomputable def pjEntire (τ M : ℝ) (z : ℂ) : ℂ :=
  ∑' n : ℕ,
    ((-1 : ℂ) ^ n * (τ : ℂ) ^ (2 * n + 1) / ((2 * n + 1).factorial : ℂ)) *
      (z ^ 2 + (M : ℂ) ^ 2) ^ n

private lemma pjTerm_norm_le (τ R : ℝ) (n : ℕ) {z : ℂ} (hz : ‖z ^ 2 + (M : ℂ) ^ 2‖ ≤ R) :
    ‖((-1 : ℂ) ^ n * (τ : ℂ) ^ (2 * n + 1) / ((2 * n + 1).factorial : ℂ)) *
        (z ^ 2 + (M : ℂ) ^ 2) ^ n‖ ≤
      |τ| * ((|τ| ^ 2 * R) ^ n / (n.factorial : ℝ)) := by
  have hfac : (n.factorial : ℝ) ≤ ((2 * n + 1).factorial : ℝ) := by
    exact_mod_cast Nat.factorial_le (by omega)
  have hfac_pos : (0 : ℝ) < (n.factorial : ℝ) := Nat.cast_pos.mpr (Nat.factorial_pos n)
  have hnorm_eq :
      ‖((-1 : ℂ) ^ n * (τ : ℂ) ^ (2 * n + 1) / ((2 * n + 1).factorial : ℂ)) *
          (z ^ 2 + (M : ℂ) ^ 2) ^ n‖ =
        (|τ| ^ (2 * n + 1) / ((2 * n + 1).factorial : ℝ)) * ‖z ^ 2 + (M : ℂ) ^ 2‖ ^ n := by
    simp [norm_pow, Complex.norm_real]
  rw [hnorm_eq]
  have hpow : ‖z ^ 2 + (M : ℂ) ^ 2‖ ^ n ≤ R ^ n := pow_le_pow_left₀ (norm_nonneg _) hz n
  have hdiv : |τ| ^ (2 * n + 1) / ((2 * n + 1).factorial : ℝ) ≤
      |τ| ^ (2 * n + 1) / (n.factorial : ℝ) :=
    div_le_div_of_nonneg_left (pow_nonneg (abs_nonneg τ) _) hfac_pos hfac
  calc (|τ| ^ (2 * n + 1) / ((2 * n + 1).factorial : ℝ)) * ‖z ^ 2 + (M : ℂ) ^ 2‖ ^ n
      ≤ (|τ| ^ (2 * n + 1) / (n.factorial : ℝ)) * R ^ n :=
        mul_le_mul hdiv hpow (pow_nonneg (norm_nonneg _) _) (by positivity)
    _ = |τ| * ((|τ| ^ 2 * R) ^ n / (n.factorial : ℝ)) := by
        rw [pow_succ, pow_mul, mul_pow]; ring

/-- `pjEntire τ M` is an entire function on all of `ℂ`. -/
theorem pjEntire_differentiable (τ M : ℝ) : Differentiable ℂ (pjEntire τ M) := by
  intro z₀
  let r₀ : ℝ := ‖z₀‖ + 1
  let U : Set ℂ := Metric.ball 0 r₀
  let R : ℝ := r₀ ^ 2 + M ^ 2
  have hsum : Summable (fun n : ℕ => |τ| * ((|τ| ^ 2 * R) ^ n / (n.factorial : ℝ))) :=
    (Real.summable_pow_div_factorial (|τ| ^ 2 * R)).mul_left |τ|
  have hdiffOn : DifferentiableOn ℂ (pjEntire τ M) U := by
    refine Complex.differentiableOn_tsum_of_summable_norm hsum
      (fun n => (Differentiable.const_mul
        ((differentiable_pow 2 |>.add (differentiable_const _)).pow n) _).differentiableOn)
      Metric.isOpen_ball fun n w hw => ?_
    have hw_lt : ‖w‖ < r₀ := by simpa [U, Metric.mem_ball, dist_zero_right] using hw
    have hbound : ‖w ^ 2 + (M : ℂ) ^ 2‖ ≤ R := by
      calc ‖w ^ 2 + (M : ℂ) ^ 2‖
          ≤ ‖w ^ 2‖ + ‖(M : ℂ) ^ 2‖ := norm_add_le _ _
        _ = ‖w‖ ^ 2 + M ^ 2 := by simp [norm_pow, Complex.norm_real]
        _ ≤ r₀ ^ 2 + M ^ 2 := by gcongr
    exact pjTerm_norm_le τ R n hbound
  exact hdiffOn.differentiableAt (Metric.isOpen_ball.mem_nhds (by
    simp [Metric.mem_ball, dist_zero_right, r₀]))

private lemma hasSum_sin_series (u : ℂ) :
    HasSum (fun n : ℕ => (-1 : ℂ) ^ n * u ^ (2 * n + 1) / ((2 * n + 1).factorial : ℂ))
      (Complex.sin u) := by
  have h1 : HasSum (fun k : ℕ => (u * Complex.I) ^ k / (k.factorial : ℂ))
      (Complex.exp (u * Complex.I)) := by
    simpa [Complex.exp_eq_exp_ℂ] using NormedSpace.expSeries_div_hasSum_exp (𝔸 := ℂ) (u * Complex.I)
  have h2 : HasSum (fun k : ℕ => (-(u * Complex.I)) ^ k / (k.factorial : ℂ))
      (Complex.exp (-(u * Complex.I))) := by
    simpa [Complex.exp_eq_exp_ℂ] using NormedSpace.expSeries_div_hasSum_exp (𝔸 := ℂ) (-(u * Complex.I))
  have hsub := (h1.sub h2).div_const (2 * Complex.I)
  have hsin : (Complex.exp (u * Complex.I) - Complex.exp (-(u * Complex.I))) / (2 * Complex.I) =
      Complex.sin u := by
    rw [Complex.sin, show -(u * Complex.I) = -u * Complex.I by ring]
    set a := Complex.exp (u * Complex.I)
    set b := Complex.exp (-u * Complex.I)
    have h2I : (2 : ℂ) * Complex.I ≠ 0 := mul_ne_zero two_ne_zero Complex.I_ne_zero
    rw [div_eq_iff h2I,
      show (b - a) * Complex.I / 2 * (2 * Complex.I) = (b - a) * (Complex.I ^ 2) by ring,
      Complex.I_sq]
    ring
  rw [hsin] at hsub
  let g : ℕ → ℂ := fun k =>
    ((u * Complex.I) ^ k / (k.factorial : ℂ) - (-(u * Complex.I)) ^ k / (k.factorial : ℂ)) /
      (2 * Complex.I)
  have hinj : Function.Injective (fun n : ℕ => 2 * n + 1) := by
    intro a b h
    dsimp only at h
    omega
  have hcomp :
      (fun n : ℕ => (-1 : ℂ) ^ n * u ^ (2 * n + 1) / ((2 * n + 1).factorial : ℂ)) =
        g ∘ (fun n : ℕ => 2 * n + 1) := by
    funext n
    dsimp only [Function.comp_apply, g]
    have hI2 : Complex.I ^ (2 * n + 1) = (-1 : ℂ) ^ n * Complex.I := by
      rw [pow_succ, pow_mul, Complex.I_sq]
    have hneg : (-(u * Complex.I)) ^ (2 * n + 1) = -((u * Complex.I) ^ (2 * n + 1)) := by
      rw [neg_pow, show (-1 : ℂ) ^ (2 * n + 1) = -1 by
        rw [pow_succ, pow_mul]; norm_num, neg_one_mul]
    rw [hneg, neg_div, sub_neg_eq_add, mul_pow, hI2]
    have h2I : (2 : ℂ) * Complex.I ≠ 0 := mul_ne_zero two_ne_zero Complex.I_ne_zero
    field_simp [h2I]
    ring
  rw [hcomp, hinj.hasSum_iff]
  · exact hsub
  · intro k hk
    dsimp only [g]
    have heven : Even k := by
      rcases Nat.even_or_odd k with he | ⟨n, rfl⟩
      · exact he
      · exact False.elim (hk ⟨n, rfl⟩)
    obtain ⟨n, rfl⟩ := heven
    rw [neg_pow, show (-1 : ℂ) ^ (n + n) = 1 by
      rw [← two_mul, pow_mul]; norm_num, one_mul, sub_self, zero_div]

private lemma mul_pjEntire_eq_sin (τ M : ℝ) {z w : ℂ} (hw : w ^ 2 = z ^ 2 + (M : ℂ) ^ 2) :
    w * pjEntire τ M z = Complex.sin ((τ : ℂ) * w) := by
  unfold pjEntire
  have hsum := hasSum_sin_series ((τ : ℂ) * w)
  have hterm (n : ℕ) :
      w * (((-1 : ℂ) ^ n * (τ : ℂ) ^ (2 * n + 1) / ((2 * n + 1).factorial : ℂ)) *
        (z ^ 2 + (M : ℂ) ^ 2) ^ n) =
      (-1 : ℂ) ^ n * ((τ : ℂ) * w) ^ (2 * n + 1) / ((2 * n + 1).factorial : ℂ) := by
    rw [← hw, ← pow_mul, mul_pow, pow_succ, pow_mul]
    ring
  rw [← tsum_mul_left]
  simp_rw [hterm]
  exact hsum.tsum_eq

private lemma pjEntire_eq_integral (τ M : ℝ) {z w : ℂ} (hw : w ^ 2 = z ^ 2 + (M : ℂ) ^ 2) :
    pjEntire τ M z = (τ : ℂ) * ∫ s in (0 : ℝ)..1, Complex.cos ((τ : ℂ) * (s : ℂ) * w) := by
  by_cases hτ : τ = 0
  · subst hτ
    unfold pjEntire
    simp
  · by_cases hw0 : w = 0
    · subst hw0
      have hz0 : z ^ 2 + (M : ℂ) ^ 2 = 0 := by simpa using hw.symm
      unfold pjEntire
      rw [hz0, tsum_eq_single 0]
      · simp
      · intro n hn
        simp [zero_pow hn]
    · have hτc : (τ : ℂ) ≠ 0 := Complex.ofReal_ne_zero.mpr hτ
      have hτw : (τ : ℂ) * w ≠ 0 := mul_ne_zero hτc hw0
      have hderiv (s : ℝ) :
          HasDerivAt (fun t : ℝ => Complex.sin ((τ : ℂ) * (t : ℂ) * w) / ((τ : ℂ) * w))
            (Complex.cos ((τ : ℂ) * (s : ℂ) * w)) s := by
        have hlin : HasDerivAt (fun t : ℝ => (τ : ℂ) * (t : ℂ) * w) ((τ : ℂ) * w) s := by
          have h1 : HasDerivAt (fun t : ℝ => (t : ℂ)) 1 s := Complex.ofRealCLM.hasDerivAt
          simpa [mul_comm, mul_left_comm, mul_assoc] using (h1.const_mul (τ : ℂ)).mul_const w
        have hsin := (Complex.hasDerivAt_sin ((τ : ℂ) * (s : ℂ) * w)).comp s hlin
        simpa [mul_div_cancel_right₀ _ hτw] using hsin.div_const ((τ : ℂ) * w)
      have hint : IntervalIntegrable (fun s : ℝ => Complex.cos ((τ : ℂ) * (s : ℂ) * w)) volume 0 1 :=
        (Complex.continuous_cos.comp
          ((continuous_const.mul Complex.continuous_ofReal).mul continuous_const)).intervalIntegrable 0 1
      rw [intervalIntegral.integral_eq_sub_of_hasDerivAt (fun s _ => hderiv s) hint]
      simp only [Complex.ofReal_one, Complex.ofReal_zero, mul_one, mul_zero, zero_mul,
        Complex.sin_zero, zero_div, sub_zero]
      have hmul := mul_pjEntire_eq_sin τ M hw
      apply mul_left_cancel₀ hw0
      rw [hmul]
      field_simp [hτc, hw0]

/-- On the real axis with `M > 0`, `pjEntire τ M k = sin(τ √(k² + M²)) / √(k² + M²)`. -/
theorem pjEntire_real (τ M k : ℝ) (hM : 0 < M) :
    pjEntire τ M (k : ℂ) =
      ((Real.sin (τ * Real.sqrt (k ^ 2 + M ^ 2)) / Real.sqrt (k ^ 2 + M ^ 2) : ℝ) : ℂ) := by
  set ω : ℝ := Real.sqrt (k ^ 2 + M ^ 2)
  have hω_pos : 0 < ω := Real.sqrt_pos.mpr (by positivity)
  have hω_sq : (ω : ℂ) ^ 2 = (k : ℂ) ^ 2 + (M : ℂ) ^ 2 := by
    rw [← Complex.ofReal_pow, Real.sq_sqrt (by positivity)]; push_cast; rfl
  have hmul := mul_pjEntire_eq_sin τ M hω_sq
  have hωc : (ω : ℂ) ≠ 0 := Complex.ofReal_ne_zero.mpr hω_pos.ne'
  apply mul_left_cancel₀ hωc
  rw [hmul, Complex.ofReal_div, mul_div_cancel₀ _ hωc, ← Complex.ofReal_mul, Complex.ofReal_sin]

private lemma exists_sqrt_im_le (x y M : ℝ) :
    ∃ w : ℂ, w ^ 2 = ((x : ℂ) + (y : ℂ) * Complex.I) ^ 2 + (M : ℂ) ^ 2 ∧ |w.im| ≤ |y| := by
  set a : ℝ := x ^ 2 - y ^ 2 + M ^ 2
  set b : ℝ := 2 * x * y
  set R : ℝ := Real.sqrt (a ^ 2 + b ^ 2)
  have hR_sq : R ^ 2 = a ^ 2 + b ^ 2 := Real.sq_sqrt (by positivity)
  have ha_le_R : |a| ≤ R := by
    rw [← Real.sqrt_sq_eq_abs]
    exact Real.sqrt_le_sqrt (by nlinarith)
  have hRa_nn : 0 ≤ (R + a) / 2 := by linarith [neg_abs_le a]
  have hRma_nn : 0 ≤ (R - a) / 2 := by linarith [le_abs_self a]
  set u : ℝ := Real.sqrt ((R + a) / 2)
  set sgn : ℝ := if 0 ≤ b then 1 else -1
  set v : ℝ := sgn * Real.sqrt ((R - a) / 2)
  refine ⟨⟨u, v⟩, ?_, ?_⟩
  · have hu2 : u ^ 2 = (R + a) / 2 := Real.sq_sqrt hRa_nn
    have hsgn2 : sgn ^ 2 = 1 := by dsimp [sgn]; split_ifs <;> norm_num
    have hv2 : v ^ 2 = (R - a) / 2 := by
      dsimp [v]; rw [mul_pow, hsgn2, one_mul, Real.sq_sqrt hRma_nn]
    have huv : 2 * u * v = b := by
      have hprod : Real.sqrt ((R + a) / 2) * Real.sqrt ((R - a) / 2) = |b| / 2 := by
        rw [← Real.sqrt_mul hRa_nn]
        have hdiff : (R + a) / 2 * ((R - a) / 2) = (b / 2) ^ 2 := by
          nlinarith [hR_sq]
        rw [hdiff, Real.sqrt_sq_eq_abs, abs_div, abs_two]
      have hsgn_abs : sgn * |b| = b := by
        dsimp [sgn]; split_ifs with hb
        · rw [one_mul, abs_of_nonneg hb]
        · rw [abs_of_neg (not_le.mp hb)]; ring
      calc 2 * u * v = sgn * (2 * (Real.sqrt ((R + a) / 2) * Real.sqrt ((R - a) / 2))) := by
              dsimp [u, v]; ring
        _ = sgn * |b| := by rw [hprod]; ring
        _ = b := hsgn_abs
    apply Complex.ext
    · simp only [sq, Complex.mul_re, Complex.add_re, Complex.add_im, Complex.mul_im,
        Complex.ofReal_re, Complex.I_re, Complex.ofReal_im, Complex.I_im, mul_zero, sub_zero,
        add_zero, mul_one, zero_add]
      linarith [hu2, hv2]
    · simp only [sq, Complex.mul_im, Complex.add_re, Complex.add_im, Complex.mul_re,
        Complex.ofReal_re, Complex.I_re, Complex.ofReal_im, Complex.I_im, mul_zero, sub_zero,
        add_zero, mul_one, zero_add]
      linarith [huv]
  · have hR_le : R ≤ x ^ 2 + y ^ 2 + M ^ 2 := by
      rw [← Real.sqrt_sq (by positivity : (0 : ℝ) ≤ x ^ 2 + y ^ 2 + M ^ 2)]
      apply Real.sqrt_le_sqrt
      dsimp [a, b]
      nlinarith [sq_nonneg (y * M)]
    have hv_sq_le : v ^ 2 ≤ y ^ 2 := by
      have hsgn2 : sgn ^ 2 = 1 := by dsimp [sgn]; split_ifs <;> norm_num
      have hv2 : v ^ 2 = (R - a) / 2 := by
        dsimp [v]; rw [mul_pow, hsgn2, one_mul, Real.sq_sqrt hRma_nn]
      dsimp [a] at hv2
      linarith
    simpa [← Real.sqrt_sq_eq_abs] using Real.sqrt_le_sqrt hv_sq_le

/-- Uniform exponential bound on `pjEntire τ M` with ZERO `x`-growth and ZERO branch cuts:
`‖pjEntire τ M (x + iy)‖ ≤ |τ| * exp(|τ| * |y|)` for all `x, y, M, τ : ℝ`. -/
theorem pjEntire_exp_bound (x y M τ : ℝ) :
    ‖pjEntire τ M ((x : ℂ) + (y : ℂ) * Complex.I)‖ ≤ |τ| * Real.exp (|τ| * |y|) := by
  obtain ⟨w, hw, hw_im⟩ := exists_sqrt_im_le x y M
  rw [pjEntire_eq_integral τ M hw, norm_mul, Complex.norm_real, Real.norm_eq_abs]
  refine mul_le_mul_of_nonneg_left ?_ (abs_nonneg τ)
  have hcos_le (s : ℝ) (hs : s ∈ Set.uIoc (0 : ℝ) 1) :
      ‖Complex.cos ((τ : ℂ) * (s : ℂ) * w)‖ ≤ Real.exp (|τ| * |y|) := by
    rw [Set.uIoc_of_le zero_le_one] at hs
    have hcos_norm (ζ : ℂ) : ‖Complex.cos ζ‖ ≤ Real.exp |ζ.im| := by
      rw [Complex.cos]
      calc ‖(Complex.exp (ζ * Complex.I) + Complex.exp (-ζ * Complex.I)) / 2‖
          = ‖Complex.exp (ζ * Complex.I) + Complex.exp (-ζ * Complex.I)‖ / 2 := by
            rw [norm_div, Complex.norm_ofNat]
        _ ≤ (‖Complex.exp (ζ * Complex.I)‖ + ‖Complex.exp (-ζ * Complex.I)‖) / 2 :=
            div_le_div_of_nonneg_right (norm_add_le _ _) (by norm_num)
        _ = (Real.exp (-ζ.im) + Real.exp ζ.im) / 2 := by
            simp [Complex.norm_exp]
        _ ≤ (Real.exp |ζ.im| + Real.exp |ζ.im|) / 2 := by
            gcongr
            · exact neg_le_abs _
            · exact le_abs_self _
        _ = Real.exp |ζ.im| := by ring
    refine (hcos_norm _).trans (Real.exp_le_exp.mpr ?_)
    have him : ((τ : ℂ) * (s : ℂ) * w).im = τ * s * w.im := by
      simp [Complex.mul_im, Complex.mul_re]
    rw [him, abs_mul, abs_mul, abs_of_pos hs.1]
    calc |τ| * s * |w.im| ≤ |τ| * 1 * |y| := by
          gcongr
          exact hs.2
      _ = |τ| * |y| := by ring
  simpa using intervalIntegral.norm_integral_le_of_norm_le_const hcos_le

/-- §3.3 Spacelike Commutativity via Cauchy Rectangle Theorem on `[-L, L] × [0, Y]`:
for any entire test transform `H` with Paley–Wiener upper-half-plane decay rate `r > |τ|`,
the Pauli–Jordan integral vanishes identically. -/
theorem spacelike_commutator_zero {τ M C r : ℝ} (hτr : |τ| < r)
    {H : ℂ → ℂ} (hH_diff : Differentiable ℂ H)
    (hH_bound : ∀ x y : ℝ, 0 ≤ y →
      ‖H ((x : ℂ) + (y : ℂ) * Complex.I)‖ ≤ C * (1 + x ^ 2)⁻¹ * Real.exp (-r * y)) :
    (∫ k : ℝ, pjEntire τ M (k : ℂ) * H (k : ℂ)) = 0 := by
  have hC : 0 ≤ C := by
    have h0 := hH_bound 0 0 le_rfl
    simp only [Complex.ofReal_zero, zero_mul, add_zero, ne_eq, OfNat.ofNat_ne_zero,
      not_false_eq_true, zero_pow, inv_one, mul_one, mul_zero, Real.exp_zero] at h0
    exact (norm_nonneg _).trans h0
  let F : ℂ → ℂ := fun z => pjEntire τ M z * H z
  have hF_diff : Differentiable ℂ F := (pjEntire_differentiable τ M).mul hH_diff
  let K : ℝ := |τ| * C
  let δ : ℝ := r - |τ|
  have hK : 0 ≤ K := mul_nonneg (abs_nonneg τ) hC
  have hδ : 0 < δ := sub_pos.mpr hτr
  have hF_bound (x y : ℝ) (hy : 0 ≤ y) :
      ‖F ((x : ℂ) + (y : ℂ) * Complex.I)‖ ≤ K * (1 + x ^ 2)⁻¹ * Real.exp (-δ * y) := by
    dsimp [F, K, δ]
    rw [norm_mul]
    have h1 := pjEntire_exp_bound x y M τ
    rw [abs_of_nonneg hy] at h1
    have h2 := hH_bound x y hy
    calc ‖pjEntire τ M ((x : ℂ) + (y : ℂ) * Complex.I)‖ * ‖H ((x : ℂ) + (y : ℂ) * Complex.I)‖
        ≤ (|τ| * Real.exp (|τ| * y)) * (C * (1 + x ^ 2)⁻¹ * Real.exp (-r * y)) :=
          mul_le_mul h1 h2 (norm_nonneg _) (by positivity)
      _ = |τ| * C * (1 + x ^ 2)⁻¹ * (Real.exp (|τ| * y) * Real.exp (-r * y)) := by ring
      _ = |τ| * C * (1 + x ^ 2)⁻¹ * Real.exp (-(r - |τ|) * y) := by
          rw [← Real.exp_add]; congr 2; ring
  have hF_int : Integrable (fun k : ℝ => F (k : ℂ)) := by
    refine (integrable_inv_one_add_sq.const_mul K).mono'
      (hF_diff.continuous.comp Complex.continuous_ofReal).aestronglyMeasurable
      (Eventually.of_forall fun k => ?_)
    have hk := hF_bound k 0 le_rfl
    simpa [Complex.ofReal_zero, zero_mul, add_zero, mul_zero, Real.exp_zero, mul_one] using hk
  let A : ℝ := ∫ x : ℝ, (1 + x ^ 2)⁻¹
  have hrect_bound (Y : ℝ) (hY : 0 ≤ Y) :
      ‖∫ k : ℝ, F (k : ℂ)‖ ≤ K * A * Real.exp (-δ * Y) := by
    have hL_bound (L : ℝ) (hL : 0 ≤ L) :
        ‖∫ x in (-L)..L, F (x : ℂ)‖ ≤
          K * A * Real.exp (-δ * Y) + 2 * Y * K * (1 + L ^ 2)⁻¹ := by
      have hcauchy := Complex.integral_boundary_rect_eq_zero_of_differentiableOn F
        (-L : ℂ) ((L : ℂ) + (Y : ℂ) * Complex.I) hF_diff.differentiableOn
      simp only [Complex.neg_re, Complex.ofReal_re, Complex.neg_im, Complex.ofReal_im, neg_zero,
        Complex.add_re, Complex.mul_re, Complex.I_re, mul_zero, Complex.I_im, mul_one, sub_zero,
        add_zero, Complex.add_im, Complex.mul_im, zero_mul, zero_add, Complex.ofReal_zero,
        Complex.ofReal_neg, smul_eq_mul] at hcauchy
      have hrearr :
          (∫ x in (-L)..L, F (x : ℂ)) =
            (∫ x in (-L)..L, F ((x : ℂ) + (Y : ℂ) * Complex.I)) -
              Complex.I * (∫ y in (0 : ℝ)..Y, F ((L : ℂ) + (y : ℂ) * Complex.I)) +
              Complex.I * (∫ y in (0 : ℝ)..Y, F ((-L : ℂ) + (y : ℂ) * Complex.I)) := by
        linear_combination hcauchy
      have htop :
          ‖∫ x in (-L)..L, F ((x : ℂ) + (Y : ℂ) * Complex.I)‖ ≤
            K * A * Real.exp (-δ * Y) := by
        have hdom_int : Integrable (fun x : ℝ => K * (1 + x ^ 2)⁻¹ * Real.exp (-δ * Y)) :=
          (integrable_inv_one_add_sq.const_mul K).mul_const _
        have hle1 :
            ‖∫ x in (-L)..L, F ((x : ℂ) + (Y : ℂ) * Complex.I)‖ ≤
              ∫ x in (-L)..L, K * (1 + x ^ 2)⁻¹ * Real.exp (-δ * Y) :=
          intervalIntegral.norm_integral_le_of_norm_le (by linarith)
            (Eventually.of_forall fun x _ => hF_bound x Y hY)
            hdom_int.intervalIntegrable
        have hle2 :
            (∫ x in (-L)..L, K * (1 + x ^ 2)⁻¹ * Real.exp (-δ * Y)) ≤
              ∫ x : ℝ, K * (1 + x ^ 2)⁻¹ * Real.exp (-δ * Y) := by
          rw [intervalIntegral.integral_of_le (by linarith : -L ≤ L)]
          exact setIntegral_le_integral hdom_int
            (Eventually.of_forall fun x => by positivity)
        have hval :
            (∫ x : ℝ, K * (1 + x ^ 2)⁻¹ * Real.exp (-δ * Y)) = K * A * Real.exp (-δ * Y) := by
          rw [integral_mul_const, integral_const_mul]
        exact hle1.trans (hle2.trans_eq hval)
      have hright :
          ‖∫ y in (0 : ℝ)..Y, F ((L : ℂ) + (y : ℂ) * Complex.I)‖ ≤
            Y * K * (1 + L ^ 2)⁻¹ := by
        have hb (y : ℝ) (hy : y ∈ Set.uIoc (0 : ℝ) Y) :
            ‖F ((L : ℂ) + (y : ℂ) * Complex.I)‖ ≤ K * (1 + L ^ 2)⁻¹ := by
          rw [Set.uIoc_of_le hY] at hy
          calc ‖F ((L : ℂ) + (y : ℂ) * Complex.I)‖
              ≤ K * (1 + L ^ 2)⁻¹ * Real.exp (-δ * y) := hF_bound L y hy.1.le
            _ ≤ K * (1 + L ^ 2)⁻¹ * 1 := by
                gcongr
                exact Real.exp_le_one_iff.mpr (by nlinarith [hy.1])
            _ = K * (1 + L ^ 2)⁻¹ := mul_one _
        have h := intervalIntegral.norm_integral_le_of_norm_le_const hb
        rw [sub_zero, abs_of_nonneg hY] at h
        linarith
      have hleft :
          ‖∫ y in (0 : ℝ)..Y, F ((-L : ℂ) + (y : ℂ) * Complex.I)‖ ≤
            Y * K * (1 + L ^ 2)⁻¹ := by
        have hb (y : ℝ) (hy : y ∈ Set.uIoc (0 : ℝ) Y) :
            ‖F ((-L : ℂ) + (y : ℂ) * Complex.I)‖ ≤ K * (1 + L ^ 2)⁻¹ := by
          rw [Set.uIoc_of_le hY] at hy
          have h := hF_bound (-L) y hy.1.le
          simp only [Complex.ofReal_neg, even_two, Even.neg_pow] at h
          calc ‖F ((-L : ℂ) + (y : ℂ) * Complex.I)‖
              ≤ K * (1 + L ^ 2)⁻¹ * Real.exp (-δ * y) := h
            _ ≤ K * (1 + L ^ 2)⁻¹ * 1 := by
                gcongr
                exact Real.exp_le_one_iff.mpr (by nlinarith [hy.1])
            _ = K * (1 + L ^ 2)⁻¹ := mul_one _
        have h := intervalIntegral.norm_integral_le_of_norm_le_const hb
        rw [sub_zero, abs_of_nonneg hY] at h
        linarith
      rw [hrearr]
      calc ‖(∫ x in (-L)..L, F ((x : ℂ) + (Y : ℂ) * Complex.I)) -
              Complex.I * (∫ y in (0 : ℝ)..Y, F ((L : ℂ) + (y : ℂ) * Complex.I)) +
              Complex.I * (∫ y in (0 : ℝ)..Y, F ((-L : ℂ) + (y : ℂ) * Complex.I))‖
          ≤ ‖(∫ x in (-L)..L, F ((x : ℂ) + (Y : ℂ) * Complex.I)) -
              Complex.I * (∫ y in (0 : ℝ)..Y, F ((L : ℂ) + (y : ℂ) * Complex.I))‖ +
            ‖Complex.I * (∫ y in (0 : ℝ)..Y, F ((-L : ℂ) + (y : ℂ) * Complex.I))‖ :=
            norm_add_le _ _
        _ ≤ ‖∫ x in (-L)..L, F ((x : ℂ) + (Y : ℂ) * Complex.I)‖ +
            ‖Complex.I * (∫ y in (0 : ℝ)..Y, F ((L : ℂ) + (y : ℂ) * Complex.I))‖ +
            ‖Complex.I * (∫ y in (0 : ℝ)..Y, F ((-L : ℂ) + (y : ℂ) * Complex.I))‖ := by
            gcongr; exact norm_sub_le _ _
        _ = ‖∫ x in (-L)..L, F ((x : ℂ) + (Y : ℂ) * Complex.I)‖ +
            ‖∫ y in (0 : ℝ)..Y, F ((L : ℂ) + (y : ℂ) * Complex.I)‖ +
            ‖∫ y in (0 : ℝ)..Y, F ((-L : ℂ) + (y : ℂ) * Complex.I)‖ := by
            simp
        _ ≤ K * A * Real.exp (-δ * Y) + Y * K * (1 + L ^ 2)⁻¹ + Y * K * (1 + L ^ 2)⁻¹ := by
            linarith
        _ = K * A * Real.exp (-δ * Y) + 2 * Y * K * (1 + L ^ 2)⁻¹ := by ring
    have ht_lhs : Tendsto (fun L : ℝ => ‖∫ x in (-L)..L, F (x : ℂ)‖)
        atTop (𝓝 ‖∫ k : ℝ, F (k : ℂ)‖) :=
      (intervalIntegral_tendsto_integral hF_int tendsto_neg_atTop_atBot tendsto_id).norm
    have ht_inv : Tendsto (fun L : ℝ => (1 + L ^ 2)⁻¹) atTop (𝓝 0) := by
      refine tendsto_inv_atTop_zero.comp ?_
      exact tendsto_atTop_add_const_left atTop 1
        (tendsto_pow_atTop (by norm_num : 2 ≠ 0))
    have ht_rhs : Tendsto (fun L : ℝ => K * A * Real.exp (-δ * Y) + 2 * Y * K * (1 + L ^ 2)⁻¹)
        atTop (𝓝 (K * A * Real.exp (-δ * Y))) := by
      simpa [mul_zero, add_zero] using
        tendsto_const_nhds.add (ht_inv.const_mul (2 * Y * K))
    exact le_of_tendsto_of_tendsto ht_lhs ht_rhs
      (eventually_ge_atTop (0 : ℝ) |>.mono fun L hL => hL_bound L hL)
  have ht_exp : Tendsto (fun Y : ℝ => K * A * Real.exp (-δ * Y)) atTop (𝓝 0) := by
    have hneg : Tendsto (fun Y : ℝ => -δ * Y) atTop atBot :=
      Tendsto.const_mul_atTop_of_neg (neg_lt_zero.mpr hδ) tendsto_id
    simpa [mul_zero] using (Real.tendsto_exp_atBot.comp hneg).const_mul (K * A)
  have hnorm_le : ‖∫ k : ℝ, F (k : ℂ)‖ ≤ 0 :=
    le_of_tendsto_of_tendsto tendsto_const_nhds ht_exp
      (eventually_ge_atTop (0 : ℝ) |>.mono fun Y hY => hrect_bound Y hY)
  exact norm_eq_zero.mp (le_antisymm hnorm_le (norm_nonneg _))

/-- Exact Lorentzian Pauli–Jordan kernel identity:
`(ħ / (2ω)) (e^{-i τ ω} - e^{i τ ω}) = -i ħ · sin(τ ω) / ω`. -/
lemma lorentzian_pauliJordan_kernel (ħ τ ω : ℝ) (hω : 0 < ω) :
    ((ħ / (2 * ω) : ℝ) : ℂ) *
      (Complex.exp (-Complex.I * (τ : ℂ) * (ω : ℂ)) -
       Complex.exp (Complex.I * (τ : ℂ) * (ω : ℂ))) =
    (-Complex.I * (ħ : ℂ)) * ((Real.sin (τ * ω) / ω : ℝ) : ℂ) := by
  have hsin : Complex.exp (-Complex.I * (τ : ℂ) * (ω : ℂ)) -
      Complex.exp (Complex.I * (τ : ℂ) * (ω : ℂ)) =
      -2 * Complex.I * Complex.sin ((τ : ℂ) * (ω : ℂ)) := by
    rw [Complex.sin]
    have h1 : (τ : ℂ) * (ω : ℂ) * Complex.I = Complex.I * (τ : ℂ) * (ω : ℂ) := by ring
    have h2 : -((τ : ℂ) * (ω : ℂ)) * Complex.I = -Complex.I * (τ : ℂ) * (ω : ℂ) := by ring
    rw [h1, h2]
    set a := Complex.exp (-Complex.I * (τ : ℂ) * (ω : ℂ))
    set b := Complex.exp (Complex.I * (τ : ℂ) * (ω : ℂ))
    rw [show -2 * Complex.I * ((a - b) * Complex.I / 2) = -(Complex.I ^ 2) * (a - b) by ring,
      Complex.I_sq]
    ring
  rw [hsin, ← Complex.ofReal_mul, ← Complex.ofReal_sin]
  have hωc : (ω : ℂ) ≠ 0 := Complex.ofReal_ne_zero.mpr hω.ne'
  push_cast
  field_simp [hωc]

/-- §3.3 Corollary (Spacelike Microcausality): for Lorentzian field modes whose commutator
kernel is given by the Pauli–Jordan normal-momentum integral at spacelike separation
`|t' - t| < r`, the quantum fields commute identically on `FockFin`: `[Φ(f), Φ(f')] ψ = 0`. -/
theorem lorentzian_mode_commutator_zero {ħ t t' M C r : ℝ} (hM : 0 < M) (hsep : |t' - t| < r)
    {H : ℂ → ℂ} (hH_diff : Differentiable ℂ H)
    (hH_bound : ∀ x y : ℝ, 0 ≤ y →
      ‖H ((x : ℂ) + (y : ℂ) * Complex.I)‖ ≤ C * (1 + x ^ 2)⁻¹ * Real.exp (-r * y))
    {u_f u_fbar u_f' u_f'bar : ℕ →₀ ℂ}
    (hcomm : modeInner u_fbar u_f' - modeInner u_f'bar u_f =
      ∫ k : ℝ,
        ((ħ / (2 * Real.sqrt (k ^ 2 + M ^ 2)) : ℝ) : ℂ) *
          (Complex.exp (-Complex.I * ((t' - t : ℝ) : ℂ) * (Real.sqrt (k ^ 2 + M ^ 2) : ℂ)) -
           Complex.exp (Complex.I * ((t' - t : ℝ) : ℂ) * (Real.sqrt (k ^ 2 + M ^ 2) : ℂ))) *
        H (k : ℂ))
    (ψ : FockFin) :
    fockField u_f u_fbar (fockField u_f' u_f'bar ψ) -
      fockField u_f' u_f'bar (fockField u_f u_fbar ψ) = 0 := by
  rw [fockField_commutator, hcomm]
  have hpt (k : ℝ) :
      ((ħ / (2 * Real.sqrt (k ^ 2 + M ^ 2)) : ℝ) : ℂ) *
        (Complex.exp (-Complex.I * ((t' - t : ℝ) : ℂ) * (Real.sqrt (k ^ 2 + M ^ 2) : ℂ)) -
         Complex.exp (Complex.I * ((t' - t : ℝ) : ℂ) * (Real.sqrt (k ^ 2 + M ^ 2) : ℂ))) *
        H (k : ℂ) =
      (-Complex.I * (ħ : ℂ)) * (pjEntire (t' - t) M (k : ℂ) * H (k : ℂ)) := by
    rw [lorentzian_pauliJordan_kernel ħ (t' - t) (Real.sqrt (k ^ 2 + M ^ 2))
        (Real.sqrt_pos.mpr (by positivity)),
      pjEntire_real (t' - t) M k hM, mul_assoc]
  simp_rw [hpt]
  rw [integral_const_mul, spacelike_commutator_zero hsep hH_diff hH_bound, mul_zero, zero_smul]

end SpacelikeCausality

/-! ### §3.3 Heat-Kernel `G_E(w)` Holomorphy on `Re w > 0` & Uniform Spacelike Boundary Convergence -/
section HeatKernel

open MeasureTheory Set Filter
open scoped Topology

/-- Schwinger heat-kernel integrand `t^(-D/2) exp(-m² t - w / (4 t))` for the Euclidean
two-point function `G_E(w)` in spacetime dimension `D` (§3.3). -/
noncomputable def heatKernelIntegrand (D : ℕ) (m : ℝ) (w : ℂ) (t : ℝ) : ℂ :=
  ((t ^ (-(D : ℝ) / 2) : ℝ) : ℂ) * Complex.exp (-((m ^ 2 * t : ℝ) : ℂ) - w / (4 * (t : ℂ)))

/-- Euclidean heat-kernel two-point function
`G_E(w) = ∫₀^∞ t^(-D/2) exp(-m² t - w / (4 t)) dt` (§3.3). -/
noncomputable def heatKernel (D : ℕ) (m : ℝ) (w : ℂ) : ℂ :=
  ∫ t in Set.Ioi (0 : ℝ), heatKernelIntegrand D m w t

private lemma rpow_neg_half_mul_exp_neg_le (k : ℕ) {δ : ℝ} (hδ : 0 < δ) {t : ℝ} (ht : 0 < t) :
    t ^ (-(k : ℝ) / 2) * Real.exp (-δ / (4 * t)) ≤
      max ((4 / δ) ^ k * (k.factorial : ℝ)) 1 := by
  by_cases ht1 : 1 ≤ t
  · have h1 : t ^ (-(k : ℝ) / 2) ≤ 1 :=
      Real.rpow_le_one_of_one_le_of_nonpos ht1 (by linarith [Nat.cast_nonneg (α := ℝ) k])
    have h2 : Real.exp (-δ / (4 * t)) ≤ 1 := Real.exp_le_one_iff.mpr (by
      have : 0 < 4 * t := by positivity
      exact div_nonpos_of_nonpos_of_nonneg (by linarith) this.le)
    calc t ^ (-(k : ℝ) / 2) * Real.exp (-δ / (4 * t))
        ≤ 1 * 1 := mul_le_mul h1 h2 (Real.exp_nonneg _) zero_le_one
      _ = 1 := one_mul 1
      _ ≤ max _ 1 := le_max_right _ _
  · have ht_lt : t < 1 := lt_of_not_ge ht1
    have hpow : t ^ (-(k : ℝ) / 2) ≤ t ^ (-(k : ℝ)) :=
      Real.rpow_le_rpow_of_exponent_ge ht ht_lt.le (by linarith [Nat.cast_nonneg (α := ℝ) k])
    have hpow_eq : t ^ (-(k : ℝ)) = (t⁻¹) ^ k := by
      rw [Real.rpow_neg ht.le, Real.rpow_natCast, inv_pow]
    let u : ℝ := δ / (4 * t)
    have hu : 0 ≤ u := by positivity
    have hexp : u ^ k / (k.factorial : ℝ) ≤ Real.exp u :=
      Real.pow_div_factorial_le_exp u hu k
    have hfac : (0 : ℝ) < (k.factorial : ℝ) := Nat.cast_pos.mpr (Nat.factorial_pos k)
    have hu_pow : u ^ k ≤ (k.factorial : ℝ) * Real.exp u := by
      rwa [div_le_iff₀ hfac, mul_comm] at hexp
    have hinv_t : t⁻¹ = (4 / δ) * u := by
      dsimp [u]; field_simp [hδ.ne', ht.ne']
    have h1 : (t⁻¹) ^ k * Real.exp (-u) ≤ (4 / δ) ^ k * (k.factorial : ℝ) := by
      rw [hinv_t, mul_pow, mul_assoc]
      calc (4 / δ) ^ k * (u ^ k * Real.exp (-u))
          ≤ (4 / δ) ^ k * ((k.factorial : ℝ) * Real.exp u * Real.exp (-u)) := by gcongr
        _ = (4 / δ) ^ k * (k.factorial : ℝ) := by
            rw [mul_assoc, ← Real.exp_add, add_neg_cancel, Real.exp_zero, mul_one]
    have hneg_u : -δ / (4 * t) = -u := by dsimp [u]; ring
    calc t ^ (-(k : ℝ) / 2) * Real.exp (-δ / (4 * t))
        ≤ (t⁻¹) ^ k * Real.exp (-u) := by
          rw [hneg_u, ← hpow_eq]
          exact mul_le_mul_of_nonneg_right hpow (Real.exp_nonneg _)
      _ ≤ (4 / δ) ^ k * (k.factorial : ℝ) := h1
      _ ≤ max _ 1 := le_max_left _ _

private lemma norm_heatKernelIntegrand_le (D : ℕ) (m : ℝ) {δ : ℝ} (hδ : 0 < δ)
    {w : ℂ} (hw : δ ≤ w.re) {t : ℝ} (ht : 0 < t) :
    ‖heatKernelIntegrand D m w t‖ ≤
      max ((4 / δ) ^ D * (D.factorial : ℝ)) 1 * Real.exp (-m ^ 2 * t) := by
  unfold heatKernelIntegrand
  rw [norm_mul, Complex.norm_real, Real.norm_of_nonneg (Real.rpow_nonneg ht.le _),
    Complex.norm_exp]
  have hre : (-((m ^ 2 * t : ℝ) : ℂ) - w / (4 * (t : ℂ))).re = -m ^ 2 * t - w.re / (4 * t) := by
    have h4t : (4 * (t : ℂ)) = ((4 * t : ℝ) : ℂ) := by push_cast; ring
    rw [h4t, Complex.sub_re, Complex.neg_re, Complex.ofReal_re, Complex.div_ofReal_re]
    ring
  rw [hre, sub_eq_add_neg, Real.exp_add]
  have hrearr : t ^ (-(D : ℝ) / 2) * (Real.exp (-m ^ 2 * t) * Real.exp (-(w.re / (4 * t)))) =
      (t ^ (-(D : ℝ) / 2) * Real.exp (-(w.re / (4 * t)))) * Real.exp (-m ^ 2 * t) := by ring
  rw [hrearr]
  have hexp_le : Real.exp (-(w.re / (4 * t))) ≤ Real.exp (-δ / (4 * t)) := by
    apply Real.exp_le_exp.mpr
    have h4t : 0 < 4 * t := by positivity
    rw [neg_div]
    exact neg_le_neg (div_le_div_of_nonneg_right hw h4t.le)
  calc t ^ (-(D : ℝ) / 2) * Real.exp (-(w.re / (4 * t))) * Real.exp (-m ^ 2 * t)
      ≤ t ^ (-(D : ℝ) / 2) * Real.exp (-δ / (4 * t)) * Real.exp (-m ^ 2 * t) := by gcongr
    _ ≤ max ((4 / δ) ^ D * (D.factorial : ℝ)) 1 * Real.exp (-m ^ 2 * t) := by
        gcongr
        exact rpow_neg_half_mul_exp_neg_le D hδ ht

private lemma heatKernelIntegrand_aestronglyMeasurable (D : ℕ) (m : ℝ) (w : ℂ) :
    AEStronglyMeasurable (heatKernelIntegrand D m w) (volume.restrict (Set.Ioi (0 : ℝ))) := by
  have hcont : ContinuousOn (heatKernelIntegrand D m w) (Set.Ioi (0 : ℝ)) := by
    intro t ht
    have ht' : (t : ℝ) ≠ 0 := ne_of_gt ht
    have htc : (4 * (t : ℂ)) ≠ 0 := mul_ne_zero (by norm_num) (Complex.ofReal_ne_zero.mpr ht')
    unfold heatKernelIntegrand
    refine ContinuousAt.continuousWithinAt ?_
    refine (Complex.continuous_ofReal.continuousAt.comp
      (Real.continuousAt_rpow_const t _ (Or.inl ht'))).mul ?_
    refine Complex.continuous_exp.continuousAt.comp ?_
    refine (Complex.continuous_ofReal.continuousAt.comp
      (continuous_const.mul continuous_id).continuousAt).neg.sub ?_
    exact continuousAt_const.div (continuousAt_const.mul Complex.continuous_ofReal.continuousAt) htc
  exact hcont.aestronglyMeasurable measurableSet_Ioi

/-- Absolute integrability of the heat-kernel integrand on `(0, ∞)` whenever `m > 0` and
`Re w > 0` (§3.3). -/
theorem heatKernel_integrableOn (D : ℕ) {m : ℝ} (hm : 0 < m) {w : ℂ} (hw : 0 < w.re) :
    IntegrableOn (heatKernelIntegrand D m w) (Set.Ioi (0 : ℝ)) := by
  have hexp : IntegrableOn (fun t : ℝ => Real.exp (-(m ^ 2) * t)) (Set.Ioi (0 : ℝ)) :=
    integrableOn_exp_mul_Ioi (by nlinarith) 0
  have hdom : IntegrableOn
      (fun t : ℝ => max ((4 / w.re) ^ D * (D.factorial : ℝ)) 1 * Real.exp (-m ^ 2 * t))
      (Set.Ioi (0 : ℝ)) := hexp.const_mul (max ((4 / w.re) ^ D * (D.factorial : ℝ)) 1)
  refine hdom.mono' (heatKernelIntegrand_aestronglyMeasurable D m w) ?_
  filter_upwards [ae_restrict_mem measurableSet_Ioi] with t ht
  exact norm_heatKernelIntegrand_le D m hw le_rfl ht

/-- Holomorphy of the Euclidean heat-kernel two-point function `G_E(w)` on the open right
half-plane `{w : ℂ | 0 < w.re}` in arbitrary spacetime dimension `D` (§3.3). -/
theorem heatKernel_differentiableOn (D : ℕ) {m : ℝ} (hm : 0 < m) :
    DifferentiableOn ℂ (heatKernel D m) {w : ℂ | 0 < w.re} := by
  intro w₀ hw₀
  let δ : ℝ := w₀.re / 2
  have hδ : 0 < δ := half_pos hw₀
  let F' : ℂ → ℝ → ℂ := fun w t => -(1 / (4 * (t : ℂ))) * heatKernelIntegrand D m w t
  let bound : ℝ → ℝ := fun t =>
    (1 / 4 : ℝ) * max ((4 / δ) ^ (D + 2) * ((D + 2).factorial : ℝ)) 1 * Real.exp (-m ^ 2 * t)
  have hbound_int : IntegrableOn bound (Set.Ioi (0 : ℝ)) := by
    have hexp : IntegrableOn (fun t : ℝ => Real.exp (-(m ^ 2) * t)) (Set.Ioi (0 : ℝ)) :=
      integrableOn_exp_mul_Ioi (by nlinarith) 0
    exact hexp.const_mul ((1 / 4 : ℝ) * max ((4 / δ) ^ (D + 2) * ((D + 2).factorial : ℝ)) 1)
  have hball_re : ∀ w ∈ Metric.ball w₀ δ, δ ≤ w.re := by
    intro w hw
    have hd : |w.re - w₀.re| < δ := by
      have h1 : |w.re - w₀.re| ≤ ‖w - w₀‖ := by
        simpa [Complex.sub_re] using Complex.abs_re_le_norm (w - w₀)
      have h2 : ‖w - w₀‖ < δ := by rwa [← dist_eq_norm]
      exact lt_of_le_of_lt h1 h2
    have h3 : -δ < w.re - w₀.re := (abs_lt.mp hd).1
    dsimp [δ] at h3 ⊢
    linarith
  have hF'_meas : AEStronglyMeasurable (F' w₀) (volume.restrict (Set.Ioi (0 : ℝ))) := by
    have hc : ContinuousOn (fun t : ℝ => -(1 / (4 * (t : ℂ)))) (Set.Ioi (0 : ℝ)) := by
      intro t ht
      have htc : (4 * (t : ℂ)) ≠ 0 :=
        mul_ne_zero (by norm_num) (Complex.ofReal_ne_zero.mpr (ne_of_gt ht))
      exact (continuousAt_const.div
        (continuousAt_const.mul Complex.continuous_ofReal.continuousAt) htc).neg.continuousWithinAt
    exact (hc.aestronglyMeasurable measurableSet_Ioi).mul
      (heatKernelIntegrand_aestronglyMeasurable D m w₀)
  have hF'_bound : ∀ᵐ t ∂(volume.restrict (Set.Ioi (0 : ℝ))), ∀ w ∈ Metric.ball w₀ δ,
      ‖F' w t‖ ≤ bound t := by
    filter_upwards [ae_restrict_mem measurableSet_Ioi] with t ht w hw
    have hre : δ ≤ w.re := hball_re w hw
    have hnorm_inv : ‖-(1 / (4 * (t : ℂ)))‖ = (1 / 4 : ℝ) * t ^ (-1 : ℝ) := by
      rw [norm_neg, norm_div, norm_one, norm_mul, Complex.norm_ofNat, Complex.norm_real,
        Real.norm_of_nonneg ht.le, Real.rpow_neg_one]
      ring
    have hF'_eq : ‖F' w t‖ = (1 / 4 : ℝ) * ‖heatKernelIntegrand (D + 2) m w t‖ := by
      unfold F'
      rw [norm_mul, hnorm_inv]
      unfold heatKernelIntegrand
      rw [norm_mul, norm_mul, Complex.norm_real, Complex.norm_real,
        Real.norm_of_nonneg (Real.rpow_nonneg ht.le _),
        Real.norm_of_nonneg (Real.rpow_nonneg ht.le _)]
      have hrpow : t ^ (-1 : ℝ) * t ^ (-(D : ℝ) / 2) = t ^ (-((D + 2 : ℕ) : ℝ) / 2) := by
        rw [← Real.rpow_add ht]
        congr 1; push_cast; ring
      set E := ‖Complex.exp (-((m ^ 2 * t : ℝ) : ℂ) - w / (4 * (t : ℂ)))‖
      calc (1 / 4 : ℝ) * t ^ (-1 : ℝ) * (t ^ (-(D : ℝ) / 2) * E)
          = (1 / 4 : ℝ) * ((t ^ (-1 : ℝ) * t ^ (-(D : ℝ) / 2)) * E) := by ring
        _ = (1 / 4 : ℝ) * (t ^ (-((D + 2 : ℕ) : ℝ) / 2) * E) := by rw [hrpow]
    rw [hF'_eq]
    have hle := norm_heatKernelIntegrand_le (D + 2) m hδ hre ht
    dsimp [bound]
    calc (1 / 4 : ℝ) * ‖heatKernelIntegrand (D + 2) m w t‖
        ≤ (1 / 4 : ℝ) * (max ((4 / δ) ^ (D + 2) * ((D + 2).factorial : ℝ)) 1 *
            Real.exp (-m ^ 2 * t)) := mul_le_mul_of_nonneg_left hle (by positivity)
      _ = (1 / 4 : ℝ) * max ((4 / δ) ^ (D + 2) * ((D + 2).factorial : ℝ)) 1 *
            Real.exp (-m ^ 2 * t) := by ring
  have hF_deriv : ∀ᵐ t ∂(volume.restrict (Set.Ioi (0 : ℝ))), ∀ w ∈ Metric.ball w₀ δ,
      HasDerivAt (fun z => heatKernelIntegrand D m z t) (F' w t) w := by
    filter_upwards [ae_restrict_mem measurableSet_Ioi] with t ht w _
    have h1 : HasDerivAt (fun z : ℂ => -((m ^ 2 * t : ℝ) : ℂ) - z / (4 * (t : ℂ)))
        (-(1 / (4 * (t : ℂ)))) w :=
      ((hasDerivAt_id w).div_const (4 * (t : ℂ))).const_sub (-((m ^ 2 * t : ℝ) : ℂ))
    have h2 : HasDerivAt (fun z : ℂ => Complex.exp (-((m ^ 2 * t : ℝ) : ℂ) - z / (4 * (t : ℂ))))
        (Complex.exp (-((m ^ 2 * t : ℝ) : ℂ) - w / (4 * (t : ℂ))) * (-(1 / (4 * (t : ℂ))))) w :=
      (Complex.hasDerivAt_exp _).comp w h1
    have h3 := h2.const_mul ((t ^ (-(D : ℝ) / 2) : ℝ) : ℂ)
    have hval : ((t ^ (-(D : ℝ) / 2) : ℝ) : ℂ) *
        (Complex.exp (-((m ^ 2 * t : ℝ) : ℂ) - w / (4 * (t : ℂ))) * (-(1 / (4 * (t : ℂ))))) =
        F' w t := by
      dsimp [F', heatKernelIntegrand]; ring
    rw [hval] at h3
    exact h3
  have hderiv := hasDerivAt_integral_of_dominated_loc_of_deriv_le
    (Metric.ball_mem_nhds w₀ hδ)
    (Eventually.of_forall fun w => heatKernelIntegrand_aestronglyMeasurable D m w)
    (heatKernel_integrableOn D hm hw₀)
    hF'_meas hF'_bound hbound_int hF_deriv
  exact hderiv.2.differentiableAt.differentiableWithinAt

/-- Uniform spacelike boundary convergence of the continued Euclidean two-point function (§3.3):
on any compact spacelike set `K ⊆ ℝ × ℝ^d` (`|t| < ‖x‖`), both boundary values
`G_E((ε + i t)² + ‖x‖²)` and `G_E((ε - i t)² + ‖x‖²)` converge uniformly to
`G_E(‖x‖² - t²)` as `ε → 0⁺`, so their difference converges uniformly to `0`. -/
theorem heatKernel_spacelike_uniform_tendsto (D d : ℕ) {m : ℝ} (hm : 0 < m)
    {K : Set (ℝ × EuclideanSpace ℝ (Fin d))} (hK : IsCompact K)
    (hsep : ∀ p ∈ K, |p.1| < ‖p.2‖) :
    let wPlus : ℝ → ℝ × EuclideanSpace ℝ (Fin d) → ℂ :=
      fun ε p => ((ε : ℂ) + (p.1 : ℂ) * Complex.I) ^ 2 + ((‖p.2‖ ^ 2 : ℝ) : ℂ)
    let wMinus : ℝ → ℝ × EuclideanSpace ℝ (Fin d) → ℂ :=
      fun ε p => ((ε : ℂ) - (p.1 : ℂ) * Complex.I) ^ 2 + ((‖p.2‖ ^ 2 : ℝ) : ℂ)
    let wLim : ℝ × EuclideanSpace ℝ (Fin d) → ℂ :=
      fun p => ((‖p.2‖ ^ 2 - p.1 ^ 2 : ℝ) : ℂ)
    ∀ δ > 0, ∃ η > 0, ∀ ε ∈ Set.Ioo (0 : ℝ) η, ∀ p ∈ K,
      ‖heatKernel D m (wPlus ε p) - heatKernel D m (wLim p)‖ < δ ∧
      ‖heatKernel D m (wMinus ε p) - heatKernel D m (wLim p)‖ < δ ∧
      ‖heatKernel D m (wPlus ε p) - heatKernel D m (wMinus ε p)‖ < 2 * δ := by
  intro wPlus wMinus wLim δ hδ
  have hwP_re : ∀ ε : ℝ, ∀ p ∈ K, 0 < (wPlus ε p).re := by
    intro ε p hp
    have hlt : p.1 ^ 2 < ‖p.2‖ ^ 2 := by
      have := hsep p hp
      nlinarith [sq_abs p.1, abs_nonneg p.1, norm_nonneg p.2]
    dsimp [wPlus]
    simp [sq, Complex.mul_re, Complex.mul_im]
    nlinarith [sq_nonneg ε]
  have hwM_re : ∀ ε : ℝ, ∀ p ∈ K, 0 < (wMinus ε p).re := by
    intro ε p hp
    have hlt : p.1 ^ 2 < ‖p.2‖ ^ 2 := by
      have := hsep p hp
      nlinarith [sq_abs p.1, abs_nonneg p.1, norm_nonneg p.2]
    dsimp [wMinus]
    simp [sq, Complex.mul_re, Complex.mul_im]
    nlinarith [sq_nonneg ε]
  have hcont_hk : ContinuousOn (heatKernel D m) {w : ℂ | 0 < w.re} :=
    (heatKernel_differentiableOn D hm).continuousOn
  let S : Set (ℝ × (ℝ × EuclideanSpace ℝ (Fin d))) := Set.Icc (0 : ℝ) 1 ×ˢ K
  have hS : IsCompact S := isCompact_Icc.prod hK
  have hcontP : ContinuousOn (fun q : ℝ × (ℝ × EuclideanSpace ℝ (Fin d)) =>
      heatKernel D m (wPlus q.1 q.2)) S := by
    refine hcont_hk.comp ?_ (fun q hq => hwP_re q.1 q.2 hq.2)
    have : Continuous (fun q : ℝ × (ℝ × EuclideanSpace ℝ (Fin d)) => wPlus q.1 q.2) := by
      unfold wPlus; fun_prop
    exact this.continuousOn
  have hcontM : ContinuousOn (fun q : ℝ × (ℝ × EuclideanSpace ℝ (Fin d)) =>
      heatKernel D m (wMinus q.1 q.2)) S := by
    refine hcont_hk.comp ?_ (fun q hq => hwM_re q.1 q.2 hq.2)
    have : Continuous (fun q : ℝ × (ℝ × EuclideanSpace ℝ (Fin d)) => wMinus q.1 q.2) := by
      unfold wMinus; fun_prop
    exact this.continuousOn
  have hucP := hS.uniformContinuousOn_of_continuous hcontP
  have hucM := hS.uniformContinuousOn_of_continuous hcontM
  rw [Metric.uniformContinuousOn_iff] at hucP hucM
  obtain ⟨η₁, hη₁, hP⟩ := hucP δ hδ
  obtain ⟨η₂, hη₂, hM⟩ := hucM δ hδ
  refine ⟨min (min η₁ η₂) 1, lt_min (lt_min hη₁ hη₂) zero_lt_one, fun ε hε p hp => ?_⟩
  have hε0 : 0 ≤ ε := hε.1.le
  have hε1 : ε ≤ 1 := (hε.2.trans_le (min_le_right _ _)).le
  have hεη₁ : ε < η₁ := hε.2.trans_le ((min_le_left _ _).trans (min_le_left _ _))
  have hεη₂ : ε < η₂ := hε.2.trans_le ((min_le_left _ _).trans (min_le_right _ _))
  have hdist : dist (ε, p) ((0 : ℝ), p) = ε := by
    simp [Prod.dist_eq, abs_of_nonneg hε0, hε0]
  have hwP0 : wPlus 0 p = wLim p := by
    dsimp [wPlus, wLim]; apply Complex.ext <;> simp [sq]; ring
  have hwM0 : wMinus 0 p = wLim p := by
    dsimp [wMinus, wLim]; apply Complex.ext <;> simp [sq]; ring
  have h1 : ‖heatKernel D m (wPlus ε p) - heatKernel D m (wLim p)‖ < δ := by
    rw [← hwP0, ← dist_eq_norm]
    exact hP (ε, p) ⟨⟨hε0, hε1⟩, hp⟩ (0, p) ⟨⟨le_rfl, zero_le_one⟩, hp⟩ (by rwa [hdist])
  have h2 : ‖heatKernel D m (wMinus ε p) - heatKernel D m (wLim p)‖ < δ := by
    rw [← hwM0, ← dist_eq_norm]
    exact hM (ε, p) ⟨⟨hε0, hε1⟩, hp⟩ (0, p) ⟨⟨le_rfl, zero_le_one⟩, hp⟩ (by rwa [hdist])
  refine ⟨h1, h2, ?_⟩
  calc ‖heatKernel D m (wPlus ε p) - heatKernel D m (wMinus ε p)‖
      = ‖(heatKernel D m (wPlus ε p) - heatKernel D m (wLim p)) -
          (heatKernel D m (wMinus ε p) - heatKernel D m (wLim p))‖ := by ring_nf
    _ ≤ ‖heatKernel D m (wPlus ε p) - heatKernel D m (wLim p)‖ +
          ‖heatKernel D m (wMinus ε p) - heatKernel D m (wLim p)‖ := norm_sub_le _ _
    _ < δ + δ := add_lt_add h1 h2
    _ = 2 * δ := by ring

end HeatKernel

end Relativity

/-! ### §3.2–§3.3 Arbitrary-Dimension Mass-Shell Boosts, Forward Cone, Mass Gap `ħm` & Unitary Group -/
section MassShellBoosts

open MeasureTheory Real Set Submodule WithLp
open scoped BigOperators ENNReal Topology RealInnerProductSpace

namespace MassShell

/-! ### Multi-particle dispersion on an arbitrary normed momentum space -/

/-- General normed-space relativistic dispersion `ω(k) = √(‖k‖² + m²)`. -/
noncomputable def rate {K : Type*} [NormedAddCommGroup K] (m : ℝ) (k : K) : ℝ :=
  Real.sqrt (‖k‖ ^ 2 + m ^ 2)

theorem rate_eq_modeDispersion {d : ℕ} (m : ℝ) (k : EuclideanSpace ℝ (Fin d)) :
    rate m k = modeDispersion m k := rfl

theorem rate_sq {K : Type*} [NormedAddCommGroup K] (m : ℝ) (k : K) :
    rate m k ^ 2 = ‖k‖ ^ 2 + m ^ 2 :=
  Real.sq_sqrt (by positivity)

theorem rate_nonneg {K : Type*} [NormedAddCommGroup K] (m : ℝ) (k : K) :
    0 ≤ rate m k :=
  Real.sqrt_nonneg _

theorem momentum_le_rate {K : Type*} [NormedAddCommGroup K] (m : ℝ) (k : K) :
    ‖k‖ ≤ rate m k := by
  have h := rate_sq m k
  nlinarith [rate_nonneg m k, norm_nonneg k, sq_nonneg m]

theorem mass_le_rate {K : Type*} [NormedAddCommGroup K] (m : ℝ) (k : K) :
    m ≤ rate m k := by
  have h := rate_sq m k
  nlinarith [rate_nonneg m k, sq_nonneg ‖k‖]

/-! ### Longitudinal rapidity coordinates and fiber boost -/

/-- Positive-energy mass shell on a longitudinal fiber of transverse mass `a`. -/
noncomputable def shell (a x : ℝ) : ℝ := Real.sqrt (x ^ 2 + a ^ 2)

theorem shell_sinh {a : ℝ} (ha : 0 < a) (r : ℝ) :
    shell a (a * Real.sinh r) = a * Real.cosh r := by
  unfold shell
  apply (sq_eq_sq₀ (Real.sqrt_nonneg _) (mul_nonneg ha.le (Real.cosh_pos r).le)).mp
  rw [Real.sq_sqrt (by positivity), mul_pow, mul_pow, Real.cosh_sq']
  ring

/-- Positive transverse mass gives a separate bijective rapidity coordinate on every fiber. -/
noncomputable def chartEquiv {Y : Type*} (a : Y → ℝ) (ha : ∀ y, 0 < a y) :
    (ℝ × Y) ≃ (ℝ × Y) where
  toFun p := (a p.2 * Real.sinh p.1, p.2)
  invFun p := (Real.arsinh (p.1 / a p.2), p.2)
  left_inv := by rintro ⟨r, y⟩; simp [mul_div_cancel_left₀ _ (ha y).ne']
  right_inv := by rintro ⟨x, y⟩; simp; rw [mul_comm, div_mul_cancel₀ _ (ha y).ne']

/-- Homeomorphism version of the rapidity chart on continuous positive transverse mass. -/
noncomputable def chartHomeomorph {Y : Type*} [TopologicalSpace Y] (a : Y → ℝ)
    (ha : ∀ y, 0 < a y) (hc : Continuous a) : (ℝ × Y) ≃ₜ (ℝ × Y) where
  toEquiv := chartEquiv a ha
  continuous_toFun :=
    ((hc.comp continuous_snd).mul (Real.continuous_sinh.comp continuous_fst)).prodMk continuous_snd
  continuous_invFun :=
    (Real.continuous_arsinh.comp (continuous_fst.div (hc.comp continuous_snd)
      (fun p ↦ (ha p.2).ne'))).prodMk continuous_snd

/-- Measurable equivalence version of the rapidity chart. -/
noncomputable def chart {Y : Type*} [MeasurableSpace Y] (a : Y → ℝ)
    (ha : ∀ y, 0 < a y) (hm : Measurable a) : (ℝ × Y) ≃ᵐ (ℝ × Y) where
  toEquiv := chartEquiv a ha
  measurable_toFun :=
    ((hm.comp measurable_snd).mul
      (Real.continuous_sinh.measurable.comp measurable_fst)).prodMk measurable_snd
  measurable_invFun :=
    (Real.continuous_arsinh.measurable.comp
      (measurable_fst.div (hm.comp measurable_snd))).prodMk measurable_snd

/-- Rapidity translation in the longitudinal coordinate. -/
def shift {Y : Type*} [MeasurableSpace Y] (t : ℝ) : (ℝ × Y) ≃ᵐ (ℝ × Y) where
  toFun p := (p.1 + t, p.2)
  invFun p := (p.1 - t, p.2)
  left_inv _ := by simp
  right_inv _ := by simp
  measurable_toFun := (measurable_fst.add measurable_const).prodMk measurable_snd
  measurable_invFun := (measurable_fst.sub measurable_const).prodMk measurable_snd

/-- Longitudinal Lorentz boost on `ℝ × Y` conjugated from rapidity shift. -/
noncomputable def fiberBoost {Y : Type*} [MeasurableSpace Y] (a : Y → ℝ)
    (ha : ∀ y, 0 < a y) (hm : Measurable a) (t : ℝ) : (ℝ × Y) ≃ᵐ (ℝ × Y) :=
  ((chart a ha hm).symm.trans (shift t)).trans (chart a ha hm)

theorem chart_apply {Y : Type*} [MeasurableSpace Y] (a : Y → ℝ) (ha : ∀ y, 0 < a y)
    (hm : Measurable a) (p : ℝ × Y) :
    chart a ha hm p = (a p.2 * Real.sinh p.1, p.2) := rfl

theorem chart_symm_apply {Y : Type*} [MeasurableSpace Y] (a : Y → ℝ) (ha : ∀ y, 0 < a y)
    (hm : Measurable a) (p : ℝ × Y) :
    (chart a ha hm).symm p = (Real.arsinh (p.1 / a p.2), p.2) := rfl

theorem fiberBoost_chart {Y : Type*} [MeasurableSpace Y] (a : Y → ℝ) (ha : ∀ y, 0 < a y)
    (hm : Measurable a) (t : ℝ) (p : ℝ × Y) :
    fiberBoost a ha hm t (chart a ha hm p) = chart a ha hm (shift t p) := by
  simp [fiberBoost]

theorem rapidity_boost {Y : Type*} [MeasurableSpace Y] (a : Y → ℝ) (ha : ∀ y, 0 < a y)
    (hm : Measurable a) (t : ℝ) (p : ℝ × Y) :
    (chart a ha hm).symm (fiberBoost a ha hm t p) = shift t ((chart a ha hm).symm p) := by
  simp [fiberBoost]

theorem fiberBoost_zero {Y : Type*} [MeasurableSpace Y] (a : Y → ℝ) (ha : ∀ y, 0 < a y)
    (hm : Measurable a) (p : ℝ × Y) :
    fiberBoost a ha hm 0 p = p := by
  apply (chart a ha hm).symm.injective
  rw [rapidity_boost]
  simp [shift]

theorem fiberBoost_add {Y : Type*} [MeasurableSpace Y] (a : Y → ℝ) (ha : ∀ y, 0 < a y)
    (hm : Measurable a) (s t : ℝ) (p : ℝ × Y) :
    fiberBoost a ha hm (s + t) p = fiberBoost a ha hm s (fiberBoost a ha hm t p) := by
  apply (chart a ha hm).symm.injective
  repeat rw [rapidity_boost]
  exact Prod.ext (by dsimp [shift]; ring) rfl

theorem fiberBoost_snd {Y : Type*} [MeasurableSpace Y] (a : Y → ℝ) (ha : ∀ y, 0 < a y)
    (hm : Measurable a) (t : ℝ) (p : ℝ × Y) :
    (fiberBoost a ha hm t p).2 = p.2 := rfl

theorem momentum_boost {Y : Type*} [MeasurableSpace Y] (a : Y → ℝ) (ha : ∀ y, 0 < a y)
    (hm : Measurable a) (t : ℝ) (p : ℝ × Y) :
    (fiberBoost a ha hm t p).1 = Real.cosh t * p.1 + Real.sinh t * shell (a p.2) p.1 := by
  obtain ⟨⟨r, y⟩, rfl⟩ := (chart a ha hm).surjective p
  rw [fiberBoost_chart]
  change a y * Real.sinh (r + t) =
    Real.cosh t * (a y * Real.sinh r) + Real.sinh t * shell (a y) (a y * Real.sinh r)
  rw [shell_sinh (ha y), Real.sinh_add]; ring

theorem energy_boost {Y : Type*} [MeasurableSpace Y] (a : Y → ℝ) (ha : ∀ y, 0 < a y)
    (hm : Measurable a) (t : ℝ) (p : ℝ × Y) :
    shell (a p.2) (fiberBoost a ha hm t p).1 =
      Real.cosh t * shell (a p.2) p.1 + Real.sinh t * p.1 := by
  obtain ⟨⟨r, y⟩, rfl⟩ := (chart a ha hm).surjective p
  rw [fiberBoost_chart]
  change shell (a y) (a y * Real.sinh (r + t)) =
    Real.cosh t * shell (a y) (a y * Real.sinh r) + Real.sinh t * (a y * Real.sinh r)
  rw [shell_sinh (ha y), shell_sinh (ha y), Real.cosh_add]; ring

/-! ### 1D rapidity substitution and s-finite transverse fiber transport -/

/-- Pushing Lebesgue rapidity forward by `η ↦ M sinh η` produces `dx / √(x² + M²)`. -/
theorem sinh_map_volume (M : ℝ) (hM : 0 < M) :
    Measure.map (fun η : ℝ => M * Real.sinh η) (volume : Measure ℝ) =
      volume.withDensity (fun x : ℝ => ENNReal.ofReal (Real.sqrt (x ^ 2 + M ^ 2))⁻¹) := by
  let p (η : ℝ) := M * Real.sinh η
  let w (x : ℝ) := ENNReal.ofReal (Real.sqrt (x ^ 2 + M ^ 2))⁻¹
  have hp : Measurable p := by dsimp [p]; fun_prop
  have hbij : Function.Bijective p := by
    refine ⟨fun _ _ h => Real.sinh_injective (mul_left_cancel₀ hM.ne' h), fun x => ?_⟩
    exact ⟨Real.arsinh (x / M), by
      dsimp only [p]; rw [Real.sinh_arsinh, mul_comm, div_mul_cancel₀ _ hM.ne']⟩
  have jac (η : ℝ) : ENNReal.ofReal |M * Real.cosh η| * w (p η) = 1 := by
    have hpos := mul_pos hM (Real.cosh_pos η)
    have energy : Real.sqrt ((p η) ^ 2 + M ^ 2) = M * Real.cosh η := shell_sinh hM η
    simp only [w, energy, abs_of_pos hpos, ← ENNReal.ofReal_mul hpos.le,
      mul_inv_cancel₀ hpos.ne', ENNReal.ofReal_one]
  ext1 s hs
  change Measure.map p volume s = volume.withDensity w s
  rw [Measure.map_apply hp hs, withDensity_apply _ hs]
  have sub := lintegral_image_eq_lintegral_abs_deriv_mul (hp hs)
    (fun x _ => ((Real.hasDerivAt_sinh x).const_mul M).hasDerivWithinAt) hbij.1.injOn w
  change (∫⁻ x in p '' (p ⁻¹' s), w x) =
    (∫⁻ η in p ⁻¹' s, ENNReal.ofReal |M * Real.cosh η| * w (p η)) at sub
  simpa only [hbij.2.image_preimage s, jac, setLIntegral_one] using sub.symm

/-- Half of Lebesgue rapidity pushes forward to `dx / (2 √(x² + M²))`. -/
theorem sinh_map_half_volume (M : ℝ) (hM : 0 < M) :
    Measure.map (fun η : ℝ => M * Real.sinh η) ((2 : ℝ≥0∞)⁻¹ • (volume : Measure ℝ)) =
      volume.withDensity (fun x : ℝ => ENNReal.ofReal (1 / (2 * Real.sqrt (x ^ 2 + M ^ 2)))) := by
  rw [Measure.map_smul _ (by fun_prop), sinh_map_volume M hM,
    ← withDensity_smul' _ _ (by norm_num)]
  congr 1
  funext x
  change (2 : ℝ≥0∞)⁻¹ * ENNReal.ofReal _ = _
  rw [show (2 : ℝ≥0∞)⁻¹ = ENNReal.ofReal ((2 : ℝ)⁻¹) by
      rw [ENNReal.ofReal_inv_of_pos (by norm_num)]; norm_num,
    ← ENNReal.ofReal_mul (by norm_num)]
  congr 1
  ring

/-- Apply a density-valued change of variables on a.e. longitudinal fiber while keeping
the transverse coordinate. -/
theorem fiber_map_withDensity {X Y Z : Type*}
    [MeasurableSpace X] [MeasurableSpace Y] [MeasurableSpace Z]
    (μ : Measure X) (ν : Measure Y) (κ : Measure Z) [SFinite μ] [SFinite ν] [SFinite κ]
    (T : X × Y → Z) (w : Z × Y → ℝ≥0∞) (hT : Measurable T) (hw : Measurable w)
    (hmap : ∀ᵐ y ∂ν, μ.map (fun x => T (x, y)) = κ.withDensity (fun z => w (z, y))) :
    (μ.prod ν).map (fun p => (T p, p.2)) = (κ.prod ν).withDensity w := by
  apply Measure.ext_of_lintegral
  intro φ hφ
  have hpair := hT.prodMk measurable_snd
  rw [lintegral_map hφ hpair, lintegral_withDensity_eq_lintegral_mul _ hw hφ,
    lintegral_prod_symm' (fun p : X × Y => φ (T p, p.2)) (hφ.comp hpair),
    lintegral_prod_symm' _ (hw.mul hφ)]
  apply lintegral_congr_ae
  filter_upwards [hmap] with y hy
  let sliceX (x : X) := (x, y)
  let sliceZ (z : Z) := (z, y)
  have hmX : Measurable sliceX := measurable_id.prodMk measurable_const
  have hmZ : Measurable sliceZ := measurable_id.prodMk measurable_const
  change (∫⁻ x, (φ ∘ sliceZ) ((T ∘ sliceX) x) ∂μ) = _
  rw [← lintegral_map (f := φ ∘ sliceZ) (g := T ∘ sliceX) (hφ.comp hmZ) (hT.comp hmX)]
  change (∫⁻ z, (φ ∘ sliceZ) z ∂(μ.map (fun x => T (x, y)))) = _
  rw [hy]
  exact lintegral_withDensity_eq_lintegral_mul κ (hw.comp hmZ) (hφ.comp hmZ)

theorem volume_rapidity {Y : Type*} [MeasurableSpace Y] (ν : Measure Y) [SFinite ν]
    (a : Y → ℝ) (hm : Measurable a) (ha : ∀ᵐ y ∂ν, 0 < a y) :
    ((volume : Measure ℝ).prod ν).map (fun z => (a z.2 * Real.sinh z.1, z.2)) =
      ((volume : Measure ℝ).prod ν).withDensity
        (fun z => ENNReal.ofReal ((Real.sqrt (z.1 ^ 2 + (a z.2) ^ 2))⁻¹)) := by
  apply fiber_map_withDensity volume ν volume (fun z => a z.2 * Real.sinh z.1)
    (fun z => ENNReal.ofReal ((Real.sqrt (z.1 ^ 2 + (a z.2) ^ 2))⁻¹)) (by fun_prop) (by fun_prop)
  exact ha.mono (fun y hy => sinh_map_volume _ hy)

theorem half_volume_rapidity {Y : Type*} [MeasurableSpace Y] (ν : Measure Y) [SFinite ν]
    (a : Y → ℝ) (hm : Measurable a) (ha : ∀ᵐ y ∂ν, 0 < a y) :
    ((2 : ℝ≥0∞)⁻¹ • ((volume : Measure ℝ).prod ν)).map (fun z => (a z.2 * Real.sinh z.1, z.2)) =
      ((volume : Measure ℝ).prod ν).withDensity
        (fun z => ENNReal.ofReal ((2 * Real.sqrt (z.1 ^ 2 + (a z.2) ^ 2))⁻¹)) := by
  rw [← Measure.prod_smul_left]
  apply fiber_map_withDensity _ ν volume (fun z => a z.2 * Real.sinh z.1)
    (fun z => ENNReal.ofReal ((2 * Real.sqrt (z.1 ^ 2 + (a z.2) ^ 2))⁻¹))
    (by fun_prop) (by fun_prop)
  exact ha.mono (fun y hy => by simpa only [one_div] using sinh_map_half_volume _ hy)

/-- The longitudinal mass-shell measure for transverse measure `ν` and scale `a(y)`. -/
noncomputable def weighted {Y : Type*} [MeasurableSpace Y] (ν : Measure Y) (a : Y → ℝ) :
    Measure (ℝ × Y) :=
  ((volume : Measure ℝ).prod ν).withDensity
    (fun z ↦ ENNReal.ofReal ((2 * Real.sqrt (z.1 ^ 2 + (a z.2) ^ 2))⁻¹))

theorem measurePreserving_chart {Y : Type*} [MeasurableSpace Y] (ν : Measure Y) [SFinite ν]
    (a : Y → ℝ) (hm : Measurable a) (ha : ∀ y, 0 < a y) :
    MeasurePreserving (chart a ha hm)
      ((2 : ℝ≥0∞)⁻¹ • ((volume : Measure ℝ).prod ν)) (weighted ν a) :=
  ⟨(chart a ha hm).measurable, half_volume_rapidity ν a hm (ae_of_all _ ha)⟩

theorem measurePreserving_fiberBoost {Y : Type*} [MeasurableSpace Y] (ν : Measure Y) [SFinite ν]
    (a : Y → ℝ) (hm : Measurable a) (ha : ∀ y, 0 < a y) (t : ℝ) :
    MeasurePreserving (fiberBoost a ha hm t) (weighted ν a) (weighted ν a) := by
  have hchart := measurePreserving_chart ν a hm ha
  have ht : MeasurePreserving (shift (Y := Y) t)
      ((2 : ℝ≥0∞)⁻¹ • ((volume : Measure ℝ).prod ν))
      ((2 : ℝ≥0∞)⁻¹ • ((volume : Measure ℝ).prod ν)) :=
    ((measurePreserving_add_right (volume : Measure ℝ) t).prod
      (MeasurePreserving.id ν)).smul_measure _
  exact hchart.comp (ht.comp (MeasurePreserving.symm _ hchart))

/-! ### Euclidean first-coordinate vs transverse-coordinate splitting -/

abbrev Space (n : ℕ) := EuclideanSpace ℝ (Fin n)

noncomputable def tail {n : ℕ} (x : Space (n + 1)) : Space n :=
  toLp 2 (fun i ↦ x i.succ)

theorem norm_sq_split {n : ℕ} (x : Space (n + 1)) : ‖x‖ ^ 2 = (x 0) ^ 2 + ‖tail x‖ ^ 2 := by
  simp only [EuclideanSpace.real_norm_sq_eq]
  rw [Fin.sum_univ_succ]
  rfl

/-- Linear isometry splitting the first momentum coordinate from the `n` transverse ones. -/
noncomputable def splitIsometry (n : ℕ) : Space (n + 1) ≃ₗᵢ[ℝ] WithLp 2 (ℝ × Space n) where
  toFun x := toLp 2 (x 0, tail x)
  invFun z := toLp 2 (Fin.cons z.fst (ofLp z.snd))
  left_inv x := by ext i; refine Fin.cases ?_ (fun j ↦ ?_) i <;> simp [tail]
  right_inv z := by
    apply (WithLp.equiv 2 _).injective
    apply Prod.ext
    · change (Fin.cons z.fst (ofLp z.snd) : Fin (n + 1) → ℝ) 0 = z.fst
      simp
    · ext i
      change (Fin.cons z.fst (ofLp z.snd) : Fin (n + 1) → ℝ) i.succ = z.snd i
      simp
  map_add' _ _ := rfl
  map_smul' _ _ := rfl
  norm_map' x := by
    apply (sq_eq_sq₀ (norm_nonneg _) (norm_nonneg _)).mp
    change ‖toLp 2 (x 0, tail x)‖ ^ 2 = _
    rw [WithLp.prod_norm_sq_eq_of_L2, norm_sq_split x]
    simp

/-- Measurable coordinate split `ℝ^{n+1} ≃ᵐ ℝ × ℝ^n`. -/
noncomputable def split (n : ℕ) : Space (n + 1) ≃ᵐ ℝ × Space n :=
  (splitIsometry n).toMeasurableEquiv.trans (MeasurableEquiv.toLp 2 (ℝ × Space n)).symm

@[simp] theorem split_apply {n : ℕ} (x : Space (n + 1)) : split n x = (x 0, tail x) := rfl

theorem split_norm_sq {n : ℕ} (k : Space (n + 1)) :
    ‖k‖ ^ 2 = ((split n k).1) ^ 2 + ‖(split n k).2‖ ^ 2 := norm_sq_split k

theorem split_volume (n : ℕ) : MeasurePreserving (split n) volume volume :=
  (splitIsometry n).measurePreserving.trans (WithLp.volume_preserving_ofLp ℝ (Space n))

theorem split_weighted (n : ℕ) (w : ℝ × Space n → ℝ≥0∞) :
    MeasurePreserving (split n) (volume.withDensity (w ∘ split n)) (volume.withDensity w) := by
  refine ⟨(split n).measurable, ?_⟩
  ext s hs
  rw [Measure.map_apply (split n).measurable hs, withDensity_apply _ ((split n).measurable hs),
    withDensity_apply _ hs]
  exact (split_volume n).setLIntegral_comp_preimage_emb (split n).measurableEmbedding w s

theorem conjugate_weighted {n : ℕ} {w : ℝ × Space n → ℝ≥0∞} {B : ℝ × Space n → ℝ × Space n}
    (hB : MeasurePreserving B (volume.withDensity w) (volume.withDensity w)) :
    MeasurePreserving ((split n).symm ∘ B ∘ split n)
      (volume.withDensity (w ∘ split n)) (volume.withDensity (w ∘ split n)) :=
  (split_weighted n w).symm.comp (hB.comp (split_weighted n w))

/-! ### Arbitrary-dimension massive shell measure and axial boost -/

private theorem measurable_modeDispersion (n : ℕ) (m : ℝ) :
    Measurable (modeDispersion (d := n) m) := by
  unfold modeDispersion
  fun_prop

theorem split_energy {n : ℕ} (m : ℝ) (k : Space (n + 1)) :
    shell (modeDispersion m (split n k).2) (split n k).1 = modeDispersion m k := by
  unfold shell
  rw [← rate_eq_modeDispersion, rate_sq]
  unfold modeDispersion
  rw [split_norm_sq k, add_assoc]

/-- First-coordinate Lorentz boost on `Space (n + 1)`, including `n = 0` (`1+1` dimensions). -/
noncomputable def boost (n : ℕ) (m : ℝ) (hm : 0 < m) (t : ℝ) : Space (n + 1) ≃ᵐ Space (n + 1) :=
  ((split n).trans (fiberBoost (modeDispersion m) (modeDispersion_pos hm)
    (measurable_modeDispersion n m) t)).trans (split n).symm

theorem boost_longitudinal {n : ℕ} {m : ℝ} (hm : 0 < m) (t : ℝ) (k : Space (n + 1)) :
    boost n m hm t k 0 = Real.cosh t * k 0 + Real.sinh t * modeDispersion m k := by
  let B := fiberBoost (modeDispersion m) (modeDispersion_pos hm) (measurable_modeDispersion n m) t
  have h : split n (boost n m hm t k) = B (split n k) := (split n).apply_symm_apply _
  have h₁ := congrArg Prod.fst h
  rw [momentum_boost, split_energy] at h₁
  exact h₁

theorem boost_transverse {n : ℕ} {m : ℝ} (hm : 0 < m) (t : ℝ) (k : Space (n + 1)) :
    tail (boost n m hm t k) = tail k :=
  congrArg Prod.snd ((split n).apply_symm_apply
    (fiberBoost (modeDispersion m) (modeDispersion_pos hm)
      (measurable_modeDispersion n m) t (split n k)))

theorem boost_energy {n : ℕ} {m : ℝ} (hm : 0 < m) (t : ℝ) (k : Space (n + 1)) :
    modeDispersion m (boost n m hm t k) =
      Real.cosh t * modeDispersion m k + Real.sinh t * k 0 := by
  let B := fiberBoost (modeDispersion m) (modeDispersion_pos hm) (measurable_modeDispersion n m) t
  have he := energy_boost (modeDispersion m) (modeDispersion_pos hm)
    (measurable_modeDispersion n m) t (split n k)
  have h : split n (boost n m hm t k) = B (split n k) := (split n).apply_symm_apply _
  rw [← split_energy m (boost n m hm t k), h, ← split_energy m k]
  exact he

theorem boost_zero (n : ℕ) (m : ℝ) (hm : 0 < m) (k : Space (n + 1)) :
    boost n m hm 0 k = k := by
  apply (split n).injective
  change split n ((split n).symm _) = split n k
  rw [MeasurableEquiv.apply_symm_apply]
  exact fiberBoost_zero _ _ _ _

theorem boost_add (n : ℕ) (m : ℝ) (hm : 0 < m) (s t : ℝ) (k : Space (n + 1)) :
    boost n m hm (s + t) k = boost n m hm s (boost n m hm t k) := by
  let B := fiberBoost (modeDispersion m) (modeDispersion_pos hm) (measurable_modeDispersion n m)
  have h (r : ℝ) (v : Space (n + 1)) : split n (boost n m hm r v) = B r (split n v) :=
    (split n).apply_symm_apply _
  apply (split n).injective
  rw [h, h, h]
  exact fiberBoost_add _ _ _ _ _ _

/-- Joint continuity of the axial boost in rapidity and Euclidean momentum. -/
theorem boost_continuous (n : ℕ) (m : ℝ) (hm : 0 < m) :
    Continuous (fun p : ℝ × Space (n + 1) ↦ boost n m hm p.1 p.2) := by
  apply continuous_induced_rng.mpr
  apply continuous_pi
  intro i
  refine Fin.cases ?_ (fun j ↦ ?_) i
  · change Continuous (fun p : ℝ × Space (n + 1) ↦ boost n m hm p.1 p.2 0)
    simp_rw [boost_longitudinal]
    unfold modeDispersion
    fun_prop
  · change Continuous (fun p : ℝ × Space (n + 1) ↦ boost n m hm p.1 p.2 j.succ)
    have h (p : ℝ × Space (n + 1)) : boost n m hm p.1 p.2 j.succ = p.2 j.succ :=
      congrArg (fun y : Space n ↦ y j) (boost_transverse hm p.1 p.2)
    simp_rw [h]
    fun_prop

/-! ### Orthogonal alignment and coordinate-free spatial boosts -/

noncomputable def axis (n : ℕ) : Space (n + 1) := EuclideanSpace.basisFun (Fin (n + 1)) ℝ 0

theorem axis_norm (n : ℕ) : ‖axis n‖ = 1 :=
  (EuclideanSpace.basisFun (Fin (n + 1)) ℝ).norm_eq_one _

/-- Householder reflection sending the first basis axis `e₀` to any unit vector `u`. -/
noncomputable def align {n : ℕ} (u : Space (n + 1)) : Space (n + 1) ≃ₗᵢ[ℝ] Space (n + 1) :=
  (ℝ ∙ (axis n - u))ᗮ.reflection

theorem align_axis {n : ℕ} (u : Space (n + 1)) (hu : ‖u‖ = 1) :
    align u (axis n) = u :=
  reflection_sub ((axis_norm n).trans hu.symm)

/-- Conjugating the axial boost by an orthogonal spatial frame `R`. -/
noncomputable def conjugate {n : ℕ} (m : ℝ) (hm : 0 < m)
    (R : Space (n + 1) ≃ₗᵢ[ℝ] Space (n + 1)) (t : ℝ) : Space (n + 1) ≃ᵐ Space (n + 1) :=
  ((R.toMeasurableEquiv.symm).trans (boost n m hm t)).trans R.toMeasurableEquiv

private theorem axial_formula {n : ℕ} {m : ℝ} (hm : 0 < m) (t : ℝ) (k : Space (n + 1)) :
    boost n m hm t k =
      k + ((Real.cosh t - 1) * k 0 + Real.sinh t * modeDispersion m k) • axis n := by
  ext i
  refine Fin.cases ?_ (fun j ↦ ?_) i
  · simp [axis, EuclideanSpace.basisFun_apply, boost_longitudinal]
    ring
  · have h := congrArg (fun z : Space n => z j) (boost_transverse hm t k)
    simpa [axis, EuclideanSpace.basisFun_apply, tail] using h

theorem conjugate_momentum {n : ℕ} {m : ℝ} (hm : 0 < m)
    (R : Space (n + 1) ≃ₗᵢ[ℝ] Space (n + 1)) (t : ℝ) (k : Space (n + 1)) :
    conjugate m hm R t k = k +
      ((Real.cosh t - 1) * inner ℝ (R (axis n)) k +
        Real.sinh t * modeDispersion m k) • R (axis n) := by
  obtain ⟨x, rfl⟩ := R.surjective k
  change R (boost n m hm t (R.symm (R x))) = _
  rw [R.symm_apply_apply, axial_formula, map_add, map_smul, R.inner_map_map]
  simp only [modeDispersion, R.norm_map, axis, EuclideanSpace.basisFun_inner]

theorem conjugate_energy {n : ℕ} {m : ℝ} (hm : 0 < m)
    (R : Space (n + 1) ≃ₗᵢ[ℝ] Space (n + 1)) (t : ℝ) (k : Space (n + 1)) :
    modeDispersion m (conjugate m hm R t k) =
      Real.cosh t * modeDispersion m k + Real.sinh t * inner ℝ (R (axis n)) k := by
  obtain ⟨x, rfl⟩ := R.surjective k
  change modeDispersion m (R (boost n m hm t (R.symm (R x)))) = _
  rw [R.symm_apply_apply]
  simp only [modeDispersion, R.norm_map]
  change modeDispersion m (boost n m hm t x) = _
  rw [boost_energy, R.inner_map_map]
  simp only [modeDispersion, axis, EuclideanSpace.basisFun_inner]

/-! ### Ambient hyperboloid embedding and continuous linear boost -/

/-- Graph embedding `k ↦ (ω_m(k), k)` of spatial momentum onto the positive mass shell. -/
noncomputable def graph {d : ℕ} (m : ℝ) (k : Space d) : ℝ × Space d :=
  (modeDispersion m k, k)

/-- Ambient directional Lorentz boost on `ℝ × ℝ^d` as a continuous linear map. -/
noncomputable def ambientBoost {d : ℕ} (u : Space d) (t : ℝ) :
    (ℝ × Space d) →L[ℝ] (ℝ × Space d) :=
  let E := ContinuousLinearMap.fst ℝ ℝ (Space d)
  let K := ContinuousLinearMap.snd ℝ ℝ (Space d)
  let X := (innerSL ℝ u).comp K
  (Real.cosh t • E + Real.sinh t • X).prod
    (K + ((Real.cosh t - 1) • X + Real.sinh t • E).smulRight u)

/-! ### Unitary pullback on `L²` and strongly continuous 1-parameter boost groups -/

/-- Pullback across a measure-preserving measurable equivalence on `L²`. -/
noncomputable def pullback {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y]
    {μ : Measure X} {ν : Measure Y}
    (e : X ≃ᵐ Y) (he : MeasurePreserving e μ ν) :
    Lp ℂ 2 ν ≃ₗᵢ[ℂ] Lp ℂ 2 μ where
  __ := Lp.compMeasurePreservingₗᵢ ℂ e he
  invFun := Lp.compMeasurePreserving e.symm (he.symm e)
  left_inv f := by
    change Lp.compMeasurePreserving e.symm _ (Lp.compMeasurePreserving e _ f) = _
    simp only [← Lp.compMeasurePreserving_comp_apply, e.self_comp_symm,
      Lp.compMeasurePreserving_id_apply]
  right_inv f := by
    change Lp.compMeasurePreserving e _ (Lp.compMeasurePreserving e.symm _ f) = _
    simp only [← Lp.compMeasurePreserving_comp_apply, e.symm_comp_self,
      Lp.compMeasurePreserving_id_apply]

theorem pullback_ae {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y]
    {μ : Measure X} {ν : Measure Y}
    (e : X ≃ᵐ Y) (he : MeasurePreserving e μ ν) (f : Lp ℂ 2 ν) :
    ⇑(pullback e he f) =ᵐ[μ] fun x => f (e x) :=
  Lp.coeFn_compMeasurePreserving f he

theorem pullback_unique {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y]
    {μ : Measure X} {ν : Measure Y}
    (e : X ≃ᵐ Y) (he : MeasurePreserving e μ ν) :
    ∃! U : Lp ℂ 2 ν ≃ₗᵢ[ℂ] Lp ℂ 2 μ, ∀ f : Lp ℂ 2 ν, ⇑(U f) =ᵐ[μ] fun x => f (e x) := by
  refine ⟨pullback e he, pullback_ae e he, fun U h => ?_⟩
  ext f : 1
  exact Lp.ext ((h f).trans (pullback_ae e he f).symm)

theorem pullback_trans {X Y Z : Type*} [MeasurableSpace X] [MeasurableSpace Y] [MeasurableSpace Z]
    {μ : Measure X} {ν : Measure Y} {ρ : Measure Z}
    (e : X ≃ᵐ Y) (d : Y ≃ᵐ Z)
    (he : MeasurePreserving e μ ν) (hd : MeasurePreserving d ν ρ) :
    pullback (e.trans d) (hd.comp he) = (pullback d hd).trans (pullback e he) := by
  ext f : 1
  exact Lp.compMeasurePreserving_comp_apply f hd he

/-- Active unitary action at rapidity `t` via pullback by `B(-t)`. -/
noncomputable def action {X : Type*} [MeasurableSpace X] {μ : Measure X}
    (B : ℝ → X ≃ᵐ X) (hB : ∀ t, MeasurePreserving (B t) μ μ) (t : ℝ) :
    Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ :=
  pullback (B (-t)) (hB (-t))

theorem action_ae {X : Type*} [MeasurableSpace X] {μ : Measure X}
    (B : ℝ → X ≃ᵐ X) (hB : ∀ t, MeasurePreserving (B t) μ μ) (t : ℝ) (f : Lp ℂ 2 μ) :
    ⇑(action B hB t f) =ᵐ[μ] fun x => f (B (-t) x) :=
  pullback_ae _ _ _

theorem action_zero {X : Type*} [MeasurableSpace X] {μ : Measure X}
    (B : ℝ → X ≃ᵐ X) (hB : ∀ t, MeasurePreserving (B t) μ μ) (hzero : ∀ x, B 0 x = x) :
    action B hB 0 = LinearIsometryEquiv.refl ℂ _ := by
  ext f : 1
  apply Lp.ext
  change ⇑(action B hB 0 f) =ᵐ[μ] ⇑f
  simpa only [neg_zero, hzero] using action_ae B hB 0 f

theorem action_add {X : Type*} [MeasurableSpace X] {μ : Measure X}
    (B : ℝ → X ≃ᵐ X) (hB : ∀ t, MeasurePreserving (B t) μ μ)
    (hadd : ∀ s t x, B (s + t) x = B s (B t x)) (s t : ℝ) :
    action B hB (s + t) = (action B hB t).trans (action B hB s) := by
  have he : B (-(s + t)) = (B (-s)).trans (B (-t)) := by
    ext x
    change B (-(s + t)) x = B (-t) (B (-s) x)
    rw [show -(s + t) = -t + -s by ring, hadd]
  have hc {e d : X ≃ᵐ X} (he : MeasurePreserving e μ μ) (hd : MeasurePreserving d μ μ)
      (h : e = d) : pullback e he = pullback d hd := by subst d; rfl
  exact (hc _ _ he).trans (pullback_trans _ _ (hB (-s)) (hB (-t)))

theorem continuous_action {X : Type*} [MeasurableSpace X] {μ : Measure X}
    [TopologicalSpace X] [BorelSpace X] [R1Space X]
    [μ.InnerRegularCompactLTTop] [IsLocallyFiniteMeasure μ]
    (B : ℝ → X ≃ᵐ X) (hB : ∀ t, MeasurePreserving (B t) μ μ)
    (hcont : Continuous (fun r : ℝ × X => B r.1 r.2)) (f : Lp ℂ 2 μ) :
    Continuous (fun t => action B hB t f) := by
  let g : C(ℝ × X, X) :=
    ⟨fun r => B (-r.1) r.2, hcont.comp (continuous_fst.neg.prodMk continuous_snd)⟩
  exact continuous_const.compMeasurePreservingLp g.curry.continuous (fun t => hB (-t))
    (by norm_num)

/-- Unitary representation homomorphism `Multiplicative ℝ →* (L²(μ) ≃ₗᵢ[ℂ] L²(μ))`. -/
noncomputable def representation {X : Type*} [MeasurableSpace X] {μ : Measure X}
    (B : ℝ → X ≃ᵐ X) (hB : ∀ t, MeasurePreserving (B t) μ μ)
    (hzero : ∀ x, B 0 x = x) (hadd : ∀ s t x, B (s + t) x = B s (B t x)) :
    Multiplicative ℝ →* (Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ) where
  toFun t := action B hB t.toAdd
  map_one' := action_zero B hB hzero
  map_mul' s t := action_add B hB hadd s.toAdd t.toAdd

end MassShell

/-! ### Public `MassShellBoosts` theorems in `DotProduct` -/

/-- Multi-particle forward light-cone bound: total spatial momentum norm is bounded by
total relativistic dispersion. -/
theorem sector_forward {K I : Type*} [NormedAddCommGroup K]
    (S : Finset I) (m : ℝ) (k : I → K) :
    ‖∑ i ∈ S, k i‖ ≤ ∑ i ∈ S, MassShell.rate m (k i) :=
  (norm_sum_le S k).trans (Finset.sum_le_sum (fun i _ => MassShell.momentum_le_rate m (k i)))

/-- Multi-particle mass gap: an `n`-particle configuration has dispersion at least `n * m`. -/
theorem sector_gap {K I : Type*} [NormedAddCommGroup K]
    (S : Finset I) (m : ℝ) (k : I → K) :
    (S.card : ℝ) * m ≤ ∑ i ∈ S, MassShell.rate m (k i) := by
  rw [← nsmul_eq_mul, ← Finset.sum_const]
  exact Finset.sum_le_sum (fun i _ => MassShell.mass_le_rate m (k i))

/-- Unique zero-energy vacuum: for `m > 0`, the total dispersion vanishes iff the sector is empty. -/
theorem sector_zero_iff {K I : Type*} [NormedAddCommGroup K]
    (S : Finset I) (m : ℝ) (hm : 0 < m) (k : I → K) :
    (∑ i ∈ S, MassShell.rate m (k i)) = 0 ↔ S = ∅ := by
  constructor
  · intro h
    by_contra hn
    have hp : (0 : ℝ) < S.card := by
      exact_mod_cast Finset.card_pos.mpr (Finset.nonempty_iff_ne_empty.mpr hn)
    have hgap := (mul_pos hp hm).trans_le (sector_gap S m k)
    linarith
  · intro h
    simp [h]

/-- Scaled multi-particle energy gap: for `ħ > 0`, an `n`-particle state has energy at least
`n * (ħ * m)`. -/
theorem sector_energy_gap {K I : Type*} [NormedAddCommGroup K]
    (S : Finset I) (ħ m : ℝ) (hħ : 0 ≤ ħ) (k : I → K) :
    (S.card : ℝ) * (ħ * m) ≤ ∑ i ∈ S, ħ * MassShell.rate m (k i) := by
  rw [← Finset.mul_sum, show (S.card : ℝ) * (ħ * m) = ħ * ((S.card : ℝ) * m) by ring]
  exact mul_le_mul_of_nonneg_left (sector_gap S m k) hħ

/-- Scaled multi-particle spectral dichotomy: for `ħ > 0` and `m > 0`, every finite-particle
energy lies in `{0} ∪ [ħm, ∞)`, with `0` achieved exclusively by the empty vacuum sector. -/
theorem sector_energy_spectrum {K I : Type*} [NormedAddCommGroup K]
    (S : Finset I) (ħ m : ℝ) (hħ : 0 < ħ) (hm : 0 < m) (k : I → K) :
    (∑ i ∈ S, ħ * MassShell.rate m (k i)) ∈ ({0} : Set ℝ) ∪ Set.Ici (ħ * m) ∧
      ((∑ i ∈ S, ħ * MassShell.rate m (k i)) = 0 ↔ S = ∅) := by
  have hzero : (∑ i ∈ S, ħ * MassShell.rate m (k i)) = 0 ↔ S = ∅ := by
    rw [← Finset.mul_sum, mul_eq_zero, or_iff_right hħ.ne', sector_zero_iff S m hm k]
  refine ⟨?_, hzero⟩
  by_cases hS : S = ∅
  · left; simp [hS]
  · right
    have hcard : (1 : ℝ) ≤ S.card := by
      exact_mod_cast Nat.succ_le_of_lt (Finset.card_pos.mpr (Finset.nonempty_iff_ne_empty.mpr hS))
    have hgap := sector_energy_gap S ħ m hħ.le k
    have h1 : ħ * m ≤ (S.card : ℝ) * (ħ * m) := by
      nlinarith [mul_pos hħ hm]
    exact h1.trans hgap

/-- Relativistic `d`-dimensional positive mass-shell measure `d^d k / (2 ω_m(k))` on `ℝ^d`. -/
noncomputable def massShellMeasure (d : ℕ) (m : ℝ) : Measure (EuclideanSpace ℝ (Fin d)) :=
  volume.withDensity fun k ↦ ENNReal.ofReal ((2 * modeDispersion m k)⁻¹)

theorem massShell_measurePreserving_split (n : ℕ) (m : ℝ) :
    MeasurePreserving (MassShell.split n) (massShellMeasure (n + 1) m)
      (MassShell.weighted (volume : Measure (MassShell.Space n)) (modeDispersion m)) := by
  let w (p : ℝ × MassShell.Space n) :=
    ENNReal.ofReal ((2 * MassShell.shell (modeDispersion m p.2) p.1)⁻¹)
  have hw : w ∘ MassShell.split n = fun k ↦ ENNReal.ofReal ((2 * modeDispersion m k)⁻¹) := by
    funext k
    dsimp only [Function.comp_apply, w]
    rw [MassShell.split_energy]
  change MeasurePreserving (MassShell.split n)
    (volume.withDensity (fun k ↦ ENNReal.ofReal ((2 * modeDispersion m k)⁻¹)))
    (((volume : Measure ℝ).prod (volume : Measure (MassShell.Space n))).withDensity w)
  rw [← hw]
  exact MassShell.split_weighted n w

/-- Axial rapidity boosts preserve the `d = n + 1` dimensional mass-shell measure `d^d k / (2 ω_k)`. -/
theorem massShell_measurePreserving_boost (n : ℕ) (m : ℝ) (hm : 0 < m) (t : ℝ) :
    MeasurePreserving (MassShell.boost n m hm t)
      (massShellMeasure (n + 1) m) (massShellMeasure (n + 1) m) := by
  have h := massShell_measurePreserving_split n m
  exact (MeasurePreserving.symm _ h).comp
    ((MassShell.measurePreserving_fiberBoost volume (modeDispersion m)
      (by unfold modeDispersion; fun_prop) (modeDispersion_pos hm) t).comp h)

/-- Local finiteness of the massive shell measure `d^d k / (2 ω_m(k))` for `m > 0`. -/
theorem massShellMeasure_locallyFinite (d : ℕ) (m : ℝ) (hm : 0 < m) :
    IsLocallyFiniteMeasure (massShellMeasure d m) := by
  apply IsLocallyFiniteMeasure.withDensity_ofReal
  apply Continuous.inv₀
  · unfold modeDispersion; fun_prop
  · intro k
    have hk : 0 < modeDispersion m k := modeDispersion_pos hm k
    positivity

/-- The relativistic dispersion `ω_m(k)` is invariant under every orthogonal isometry `R ∈ O(d)`. -/
theorem modeDispersion_isometry {d : ℕ} (m : ℝ)
    (R : EuclideanSpace ℝ (Fin d) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin d))
    (k : EuclideanSpace ℝ (Fin d)) :
    modeDispersion m (R k) = modeDispersion m k := by
  simp [modeDispersion]

/-- The massive shell measure `d^d k / (2 ω_m(k))` is invariant under the entire orthogonal
group `O(d)`. -/
theorem massShell_measurePreserving_isometry {d : ℕ} (m : ℝ)
    (R : EuclideanSpace ℝ (Fin d) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin d)) :
    MeasurePreserving R (massShellMeasure d m) (massShellMeasure d m) := by
  let w := fun k : EuclideanSpace ℝ (Fin d) ↦ ENNReal.ofReal ((2 * modeDispersion m k)⁻¹)
  have hw : w ∘ R = w := funext fun k ↦ by simp [w, modeDispersion]
  refine ⟨R.continuous.measurable, ?_⟩
  ext S hS
  rw [Measure.map_apply R.continuous.measurable hS]
  change (volume.withDensity w) (R ⁻¹' S) = (volume.withDensity w) S
  rw [withDensity_apply _ (R.continuous.measurable hS), withDensity_apply _ hS]
  calc
    _ = ∫⁻ x in R ⁻¹' S, (w ∘ R) x := by rw [hw]
    _ = _ := R.measurePreserving.setLIntegral_comp_preimage_emb
      R.toMeasurableEquiv.measurableEmbedding w S

/-- Any orthogonally conjugated spatial boost preserves `massShellMeasure (n + 1) m`. -/
theorem massShell_measurePreserving_conjugate {n : ℕ} (m : ℝ) (hm : 0 < m)
    (R : EuclideanSpace ℝ (Fin (n + 1)) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin (n + 1))) (t : ℝ) :
    MeasurePreserving (MassShell.conjugate m hm R t)
      (massShellMeasure (n + 1) m) (massShellMeasure (n + 1) m) :=
  (massShell_measurePreserving_isometry m R).comp
    ((massShell_measurePreserving_boost n m hm t).comp
      (massShell_measurePreserving_isometry m R.symm))

/-- Coordinate-free directional boost invariance along any spatial unit vector `u` in
dimension `d = n + 1` (`D = d + 1 ≥ 2`), with exact momentum and energy formulas. -/
theorem massShell_directional_boost {n : ℕ} (m : ℝ) (hm : 0 < m)
    (u : EuclideanSpace ℝ (Fin (n + 1))) (hu : ‖u‖ = 1) (t : ℝ) :
    ∃ B : EuclideanSpace ℝ (Fin (n + 1)) ≃ᵐ EuclideanSpace ℝ (Fin (n + 1)),
      MeasurePreserving B (massShellMeasure (n + 1) m) (massShellMeasure (n + 1) m) ∧
      ∀ k, B k = k + ((Real.cosh t - 1) * inner ℝ u k + Real.sinh t * modeDispersion m k) • u ∧
        modeDispersion m (B k) =
          Real.cosh t * modeDispersion m k + Real.sinh t * inner ℝ u k := by
  refine ⟨MassShell.conjugate m hm (MassShell.align u) t,
    massShell_measurePreserving_conjugate m hm _ t, fun k ↦ ?_⟩
  exact ⟨by simpa only [MassShell.align_axis u hu] using
      MassShell.conjugate_momentum hm (MassShell.align u) t k,
    by simpa only [MassShell.align_axis u hu] using
      MassShell.conjugate_energy hm (MassShell.align u) t k⟩

/-- Pushforward of the mass-shell measure to ambient energy-momentum space `ℝ × ℝ^d`
via the graph `k ↦ (ω_m(k), k)`. -/
noncomputable def massShellGraphMeasure (d : ℕ) (m : ℝ) :
    Measure (ℝ × EuclideanSpace ℝ (Fin d)) :=
  (massShellMeasure d m).map (MassShell.graph m)

private theorem continuous_massShellGraph {d : ℕ} (m : ℝ) :
    Continuous (MassShell.graph (d := d) m) := by
  unfold MassShell.graph modeDispersion
  fun_prop

/-- The topological support of the ambient mass-shell graph measure is precisely the
upper hyperboloid `{ (E, k) | E > 0 ∧ E² - ‖k‖² = m² }`. -/
theorem massShellGraph_support (d : ℕ) {m : ℝ} (hm : 0 < m) :
    (massShellGraphMeasure d m).support = {p | 0 < p.1 ∧ p.1 ^ 2 - ‖p.2‖ ^ 2 = m ^ 2} := by
  have hp (k : EuclideanSpace ℝ (Fin d)) : 0 < modeDispersion m k := modeDispersion_pos hm k
  let μ := massShellMeasure d m
  have hac : (volume : Measure (EuclideanSpace ℝ (Fin d))) ≪ μ :=
    withDensity_absolutelyContinuous' (by unfold modeDispersion; fun_prop)
      (Filter.Eventually.of_forall fun k =>
        (ENNReal.ofReal_pos.mpr (inv_pos.mpr (mul_pos two_pos (hp k)))).ne')
  have : μ.IsOpenPosMeasure := hac.isOpenPosMeasure
  have hr : Continuous (modeDispersion (d := d) m) := by unfold modeDispersion; fun_prop
  let G := {p : ℝ × EuclideanSpace ℝ (Fin d) | p.1 = modeDispersion m p.2}
  have hc : IsClosed G := isClosed_eq continuous_fst (hr.comp continuous_snd)
  have hset : G = {p | 0 < p.1 ∧ p.1 ^ 2 - ‖p.2‖ ^ 2 = m ^ 2} := by
    ext p
    change p.1 = modeDispersion m p.2 ↔ _
    have hsq : modeDispersion m p.2 ^ 2 = ‖p.2‖ ^ 2 + m ^ 2 :=
      MassShell.rate_sq m p.2
    constructor
    · intro h
      exact ⟨h ▸ hp p.2, by rw [h, hsq]; ring⟩
    · rintro ⟨he, hq⟩
      nlinarith [hp p.2, hsq]
  rw [← hset]
  change (μ.map (MassShell.graph m)).support = G
  apply Subset.antisymm
  · apply Measure.support_subset_of_isClosed hc
    apply (ae_map_iff (continuous_massShellGraph m).measurable.aemeasurable hc.measurableSet).mpr
    exact Filter.Eventually.of_forall fun _ => rfl
  · intro p h
    obtain ⟨k, rfl⟩ : p ∈ range (MassShell.graph m) := ⟨p.2, Prod.ext h.symm rfl⟩
    rw [(nhds_basis_opens _).mem_measureSupport]
    rintro s ⟨hs, ho⟩
    rw [Measure.map_apply (continuous_massShellGraph m).measurable ho.measurableSet]
    exact (ho.preimage (continuous_massShellGraph m)).measure_pos μ ⟨k, hs⟩

private theorem massShellGraph_transport {d : ℕ} (m : ℝ)
    (B : EuclideanSpace ℝ (Fin d) → EuclideanSpace ℝ (Fin d))
    (A : ℝ × EuclideanSpace ℝ (Fin d) → ℝ × EuclideanSpace ℝ (Fin d)) (ha : Measurable A)
    (hb : MeasurePreserving B (massShellMeasure d m) (massShellMeasure d m))
    (h : ∀ k, A (MassShell.graph m k) = MassShell.graph m (B k)) :
    MeasurePreserving A (massShellGraphMeasure d m) (massShellGraphMeasure d m) := by
  have hg := (continuous_massShellGraph (d := d) m).measurable
  refine ⟨ha, ?_⟩
  unfold massShellGraphMeasure
  rw [Measure.map_map ha hg, show A ∘ MassShell.graph m = MassShell.graph m ∘ B from funext h,
    ← Measure.map_map hg hb.measurable, hb.map_eq]

/-- Every spatial unit direction `u` and rapidity `t` gives a continuous linear boost on
ambient energy-momentum space `ℝ × ℝ^{n+1}` preserving `massShellGraphMeasure (n + 1) m`. -/
theorem massShellGraph_measurePreserving_boost {n : ℕ} {m : ℝ} (hm : 0 < m)
    (u : EuclideanSpace ℝ (Fin (n + 1))) (hu : ‖u‖ = 1) (t : ℝ) :
    MeasurePreserving (MassShell.ambientBoost u t)
      (massShellGraphMeasure (n + 1) m) (massShellGraphMeasure (n + 1) m) := by
  obtain ⟨B, hB, h⟩ := massShell_directional_boost m hm u hu t
  apply massShellGraph_transport m B _ (MassShell.ambientBoost u t).continuous.measurable hB
  intro k
  exact Prod.ext (h k).2.symm (h k).1.symm

namespace MassShell

/-- Axial boost unitary representation on `L²(massShellMeasure (n + 1) m)`. -/
noncomputable def massShellRepresentation (n : ℕ) (m : ℝ) (hm : 0 < m) :
    Multiplicative ℝ →*
      (Lp ℂ 2 (massShellMeasure (n + 1) m) ≃ₗᵢ[ℂ] Lp ℂ 2 (massShellMeasure (n + 1) m)) :=
  representation (boost n m hm) (massShell_measurePreserving_boost n m hm)
    (boost_zero n m hm) (boost_add n m hm)

/-- Boost unitary representation in the spatial frame selected by `R ∈ O(n + 1)`. -/
noncomputable def inFrame {n : ℕ} (m : ℝ) (hm : 0 < m)
    (R : Space (n + 1) ≃ₗᵢ[ℝ] Space (n + 1)) :
    Multiplicative ℝ →*
      (Lp ℂ 2 (massShellMeasure (n + 1) m) ≃ₗᵢ[ℂ] Lp ℂ 2 (massShellMeasure (n + 1) m)) :=
  representation (conjugate m hm R) (massShell_measurePreserving_conjugate m hm R)
    (fun k => by
      change R (boost n m hm 0 (R.symm k)) = k
      rw [boost_zero, R.apply_symm_apply])
    (fun s t k => by
      change R (boost n m hm (s + t) (R.symm k)) =
        R (boost n m hm s (R.symm (R (boost n m hm t (R.symm k)))))
      rw [R.symm_apply_apply, boost_add])

theorem inFrame_continuous {n : ℕ} (m : ℝ) (hm : 0 < m)
    (R : Space (n + 1) ≃ₗᵢ[ℝ] Space (n + 1)) (f : Lp ℂ 2 (massShellMeasure (n + 1) m)) :
    Continuous (fun t : ℝ => inFrame m hm R (Multiplicative.ofAdd t) f) := by
  let _ := massShellMeasure_locallyFinite (n + 1) m hm
  have h : Continuous (fun z : ℝ × Space (n + 1) => conjugate m hm R z.1 z.2) := by
    change Continuous (fun z : ℝ × Space (n + 1) => R (boost n m hm z.1 (R.symm z.2)))
    have hp : Continuous (fun z : ℝ × Space (n + 1) => (z.1, R.symm z.2)) :=
      continuous_fst.prodMk (R.symm.continuous.comp continuous_snd)
    let b (z : ℝ × Space (n + 1)) := boost n m hm z.1 z.2
    let q (z : ℝ × Space (n + 1)) := (z.1, R.symm z.2)
    change Continuous (R ∘ b ∘ q)
    have hb : Continuous b := boost_continuous n m hm
    exact R.continuous.comp (hb.comp (show Continuous q from hp))
  exact continuous_action (conjugate m hm R) (massShell_measurePreserving_conjugate m hm R) h f

end MassShell

/-- Almost-everywhere pullback action of the axial mass-shell boost representation. -/
theorem massShell_ae (n : ℕ) (m : ℝ) (hm : 0 < m) (t : ℝ)
    (f : Lp ℂ 2 (massShellMeasure (n + 1) m)) :
    ⇑(MassShell.massShellRepresentation n m hm (Multiplicative.ofAdd t) f) =ᵐ[
      massShellMeasure (n + 1) m]
      fun k => f (MassShell.boost n m hm (-t) k) :=
  MassShell.action_ae (MassShell.boost n m hm) (massShell_measurePreserving_boost n m hm) t f

/-- Strong continuity of the axial boost unitary 1-parameter group on `L²(d^d k / 2ω_k)`. -/
theorem massShell_strongly_continuous (n : ℕ) (m : ℝ) (hm : 0 < m)
    (f : Lp ℂ 2 (massShellMeasure (n + 1) m)) :
    Continuous (fun t : ℝ =>
      MassShell.massShellRepresentation n m hm (Multiplicative.ofAdd t) f) := by
  let _ := massShellMeasure_locallyFinite (n + 1) m hm
  exact MassShell.continuous_action (MassShell.boost n m hm)
    (massShell_measurePreserving_boost n m hm) (MassShell.boost_continuous n m hm) f

/-- For every spatial unit vector `u` in `ℝ^{n+1}`, there is a unique strongly continuous
unitary 1-parameter boost group on `L²(d^{n+1} k / (2 ω_m(k)))` realizing the coordinate-free
directional boost pullback. -/
theorem fixed_direction_unique {n : ℕ} (m : ℝ) (hm : 0 < m)
    (u : EuclideanSpace ℝ (Fin (n + 1))) (hu : ‖u‖ = 1) :
    ∃! W : Multiplicative ℝ →*
        (Lp ℂ 2 (massShellMeasure (n + 1) m) ≃ₗᵢ[ℂ] Lp ℂ 2 (massShellMeasure (n + 1) m)),
      (∀ t : ℝ, ∀ f : Lp ℂ 2 (massShellMeasure (n + 1) m),
        ⇑(W (Multiplicative.ofAdd t) f) =ᵐ[massShellMeasure (n + 1) m] fun k =>
          f (k + ((Real.cosh t - 1) * inner ℝ u k - Real.sinh t * modeDispersion m k) • u)) ∧
      ∀ f, Continuous (fun t : ℝ => W (Multiplicative.ofAdd t) f) := by
  let R := MassShell.align u
  have h (t : ℝ) (f : Lp ℂ 2 (massShellMeasure (n + 1) m)) :=
    MassShell.action_ae (MassShell.conjugate m hm R)
      (massShell_measurePreserving_conjugate m hm R) t f
  simp only [MassShell.conjugate_momentum, R, MassShell.align_axis u hu,
    Real.cosh_neg, Real.sinh_neg, neg_mul, ← sub_eq_add_neg] at h
  refine ⟨MassShell.inFrame m hm R, ⟨h, MassShell.inFrame_continuous m hm R⟩, ?_⟩
  intro W hW
  apply MonoidHom.ext
  intro t
  apply LinearIsometryEquiv.ext
  intro f
  exact Lp.ext ((hW.1 t.toAdd f).trans (h t.toAdd f).symm)

end MassShellBoosts

/-! ### §3.3 Unified Continuum Wightman Field on `momentumFock` (`D = d + 1 ≥ 2`) -/
section ContinuumWightmanField

open MeasureTheory Filter Set
open scoped BigOperators ENNReal Topology InnerProductSpace

namespace WightmanField

/-! #### Sectorwise Creation/Annihilation & Lagrange Derivative Helpers -/

section SectorOps

variable {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]

/-- Real Lagrange linear-coefficient weights `c_{n, k} = (L_{n+1, k}).coeff 1` on nodes
`0, 1, …, n + 1`. -/
noncomputable def lagrangeCoeff1 (n k : ℕ) : ℝ :=
  (Lagrange.basis (Finset.range (n + 2)) (fun j : ℕ ↦ (j : ℝ)) k).coeff 1

theorem lagrange_coeff1_eval (n : ℕ) (p : Polynomial ℂ) (hp : p.natDegree ≤ n + 1) :
    p.coeff 1 = ∑ k ∈ Finset.range (n + 2), (lagrangeCoeff1 n k : ℂ) * p.eval (k : ℂ) := by
  classical
  have hd : p.degree < ((Finset.range (n + 2)).card : WithBot ℕ) := by
    apply lt_of_le_of_lt Polynomial.degree_le_natDegree
    rw [Finset.card_range]
    exact_mod_cast Nat.lt_succ_of_le hp
  have hinj : Set.InjOn (fun k : ℕ ↦ (k : ℂ)) (Finset.range (n + 2)) := by
    intro i _ j _ hij
    change (i : ℂ) = (j : ℂ) at hij
    exact_mod_cast hij
  have h := congrArg (fun q : Polynomial ℂ ↦ q.coeff 1) (Lagrange.eq_interpolate hinj hd)
  rw [Lagrange.interpolate_apply, Polynomial.finsetSum_coeff] at h
  rw [h]
  refine Finset.sum_congr rfl fun k _ ↦ ?_
  rw [Polynomial.coeff_C_mul]
  have hmap : Polynomial.map (algebraMap ℝ ℂ)
      (Lagrange.basis (Finset.range (n + 2)) (fun j : ℕ ↦ (j : ℝ)) k) =
      Lagrange.basis (Finset.range (n + 2)) (fun j : ℕ ↦ (j : ℂ)) k := by
    unfold Lagrange.basis Lagrange.basisDivisor
    rw [Polynomial.map_prod]
    refine Finset.prod_congr rfl fun j _ ↦ ?_
    simp [Polynomial.map_sub, Polynomial.map_C, Polynomial.map_X]
  have hcoeff : (Lagrange.basis (Finset.range (n + 2)) (fun j : ℕ ↦ (j : ℂ)) k).coeff 1 =
      (lagrangeCoeff1 n k : ℂ) := by
    rw [← hmap, Polynomial.coeff_map]
    rfl
  rw [hcoeff, mul_comm]

theorem lagrange_coeff1_pow (n : ℕ) (a b : ℂ) :
    ∑ k ∈ Finset.range (n + 2), (lagrangeCoeff1 n k : ℂ) * (a + (k : ℂ) * b) ^ (n + 1) =
      ((n + 1 : ℕ) : ℂ) * b * a ^ n := by
  let p : Polynomial ℂ := (Polynomial.C a + Polynomial.X * Polynomial.C b) ^ (n + 1)
  have h1 : (Polynomial.C a + Polynomial.X * Polynomial.C b).natDegree ≤ 1 := by
    rw [Polynomial.natDegree_C_add]
    exact (Polynomial.natDegree_mul_C_le _ _).trans_eq Polynomial.natDegree_X
  have hp : p.natDegree ≤ n + 1 := by
    simpa [p] using Polynomial.natDegree_pow_le_of_le (n + 1) h1
  have hlag := lagrange_coeff1_eval n p hp
  have heval (k : ℕ) : p.eval (k : ℂ) = (a + (k : ℂ) * b) ^ (n + 1) := by
    simp only [p, Polynomial.eval_pow, Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_C,
      Polynomial.eval_X]
  simp_rw [heval] at hlag
  rw [← hlag]
  have hderiv : p.coeff 1 = (Polynomial.derivative p).eval 0 := by
    rw [← Polynomial.coeff_zero_eq_eval_zero, Polynomial.coeff_derivative]
    simp
  rw [hderiv]
  simp [p, Polynomial.derivative_pow, Polynomial.derivative_add, Polynomial.derivative_mul]
  ring

theorem lagrange_coeff1_mul_pow (n : ℕ) (a₁ b₁ a₂ b₂ : ℂ) :
    ∑ k ∈ Finset.range (n + 2),
        (lagrangeCoeff1 n k : ℂ) * ((a₁ + (k : ℂ) * b₁) * (a₂ + (k : ℂ) * b₂) ^ n) =
      b₁ * a₂ ^ n + (n : ℂ) * a₁ * b₂ * a₂ ^ (n - 1) := by
  let q₁ : Polynomial ℂ := Polynomial.C a₁ + Polynomial.X * Polynomial.C b₁
  let q₂ : Polynomial ℂ := (Polynomial.C a₂ + Polynomial.X * Polynomial.C b₂) ^ n
  let p : Polynomial ℂ := q₁ * q₂
  have hq1 : q₁.natDegree ≤ 1 := by
    rw [Polynomial.natDegree_C_add]
    exact (Polynomial.natDegree_mul_C_le _ _).trans_eq Polynomial.natDegree_X
  have hq2_base : (Polynomial.C a₂ + Polynomial.X * Polynomial.C b₂).natDegree ≤ 1 := by
    rw [Polynomial.natDegree_C_add]
    exact (Polynomial.natDegree_mul_C_le _ _).trans_eq Polynomial.natDegree_X
  have hq2 : q₂.natDegree ≤ n := by
    simpa [q₂] using Polynomial.natDegree_pow_le_of_le n hq2_base
  have hp : p.natDegree ≤ n + 1 := by
    calc p.natDegree ≤ q₁.natDegree + q₂.natDegree := Polynomial.natDegree_mul_le
      _ ≤ 1 + n := Nat.add_le_add hq1 hq2
      _ = n + 1 := Nat.add_comm 1 n
  have hlag := lagrange_coeff1_eval n p hp
  have heval (k : ℕ) : p.eval (k : ℂ) = (a₁ + (k : ℂ) * b₁) * (a₂ + (k : ℂ) * b₂) ^ n := by
    simp only [p, q₁, q₂, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_add,
      Polynomial.eval_C, Polynomial.eval_X]
  simp_rw [heval] at hlag
  rw [← hlag]
  have hderiv : p.coeff 1 = (Polynomial.derivative p).eval 0 := by
    rw [← Polynomial.coeff_zero_eq_eval_zero, Polynomial.coeff_derivative]
    simp
  rw [hderiv]
  cases n with
  | zero =>
    simp [p, q₁, q₂, Polynomial.derivative_add, Polynomial.derivative_mul]
  | succ m =>
    simp only [p, q₁, q₂, Polynomial.derivative_mul, Polynomial.derivative_pow,
      Polynomial.derivative_add, Polynomial.derivative_C, Polynomial.derivative_X,
      zero_add, one_mul, mul_zero, add_zero, Polynomial.eval_add, Polynomial.eval_mul,
      Polynomial.eval_C, Polynomial.eval_X, Polynomial.eval_pow, Nat.add_sub_cancel]
    ring

/-- Measure-preserving splitting of `(Fin (n + 1) → X)` into `X × (Fin n → X)` at coordinate `0`. -/
noncomputable def piSplit0 (n : ℕ) : (Fin (n + 1) → X) ≃ᵐ X × (Fin n → X) :=
  MeasurableEquiv.piFinSuccAbove (fun _ : Fin (n + 1) ↦ X) 0

theorem piSplit0_measurePreserving (n : ℕ) :
    MeasurePreserving (piSplit0 (X := X) n)
      (MomentumFock.powerMeasure μ (n + 1))
      (μ.prod (MomentumFock.powerMeasure μ n)) :=
  measurePreserving_piFinSuccAbove (fun _ : Fin (n + 1) ↦ μ) 0

theorem piSplit0_symm_apply (n : ℕ) (y : X) (x : Fin n → X) :
    (piSplit0 (X := X) n).symm (y, x) = Fin.cons y x := by
  ext i
  refine Fin.cases ?_ (fun j ↦ ?_) i <;>
    simp [piSplit0, MeasurableEquiv.piFinSuccAbove_symm_apply]

/-- Raw pointwise annihilation integral on `Lp ℂ 2 (μ^{n+1})`:
`x ↦ √(n + 1) * ∫ y, star (u y) * f (Fin.cons y x) ∂μ`. -/
noncomputable def annihilFun (n : ℕ) (u : Lp ℂ 2 μ)
    (f : Lp ℂ 2 (MomentumFock.powerMeasure μ (n + 1))) (x : Fin n → X) : ℂ :=
  ((Real.sqrt ((n + 1 : ℕ) : ℝ) : ℝ) : ℂ) *
    ∫ y : X, star (u y) * f (Fin.cons y x) ∂μ

theorem annihilFun_memLp_and_norm (n : ℕ) (u : Lp ℂ 2 μ)
    (f : Lp ℂ 2 (MomentumFock.powerMeasure μ (n + 1))) :
    MemLp (annihilFun μ n u f) 2 (MomentumFock.powerMeasure μ n) ∧
      (∫ x, ‖annihilFun μ n u f x‖ ^ 2 ∂(MomentumFock.powerMeasure μ n)) ≤
        ((n + 1 : ℕ) : ℝ) * ‖u‖ ^ 2 * ‖f‖ ^ 2 := by
  let e := piSplit0 (X := X) n
  have he := piSplit0_measurePreserving μ n
  have hu_meas : Measurable (u : X → ℂ) := (Lp.stronglyMeasurable u).measurable
  have hf_meas : Measurable (f : (Fin (n + 1) → X) → ℂ) := (Lp.stronglyMeasurable f).measurable
  have hcons_meas : Measurable (fun p : X × (Fin n → X) ↦ (Fin.cons p.1 p.2 : Fin (n + 1) → X)) := by
    have hEq : (fun p : X × (Fin n → X) ↦ (Fin.cons p.1 p.2 : Fin (n + 1) → X)) = e.symm := by
      funext ⟨y, x⟩; exact (piSplit0_symm_apply n y x).symm
    rw [hEq]; exact e.symm.measurable
  have hprod_meas : Measurable (fun p : X × (Fin n → X) ↦ star (u p.1) * f (Fin.cons p.1 p.2)) :=
    (continuous_star.measurable.comp (hu_meas.comp measurable_fst)).mul (hf_meas.comp hcons_meas)
  have hint_meas : StronglyMeasurable (fun x : Fin n → X ↦
      ∫ y : X, star (u y) * f (Fin.cons y x) ∂μ) :=
    hprod_meas.stronglyMeasurable.integral_prod_left
  have hann_meas : StronglyMeasurable (annihilFun μ n u f) :=
    stronglyMeasurable_const.mul hint_meas
  have hfnorm_sq : ∫ p : X × (Fin n → X), ‖f (Fin.cons p.1 p.2)‖ ^ 2 ∂(μ.prod (MomentumFock.powerMeasure μ n)) =
      ‖f‖ ^ 2 := by
    rw [FeatureDensity.l2_norm_sq_eq_integral f]
    have hEq : (fun p : X × (Fin n → X) ↦ ‖f (Fin.cons p.1 p.2)‖ ^ 2) =
        fun p ↦ ‖f (e.symm p)‖ ^ 2 := by
      funext ⟨y, x⟩; rw [piSplit0_symm_apply]
    rw [hEq]
    exact he.symm.integral_comp' (fun z ↦ ‖f z‖ ^ 2)
  have hf_sq_int_prod : Integrable (fun p : X × (Fin n → X) ↦ ‖f (Fin.cons p.1 p.2)‖ ^ 2)
      (μ.prod (MomentumFock.powerMeasure μ n)) := by
    have hf_sq : Integrable (fun z ↦ ‖f z‖ ^ 2) (MomentumFock.powerMeasure μ (n + 1)) :=
      (memLp_two_iff_integrable_sq_norm (Lp.aestronglyMeasurable f)).mp (Lp.memLp f)
    have hEq : (fun p : X × (Fin n → X) ↦ ‖f (Fin.cons p.1 p.2)‖ ^ 2) =
        (fun z ↦ ‖f z‖ ^ 2) ∘ e.symm := by
      funext ⟨y, x⟩; exact congrArg (fun z ↦ ‖f z‖ ^ 2) (piSplit0_symm_apply n y x).symm
    rw [hEq]
    exact (he.symm.integrable_comp_emb e.symm.measurableEmbedding).mpr hf_sq
  have hf_slice_int : ∀ᵐ x ∂(MomentumFock.powerMeasure μ n),
      Integrable (fun y : X ↦ ‖f (Fin.cons y x)‖ ^ 2) μ :=
    hf_sq_int_prod.prod_left_ae
  have hu_sq_int : Integrable (fun y : X ↦ ‖u y‖ ^ 2) μ :=
    (memLp_two_iff_integrable_sq_norm (Lp.aestronglyMeasurable u)).mp (Lp.memLp u)
  have hu_norm_sq : ∫ y : X, ‖u y‖ ^ 2 ∂μ = ‖u‖ ^ 2 := (FeatureDensity.l2_norm_sq_eq_integral u).symm
  have hslice_bound : ∀ᵐ x ∂(MomentumFock.powerMeasure μ n),
      ‖annihilFun μ n u f x‖ ^ 2 ≤
        ((n + 1 : ℕ) : ℝ) * ‖u‖ ^ 2 * ∫ y : X, ‖f (Fin.cons y x)‖ ^ 2 ∂μ := by
    filter_upwards [hf_slice_int] with x hx
    have hfx_memLp : MemLp (fun y : X ↦ ‖f (Fin.cons y x)‖) (ENNReal.ofReal 2) μ := by
      rw [show ENNReal.ofReal (2 : ℝ) = 2 by norm_num]
      refine (memLp_two_iff_integrable_sq_norm ?_).mpr ?_
      · exact ((hf_meas.comp (hcons_meas.comp (measurable_id.prodMk measurable_const))).norm).aestronglyMeasurable
      · simpa only [Real.norm_eq_abs, sq_abs] using hx
    have hu_memLp : MemLp (fun y : X ↦ ‖u y‖) (ENNReal.ofReal 2) μ := by
      rw [show ENNReal.ofReal (2 : ℝ) = 2 by norm_num]
      refine (memLp_two_iff_integrable_sq_norm (hu_meas.norm.aestronglyMeasurable)).mpr ?_
      simpa only [Real.norm_eq_abs, sq_abs] using hu_sq_int
    have hcs := integral_mul_le_Lp_mul_Lq_of_nonneg Real.HolderConjugate.two_two
      (ae_of_all _ fun y ↦ norm_nonneg (u y))
      (ae_of_all _ fun y ↦ norm_nonneg (f (Fin.cons y x)))
      hu_memLp hfx_memLp
    have hnorm_int : ‖∫ y : X, star (u y) * f (Fin.cons y x) ∂μ‖ ≤
        ∫ y : X, ‖u y‖ * ‖f (Fin.cons y x)‖ ∂μ := by
      calc ‖∫ y : X, star (u y) * f (Fin.cons y x) ∂μ‖
          ≤ ∫ y : X, ‖star (u y) * f (Fin.cons y x)‖ ∂μ := norm_integral_le_integral_norm _
        _ = ∫ y : X, ‖u y‖ * ‖f (Fin.cons y x)‖ ∂μ := by
            simp only [norm_mul, norm_star]
    have hle : ‖∫ y : X, star (u y) * f (Fin.cons y x) ∂μ‖ ≤
        Real.sqrt (‖u‖ ^ 2) * Real.sqrt (∫ y : X, ‖f (Fin.cons y x)‖ ^ 2 ∂μ) := by
      refine hnorm_int.trans (hcs.trans_eq ?_)
      simp only [Real.rpow_two, one_div, Real.sqrt_eq_rpow]
      exact congrArg (fun r : ℝ ↦ r ^ (2 : ℝ)⁻¹ * (∫ y : X, ‖f (Fin.cons y x)‖ ^ 2 ∂μ) ^ (2 : ℝ)⁻¹)
        hu_norm_sq
    have hsq_le : ‖∫ y : X, star (u y) * f (Fin.cons y x) ∂μ‖ ^ 2 ≤
        ‖u‖ ^ 2 * ∫ y : X, ‖f (Fin.cons y x)‖ ^ 2 ∂μ := by
      have h1 := pow_le_pow_left₀ (norm_nonneg _) hle 2
      rw [mul_pow, Real.sq_sqrt (sq_nonneg _),
        Real.sq_sqrt (integral_nonneg fun y ↦ sq_nonneg _)] at h1
      exact h1
    unfold annihilFun
    rw [norm_mul, Complex.norm_real, Real.norm_of_nonneg (Real.sqrt_nonneg _), mul_pow,
      Real.sq_sqrt (Nat.cast_nonneg _), mul_assoc]
    exact mul_le_mul_of_nonneg_left hsq_le (Nat.cast_nonneg _)
  have hrhs_int : Integrable (fun x : Fin n → X ↦
      ((n + 1 : ℕ) : ℝ) * ‖u‖ ^ 2 * ∫ y : X, ‖f (Fin.cons y x)‖ ^ 2 ∂μ)
      (MomentumFock.powerMeasure μ n) :=
    hf_sq_int_prod.integral_prod_right.const_mul _
  have hlhs_int : Integrable (fun x : Fin n → X ↦ ‖annihilFun μ n u f x‖ ^ 2)
      (MomentumFock.powerMeasure μ n) := by
    refine hrhs_int.mono' (hann_meas.norm.pow 2).aestronglyMeasurable ?_
    filter_upwards [hslice_bound] with x hx
    rw [Real.norm_of_nonneg (sq_nonneg _)]
    exact hx
  refine ⟨(memLp_two_iff_integrable_sq_norm hann_meas.aestronglyMeasurable).mpr hlhs_int, ?_⟩
  calc ∫ x, ‖annihilFun μ n u f x‖ ^ 2 ∂(MomentumFock.powerMeasure μ n)
      ≤ ∫ x, ((n + 1 : ℕ) : ℝ) * ‖u‖ ^ 2 * ∫ y : X, ‖f (Fin.cons y x)‖ ^ 2 ∂μ
          ∂(MomentumFock.powerMeasure μ n) :=
        integral_mono_ae hlhs_int hrhs_int hslice_bound
    _ = ((n + 1 : ℕ) : ℝ) * ‖u‖ ^ 2 *
          ∫ x, ∫ y : X, ‖f (Fin.cons y x)‖ ^ 2 ∂μ ∂(MomentumFock.powerMeasure μ n) :=
        integral_const_mul _ _
    _ = ((n + 1 : ℕ) : ℝ) * ‖u‖ ^ 2 * ‖f‖ ^ 2 := by
        rw [← integral_prod_symm _ hf_sq_int_prod, hfnorm_sq]

/-- Slice-level integrability of `y ↦ star (u y) * f (Fin.cons y x)` for a.e. `x`. -/
theorem annihil_slice_integrable (n : ℕ) (u : Lp ℂ 2 μ)
    (f : Lp ℂ 2 (MomentumFock.powerMeasure μ (n + 1))) :
    ∀ᵐ x ∂(MomentumFock.powerMeasure μ n),
      Integrable (fun y : X ↦ star (u y) * f (Fin.cons y x)) μ := by
  let e := piSplit0 (X := X) n
  have he := piSplit0_measurePreserving μ n
  have hcons_meas : Measurable (fun p : X × (Fin n → X) ↦ (Fin.cons p.1 p.2 : Fin (n + 1) → X)) := by
    have hEq : (fun p : X × (Fin n → X) ↦ (Fin.cons p.1 p.2 : Fin (n + 1) → X)) = e.symm := by
      funext ⟨y, x⟩; exact (piSplit0_symm_apply n y x).symm
    rw [hEq]; exact e.symm.measurable
  have hf_meas : Measurable (f : (Fin (n + 1) → X) → ℂ) := (Lp.stronglyMeasurable f).measurable
  have hf_sq : Integrable (fun z ↦ ‖f z‖ ^ 2) (MomentumFock.powerMeasure μ (n + 1)) :=
    (memLp_two_iff_integrable_sq_norm (Lp.aestronglyMeasurable f)).mp (Lp.memLp f)
  have hf_sq_prod : Integrable (fun p : X × (Fin n → X) ↦ ‖f (Fin.cons p.1 p.2)‖ ^ 2)
      (μ.prod (MomentumFock.powerMeasure μ n)) := by
    have hEq : (fun p : X × (Fin n → X) ↦ ‖f (Fin.cons p.1 p.2)‖ ^ 2) =
        (fun z ↦ ‖f z‖ ^ 2) ∘ e.symm := by
      funext ⟨y, x⟩; exact congrArg (fun z ↦ ‖f z‖ ^ 2) (piSplit0_symm_apply n y x).symm
    rw [hEq]
    exact (he.symm.integrable_comp_emb e.symm.measurableEmbedding).mpr hf_sq
  have hu_star : MemLp (fun y : X ↦ star (u y)) 2 μ := by
    refine (memLp_two_iff_integrable_sq_norm
      (continuous_star.comp_aestronglyMeasurable (Lp.aestronglyMeasurable u))).mpr ?_
    simpa only [norm_star] using
      (memLp_two_iff_integrable_sq_norm (Lp.aestronglyMeasurable u)).mp (Lp.memLp u)
  filter_upwards [hf_sq_prod.prod_left_ae] with x hx
  have hfx_mem : MemLp (fun y : X ↦ f (Fin.cons y x)) 2 μ := by
    refine (memLp_two_iff_integrable_sq_norm ?_).mpr hx
    exact (hf_meas.comp (hcons_meas.comp (measurable_id.prodMk measurable_const))).aestronglyMeasurable
  exact hu_star.integrable_mul hfx_mem

/-- Helper: from `∀ᵐ z ∂μ^{n+1}, P z`, obtain `∀ᵐ x ∂μ^n, ∀ᵐ y ∂μ, P (Fin.cons y x)`. -/
theorem ae_cons_of_ae (n : ℕ) {P : (Fin (n + 1) → X) → Prop}
    (h : ∀ᵐ z ∂(MomentumFock.powerMeasure μ (n + 1)), P z) :
    ∀ᵐ x ∂(MomentumFock.powerMeasure μ n), ∀ᵐ y ∂μ, P (Fin.cons y x) := by
  have h1 : ∀ᵐ p ∂(μ.prod (MomentumFock.powerMeasure μ n)), P (Fin.cons p.1 p.2) := by
    filter_upwards [(piSplit0_measurePreserving μ n).symm.quasiMeasurePreserving.ae h] with p hp
    rcases p with ⟨y, x⟩
    simpa only [piSplit0_symm_apply] using hp
  have h2 : ∀ᵐ q ∂((MomentumFock.powerMeasure μ n).prod μ), P (Fin.cons q.2 q.1) :=
    Measure.measurePreserving_swap.quasiMeasurePreserving.ae h1
  exact Measure.ae_ae_of_ae_prod h2

/-- Bounded annihilation operator on the ambient `L²(μ^{n+1}) → L²(μ^n)`. -/
noncomputable def sectorAnnihilLp (n : ℕ) (u : Lp ℂ 2 μ) :
    Lp ℂ 2 (MomentumFock.powerMeasure μ (n + 1)) →L[ℂ]
      Lp ℂ 2 (MomentumFock.powerMeasure μ n) :=
  let toFun : Lp ℂ 2 (MomentumFock.powerMeasure μ (n + 1)) →
      Lp ℂ 2 (MomentumFock.powerMeasure μ n) :=
    fun f ↦ (annihilFun_memLp_and_norm μ n u f).1.toLp (annihilFun μ n u f)
  have hadd : ∀ f g, toFun (f + g) = toFun f + toFun g := fun f g ↦ by
    apply Lp.ext
    filter_upwards [(annihilFun_memLp_and_norm μ n u (f + g)).1.coeFn_toLp,
      Lp.coeFn_add (toFun f) (toFun g),
      (annihilFun_memLp_and_norm μ n u f).1.coeFn_toLp,
      (annihilFun_memLp_and_norm μ n u g).1.coeFn_toLp,
      ae_cons_of_ae μ n (Lp.coeFn_add f g),
      annihil_slice_integrable μ n u f,
      annihil_slice_integrable μ n u g] with x hfg hsum hf hg hpt hif hig
    rw [hsum, Pi.add_apply]
    change (((annihilFun_memLp_and_norm μ n u (f + g)).1.toLp _) x) =
      (((annihilFun_memLp_and_norm μ n u f).1.toLp _) x) +
      (((annihilFun_memLp_and_norm μ n u g).1.toLp _) x)
    rw [hfg, hf, hg]
    unfold annihilFun
    rw [← mul_add, ← integral_add hif hig]
    congr 1
    refine integral_congr_ae ?_
    filter_upwards [hpt] with y hy
    rw [hy, Pi.add_apply, mul_add]
  have hsmul : ∀ (c : ℂ) f, toFun (c • f) = c • toFun f := fun c f ↦ by
    apply Lp.ext
    filter_upwards [(annihilFun_memLp_and_norm μ n u (c • f)).1.coeFn_toLp,
      Lp.coeFn_smul c (toFun f),
      (annihilFun_memLp_and_norm μ n u f).1.coeFn_toLp,
      ae_cons_of_ae μ n (Lp.coeFn_smul c f)] with x hcf hcs hf hpt
    rw [hcs, Pi.smul_apply]
    change (((annihilFun_memLp_and_norm μ n u (c • f)).1.toLp _) x) =
      c • (((annihilFun_memLp_and_norm μ n u f).1.toLp _) x)
    rw [hcf, hf]
    unfold annihilFun
    simp only [smul_eq_mul]
    have hint : (∫ y : X, star (u y) *
          ((c • f : Lp ℂ 2 (MomentumFock.powerMeasure μ (n + 1))) : (Fin (n + 1) → X) → ℂ)
            (Fin.cons y x) ∂μ) =
        c * ∫ y : X, star (u y) * f (Fin.cons y x) ∂μ := by
      rw [← integral_const_mul]
      refine integral_congr_ae ?_
      filter_upwards [hpt] with y hy
      rw [hy, Pi.smul_apply, smul_eq_mul]
      ring
    rw [hint]; ring
  let L : Lp ℂ 2 (MomentumFock.powerMeasure μ (n + 1)) →ₗ[ℂ]
      Lp ℂ 2 (MomentumFock.powerMeasure μ n) :=
    { toFun := toFun
      map_add' := hadd
      map_smul' := hsmul }
  L.mkContinuous (Real.sqrt ((n + 1 : ℕ) : ℝ) * ‖u‖) fun f ↦ by
    have hnorm := (annihilFun_memLp_and_norm μ n u f).2
    have hsq : ‖L f‖ ^ 2 ≤ (Real.sqrt ((n + 1 : ℕ) : ℝ) * ‖u‖ * ‖f‖) ^ 2 := by
      rw [FeatureDensity.l2_norm_sq_eq_integral (L f)]
      have heq : ∫ x, ‖(L f : (Fin n → X) → ℂ) x‖ ^ 2 ∂(MomentumFock.powerMeasure μ n) =
          ∫ x, ‖annihilFun μ n u f x‖ ^ 2 ∂(MomentumFock.powerMeasure μ n) := by
        refine integral_congr_ae ?_
        filter_upwards [(annihilFun_memLp_and_norm μ n u f).1.coeFn_toLp] with x hx
        exact congrArg (fun z : ℂ ↦ ‖z‖ ^ 2) hx
      rw [heq, mul_pow, mul_pow, Real.sq_sqrt (Nat.cast_nonneg _)]
      exact hnorm
    have hrhs : 0 ≤ Real.sqrt ((n + 1 : ℕ) : ℝ) * ‖u‖ * ‖f‖ := by positivity
    nlinarith [norm_nonneg (L f), hrhs]

theorem sectorAnnihilLp_apply_ae (n : ℕ) (u : Lp ℂ 2 μ)
    (f : Lp ℂ 2 (MomentumFock.powerMeasure μ (n + 1))) :
    (sectorAnnihilLp μ n u f : (Fin n → X) → ℂ) =ᵐ[MomentumFock.powerMeasure μ n]
      annihilFun μ n u f :=
  (annihilFun_memLp_and_norm μ n u f).1.coeFn_toLp

theorem sectorAnnihilLp_norm_le (n : ℕ) (u : Lp ℂ 2 μ)
    (f : Lp ℂ 2 (MomentumFock.powerMeasure μ (n + 1))) :
    ‖sectorAnnihilLp μ n u f‖ ≤ Real.sqrt ((n + 1 : ℕ) : ℝ) * ‖u‖ * ‖f‖ := by
  have hnorm := (annihilFun_memLp_and_norm μ n u f).2
  have hsq : ‖sectorAnnihilLp μ n u f‖ ^ 2 ≤ (Real.sqrt ((n + 1 : ℕ) : ℝ) * ‖u‖ * ‖f‖) ^ 2 := by
    rw [FeatureDensity.l2_norm_sq_eq_integral]
    have heq : ∫ x, ‖(sectorAnnihilLp μ n u f : (Fin n → X) → ℂ) x‖ ^ 2
          ∂(MomentumFock.powerMeasure μ n) =
        ∫ x, ‖annihilFun μ n u f x‖ ^ 2 ∂(MomentumFock.powerMeasure μ n) := by
      refine integral_congr_ae ?_
      filter_upwards [sectorAnnihilLp_apply_ae μ n u f] with x hx
      exact congrArg (fun z : ℂ ↦ ‖z‖ ^ 2) hx
    rw [heq, mul_pow, mul_pow, Real.sq_sqrt (Nat.cast_nonneg _)]
    exact hnorm
  have hrhs : 0 ≤ Real.sqrt ((n + 1 : ℕ) : ℝ) * ‖u‖ * ‖f‖ := by positivity
  nlinarith [norm_nonneg (sectorAnnihilLp μ n u f), hrhs]

theorem sectorAnnihilLp_scaledPower (n : ℕ) (u v : Lp ℂ 2 μ) :
    sectorAnnihilLp μ n u (MomentumFock.scaledPower μ (n + 1) v) =
      inner ℂ u v • MomentumFock.scaledPower μ n v := by
  apply Lp.ext
  have hweight : ((Real.sqrt ((n + 1 : ℕ) : ℝ) : ℝ) : ℂ) *
      (MomentumFock.fockWeight (n + 1) : ℂ) = (MomentumFock.fockWeight n : ℂ) := by
    rw [← Complex.ofReal_mul]
    congr 1
    unfold MomentumFock.fockWeight
    rw [Nat.factorial_succ, Nat.cast_mul, Real.sqrt_mul (Nat.cast_nonneg _), mul_inv,
      ← mul_assoc, mul_inv_cancel₀ (Real.sqrt_pos.mpr (Nat.cast_pos.mpr (Nat.succ_pos n))).ne',
      one_mul]
  have h1 := ae_cons_of_ae μ n (Lp.coeFn_smul (MomentumFock.fockWeight (n + 1) : ℂ)
    (MomentumFock.powerVec μ (n + 1) v))
  have h2 := ae_cons_of_ae μ n (MomentumFock.purePower_memLp μ (n + 1) v).coeFn_toLp
  filter_upwards [sectorAnnihilLp_apply_ae μ n u (MomentumFock.scaledPower μ (n + 1) v),
    Lp.coeFn_smul (inner ℂ u v) (MomentumFock.scaledPower μ n v),
    Lp.coeFn_smul (MomentumFock.fockWeight n : ℂ) (MomentumFock.powerVec μ n v),
    (MomentumFock.purePower_memLp μ n v).coeFn_toLp,
    h1, h2] with x hL hR1 hR2 hR3 hcons1 hcons2
  rw [hL, hR1, Pi.smul_apply]
  change annihilFun μ n u (MomentumFock.scaledPower μ (n + 1) v) x =
    inner ℂ u v * (((MomentumFock.fockWeight n : ℂ) • MomentumFock.powerVec μ n v :
      Lp ℂ 2 (MomentumFock.powerMeasure μ n)) x)
  rw [hR2, Pi.smul_apply, smul_eq_mul]
  change annihilFun μ n u (MomentumFock.scaledPower μ (n + 1) v) x =
    inner ℂ u v * ((MomentumFock.fockWeight n : ℂ) *
      (((MomentumFock.purePower_memLp μ n v).toLp _) x))
  rw [hR3]
  unfold annihilFun
  have hint :
      (∫ y : X, star (u y) * (MomentumFock.scaledPower μ (n + 1) v : (Fin (n + 1) → X) → ℂ)
          (Fin.cons y x) ∂μ) =
      (MomentumFock.fockWeight (n + 1) : ℂ) * (inner ℂ u v * MomentumFock.purePower μ n v x) := by
    have hpt : ∀ᵐ y ∂μ, star (u y) *
        (MomentumFock.scaledPower μ (n + 1) v : (Fin (n + 1) → X) → ℂ) (Fin.cons y x) =
        ((MomentumFock.fockWeight (n + 1) : ℂ) * MomentumFock.purePower μ n v x) *
          inner ℂ (u y) (v y) := by
      filter_upwards [hcons1, hcons2] with y hy1 hy2
      change star (u y) *
          (((MomentumFock.fockWeight (n + 1) : ℂ) • MomentumFock.powerVec μ (n + 1) v :
            Lp ℂ 2 (MomentumFock.powerMeasure μ (n + 1))) (Fin.cons y x)) = _
      rw [hy1, Pi.smul_apply, smul_eq_mul]
      change star (u y) * ((MomentumFock.fockWeight (n + 1) : ℂ) *
        (((MomentumFock.purePower_memLp μ (n + 1) v).toLp _) (Fin.cons y x))) = _
      rw [hy2]
      simp only [MomentumFock.purePower, Fin.prod_univ_succ, Fin.cons_zero, Fin.cons_succ,
        RCLike.inner_apply, RCLike.star_def]
      ring
    rw [integral_congr_ae hpt, integral_const_mul, ← L2.inner_def]
    ring
  rw [hint, ← mul_assoc, hweight]
  ring

theorem sectorAnnihilLp_mem_sector (n : ℕ) (u : Lp ℂ 2 μ) (ψ : momentumSector μ (n + 1)) :
    sectorAnnihilLp μ n u ψ.1 ∈ momentumSector μ n := by
  let M := sectorAnnihilLp μ n u
  have hpre : Submodule.span ℂ (Set.range (MomentumFock.scaledPower μ (n + 1))) ≤
      (momentumSector μ n).comap M.toLinearMap := by
    refine Submodule.span_le.mpr ?_
    rintro _ ⟨v, rfl⟩
    change M (MomentumFock.scaledPower μ (n + 1) v) ∈ momentumSector μ n
    rw [sectorAnnihilLp_scaledPower μ n u v]
    exact (momentumSector μ n).smul_mem _
      (Submodule.le_topologicalClosure _ (Submodule.subset_span ⟨v, rfl⟩))
  have hclosed : IsClosed ((momentumSector μ n).comap M.toLinearMap :
      Set (Lp ℂ 2 (MomentumFock.powerMeasure μ (n + 1)))) :=
    (Submodule.isClosed_topologicalClosure _).preimage M.continuous
  exact (Submodule.span ℂ (Set.range (MomentumFock.scaledPower μ (n + 1)))).topologicalClosure_minimal
    hpre hclosed ψ.property

end SectorOps

end WightmanField

/-! #### Concrete Creation, Annihilation & Bosonic Field on `FiniteParticleFock` -/

section ContinuousFockField

variable {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]

/-- Finite-particle dense core inside `momentumFock μ`: vectors vanishing above some sector `N`. -/
def FiniteParticleFock : Submodule ℂ (momentumFock μ) where
  carrier := { ψ : momentumFock μ | ∃ N : ℕ, ∀ n, N < n → ψ n = 0 }
  zero_mem' := ⟨0, fun _ _ ↦ rfl⟩
  add_mem' := by
    rintro ψ φ ⟨N₁, h₁⟩ ⟨N₂, h₂⟩
    refine ⟨max N₁ N₂, fun n hn ↦ ?_⟩
    have hn₁ : N₁ < n := lt_of_le_of_lt (le_max_left _ _) hn
    have hn₂ : N₂ < n := lt_of_le_of_lt (le_max_right _ _) hn
    change ψ n + φ n = 0
    rw [h₁ n hn₁, h₂ n hn₂, add_zero]
  smul_mem' := by
    rintro c ψ ⟨N, h⟩
    refine ⟨N, fun n hn ↦ ?_⟩
    change c • ψ n = 0
    rw [h n hn, smul_zero]

/-- The Fock vacuum `Ω` belongs to `FiniteParticleFock μ`. -/
theorem fockVacuum_mem_finiteParticle : fockVacuum μ ∈ FiniteParticleFock μ := by
  refine ⟨0, fun n hn ↦ ?_⟩
  obtain ⟨k, rfl⟩ := Nat.exists_eq_succ_of_ne_zero (Nat.pos_iff_ne_zero.mp hn)
  exact MomentumFock.sectorVec_succ_zero μ k

/-- The Fock vacuum viewed as an element of `FiniteParticleFock μ`. -/
noncomputable def fockVacuumFin : FiniteParticleFock μ :=
  ⟨fockVacuum μ, fockVacuum_mem_finiteParticle μ⟩

/-- Embedding of a pure `n`-particle sector state into `momentumFock μ`. -/
noncomputable def embedSector (n : ℕ) (y : momentumSector μ n) : momentumFock μ :=
  lp.single 2 n y

@[simp]
theorem embedSector_apply_self (n : ℕ) (y : momentumSector μ n) :
    embedSector μ n y n = y := by
  unfold embedSector
  simp [lp.single_apply]

theorem embedSector_apply_ne {n m : ℕ} (h : m ≠ n) (y : momentumSector μ n) :
    embedSector μ n y m = 0 := by
  unfold embedSector
  simp [lp.single_apply, h]

theorem embedSector_norm (n : ℕ) (y : momentumSector μ n) :
    ‖embedSector μ n y‖ = ‖y‖ := by
  unfold embedSector
  exact lp.norm_single (E := fun k ↦ ↥(momentumSector μ k)) (p := 2) (by norm_num) n y

theorem embedSector_inner_right (n : ℕ) (ψ : momentumFock μ) (y : momentumSector μ n) :
    inner ℂ ψ (embedSector μ n y) = inner ℂ (ψ n) y := by
  rw [lp.inner_eq_tsum, tsum_eq_single n]
  · rw [embedSector_apply_self]
  · intro m hm
    rw [embedSector_apply_ne μ hm, inner_zero_right]

theorem embedSector_mem_finiteParticle (n : ℕ) (y : momentumSector μ n) :
    embedSector μ n y ∈ FiniteParticleFock μ :=
  ⟨n, fun _m hm ↦ embedSector_apply_ne μ (ne_of_gt hm) y⟩

/-- Pure `n`-particle sector state viewed inside `FiniteParticleFock μ`. -/
noncomputable def embedSectorFin (n : ℕ) (y : momentumSector μ n) : FiniteParticleFock μ :=
  ⟨embedSector μ n y, embedSector_mem_finiteParticle μ n y⟩

/-- Density of `FiniteParticleFock μ` in `momentumFock μ`. -/
theorem finiteParticle_dense :
    (FiniteParticleFock μ).topologicalClosure = ⊤ := by
  apply Submodule.topologicalClosure_eq_top_iff.2
  apply eq_bot_iff.mpr
  intro ψ hψ
  change ψ = 0
  apply lp.ext
  funext n
  have horth := Submodule.inner_left_of_mem_orthogonal
    (embedSector_mem_finiteParticle μ n (ψ n)) hψ
  rw [embedSector_inner_right] at horth
  exact (inner_self_eq_zero (𝕜 := ℂ)).mp horth

/-- Sectorwise bounded annihilation operator `c_n(u) : momentumSector μ (n + 1) →L[ℂ] momentumSector μ n`. -/
noncomputable def sectorAnnihil (n : ℕ) (u : Lp ℂ 2 μ) :
    momentumSector μ (n + 1) →L[ℂ] momentumSector μ n where
  toLinearMap :=
    { toFun := fun ψ ↦ ⟨WightmanField.sectorAnnihilLp μ n u ψ.1,
        WightmanField.sectorAnnihilLp_mem_sector μ n u ψ⟩
      map_add' := fun ψ φ ↦ Subtype.ext ((WightmanField.sectorAnnihilLp μ n u).map_add ψ.1 φ.1)
      map_smul' := fun c ψ ↦ Subtype.ext ((WightmanField.sectorAnnihilLp μ n u).map_smul c ψ.1) }
  cont := ((WightmanField.sectorAnnihilLp μ n u).continuous.comp continuous_subtype_val).subtype_mk _

theorem sectorAnnihil_sectorVec (n : ℕ) (u v : Lp ℂ 2 μ) :
    sectorAnnihil μ n u (sectorVec μ (n + 1) v) = inner ℂ u v • sectorVec μ n v :=
  Subtype.ext (WightmanField.sectorAnnihilLp_scaledPower μ n u v)

theorem sectorAnnihil_norm_le (n : ℕ) (u : Lp ℂ 2 μ) (ψ : momentumSector μ (n + 1)) :
    ‖sectorAnnihil μ n u ψ‖ ≤ Real.sqrt ((n + 1 : ℕ) : ℝ) * ‖u‖ * ‖ψ‖ :=
  WightmanField.sectorAnnihilLp_norm_le μ n u ψ.1

theorem sectorAnnihil_opNorm_le (n : ℕ) (u : Lp ℂ 2 μ) :
    ‖sectorAnnihil μ n u‖ ≤ Real.sqrt ((n + 1 : ℕ) : ℝ) * ‖u‖ :=
  ContinuousLinearMap.opNorm_le_bound _ (by positivity) (sectorAnnihil_norm_le μ n u)

private theorem sector_completeSpace (n : ℕ) : CompleteSpace (momentumSector μ n) :=
  (Submodule.isClosed_topologicalClosure _).completeSpace_coe

/-- Dense-span extensionality on `momentumSector μ n`: two continuous linear maps agreeing on
every `sectorVec μ n v` are equal. -/
theorem sector_clm_ext {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    (n : ℕ) (S T : momentumSector μ n →L[ℂ] E)
    (h : ∀ v : Lp ℂ 2 μ, S (sectorVec μ n v) = T (sectorVec μ n v)) : S = T := by
  have hd : Dense (Submodule.span ℂ (Set.range (sectorVec μ n)) : Set (momentumSector μ n)) := by
    rw [Submodule.dense_iff_topologicalClosure_eq_top, Submodule.topologicalClosure_eq_top_iff,
      eq_bot_iff]
    intro y hy
    change y = 0
    apply MomentumFock.sectorVec_separates μ n y
    intro v
    exact Submodule.inner_left_of_mem_orthogonal (Submodule.subset_span (Set.mem_range_self v)) hy
  exact ContinuousLinearMap.ext_on hd (by rintro _ ⟨v, rfl⟩; exact h v)

theorem sectorAnnihil_add (n : ℕ) (u v : Lp ℂ 2 μ) :
    sectorAnnihil μ n (u + v) = sectorAnnihil μ n u + sectorAnnihil μ n v := by
  apply sector_clm_ext μ (n + 1)
  intro w
  change sectorAnnihil μ n (u + v) (sectorVec μ (n + 1) w) =
    sectorAnnihil μ n u (sectorVec μ (n + 1) w) + sectorAnnihil μ n v (sectorVec μ (n + 1) w)
  rw [sectorAnnihil_sectorVec, sectorAnnihil_sectorVec, sectorAnnihil_sectorVec, inner_add_left,
    add_smul]

theorem sectorAnnihil_smul (n : ℕ) (c : ℂ) (u : Lp ℂ 2 μ) :
    sectorAnnihil μ n (c • u) = star c • sectorAnnihil μ n u := by
  apply sector_clm_ext μ (n + 1)
  intro w
  change sectorAnnihil μ n (c • u) (sectorVec μ (n + 1) w) =
    star c • sectorAnnihil μ n u (sectorVec μ (n + 1) w)
  rw [sectorAnnihil_sectorVec, sectorAnnihil_sectorVec, inner_smul_left, smul_smul]
  rfl

theorem sectorAnnihil_sub (n : ℕ) (u v : Lp ℂ 2 μ) :
    sectorAnnihil μ n (u - v) = sectorAnnihil μ n u - sectorAnnihil μ n v := by
  apply sector_clm_ext μ (n + 1)
  intro w
  change sectorAnnihil μ n (u - v) (sectorVec μ (n + 1) w) =
    sectorAnnihil μ n u (sectorVec μ (n + 1) w) - sectorAnnihil μ n v (sectorVec μ (n + 1) w)
  rw [sectorAnnihil_sectorVec, sectorAnnihil_sectorVec, sectorAnnihil_sectorVec, inner_sub_left]
  exact sub_smul (inner ℂ u w) (inner ℂ v w) (sectorVec μ n w)

/-- Sectorwise bounded creation operator `c*_n(u) : momentumSector μ n →L[ℂ] momentumSector μ (n + 1)`,
defined as the Hilbert-space adjoint of `sectorAnnihil μ n u`. -/
noncomputable def sectorCreate (n : ℕ) (u : Lp ℂ 2 μ) :
    momentumSector μ n →L[ℂ] momentumSector μ (n + 1) :=
  letI := sector_completeSpace μ n
  letI := sector_completeSpace μ (n + 1)
  ContinuousLinearMap.adjoint (sectorAnnihil μ n u)

theorem sectorCreate_adjoint (n : ℕ) (u : Lp ℂ 2 μ)
    (φ : momentumSector μ n) (ψ : momentumSector μ (n + 1)) :
    inner ℂ (sectorCreate μ n u φ) ψ = inner ℂ φ (sectorAnnihil μ n u ψ) := by
  have _ := sector_completeSpace μ n
  have _ := sector_completeSpace μ (n + 1)
  exact ContinuousLinearMap.adjoint_inner_left (sectorAnnihil μ n u) ψ φ

theorem sectorCreate_adjoint_right (n : ℕ) (u : Lp ℂ 2 μ)
    (φ : momentumSector μ n) (ψ : momentumSector μ (n + 1)) :
    inner ℂ ψ.1 (sectorCreate μ n u φ).1 = inner ℂ (sectorAnnihil μ n u ψ).1 φ.1 := by
  rw [← inner_conj_symm, ← inner_conj_symm (sectorAnnihil μ n u ψ).1]
  exact congrArg (starRingEnd ℂ) (sectorCreate_adjoint μ n u φ ψ)

theorem sectorCreate_opNorm_le (n : ℕ) (u : Lp ℂ 2 μ) :
    ‖sectorCreate μ n u‖ ≤ Real.sqrt ((n + 1 : ℕ) : ℝ) * ‖u‖ := by
  have _ := sector_completeSpace μ n
  have _ := sector_completeSpace μ (n + 1)
  unfold sectorCreate
  rw [LinearIsometryEquiv.norm_map]
  exact sectorAnnihil_opNorm_le μ n u

theorem sectorCreate_norm_le (n : ℕ) (u : Lp ℂ 2 μ) (φ : momentumSector μ n) :
    ‖sectorCreate μ n u φ‖ ≤ Real.sqrt ((n + 1 : ℕ) : ℝ) * ‖u‖ * ‖φ‖ :=
  (ContinuousLinearMap.le_opNorm _ φ).trans
    (mul_le_mul_of_nonneg_right (sectorCreate_opNorm_le μ n u) (norm_nonneg φ))

theorem sectorCreate_add (n : ℕ) (u v : Lp ℂ 2 μ) :
    sectorCreate μ n (u + v) = sectorCreate μ n u + sectorCreate μ n v := by
  have _ := sector_completeSpace μ n
  have _ := sector_completeSpace μ (n + 1)
  unfold sectorCreate
  rw [sectorAnnihil_add, map_add]

theorem sectorCreate_smul (n : ℕ) (c : ℂ) (u : Lp ℂ 2 μ) :
    sectorCreate μ n (c • u) = c • sectorCreate μ n u := by
  have _ := sector_completeSpace μ n
  have _ := sector_completeSpace μ (n + 1)
  unfold sectorCreate
  rw [sectorAnnihil_smul, map_smulₛₗ]
  simp

theorem sectorCreate_sub (n : ℕ) (u v : Lp ℂ 2 μ) :
    sectorCreate μ n (u - v) = sectorCreate μ n u - sectorCreate μ n v := by
  have _ := sector_completeSpace μ n
  have _ := sector_completeSpace μ (n + 1)
  unfold sectorCreate
  rw [sectorAnnihil_sub, map_sub]

theorem sectorCreate_sectorVec_self (n : ℕ) (u : Lp ℂ 2 μ) :
    sectorCreate μ n u (sectorVec μ n u) = ((n + 1 : ℕ) : ℂ) • sectorVec μ (n + 1) u := by
  rw [← sub_eq_zero]
  apply MomentumFock.sectorVec_separates μ (n + 1)
  intro y
  rw [inner_sub_left, sub_eq_zero, sectorCreate_adjoint, sectorAnnihil_sectorVec]
  change inner ℂ (sectorVec μ n u).1 ((inner ℂ u y) • (sectorVec μ n y).1) =
    inner ℂ ((((n + 1 : ℕ) : ℂ) • (sectorVec μ (n + 1) u).1)) (sectorVec μ (n + 1) y).1
  rw [inner_smul_right, inner_smul_left]
  change inner ℂ u y * inner ℂ (sectorVec μ n u) (sectorVec μ n y) =
    (starRingEnd ℂ) ((n + 1 : ℕ) : ℂ) * inner ℂ (sectorVec μ (n + 1) u) (sectorVec μ (n + 1) y)
  rw [sectorVec_gram, sectorVec_gram]
  simp only [map_natCast, Nat.factorial_succ, Nat.cast_mul, pow_succ]
  have hn1 : ((n + 1 : ℕ) : ℂ) ≠ 0 := Nat.cast_ne_zero.mpr (Nat.succ_ne_zero n)
  field_simp [hn1]

theorem sectorCreate_sectorVec_lagrange (n : ℕ) (u w : Lp ℂ 2 μ) :
    sectorCreate μ n u (sectorVec μ n w) =
      ∑ k ∈ Finset.range (n + 2),
        (WightmanField.lagrangeCoeff1 n k : ℂ) • sectorVec μ (n + 1) (w + (k : ℂ) • u) := by
  rw [← sub_eq_zero]
  apply MomentumFock.sectorVec_separates μ (n + 1)
  intro y
  rw [inner_sub_left, sub_eq_zero, sectorCreate_adjoint, sectorAnnihil_sectorVec]
  change inner ℂ (sectorVec μ n w).1 (inner ℂ u y • (sectorVec μ n y).1) =
    inner ℂ ((∑ k ∈ Finset.range (n + 2),
      (WightmanField.lagrangeCoeff1 n k : ℂ) • sectorVec μ (n + 1) (w + (k : ℂ) • u) :
        momentumSector μ (n + 1)).1) (sectorVec μ (n + 1) y).1
  rw [inner_smul_right, AddSubmonoidClass.coe_finsetSum, sum_inner]
  change inner ℂ u y * inner ℂ (sectorVec μ n w) (sectorVec μ n y) = _
  rw [sectorVec_gram]
  have hterm (k : ℕ) :
      inner ℂ (((WightmanField.lagrangeCoeff1 n k : ℂ) •
          sectorVec μ (n + 1) (w + (k : ℂ) • u) : momentumSector μ (n + 1)).1)
        (sectorVec μ (n + 1) y).1 =
      (WightmanField.lagrangeCoeff1 n k : ℂ) *
        (inner ℂ w y + (k : ℂ) * inner ℂ u y) ^ (n + 1) / ((n + 1).factorial : ℂ) := by
    rw [Submodule.coe_smul, inner_smul_left, Complex.conj_ofReal]
    change (WightmanField.lagrangeCoeff1 n k : ℂ) *
      inner ℂ (sectorVec μ (n + 1) (w + (k : ℂ) • u)) (sectorVec μ (n + 1) y) = _
    rw [sectorVec_gram, inner_add_left, inner_smul_left]
    simp only [map_natCast]
    ring
  simp_rw [hterm]
  rw [← Finset.sum_div, WightmanField.lagrange_coeff1_pow n (inner ℂ w y) (inner ℂ u y)]
  rw [Nat.factorial_succ, Nat.cast_mul]
  have hn1 : ((n + 1 : ℕ) : ℂ) ≠ 0 := Nat.cast_ne_zero.mpr (Nat.succ_ne_zero n)
  field_simp [hn1]

theorem sectorAnnihil_comm (n : ℕ) (u v : Lp ℂ 2 μ) (ψ : momentumSector μ (n + 2)) :
    sectorAnnihil μ n u (sectorAnnihil μ (n + 1) v ψ) =
      sectorAnnihil μ n v (sectorAnnihil μ (n + 1) u ψ) := by
  have heq : (sectorAnnihil μ n u).comp (sectorAnnihil μ (n + 1) v) =
      (sectorAnnihil μ n v).comp (sectorAnnihil μ (n + 1) u) := by
    apply sector_clm_ext μ (n + 2)
    intro w
    simp only [ContinuousLinearMap.comp_apply, sectorAnnihil_sectorVec, map_smul, smul_smul,
      mul_comm]
  exact congrArg (fun T : momentumSector μ (n + 2) →L[ℂ] momentumSector μ n ↦ T ψ) heq

theorem sectorCreate_comm (n : ℕ) (u v : Lp ℂ 2 μ) (φ : momentumSector μ n) :
    sectorCreate μ (n + 1) u (sectorCreate μ n v φ) =
      sectorCreate μ (n + 1) v (sectorCreate μ n u φ) := by
  rw [← sub_eq_zero]
  apply MomentumFock.sectorVec_separates μ (n + 2)
  intro y
  rw [inner_sub_left, sub_eq_zero, sectorCreate_adjoint, sectorCreate_adjoint,
    sectorCreate_adjoint, sectorCreate_adjoint, sectorAnnihil_comm]

theorem sector_ccr_zero (u v : Lp ℂ 2 μ) (φ : momentumSector μ 0) :
    sectorAnnihil μ 0 u (sectorCreate μ 0 v φ) = inner ℂ u v • φ := by
  have heq : (sectorAnnihil μ 0 u).comp (sectorCreate μ 0 v) =
      inner ℂ u v • ContinuousLinearMap.id ℂ (momentumSector μ 0) := by
    apply sector_clm_ext μ 0
    intro z
    rw [← sub_eq_zero]
    apply MomentumFock.sectorVec_separates μ 0
    intro w
    change inner ℂ ((((sectorAnnihil μ 0 u).comp (sectorCreate μ 0 v) -
        inner ℂ u v • ContinuousLinearMap.id ℂ (momentumSector μ 0)) (sectorVec μ 0 z)).1)
      (sectorVec μ 0 w).1 = 0
    apply inner_eq_zero_symm.mpr
    change inner ℂ (sectorVec μ 0 w).1
      ((sectorAnnihil μ 0 u (sectorCreate μ 0 v (sectorVec μ 0 z))).1 -
        (inner ℂ u v • sectorVec μ 0 z).1) = 0
    rw [inner_sub_right, sub_eq_zero]
    change inner ℂ (sectorVec μ 0 w) (sectorAnnihil μ 0 u (sectorCreate μ 0 v (sectorVec μ 0 z))) =
      inner ℂ (sectorVec μ 0 w).1 ((inner ℂ u v) • (sectorVec μ 0 z).1)
    rw [← sectorCreate_adjoint, sectorCreate_sectorVec_lagrange, sectorCreate_sectorVec_lagrange,
      inner_smul_right]
    change inner ℂ ((∑ k ∈ Finset.range 2,
          (WightmanField.lagrangeCoeff1 0 k : ℂ) • sectorVec μ 1 (w + (k : ℂ) • u) :
            momentumSector μ 1).1)
        ((∑ j ∈ Finset.range 2,
          (WightmanField.lagrangeCoeff1 0 j : ℂ) • sectorVec μ 1 (z + (j : ℂ) • v) :
            momentumSector μ 1).1) =
      inner ℂ u v * inner ℂ (sectorVec μ 0 w) (sectorVec μ 0 z)
    rw [AddSubmonoidClass.coe_finsetSum, AddSubmonoidClass.coe_finsetSum, sum_inner, sectorVec_gram]
    simp only [pow_zero, Nat.factorial_zero, Nat.cast_one, div_one, mul_one]
    have hinner (k : ℕ) :
        inner ℂ (((WightmanField.lagrangeCoeff1 0 k : ℂ) •
            sectorVec μ 1 (w + (k : ℂ) • u) : momentumSector μ 1).1)
          (∑ j ∈ Finset.range 2,
            ((WightmanField.lagrangeCoeff1 0 j : ℂ) •
              sectorVec μ 1 (z + (j : ℂ) • v) : momentumSector μ 1).1) =
        (WightmanField.lagrangeCoeff1 0 k : ℂ) * (inner ℂ w v + (k : ℂ) * inner ℂ u v) := by
      rw [inner_sum]
      have hj (j : ℕ) :
          inner ℂ (((WightmanField.lagrangeCoeff1 0 k : ℂ) •
              sectorVec μ 1 (w + (k : ℂ) • u) : momentumSector μ 1).1)
            (((WightmanField.lagrangeCoeff1 0 j : ℂ) •
              sectorVec μ 1 (z + (j : ℂ) • v) : momentumSector μ 1).1) =
          (WightmanField.lagrangeCoeff1 0 k : ℂ) *
            ((WightmanField.lagrangeCoeff1 0 j : ℂ) *
              (inner ℂ (w + (k : ℂ) • u) z + (j : ℂ) * inner ℂ (w + (k : ℂ) • u) v) ^ 1) := by
        rw [Submodule.coe_smul, Submodule.coe_smul, inner_smul_left, inner_smul_right,
          Complex.conj_ofReal]
        change (WightmanField.lagrangeCoeff1 0 k : ℂ) *
          ((WightmanField.lagrangeCoeff1 0 j : ℂ) *
            inner ℂ (sectorVec μ 1 (w + (k : ℂ) • u)) (sectorVec μ 1 (z + (j : ℂ) • v))) = _
        rw [sectorVec_gram, inner_add_right, inner_smul_right]
        simp only [Nat.factorial_one, Nat.cast_one, div_one]
      simp_rw [hj]
      rw [← Finset.mul_sum, WightmanField.lagrange_coeff1_pow 0]
      simp only [zero_add, Nat.cast_one, one_mul, pow_zero, mul_one, inner_add_left,
        inner_smul_left, map_natCast]
    simp_rw [hinner]
    have h := WightmanField.lagrange_coeff1_mul_pow 0 (inner ℂ w v) (inner ℂ u v) 1 0
    simpa only [pow_zero, mul_one, Nat.cast_zero, zero_mul, add_zero] using h
  exact congrArg (fun T : momentumSector μ 0 →L[ℂ] momentumSector μ 0 ↦ T φ) heq

theorem sector_ccr_succ (n : ℕ) (u v : Lp ℂ 2 μ) (φ : momentumSector μ (n + 1)) :
    sectorAnnihil μ (n + 1) u (sectorCreate μ (n + 1) v φ) -
      sectorCreate μ n v (sectorAnnihil μ n u φ) = inner ℂ u v • φ := by
  have heq : (sectorAnnihil μ (n + 1) u).comp (sectorCreate μ (n + 1) v) -
      (sectorCreate μ n v).comp (sectorAnnihil μ n u) =
      inner ℂ u v • ContinuousLinearMap.id ℂ (momentumSector μ (n + 1)) := by
    apply sector_clm_ext μ (n + 1)
    intro z
    rw [← sub_eq_zero]
    apply MomentumFock.sectorVec_separates μ (n + 1)
    intro w
    change inner ℂ ((((sectorAnnihil μ (n + 1) u).comp (sectorCreate μ (n + 1) v) -
        (sectorCreate μ n v).comp (sectorAnnihil μ n u) -
        inner ℂ u v • ContinuousLinearMap.id ℂ (momentumSector μ (n + 1)))
          (sectorVec μ (n + 1) z)).1) (sectorVec μ (n + 1) w).1 = 0
    apply inner_eq_zero_symm.mpr
    change inner ℂ (sectorVec μ (n + 1) w).1
      (((sectorAnnihil μ (n + 1) u (sectorCreate μ (n + 1) v (sectorVec μ (n + 1) z))).1 -
          (sectorCreate μ n v (sectorAnnihil μ n u (sectorVec μ (n + 1) z))).1) -
        (inner ℂ u v • (sectorVec μ (n + 1) z).1)) = 0
    rw [inner_sub_right, sub_eq_zero]
    change inner ℂ (sectorVec μ (n + 1) w).1
        ((sectorAnnihil μ (n + 1) u (sectorCreate μ (n + 1) v (sectorVec μ (n + 1) z))).1 -
          (sectorCreate μ n v (sectorAnnihil μ n u (sectorVec μ (n + 1) z))).1) =
      inner ℂ (sectorVec μ (n + 1) w).1 (inner ℂ u v • (sectorVec μ (n + 1) z).1)
    rw [inner_sub_right, inner_smul_right]
    have h1 : inner ℂ (sectorVec μ (n + 1) w).1
        (sectorAnnihil μ (n + 1) u (sectorCreate μ (n + 1) v (sectorVec μ (n + 1) z))).1 =
      inner ℂ (sectorCreate μ (n + 1) u (sectorVec μ (n + 1) w)).1
        (sectorCreate μ (n + 1) v (sectorVec μ (n + 1) z)).1 :=
      (sectorCreate_adjoint μ (n + 1) u (sectorVec μ (n + 1) w)
        (sectorCreate μ (n + 1) v (sectorVec μ (n + 1) z))).symm
    have h2 : inner ℂ (sectorVec μ (n + 1) w).1
        (sectorCreate μ n v (sectorAnnihil μ n u (sectorVec μ (n + 1) z))).1 =
      inner ℂ w v * inner ℂ u z * ((inner ℂ w z) ^ n / (n.factorial : ℂ)) := by
      rw [sectorCreate_adjoint_right, sectorAnnihil_sectorVec, sectorAnnihil_sectorVec]
      change inner ℂ (inner ℂ v w • (sectorVec μ n w).1) (inner ℂ u z • (sectorVec μ n z).1) = _
      rw [inner_smul_left, inner_smul_right, inner_conj_symm]
      change inner ℂ w v * (inner ℂ u z * inner ℂ (sectorVec μ n w) (sectorVec μ n z)) = _
      rw [sectorVec_gram]; ring
    rw [h1, h2, sectorCreate_sectorVec_lagrange, sectorCreate_sectorVec_lagrange]
    rw [AddSubmonoidClass.coe_finsetSum, AddSubmonoidClass.coe_finsetSum, sum_inner]
    change (∑ k ∈ Finset.range (n + 3), _) - _ =
      inner ℂ u v * inner ℂ (sectorVec μ (n + 1) w) (sectorVec μ (n + 1) z)
    rw [sectorVec_gram]
    have hinner (k : ℕ) :
        inner ℂ (((WightmanField.lagrangeCoeff1 (n + 1) k : ℂ) •
            sectorVec μ (n + 2) (w + (k : ℂ) • u) : momentumSector μ (n + 2)).1)
          (∑ j ∈ Finset.range (n + 3),
            ((WightmanField.lagrangeCoeff1 (n + 1) j : ℂ) •
              sectorVec μ (n + 2) (z + (j : ℂ) • v) : momentumSector μ (n + 2)).1) =
        ((WightmanField.lagrangeCoeff1 (n + 1) k : ℂ) *
          ((inner ℂ w v + (k : ℂ) * inner ℂ u v) *
            (inner ℂ w z + (k : ℂ) * inner ℂ u z) ^ (n + 1))) / ((n + 1).factorial : ℂ) := by
      rw [inner_sum]
      have hj (j : ℕ) :
          inner ℂ (((WightmanField.lagrangeCoeff1 (n + 1) k : ℂ) •
              sectorVec μ (n + 2) (w + (k : ℂ) • u) : momentumSector μ (n + 2)).1)
            (((WightmanField.lagrangeCoeff1 (n + 1) j : ℂ) •
              sectorVec μ (n + 2) (z + (j : ℂ) • v) : momentumSector μ (n + 2)).1) =
          ((WightmanField.lagrangeCoeff1 (n + 1) k : ℂ) / ((n + 2).factorial : ℂ)) *
            ((WightmanField.lagrangeCoeff1 (n + 1) j : ℂ) *
              (inner ℂ (w + (k : ℂ) • u) z + (j : ℂ) * inner ℂ (w + (k : ℂ) • u) v) ^ (n + 2)) := by
        rw [Submodule.coe_smul, Submodule.coe_smul, inner_smul_left, inner_smul_right,
          Complex.conj_ofReal]
        change (WightmanField.lagrangeCoeff1 (n + 1) k : ℂ) *
          ((WightmanField.lagrangeCoeff1 (n + 1) j : ℂ) *
            inner ℂ (sectorVec μ (n + 2) (w + (k : ℂ) • u))
              (sectorVec μ (n + 2) (z + (j : ℂ) • v))) = _
        rw [sectorVec_gram, inner_add_right, inner_smul_right]
        ring
      simp_rw [hj]
      rw [← Finset.mul_sum, WightmanField.lagrange_coeff1_pow (n + 1)]
      have hfac : ((n + 2).factorial : ℂ) = ((n + 2 : ℕ) : ℂ) * ((n + 1).factorial : ℂ) := by
        rw [Nat.factorial_succ, Nat.cast_mul]
      have hn2 : ((n + 2 : ℕ) : ℂ) ≠ 0 := Nat.cast_ne_zero.mpr (Nat.succ_ne_zero _)
      simp only [inner_add_left, inner_smul_left, map_natCast, hfac]
      field_simp [hn2]
    simp_rw [hinner]
    rw [← Finset.sum_div,
      WightmanField.lagrange_coeff1_mul_pow (n + 1) (inner ℂ w v) (inner ℂ u v)
        (inner ℂ w z) (inner ℂ u z)]
    simp only [Nat.add_sub_cancel]
    have hfac1 : ((n + 1).factorial : ℂ) = ((n + 1 : ℕ) : ℂ) * (n.factorial : ℂ) := by
      rw [Nat.factorial_succ, Nat.cast_mul]
    have hn1 : ((n + 1 : ℕ) : ℂ) ≠ 0 := Nat.cast_ne_zero.mpr (Nat.succ_ne_zero _)
    have hnf : (n.factorial : ℂ) ≠ 0 := Nat.cast_ne_zero.mpr (Nat.factorial_ne_zero n)
    rw [hfac1]
    field_simp [hn1, hnf]
    ring
  exact congrArg (fun T : momentumSector μ (n + 1) →L[ℂ] momentumSector μ (n + 1) ↦ T φ) heq

/-- Helper: any sequence of sector vectors vanishing above `N` belongs to `Memℓp _ 2`. -/
private theorem memℓp_of_eventually_zero (f : ∀ n : ℕ, momentumSector μ n)
    (N : ℕ) (hN : ∀ n, N < n → f n = 0) : Memℓp f 2 := by
  apply memℓp_gen
  refine summable_of_ne_finset_zero (s := Finset.range (N + 1)) fun n hn ↦ ?_
  have hgt : N < n := by
    rw [Finset.mem_range] at hn
    omega
  rw [hN n hgt, norm_zero, Real.zero_rpow (by norm_num)]

/-- Ambient-space vector for `contCreate μ u ψ`. -/
noncomputable def contCreateVec (u : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ) : momentumFock μ :=
  let seq : ∀ n : ℕ, momentumSector μ n := fun n ↦
    match n with
    | 0 => 0
    | k + 1 => sectorCreate μ k u (ψ.1 k)
  ⟨seq, memℓp_of_eventually_zero μ seq (ψ.2.choose + 1) fun n hn ↦ by
    cases n with
    | zero => exact absurd hn (Nat.not_lt_zero _)
    | succ k =>
      change sectorCreate μ k u (ψ.1 k) = 0
      rw [ψ.2.choose_spec k (Nat.lt_of_succ_lt_succ hn), map_zero]⟩

private theorem contCreateVec_mem (u : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ) :
    contCreateVec μ u ψ ∈ FiniteParticleFock μ := by
  refine ⟨ψ.2.choose + 1, fun n hn ↦ ?_⟩
  cases n with
  | zero => exact absurd hn (Nat.not_lt_zero _)
  | succ k =>
    change sectorCreate μ k u (ψ.1 k) = 0
    rw [ψ.2.choose_spec k (Nat.lt_of_succ_lt_succ hn), map_zero]

/-- Ambient-space vector for `contAnnihil μ u ψ`. -/
noncomputable def contAnnihilVec (u : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ) : momentumFock μ :=
  let seq : ∀ n : ℕ, momentumSector μ n := fun n ↦ sectorAnnihil μ n u (ψ.1 (n + 1))
  ⟨seq, memℓp_of_eventually_zero μ seq ψ.2.choose fun n hn ↦ by
    change sectorAnnihil μ n u (ψ.1 (n + 1)) = 0
    rw [ψ.2.choose_spec (n + 1) (Nat.lt_succ_of_lt hn), map_zero]⟩

private theorem contAnnihilVec_mem (u : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ) :
    contAnnihilVec μ u ψ ∈ FiniteParticleFock μ := by
  refine ⟨ψ.2.choose, fun n hn ↦ ?_⟩
  change sectorAnnihil μ n u (ψ.1 (n + 1)) = 0
  rw [ψ.2.choose_spec (n + 1) (Nat.lt_succ_of_lt hn), map_zero]

/-- Concrete bosonic creation operator `c*(u)` on `FiniteParticleFock μ`. -/
noncomputable def contCreate (u : Lp ℂ 2 μ) :
    FiniteParticleFock μ →ₗ[ℂ] FiniteParticleFock μ where
  toFun ψ := ⟨contCreateVec μ u ψ, contCreateVec_mem μ u ψ⟩
  map_add' ψ φ := by
    apply Subtype.ext; apply lp.ext; funext n
    cases n with
    | zero =>
      change (0 : momentumSector μ 0) = 0 + 0
      simp
    | succ k =>
      change sectorCreate μ k u (ψ.1 k + φ.1 k) =
        sectorCreate μ k u (ψ.1 k) + sectorCreate μ k u (φ.1 k)
      exact (sectorCreate μ k u).map_add (ψ.1 k) (φ.1 k)
  map_smul' c ψ := by
    apply Subtype.ext; apply lp.ext; funext n
    cases n with
    | zero =>
      change (0 : momentumSector μ 0) = c • 0
      simp
    | succ k =>
      change sectorCreate μ k u (c • ψ.1 k) = c • sectorCreate μ k u (ψ.1 k)
      exact (sectorCreate μ k u).map_smul c (ψ.1 k)

/-- Concrete bosonic annihilation operator `c(u)` on `FiniteParticleFock μ`. -/
noncomputable def contAnnihil (u : Lp ℂ 2 μ) :
    FiniteParticleFock μ →ₗ[ℂ] FiniteParticleFock μ where
  toFun ψ := ⟨contAnnihilVec μ u ψ, contAnnihilVec_mem μ u ψ⟩
  map_add' ψ φ := by
    apply Subtype.ext; apply lp.ext; funext n
    change sectorAnnihil μ n u (ψ.1 (n + 1) + φ.1 (n + 1)) =
      sectorAnnihil μ n u (ψ.1 (n + 1)) + sectorAnnihil μ n u (φ.1 (n + 1))
    exact (sectorAnnihil μ n u).map_add (ψ.1 (n + 1)) (φ.1 (n + 1))
  map_smul' c ψ := by
    apply Subtype.ext; apply lp.ext; funext n
    change sectorAnnihil μ n u (c • ψ.1 (n + 1)) = c • sectorAnnihil μ n u (ψ.1 (n + 1))
    exact (sectorAnnihil μ n u).map_smul c (ψ.1 (n + 1))

/-- Concrete bosonic quantum field operator `Φ(f) = c*(u_f) + c(u_{f̄})` on `FiniteParticleFock μ`. -/
noncomputable def contField (u ubar : Lp ℂ 2 μ) :
    FiniteParticleFock μ →ₗ[ℂ] FiniteParticleFock μ :=
  contCreate μ u + contAnnihil μ ubar

@[simp]
theorem contCreate_apply_zero (u : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ) :
    (contCreate μ u ψ).1 0 = 0 := rfl

@[simp]
theorem contCreate_apply_succ (u : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ) (n : ℕ) :
    (contCreate μ u ψ).1 (n + 1) = sectorCreate μ n u (ψ.1 n) := rfl

@[simp]
theorem contAnnihil_apply (u : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ) (n : ℕ) :
    (contAnnihil μ u ψ).1 n = sectorAnnihil μ n u (ψ.1 (n + 1)) := rfl

/-- Annihilation kills the Fock vacuum: `c(u) Ω = 0`. -/
theorem contAnnihil_vacuum (u : Lp ℂ 2 μ) :
    contAnnihil μ u (fockVacuumFin μ) = 0 := by
  apply Subtype.ext; apply lp.ext; funext n
  change sectorAnnihil μ n u (sectorVec μ (n + 1) 0) = 0
  rw [MomentumFock.sectorVec_succ_zero, map_zero]

/-- Creation norm bound on a pure `n`-particle state: `‖c*(u) ψ_n‖ ≤ √(n + 1) ‖u‖ ‖ψ_n‖`. -/
theorem contCreate_norm_le (u : Lp ℂ 2 μ) (n : ℕ) (y : momentumSector μ n) :
    ‖(contCreate μ u (embedSectorFin μ n y)).1‖ ≤ Real.sqrt ((n + 1 : ℕ) : ℝ) * ‖u‖ * ‖y‖ := by
  have heq : (contCreate μ u (embedSectorFin μ n y)).1 =
      embedSector μ (n + 1) (sectorCreate μ n u y) := by
    apply lp.ext; funext m
    cases m with
    | zero =>
      rw [contCreate_apply_zero, embedSector_apply_ne μ (Nat.zero_ne_add_one n)]
    | succ k =>
      rw [contCreate_apply_succ]
      by_cases hk : k = n
      · subst hk; simp [embedSectorFin]
      · rw [embedSector_apply_ne μ (Nat.succ_ne_succ_iff.mpr hk)]
        change sectorCreate μ k u (embedSector μ n y k) = 0
        rw [embedSector_apply_ne μ hk, map_zero]
  rw [heq, embedSector_norm]
  exact sectorCreate_norm_le μ n u y

/-- Annihilation norm bound on a pure `n`-particle state: `‖c(u) ψ_n‖ ≤ √n ‖u‖ ‖ψ_n‖`. -/
theorem contAnnihil_norm_le (u : Lp ℂ 2 μ) (n : ℕ) (y : momentumSector μ n) :
    ‖(contAnnihil μ u (embedSectorFin μ n y)).1‖ ≤ Real.sqrt (n : ℝ) * ‖u‖ * ‖y‖ := by
  cases n with
  | zero =>
    have h0 : (contAnnihil μ u (embedSectorFin μ 0 y)).1 = 0 := by
      apply lp.ext; funext m
      rw [contAnnihil_apply]
      change sectorAnnihil μ m u (embedSector μ 0 y (m + 1)) = 0
      rw [embedSector_apply_ne μ (Nat.succ_ne_zero m), map_zero]
    rw [h0, norm_zero]; positivity
  | succ k =>
    have heq : (contAnnihil μ u (embedSectorFin μ (k + 1) y)).1 =
        embedSector μ k (sectorAnnihil μ k u y) := by
      apply lp.ext; funext m
      rw [contAnnihil_apply]
      by_cases hm : m = k
      · subst hm; simp [embedSectorFin]
      · rw [embedSector_apply_ne μ hm]
        change sectorAnnihil μ m u (embedSector μ (k + 1) y (m + 1)) = 0
        rw [embedSector_apply_ne μ (Nat.succ_ne_succ_iff.mpr hm), map_zero]
    rw [heq, embedSector_norm]
    exact sectorAnnihil_norm_le μ k u y

private theorem lp_shifted_up_norm_le {E : ℕ → Type*} [∀ n, NormedAddCommGroup (E n)]
    (φ ψ : lp E 2) {C : ℝ} (hC : 0 ≤ C)
    (h0 : φ 0 = 0) (hstep : ∀ n : ℕ, ‖φ (n + 1)‖ ≤ C * ‖ψ n‖) :
    ‖φ‖ ≤ C * ‖ψ‖ := by
  have h2 : (2 : ENNReal).toReal = 2 := by norm_num
  have hψ : Summable (fun n ↦ ‖ψ n‖ ^ 2) := by
    simpa only [h2, Real.rpow_two] using (lp.memℓp ψ).summable (by norm_num)
  have hφ : Summable (fun n ↦ ‖φ n‖ ^ 2) := by
    simpa only [h2, Real.rpow_two] using (lp.memℓp φ).summable (by norm_num)
  have hφnorm := lp.norm_rpow_eq_tsum (by norm_num : 0 < (2 : ENNReal).toReal) φ
  have hψnorm := lp.norm_rpow_eq_tsum (by norm_num : 0 < (2 : ENNReal).toReal) ψ
  simp only [h2, Real.rpow_two] at hφnorm hψnorm
  have hsq : ‖φ‖ ^ 2 ≤ (C * ‖ψ‖) ^ 2 := by
    rw [hφnorm, hφ.tsum_eq_zero_add, h0, norm_zero, zero_pow (by norm_num),
      zero_add, mul_pow, hψnorm, ← tsum_mul_left]
    refine Summable.tsum_le_tsum (fun n ↦ ?_) ((summable_nat_add_iff 1).mpr hφ) (hψ.mul_left _)
    rw [← mul_pow]
    exact pow_le_pow_left₀ (norm_nonneg _) (hstep n) 2
  nlinarith [norm_nonneg φ, mul_nonneg hC (norm_nonneg ψ)]

private theorem lp_shifted_down_norm_le {E : ℕ → Type*} [∀ n, NormedAddCommGroup (E n)]
    (φ ψ : lp E 2) {C : ℝ} (hC : 0 ≤ C)
    (hstep : ∀ n : ℕ, ‖φ n‖ ≤ C * ‖ψ (n + 1)‖) :
    ‖φ‖ ≤ C * ‖ψ‖ := by
  have h2 : (2 : ENNReal).toReal = 2 := by norm_num
  have hψ : Summable (fun n ↦ ‖ψ n‖ ^ 2) := by
    simpa only [h2, Real.rpow_two] using (lp.memℓp ψ).summable (by norm_num)
  have hφ : Summable (fun n ↦ ‖φ n‖ ^ 2) := by
    simpa only [h2, Real.rpow_two] using (lp.memℓp φ).summable (by norm_num)
  have hφnorm := lp.norm_rpow_eq_tsum (by norm_num : 0 < (2 : ENNReal).toReal) φ
  have hψnorm := lp.norm_rpow_eq_tsum (by norm_num : 0 < (2 : ENNReal).toReal) ψ
  simp only [h2, Real.rpow_two] at hφnorm hψnorm
  have hsq : ‖φ‖ ^ 2 ≤ (C * ‖ψ‖) ^ 2 := by
    rw [hφnorm, mul_pow, hψnorm, hψ.tsum_eq_zero_add, mul_add]
    have htail : ∑' n, ‖φ n‖ ^ 2 ≤ C ^ 2 * ∑' n, ‖ψ (n + 1)‖ ^ 2 := by
      rw [← tsum_mul_left]
      refine Summable.tsum_le_tsum (fun n ↦ ?_) hφ (((summable_nat_add_iff 1).mpr hψ).mul_left _)
      rw [← mul_pow]
      exact pow_le_pow_left₀ (norm_nonneg _) (hstep n) 2
    linarith [mul_nonneg (sq_nonneg C) (sq_nonneg ‖ψ 0‖)]
  nlinarith [norm_nonneg φ, mul_nonneg hC (norm_nonneg ψ)]

/-- Uniform finite-particle norm bound for `contCreate` on states supported in sectors `≤ N`. -/
theorem contCreate_fin_norm_le (u : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ)
    (N : ℕ) (hN : ∀ n, N < n → ψ.1 n = 0) :
    ‖(contCreate μ u ψ).1‖ ≤ Real.sqrt ((N + 1 : ℕ) : ℝ) * ‖u‖ * ‖ψ.1‖ := by
  refine lp_shifted_up_norm_le (contCreate μ u ψ).1 ψ.1 (by positivity)
    (contCreate_apply_zero μ u ψ) fun n ↦ ?_
  rw [contCreate_apply_succ]
  by_cases hn : n ≤ N
  · have hle := sectorCreate_norm_le μ n u (ψ.1 n)
    have hsqrt : Real.sqrt ((n + 1 : ℕ) : ℝ) ≤ Real.sqrt ((N + 1 : ℕ) : ℝ) :=
      Real.sqrt_le_sqrt (by exact_mod_cast Nat.succ_le_succ hn)
    exact hle.trans (mul_le_mul_of_nonneg_right
      (mul_le_mul_of_nonneg_right hsqrt (norm_nonneg u)) (norm_nonneg _))
  · rw [hN n (Nat.lt_of_not_le hn), map_zero, norm_zero]
    positivity

/-- Uniform finite-particle norm bound for `contAnnihil` on states supported in sectors `≤ N`. -/
theorem contAnnihil_fin_norm_le (u : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ)
    (N : ℕ) (hN : ∀ n, N < n → ψ.1 n = 0) :
    ‖(contAnnihil μ u ψ).1‖ ≤ Real.sqrt (N : ℝ) * ‖u‖ * ‖ψ.1‖ := by
  refine lp_shifted_down_norm_le (contAnnihil μ u ψ).1 ψ.1 (by positivity) fun n ↦ ?_
  rw [contAnnihil_apply]
  by_cases hn : n + 1 ≤ N
  · have hle := sectorAnnihil_norm_le μ n u (ψ.1 (n + 1))
    have hsqrt : Real.sqrt ((n + 1 : ℕ) : ℝ) ≤ Real.sqrt (N : ℝ) :=
      Real.sqrt_le_sqrt (by exact_mod_cast hn)
    exact hle.trans (mul_le_mul_of_nonneg_right
      (mul_le_mul_of_nonneg_right hsqrt (norm_nonneg u)) (norm_nonneg _))
  · rw [hN (n + 1) (Nat.lt_of_not_le hn), map_zero, norm_zero]
    positivity

theorem contCreate_add_test (u v : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ) :
    contCreate μ (u + v) ψ = contCreate μ u ψ + contCreate μ v ψ := by
  apply Subtype.ext; apply lp.ext; funext n
  cases n with
  | zero =>
    change (0 : momentumSector μ 0) = 0 + 0
    simp
  | succ k =>
    change sectorCreate μ k (u + v) (ψ.1 k) =
      sectorCreate μ k u (ψ.1 k) + sectorCreate μ k v (ψ.1 k)
    rw [sectorCreate_add]; rfl

theorem contCreate_smul_test (c : ℂ) (u : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ) :
    contCreate μ (c • u) ψ = c • contCreate μ u ψ := by
  apply Subtype.ext; apply lp.ext; funext n
  cases n with
  | zero =>
    change (0 : momentumSector μ 0) = c • 0
    simp
  | succ k =>
    change sectorCreate μ k (c • u) (ψ.1 k) = c • sectorCreate μ k u (ψ.1 k)
    rw [sectorCreate_smul]; rfl

theorem contCreate_sub_test (u v : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ) :
    contCreate μ (u - v) ψ = contCreate μ u ψ - contCreate μ v ψ := by
  apply Subtype.ext; apply lp.ext; funext n
  cases n with
  | zero =>
    change (0 : momentumSector μ 0) = 0 - 0
    simp
  | succ k =>
    change sectorCreate μ k (u - v) (ψ.1 k) =
      sectorCreate μ k u (ψ.1 k) - sectorCreate μ k v (ψ.1 k)
    rw [sectorCreate_sub]; rfl

theorem contAnnihil_add_test (u v : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ) :
    contAnnihil μ (u + v) ψ = contAnnihil μ u ψ + contAnnihil μ v ψ := by
  apply Subtype.ext; apply lp.ext; funext n
  change sectorAnnihil μ n (u + v) (ψ.1 (n + 1)) =
    sectorAnnihil μ n u (ψ.1 (n + 1)) + sectorAnnihil μ n v (ψ.1 (n + 1))
  rw [sectorAnnihil_add]; rfl

theorem contAnnihil_smul_test (c : ℂ) (u : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ) :
    contAnnihil μ (c • u) ψ = star c • contAnnihil μ u ψ := by
  apply Subtype.ext; apply lp.ext; funext n
  change sectorAnnihil μ n (c • u) (ψ.1 (n + 1)) = star c • sectorAnnihil μ n u (ψ.1 (n + 1))
  rw [sectorAnnihil_smul]; rfl

theorem contAnnihil_sub_test (u v : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ) :
    contAnnihil μ (u - v) ψ = contAnnihil μ u ψ - contAnnihil μ v ψ := by
  apply Subtype.ext; apply lp.ext; funext n
  change sectorAnnihil μ n (u - v) (ψ.1 (n + 1)) =
    sectorAnnihil μ n u (ψ.1 (n + 1)) - sectorAnnihil μ n v (ψ.1 (n + 1))
  rw [sectorAnnihil_sub]; rfl

private theorem continuous_of_sub_bound {E F : Type*} [SeminormedAddCommGroup E]
    [SeminormedAddCommGroup F] (f : E → F) (C : ℝ) (hC : 0 ≤ C)
    (h : ∀ u v, ‖f u - f v‖ ≤ C * ‖u - v‖) : Continuous f := by
  refine LipschitzWith.continuous (K := Real.toNNReal C) ?_
  rw [lipschitzWith_iff_dist_le_mul]
  intro u v
  rw [dist_eq_norm, dist_eq_norm, Real.coe_toNNReal C hC]
  exact h u v

private theorem submodule_coe_sub_eq {H : Type*} [AddCommGroup H] [Module ℂ H]
    (S : Submodule ℂ H) {x y z : S} (h : x - y = z) : x.1 - y.1 = z.1 := by
  rw [← h]; rfl

/-- Continuity of `u ↦ c*(u) ψ` in the one-particle `L²` norm for every `ψ ∈ FiniteParticleFock μ`. -/
theorem contCreate_continuous_in_test (ψ : FiniteParticleFock μ) :
    Continuous (fun u : Lp ℂ 2 μ ↦ (contCreate μ u ψ).1) := by
  obtain ⟨N, hN⟩ := ψ.2
  refine continuous_of_sub_bound (fun u : Lp ℂ 2 μ ↦ (contCreate μ u ψ).1)
    (Real.sqrt ((N + 1 : ℕ) : ℝ) * ‖ψ.1‖) (by positivity) fun u v ↦ ?_
  rw [submodule_coe_sub_eq (FiniteParticleFock μ) (contCreate_sub_test μ u v ψ).symm]
  calc ‖(contCreate μ (u - v) ψ).1‖
      ≤ Real.sqrt ((N + 1 : ℕ) : ℝ) * ‖u - v‖ * ‖ψ.1‖ := contCreate_fin_norm_le μ (u - v) ψ N hN
    _ = Real.sqrt ((N + 1 : ℕ) : ℝ) * ‖ψ.1‖ * ‖u - v‖ := by ring

/-- Continuity of `u ↦ c(u) ψ` in the one-particle `L²` norm for every `ψ ∈ FiniteParticleFock μ`. -/
theorem contAnnihil_continuous_in_test (ψ : FiniteParticleFock μ) :
    Continuous (fun u : Lp ℂ 2 μ ↦ (contAnnihil μ u ψ).1) := by
  obtain ⟨N, hN⟩ := ψ.2
  refine continuous_of_sub_bound (fun u : Lp ℂ 2 μ ↦ (contAnnihil μ u ψ).1)
    (Real.sqrt (N : ℝ) * ‖ψ.1‖) (by positivity) fun u v ↦ ?_
  rw [submodule_coe_sub_eq (FiniteParticleFock μ) (contAnnihil_sub_test μ u v ψ).symm]
  calc ‖(contAnnihil μ (u - v) ψ).1‖
      ≤ Real.sqrt (N : ℝ) * ‖u - v‖ * ‖ψ.1‖ := contAnnihil_fin_norm_le μ (u - v) ψ N hN
    _ = Real.sqrt (N : ℝ) * ‖ψ.1‖ * ‖u - v‖ := by ring

private theorem fock_shifted_inner_eq (x y a b : momentumFock μ)
    (hx0 : x 0 = 0) (hstep : ∀ n : ℕ, inner ℂ (x (n + 1)) (b (n + 1)) = inner ℂ (a n) (y n)) :
    inner ℂ x b = inner ℂ a y := by
  rw [lp.inner_eq_tsum, lp.inner_eq_tsum]
  have hsum : Summable (fun n ↦ inner ℂ (x n) (b n)) := (lp.hasSum_inner (𝕜 := ℂ) x b).summable
  rw [hsum.tsum_eq_zero_add, hx0, inner_zero_left, zero_add]
  exact tsum_congr hstep

/-- Formal adjointness `⟪c*(u) φ, ψ⟫ = ⟪φ, c(u) ψ⟫` on `FiniteParticleFock μ`. -/
theorem contCreate_adjoint (u : Lp ℂ 2 μ) (φ ψ : FiniteParticleFock μ) :
    inner ℂ (contCreate μ u φ).1 ψ.1 = inner ℂ φ.1 (contAnnihil μ u ψ).1 :=
  fock_shifted_inner_eq μ (contCreate μ u φ).1 (contAnnihil μ u ψ).1 φ.1 ψ.1
    (contCreate_apply_zero μ u φ) fun n ↦ by
      rw [contCreate_apply_succ, contAnnihil_apply, sectorCreate_adjoint]

/-- Canonical commutation relations `[c(u), c*(v)] = ⟪u, v⟫ I` on `FiniteParticleFock μ`. -/
theorem cont_ccr (u v : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ) :
    contAnnihil μ u (contCreate μ v ψ) - contCreate μ v (contAnnihil μ u ψ) =
      inner ℂ u v • ψ := by
  apply Subtype.ext; apply lp.ext; funext n
  cases n with
  | zero =>
    change sectorAnnihil μ 0 u (sectorCreate μ 0 v (ψ.1 0)) - 0 = inner ℂ u v • ψ.1 0
    rw [sub_zero, sector_ccr_zero]
  | succ k =>
    change sectorAnnihil μ (k + 1) u (sectorCreate μ (k + 1) v (ψ.1 (k + 1))) -
      sectorCreate μ k v (sectorAnnihil μ k u (ψ.1 (k + 1))) = inner ℂ u v • ψ.1 (k + 1)
    exact sector_ccr_succ μ k u v (ψ.1 (k + 1))

private theorem contCreate_comm (u v : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ) :
    contCreate μ u (contCreate μ v ψ) = contCreate μ v (contCreate μ u ψ) := by
  apply Subtype.ext; apply lp.ext; funext n
  cases n with
  | zero => rfl
  | succ k =>
    cases k with
    | zero =>
      change sectorCreate μ 0 u 0 = sectorCreate μ 0 v 0
      simp
    | succ m =>
      change sectorCreate μ (m + 1) u (sectorCreate μ m v (ψ.1 m)) =
        sectorCreate μ (m + 1) v (sectorCreate μ m u (ψ.1 m))
      exact sectorCreate_comm μ m u v (ψ.1 m)

private theorem contAnnihil_comm (u v : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ) :
    contAnnihil μ u (contAnnihil μ v ψ) = contAnnihil μ v (contAnnihil μ u ψ) := by
  apply Subtype.ext; apply lp.ext; funext n
  change sectorAnnihil μ n u (sectorAnnihil μ (n + 1) v (ψ.1 (n + 2))) =
    sectorAnnihil μ n v (sectorAnnihil μ (n + 1) u (ψ.1 (n + 2)))
  exact sectorAnnihil_comm μ n u v (ψ.1 (n + 2))

private theorem field_symm_of_adjoint {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    {a b c d x y : H} (hadj1 : inner ℂ a y = inner ℂ x d) (hadj2 : inner ℂ c x = inner ℂ y b) :
    inner ℂ (a + b) y = inner ℂ x (c + d) := by
  rw [inner_add_left, inner_add_right, hadj1]
  have h2 : inner ℂ b y = inner ℂ x c := by
    rw [← inner_conj_symm, ← hadj2, inner_conj_symm]
  rw [h2, add_comm]

private theorem field_commutator_alg {M : Type*} [AddCommGroup M] [Module ℂ M]
    (C₁ C₂ A₁ A₂ : M →ₗ[ℂ] M) (α β : ℂ) (ψ : M)
    (hcc : C₁ (C₂ ψ) = C₂ (C₁ ψ))
    (haa : A₁ (A₂ ψ) = A₂ (A₁ ψ))
    (hcr1 : A₁ (C₂ ψ) - C₂ (A₁ ψ) = α • ψ)
    (hcr2 : A₂ (C₁ ψ) - C₁ (A₂ ψ) = β • ψ) :
    (C₁ + A₁) ((C₂ + A₂) ψ) - (C₂ + A₂) ((C₁ + A₁) ψ) = (α - β) • ψ := by
  simp only [LinearMap.add_apply, map_add, sub_smul]
  rw [← hcr1, ← hcr2, hcc, haa]
  abel

theorem contField_coe (u ubar : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ) :
    (contField μ u ubar ψ).1 = (contCreate μ u ψ).1 + (contAnnihil μ ubar ψ).1 := rfl

/-- Hermitian symmetry of the bosonic field `Φ(f)` for real tests (`u_{f̄} = u_f`). -/
theorem contField_symm (u : Lp ℂ 2 μ) (φ ψ : FiniteParticleFock μ) :
    inner ℂ (contField μ u u φ).1 ψ.1 = inner ℂ φ.1 (contField μ u u ψ).1 := by
  rw [contField_coe, contField_coe]
  exact field_symm_of_adjoint (contCreate_adjoint μ u φ ψ) (contCreate_adjoint μ u ψ φ)

/-- Exact field commutator `[Φ(f), Φ(f')] = (⟪u_{f̄}, u_{f'}⟫ - ⟪u_{f̄'}, u_f⟫) I` on
`FiniteParticleFock μ`. -/
theorem contField_commutator (u ubar v vbar : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ) :
    contField μ u ubar (contField μ v vbar ψ) - contField μ v vbar (contField μ u ubar ψ) =
      (inner ℂ ubar v - inner ℂ vbar u) • ψ :=
  field_commutator_alg (contCreate μ u) (contCreate μ v) (contAnnihil μ ubar) (contAnnihil μ vbar)
    (inner ℂ ubar v) (inner ℂ vbar u) ψ
    (contCreate_comm μ u v ψ) (contAnnihil_comm μ ubar vbar ψ)
    (cont_ccr μ ubar v ψ) (cont_ccr μ vbar u ψ)

private theorem contCreate_embedSector_self (k : ℕ) (u : Lp ℂ 2 μ) :
    contCreate μ u (embedSectorFin μ k (sectorVec μ k u)) =
      ((k + 1 : ℕ) : ℂ) • embedSectorFin μ (k + 1) (sectorVec μ (k + 1) u) := by
  apply Subtype.ext; apply lp.ext; funext m
  cases m with
  | zero =>
    change (0 : momentumSector μ 0) =
      ((k + 1 : ℕ) : ℂ) • embedSector μ (k + 1) (sectorVec μ (k + 1) u) 0
    rw [embedSector_apply_ne μ (Nat.zero_ne_add_one k), smul_zero]
  | succ j =>
    change sectorCreate μ j u (embedSector μ k (sectorVec μ k u) j) =
      ((k + 1 : ℕ) : ℂ) • embedSector μ (k + 1) (sectorVec μ (k + 1) u) (j + 1)
    by_cases hjk : j = k
    · subst hjk
      rw [embedSector_apply_self, embedSector_apply_self, sectorCreate_sectorVec_self]
    · rw [embedSector_apply_ne μ hjk, map_zero,
        embedSector_apply_ne μ (Nat.succ_ne_succ_iff.mpr hjk), smul_zero]

private theorem contAnnihil_embedSector_zero (u : Lp ℂ 2 μ) :
    contAnnihil μ u (embedSectorFin μ 0 (sectorVec μ 0 u)) = 0 := by
  apply Subtype.ext; apply lp.ext; funext m
  change sectorAnnihil μ m u (embedSector μ 0 (sectorVec μ 0 u) (m + 1)) = 0
  rw [embedSector_apply_ne μ (Nat.succ_ne_zero m), map_zero]

private theorem contAnnihil_embedSector_succ_self (p : ℕ) (u : Lp ℂ 2 μ) :
    contAnnihil μ u (embedSectorFin μ (p + 1) (sectorVec μ (p + 1) u)) =
      inner ℂ u u • embedSectorFin μ p (sectorVec μ p u) := by
  apply Subtype.ext; apply lp.ext; funext m
  change sectorAnnihil μ m u (embedSector μ (p + 1) (sectorVec μ (p + 1) u) (m + 1)) =
    inner ℂ u u • embedSector μ p (sectorVec μ p u) m
  by_cases hmp : m = p
  · subst hmp
    rw [embedSector_apply_self, embedSector_apply_self, sectorAnnihil_sectorVec]
  · rw [embedSector_apply_ne μ (Nat.succ_ne_succ_iff.mpr hmp), map_zero,
      embedSector_apply_ne μ hmp, smul_zero]

private theorem mem_of_add_mem_smul {M : Type*} [AddCommGroup M] [Module ℂ M]
    (W : Submodule ℂ M) {x y z : M} {c : ℂ} (hc : c ≠ 0)
    (hsum : x + y ∈ W) (hy : y ∈ W) (hx : x = c • z) : z ∈ W := by
  have h1 : c • z ∈ W := by
    have h := W.sub_mem hsum hy
    rwa [add_sub_cancel_right, hx] at h
  have h2 := W.smul_mem c⁻¹ h1
  rwa [smul_smul, inv_mul_cancel₀ hc, one_smul] at h2

/-- Vacuum cyclicity of the Hermitian field `Φ(J a) = c*(J a) + c(J a)` on `momentumFock μ`:
for any `ℝ`-linear feature map `J : R →ₗ[ℝ] L²(μ)` with dense complex span in `L²(μ)`,
the complex span of finite field-monomial states `Φ(J a₁) ⋯ Φ(J aₖ) Ω` is dense in
`momentumFock μ`. -/
theorem contField_vacuum_cyclic {R : Type*} [AddCommGroup R] [Module ℝ R]
    (J : R →ₗ[ℝ] Lp ℂ 2 μ)
    (hJ : Dense (Submodule.span ℂ (Set.range J) : Set (Lp ℂ 2 μ))) :
    (Submodule.span ℂ
      (Set.range fun L : List R ↦
        (L.foldl (fun ψ a ↦ contField μ (J a) (J a) ψ) (fockVacuumFin μ)).1)).topologicalClosure =
      ⊤ := by
  let S : Set (momentumFock μ) :=
    Set.range fun L : List R ↦
      (L.foldl (fun ψ a ↦ contField μ (J a) (J a) ψ) (fockVacuumFin μ)).1
  let W : Submodule ℂ (FiniteParticleFock μ) :=
    Submodule.span ℂ (Set.range fun L : List R ↦
      L.foldl (fun ψ a ↦ contField μ (J a) (J a) ψ) (fockVacuumFin μ))
  have hW_field : ∀ (a : R) (ψ : FiniteParticleFock μ), ψ ∈ W → contField μ (J a) (J a) ψ ∈ W := by
    intro a ψ hψ
    induction hψ using Submodule.span_induction with
    | mem x hx =>
      obtain ⟨L, rfl⟩ := hx
      refine Submodule.subset_span ⟨L ++ [a], ?_⟩
      simp [List.foldl_append]
    | zero => rw [map_zero]; exact W.zero_mem
    | add x y _ _ ix iy => rw [map_add]; exact W.add_mem ix iy
    | smul c x _ ih => rw [map_smul]; exact W.smul_mem c ih
  have hW_sector : ∀ (n : ℕ) (a : R), embedSectorFin μ n (sectorVec μ n (J a)) ∈ W := by
    intro n
    induction n using Nat.strong_induction_on with
    | h n ih =>
      intro a
      cases n with
      | zero =>
        have h0 : embedSectorFin μ 0 (sectorVec μ 0 (J a)) = fockVacuumFin μ := by
          apply Subtype.ext; apply lp.ext; funext m
          cases m with
          | zero => exact MomentumFock.sectorVec_zero_eq μ (J a)
          | succ k =>
            change embedSector μ 0 (sectorVec μ 0 (J a)) (k + 1) = sectorVec μ (k + 1) 0
            rw [embedSector_apply_ne μ (Nat.succ_ne_zero k), MomentumFock.sectorVec_succ_zero]
        rw [h0]
        exact Submodule.subset_span ⟨[], rfl⟩
      | succ k =>
        have hk : embedSectorFin μ k (sectorVec μ k (J a)) ∈ W := ih k (Nat.lt_succ_self k) a
        have hact : contField μ (J a) (J a) (embedSectorFin μ k (sectorVec μ k (J a))) ∈ W :=
          hW_field a _ hk
        have hcreate_eq := contCreate_embedSector_self μ k (J a)
        have hann_mem : contAnnihil μ (J a) (embedSectorFin μ k (sectorVec μ k (J a))) ∈ W := by
          cases k with
          | zero =>
            rw [contAnnihil_embedSector_zero]
            exact W.zero_mem
          | succ p =>
            rw [contAnnihil_embedSector_succ_self]
            exact W.smul_mem _ (ih p (by omega) a)
        have hk1 : ((k + 1 : ℕ) : ℂ) ≠ 0 := Nat.cast_ne_zero.mpr (Nat.succ_ne_zero k)
        exact mem_of_add_mem_smul W hk1 hact hann_mem hcreate_eq
  have hW_sub : ∀ ψ ∈ W, ψ.1 ∈ Submodule.span ℂ S := by
    intro ψ hψ
    induction hψ using Submodule.span_induction with
    | mem x hx =>
      obtain ⟨L, rfl⟩ := hx
      exact Submodule.subset_span ⟨L, rfl⟩
    | zero => exact (Submodule.span ℂ S).zero_mem
    | add x y _ _ ix iy => exact (Submodule.span ℂ S).add_mem ix iy
    | smul c x _ ih => exact (Submodule.span ℂ S).smul_mem c ih
  apply Submodule.topologicalClosure_eq_top_iff.2
  apply eq_bot_iff.mpr
  intro ψ hψ
  change ψ = 0
  apply lp.ext
  funext n
  apply MomentumFock.realLabels_sector_separate μ J hJ n (ψ n)
  intro a
  have hmem : embedSector μ n (sectorVec μ n (J a)) ∈ Submodule.span ℂ S :=
    hW_sub (embedSectorFin μ n (sectorVec μ n (J a))) (hW_sector n a)
  have horth := Submodule.inner_left_of_mem_orthogonal hmem hψ
  rwa [embedSector_inner_right] at horth

/-- Concrete real-Schwartz vacuum cyclicity of `contField` via `dense_complex_span_real_fixed_profile`. -/
theorem contField_vacuum_cyclic_realSchwartz {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
    [MeasurableSpace E] [BorelSpace E]
    (ω : E → ℝ) (hω : Measurable ω) (m H : ℝ) (hm : 0 < m) (hH : 0 < H)
    (hgap : ∀ k, m ≤ ω k) (h : ℝ → ℝ) (hM : Measurable h)
    (hn : ∀ t, 0 ≤ h t) (hi : IntegrableOn h (Ioi (0 : ℝ)))
    (hh : 0 < ∫ t in Ioi (0 : ℝ), h t) :
    let b := fun k ↦ Real.sqrt (H / (2 * ω k)) * laplaceBump h (ω k)
    ∃ hb : MemLp (fun k ↦ (b k : ℂ)) (⊤ : ENNReal) (volume : Measure E),
      (Submodule.span ℂ
        (Set.range fun L : List (SchwartzMap E ℝ) ↦
          (L.foldl (fun ψ g ↦
            contField (volume : Measure E) (realFixedProfileMap b hb g)
              (realFixedProfileMap b hb g) ψ) (fockVacuumFin (volume : Measure E))).1)).topologicalClosure =
        ⊤ := by
  intro b
  obtain ⟨hb, hdense⟩ :=
    dense_complex_span_real_fixed_profile ω hω m H hm hH hgap h hM hn hi hh
  exact ⟨hb, contField_vacuum_cyclic (volume : Measure E) (realFixedProfileMap b hb) hdense⟩

end ContinuousFockField

/-! ### §3.2 Weak Commutator & Heisenberg Uncertainty on `Dom Q ∩ Dom P` via `N → 2N` Tapered Cutoffs -/
section WeakCommutatorDomain

variable {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]

/-- Sectorwise formal action of the Hermitian bosonic field `Φ_v = c*(v) + c(v)` on an arbitrary
vector `ψ : momentumFock μ`. -/
noncomputable def sectorFieldApply (v : Lp ℂ 2 μ) (ψ : momentumFock μ) :
    (n : ℕ) → momentumSector μ n
  | 0 => sectorAnnihil μ 0 v (ψ 1)
  | n + 1 => sectorCreate μ n v (ψ n) + sectorAnnihil μ (n + 1) v (ψ (n + 2))

/-- Natural (maximal) domain `Dom(Φ_v) ⊆ momentumFock μ`: vectors whose sectorwise image
`sectorFieldApply μ v ψ` is `ℓ²`-summable across particle sectors. -/
def fockFieldDom (v : Lp ℂ 2 μ) (ψ : momentumFock μ) : Prop :=
  Memℓp (sectorFieldApply μ v ψ) 2

/-- The unbounded Hermitian field operator `Φ_v` on its full domain `fockFieldDom μ v` inside
`momentumFock μ`. -/
noncomputable def fockFieldOp (v : Lp ℂ 2 μ) (ψ : momentumFock μ) (hψ : fockFieldDom μ v ψ) :
    momentumFock μ :=
  ⟨sectorFieldApply μ v ψ, hψ⟩

/-- Linear particle-number cutoff weight tapering from `1` on `n ≤ N` to `0` on `n ≥ 2 N`
with adjacent differences `O(N⁻¹)` (§3.2). -/
noncomputable def taperWeight (N n : ℕ) : ℝ :=
  if n ≤ N then 1
  else if n ≤ 2 * N then ((2 * N - n : ℕ) : ℝ) / (N : ℝ)
  else 0

private lemma taperWeight_nonneg (N n : ℕ) : 0 ≤ taperWeight N n := by
  unfold taperWeight; split_ifs <;> positivity

private lemma taperWeight_le_one (N n : ℕ) : taperWeight N n ≤ 1 := by
  unfold taperWeight
  split_ifs with h1 h2
  · exact le_rfl
  · by_cases hN : N = 0
    · subst hN; simp
    · have hNpos : (0 : ℝ) < (N : ℝ) := Nat.cast_pos.mpr (Nat.pos_of_ne_zero hN)
      rw [div_le_one hNpos]
      exact_mod_cast (by omega : 2 * N - n ≤ N)
  · exact zero_le_one

private lemma taperWeight_eq_one {N n : ℕ} (h : n ≤ N) : taperWeight N n = 1 := by
  unfold taperWeight; simp [h]

private lemma taperWeight_eq_zero {N n : ℕ} (hN : 0 < N) (h : 2 * N ≤ n) : taperWeight N n = 0 := by
  unfold taperWeight
  split_ifs with h1 h2
  · omega
  · have : 2 * N - n = 0 := by omega
    simp [this]
  · rfl

private lemma taperWeight_step_sq_mul_le {N : ℕ} (hN : 0 < N) (n : ℕ) :
    (taperWeight N (n + 1) - taperWeight N n) ^ 2 * ((n + 1 : ℕ) : ℝ) ≤ 2 / (N : ℝ) := by
  have hNpos : (0 : ℝ) < (N : ℝ) := Nat.cast_pos.mpr hN
  by_cases hlow : n + 1 ≤ N
  · rw [taperWeight_eq_one hlow, taperWeight_eq_one (by omega)]; norm_num; positivity
  · by_cases hhi : 2 * N ≤ n
    · rw [taperWeight_eq_zero hN (by omega), taperWeight_eq_zero hN hhi]; norm_num; positivity
    · have hn1_le : n + 1 ≤ 2 * N := by omega
      have hdiff : taperWeight N (n + 1) - taperWeight N n = -(1 / (N : ℝ)) := by
        unfold taperWeight
        have h1 : ¬ n + 1 ≤ N := hlow
        have h2 : n + 1 ≤ 2 * N := hn1_le
        have h3 : n ≤ 2 * N := by omega
        by_cases heq : n = N
        · rw [heq]
          simp only [show ¬ N + 1 ≤ N by omega, ↓reduceIte,
            show N + 1 ≤ 2 * N by omega, le_refl]
          have hsub : 2 * N - (N + 1) = N - 1 := by omega
          rw [hsub, Nat.cast_sub hN, Nat.cast_one]
          field_simp [hNpos.ne']; ring
        · have hnot : ¬ n ≤ N := by omega
          simp only [h1, h2, hnot, h3, ↓reduceIte]
          have hsub : 2 * N - n = (2 * N - (n + 1)) + 1 := by omega
          rw [hsub, Nat.cast_add, Nat.cast_one]
          field_simp [hNpos.ne']; ring
      rw [hdiff]
      have hn1_cast : ((n + 1 : ℕ) : ℝ) ≤ 2 * (N : ℝ) := by exact_mod_cast hn1_le
      calc (-(1 / (N : ℝ))) ^ 2 * ((n + 1 : ℕ) : ℝ)
          = (1 / (N : ℝ) ^ 2) * ((n + 1 : ℕ) : ℝ) := by ring
        _ ≤ (1 / (N : ℝ) ^ 2) * (2 * (N : ℝ)) := by gcongr
        _ = 2 / (N : ℝ) := by field_simp [hNpos.ne']

/-- Generic `ℓ²`-taper operator on any sequence of complex normed spaces `E : ℕ → Type*`. -/
private noncomputable def lpTaper {E : ℕ → Type*} [∀ n, NormedAddCommGroup (E n)]
    [∀ n, NormedSpace ℂ (E n)] (N : ℕ) (ψ : lp E 2) : lp E 2 :=
  ⟨fun n => (taperWeight N n : ℂ) • ψ n, by
    refine memℓp_gen ?_
    refine ((lp.memℓp ψ).summable (by norm_num)).of_nonneg_of_le (fun _ => by positivity) fun n => ?_
    have h2 : (2 : ENNReal).toReal = 2 := by norm_num
    simp only [h2, Real.rpow_two]
    have hle : ‖(taperWeight N n : ℂ) • ψ n‖ ≤ ‖ψ n‖ := by
      rw [norm_smul, Complex.norm_real, Real.norm_of_nonneg (taperWeight_nonneg N n)]
      exact mul_le_of_le_one_left (norm_nonneg _) (taperWeight_le_one N n)
    exact pow_le_pow_left₀ (norm_nonneg _) hle 2⟩

private theorem tendsto_lpTaper {E : ℕ → Type*} [∀ n, NormedAddCommGroup (E n)]
    [∀ n, NormedSpace ℂ (E n)] (ψ : lp E 2) :
    Tendsto (fun N : ℕ => lpTaper N ψ) atTop (𝓝 ψ) := by
  rw [tendsto_iff_norm_sub_tendsto_zero]
  have h2 : (2 : ENNReal).toReal = 2 := by norm_num
  have hψ_sum : Summable (fun n : ℕ => ‖ψ n‖ ^ 2) := by
    simpa only [h2, Real.rpow_two] using (lp.memℓp ψ).summable (by norm_num)
  have hsq_lim : Tendsto (fun N : ℕ => ‖lpTaper N ψ - ψ‖ ^ 2) atTop (𝓝 0) := by
    rw [Metric.tendsto_atTop]
    intro ε hε
    have htail : Tendsto (fun N : ℕ => ∑' k : ℕ, ‖ψ (k + N)‖ ^ 2) atTop (𝓝 0) :=
      tendsto_sum_nat_add (fun n : ℕ => ‖ψ n‖ ^ 2)
    rw [Metric.tendsto_atTop] at htail
    obtain ⟨M, hM⟩ := htail ε hε
    refine ⟨M, fun N hN => ?_⟩
    rw [Real.dist_eq, sub_zero, abs_of_nonneg (sq_nonneg _)]
    have hnorm := lp.norm_rpow_eq_tsum (by norm_num : 0 < (2 : ENNReal).toReal) (lpTaper N ψ - ψ)
    simp only [h2, Real.rpow_two] at hnorm
    rw [hnorm]
    have hdiff_sum : Summable (fun n : ℕ => ‖(lpTaper N ψ - ψ) n‖ ^ 2) := by
      simpa only [h2, Real.rpow_two] using (lp.memℓp (lpTaper N ψ - ψ)).summable (by norm_num)
    have hsplit := hdiff_sum.sum_add_tsum_nat_add N
    have hhead : ∑ n ∈ Finset.range N, ‖(lpTaper N ψ - ψ) n‖ ^ 2 = 0 := by
      refine Finset.sum_eq_zero fun n hn => ?_
      have hnle : n ≤ N := (Finset.mem_range.mp hn).le
      have h0 : (lpTaper N ψ - ψ) n = 0 := by
        change (taperWeight N n : ℂ) • ψ n - ψ n = 0
        rw [taperWeight_eq_one hnle, Complex.ofReal_one, one_smul, sub_self]
      rw [h0, norm_zero, zero_pow (by norm_num)]
    rw [← hsplit, hhead, zero_add]
    have hle : ∑' k : ℕ, ‖(lpTaper N ψ - ψ) (k + N)‖ ^ 2 ≤ ∑' k : ℕ, ‖ψ (k + N)‖ ^ 2 := by
      refine Summable.tsum_le_tsum (fun k => ?_) ((summable_nat_add_iff N).mpr hdiff_sum)
        ((summable_nat_add_iff N).mpr hψ_sum)
      have hbound : ‖(lpTaper N ψ - ψ) (k + N)‖ ≤ ‖ψ (k + N)‖ := by
        change ‖(taperWeight N (k + N) : ℂ) • ψ (k + N) - ψ (k + N)‖ ≤ ‖ψ (k + N)‖
        rw [show (taperWeight N (k + N) : ℂ) • ψ (k + N) - ψ (k + N) =
            ((taperWeight N (k + N) - 1 : ℝ) : ℂ) • ψ (k + N) by
              push_cast; rw [sub_smul, one_smul],
          norm_smul, Complex.norm_real, Real.norm_eq_abs]
        have habs : |taperWeight N (k + N) - 1| ≤ 1 := by
          rw [abs_le]
          constructor <;> linarith [taperWeight_nonneg N (k + N), taperWeight_le_one N (k + N)]
        exact mul_le_of_le_one_left (norm_nonneg _) habs
      exact pow_le_pow_left₀ (norm_nonneg _) hbound 2
    have hM' := hM N hN
    rw [Real.dist_eq, sub_zero, abs_of_nonneg (tsum_nonneg fun k => sq_nonneg _)] at hM'
    exact lt_of_le_of_lt hle hM'
  have hsqrt := (Real.continuous_sqrt.continuousAt (x := 0)).tendsto.comp hsq_lim
  refine (by simpa [Function.comp_def, Real.sqrt_zero] using hsqrt :
      Tendsto (fun N : ℕ => Real.sqrt (‖lpTaper N ψ - ψ‖ ^ 2)) atTop (𝓝 0)).congr fun N => ?_
  rw [Real.sqrt_sq (norm_nonneg _)]

private theorem lp_taper_commutator_norm_sq_le {E : ℕ → Type*}
    [∀ n, NormedAddCommGroup (E n)] [∀ n, NormedSpace ℂ (E n)]
    (C : ∀ n, E n →L[ℂ] E (n + 1)) (A : ∀ n, E (n + 1) →L[ℂ] E n)
    (M : ℝ)
    (hC : ∀ n x, ‖C n x‖ ≤ Real.sqrt ((n + 1 : ℕ) : ℝ) * M * ‖x‖)
    (hA : ∀ n x, ‖A n x‖ ≤ Real.sqrt ((n + 1 : ℕ) : ℝ) * M * ‖x‖)
    {N : ℕ} (hN : 0 < N) (ψ Φ : lp E 2)
    (h0 : Φ 0 = ((taperWeight N 1 - taperWeight N 0 : ℝ) : ℂ) • A 0 (ψ 1))
    (hsucc : ∀ n : ℕ, Φ (n + 1) =
      ((taperWeight N n - taperWeight N (n + 1) : ℝ) : ℂ) • C n (ψ n) +
      ((taperWeight N (n + 2) - taperWeight N (n + 1) : ℝ) : ℂ) • A (n + 1) (ψ (n + 2))) :
    ‖Φ‖ ^ 2 ≤ (8 / (N : ℝ)) * M ^ 2 * ‖ψ‖ ^ 2 := by
  have h2 : (2 : ENNReal).toReal = 2 := by norm_num
  have hψ_sum : Summable (fun n : ℕ => ‖ψ n‖ ^ 2) := by
    simpa only [h2, Real.rpow_two] using (lp.memℓp ψ).summable (by norm_num)
  have hΦ_sum : Summable (fun n : ℕ => ‖Φ n‖ ^ 2) := by
    simpa only [h2, Real.rpow_two] using (lp.memℓp Φ).summable (by norm_num)
  have hΦnorm := lp.norm_rpow_eq_tsum (by norm_num : 0 < (2 : ENNReal).toReal) Φ
  have hψnorm := lp.norm_rpow_eq_tsum (by norm_num : 0 < (2 : ENNReal).toReal) ψ
  simp only [h2, Real.rpow_two] at hΦnorm hψnorm
  have htermA : ∀ n : ℕ,
      ‖((taperWeight N (n + 1) - taperWeight N n : ℝ) : ℂ) • A n (ψ (n + 1))‖ ^ 2 ≤
        (2 / (N : ℝ)) * M ^ 2 * ‖ψ (n + 1)‖ ^ 2 := by
    intro n
    rw [norm_smul, Complex.norm_real, Real.norm_eq_abs, mul_pow, sq_abs]
    have h1 := pow_le_pow_left₀ (norm_nonneg _) (hA n (ψ (n + 1))) 2
    rw [mul_pow, mul_pow, Real.sq_sqrt (Nat.cast_nonneg _)] at h1
    have hstep := taperWeight_step_sq_mul_le hN n
    calc (taperWeight N (n + 1) - taperWeight N n) ^ 2 * ‖A n (ψ (n + 1))‖ ^ 2
        ≤ (taperWeight N (n + 1) - taperWeight N n) ^ 2 *
            (((n + 1 : ℕ) : ℝ) * M ^ 2 * ‖ψ (n + 1)‖ ^ 2) := by gcongr
      _ = ((taperWeight N (n + 1) - taperWeight N n) ^ 2 * ((n + 1 : ℕ) : ℝ)) *
            (M ^ 2 * ‖ψ (n + 1)‖ ^ 2) := by ring
      _ ≤ (2 / (N : ℝ)) * (M ^ 2 * ‖ψ (n + 1)‖ ^ 2) := by gcongr
      _ = (2 / (N : ℝ)) * M ^ 2 * ‖ψ (n + 1)‖ ^ 2 := by ring
  have htermC : ∀ n : ℕ,
      ‖((taperWeight N n - taperWeight N (n + 1) : ℝ) : ℂ) • C n (ψ n)‖ ^ 2 ≤
        (2 / (N : ℝ)) * M ^ 2 * ‖ψ n‖ ^ 2 := by
    intro n
    rw [norm_smul, Complex.norm_real, Real.norm_eq_abs, mul_pow, sq_abs,
      show (taperWeight N n - taperWeight N (n + 1)) ^ 2 =
        (taperWeight N (n + 1) - taperWeight N n) ^ 2 by ring]
    have h1 := pow_le_pow_left₀ (norm_nonneg _) (hC n (ψ n)) 2
    rw [mul_pow, mul_pow, Real.sq_sqrt (Nat.cast_nonneg _)] at h1
    have hstep := taperWeight_step_sq_mul_le hN n
    calc (taperWeight N (n + 1) - taperWeight N n) ^ 2 * ‖C n (ψ n)‖ ^ 2
        ≤ (taperWeight N (n + 1) - taperWeight N n) ^ 2 *
            (((n + 1 : ℕ) : ℝ) * M ^ 2 * ‖ψ n‖ ^ 2) := by gcongr
      _ = ((taperWeight N (n + 1) - taperWeight N n) ^ 2 * ((n + 1 : ℕ) : ℝ)) *
            (M ^ 2 * ‖ψ n‖ ^ 2) := by ring
      _ ≤ (2 / (N : ℝ)) * (M ^ 2 * ‖ψ n‖ ^ 2) := by gcongr
      _ = (2 / (N : ℝ)) * M ^ 2 * ‖ψ n‖ ^ 2 := by ring
  have hdom_sum : Summable (fun n : ℕ =>
      (4 / (N : ℝ)) * M ^ 2 * ‖ψ n‖ ^ 2 + (4 / (N : ℝ)) * M ^ 2 * ‖ψ (n + 2)‖ ^ 2) :=
    (hψ_sum.mul_left _).add (((summable_nat_add_iff 2).mpr hψ_sum).mul_left _)
  have htail_le : ∑' n : ℕ, ‖Φ (n + 1)‖ ^ 2 ≤
      ∑' n : ℕ, ((4 / (N : ℝ)) * M ^ 2 * ‖ψ n‖ ^ 2 + (4 / (N : ℝ)) * M ^ 2 * ‖ψ (n + 2)‖ ^ 2) := by
    refine Summable.tsum_le_tsum (fun n => ?_) ((summable_nat_add_iff 1).mpr hΦ_sum) hdom_sum
    rw [hsucc n]
    set u := ((taperWeight N n - taperWeight N (n + 1) : ℝ) : ℂ) • C n (ψ n)
    set w := ((taperWeight N (n + 2) - taperWeight N (n + 1) : ℝ) : ℂ) • A (n + 1) (ψ (n + 2))
    have htri : ‖u + w‖ ^ 2 ≤ 2 * ‖u‖ ^ 2 + 2 * ‖w‖ ^ 2 := by
      have hsq : ‖u + w‖ ^ 2 ≤ (‖u‖ + ‖w‖) ^ 2 :=
        pow_le_pow_left₀ (norm_nonneg _) (norm_add_le u w) 2
      nlinarith [sq_nonneg (‖u‖ - ‖w‖)]
    have hu : ‖u‖ ^ 2 ≤ (2 / (N : ℝ)) * M ^ 2 * ‖ψ n‖ ^ 2 := htermC n
    have hw : ‖w‖ ^ 2 ≤ (2 / (N : ℝ)) * M ^ 2 * ‖ψ (n + 2)‖ ^ 2 := htermA (n + 1)
    have h24 : 2 * ((2 / (N : ℝ)) * M ^ 2 * ‖ψ n‖ ^ 2) = (4 / (N : ℝ)) * M ^ 2 * ‖ψ n‖ ^ 2 := by ring
    have h24' : 2 * ((2 / (N : ℝ)) * M ^ 2 * ‖ψ (n + 2)‖ ^ 2) =
        (4 / (N : ℝ)) * M ^ 2 * ‖ψ (n + 2)‖ ^ 2 := by ring
    linarith
  have hsum_add :
      ∑' n : ℕ, ((4 / (N : ℝ)) * M ^ 2 * ‖ψ n‖ ^ 2 + (4 / (N : ℝ)) * M ^ 2 * ‖ψ (n + 2)‖ ^ 2) =
        (4 / (N : ℝ)) * M ^ 2 * (∑' n : ℕ, ‖ψ n‖ ^ 2) +
        (4 / (N : ℝ)) * M ^ 2 * (∑' n : ℕ, ‖ψ (n + 2)‖ ^ 2) := by
    rw [Summable.tsum_add (hψ_sum.mul_left _) (((summable_nat_add_iff 2).mpr hψ_sum).mul_left _),
      tsum_mul_left, tsum_mul_left]
  have hsplit2 : ∑' n : ℕ, ‖ψ n‖ ^ 2 = ‖ψ 0‖ ^ 2 + ‖ψ 1‖ ^ 2 + ∑' n : ℕ, ‖ψ (n + 2)‖ ^ 2 := by
    rw [hψ_sum.tsum_eq_zero_add, ((summable_nat_add_iff 1).mpr hψ_sum).tsum_eq_zero_add]
    ring_nf
  have h0_le : ‖Φ 0‖ ^ 2 ≤ (2 / (N : ℝ)) * M ^ 2 * ‖ψ 1‖ ^ 2 := by
    rw [h0]; exact htermA 0
  rw [hΦnorm, hΦ_sum.tsum_eq_zero_add, hψnorm]
  rw [hsum_add] at htail_le
  have hcoeff : 0 ≤ (2 / (N : ℝ)) * M ^ 2 := by positivity
  have h24_le : (2 / (N : ℝ)) * M ^ 2 * ‖ψ 1‖ ^ 2 ≤ (4 / (N : ℝ)) * M ^ 2 * ‖ψ 1‖ ^ 2 := by
    have : (2 / (N : ℝ)) * M ^ 2 ≤ (4 / (N : ℝ)) * M ^ 2 := by
      have : (4 / (N : ℝ)) * M ^ 2 = 2 * ((2 / (N : ℝ)) * M ^ 2) := by ring
      linarith
    exact mul_le_mul_of_nonneg_right this (sq_nonneg _)
  have htail_bound : (4 / (N : ℝ)) * M ^ 2 * (∑' n : ℕ, ‖ψ (n + 2)‖ ^ 2) +
      (2 / (N : ℝ)) * M ^ 2 * ‖ψ 1‖ ^ 2 ≤
      (4 / (N : ℝ)) * M ^ 2 * (∑' n : ℕ, ‖ψ n‖ ^ 2) := by
    rw [hsplit2]
    have h0nn : 0 ≤ (4 / (N : ℝ)) * M ^ 2 * ‖ψ 0‖ ^ 2 := by positivity
    linarith
  have h48 : (4 / (N : ℝ)) * M ^ 2 * (∑' n : ℕ, ‖ψ n‖ ^ 2) +
      (4 / (N : ℝ)) * M ^ 2 * (∑' n : ℕ, ‖ψ n‖ ^ 2) =
      (8 / (N : ℝ)) * M ^ 2 * (∑' n : ℕ, ‖ψ n‖ ^ 2) := by ring
  linarith

private lemma tendsto_inner_of_tendsto {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    {u v : ℕ → H} {a b : H} (hu : Tendsto u atTop (𝓝 a)) (hv : Tendsto v atTop (𝓝 b)) :
    Tendsto (fun N : ℕ => inner ℂ (u N) (v N)) atTop (𝓝 (inner ℂ a b)) :=
  hu.inner hv

private lemma sub_smul_add_comm {M : Type*} [AddCommGroup M] [Module ℂ M]
    (a b c : ℝ) (x y : M) :
    (a : ℂ) • x + (c : ℂ) • y - (b : ℂ) • (x + y) =
      ((a - b : ℝ) : ℂ) • x + ((c - b : ℝ) : ℂ) • y := by
  rw [smul_add, Complex.ofReal_sub, Complex.ofReal_sub, sub_smul, sub_smul]
  abel

private lemma inner_im_zero_of_symm {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    {x y : H} (h : inner ℂ y x = inner ℂ x y) : (inner ℂ x y).im = 0 := by
  have hconj : star (inner ℂ x y) = inner ℂ x y := by
    rw [Complex.star_def, inner_conj_symm, h]
  have him := congrArg Complex.im hconj
  simp only [Complex.star_def, Complex.conj_im] at him
  linarith

private lemma weak_comm_step {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    {φ qφ pφ qpφ pqφ : H} {c : ℂ}
    (h1 : inner ℂ qφ pφ = inner ℂ φ qpφ)
    (h2 : inner ℂ pφ qφ = inner ℂ φ pqφ)
    (h3 : qpφ - pqφ = c • φ) :
    inner ℂ qφ pφ - inner ℂ pφ qφ = c * ((‖φ‖ ^ 2 : ℝ) : ℂ) := by
  rw [h1, h2, ← inner_sub_right, h3, inner_smul_right, inner_self_eq_norm_sq_to_K,
    RCLike.ofReal_eq_complex_ofReal, Complex.ofReal_pow]

/-- Bounded tapered particle-number cutoff `T_N : momentumFock μ → momentumFock μ` multiplying
sector `n` by `taperWeight N n`. -/
noncomputable def fockTaper (N : ℕ) (ψ : momentumFock μ) : momentumFock μ :=
  lpTaper N ψ

/-- For `N > 0`, `fockTaper μ N ψ` vanishes above sector `2 N`, hence lies in `FiniteParticleFock μ`. -/
theorem fockTaper_mem_finiteParticle {N : ℕ} (hN : 0 < N) (ψ : momentumFock μ) :
    fockTaper μ N ψ ∈ FiniteParticleFock μ :=
  ⟨2 * N, fun n hn => by
    change (taperWeight N n : ℂ) • ψ n = 0
    rw [taperWeight_eq_zero hN hn.le, Complex.ofReal_zero, zero_smul]⟩

/-- The tapered cutoff `T_N ψ` viewed inside `FiniteParticleFock μ` for `N > 0`. -/
noncomputable def fockTaperFin {N : ℕ} (hN : 0 < N) (ψ : momentumFock μ) :
    FiniteParticleFock μ :=
  ⟨fockTaper μ N ψ, fockTaper_mem_finiteParticle μ hN ψ⟩

/-- Strong convergence `T_N ψ → ψ` in `momentumFock μ` as `N → ∞`. -/
theorem tendsto_fockTaper (ψ : momentumFock μ) :
    Tendsto (fun N : ℕ => fockTaper μ N ψ) atTop (𝓝 ψ) :=
  tendsto_lpTaper ψ

/-- Quantitative `O(1 / N)` cutoff commutator bound (§3.2): because the `N → 2 N` linear taper
has adjacent differences `O(N⁻¹)` supported on `N ≤ n < 2 N` while creation and annihilation
grow as `O(√n)`, `‖Φ_v (T_N ψ) - T_N (Φ_v ψ)‖² ≤ (8 / N) ‖v‖² ‖ψ‖²`. -/
theorem fockField_taper_commutator_norm_sq_le (v : Lp ℂ 2 μ) {N : ℕ} (hN : 0 < N)
    (ψ : momentumFock μ) (hψ : fockFieldDom μ v ψ) :
    ‖(contField μ v v (fockTaperFin μ hN ψ)).1 - fockTaper μ N (fockFieldOp μ v ψ hψ)‖ ^ 2 ≤
      (8 / (N : ℝ)) * ‖v‖ ^ 2 * ‖ψ‖ ^ 2 := by
  let Φ : momentumFock μ :=
    (contField μ v v (fockTaperFin μ hN ψ)).1 - fockTaper μ N (fockFieldOp μ v ψ hψ)
  refine lp_taper_commutator_norm_sq_le (sectorCreate μ · v) (sectorAnnihil μ · v) ‖v‖
    (fun n x => sectorCreate_norm_le μ n v x)
    (fun n x => sectorAnnihil_norm_le μ n v x)
    hN ψ Φ ?_ ?_
  · have hstep : Φ 0 =
        sectorAnnihil μ 0 v ((taperWeight N 1 : ℂ) • ψ 1) -
          (taperWeight N 0 : ℂ) • sectorAnnihil μ 0 v (ψ 1) := by
      change ((0 : momentumSector μ 0) +
          sectorAnnihil μ 0 v ((taperWeight N 1 : ℂ) • ψ 1)) -
          (taperWeight N 0 : ℂ) • sectorAnnihil μ 0 v (ψ 1) = _
      rw [zero_add]
    rw [hstep, map_smul, Complex.ofReal_sub, sub_smul]
  · intro n
    have hstep : Φ (n + 1) =
        (sectorCreate μ n v ((taperWeight N n : ℂ) • ψ n) +
          sectorAnnihil μ (n + 1) v ((taperWeight N (n + 2) : ℂ) • ψ (n + 2))) -
        (taperWeight N (n + 1) : ℂ) •
          (sectorCreate μ n v (ψ n) + sectorAnnihil μ (n + 1) v (ψ (n + 2))) := rfl
    rw [hstep, map_smul, map_smul]
    exact sub_smul_add_comm (taperWeight N n) (taperWeight N (n + 1)) (taperWeight N (n + 2))
      (sectorCreate μ n v (ψ n)) (sectorAnnihil μ (n + 1) v (ψ (n + 2)))

/-- Graph approximation by tapered cutoffs: for every `ψ ∈ Dom(Φ_v)`,
`Φ_v (T_{N + 1} ψ) → Φ_v ψ` strongly in `momentumFock μ` as `N → ∞` (§3.2). -/
theorem tendsto_fockField_taper (v : Lp ℂ 2 μ) (ψ : momentumFock μ) (hψ : fockFieldDom μ v ψ) :
    Tendsto (fun N : ℕ => (contField μ v v (fockTaperFin μ (Nat.succ_pos N) ψ)).1)
      atTop (𝓝 (fockFieldOp μ v ψ hψ)) := by
  have hcomm_sq : Tendsto
      (fun N : ℕ => ‖(contField μ v v (fockTaperFin μ (Nat.succ_pos N) ψ)).1 -
        fockTaper μ (N + 1) (fockFieldOp μ v ψ hψ)‖ ^ 2) atTop (𝓝 0) := by
    refine squeeze_zero (fun _ => sq_nonneg _)
      (fun N => fockField_taper_commutator_norm_sq_le μ v (Nat.succ_pos N) ψ hψ) ?_
    have h1 : Tendsto (fun N : ℕ => (8 : ℝ) / ((N + 1 : ℕ) : ℝ)) atTop (𝓝 0) :=
      tendsto_const_nhds.div_atTop
        (by simpa [Nat.cast_add, Nat.cast_one] using
          tendsto_natCast_atTop_atTop.atTop_add (tendsto_const_nhds (x := (1 : ℝ))))
    simpa using (h1.mul_const (‖v‖ ^ 2)).mul_const (‖ψ‖ ^ 2)
  have hcomm : Tendsto
      (fun N : ℕ => (contField μ v v (fockTaperFin μ (Nat.succ_pos N) ψ)).1 -
        fockTaper μ (N + 1) (fockFieldOp μ v ψ hψ)) atTop (𝓝 0) := by
    rw [tendsto_zero_iff_norm_tendsto_zero]
    have hsqrt := (Real.continuous_sqrt.continuousAt (x := 0)).tendsto.comp hcomm_sq
    refine (by simpa [Function.comp_def, Real.sqrt_zero] using hsqrt :
      Tendsto (fun N : ℕ => Real.sqrt (‖(contField μ v v (fockTaperFin μ (Nat.succ_pos N) ψ)).1 -
        fockTaper μ (N + 1) (fockFieldOp μ v ψ hψ)‖ ^ 2)) atTop (𝓝 0)).congr fun N => ?_
    rw [Real.sqrt_sq (norm_nonneg _)]
  have htap : Tendsto (fun N : ℕ => fockTaper μ (N + 1) (fockFieldOp μ v ψ hψ))
      atTop (𝓝 (fockFieldOp μ v ψ hψ)) :=
    (tendsto_fockTaper μ (fockFieldOp μ v ψ hψ)).comp (tendsto_add_atTop_nat 1)
  simpa using hcomm.add htap

/-- Real expectation value on the full field domain `Dom(Φ_v)`: `(⟨ψ, Φ_v ψ⟩).im = 0`. -/
theorem fockField_inner_self_im_zero (v : Lp ℂ 2 μ) (ψ : momentumFock μ)
    (hψ : fockFieldDom μ v ψ) :
    (inner ℂ ψ (fockFieldOp μ v ψ hψ)).im = 0 := by
  have hlim : Tendsto
      (fun N : ℕ => (inner ℂ (fockTaperFin μ (Nat.succ_pos N) ψ).1
        (contField μ v v (fockTaperFin μ (Nat.succ_pos N) ψ)).1).im)
      atTop (𝓝 (inner ℂ ψ (fockFieldOp μ v ψ hψ)).im) :=
    Complex.continuous_im.continuousAt.tendsto.comp <|
      tendsto_inner_of_tendsto
        ((tendsto_fockTaper μ ψ).comp (tendsto_add_atTop_nat 1))
        (tendsto_fockField_taper μ v ψ hψ)
  have hzero : ∀ N : ℕ,
      (inner ℂ (fockTaperFin μ (Nat.succ_pos N) ψ).1
        (contField μ v v (fockTaperFin μ (Nat.succ_pos N) ψ)).1).im = 0 := fun N =>
    inner_im_zero_of_symm (contField_symm μ v (fockTaperFin μ (Nat.succ_pos N) ψ)
      (fockTaperFin μ (Nat.succ_pos N) ψ))
  exact tendsto_nhds_unique hlim (by simpa only [hzero] using tendsto_const_nhds)

/-- Weak commutator identity extended to all of `Dom(Φ_v) ∩ Dom(Φ_w)` on `momentumFock μ` (§3.2):
`⟨Φ_v ψ, Φ_w ψ⟩ - ⟨Φ_w ψ, Φ_v ψ⟩ = (⟨v, w⟩ - ⟨w, v⟩) ‖ψ‖²`. -/
theorem fockField_weak_commutator (v w : Lp ℂ 2 μ) (ψ : momentumFock μ)
    (hv : fockFieldDom μ v ψ) (hw : fockFieldDom μ w ψ) :
    inner ℂ (fockFieldOp μ v ψ hv) (fockFieldOp μ w ψ hw) -
      inner ℂ (fockFieldOp μ w ψ hw) (fockFieldOp μ v ψ hv) =
      (inner ℂ v w - inner ℂ w v) * ((‖ψ‖ ^ 2 : ℝ) : ℂ) := by
  have hlim_lhs : Tendsto
      (fun N : ℕ =>
        inner ℂ (contField μ v v (fockTaperFin μ (Nat.succ_pos N) ψ)).1
          (contField μ w w (fockTaperFin μ (Nat.succ_pos N) ψ)).1 -
        inner ℂ (contField μ w w (fockTaperFin μ (Nat.succ_pos N) ψ)).1
          (contField μ v v (fockTaperFin μ (Nat.succ_pos N) ψ)).1)
      atTop
      (𝓝 (inner ℂ (fockFieldOp μ v ψ hv) (fockFieldOp μ w ψ hw) -
        inner ℂ (fockFieldOp μ w ψ hw) (fockFieldOp μ v ψ hv))) :=
    (tendsto_inner_of_tendsto (tendsto_fockField_taper μ v ψ hv)
        (tendsto_fockField_taper μ w ψ hw)).sub
      (tendsto_inner_of_tendsto (tendsto_fockField_taper μ w ψ hw)
        (tendsto_fockField_taper μ v ψ hv))
  have hlim_rhs : Tendsto
      (fun N : ℕ => (inner ℂ v w - inner ℂ w v) *
        ((‖(fockTaperFin μ (Nat.succ_pos N) ψ).1‖ ^ 2 : ℝ) : ℂ))
      atTop
      (𝓝 ((inner ℂ v w - inner ℂ w v) * ((‖ψ‖ ^ 2 : ℝ) : ℂ))) := by
    refine tendsto_const_nhds.mul (Complex.continuous_ofReal.continuousAt.tendsto.comp ?_)
    exact (((tendsto_fockTaper μ ψ).comp (tendsto_add_atTop_nat 1)).norm).pow 2
  have heq : ∀ N : ℕ,
      inner ℂ (contField μ v v (fockTaperFin μ (Nat.succ_pos N) ψ)).1
          (contField μ w w (fockTaperFin μ (Nat.succ_pos N) ψ)).1 -
        inner ℂ (contField μ w w (fockTaperFin μ (Nat.succ_pos N) ψ)).1
          (contField μ v v (fockTaperFin μ (Nat.succ_pos N) ψ)).1 =
      (inner ℂ v w - inner ℂ w v) *
        ((‖(fockTaperFin μ (Nat.succ_pos N) ψ).1‖ ^ 2 : ℝ) : ℂ) := by
    intro N
    let φ := fockTaperFin μ (Nat.succ_pos N) ψ
    exact weak_comm_step
      (contField_symm μ v φ (contField μ w w φ))
      (contField_symm μ w φ (contField μ v v φ))
      ((Submodule.coe_sub (FiniteParticleFock μ) _ _).symm.trans
        (congrArg Subtype.val (contField_commutator μ v v w w φ)))
  exact tendsto_nhds_unique hlim_lhs (hlim_rhs.congr fun N => (heq N).symm)

/-- Full-domain Heisenberg uncertainty on `Dom(Φ_v) ∩ Dom(Φ_w)` in `momentumFock μ` (§3.2):
for any unit state `ψ ∈ Dom(Φ_v) ∩ Dom(Φ_w)` with canonical symplectic pairing
`⟨v, w⟩ - ⟨w, v⟩ = i ħ`, `|ħ| / 2 ≤ ΔΦ_v(ψ) · ΔΦ_w(ψ)`. -/
theorem fockField_heisenberg_uncertainty_domain (v w : Lp ℂ 2 μ) {ħ : ℝ}
    (hpair : inner ℂ v w - inner ℂ w v = Complex.I * (ħ : ℂ))
    (ψ : momentumFock μ) (hψ : ‖ψ‖ = 1)
    (hv : fockFieldDom μ v ψ) (hw : fockFieldDom μ w ψ) :
    |ħ| / 2 ≤
      ‖fockFieldOp μ v ψ hv - inner ℂ ψ (fockFieldOp μ v ψ hv) • ψ‖ *
      ‖fockFieldOp μ w ψ hw - inner ℂ ψ (fockFieldOp μ w ψ hw) • ψ‖ := by
  have hweak := fockField_weak_commutator μ v w ψ hv hw
  rw [hpair, hψ, one_pow, Complex.ofReal_one, mul_one] at hweak
  exact heisenberg_uncertainty_weak ψ (fockFieldOp μ v ψ hv) (fockFieldOp μ w ψ hw) ħ hψ
    (fockField_inner_self_im_zero μ v ψ hv) (fockField_inner_self_im_zero μ w ψ hw) hweak

private lemma planeField_symplectic_pairing {d : ℕ} {ħ m : ℝ} (hħ : 0 ≤ ħ) (hm : 0 < m)
    (h : Lp ℝ 2 (volume : Measure (EuclideanSpace ℝ (Fin d)))) (hh : ‖h‖ = 1)
    (v w : Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d))))
    (hv_ae : (v : EuclideanSpace ℝ (Fin d) → ℂ) =ᵐ[volume]
      fun k => ((Real.sqrt (ħ / (2 * modeDispersion m k)) * h k : ℝ) : ℂ))
    (hw_ae : (w : EuclideanSpace ℝ (Fin d) → ℂ) =ᵐ[volume]
      fun k => Complex.I * (modeDispersion m k : ℂ) * v k) :
    inner ℂ v w - inner ℂ w v = Complex.I * (ħ : ℂ) := by
  rw [L2.inner_def, L2.inner_def, ← integral_sub (L2.integrable_inner v w) (L2.integrable_inner w v)]
  have hpt : (fun k => inner ℂ (v k) (w k) - inner ℂ (w k) (v k)) =ᵐ[volume]
      fun k => (Complex.I * (ħ : ℂ)) * ((h k ^ 2 : ℝ) : ℂ) := by
    filter_upwards [hv_ae, hw_ae] with k hvk hwk
    have hω : 0 < modeDispersion m k := modeDispersion_pos hm k
    have hωc : (modeDispersion m k : ℂ) ≠ 0 := Complex.ofReal_ne_zero.mpr hω.ne'
    have hsq : Real.sqrt (ħ / (2 * modeDispersion m k)) *
        Real.sqrt (ħ / (2 * modeDispersion m k)) = ħ / (2 * modeDispersion m k) :=
      Real.mul_self_sqrt (div_nonneg hħ (by linarith))
    rw [hwk, hvk, RCLike.inner_apply, RCLike.inner_apply]
    simp only [map_mul, Complex.conj_I, Complex.conj_ofReal]
    have hreal : ((Real.sqrt (ħ / (2 * modeDispersion m k)) * h k : ℝ) : ℂ) *
        ((Real.sqrt (ħ / (2 * modeDispersion m k)) * h k : ℝ) : ℂ) =
        ((ħ / (2 * modeDispersion m k) * h k ^ 2 : ℝ) : ℂ) := by
      rw [← Complex.ofReal_mul]; congr 1
      calc (Real.sqrt (ħ / (2 * modeDispersion m k)) * h k) *
            (Real.sqrt (ħ / (2 * modeDispersion m k)) * h k)
          = (Real.sqrt (ħ / (2 * modeDispersion m k)) *
              Real.sqrt (ħ / (2 * modeDispersion m k))) * h k ^ 2 := by ring
        _ = ħ / (2 * modeDispersion m k) * h k ^ 2 := by rw [hsq]
    calc Complex.I * (modeDispersion m k : ℂ) *
            ((Real.sqrt (ħ / (2 * modeDispersion m k)) * h k : ℝ) : ℂ) *
            ((Real.sqrt (ħ / (2 * modeDispersion m k)) * h k : ℝ) : ℂ) -
          ((Real.sqrt (ħ / (2 * modeDispersion m k)) * h k : ℝ) : ℂ) *
            (-Complex.I * (modeDispersion m k : ℂ) *
              ((Real.sqrt (ħ / (2 * modeDispersion m k)) * h k : ℝ) : ℂ))
        = (2 * Complex.I * (modeDispersion m k : ℂ)) *
            (((Real.sqrt (ħ / (2 * modeDispersion m k)) * h k : ℝ) : ℂ) *
              ((Real.sqrt (ħ / (2 * modeDispersion m k)) * h k : ℝ) : ℂ)) := by ring
      _ = (2 * Complex.I * (modeDispersion m k : ℂ)) *
            ((ħ / (2 * modeDispersion m k) * h k ^ 2 : ℝ) : ℂ) := by rw [hreal]
      _ = Complex.I * (ħ : ℂ) * ((h k ^ 2 : ℝ) : ℂ) := by push_cast; field_simp [hωc]
  have hh_sq : Integrable (fun k : EuclideanSpace ℝ (Fin d) => h k ^ 2) volume := by
    simpa [Real.norm_eq_abs, sq_abs] using ((Lp.memLp h).norm).integrable_sq
  have hof : (∫ k : EuclideanSpace ℝ (Fin d), ((h k ^ 2 : ℝ) : ℂ)) =
      ((∫ k : EuclideanSpace ℝ (Fin d), h k ^ 2 : ℝ) : ℂ) :=
    Complex.ofRealCLM.integral_comp_comm hh_sq
  rw [integral_congr_ae hpt, integral_const_mul, hof]
  have hnorm_sq : ∫ k : EuclideanSpace ℝ (Fin d), h k ^ 2 = 1 := by
    have h1 : ‖h‖ ^ 2 = inner ℝ h h := (real_inner_self_eq_norm_sq h).symm
    rw [hh, one_pow, L2.inner_def] at h1
    have hsq_eq : ∀ x : ℝ, inner ℝ x x = x ^ 2 := fun x => by simp [sq]
    simp_rw [hsq_eq] at h1
    exact h1.symm
  rw [hnorm_sq, Complex.ofReal_one, mul_one]

/-- Concrete continuum plane-field Heisenberg uncertainty on `Dom(Q(h)) ∩ Dom(P(h))` inside
`momentumFock volume` (§3.2): for any `ħ ≥ 0`, `m > 0`, and unit-norm real momentum-space
plane profile `h ∈ L²(ℝ^d)` (`‖h‖ = 1`), with `v_k = √(ħ / (2 ω_k)) h_k` and `w_k = i ω_k v_k`,
every unit state `ψ ∈ Dom(Q(h)) ∩ Dom(P(h))` satisfies `ħ / 2 ≤ ΔQ(h)(ψ) · ΔP(h)(ψ)`. -/
theorem planeField_heisenberg_uncertainty_domain {d : ℕ} {ħ m : ℝ} (hħ : 0 ≤ ħ) (hm : 0 < m)
    (h : Lp ℝ 2 (volume : Measure (EuclideanSpace ℝ (Fin d)))) (hh : ‖h‖ = 1)
    (v w : Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d))))
    (hv_ae : (v : EuclideanSpace ℝ (Fin d) → ℂ) =ᵐ[volume]
      fun k => ((Real.sqrt (ħ / (2 * modeDispersion m k)) * h k : ℝ) : ℂ))
    (hw_ae : (w : EuclideanSpace ℝ (Fin d) → ℂ) =ᵐ[volume]
      fun k => Complex.I * (modeDispersion m k : ℂ) * v k)
    (ψ : momentumFock (volume : Measure (EuclideanSpace ℝ (Fin d)))) (hψ : ‖ψ‖ = 1)
    (hQ : fockFieldDom (volume : Measure (EuclideanSpace ℝ (Fin d))) v ψ)
    (hP : fockFieldDom (volume : Measure (EuclideanSpace ℝ (Fin d))) w ψ) :
    ħ / 2 ≤
      ‖fockFieldOp (volume : Measure (EuclideanSpace ℝ (Fin d))) v ψ hQ -
        inner ℂ ψ (fockFieldOp (volume : Measure (EuclideanSpace ℝ (Fin d))) v ψ hQ) • ψ‖ *
      ‖fockFieldOp (volume : Measure (EuclideanSpace ℝ (Fin d))) w ψ hP -
        inner ℂ ψ (fockFieldOp (volume : Measure (EuclideanSpace ℝ (Fin d))) w ψ hP) • ψ‖ :=
  le_trans (le_of_eq (by rw [abs_of_nonneg hħ]))
    (fockField_heisenberg_uncertainty_domain (volume : Measure (EuclideanSpace ℝ (Fin d))) v w
      (planeField_symplectic_pairing hħ hm h hh v w hv_ae hw_ae) ψ hψ hQ hP)

end WeakCommutatorDomain

/-! #### Second-Quantized Unitary Lift Intertwining `contField` -/

section SecondQuantization

variable {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ]

namespace WightmanField

theorem sectorVec_span_dense (n : ℕ) :
    Dense ((Submodule.span ℂ (Set.range (sectorVec μ n)) :
      Submodule ℂ (momentumSector μ n)) : Set (momentumSector μ n)) := by
  rw [Submodule.dense_iff_topologicalClosure_eq_top, Submodule.topologicalClosure_eq_top_iff,
    eq_bot_iff]
  intro y hy
  change y = 0
  apply MomentumFock.sectorVec_separates μ n y
  intro u
  exact Submodule.inner_left_of_mem_orthogonal (Submodule.subset_span (Set.mem_range_self u)) hy

theorem secondQuantizeSector_exists (n : ℕ) (V : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ) :
    ∃! Γ : momentumSector μ n ≃ₗᵢ[ℂ] momentumSector μ n,
      ∀ u : Lp ℂ 2 μ, Γ (sectorVec μ n u) = sectorVec μ n (V u) := by
  let _ : CompleteSpace (momentumSector μ n) :=
    (Submodule.isClosed_topologicalClosure _).completeSpace_coe
  have hd := sectorVec_span_dense μ n
  have hdV : Dense ((Submodule.span ℂ (Set.range (sectorVec μ n ∘ V)) :
      Submodule ℂ (momentumSector μ n)) : Set (momentumSector μ n)) := by
    simpa only [Set.range_comp, V.surjective.range_eq, Set.image_univ] using hd
  exact gram_total_unique (sectorVec μ n) (sectorVec μ n ∘ V) hd hdV fun u v ↦ by
    simp only [Function.comp_apply, sectorVec_gram, V.inner_map_map]

end WightmanField

/-- Sectorwise second-quantized unitary lift `Γ_n(V) : momentumSector μ n ≃ₗᵢ[ℂ] momentumSector μ n`. -/
noncomputable def secondQuantizeSector (n : ℕ) (V : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ) :
    momentumSector μ n ≃ₗᵢ[ℂ] momentumSector μ n :=
  Classical.choose (WightmanField.secondQuantizeSector_exists μ n V)

theorem secondQuantizeSector_sectorVec (n : ℕ) (V : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ) (u : Lp ℂ 2 μ) :
    secondQuantizeSector μ n V (sectorVec μ n u) = sectorVec μ n (V u) :=
  (Classical.choose_spec (WightmanField.secondQuantizeSector_exists μ n V)).1 u

theorem secondQuantizeSector_unique (n : ℕ) (V : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ)
    (Γ : momentumSector μ n ≃ₗᵢ[ℂ] momentumSector μ n)
    (hΓ : ∀ u : Lp ℂ 2 μ, Γ (sectorVec μ n u) = sectorVec μ n (V u)) :
    Γ = secondQuantizeSector μ n V :=
  (Classical.choose_spec (WightmanField.secondQuantizeSector_exists μ n V)).2 Γ hΓ

theorem secondQuantizeSector_one (n : ℕ) :
    secondQuantizeSector μ n (1 : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ) = 1 :=
  (secondQuantizeSector_unique μ n 1 1 fun _ ↦ rfl).symm

theorem secondQuantizeSector_mul (n : ℕ) (V₁ V₂ : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ) :
    secondQuantizeSector μ n (V₁ * V₂) =
      secondQuantizeSector μ n V₁ * secondQuantizeSector μ n V₂ := by
  refine (secondQuantizeSector_unique μ n (V₁ * V₂)
    (secondQuantizeSector μ n V₁ * secondQuantizeSector μ n V₂) fun u ↦ ?_).symm
  simp only [LinearIsometryEquiv.coe_mul, Function.comp_apply, secondQuantizeSector_sectorVec]

theorem secondQuantizeSector_symm (n : ℕ) (V : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ) :
    (secondQuantizeSector μ n V).symm = secondQuantizeSector μ n V.symm := by
  refine secondQuantizeSector_unique μ n V.symm (secondQuantizeSector μ n V).symm fun u ↦ ?_
  apply (secondQuantizeSector μ n V).injective
  rw [LinearIsometryEquiv.apply_symm_apply, secondQuantizeSector_sectorVec,
    LinearIsometryEquiv.apply_symm_apply]

/-- Concrete second-quantized unitary lift `Γ(V) : momentumFock μ ≃ₗᵢ[ℂ] momentumFock μ`
assembled sectorwise from `secondQuantizeSector`. -/
noncomputable def secondQuantize (V : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ) :
    momentumFock μ ≃ₗᵢ[ℂ] momentumFock μ :=
  have hmem (W : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ) (ψ : momentumFock μ) :
      Memℓp (fun n ↦ secondQuantizeSector μ n W (ψ n)) 2 := by
    apply memℓp_gen
    simpa only [LinearIsometryEquiv.norm_map] using (lp.memℓp ψ).summable (by norm_num)
  { toLinearEquiv :=
      { toFun := fun ψ ↦ ⟨fun n ↦ secondQuantizeSector μ n V (ψ n), hmem V ψ⟩
        invFun := fun ψ ↦ ⟨fun n ↦ (secondQuantizeSector μ n V).symm (ψ n), by
          apply memℓp_gen
          simpa only [LinearIsometryEquiv.norm_map] using (lp.memℓp ψ).summable (by norm_num)⟩
        map_add' := fun ψ φ ↦ lp.ext (funext fun n ↦ (secondQuantizeSector μ n V).map_add _ _)
        map_smul' := fun c ψ ↦ lp.ext (funext fun n ↦ (secondQuantizeSector μ n V).map_smul _ _)
        left_inv := fun ψ ↦ lp.ext (funext fun n ↦ (secondQuantizeSector μ n V).symm_apply_apply _)
        right_inv := fun ψ ↦ lp.ext (funext fun n ↦ (secondQuantizeSector μ n V).apply_symm_apply _) }
    norm_map' := fun ψ ↦ by
      let y : momentumFock μ := ⟨fun n ↦ secondQuantizeSector μ n V (ψ n), hmem V ψ⟩
      change ‖y‖ = ‖ψ‖
      have h2 : (2 : ENNReal).toReal = 2 := by norm_num
      have hy := lp.norm_rpow_eq_tsum (by norm_num : 0 < (2 : ENNReal).toReal) y
      have hψ := lp.norm_rpow_eq_tsum (by norm_num : 0 < (2 : ENNReal).toReal) ψ
      simp only [h2, Real.rpow_two] at hy hψ
      have hsq : ‖y‖ ^ 2 = ‖ψ‖ ^ 2 := by
        rw [hy, hψ]
        congr 1; funext n
        exact congrArg (· ^ 2) ((secondQuantizeSector μ n V).norm_map (ψ n))
      nlinarith [norm_nonneg y, norm_nonneg ψ] }

@[simp]
theorem secondQuantize_apply_sector (V : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ) (ψ : momentumFock μ) (n : ℕ) :
    (secondQuantize μ V ψ) n = secondQuantizeSector μ n V (ψ n) := rfl

/-- Coherent-vector equivariance: `Γ(V) E(u) = E(V u)`. -/
theorem secondQuantize_coherent (V : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ) (u : Lp ℂ 2 μ) :
    secondQuantize μ V (coherentVec μ u) = coherentVec μ (V u) := by
  apply lp.ext; funext n
  exact secondQuantizeSector_sectorVec μ n V u

/-- Vacuum invariance: `Γ(V) Ω = Ω`. -/
theorem secondQuantize_vacuum (V : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ) :
    secondQuantize μ V (fockVacuum μ) = fockVacuum μ := by
  unfold fockVacuum
  rw [secondQuantize_coherent, map_zero]

/-- Identity preservation: `Γ(1) = 1`. -/
theorem secondQuantize_one :
    secondQuantize μ (1 : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ) = 1 := by
  ext ψ : 1; apply lp.ext; funext n
  rw [secondQuantize_apply_sector, secondQuantizeSector_one]
  rfl

/-- Group multiplication law: `Γ(V₁ * V₂) = Γ(V₁) * Γ(V₂)`. -/
theorem secondQuantize_mul (V₁ V₂ : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ) :
    secondQuantize μ (V₁ * V₂) = secondQuantize μ V₁ * secondQuantize μ V₂ := by
  ext ψ : 1; apply lp.ext; funext n
  rw [secondQuantize_apply_sector, secondQuantizeSector_mul]
  rfl

/-- Composition form: `Γ(V₁.trans V₂) = (Γ(V₁)).trans (Γ(V₂))`. -/
theorem secondQuantize_comp (V₁ V₂ : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ) :
    secondQuantize μ (V₁.trans V₂) = (secondQuantize μ V₁).trans (secondQuantize μ V₂) := by
  ext ψ : 1; apply lp.ext; funext n
  change secondQuantizeSector μ n (V₂ * V₁) (ψ n) =
    secondQuantizeSector μ n V₂ (secondQuantizeSector μ n V₁ (ψ n))
  rw [secondQuantizeSector_mul]
  rfl

/-- Group homomorphism `secondQuantizeHom : U(L²(μ)) →* U(momentumFock μ)`. -/
noncomputable def secondQuantizeHom :
    (Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ) →* (momentumFock μ ≃ₗᵢ[ℂ] momentumFock μ) where
  toFun := secondQuantize μ
  map_one' := secondQuantize_one μ
  map_mul' := secondQuantize_mul μ

/-- `secondQuantize μ V` preserves `FiniteParticleFock μ` because it acts sectorwise. -/
theorem secondQuantize_mem_finiteParticle (V : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ)
    (ψ : FiniteParticleFock μ) :
    secondQuantize μ V ψ.1 ∈ FiniteParticleFock μ := by
  obtain ⟨N, hN⟩ := ψ.2
  refine ⟨N, fun n hn ↦ ?_⟩
  rw [secondQuantize_apply_sector, hN n hn, map_zero]

/-- Restriction of `secondQuantize μ V` to a linear equivalence on `FiniteParticleFock μ`. -/
noncomputable def secondQuantizeFin (V : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ) :
    FiniteParticleFock μ ≃ₗ[ℂ] FiniteParticleFock μ where
  toFun ψ := ⟨secondQuantize μ V ψ.1, secondQuantize_mem_finiteParticle μ V ψ⟩
  invFun ψ := ⟨secondQuantize μ V.symm ψ.1, secondQuantize_mem_finiteParticle μ V.symm ψ⟩
  map_add' ψ φ := Subtype.ext ((secondQuantize μ V).map_add ψ.1 φ.1)
  map_smul' c ψ := Subtype.ext ((secondQuantize μ V).map_smul c ψ.1)
  left_inv ψ := by
    apply Subtype.ext; apply lp.ext; funext n
    change secondQuantizeSector μ n V.symm (secondQuantizeSector μ n V (ψ.1 n)) = ψ.1 n
    rw [← secondQuantizeSector_symm, LinearIsometryEquiv.symm_apply_apply]
  right_inv ψ := by
    apply Subtype.ext; apply lp.ext; funext n
    change secondQuantizeSector μ n V (secondQuantizeSector μ n V.symm (ψ.1 n)) = ψ.1 n
    rw [← secondQuantizeSector_symm, LinearIsometryEquiv.apply_symm_apply]

theorem sector_secondQuantize_intertwines_annihil (n : ℕ) (V : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ)
    (u : Lp ℂ 2 μ) (ψ : momentumSector μ (n + 1)) :
    secondQuantizeSector μ n V (sectorAnnihil μ n u ψ) =
      sectorAnnihil μ n (V u) (secondQuantizeSector μ (n + 1) V ψ) := by
  let L : momentumSector μ (n + 1) →L[ℂ] momentumSector μ n :=
    (secondQuantizeSector μ n V).toContinuousLinearEquiv.toContinuousLinearMap.comp
      (sectorAnnihil μ n u)
  let R : momentumSector μ (n + 1) →L[ℂ] momentumSector μ n :=
    (sectorAnnihil μ n (V u)).comp
      (secondQuantizeSector μ (n + 1) V).toContinuousLinearEquiv.toContinuousLinearMap
  have heq : L = R := by
    apply sector_clm_ext μ (n + 1)
    intro w
    change secondQuantizeSector μ n V (sectorAnnihil μ n u (sectorVec μ (n + 1) w)) =
      sectorAnnihil μ n (V u) (secondQuantizeSector μ (n + 1) V (sectorVec μ (n + 1) w))
    rw [sectorAnnihil_sectorVec, map_smul, secondQuantizeSector_sectorVec,
      secondQuantizeSector_sectorVec, sectorAnnihil_sectorVec, V.inner_map_map]
  exact congrArg (fun T : momentumSector μ (n + 1) →L[ℂ] momentumSector μ n ↦ T ψ) heq

theorem sector_secondQuantize_intertwines_create (n : ℕ) (V : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ)
    (u : Lp ℂ 2 μ) (φ : momentumSector μ n) :
    secondQuantizeSector μ (n + 1) V (sectorCreate μ n u φ) =
      sectorCreate μ n (V u) (secondQuantizeSector μ n V φ) := by
  rw [← sub_eq_zero]
  apply MomentumFock.sectorVec_separates μ (n + 1)
  intro w
  rw [inner_sub_left, sub_eq_zero]
  have h1 : inner ℂ (secondQuantizeSector μ (n + 1) V (sectorCreate μ n u φ)) (sectorVec μ (n + 1) w) =
      inner ℂ (sectorCreate μ n u φ) ((secondQuantizeSector μ (n + 1) V).symm (sectorVec μ (n + 1) w)) := by
    symm
    rw [← (secondQuantizeSector μ (n + 1) V).inner_map_map, LinearIsometryEquiv.apply_symm_apply]
  rw [h1, sectorCreate_adjoint, sectorCreate_adjoint]
  rw [← (secondQuantizeSector μ n V).inner_map_map, sector_secondQuantize_intertwines_annihil,
    LinearIsometryEquiv.apply_symm_apply]

/-- `Γ(V)` intertwines annihilation operators: `Γ(V) c(u) ψ = c(V u) Γ(V) ψ`. -/
theorem secondQuantize_intertwines_annihil (V : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ)
    (u : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ) :
    secondQuantizeFin μ V (contAnnihil μ u ψ) =
      contAnnihil μ (V u) (secondQuantizeFin μ V ψ) := by
  apply Subtype.ext; apply lp.ext; funext n
  exact sector_secondQuantize_intertwines_annihil μ n V u (ψ.1 (n + 1))

/-- `Γ(V)` intertwines creation operators: `Γ(V) c*(u) ψ = c*(V u) Γ(V) ψ`. -/
theorem secondQuantize_intertwines_create (V : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ)
    (u : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ) :
    secondQuantizeFin μ V (contCreate μ u ψ) =
      contCreate μ (V u) (secondQuantizeFin μ V ψ) := by
  apply Subtype.ext; apply lp.ext; funext n
  cases n with
  | zero =>
    change secondQuantizeSector μ 0 V 0 = 0
    rw [map_zero]
  | succ k =>
    exact sector_secondQuantize_intertwines_create μ k V u (ψ.1 k)

/-- Full bosonic field covariance on `FiniteParticleFock μ`:
`Γ(V) Φ(u, ū) ψ = Φ(V u, V ū) Γ(V) ψ`. -/
theorem secondQuantize_intertwines_field (V : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ)
    (u ubar : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ) :
    secondQuantizeFin μ V (contField μ u ubar ψ) =
      contField μ (V u) (V ubar) (secondQuantizeFin μ V ψ) := by
  simp only [contField, LinearMap.add_apply, map_add,
    secondQuantize_intertwines_create, secondQuantize_intertwines_annihil]

/-- Ambient-vector form of field covariance:
`Γ(V) (Φ(u, ū) ψ) = (Φ(V u, V ū) (Γ(V) ψ))`. -/
theorem secondQuantize_intertwines_field_coe (V : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 μ)
    (u ubar : Lp ℂ 2 μ) (ψ : FiniteParticleFock μ) :
    secondQuantize μ V (contField μ u ubar ψ).1 =
      (contField μ (V u) (V ubar) (secondQuantizeFin μ V ψ)).1 :=
  congrArg Subtype.val (secondQuantize_intertwines_field μ V u ubar ψ)

end SecondQuantization

/-! #### Continuous Schwartz Mass-Shell Restriction & Tempered Distribution Field (`D ≥ 2`) -/

section MassShellFeature

open FourierTransform

namespace WightmanField

/-- Continuous linear equivalence between `WithLp 2 (ℝ × Space d)` and `ℝ × Space d`. -/
noncomputable def spacetimeToL2 (d : ℕ) :
    WithLp 2 (ℝ × EuclideanSpace ℝ (Fin d)) ≃L[ℝ] ℝ × EuclideanSpace ℝ (Fin d) :=
  WithLp.prodContinuousLinearEquiv 2 ℝ ℝ (EuclideanSpace ℝ (Fin d))

/-- Mass-shell evaluation point `(-ω_m(k) / (2π), (2π)⁻¹ k)` in `WithLp 2 (ℝ × Space d)` so that
Mathlib's Fourier character `e^{-2π i ⟨(t, x), ξ⟩}` equals `e^{i (t ω_m(k) - ⟨x, k⟩)}`. -/
noncomputable def shellEvalPoint (d : ℕ) (m : ℝ) (k : EuclideanSpace ℝ (Fin d)) :
    WithLp 2 (ℝ × EuclideanSpace ℝ (Fin d)) :=
  WithLp.toLp 2 (-(modeDispersion m k) / (2 * Real.pi), (2 * Real.pi)⁻¹ • k)

theorem shellEvalPoint_continuous (d : ℕ) (m : ℝ) : Continuous (shellEvalPoint d m) := by
  have h1 : Continuous (fun k : EuclideanSpace ℝ (Fin d) ↦ -(modeDispersion m k) / (2 * Real.pi)) := by
    unfold modeDispersion; fun_prop
  have h2 : Continuous (fun k : EuclideanSpace ℝ (Fin d) ↦ (2 * Real.pi)⁻¹ • k) :=
    continuous_id.const_smul (2 * Real.pi)⁻¹
  exact (spacetimeToL2 d).symm.continuous.comp (h1.prodMk h2)

theorem one_add_norm_le_shellEvalPoint (d : ℕ) (m : ℝ) (k : EuclideanSpace ℝ (Fin d)) :
    1 + ‖k‖ ≤ (2 * Real.pi) * (1 + ‖shellEvalPoint d m k‖) := by
  have hpi : 1 ≤ 2 * Real.pi := by linarith [Real.pi_gt_three]
  have hpi_pos : 0 < 2 * Real.pi := by positivity
  have hnorm_ge : (2 * Real.pi)⁻¹ * ‖k‖ ≤ ‖shellEvalPoint d m k‖ := by
    have hsq : ((2 * Real.pi)⁻¹ * ‖k‖) ^ 2 ≤ ‖shellEvalPoint d m k‖ ^ 2 := by
      unfold shellEvalPoint
      rw [WithLp.prod_norm_sq_eq_of_L2]
      change ((2 * Real.pi)⁻¹ * ‖k‖) ^ 2 ≤
        ‖-(modeDispersion m k) / (2 * Real.pi)‖ ^ 2 + ‖(2 * Real.pi)⁻¹ • k‖ ^ 2
      rw [norm_smul, Real.norm_of_nonneg (inv_nonneg.mpr hpi_pos.le)]
      nlinarith [sq_nonneg ‖-(modeDispersion m k) / (2 * Real.pi)‖]
    nlinarith [norm_nonneg (shellEvalPoint d m k), mul_nonneg (inv_nonneg.mpr hpi_pos.le) (norm_nonneg k)]
  have hmul : ‖k‖ ≤ (2 * Real.pi) * ‖shellEvalPoint d m k‖ := by
    have h := mul_le_mul_of_nonneg_left hnorm_ge hpi_pos.le
    rwa [← mul_assoc, mul_inv_cancel₀ hpi_pos.ne', one_mul] at h
  nlinarith

/-- Pointwise mass-shell restriction `k ↦ √(ħ / (2 ω_m(k))) * g(shellEvalPoint d m k)`. -/
noncomputable def shellRestrictFun (d : ℕ) (ħ m : ℝ)
    (g : SchwartzMap (WithLp 2 (ℝ × EuclideanSpace ℝ (Fin d))) ℂ)
    (k : EuclideanSpace ℝ (Fin d)) : ℂ :=
  ((Real.sqrt (ħ / (2 * modeDispersion m k)) : ℝ) : ℂ) * g (shellEvalPoint d m k)

theorem shellRestrictFun_norm_le (d : ℕ) (ħ m : ℝ) (hħ : 0 ≤ ħ) (hm : 0 < m)
    (g : SchwartzMap (WithLp 2 (ℝ × EuclideanSpace ℝ (Fin d))) ℂ)
    (k : EuclideanSpace ℝ (Fin d)) :
    ‖shellRestrictFun d ħ m g k‖ ≤
      (Real.sqrt (ħ / (2 * m)) * (4 * Real.pi) ^ (d + 1) *
        ((Finset.Iic (d + 1, 0)).sup
          (schwartzSeminormFamily ℂ (WithLp 2 (ℝ × EuclideanSpace ℝ (Fin d))) ℂ)) g) *
      (1 + ‖k‖) ^ (-((d + 1 : ℕ) : ℝ)) := by
  have hω_ge : m ≤ modeDispersion m k := by
    unfold modeDispersion
    calc m = Real.sqrt (m ^ 2) := (Real.sqrt_sq hm.le).symm
      _ ≤ Real.sqrt (‖k‖ ^ 2 + m ^ 2) := Real.sqrt_le_sqrt (by linarith [sq_nonneg ‖k‖])
  have hω_pos : 0 < modeDispersion m k := modeDispersion_pos hm k
  have hsqrt_le : Real.sqrt (ħ / (2 * modeDispersion m k)) ≤ Real.sqrt (ħ / (2 * m)) :=
    Real.sqrt_le_sqrt (div_le_div_of_nonneg_left hħ (by positivity) (by linarith))
  have hsem := SchwartzMap.one_add_le_sup_seminorm_apply (𝕜 := ℂ)
    (m := (d + 1, 0)) (k := d + 1) (n := 0) le_rfl le_rfl g (shellEvalPoint d m k)
  rw [norm_iteratedFDeriv_zero] at hsem
  set M := ((Finset.Iic (d + 1, 0)).sup
    (schwartzSeminormFamily ℂ (WithLp 2 (ℝ × EuclideanSpace ℝ (Fin d))) ℂ)) g
  have h1k_pos : 0 < 1 + ‖k‖ := by linarith [norm_nonneg k]
  have hpow_le : (1 + ‖k‖) ^ (d + 1) * ‖g (shellEvalPoint d m k)‖ ≤
      (4 * Real.pi) ^ (d + 1) * M := by
    have h1 := pow_le_pow_left₀ h1k_pos.le (one_add_norm_le_shellEvalPoint d m k) (d + 1)
    rw [mul_pow] at h1
    calc (1 + ‖k‖) ^ (d + 1) * ‖g (shellEvalPoint d m k)‖
        ≤ ((2 * Real.pi) ^ (d + 1) * (1 + ‖shellEvalPoint d m k‖) ^ (d + 1)) *
            ‖g (shellEvalPoint d m k)‖ :=
          mul_le_mul_of_nonneg_right h1 (norm_nonneg _)
      _ = (2 * Real.pi) ^ (d + 1) *
            ((1 + ‖shellEvalPoint d m k‖) ^ (d + 1) * ‖g (shellEvalPoint d m k)‖) := by ring
      _ ≤ (2 * Real.pi) ^ (d + 1) * (2 ^ (d + 1) * M) :=
          mul_le_mul_of_nonneg_left hsem (by positivity)
      _ = (4 * Real.pi) ^ (d + 1) * M := by
          rw [← mul_assoc, ← mul_pow]; congr 2; ring
  have hg_le : ‖g (shellEvalPoint d m k)‖ ≤
      ((4 * Real.pi) ^ (d + 1) * M) * (1 + ‖k‖) ^ (-((d + 1 : ℕ) : ℝ)) := by
    rw [Real.rpow_neg h1k_pos.le, Real.rpow_natCast, ← div_eq_mul_inv,
      le_div_iff₀ (pow_pos h1k_pos _), mul_comm]
    exact hpow_le
  unfold shellRestrictFun
  rw [norm_mul, Complex.norm_real, Real.norm_of_nonneg (Real.sqrt_nonneg _)]
  calc Real.sqrt (ħ / (2 * modeDispersion m k)) * ‖g (shellEvalPoint d m k)‖
      ≤ Real.sqrt (ħ / (2 * m)) *
          (((4 * Real.pi) ^ (d + 1) * M) * (1 + ‖k‖) ^ (-((d + 1 : ℕ) : ℝ))) :=
        mul_le_mul hsqrt_le hg_le (norm_nonneg _) (Real.sqrt_nonneg _)
    _ = _ := by ring

theorem shellRestrictFun_memLp_and_norm (d : ℕ) (ħ m : ℝ) (hħ : 0 ≤ ħ) (hm : 0 < m)
    (g : SchwartzMap (WithLp 2 (ℝ × EuclideanSpace ℝ (Fin d))) ℂ) :
    let I : ℝ := ∫ k : EuclideanSpace ℝ (Fin d), (1 + ‖k‖) ^ (-((2 * (d + 1) : ℕ) : ℝ))
    MemLp (shellRestrictFun d ħ m g) 2 (volume : Measure (EuclideanSpace ℝ (Fin d))) ∧
      (∫ k : EuclideanSpace ℝ (Fin d), ‖shellRestrictFun d ħ m g k‖ ^ 2) ≤
        (Real.sqrt (ħ / (2 * m)) * (4 * Real.pi) ^ (d + 1) * Real.sqrt I *
          ((Finset.Iic (d + 1, 0)).sup
            (schwartzSeminormFamily ℂ (WithLp 2 (ℝ × EuclideanSpace ℝ (Fin d))) ℂ)) g) ^ 2 := by
  intro I
  have hint_rpow : Integrable (fun k : EuclideanSpace ℝ (Fin d) ↦
      (1 + ‖k‖) ^ (-((2 * (d + 1) : ℕ) : ℝ))) (volume : Measure (EuclideanSpace ℝ (Fin d))) := by
    apply integrable_one_add_norm
    rw [finrank_euclideanSpace_fin]
    exact_mod_cast (by omega : d < 2 * (d + 1))
  have hI_nn : 0 ≤ I := integral_nonneg fun k ↦ Real.rpow_nonneg (by linarith [norm_nonneg k]) _
  have hcont : Continuous (shellRestrictFun d ħ m g) := by
    unfold shellRestrictFun
    refine Continuous.mul ?_ (g.continuous.comp (shellEvalPoint_continuous d m))
    apply Complex.continuous_ofReal.comp
    apply Real.continuous_sqrt.comp
    refine continuous_const.div (continuous_const.mul (by unfold modeDispersion; fun_prop)) ?_
    intro k; exact (mul_pos two_pos (modeDispersion_pos hm k)).ne'
  set C := Real.sqrt (ħ / (2 * m)) * (4 * Real.pi) ^ (d + 1) *
    ((Finset.Iic (d + 1, 0)).sup
      (schwartzSeminormFamily ℂ (WithLp 2 (ℝ × EuclideanSpace ℝ (Fin d))) ℂ)) g
  have hC_nn : 0 ≤ C := by
    refine mul_nonneg (mul_nonneg (Real.sqrt_nonneg _) (by positivity)) ?_
    exact apply_nonneg _ g
  have hpt (k : EuclideanSpace ℝ (Fin d)) :
      ‖shellRestrictFun d ħ m g k‖ ^ 2 ≤ C ^ 2 * (1 + ‖k‖) ^ (-((2 * (d + 1) : ℕ) : ℝ)) := by
    have hb := shellRestrictFun_norm_le d ħ m hħ hm g k
    have hsq := pow_le_pow_left₀ (norm_nonneg _) hb 2
    rw [mul_pow, ← Real.rpow_natCast ((1 + ‖k‖) ^ _), ← Real.rpow_mul (by linarith [norm_nonneg k])] at hsq
    refine hsq.trans_eq ?_
    congr 2; push_cast; ring
  have hsq_int : Integrable (fun k : EuclideanSpace ℝ (Fin d) ↦ ‖shellRestrictFun d ħ m g k‖ ^ 2)
      (volume : Measure (EuclideanSpace ℝ (Fin d))) :=
    (hint_rpow.const_mul (C ^ 2)).mono' (hcont.norm.pow 2).aestronglyMeasurable
      (ae_of_all _ fun k ↦ by rw [Real.norm_of_nonneg (sq_nonneg _)]; exact hpt k)
  refine ⟨(memLp_two_iff_integrable_sq_norm hcont.aestronglyMeasurable).mpr hsq_int, ?_⟩
  calc ∫ k : EuclideanSpace ℝ (Fin d), ‖shellRestrictFun d ħ m g k‖ ^ 2
      ≤ ∫ k : EuclideanSpace ℝ (Fin d), C ^ 2 * (1 + ‖k‖) ^ (-((2 * (d + 1) : ℕ) : ℝ)) :=
        integral_mono hsq_int (hint_rpow.const_mul (C ^ 2)) hpt
    _ = C ^ 2 * I := integral_const_mul _ _
    _ = (Real.sqrt (ħ / (2 * m)) * (4 * Real.pi) ^ (d + 1) * Real.sqrt I *
          ((Finset.Iic (d + 1, 0)).sup
            (schwartzSeminormFamily ℂ (WithLp 2 (ℝ × EuclideanSpace ℝ (Fin d))) ℂ)) g) ^ 2 := by
        have hI : Real.sqrt I ^ 2 = I := Real.sq_sqrt hI_nn
        dsimp [C]
        calc (Real.sqrt (ħ / (2 * m)) * (4 * Real.pi) ^ (d + 1) *
              ((Finset.Iic (d + 1, 0)).sup
                (schwartzSeminormFamily ℂ (WithLp 2 (ℝ × EuclideanSpace ℝ (Fin d))) ℂ)) g) ^ 2 * I
            = (Real.sqrt (ħ / (2 * m)) * (4 * Real.pi) ^ (d + 1) *
              ((Finset.Iic (d + 1, 0)).sup
                (schwartzSeminormFamily ℂ (WithLp 2 (ℝ × EuclideanSpace ℝ (Fin d))) ℂ)) g) ^ 2 *
              Real.sqrt I ^ 2 := by rw [hI]
          _ = _ := by ring

/-- Continuous `ℂ`-linear mass-shell restriction map
`SchwartzMap (WithLp 2 (ℝ × Space d)) ℂ →L[ℂ] Lp ℂ 2 volume`. -/
noncomputable def shellRestrict (d : ℕ) (ħ m : ℝ) (hħ : 0 ≤ ħ) (hm : 0 < m) :
    SchwartzMap (WithLp 2 (ℝ × EuclideanSpace ℝ (Fin d))) ℂ →L[ℂ]
      Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d))) :=
  SchwartzMap.mkCLMtoNormedSpace (𝕜 := ℂ) (𝕜' := ℂ) (σ := RingHom.id ℂ)
    (fun g ↦ (shellRestrictFun_memLp_and_norm d ħ m hħ hm g).1.toLp (shellRestrictFun d ħ m g))
    (fun g₁ g₂ ↦ by
      apply Lp.ext
      let u₁ := (shellRestrictFun_memLp_and_norm d ħ m hħ hm g₁).1.toLp (shellRestrictFun d ħ m g₁)
      let u₂ := (shellRestrictFun_memLp_and_norm d ħ m hħ hm g₂).1.toLp (shellRestrictFun d ħ m g₂)
      filter_upwards [(shellRestrictFun_memLp_and_norm d ħ m hħ hm (g₁ + g₂)).1.coeFn_toLp,
        Lp.coeFn_add u₁ u₂,
        (shellRestrictFun_memLp_and_norm d ħ m hħ hm g₁).1.coeFn_toLp,
        (shellRestrictFun_memLp_and_norm d ħ m hħ hm g₂).1.coeFn_toLp] with k h12 hadd h1 h2
      rw [h12, hadd, Pi.add_apply]
      change shellRestrictFun d ħ m (g₁ + g₂) k = (u₁ : EuclideanSpace ℝ (Fin d) → ℂ) k +
        (u₂ : EuclideanSpace ℝ (Fin d) → ℂ) k
      rw [h1, h2]
      simp only [shellRestrictFun, add_apply, mul_add])
    (fun c g ↦ by
      apply Lp.ext
      let u := (shellRestrictFun_memLp_and_norm d ħ m hħ hm g).1.toLp (shellRestrictFun d ħ m g)
      filter_upwards [(shellRestrictFun_memLp_and_norm d ħ m hħ hm (c • g)).1.coeFn_toLp,
        Lp.coeFn_smul c u,
        (shellRestrictFun_memLp_and_norm d ħ m hħ hm g).1.coeFn_toLp] with k hcg hsmul hg
      rw [hcg, RingHom.id_apply, hsmul, Pi.smul_apply]
      change shellRestrictFun d ħ m (c • g) k = c • (u : EuclideanSpace ℝ (Fin d) → ℂ) k
      rw [hg]
      simp only [shellRestrictFun, smul_apply, smul_eq_mul]
      ring)
    (by
      let I : ℝ := ∫ k : EuclideanSpace ℝ (Fin d), (1 + ‖k‖) ^ (-((2 * (d + 1) : ℕ) : ℝ))
      refine ⟨Finset.Iic (d + 1, 0),
        Real.sqrt (ħ / (2 * m)) * (4 * Real.pi) ^ (d + 1) * Real.sqrt I, by positivity, fun g ↦ ?_⟩
      have hbound := (shellRestrictFun_memLp_and_norm d ħ m hħ hm g).2
      have hsq : ‖(shellRestrictFun_memLp_and_norm d ħ m hħ hm g).1.toLp
            (shellRestrictFun d ħ m g)‖ ^ 2 ≤
          (Real.sqrt (ħ / (2 * m)) * (4 * Real.pi) ^ (d + 1) * Real.sqrt I *
            ((Finset.Iic (d + 1, 0)).sup
              (schwartzSeminormFamily ℂ (WithLp 2 (ℝ × EuclideanSpace ℝ (Fin d))) ℂ)) g) ^ 2 := by
        rw [FeatureDensity.l2_norm_sq_eq_integral]
        have heq : (∫ k : EuclideanSpace ℝ (Fin d),
              ‖((shellRestrictFun_memLp_and_norm d ħ m hħ hm g).1.toLp
                (shellRestrictFun d ħ m g) : EuclideanSpace ℝ (Fin d) → ℂ) k‖ ^ 2) =
            ∫ k : EuclideanSpace ℝ (Fin d), ‖shellRestrictFun d ħ m g k‖ ^ 2 := by
          refine integral_congr_ae ?_
          filter_upwards [(shellRestrictFun_memLp_and_norm d ħ m hħ hm g).1.coeFn_toLp] with k hk
          exact congrArg (fun z : ℂ ↦ ‖z‖ ^ 2) hk
        rw [heq]; exact hbound
      have hrhs : 0 ≤ Real.sqrt (ħ / (2 * m)) * (4 * Real.pi) ^ (d + 1) * Real.sqrt I *
          ((Finset.Iic (d + 1, 0)).sup
            (schwartzSeminormFamily ℂ (WithLp 2 (ℝ × EuclideanSpace ℝ (Fin d))) ℂ)) g :=
        mul_nonneg (by positivity) (apply_nonneg _ g)
      nlinarith [norm_nonneg ((shellRestrictFun_memLp_and_norm d ħ m hħ hm g).1.toLp
        (shellRestrictFun d ħ m g)), hrhs])

theorem shellRestrict_apply_ae (d : ℕ) (ħ m : ℝ) (hħ : 0 ≤ ħ) (hm : 0 < m)
    (g : SchwartzMap (WithLp 2 (ℝ × EuclideanSpace ℝ (Fin d))) ℂ) :
    (shellRestrict d ħ m hħ hm g : EuclideanSpace ℝ (Fin d) → ℂ) =ᵐ[volume]
      shellRestrictFun d ħ m g :=
  (shellRestrictFun_memLp_and_norm d ħ m hħ hm g).1.coeFn_toLp

end WightmanField

/-- Continuous `ℂ`-linear positive-energy mass-shell feature map
`SchwartzMap (ℝ × Space d) ℂ →L[ℂ] Lp ℂ 2 volume`. -/
noncomputable def shellFeatureCLM (d : ℕ) (ħ m : ℝ) (hħ : 0 ≤ ħ) (hm : 0 < m) :
    SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℂ →L[ℂ]
      Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d))) :=
  (WightmanField.shellRestrict d ħ m hħ hm).comp
    ((SchwartzMap.fourierTransformCLM ℂ).comp
      (SchwartzMap.compCLMOfContinuousLinearEquiv ℂ (WightmanField.spacetimeToL2 d)))

/-- Positive-energy mass-shell feature vector `u_f ∈ Lp ℂ 2 volume` of a spacetime Schwartz test. -/
noncomputable def shellFeature (d : ℕ) (ħ m : ℝ) (hħ : 0 ≤ ħ) (hm : 0 < m)
    (f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℂ) :
    Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d))) :=
  shellFeatureCLM d ħ m hħ hm f

/-- Real-test specialization `f ↦ shellFeature (ofReal f)` as an `ℝ`-linear continuous map. -/
noncomputable def shellFeatureReal (d : ℕ) (ħ m : ℝ) (hħ : 0 ≤ ħ) (hm : 0 < m) :
    SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℝ →L[ℝ]
      Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d))) :=
  ((shellFeatureCLM d ħ m hħ hm).restrictScalars ℝ).comp FeatureDensity.ofRealSchwartz

/-- Continuity of `f ↦ shellFeature ħ m f` from `SchwartzMap (ℝ × Space d) ℂ` into `Lp ℂ 2 volume`. -/
theorem shellFeature_continuous (d : ℕ) (ħ m : ℝ) (hħ : 0 ≤ ħ) (hm : 0 < m) :
    Continuous (shellFeature d ħ m hħ hm) :=
  (shellFeatureCLM d ħ m hħ hm).continuous

/-- Almost-everywhere integral representation of `shellFeature`:
`u_f(k) = √(ħ / (2 ω_m(k))) * ∫ (t, x), exp(i (t ω_m(k) - ⟨x, k⟩)) * f(t, x) dt dx`. -/
theorem shellFeature_apply_ae (d : ℕ) (ħ m : ℝ) (hħ : 0 ≤ ħ) (hm : 0 < m)
    (f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℂ) :
    (shellFeature d ħ m hħ hm f : EuclideanSpace ℝ (Fin d) → ℂ) =ᵐ[volume]
      fun k ↦ ((Real.sqrt (ħ / (2 * modeDispersion m k)) : ℝ) : ℂ) *
        ∫ p : ℝ × EuclideanSpace ℝ (Fin d),
          Complex.exp (Complex.I * ((p.1 * modeDispersion m k - inner ℝ p.2 k : ℝ) : ℂ)) * f p := by
  let g := SchwartzMap.compCLMOfContinuousLinearEquiv ℂ (WightmanField.spacetimeToL2 d) f
  let gf := SchwartzMap.fourierTransformCLM ℂ g
  filter_upwards [WightmanField.shellRestrict_apply_ae d ħ m hħ hm gf] with k hk
  change ((WightmanField.shellRestrict d ħ m hħ hm gf) : EuclideanSpace ℝ (Fin d) → ℂ) k = _
  rw [hk]
  unfold WightmanField.shellRestrictFun
  congr 1
  change (𝓕 g) (WightmanField.shellEvalPoint d m k) = _
  rw [SchwartzMap.fourier_coe, Real.fourier_eq]
  have hpres : MeasurePreserving (MeasurableEquiv.toLp 2 (ℝ × EuclideanSpace ℝ (Fin d))).symm
      volume volume :=
    WithLp.volume_preserving_ofLp ℝ (EuclideanSpace ℝ (Fin d))
  rw [← hpres.integral_comp' (fun p : ℝ × EuclideanSpace ℝ (Fin d) ↦
    Complex.exp (Complex.I * ((p.1 * modeDispersion m k - inner ℝ p.2 k : ℝ) : ℂ)) * f p)]
  refine integral_congr_ae (ae_of_all _ fun v ↦ ?_)
  dsimp only
  have hgv : g v = f (WithLp.ofLp v) := rfl
  change 𝐞 (-inner ℝ v (WightmanField.shellEvalPoint d m k)) • g v =
    Complex.exp (Complex.I * (((WithLp.ofLp v).1 * modeDispersion m k - inner ℝ (WithLp.ofLp v).2 k : ℝ) : ℂ)) *
      f (WithLp.ofLp v)
  rw [hgv, Circle.smul_def, smul_eq_mul, Real.fourierChar_apply]
  congr 1
  have hinner : inner ℝ v (WightmanField.shellEvalPoint d m k) =
      (WithLp.ofLp v).1 * (-(modeDispersion m k) / (2 * Real.pi)) +
        inner ℝ (WithLp.ofLp v).2 ((2 * Real.pi)⁻¹ • k) := by
    rw [WithLp.prod_inner_apply]
    simp [WightmanField.shellEvalPoint, real_inner_comm]; ring
  rw [hinner, real_inner_smul_right]
  have hpi : 2 * Real.pi ≠ 0 := (mul_pos two_pos Real.pi_pos).ne'
  congr 1
  have hreal : 2 * Real.pi * -((WithLp.ofLp v).1 * (-modeDispersion m k / (2 * Real.pi)) +
      (2 * Real.pi)⁻¹ * inner ℝ (WithLp.ofLp v).2 k) =
      (WithLp.ofLp v).1 * modeDispersion m k - inner ℝ (WithLp.ofLp v).2 k := by
    field_simp [hpi]; ring
  rw [hreal]; ring

/-- Pointwise complex conjugation of a spacetime Schwartz test `f ↦ f̄`. -/
noncomputable def conjSchwartz {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] :
    SchwartzMap E ℂ →L[ℝ] SchwartzMap E ℂ :=
  SchwartzMap.postcompCLM Complex.conjCLE.toContinuousLinearMap

@[simp]
theorem conjSchwartz_apply {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (f : SchwartzMap E ℂ) (x : E) :
    conjSchwartz f x = star (f x) := rfl

theorem conjSchwartz_ofReal {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (f : SchwartzMap E ℝ) :
    conjSchwartz (FeatureDensity.ofRealSchwartz f) = FeatureDensity.ofRealSchwartz f := by
  ext x
  simp [conjSchwartz_apply, FeatureDensity.ofRealSchwartz]

/-- Concrete Wightman quantum field operator `Φ_W(f) = c*(u_f) + c(u_{f̄})` on
`FiniteParticleFock volume` for spacetime Schwartz tests `f : SchwartzMap (ℝ × Space d) ℂ`. -/
noncomputable def wightmanField (d : ℕ) (ħ m : ℝ) (hħ : 0 ≤ ħ) (hm : 0 < m)
    (f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℂ) :
    FiniteParticleFock (volume : Measure (EuclideanSpace ℝ (Fin d))) →ₗ[ℂ]
      FiniteParticleFock (volume : Measure (EuclideanSpace ℝ (Fin d))) :=
  contField volume (shellFeature d ħ m hħ hm f) (shellFeature d ħ m hħ hm (conjSchwartz f))

private theorem inner_add_right_gen {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (φ a b : H) : inner ℂ φ (a + b) = inner ℂ φ a + inner ℂ φ b :=
  inner_add_right φ a b

private theorem inner_smul_right_gen {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (φ a : H) (c : ℂ) : inner ℂ φ (c • a) = c * inner ℂ φ a :=
  inner_smul_right φ a c

private theorem submodule_coe_add_eq {H : Type*} [AddCommGroup H] [Module ℂ H]
    (S : Submodule ℂ H) (x y : S) : (x + y).1 = x.1 + y.1 := rfl

private theorem submodule_coe_smul_eq {H : Type*} [AddCommGroup H] [Module ℂ H]
    (S : Submodule ℂ H) (c : ℂ) (x : S) : (c • x).1 = c • x.1 := rfl

private theorem wightmanField_inner_eq (d : ℕ) (ħ m : ℝ) (hħ : 0 ≤ ħ) (hm : 0 < m)
    (φ ψ : FiniteParticleFock (volume : Measure (EuclideanSpace ℝ (Fin d))))
    (f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℂ) :
    inner ℂ φ.1 (wightmanField d ħ m hħ hm f ψ).1 =
      inner ℂ φ.1 (contCreate volume (shellFeature d ħ m hħ hm f) ψ).1 +
        inner ℂ φ.1 (contAnnihil volume (shellFeature d ħ m hħ hm (conjSchwartz f)) ψ).1 :=
  inner_add_right_gen φ.1 _ _

/-- Tempered-distribution continuity: for every `φ, ψ ∈ FiniteParticleFock volume`, the matrix
element `f ↦ ⟪φ, Φ_W(f) ψ⟫` is continuous on `SchwartzMap (ℝ × Space d) ℂ`. -/
theorem wightman_matrixElement_continuous (d : ℕ) (ħ m : ℝ) (hħ : 0 ≤ ħ) (hm : 0 < m)
    (φ ψ : FiniteParticleFock (volume : Measure (EuclideanSpace ℝ (Fin d)))) :
    Continuous (fun f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℂ ↦
      inner ℂ φ.1 (wightmanField d ħ m hħ hm f ψ).1) := by
  have hc1 : Continuous (fun f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℂ ↦
      inner ℂ φ.1 (contCreate volume (shellFeature d ħ m hħ hm f) ψ).1) :=
    continuous_const.inner
      ((contCreate_continuous_in_test volume ψ).comp (shellFeature_continuous d ħ m hħ hm))
  have hc2 : Continuous (fun f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℂ ↦
      inner ℂ φ.1 (contAnnihil volume (shellFeature d ħ m hħ hm (conjSchwartz f)) ψ).1) :=
    continuous_const.inner
      ((contAnnihil_continuous_in_test volume ψ).comp
        ((shellFeature_continuous d ħ m hħ hm).comp conjSchwartz.continuous))
  have heq : (fun f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℂ ↦
        inner ℂ φ.1 (wightmanField d ħ m hħ hm f ψ).1) =
      fun f ↦ inner ℂ φ.1 (contCreate volume (shellFeature d ħ m hħ hm f) ψ).1 +
        inner ℂ φ.1 (contAnnihil volume (shellFeature d ħ m hħ hm (conjSchwartz f)) ψ).1 :=
    funext (wightmanField_inner_eq d ħ m hħ hm φ ψ)
  rw [heq]
  exact hc1.add hc2

private theorem contField_inner_add {X : Type*} [MeasurableSpace X] {μ : Measure X} [SigmaFinite μ]
    (φ ψ : FiniteParticleFock μ) (u₁ u₂ v₁ v₂ : Lp ℂ 2 μ) :
    inner ℂ φ.1 (contField μ (u₁ + u₂) (v₁ + v₂) ψ).1 =
      inner ℂ φ.1 (contField μ u₁ v₁ ψ).1 + inner ℂ φ.1 (contField μ u₂ v₂ ψ).1 := by
  have hL : inner ℂ φ.1 (contField μ (u₁ + u₂) (v₁ + v₂) ψ).1 =
      inner ℂ φ.1 (contCreate μ (u₁ + u₂) ψ).1 + inner ℂ φ.1 (contAnnihil μ (v₁ + v₂) ψ).1 :=
    inner_add_right_gen φ.1 _ _
  have h1 : inner ℂ φ.1 (contField μ u₁ v₁ ψ).1 =
      inner ℂ φ.1 (contCreate μ u₁ ψ).1 + inner ℂ φ.1 (contAnnihil μ v₁ ψ).1 :=
    inner_add_right_gen φ.1 _ _
  have h2 : inner ℂ φ.1 (contField μ u₂ v₂ ψ).1 =
      inner ℂ φ.1 (contCreate μ u₂ ψ).1 + inner ℂ φ.1 (contAnnihil μ v₂ ψ).1 :=
    inner_add_right_gen φ.1 _ _
  have hc : inner ℂ φ.1 (contCreate μ (u₁ + u₂) ψ).1 =
      inner ℂ φ.1 (contCreate μ u₁ ψ).1 + inner ℂ φ.1 (contCreate μ u₂ ψ).1 :=
    (congrArg (fun z : FiniteParticleFock μ ↦ inner ℂ φ.1 z.1) (contCreate_add_test μ u₁ u₂ ψ)).trans
      (inner_add_right_gen φ.1 _ _)
  have ha : inner ℂ φ.1 (contAnnihil μ (v₁ + v₂) ψ).1 =
      inner ℂ φ.1 (contAnnihil μ v₁ ψ).1 + inner ℂ φ.1 (contAnnihil μ v₂ ψ).1 :=
    (congrArg (fun z : FiniteParticleFock μ ↦ inner ℂ φ.1 z.1) (contAnnihil_add_test μ v₁ v₂ ψ)).trans
      (inner_add_right_gen φ.1 _ _)
  have halg : ∀ a b c d : ℂ, (a + b) + (c + d) = (a + c) + (b + d) := fun _ _ _ _ ↦ by ring
  exact hL.trans ((congrArg₂ (· + ·) hc ha).trans
    ((halg _ _ _ _).trans (congrArg₂ (· + ·) h1.symm h2.symm)))

private theorem contField_inner_smul {X : Type*} [MeasurableSpace X] {μ : Measure X} [SigmaFinite μ]
    (φ ψ : FiniteParticleFock μ) (c : ℂ) (u v : Lp ℂ 2 μ) :
    inner ℂ φ.1 (contField μ (c • u) (star c • v) ψ).1 =
      c * inner ℂ φ.1 (contField μ u v ψ).1 := by
  have hL : inner ℂ φ.1 (contField μ (c • u) (star c • v) ψ).1 =
      inner ℂ φ.1 (contCreate μ (c • u) ψ).1 + inner ℂ φ.1 (contAnnihil μ (star c • v) ψ).1 :=
    inner_add_right_gen φ.1 _ _
  have hR : inner ℂ φ.1 (contField μ u v ψ).1 =
      inner ℂ φ.1 (contCreate μ u ψ).1 + inner ℂ φ.1 (contAnnihil μ v ψ).1 :=
    inner_add_right_gen φ.1 _ _
  have hc : inner ℂ φ.1 (contCreate μ (c • u) ψ).1 = c * inner ℂ φ.1 (contCreate μ u ψ).1 :=
    (congrArg (fun z : FiniteParticleFock μ ↦ inner ℂ φ.1 z.1) (contCreate_smul_test μ c u ψ)).trans
      (inner_smul_right_gen φ.1 _ c)
  have ha : inner ℂ φ.1 (contAnnihil μ (star c • v) ψ).1 =
      c * inner ℂ φ.1 (contAnnihil μ v ψ).1 := by
    have h := (congrArg (fun z : FiniteParticleFock μ ↦ inner ℂ φ.1 z.1)
      (contAnnihil_smul_test μ (star c) v ψ)).trans (inner_smul_right_gen φ.1 _ (star (star c)))
    rwa [star_star] at h
  have halg : ∀ z a b : ℂ, z * a + z * b = z * (a + b) := fun _ _ _ ↦ by ring
  exact hL.trans ((congrArg₂ (· + ·) hc ha).trans
    ((halg _ _ _).trans (congrArg (c * ·) hR.symm)))

theorem wightmanField_ofReal (d : ℕ) (ħ m : ℝ) (hħ : 0 ≤ ħ) (hm : 0 < m)
    (f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℝ) :
    wightmanField d ħ m hħ hm (FeatureDensity.ofRealSchwartz f) =
      contField volume (shellFeatureReal d ħ m hħ hm f) (shellFeatureReal d ħ m hħ hm f) :=
  congrArg (contField volume (shellFeatureReal d ħ m hħ hm f))
    (congrArg (shellFeature d ħ m hħ hm) (conjSchwartz_ofReal f))

private theorem inner_symm_of_eq {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    {S : Submodule ℂ H} {A B : S →ₗ[ℂ] S} (hAB : A = B) {φ ψ : S}
    (hB : inner ℂ (B φ).1 ψ.1 = inner ℂ φ.1 (B ψ).1) :
    inner ℂ (A φ).1 ψ.1 = inner ℂ φ.1 (A ψ).1 := by
  subst hAB; exact hB

theorem wightmanField_symm_real (d : ℕ) (ħ m : ℝ) (hħ : 0 ≤ ħ) (hm : 0 < m)
    (f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℝ)
    (φ ψ : FiniteParticleFock (volume : Measure (EuclideanSpace ℝ (Fin d)))) :
    inner ℂ (wightmanField d ħ m hħ hm (FeatureDensity.ofRealSchwartz f) φ).1 ψ.1 =
      inner ℂ φ.1 (wightmanField d ħ m hħ hm (FeatureDensity.ofRealSchwartz f) ψ).1 :=
  inner_symm_of_eq (wightmanField_ofReal d ħ m hħ hm f) (contField_symm volume _ φ ψ)

/-- Each Wightman matrix element `f ↦ ⟪φ, Φ_W(f) ψ⟫` packaged as a `ℂ`-linear tempered
distribution `SchwartzMap (ℝ × Space d) ℂ →L[ℂ] ℂ`. -/
noncomputable def wightmanDist (d : ℕ) (ħ m : ℝ) (hħ : 0 ≤ ħ) (hm : 0 < m)
    (φ ψ : FiniteParticleFock (volume : Measure (EuclideanSpace ℝ (Fin d)))) :
    SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℂ →L[ℂ] ℂ where
  toLinearMap :=
    { toFun := fun f ↦ inner ℂ φ.1 (wightmanField d ħ m hħ hm f ψ).1
      map_add' := fun f g ↦ by
        have h1 : shellFeature d ħ m hħ hm (f + g) =
            shellFeature d ħ m hħ hm f + shellFeature d ħ m hħ hm g :=
          (shellFeatureCLM d ħ m hħ hm).map_add f g
        have h2 : shellFeature d ħ m hħ hm (conjSchwartz (f + g)) =
            shellFeature d ħ m hħ hm (conjSchwartz f) +
              shellFeature d ħ m hħ hm (conjSchwartz g) := by
          rw [conjSchwartz.map_add]
          exact (shellFeatureCLM d ħ m hħ hm).map_add (conjSchwartz f) (conjSchwartz g)
        exact (congrArg₂ (fun u v ↦ inner ℂ φ.1 (contField volume u v ψ).1) h1 h2).trans
          (contField_inner_add φ ψ _ _ _ _)
      map_smul' := fun c f ↦ by
        have h1 : shellFeature d ħ m hħ hm (c • f) = c • shellFeature d ħ m hħ hm f :=
          (shellFeatureCLM d ħ m hħ hm).map_smul c f
        have hconj : conjSchwartz (c • f) = star c • conjSchwartz f := by
          ext x; simp [conjSchwartz_apply]
        have h2 : shellFeature d ħ m hħ hm (conjSchwartz (c • f)) =
            star c • shellFeature d ħ m hħ hm (conjSchwartz f) := by
          rw [hconj]
          exact (shellFeatureCLM d ħ m hħ hm).map_smul (star c) (conjSchwartz f)
        exact (congrArg₂ (fun u v ↦ inner ℂ φ.1 (contField volume u v ψ).1) h1 h2).trans
          (contField_inner_smul φ ψ c _ _) }
  cont := wightman_matrixElement_continuous d ħ m hħ hm φ ψ

end MassShellFeature

/-! #### Concrete Poincaré Unitaries on `Lp ℂ 2 volume` & `momentumFock volume` -/

section PoincareUnitaries

namespace WightmanField

/-- Spacetime translation phase weight `k ↦ exp(i (a⁰ ω_m(k) - ⟨a, k⟩))`. -/
noncomputable def translationPhase (d : ℕ) (m : ℝ) (a : ℝ × EuclideanSpace ℝ (Fin d))
    (k : EuclideanSpace ℝ (Fin d)) : ℂ :=
  Complex.exp (Complex.I * ((a.1 * modeDispersion m k - inner ℝ a.2 k : ℝ) : ℂ))

theorem translationPhase_norm (d : ℕ) (m : ℝ) (a : ℝ × EuclideanSpace ℝ (Fin d))
    (k : EuclideanSpace ℝ (Fin d)) :
    ‖translationPhase d m a k‖ = 1 := by
  unfold translationPhase
  rw [mul_comm Complex.I]
  exact Complex.norm_exp_ofReal_mul_I _

theorem translationPhase_memLp (d : ℕ) (m : ℝ) (a : ℝ × EuclideanSpace ℝ (Fin d)) :
    MemLp (translationPhase d m a) (⊤ : ENNReal) (volume : Measure (EuclideanSpace ℝ (Fin d))) := by
  have hmeas : Measurable (translationPhase d m a) := by
    unfold translationPhase modeDispersion
    fun_prop
  exact memLp_top_of_bound hmeas.aestronglyMeasurable 1
    (ae_of_all _ fun k ↦ (translationPhase_norm d m a k).le)

end WightmanField

/-- One-particle spacetime translation unitary `u(k) ↦ exp(i (a⁰ ω_m(k) - ⟨a, k⟩)) u(k)`
on `Lp ℂ 2 volume`. -/
noncomputable def translationUnitary (d : ℕ) (m : ℝ) (a : ℝ × EuclideanSpace ℝ (Fin d)) :
    Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d))) ≃ₗᵢ[ℂ]
      Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d))) :=
  let M_a := FeatureDensity.complexMultiplier (WightmanField.translationPhase d m a)
    (WightmanField.translationPhase_memLp d m a)
  let M_na := FeatureDensity.complexMultiplier (WightmanField.translationPhase d m (-a))
    (WightmanField.translationPhase_memLp d m (-a))
  { toLinearEquiv :=
      { toFun := M_a
        invFun := M_na
        map_add' := M_a.map_add
        map_smul' := M_a.map_smul
        left_inv := fun u ↦ by
          apply Lp.ext
          filter_upwards [FeatureDensity.complexMultiplier_apply_ae _ _ (M_a u),
            FeatureDensity.complexMultiplier_apply_ae _ _ u] with k h1 h2
          rw [h1, h2, ← mul_assoc]
          unfold WightmanField.translationPhase
          rw [← Complex.exp_add]
          have h0 : Complex.I * (((-a).1 * modeDispersion m k - inner ℝ (-a).2 k : ℝ) : ℂ) +
              Complex.I * ((a.1 * modeDispersion m k - inner ℝ a.2 k : ℝ) : ℂ) = 0 := by
            simp only [Prod.fst_neg, Prod.snd_neg, inner_neg_left, neg_mul, sub_neg_eq_add]
            push_cast; ring
          rw [h0, Complex.exp_zero, one_mul]
        right_inv := fun u ↦ by
          apply Lp.ext
          filter_upwards [FeatureDensity.complexMultiplier_apply_ae _ _ (M_na u),
            FeatureDensity.complexMultiplier_apply_ae _ _ u] with k h1 h2
          rw [h1, h2, ← mul_assoc]
          unfold WightmanField.translationPhase
          rw [← Complex.exp_add]
          have h0 : Complex.I * ((a.1 * modeDispersion m k - inner ℝ a.2 k : ℝ) : ℂ) +
              Complex.I * (((-a).1 * modeDispersion m k - inner ℝ (-a).2 k : ℝ) : ℂ) = 0 := by
            simp only [Prod.fst_neg, Prod.snd_neg, inner_neg_left, neg_mul, sub_neg_eq_add]
            push_cast; ring
          rw [h0, Complex.exp_zero, one_mul] }
    norm_map' := FeatureDensity.complexMultiplier_norm_eq _ _ (WightmanField.translationPhase_norm d m a) }

theorem translationUnitary_apply_ae (d : ℕ) (m : ℝ) (a : ℝ × EuclideanSpace ℝ (Fin d))
    (u : Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d)))) :
    (translationUnitary d m a u : EuclideanSpace ℝ (Fin d) → ℂ) =ᵐ[volume]
      fun k ↦ Complex.exp (Complex.I * ((a.1 * modeDispersion m k - inner ℝ a.2 k : ℝ) : ℂ)) * u k :=
  FeatureDensity.complexMultiplier_apply_ae _ _ u

theorem translationUnitary_zero (d : ℕ) (m : ℝ) :
    translationUnitary d m 0 = 1 := by
  ext u : 1; apply Lp.ext
  filter_upwards [translationUnitary_apply_ae d m 0 u] with k hk
  simpa using hk

theorem translationUnitary_add (d : ℕ) (m : ℝ) (a b : ℝ × EuclideanSpace ℝ (Fin d)) :
    translationUnitary d m (a + b) = translationUnitary d m a * translationUnitary d m b := by
  ext u : 1; apply Lp.ext
  filter_upwards [translationUnitary_apply_ae d m (a + b) u,
    translationUnitary_apply_ae d m a (translationUnitary d m b u),
    translationUnitary_apply_ae d m b u] with k hab ha hb
  change (translationUnitary d m (a + b) u : EuclideanSpace ℝ (Fin d) → ℂ) k =
    (translationUnitary d m a (translationUnitary d m b u) : EuclideanSpace ℝ (Fin d) → ℂ) k
  rw [hab, ha, hb, ← mul_assoc, ← Complex.exp_add]
  congr 2
  simp only [Prod.fst_add, Prod.snd_add, inner_add_left]
  push_cast; ring

/-- Second-quantized spacetime translation unitary `U(a)` on `momentumFock volume`. -/
noncomputable def fockTranslation (d : ℕ) (m : ℝ) (a : ℝ × EuclideanSpace ℝ (Fin d)) :
    momentumFock (volume : Measure (EuclideanSpace ℝ (Fin d))) ≃ₗᵢ[ℂ]
      momentumFock (volume : Measure (EuclideanSpace ℝ (Fin d))) :=
  secondQuantize volume (translationUnitary d m a)

/-- One-particle `O(d)` spatial rotation unitary `u(k) ↦ u(R⁻¹ k)` on `Lp ℂ 2 volume`. -/
noncomputable def rotationUnitary (d : ℕ)
    (R : EuclideanSpace ℝ (Fin d) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin d)) :
    Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d))) ≃ₗᵢ[ℂ]
      Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d))) :=
  MassShell.pullback R.symm.toMeasurableEquiv R.symm.measurePreserving

/-- Second-quantized `O(d)` spatial rotation unitary `U(R)` on `momentumFock volume`. -/
noncomputable def fockRotation (d : ℕ)
    (R : EuclideanSpace ℝ (Fin d) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin d)) :
    momentumFock (volume : Measure (EuclideanSpace ℝ (Fin d))) ≃ₗᵢ[ℂ]
      momentumFock (volume : Measure (EuclideanSpace ℝ (Fin d))) :=
  secondQuantize volume (rotationUnitary d R)

/-- Canonical unitary isomorphism `L²(d^d k / (2 ω_m(k))) ≃ₗᵢ[ℂ] L²(d^d k)` multiplying by
`1 / √(2 ω_m(k))`. -/
noncomputable def massShellToVolumeIso (d : ℕ) (m : ℝ) (hm : 0 < m) :
    Lp ℂ 2 (massShellMeasure d m) ≃ₗᵢ[ℂ]
      Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d))) :=
  let w : EuclideanSpace ℝ (Fin d) → ℝ := fun k ↦ Real.sqrt (2 * modeDispersion m k)
  have hw_pos : ∀ k, 0 < w k := fun k ↦ Real.sqrt_pos.mpr (mul_pos two_pos (modeDispersion_pos hm k))
  have hw_meas : Measurable w := by unfold w modeDispersion; fun_prop
  have hdens_meas : Measurable (fun k : EuclideanSpace ℝ (Fin d) ↦
      ENNReal.ofReal ((2 * modeDispersion m k)⁻¹)) := by
    unfold modeDispersion; fun_prop
  have hae_iff : ∀ {P : EuclideanSpace ℝ (Fin d) → Prop},
      (∀ᵐ k ∂(massShellMeasure d m), P k) ↔ ∀ᵐ k ∂(volume : Measure (EuclideanSpace ℝ (Fin d))), P k := by
    intro P
    unfold massShellMeasure
    rw [ae_withDensity_iff hdens_meas]
    constructor
    · intro h; filter_upwards [h] with k hk
      exact hk (ENNReal.ofReal_pos.mpr (inv_pos.mpr (mul_pos two_pos (modeDispersion_pos hm k)))).ne'
    · intro h; filter_upwards [h] with k hk _; exact hk
  have hfwd_mem : ∀ f : Lp ℂ 2 (massShellMeasure d m),
      MemLp (fun k ↦ ((w k)⁻¹ : ℂ) * f k) 2 (volume : Measure (EuclideanSpace ℝ (Fin d))) := by
    intro f
    have hf_ae : AEStronglyMeasurable f (volume : Measure (EuclideanSpace ℝ (Fin d))) := by
      obtain ⟨g, hg, hfg⟩ := Lp.aestronglyMeasurable f
      exact ⟨g, hg, hae_iff.mp hfg⟩
    have hwinv_meas : Measurable (fun k : EuclideanSpace ℝ (Fin d) ↦ ((w k)⁻¹ : ℂ)) :=
      (Complex.continuous_ofReal.measurable.comp hw_meas).inv
    have hprod_ae : AEStronglyMeasurable (fun k ↦ ((w k)⁻¹ : ℂ) * f k) volume :=
      hwinv_meas.aestronglyMeasurable.mul hf_ae
    refine (memLp_two_iff_integrable_sq_norm hprod_ae).mpr ?_
    have hf_sq : Integrable (fun k ↦ ‖f k‖ ^ 2) (massShellMeasure d m) :=
      (memLp_two_iff_integrable_sq_norm (Lp.aestronglyMeasurable f)).mp (Lp.memLp f)
    have hf_lt : ∫⁻ k, ENNReal.ofReal ‖f k‖ ^ 2 ∂(massShellMeasure d m) < ⊤ := by
      have := hf_sq.2
      simpa only [HasFiniteIntegral, Real.enorm_eq_ofReal (sq_nonneg _),
        ENNReal.ofReal_pow (norm_nonneg _)] using this
    refine ⟨hprod_ae.norm.pow 2, ?_⟩
    rw [HasFiniteIntegral]
    have hl : (∫⁻ k, ‖((w k)⁻¹ : ℂ) * f k‖ₑ ^ 2 ∂volume) =
        ∫⁻ k, ENNReal.ofReal ‖f k‖ ^ 2 ∂(massShellMeasure d m) := by
      have hm_f2 : Measurable (fun k : EuclideanSpace ℝ (Fin d) ↦ ENNReal.ofReal ‖f k‖ ^ 2) :=
        ((Lp.stronglyMeasurable f).measurable.norm.ennreal_ofReal).pow_const 2
      have hwd := lintegral_withDensity_eq_lintegral_mul
        (volume : Measure (EuclideanSpace ℝ (Fin d))) hdens_meas hm_f2
      change _ = ∫⁻ k, ENNReal.ofReal ‖f k‖ ^ 2 ∂(volume.withDensity _)
      rw [hwd]
      refine lintegral_congr_ae (ae_of_all _ fun k ↦ ?_)
      dsimp only [Pi.mul_apply]
      rw [enorm_mul, ← ofReal_norm, ← ofReal_norm, norm_inv,
        Complex.norm_real, Real.norm_of_nonneg (hw_pos k).le, mul_pow,
        ← ENNReal.ofReal_pow (inv_nonneg.mpr (hw_pos k).le), inv_pow,
        Real.sq_sqrt (mul_pos two_pos (modeDispersion_pos hm k)).le]
    have hgoal : (∫⁻ k, ‖‖((w k)⁻¹ : ℂ) * f k‖ ^ 2‖ₑ ∂volume) =
        ∫⁻ k, ‖((w k)⁻¹ : ℂ) * f k‖ₑ ^ 2 ∂volume := by
      refine lintegral_congr_ae (ae_of_all _ fun k ↦ ?_)
      dsimp only
      rw [Real.enorm_eq_ofReal (sq_nonneg _), ENNReal.ofReal_pow (norm_nonneg _),
        ofReal_norm]
    rw [hgoal, hl]
    exact hf_lt
  have hbwd_mem : ∀ g : Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d))),
      MemLp (fun k ↦ (w k : ℂ) * g k) 2 (massShellMeasure d m) := by
    intro g
    have hg_ae : AEStronglyMeasurable g (massShellMeasure d m) := by
      obtain ⟨h, hh, hgh⟩ := Lp.aestronglyMeasurable g
      exact ⟨h, hh, hae_iff.mpr hgh⟩
    have hprod_ae : AEStronglyMeasurable (fun k ↦ (w k : ℂ) * g k) (massShellMeasure d m) :=
      (Complex.continuous_ofReal.measurable.comp hw_meas).aestronglyMeasurable.mul hg_ae
    refine (memLp_two_iff_integrable_sq_norm hprod_ae).mpr ?_
    have hg_sq : Integrable (fun k ↦ ‖g k‖ ^ 2) (volume : Measure (EuclideanSpace ℝ (Fin d))) :=
      (memLp_two_iff_integrable_sq_norm (Lp.aestronglyMeasurable g)).mp (Lp.memLp g)
    have hg_lt : ∫⁻ k, ENNReal.ofReal ‖g k‖ ^ 2 ∂volume < ⊤ := by
      have := hg_sq.2
      simpa only [HasFiniteIntegral, Real.enorm_eq_ofReal (sq_nonneg _),
        ENNReal.ofReal_pow (norm_nonneg _)] using this
    refine ⟨hprod_ae.norm.pow 2, ?_⟩
    rw [HasFiniteIntegral]
    have hmeas_int : Measurable (fun k : EuclideanSpace ℝ (Fin d) ↦ ‖‖(w k : ℂ) * g k‖ ^ 2‖ₑ) :=
      (((Complex.continuous_ofReal.measurable.comp hw_meas).mul
        (Lp.stronglyMeasurable g).measurable).norm.pow_const 2).enorm
    have hl : (∫⁻ k, ‖‖(w k : ℂ) * g k‖ ^ 2‖ₑ ∂(massShellMeasure d m)) =
        ∫⁻ k, ENNReal.ofReal ‖g k‖ ^ 2 ∂volume := by
      have hwd := lintegral_withDensity_eq_lintegral_mul
        (volume : Measure (EuclideanSpace ℝ (Fin d))) hdens_meas hmeas_int
      change ∫⁻ k, _ ∂(volume.withDensity _) = _
      rw [hwd]
      refine lintegral_congr_ae (ae_of_all _ fun k ↦ ?_)
      dsimp only [Pi.mul_apply]
      rw [Real.enorm_eq_ofReal (sq_nonneg _), norm_mul, Complex.norm_real,
        Real.norm_of_nonneg (hw_pos k).le, mul_pow,
        Real.sq_sqrt (mul_pos two_pos (modeDispersion_pos hm k)).le,
        ← ENNReal.ofReal_mul (inv_nonneg.mpr (mul_pos two_pos (modeDispersion_pos hm k)).le),
        ← mul_assoc, inv_mul_cancel₀ (mul_pos two_pos (modeDispersion_pos hm k)).ne', one_mul,
        ENNReal.ofReal_pow (norm_nonneg _)]
    rw [hl]; exact hg_lt
  have hnorm_fwd : ∀ f : Lp ℂ 2 (massShellMeasure d m),
      ‖(hfwd_mem f).toLp (fun k ↦ ((w k)⁻¹ : ℂ) * f k)‖ = ‖f‖ := by
    intro f
    have h2 : (2 : ENNReal).toReal = 2 := by norm_num
    rw [Lp.norm_def, Lp.norm_def,
      eLpNorm_eq_lintegral_rpow_enorm_toReal (by norm_num) (by norm_num) (Lp.aestronglyMeasurable _),
      eLpNorm_eq_lintegral_rpow_enorm_toReal (by norm_num) (by norm_num) (Lp.aestronglyMeasurable _),
      h2]
    congr 2
    have hm_f2 : Measurable (fun k : EuclideanSpace ℝ (Fin d) ↦ ‖f k‖ₑ ^ (2 : ℝ)) :=
      ((Lp.stronglyMeasurable f).measurable.enorm).pow_const (2 : ℝ)
    have hwd := lintegral_withDensity_eq_lintegral_mul
      (volume : Measure (EuclideanSpace ℝ (Fin d))) hdens_meas hm_f2
    change _ = ∫⁻ k, ‖f k‖ₑ ^ (2 : ℝ) ∂(volume.withDensity _)
    rw [hwd]
    refine lintegral_congr_ae ?_
    filter_upwards [(hfwd_mem f).coeFn_toLp] with k hk
    dsimp only [Pi.mul_apply]
    rw [hk, enorm_mul, ENNReal.mul_rpow_of_nonneg _ _ (by norm_num)]
    have hwk : ‖((w k)⁻¹ : ℂ)‖ₑ ^ (2 : ℝ) = ENNReal.ofReal ((2 * modeDispersion m k)⁻¹) := by
      rw [← ofReal_norm, norm_inv, Complex.norm_real,
        Real.norm_of_nonneg (hw_pos k).le,
        ENNReal.ofReal_rpow_of_nonneg (inv_nonneg.mpr (hw_pos k).le) (by norm_num),
        Real.rpow_two, inv_pow, Real.sq_sqrt (mul_pos two_pos (modeDispersion_pos hm k)).le]
    rw [hwk]
  { toLinearEquiv :=
      { toFun := fun f ↦ (hfwd_mem f).toLp (fun k ↦ ((w k)⁻¹ : ℂ) * f k)
        invFun := fun g ↦ (hbwd_mem g).toLp (fun k ↦ (w k : ℂ) * g k)
        map_add' := fun f₁ f₂ ↦ by
          apply Lp.ext
          let u₁ := (hfwd_mem f₁).toLp (fun k ↦ ((w k)⁻¹ : ℂ) * f₁ k)
          let u₂ := (hfwd_mem f₂).toLp (fun k ↦ ((w k)⁻¹ : ℂ) * f₂ k)
          have hadd : ∀ᵐ k ∂volume,
              ((f₁ + f₂ : Lp ℂ 2 (massShellMeasure d m)) : EuclideanSpace ℝ (Fin d) → ℂ) k =
                f₁ k + f₂ k := hae_iff.mp (Lp.coeFn_add f₁ f₂)
          filter_upwards [(hfwd_mem (f₁ + f₂)).coeFn_toLp, Lp.coeFn_add u₁ u₂,
            (hfwd_mem f₁).coeFn_toLp, (hfwd_mem f₂).coeFn_toLp, hadd] with k h12 ha h1 h2 hpt
          rw [h12, ha, Pi.add_apply]
          change ((w k)⁻¹ : ℂ) *
              ((f₁ + f₂ : Lp ℂ 2 (massShellMeasure d m)) : EuclideanSpace ℝ (Fin d) → ℂ) k =
            (u₁ : EuclideanSpace ℝ (Fin d) → ℂ) k + (u₂ : EuclideanSpace ℝ (Fin d) → ℂ) k
          rw [h1, h2, hpt, mul_add]
        map_smul' := fun c f ↦ by
          apply Lp.ext
          let u := (hfwd_mem f).toLp (fun k ↦ ((w k)⁻¹ : ℂ) * f k)
          have hsmul : ∀ᵐ k ∂volume,
              ((c • f : Lp ℂ 2 (massShellMeasure d m)) : EuclideanSpace ℝ (Fin d) → ℂ) k =
                c * f k := hae_iff.mp (Lp.coeFn_smul c f)
          filter_upwards [(hfwd_mem (c • f)).coeFn_toLp, Lp.coeFn_smul c u,
            (hfwd_mem f).coeFn_toLp, hsmul] with k hcf hs hf hpt
          rw [hcf, RingHom.id_apply, hs, Pi.smul_apply]
          change ((w k)⁻¹ : ℂ) *
              ((c • f : Lp ℂ 2 (massShellMeasure d m)) : EuclideanSpace ℝ (Fin d) → ℂ) k =
            c • (u : EuclideanSpace ℝ (Fin d) → ℂ) k
          rw [hf, hpt, smul_eq_mul]; ring
        left_inv := fun f ↦ by
          apply Lp.ext
          have h1 : ∀ᵐ k ∂(massShellMeasure d m),
              ((hfwd_mem f).toLp (fun k ↦ ((w k)⁻¹ : ℂ) * f k) : EuclideanSpace ℝ (Fin d) → ℂ) k =
                ((w k)⁻¹ : ℂ) * f k := hae_iff.mpr (hfwd_mem f).coeFn_toLp
          filter_upwards [(hbwd_mem _).coeFn_toLp, h1] with k h2 h1k
          rw [h2, h1k, ← mul_assoc, ← Complex.ofReal_inv, ← Complex.ofReal_mul,
            mul_inv_cancel₀ (hw_pos k).ne', Complex.ofReal_one, one_mul]
        right_inv := fun g ↦ by
          apply Lp.ext
          have h1 : ∀ᵐ k ∂volume,
              ((hbwd_mem g).toLp (fun k ↦ (w k : ℂ) * g k) : EuclideanSpace ℝ (Fin d) → ℂ) k =
                (w k : ℂ) * g k := hae_iff.mp (hbwd_mem g).coeFn_toLp
          filter_upwards [(hfwd_mem _).coeFn_toLp, h1] with k h2 h1k
          rw [h2, h1k, ← mul_assoc, ← Complex.ofReal_inv, ← Complex.ofReal_mul,
            inv_mul_cancel₀ (hw_pos k).ne', Complex.ofReal_one, one_mul] }
    norm_map' := hnorm_fwd }

/-- One-particle directional Lorentz boost unitary along spatial direction `u` at rapidity `t`
on `Lp ℂ 2 volume`, conjugated from `MassShell.inFrame` across `massShellToVolumeIso`. -/
noncomputable def directionalBoostUnitary (n : ℕ) (m : ℝ) (hm : 0 < m)
    (u : EuclideanSpace ℝ (Fin (n + 1))) (t : ℝ) :
    Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))) ≃ₗᵢ[ℂ]
      Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))) :=
  let Φ := massShellToVolumeIso (n + 1) m hm
  (Φ.symm.trans (MassShell.inFrame m hm (MassShell.align u) (Multiplicative.ofAdd t))).trans Φ

theorem directionalBoostUnitary_zero (n : ℕ) (m : ℝ) (hm : 0 < m)
    (u : EuclideanSpace ℝ (Fin (n + 1))) :
    directionalBoostUnitary n m hm u 0 = 1 := by
  ext f : 1
  simp only [directionalBoostUnitary, ofAdd_zero, map_one, LinearIsometryEquiv.trans_apply,
    LinearIsometryEquiv.coe_one, id_eq, LinearIsometryEquiv.apply_symm_apply]

theorem directionalBoostUnitary_add (n : ℕ) (m : ℝ) (hm : 0 < m)
    (u : EuclideanSpace ℝ (Fin (n + 1))) (s t : ℝ) :
    directionalBoostUnitary n m hm u (s + t) =
      directionalBoostUnitary n m hm u s * directionalBoostUnitary n m hm u t := by
  ext f : 1
  simp only [directionalBoostUnitary, ofAdd_add, map_mul, LinearIsometryEquiv.coe_mul,
    Function.comp_apply, LinearIsometryEquiv.trans_apply, LinearIsometryEquiv.symm_apply_apply]

/-- Second-quantized directional Lorentz boost unitary on `momentumFock volume`. -/
noncomputable def fockDirectionalBoost (n : ℕ) (m : ℝ) (hm : 0 < m)
    (u : EuclideanSpace ℝ (Fin (n + 1))) (t : ℝ) :
    momentumFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))) ≃ₗᵢ[ℂ]
      momentumFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))) :=
  secondQuantize volume (directionalBoostUnitary n m hm u t)

theorem fockDirectionalBoost_zero (n : ℕ) (m : ℝ) (hm : 0 < m)
    (u : EuclideanSpace ℝ (Fin (n + 1))) :
    fockDirectionalBoost n m hm u 0 = 1 :=
  (congrArg (secondQuantize volume) (directionalBoostUnitary_zero n m hm u)).trans
    (secondQuantize_one volume)

theorem fockDirectionalBoost_add (n : ℕ) (m : ℝ) (hm : 0 < m)
    (u : EuclideanSpace ℝ (Fin (n + 1))) (s t : ℝ) :
    fockDirectionalBoost n m hm u (s + t) =
      fockDirectionalBoost n m hm u s * fockDirectionalBoost n m hm u t :=
  (congrArg (secondQuantize volume) (directionalBoostUnitary_add n m hm u s t)).trans
    (secondQuantize_mul volume _ _)

theorem fockDirectionalBoost_vacuum (n : ℕ) (m : ℝ) (hm : 0 < m)
    (u : EuclideanSpace ℝ (Fin (n + 1))) (t : ℝ) :
    fockDirectionalBoost n m hm u t (fockVacuum volume) = fockVacuum volume :=
  secondQuantize_vacuum volume _

theorem fockDirectionalBoost_intertwines_field (n : ℕ) (m : ℝ) (hm : 0 < m)
    (u : EuclideanSpace ℝ (Fin (n + 1))) (t : ℝ)
    (v vbar : Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))))
    (ψ : FiniteParticleFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))) :
    secondQuantizeFin volume (directionalBoostUnitary n m hm u t) (contField volume v vbar ψ) =
      contField volume (directionalBoostUnitary n m hm u t v)
        (directionalBoostUnitary n m hm u t vbar)
        (secondQuantizeFin volume (directionalBoostUnitary n m hm u t) ψ) :=
  secondQuantize_intertwines_field volume _ v vbar ψ

/-- Spacetime translation action `(T_a f)(p) = f(p - a)` on Schwartz tests. -/
noncomputable def translateSchwartz {d : ℕ} (a : ℝ × EuclideanSpace ℝ (Fin d)) :
    SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℂ →L[ℂ]
      SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℂ :=
  SchwartzMap.compCLM ℂ
    (g := fun p : ℝ × EuclideanSpace ℝ (Fin d) ↦ p - a)
    (by
      have h1 : Function.HasTemperateGrowth (fun p : ℝ × EuclideanSpace ℝ (Fin d) ↦ p) :=
        (ContinuousLinearMap.id ℝ _).hasTemperateGrowth
      have h2 : Function.HasTemperateGrowth (fun _ : ℝ × EuclideanSpace ℝ (Fin d) ↦ a) :=
        Function.HasTemperateGrowth.const a
      exact h1.sub h2)
    ⟨1, 1 + ‖a‖, fun x ↦ by
      rw [pow_one]
      have htri : ‖x‖ ≤ ‖x - a‖ + ‖a‖ := by
        simpa only [sub_add_cancel] using norm_add_le (x - a) a
      nlinarith [norm_nonneg a, norm_nonneg (x - a)]⟩

@[simp]
theorem translateSchwartz_apply {d : ℕ} (a : ℝ × EuclideanSpace ℝ (Fin d))
    (f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℂ) (p : ℝ × EuclideanSpace ℝ (Fin d)) :
    translateSchwartz a f p = f (p - a) := rfl

theorem conjSchwartz_translate {d : ℕ} (a : ℝ × EuclideanSpace ℝ (Fin d))
    (f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℂ) :
    conjSchwartz (translateSchwartz a f) = translateSchwartz a (conjSchwartz f) := by
  ext p; rfl

private theorem prod_volume_isAddLeftInvariant (d : ℕ) :
    (volume : Measure (ℝ × EuclideanSpace ℝ (Fin d))).IsAddLeftInvariant :=
  ⟨fun a ↦ ((measurePreserving_add_left (volume : Measure ℝ) a.1).prod
    (measurePreserving_add_left (volume : Measure (EuclideanSpace ℝ (Fin d))) a.2)).map_eq⟩

private theorem prod_volume_isAddRightInvariant (d : ℕ) :
    (volume : Measure (ℝ × EuclideanSpace ℝ (Fin d))).IsAddRightInvariant :=
  ⟨fun a ↦ ((measurePreserving_add_right (volume : Measure ℝ) a.1).prod
    (measurePreserving_add_right (volume : Measure (EuclideanSpace ℝ (Fin d))) a.2)).map_eq⟩

private theorem prod_volume_isNegInvariant (d : ℕ) :
    (volume : Measure (ℝ × EuclideanSpace ℝ (Fin d))).IsNegInvariant :=
  ⟨((Measure.measurePreserving_neg (volume : Measure ℝ)).prod
    (Measure.measurePreserving_neg (volume : Measure (EuclideanSpace ℝ (Fin d))))).map_eq⟩

/-- Translation equivariance of `shellFeature`: translating a spacetime test by `a` multiplies
its mass-shell feature by `exp(i (a⁰ ω_m(k) - ⟨a, k⟩))`. -/
theorem shellFeature_translate (d : ℕ) (ħ m : ℝ) (hħ : 0 ≤ ħ) (hm : 0 < m)
    (a : ℝ × EuclideanSpace ℝ (Fin d)) (f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℂ) :
    shellFeature d ħ m hħ hm (translateSchwartz a f) =
      translationUnitary d m a (shellFeature d ħ m hħ hm f) := by
  have _ := prod_volume_isAddRightInvariant d
  apply Lp.ext
  filter_upwards [shellFeature_apply_ae d ħ m hħ hm (translateSchwartz a f),
    translationUnitary_apply_ae d m a (shellFeature d ħ m hħ hm f),
    shellFeature_apply_ae d ħ m hħ hm f] with k hL hU hR
  rw [hL, hU, hR]
  have hint :
      (∫ p : ℝ × EuclideanSpace ℝ (Fin d),
        Complex.exp (Complex.I * ((p.1 * modeDispersion m k - inner ℝ p.2 k : ℝ) : ℂ)) *
          f (p - a)) =
      Complex.exp (Complex.I * ((a.1 * modeDispersion m k - inner ℝ a.2 k : ℝ) : ℂ)) *
        ∫ q : ℝ × EuclideanSpace ℝ (Fin d),
          Complex.exp (Complex.I * ((q.1 * modeDispersion m k - inner ℝ q.2 k : ℝ) : ℂ)) * f q := by
    rw [← integral_const_mul]
    have hsub := integral_sub_right_eq_self (μ := (volume : Measure (ℝ × EuclideanSpace ℝ (Fin d))))
      (fun p ↦ Complex.exp (Complex.I * (((p + a).1 * modeDispersion m k -
        inner ℝ (p + a).2 k : ℝ) : ℂ)) * f p) a
    have h1 : (∫ p : ℝ × EuclideanSpace ℝ (Fin d),
          Complex.exp (Complex.I * ((p.1 * modeDispersion m k - inner ℝ p.2 k : ℝ) : ℂ)) *
            f (p - a)) =
        ∫ p : ℝ × EuclideanSpace ℝ (Fin d),
          Complex.exp (Complex.I * ((((p - a) + a).1 * modeDispersion m k -
            inner ℝ ((p - a) + a).2 k : ℝ) : ℂ)) * f (p - a) := by
      refine integral_congr_ae (ae_of_all _ fun p ↦ ?_)
      simp only [sub_add_cancel]
    rw [h1, hsub]
    refine integral_congr_ae (ae_of_all _ fun q ↦ ?_)
    dsimp only
    rw [← mul_assoc, ← Complex.exp_add]
    congr 2
    simp only [Prod.fst_add, Prod.snd_add, inner_add_left]
    push_cast; ring
  change ((Real.sqrt (ħ / (2 * modeDispersion m k)) : ℝ) : ℂ) *
      (∫ p : ℝ × EuclideanSpace ℝ (Fin d),
        Complex.exp (Complex.I * ((p.1 * modeDispersion m k - inner ℝ p.2 k : ℝ) : ℂ)) *
          f (p - a)) = _
  rw [hint]; ring

/-- Spacetime translation covariance of the Wightman field `Φ_W`:
`U(a) Φ_W(f) ψ = Φ_W(T_a f) U(a) ψ` on `FiniteParticleFock volume`. -/
theorem fockTranslation_intertwines_wightmanField (d : ℕ) (ħ m : ℝ) (hħ : 0 ≤ ħ) (hm : 0 < m)
    (a : ℝ × EuclideanSpace ℝ (Fin d)) (f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℂ)
    (ψ : FiniteParticleFock (volume : Measure (EuclideanSpace ℝ (Fin d)))) :
    secondQuantizeFin volume (translationUnitary d m a) (wightmanField d ħ m hħ hm f ψ) =
      wightmanField d ħ m hħ hm (translateSchwartz a f)
        (secondQuantizeFin volume (translationUnitary d m a) ψ) :=
  (secondQuantize_intertwines_field volume (translationUnitary d m a)
      (shellFeature d ħ m hħ hm f) (shellFeature d ħ m hħ hm (conjSchwartz f)) ψ).trans
    (congrArg₂ (fun u v ↦ contField volume u v
        (secondQuantizeFin volume (translationUnitary d m a) ψ))
      (shellFeature_translate d ħ m hħ hm a f).symm
      ((shellFeature_translate d ħ m hħ hm a (conjSchwartz f)).symm.trans
        (congrArg (shellFeature d ħ m hħ hm) (conjSchwartz_translate a f).symm)))

/-- Spatial rotation action `(R · f)(t, x) = f(t, R⁻¹ x)` on spacetime Schwartz tests. -/
noncomputable def rotateSchwartz {d : ℕ}
    (R : EuclideanSpace ℝ (Fin d) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin d)) :
    SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℂ →L[ℂ]
      SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℂ :=
  SchwartzMap.compCLMOfContinuousLinearEquiv ℂ
    ((ContinuousLinearEquiv.refl ℝ ℝ).prodCongr R.symm.toContinuousLinearEquiv)

@[simp]
theorem rotateSchwartz_apply {d : ℕ}
    (R : EuclideanSpace ℝ (Fin d) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin d))
    (f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℂ) (p : ℝ × EuclideanSpace ℝ (Fin d)) :
    rotateSchwartz R f p = f (p.1, R.symm p.2) := rfl

theorem conjSchwartz_rotate {d : ℕ}
    (R : EuclideanSpace ℝ (Fin d) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin d))
    (f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℂ) :
    conjSchwartz (rotateSchwartz R f) = rotateSchwartz R (conjSchwartz f) := by
  ext p; rfl

/-- Spatial `O(d)` rotation equivariance of `shellFeature`. -/
theorem shellFeature_rotate (d : ℕ) (ħ m : ℝ) (hħ : 0 ≤ ħ) (hm : 0 < m)
    (R : EuclideanSpace ℝ (Fin d) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin d))
    (f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℂ) :
    shellFeature d ħ m hħ hm (rotateSchwartz R f) =
      rotationUnitary d R (shellFeature d ħ m hħ hm f) := by
  apply Lp.ext
  have hpull : (rotationUnitary d R (shellFeature d ħ m hħ hm f) :
      EuclideanSpace ℝ (Fin d) → ℂ) =ᵐ[volume]
      fun k ↦ (shellFeature d ħ m hħ hm f) (R.symm k) :=
    MassShell.pullback_ae R.symm.toMeasurableEquiv R.symm.measurePreserving _
  have hsf_rot : (fun k ↦ (shellFeature d ħ m hħ hm f) (R.symm k)) =ᵐ[volume]
      fun k ↦ ((Real.sqrt (ħ / (2 * modeDispersion m (R.symm k))) : ℝ) : ℂ) *
        ∫ p : ℝ × EuclideanSpace ℝ (Fin d),
          Complex.exp (Complex.I * ((p.1 * modeDispersion m (R.symm k) -
            inner ℝ p.2 (R.symm k) : ℝ) : ℂ)) * f p :=
    R.symm.measurePreserving.quasiMeasurePreserving.ae (shellFeature_apply_ae d ħ m hħ hm f)
  filter_upwards [shellFeature_apply_ae d ħ m hħ hm (rotateSchwartz R f), hpull, hsf_rot]
    with k hL hU hR
  rw [hL, hU, hR, modeDispersion_isometry m R.symm k]
  congr 1
  let e : (ℝ × EuclideanSpace ℝ (Fin d)) ≃ᵐ (ℝ × EuclideanSpace ℝ (Fin d)) :=
    (MeasurableEquiv.refl ℝ).prodCongr R.symm.toMeasurableEquiv
  have he : MeasurePreserving e volume volume :=
    (MeasurePreserving.id volume).prod R.symm.measurePreserving
  rw [← he.integral_comp' (fun q : ℝ × EuclideanSpace ℝ (Fin d) ↦
    Complex.exp (Complex.I * ((q.1 * modeDispersion m k - inner ℝ q.2 (R.symm k) : ℝ) : ℂ)) * f q)]
  refine integral_congr_ae (ae_of_all _ fun p ↦ ?_)
  have hinner : inner ℝ (R.symm p.2) (R.symm k) = inner ℝ p.2 k := R.symm.inner_map_map p.2 k
  change Complex.exp (Complex.I * ((p.1 * modeDispersion m k - inner ℝ p.2 k : ℝ) : ℂ)) *
      f (p.1, R.symm p.2) =
    Complex.exp (Complex.I * ((p.1 * modeDispersion m k - inner ℝ (R.symm p.2) (R.symm k) : ℝ) : ℂ)) *
      f (p.1, R.symm p.2)
  rw [hinner]

/-- Spatial `O(d)` rotation covariance of the Wightman field `Φ_W`:
`U(R) Φ_W(f) ψ = Φ_W(R · f) U(R) ψ` on `FiniteParticleFock volume`. -/
theorem fockRotation_intertwines_wightmanField (d : ℕ) (ħ m : ℝ) (hħ : 0 ≤ ħ) (hm : 0 < m)
    (R : EuclideanSpace ℝ (Fin d) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin d))
    (f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℂ)
    (ψ : FiniteParticleFock (volume : Measure (EuclideanSpace ℝ (Fin d)))) :
    secondQuantizeFin volume (rotationUnitary d R) (wightmanField d ħ m hħ hm f ψ) =
      wightmanField d ħ m hħ hm (rotateSchwartz R f)
        (secondQuantizeFin volume (rotationUnitary d R) ψ) :=
  (secondQuantize_intertwines_field volume (rotationUnitary d R)
      (shellFeature d ħ m hħ hm f) (shellFeature d ħ m hħ hm (conjSchwartz f)) ψ).trans
    (congrArg₂ (fun u v ↦ contField volume u v
        (secondQuantizeFin volume (rotationUnitary d R) ψ))
      (shellFeature_rotate d ħ m hħ hm R f).symm
      ((shellFeature_rotate d ħ m hħ hm R (conjSchwartz f)).symm.trans
        (congrArg (shellFeature d ħ m hħ hm) (conjSchwartz_rotate R f).symm)))

end PoincareUnitaries

/-! #### Arbitrary-`D` (`D = d + 1 ≥ 2`) Spacelike Microcausality (Unconditional on Compactly Supported Smooth Tests) -/

section SpacelikeLocalityND

open FourierTransform

/-- Arbitrary spatial dimension `d = n + 1` (`D = d + 1 ≥ 2`) Pauli–Jordan integral vanishing:
rotates the separation axis `u` to `e₀` via `MassShell.align u ∈ O(d)`, splits out transverse
momenta `k_⊥ ∈ ℝ^n` with effective mass `M = √(m² + ‖k_⊥‖²) > 0`, and invokes the 1D
`spacelike_commutator_zero`. -/
theorem spacelike_commutator_zero_nd {n : ℕ} {τ m r : ℝ} (hm : 0 < m) (hτr : |τ| < r)
    (u : EuclideanSpace ℝ (Fin (n + 1)))
    {H : EuclideanSpace ℝ (Fin (n + 1)) → ℂ}
    {H_ext : ℂ → EuclideanSpace ℝ (Fin n) → ℂ}
    {G : EuclideanSpace ℝ (Fin n) → ℝ}
    (hG_int : Integrable G volume)
    (hH_meas : AEStronglyMeasurable
      (fun p : ℝ × EuclideanSpace ℝ (Fin n) ↦ H_ext (p.1 : ℂ) p.2) volume)
    (hH_eq : ∀ (k₁ : ℝ) (k_perp : EuclideanSpace ℝ (Fin n)),
      H (MassShell.align u ((MassShell.split n).symm (k₁, k_perp))) = H_ext (k₁ : ℂ) k_perp)
    (hH_diff : ∀ k_perp : EuclideanSpace ℝ (Fin n), Differentiable ℂ (fun z ↦ H_ext z k_perp))
    (hH_bound : ∀ (k_perp : EuclideanSpace ℝ (Fin n)) (x y : ℝ), 0 ≤ y →
      ‖H_ext ((x : ℂ) + (y : ℂ) * Complex.I) k_perp‖ ≤
        G k_perp * (1 + x ^ 2)⁻¹ * Real.exp (-r * y)) :
    (∫ k : EuclideanSpace ℝ (Fin (n + 1)),
      ((Real.sin (τ * modeDispersion m k) / modeDispersion m k : ℝ) : ℂ) * H k) = 0 := by
  let R := MassShell.align u
  have hR_mp : MeasurePreserving R.toMeasurableEquiv volume volume := R.measurePreserving
  rw [← hR_mp.integral_comp' (fun k : EuclideanSpace ℝ (Fin (n + 1)) ↦
    ((Real.sin (τ * modeDispersion m k) / modeDispersion m k : ℝ) : ℂ) * H k)]
  have hR_coe : ⇑R.toMeasurableEquiv = ⇑R := rfl
  simp_rw [hR_coe]
  have hsplit := (MassShell.split_volume n).symm
  rw [← hsplit.integral_comp' (fun k : EuclideanSpace ℝ (Fin (n + 1)) ↦
    ((Real.sin (τ * modeDispersion m (R k)) / modeDispersion m (R k) : ℝ) : ℂ) * H (R k))]
  let F : ℝ × EuclideanSpace ℝ (Fin n) → ℂ := fun p ↦
    pjEntire τ (modeDispersion m p.2) (p.1 : ℂ) * H_ext (p.1 : ℂ) p.2
  have hEq : (fun p : ℝ × EuclideanSpace ℝ (Fin n) ↦
      ((Real.sin (τ * modeDispersion m (R ((MassShell.split n).symm p))) /
          modeDispersion m (R ((MassShell.split n).symm p)) : ℝ) : ℂ) *
        H (R ((MassShell.split n).symm p))) = F := by
    funext ⟨k₁, k_perp⟩
    dsimp only [F]
    rw [modeDispersion_isometry m R, hH_eq k₁ k_perp]
    have hdisp : modeDispersion m ((MassShell.split n).symm (k₁, k_perp)) =
        Real.sqrt (k₁ ^ 2 + (modeDispersion m k_perp) ^ 2) := by
      have h := MassShell.split_energy m ((MassShell.split n).symm (k₁, k_perp))
      rw [(MassShell.split n).apply_symm_apply] at h
      exact h.symm
    rw [hdisp, ← pjEntire_real τ (modeDispersion m k_perp) k₁ (modeDispersion_pos hm k_perp)]
  rw [hEq]
  have hF_meas : AEStronglyMeasurable F volume := by
    have hdisp_cont : Continuous (fun p : ℝ × EuclideanSpace ℝ (Fin n) ↦ modeDispersion m p.2) := by
      change Continuous (fun p : ℝ × EuclideanSpace ℝ (Fin n) ↦ Real.sqrt (‖p.2‖ ^ 2 + m ^ 2))
      exact Real.continuous_sqrt.comp ((continuous_snd.norm.pow 2).add continuous_const)
    have hrad_cont : Continuous (fun p : ℝ × EuclideanSpace ℝ (Fin n) ↦
        Real.sqrt (p.1 ^ 2 + (modeDispersion m p.2) ^ 2)) :=
      Real.continuous_sqrt.comp ((continuous_fst.pow 2).add (hdisp_cont.pow 2))
    have hpj_cont : Continuous (fun p : ℝ × EuclideanSpace ℝ (Fin n) ↦
        ((Real.sin (τ * Real.sqrt (p.1 ^ 2 + (modeDispersion m p.2) ^ 2)) /
          Real.sqrt (p.1 ^ 2 + (modeDispersion m p.2) ^ 2) : ℝ) : ℂ)) :=
      Complex.continuous_ofReal.comp
        ((Real.continuous_sin.comp (continuous_const.mul hrad_cont)).div hrad_cont fun p ↦
          (Real.sqrt_pos.mpr (by have := modeDispersion_pos hm p.2; positivity)).ne')
    have hF_eq : F = fun p : ℝ × EuclideanSpace ℝ (Fin n) ↦
        ((Real.sin (τ * Real.sqrt (p.1 ^ 2 + (modeDispersion m p.2) ^ 2)) /
          Real.sqrt (p.1 ^ 2 + (modeDispersion m p.2) ^ 2) : ℝ) : ℂ) * H_ext (p.1 : ℂ) p.2 :=
      funext fun p ↦ congrArg (· * H_ext (p.1 : ℂ) p.2)
        (pjEntire_real τ (modeDispersion m p.2) p.1 (modeDispersion_pos hm p.2))
    rw [hF_eq]
    exact hpj_cont.aestronglyMeasurable.mul hH_meas
  have hF_int : Integrable F (volume.prod volume) := by
    have hdom : Integrable (fun p : ℝ × EuclideanSpace ℝ (Fin n) ↦
        (|τ| * (1 + p.1 ^ 2)⁻¹) * G p.2) (volume.prod volume) :=
      (integrable_inv_one_add_sq.const_mul |τ|).mul_prod hG_int
    refine hdom.mono' hF_meas (ae_of_all _ fun ⟨k₁, k_perp⟩ ↦ ?_)
    dsimp only [F]
    rw [norm_mul]
    have h1 : ‖pjEntire τ (modeDispersion m k_perp) (k₁ : ℂ)‖ ≤ |τ| := by
      have hb := pjEntire_exp_bound k₁ 0 (modeDispersion m k_perp) τ
      simpa only [Complex.ofReal_zero, zero_mul, add_zero, abs_zero, mul_zero, Real.exp_zero,
        mul_one] using hb
    have h2 : ‖H_ext (k₁ : ℂ) k_perp‖ ≤ G k_perp * (1 + k₁ ^ 2)⁻¹ := by
      have hb := hH_bound k_perp k₁ 0 le_rfl
      simpa only [Complex.ofReal_zero, zero_mul, add_zero, mul_zero, Real.exp_zero, mul_one] using hb
    calc ‖pjEntire τ (modeDispersion m k_perp) (k₁ : ℂ)‖ * ‖H_ext (k₁ : ℂ) k_perp‖
        ≤ |τ| * (G k_perp * (1 + k₁ ^ 2)⁻¹) :=
          mul_le_mul h1 h2 (norm_nonneg _) (abs_nonneg τ)
      _ = |τ| * (1 + k₁ ^ 2)⁻¹ * G k_perp := by ring
  rw [show (volume : Measure (ℝ × EuclideanSpace ℝ (Fin n))) = volume.prod volume from rfl,
    integral_prod_symm F hF_int]
  refine integral_eq_zero_of_ae (ae_of_all _ fun k_perp ↦ ?_)
  dsimp only [F, Pi.zero_apply]
  exact spacelike_commutator_zero hτr (hH_diff k_perp) (hH_bound k_perp)

/-- Point-separation specialization in arbitrary spatial dimension `d = n + 1`:
for any spatial separation vector `x ∈ ℝ^{n+1}` and envelope radius `ρ ≥ 0` with `|τ| + ρ < ‖x‖`,
the Pauli–Jordan integral against `k ↦ exp(i ⟨x, k⟩) * H₀ k` vanishes identically. -/
theorem spacelike_point_commutator_zero_nd {n : ℕ} {τ m ρ : ℝ} (hm : 0 < m) (hρ : 0 ≤ ρ)
    {x : EuclideanSpace ℝ (Fin (n + 1))} (hsep : |τ| + ρ < ‖x‖)
    {H₀ : EuclideanSpace ℝ (Fin (n + 1)) → ℂ}
    {H₀_ext : ℂ → EuclideanSpace ℝ (Fin n) → ℂ}
    {G : EuclideanSpace ℝ (Fin n) → ℝ}
    (hG_int : Integrable G volume)
    (hH₀_meas : AEStronglyMeasurable
      (fun p : ℝ × EuclideanSpace ℝ (Fin n) ↦ H₀_ext (p.1 : ℂ) p.2) volume)
    (hH₀_eq : ∀ (k₁ : ℝ) (k_perp : EuclideanSpace ℝ (Fin n)),
      H₀ (MassShell.align (‖x‖⁻¹ • x) ((MassShell.split n).symm (k₁, k_perp))) =
        H₀_ext (k₁ : ℂ) k_perp)
    (hH₀_diff : ∀ k_perp : EuclideanSpace ℝ (Fin n), Differentiable ℂ (fun z ↦ H₀_ext z k_perp))
    (hH₀_bound : ∀ (k_perp : EuclideanSpace ℝ (Fin n)) (a b : ℝ), 0 ≤ b →
      ‖H₀_ext ((a : ℂ) + (b : ℂ) * Complex.I) k_perp‖ ≤
        G k_perp * (1 + a ^ 2)⁻¹ * Real.exp (ρ * b)) :
    (∫ k : EuclideanSpace ℝ (Fin (n + 1)),
      ((Real.sin (τ * modeDispersion m k) / modeDispersion m k : ℝ) : ℂ) *
        (Complex.exp (Complex.I * (inner ℝ x k : ℂ)) * H₀ k)) = 0 := by
  have hx_pos : 0 < ‖x‖ := by linarith [abs_nonneg τ]
  let u : EuclideanSpace ℝ (Fin (n + 1)) := ‖x‖⁻¹ • x
  have hu : ‖u‖ = 1 := by
    simp [u, norm_smul, Real.norm_of_nonneg (inv_nonneg.mpr hx_pos.le), inv_mul_cancel₀ hx_pos.ne']
  have hxu : x = ‖x‖ • u := by
    simp [u, smul_smul, mul_inv_cancel₀ hx_pos.ne']
  refine spacelike_commutator_zero_nd hm (r := ‖x‖ - ρ) (by linarith) u
    (H := fun k ↦ Complex.exp (Complex.I * (inner ℝ x k : ℂ)) * H₀ k)
    (H_ext := fun z k_perp ↦ Complex.exp (Complex.I * (‖x‖ : ℂ) * z) * H₀_ext z k_perp)
    hG_int ?_ ?_ ?_ ?_
  · have hc : Continuous (fun p : ℝ × EuclideanSpace ℝ (Fin n) ↦
        Complex.exp (Complex.I * (‖x‖ : ℂ) * (p.1 : ℂ))) := by fun_prop
    exact hc.aestronglyMeasurable.mul hH₀_meas
  · intro k₁ k_perp
    rw [hH₀_eq k₁ k_perp]
    congr 2
    have hinner : inner ℝ x (MassShell.align u ((MassShell.split n).symm (k₁, k_perp))) =
        ‖x‖ * k₁ := by
      have h1 : inner ℝ x (MassShell.align u ((MassShell.split n).symm (k₁, k_perp))) =
          ‖x‖ * inner ℝ u (MassShell.align u ((MassShell.split n).symm (k₁, k_perp))) := by
        conv_lhs => rw [hxu]
        exact real_inner_smul_left _ _ _
      rw [h1]; congr 1
      have h2 : inner ℝ u (MassShell.align u ((MassShell.split n).symm (k₁, k_perp))) =
          inner ℝ (MassShell.align u (MassShell.axis n))
            (MassShell.align u ((MassShell.split n).symm (k₁, k_perp))) := by
        rw [MassShell.align_axis u hu]
      rw [h2, (MassShell.align u).inner_map_map]
      change inner ℝ (EuclideanSpace.basisFun (Fin (n + 1)) ℝ 0)
        ((MassShell.split n).symm (k₁, k_perp)) = k₁
      rw [EuclideanSpace.basisFun_inner]
      exact congrArg Prod.fst ((MassShell.split n).apply_symm_apply (k₁, k_perp))
    rw [hinner, Complex.ofReal_mul]; ring
  · intro k_perp
    exact (Complex.differentiable_exp.comp
      ((differentiable_const _).mul differentiable_id)).mul (hH₀_diff k_perp)
  · intro k_perp a b hb
    rw [norm_mul]
    have hexp : ‖Complex.exp (Complex.I * (‖x‖ : ℂ) * ((a : ℂ) + (b : ℂ) * Complex.I))‖ =
        Real.exp (-‖x‖ * b) := by
      rw [Complex.norm_exp]
      congr 1
      simp [Complex.mul_re, Complex.mul_im]
    rw [hexp]
    calc Real.exp (-‖x‖ * b) * ‖H₀_ext ((a : ℂ) + (b : ℂ) * Complex.I) k_perp‖
        ≤ Real.exp (-‖x‖ * b) * (G k_perp * (1 + a ^ 2)⁻¹ * Real.exp (ρ * b)) :=
          mul_le_mul_of_nonneg_left (hH₀_bound k_perp a b hb) (Real.exp_nonneg _)
      _ = G k_perp * (1 + a ^ 2)⁻¹ * (Real.exp (-‖x‖ * b) * Real.exp (ρ * b)) := by ring
      _ = G k_perp * (1 + a ^ 2)⁻¹ * Real.exp (-(‖x‖ - ρ) * b) := by
          rw [← Real.exp_add]; congr 2; ring

/-- Arbitrary-`D` (`D = d + 1 ≥ 2`) field commutator vanishing on `FiniteParticleFock volume`
for any modes whose commutator equals the `d`-dimensional Lorentzian Pauli–Jordan integral. -/
theorem contField_spacelike_commutator_zero_nd {n : ℕ} {ħ t t' m r : ℝ}
    (hm : 0 < m) (hsep : |t' - t| < r)
    (u : EuclideanSpace ℝ (Fin (n + 1)))
    {H : EuclideanSpace ℝ (Fin (n + 1)) → ℂ}
    {H_ext : ℂ → EuclideanSpace ℝ (Fin n) → ℂ}
    {G : EuclideanSpace ℝ (Fin n) → ℝ}
    (hG_int : Integrable G volume)
    (hH_meas : AEStronglyMeasurable
      (fun p : ℝ × EuclideanSpace ℝ (Fin n) ↦ H_ext (p.1 : ℂ) p.2) volume)
    (hH_eq : ∀ (k₁ : ℝ) (k_perp : EuclideanSpace ℝ (Fin n)),
      H (MassShell.align u ((MassShell.split n).symm (k₁, k_perp))) = H_ext (k₁ : ℂ) k_perp)
    (hH_diff : ∀ k_perp : EuclideanSpace ℝ (Fin n), Differentiable ℂ (fun z ↦ H_ext z k_perp))
    (hH_bound : ∀ (k_perp : EuclideanSpace ℝ (Fin n)) (x y : ℝ), 0 ≤ y →
      ‖H_ext ((x : ℂ) + (y : ℂ) * Complex.I) k_perp‖ ≤
        G k_perp * (1 + x ^ 2)⁻¹ * Real.exp (-r * y))
    {u_f u_fbar u_f' u_f'bar : Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))}
    (hcomm : inner ℂ u_fbar u_f' - inner ℂ u_f'bar u_f =
      ∫ k : EuclideanSpace ℝ (Fin (n + 1)),
        ((ħ / (2 * modeDispersion m k) : ℝ) : ℂ) *
          (Complex.exp (-Complex.I * ((t' - t : ℝ) : ℂ) * (modeDispersion m k : ℂ)) -
           Complex.exp (Complex.I * ((t' - t : ℝ) : ℂ) * (modeDispersion m k : ℂ))) * H k)
    (ψ : FiniteParticleFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))) :
    contField volume u_f u_fbar (contField volume u_f' u_f'bar ψ) -
      contField volume u_f' u_f'bar (contField volume u_f u_fbar ψ) = 0 := by
  have hzero : inner ℂ u_fbar u_f' - inner ℂ u_f'bar u_f = 0 := by
    rw [hcomm]
    have hpt (k : EuclideanSpace ℝ (Fin (n + 1))) :
        ((ħ / (2 * modeDispersion m k) : ℝ) : ℂ) *
          (Complex.exp (-Complex.I * ((t' - t : ℝ) : ℂ) * (modeDispersion m k : ℂ)) -
           Complex.exp (Complex.I * ((t' - t : ℝ) : ℂ) * (modeDispersion m k : ℂ))) * H k =
        (-Complex.I * (ħ : ℂ)) *
          (((Real.sin ((t' - t) * modeDispersion m k) / modeDispersion m k : ℝ) : ℂ) * H k) := by
      rw [lorentzian_pauliJordan_kernel ħ (t' - t) (modeDispersion m k) (modeDispersion_pos hm k),
        mul_assoc]
    simp_rw [hpt]
    rw [integral_const_mul,
      spacelike_commutator_zero_nd hm hsep u hG_int hH_meas hH_eq hH_diff hH_bound, mul_zero]
  exact (contField_commutator volume u_f u_fbar u_f' u_f'bar ψ).trans
    ((congrArg (· • ψ) hzero).trans (zero_smul ℂ ψ))

/-! #### Unconditional Table 1 Spacelike Microcausality for Compactly Supported Smooth Tests -/

namespace WightmanField

/-- Spatial Fourier transform of a fixed-time slice `y ↦ h(τ, y)`. -/
noncomputable def sliceSpatialFT {d : ℕ} (h : ℝ × EuclideanSpace ℝ (Fin d) → ℝ)
    (τ : ℝ) (k : EuclideanSpace ℝ (Fin d)) : ℂ :=
  ∫ y : EuclideanSpace ℝ (Fin d),
    Complex.exp (-Complex.I * (inner ℝ y k : ℂ)) * (h (τ, y) : ℂ)

/-- Compactly supported 1D integration by parts: if `g` has compact support and `HasDerivAt g g'`,
then `(I * z) * ∫ exp(I z y) g y = - ∫ exp(I z y) g' y`. -/
theorem ibp_exp_compactSupport (z : ℂ) {g g' : ℝ → ℂ}
    (hg_cs : HasCompactSupport g) (hg'_cont : Continuous g')
    (hderiv : ∀ y : ℝ, HasDerivAt g (g' y) y) :
    (Complex.I * z) * (∫ y : ℝ, Complex.exp (Complex.I * z * (y : ℂ)) * g y) =
      -(∫ y : ℝ, Complex.exp (Complex.I * z * (y : ℂ)) * g' y) := by
  have hg_cont : Continuous g := continuous_iff_continuousAt.mpr fun y ↦ (hderiv y).continuousAt
  obtain ⟨R, hR⟩ := hg_cs.isBounded.subset_closedBall (0 : ℝ)
  let A : ℝ := -(max R 0 + 1)
  let B : ℝ := max R 0 + 1
  have hAB : A ≤ B := by dsimp [A, B]; linarith [le_max_right R 0]
  have hzero_out : ∀ y : ℝ, y ∉ Set.Icc (-(max R 0)) (max R 0) → g y = 0 := by
    intro y hy
    by_contra hne
    have hmem := hR (subset_tsupport g hne)
    rw [Metric.mem_closedBall, dist_zero_right, Real.norm_eq_abs] at hmem
    have hle : |y| ≤ max R 0 := hmem.trans (le_max_left R 0)
    exact hy ⟨by linarith [(abs_le.mp hle).1], (abs_le.mp hle).2⟩
  have hzero_out' : ∀ y : ℝ, y ∉ Set.Icc (-(max R 0)) (max R 0) → g' y = 0 := by
    intro y hy
    have hopen : IsOpen (Set.Icc (-(max R 0)) (max R 0))ᶜ := isClosed_Icc.isOpen_compl
    have hev : g =ᶠ[𝓝 y] 0 := by
      filter_upwards [hopen.mem_nhds hy] with t ht
      exact hzero_out t ht
    have h0 : HasDerivAt g 0 y := (hasDerivAt_const y (0 : ℂ)).congr_of_eventuallyEq hev
    exact (hderiv y).unique h0
  let F : ℝ → ℂ := fun y ↦ Complex.exp (Complex.I * z * (y : ℂ)) * g y
  let F' : ℝ → ℂ := fun y ↦
    (Complex.I * z) * (Complex.exp (Complex.I * z * (y : ℂ)) * g y) +
      Complex.exp (Complex.I * z * (y : ℂ)) * g' y
  have hF_deriv : ∀ y : ℝ, HasDerivAt F (F' y) y := fun y ↦ by
    have h1 : HasDerivAt (fun t : ℝ ↦ Complex.I * z * (t : ℂ)) (Complex.I * z) y := by
      simpa using Complex.ofRealCLM.hasDerivAt.const_mul (Complex.I * z)
    have h2 : HasDerivAt (fun t : ℝ ↦ Complex.exp (Complex.I * z * (t : ℂ)))
        (Complex.exp (Complex.I * z * (y : ℂ)) * (Complex.I * z)) y :=
      (Complex.hasDerivAt_exp _).comp y h1
    convert h2.mul (hderiv y) using 1
    dsimp [F']; ring
  have hF'_cont : Continuous F' := by
    unfold F'
    exact (continuous_const.mul ((Complex.continuous_exp.comp
      (continuous_const.mul Complex.continuous_ofReal)).mul hg_cont)).add
      ((Complex.continuous_exp.comp (continuous_const.mul Complex.continuous_ofReal)).mul hg'_cont)
  have hF'_zero : ∀ y : ℝ, y ∉ Set.Ioc A B → F' y = 0 := fun y hy ↦ by
    have hnot : y ∉ Set.Icc (-(max R 0)) (max R 0) := fun hmem ↦ hy ⟨by dsimp [A]; linarith [hmem.1],
      by dsimp [B]; linarith [hmem.2]⟩
    simp [F', hzero_out y hnot, hzero_out' y hnot]
  have hFA : F A = 0 := by
    have hnot : A ∉ Set.Icc (-(max R 0)) (max R 0) := fun hmem ↦ by dsimp [A] at hmem; linarith [hmem.1]
    simp [F, hzero_out A hnot]
  have hFB : F B = 0 := by
    have hnot : B ∉ Set.Icc (-(max R 0)) (max R 0) := fun hmem ↦ by dsimp [B] at hmem; linarith [hmem.2]
    simp [F, hzero_out B hnot]
  have hint_zero : ∫ y : ℝ, F' y = 0 := by
    have heq1 : ∫ y : ℝ, F' y = ∫ y in Set.Ioc A B, F' y := by
      rw [← integral_indicator measurableSet_Ioc]
      refine integral_congr_ae (ae_of_all _ fun y ↦ ?_)
      by_cases hy : y ∈ Set.Ioc A B
      · rw [Set.indicator_of_mem hy]
      · rw [Set.indicator_of_notMem hy, hF'_zero y hy]
    rw [heq1, ← intervalIntegral.integral_of_le hAB,
      intervalIntegral.integral_eq_sub_of_hasDerivAt (fun y _ ↦ hF_deriv y)
        (hF'_cont.intervalIntegrable A B), hFA, hFB, sub_self]
  have hint1 : Integrable (fun y : ℝ ↦ (Complex.I * z) * (Complex.exp (Complex.I * z * (y : ℂ)) * g y)) := by
    have hcs1 : HasCompactSupport (fun y : ℝ ↦ (Complex.I * z) * (Complex.exp (Complex.I * z * (y : ℂ)) * g y)) :=
      (hg_cs.mul_left).mul_left
    exact (continuous_const.mul ((Complex.continuous_exp.comp
      (continuous_const.mul Complex.continuous_ofReal)).mul hg_cont)).integrable_of_hasCompactSupport hcs1
  have hint2 : Integrable (fun y : ℝ ↦ Complex.exp (Complex.I * z * (y : ℂ)) * g' y) := by
    have hcs' : HasCompactSupport g' := HasCompactSupport.of_support_subset_isCompact isCompact_Icc
      (fun y hy ↦ by by_contra hnot; exact hy (hzero_out' y hnot))
    exact ((Complex.continuous_exp.comp (continuous_const.mul Complex.continuous_ofReal)).mul
      hg'_cont).integrable_of_hasCompactSupport hcs'.mul_left
  rw [show (∫ y : ℝ, F' y) =
      (∫ y : ℝ, (Complex.I * z) * (Complex.exp (Complex.I * z * (y : ℂ)) * g y)) +
        ∫ y : ℝ, Complex.exp (Complex.I * z * (y : ℂ)) * g' y from integral_add hint1 hint2,
    integral_const_mul] at hint_zero
  exact eq_neg_of_add_eq_zero_left hint_zero

/-- 1D compactly supported Paley–Wiener Pauli–Jordan vanishing:
for `M > 0`, `|τ| < r`, and `ψ : ℝ → ℂ` twice differentiable with compact support contained in
`[r, ∞)`, the Pauli–Jordan integral vanishes identically. -/
theorem pj_1d_eq_zero_of_compactSupport_ge {τ M r : ℝ} (hM : 0 < M) (hτr : |τ| < r)
    {ψ ψ₁ ψ₂ : ℝ → ℂ}
    (hψ_cs : HasCompactSupport ψ) (hψ₁_cs : HasCompactSupport ψ₁) (hψ₂_cs : HasCompactSupport ψ₂)
    (hψ₁_cont : Continuous ψ₁) (hψ₂_cont : Continuous ψ₂)
    (hd1 : ∀ y : ℝ, HasDerivAt ψ (ψ₁ y) y)
    (hd2 : ∀ y : ℝ, HasDerivAt ψ₁ (ψ₂ y) y)
    (hsupp : ∀ y : ℝ, ψ y ≠ 0 → r ≤ y) :
    (∫ k₀ : ℝ,
      ((Real.sin (τ * Real.sqrt (k₀ ^ 2 + M ^ 2)) / Real.sqrt (k₀ ^ 2 + M ^ 2) : ℝ) : ℂ) *
        ∫ y₀ : ℝ, Complex.exp (-Complex.I * (k₀ : ℂ) * (y₀ : ℂ)) * ψ y₀) = 0 := by
  have hψ_cont : Continuous ψ := continuous_iff_continuousAt.mpr fun y ↦ (hd1 y).continuousAt
  have hsupp1 : ∀ y : ℝ, ψ₁ y ≠ 0 → r ≤ y := by
    intro y hy
    by_contra hlt
    have hlt' : y < r := not_le.mp hlt
    have hev : ψ =ᶠ[𝓝 y] 0 := by
      filter_upwards [isOpen_Iio.mem_nhds hlt'] with t ht
      by_contra hne; exact (not_le.mpr ht) (hsupp t hne)
    exact hy ((hd1 y).unique ((hasDerivAt_const y (0 : ℂ)).congr_of_eventuallyEq hev))
  have hsupp2 : ∀ y : ℝ, ψ₂ y ≠ 0 → r ≤ y := by
    intro y hy
    by_contra hlt
    have hlt' : y < r := not_le.mp hlt
    have hev : ψ₁ =ᶠ[𝓝 y] 0 := by
      filter_upwards [isOpen_Iio.mem_nhds hlt'] with t ht
      by_contra hne; exact (not_le.mpr ht) (hsupp1 t hne)
    exact hy ((hd2 y).unique ((hasDerivAt_const y (0 : ℂ)).congr_of_eventuallyEq hev))
  let H : ℂ → ℂ := fun z ↦ ∫ y₀ : ℝ, Complex.exp (Complex.I * z * (y₀ : ℂ)) * ψ y₀
  have hneg := integral_neg_eq_self
    (fun k₀ : ℝ ↦
      ((Real.sin (τ * Real.sqrt (k₀ ^ 2 + M ^ 2)) / Real.sqrt (k₀ ^ 2 + M ^ 2) : ℝ) : ℂ) *
        ∫ y₀ : ℝ, Complex.exp (-Complex.I * (k₀ : ℂ) * (y₀ : ℂ)) * ψ y₀)
    (volume : Measure ℝ)
  rw [← hneg]
  have heq_neg :
      (∫ k₀ : ℝ,
        ((Real.sin (τ * Real.sqrt ((-k₀) ^ 2 + M ^ 2)) / Real.sqrt ((-k₀) ^ 2 + M ^ 2) : ℝ) : ℂ) *
          ∫ y₀ : ℝ, Complex.exp (-Complex.I * ((-k₀ : ℝ) : ℂ) * (y₀ : ℂ)) * ψ y₀) =
      ∫ k₀ : ℝ, pjEntire τ M (k₀ : ℂ) * H (k₀ : ℂ) := by
    refine integral_congr_ae (ae_of_all _ fun k₀ ↦ ?_)
    dsimp only
    rw [neg_sq, ← pjEntire_real τ M k₀ hM]
    congr 1; unfold H
    refine integral_congr_ae (ae_of_all _ fun y₀ ↦ ?_)
    dsimp only
    congr 2; push_cast; ring
  rw [heq_neg]
  have hH_diff : Differentiable ℂ H := by
    intro z₀
    obtain ⟨R, hR⟩ := hψ_cs.isBounded.subset_closedBall (0 : ℝ)
    let K := Set.Icc (-(max R 0)) (max R 0)
    let bound : ℝ → ℝ := fun y₀ ↦
      |y₀| * Real.exp ((‖z₀‖ + 1) * |y₀|) * ‖ψ y₀‖
    have hbound_int : Integrable bound volume := by
      have hcs_b : HasCompactSupport bound :=
        HasCompactSupport.of_support_subset_isCompact hψ_cs fun y hy ↦ by
          have hne : ψ y ≠ 0 := by intro h0; simp [bound, h0] at hy
          exact subset_tsupport ψ hne
      have hcont_b : Continuous bound := by
        unfold bound; fun_prop
      exact hcont_b.integrable_of_hasCompactSupport hcs_b
    have hderiv_at := hasDerivAt_integral_of_dominated_loc_of_deriv_le
      (F := fun (z : ℂ) (y₀ : ℝ) ↦ Complex.exp (Complex.I * z * (y₀ : ℂ)) * ψ y₀)
      (F' := fun (z : ℂ) (y₀ : ℝ) ↦ (Complex.I * (y₀ : ℂ)) * Complex.exp (Complex.I * z * (y₀ : ℂ)) * ψ y₀)
      (x₀ := z₀) (s := Metric.ball z₀ 1) (Metric.isOpen_ball.mem_nhds (Metric.mem_ball_self zero_lt_one))
      (Eventually.of_forall fun z ↦
        ((Complex.continuous_exp.comp (continuous_const.mul Complex.continuous_ofReal)).mul
          hψ_cont).aestronglyMeasurable)
      (((Complex.continuous_exp.comp (continuous_const.mul Complex.continuous_ofReal)).mul
        hψ_cont).integrable_of_hasCompactSupport hψ_cs.mul_left)
      (((continuous_const.mul Complex.continuous_ofReal).mul
        (Complex.continuous_exp.comp (continuous_const.mul Complex.continuous_ofReal))).mul
        hψ_cont).aestronglyMeasurable
      (ae_of_all _ fun y₀ z hz ↦ by
        rw [norm_mul, norm_mul, norm_mul, Complex.norm_I, one_mul, Complex.norm_real,
          Real.norm_eq_abs, Complex.norm_exp]
        have hre : (Complex.I * z * (y₀ : ℂ)).re ≤ (‖z₀‖ + 1) * |y₀| := by
          have h1 : (Complex.I * z * (y₀ : ℂ)).re = -z.im * y₀ := by
            simp [Complex.mul_re, Complex.mul_im]
          rw [h1]
          calc -z.im * y₀ ≤ |-z.im * y₀| := le_abs_self _
            _ = |z.im| * |y₀| := by rw [abs_mul, abs_neg]
            _ ≤ ‖z‖ * |y₀| := mul_le_mul_of_nonneg_right (Complex.abs_im_le_norm z) (abs_nonneg _)
            _ ≤ (‖z₀‖ + 1) * |y₀| := by
                have hz_lt : ‖z - z₀‖ < 1 := by simpa [Metric.mem_ball, dist_eq_norm] using hz
                have hzn : ‖z‖ ≤ ‖z₀‖ + 1 := by
                  calc ‖z‖ = ‖(z - z₀) + z₀‖ := by rw [sub_add_cancel]
                    _ ≤ ‖z - z₀‖ + ‖z₀‖ := norm_add_le _ _
                    _ ≤ 1 + ‖z₀‖ := by linarith
                    _ = ‖z₀‖ + 1 := add_comm _ _
                exact mul_le_mul_of_nonneg_right hzn (abs_nonneg _)
        exact mul_le_mul_of_nonneg_right
          (mul_le_mul_of_nonneg_left (Real.exp_le_exp.mpr hre) (abs_nonneg _)) (norm_nonneg _))
      hbound_int
      (ae_of_all _ fun y₀ z _ ↦ by
        have h1 : HasDerivAt (fun w : ℂ ↦ Complex.I * w * (y₀ : ℂ)) (Complex.I * (y₀ : ℂ)) z := by
          simpa [mul_assoc, mul_comm] using
            ((hasDerivAt_id z).const_mul Complex.I).mul_const (y₀ : ℂ)
        have h2 : HasDerivAt (fun w : ℂ ↦ Complex.exp (Complex.I * w * (y₀ : ℂ)))
            (Complex.exp (Complex.I * z * (y₀ : ℂ)) * (Complex.I * (y₀ : ℂ))) z :=
          (Complex.hasDerivAt_exp _).comp z h1
        exact (h2.mul_const (ψ y₀)).congr_deriv (by ring))
    exact hderiv_at.2.differentiableAt
  let C : ℝ := (∫ y₀ : ℝ, ‖ψ y₀‖) + (∫ y₀ : ℝ, ‖ψ₂ y₀‖)
  have hH_bound : ∀ x y : ℝ, 0 ≤ y →
      ‖H ((x : ℂ) + (y : ℂ) * Complex.I)‖ ≤ C * (1 + x ^ 2)⁻¹ * Real.exp (-r * y) := by
    intro x y hy
    set z : ℂ := (x : ℂ) + (y : ℂ) * Complex.I
    have hexp_bound : ∀ y₀ : ℝ, r ≤ y₀ → ‖Complex.exp (Complex.I * z * (y₀ : ℂ))‖ ≤ Real.exp (-r * y) := by
      intro y₀ hy₀
      rw [Complex.norm_exp]
      apply Real.exp_le_exp.mpr
      have hre : (Complex.I * z * (y₀ : ℂ)).re = -y * y₀ := by
        simp [z, Complex.mul_re, Complex.mul_im]
      rw [hre]; nlinarith
    have hb0 : ‖H z‖ ≤ (∫ y₀ : ℝ, ‖ψ y₀‖) * Real.exp (-r * y) := by
      have hint_ψ : Integrable (fun y₀ : ℝ ↦ ‖ψ y₀‖) volume :=
        hψ_cont.norm.integrable_of_hasCompactSupport hψ_cs.norm
      have hint_H : Integrable (fun y₀ : ℝ ↦ ‖Complex.exp (Complex.I * z * (y₀ : ℂ)) * ψ y₀‖) volume :=
        ((Complex.continuous_exp.comp (continuous_const.mul Complex.continuous_ofReal)).mul
          hψ_cont).norm.integrable_of_hasCompactSupport hψ_cs.mul_left.norm
      calc ‖H z‖ ≤ ∫ y₀ : ℝ, ‖Complex.exp (Complex.I * z * (y₀ : ℂ)) * ψ y₀‖ :=
            norm_integral_le_integral_norm _
        _ ≤ ∫ y₀ : ℝ, ‖ψ y₀‖ * Real.exp (-r * y) := by
            refine integral_mono hint_H (hint_ψ.mul_const _) fun y₀ ↦ ?_
            by_cases h0 : ψ y₀ = 0
            · simp [h0]
            · rw [norm_mul, mul_comm]
              exact mul_le_mul_of_nonneg_left (hexp_bound y₀ (hsupp y₀ h0)) (norm_nonneg _)
        _ = (∫ y₀ : ℝ, ‖ψ y₀‖) * Real.exp (-r * y) := integral_mul_const _ _
    have hibp2 : (Complex.I * z) ^ 2 * H z =
        ∫ y₀ : ℝ, Complex.exp (Complex.I * z * (y₀ : ℂ)) * ψ₂ y₀ := by
      have h1 := ibp_exp_compactSupport z hψ_cs hψ₁_cont hd1
      have h2 := ibp_exp_compactSupport z hψ₁_cs hψ₂_cont hd2
      calc (Complex.I * z) ^ 2 * H z = (Complex.I * z) * ((Complex.I * z) * H z) := by ring
        _ = (Complex.I * z) * -(∫ y₀ : ℝ, Complex.exp (Complex.I * z * (y₀ : ℂ)) * ψ₁ y₀) := by rw [h1]
        _ = -((Complex.I * z) * ∫ y₀ : ℝ, Complex.exp (Complex.I * z * (y₀ : ℂ)) * ψ₁ y₀) := by ring
        _ = -(-(∫ y₀ : ℝ, Complex.exp (Complex.I * z * (y₀ : ℂ)) * ψ₂ y₀)) := by rw [h2]
        _ = _ := neg_neg _
    have hb2 : x ^ 2 * ‖H z‖ ≤ (∫ y₀ : ℝ, ‖ψ₂ y₀‖) * Real.exp (-r * y) := by
      have hx_le : x ^ 2 ≤ ‖(Complex.I * z) ^ 2‖ := by
        rw [norm_pow, norm_mul, Complex.norm_I, one_mul, Complex.sq_norm, Complex.normSq_apply]
        simp only [z, Complex.add_re, Complex.ofReal_re, Complex.mul_re, Complex.I_re, mul_zero,
          Complex.ofReal_im, Complex.I_im, mul_one, sub_zero, add_zero, Complex.add_im,
          Complex.mul_im, zero_add]
        nlinarith
      have hint_ψ₂ : Integrable (fun y₀ : ℝ ↦ ‖ψ₂ y₀‖) volume :=
        hψ₂_cont.norm.integrable_of_hasCompactSupport hψ₂_cs.norm
      have hint_H2 : Integrable (fun y₀ : ℝ ↦ ‖Complex.exp (Complex.I * z * (y₀ : ℂ)) * ψ₂ y₀‖) volume :=
        ((Complex.continuous_exp.comp (continuous_const.mul Complex.continuous_ofReal)).mul
          hψ₂_cont).norm.integrable_of_hasCompactSupport hψ₂_cs.mul_left.norm
      calc x ^ 2 * ‖H z‖ ≤ ‖(Complex.I * z) ^ 2‖ * ‖H z‖ :=
            mul_le_mul_of_nonneg_right hx_le (norm_nonneg _)
        _ = ‖(Complex.I * z) ^ 2 * H z‖ := (norm_mul _ _).symm
        _ = ‖∫ y₀ : ℝ, Complex.exp (Complex.I * z * (y₀ : ℂ)) * ψ₂ y₀‖ := by rw [hibp2]
        _ ≤ ∫ y₀ : ℝ, ‖Complex.exp (Complex.I * z * (y₀ : ℂ)) * ψ₂ y₀‖ :=
            norm_integral_le_integral_norm _
        _ ≤ ∫ y₀ : ℝ, ‖ψ₂ y₀‖ * Real.exp (-r * y) := by
            refine integral_mono hint_H2 (hint_ψ₂.mul_const _) fun y₀ ↦ ?_
            by_cases h0 : ψ₂ y₀ = 0
            · simp [h0]
            · rw [norm_mul, mul_comm]
              exact mul_le_mul_of_nonneg_left (hexp_bound y₀ (hsupp2 y₀ h0)) (norm_nonneg _)
        _ = (∫ y₀ : ℝ, ‖ψ₂ y₀‖) * Real.exp (-r * y) := integral_mul_const _ _
    have h1x : 0 < 1 + x ^ 2 := by positivity
    rw [mul_assoc, mul_comm (1 + x ^ 2)⁻¹, ← mul_assoc, ← div_eq_mul_inv, le_div_iff₀ h1x]
    dsimp [C]; nlinarith
  exact spacelike_commutator_zero hτr hH_diff hH_bound

/-- Uniform transverse Schwartz decay of `sliceSpatialFT h τ k` for any `h ∈ C_c^∞(ℝ × Space d)`. -/
theorem sliceSpatialFT_uniform_decay {d : ℕ} {h : ℝ × EuclideanSpace ℝ (Fin d) → ℝ}
    (hh_cd : ContDiff ℝ (⊤ : ℕ∞) h) (hh_cs : HasCompactSupport h) :
    ∃ (T C : ℝ), 0 ≤ T ∧ 0 ≤ C ∧
      (∀ τ y, T < |τ| → h (τ, y) = 0) ∧
      ∀ τ k, ‖sliceSpatialFT h τ k‖ ≤ C * (1 + ‖k‖) ^ (-((d + 1 : ℕ) : ℝ)) := by
  let H : ℝ × EuclideanSpace ℝ (Fin d) → ℂ := fun p ↦ (h p : ℂ)
  have hH_cd : ContDiff ℝ (⊤ : ℕ∞) H := Complex.ofRealCLM.contDiff.comp hh_cd
  have hH_cs : HasCompactSupport H := hh_cs.comp_left Complex.ofReal_zero
  obtain ⟨R, hR⟩ := hh_cs.isBounded.subset_closedBall (0 : ℝ × EuclideanSpace ℝ (Fin d))
  let T : ℝ := max R 0
  have hT_nn : 0 ≤ T := le_max_right R 0
  have hT_zero : ∀ τ y, T < |τ| → h (τ, y) = 0 := by
    intro τ y hτ
    by_contra hne
    have hmem := hR (subset_tsupport h hne)
    rw [Metric.mem_closedBall, dist_zero_right] at hmem
    have h1 : |τ| ≤ ‖(τ, y)‖ := by
      rw [← Real.norm_eq_abs]; exact norm_fst_le (τ, y)
    have h2 : |τ| ≤ T := h1.trans (hmem.trans (le_max_left R 0))
    linarith
  have hslice_cs (τ : ℝ) : HasCompactSupport (fun y : EuclideanSpace ℝ (Fin d) ↦ H (τ, y)) := by
    refine HasCompactSupport.of_support_subset_isCompact (isCompact_closedBall (0 : EuclideanSpace ℝ (Fin d)) T)
      fun y hy ↦ ?_
    have hne : h (τ, y) ≠ 0 := by intro h0; exact hy (by simp [H, h0])
    have hmem := hR (subset_tsupport h hne)
    rw [Metric.mem_closedBall, dist_zero_right] at hmem ⊢
    exact (norm_snd_le (τ, y)).trans (hmem.trans (le_max_left R 0))
  have hslice_cd (τ : ℝ) : ContDiff ℝ (⊤ : ℕ∞) (fun y : EuclideanSpace ℝ (Fin d) ↦ H (τ, y)) :=
    hH_cd.comp (contDiff_const.prodMk contDiff_id)
  let slice (τ : ℝ) : SchwartzMap (EuclideanSpace ℝ (Fin d)) ℂ :=
    (hslice_cs τ).toSchwartzMap (hslice_cd τ)
  have hsem_unif : ∀ (a b : ℕ), ∃ B : ℝ, 0 ≤ B ∧
      ∀ τ : ℝ, SchwartzMap.seminorm ℝ a b (slice τ) ≤ B := by
    intro a b
    have hcont_b : Continuous (fun p : ℝ × EuclideanSpace ℝ (Fin d) ↦
        ‖p.2‖ ^ a * ‖iteratedFDeriv ℝ b H p‖) :=
      (continuous_snd.norm.pow a).mul ((hH_cd.continuous_iteratedFDeriv (by simp)).norm)
    obtain ⟨B₀, hB₀⟩ := hH_cs.exists_bound_of_continuousOn hcont_b.continuousOn
    refine ⟨max B₀ 0, le_max_right _ _, fun τ ↦ ?_⟩
    refine SchwartzMap.seminorm_le_bound ℝ a b (slice τ) (le_max_right _ _) fun y ↦ ?_
    have hfn : (slice τ : EuclideanSpace ℝ (Fin d) → ℂ) =
        (fun p : ℝ × EuclideanSpace ℝ (Fin d) ↦ H ((τ, 0) + p)) ∘
          ContinuousLinearMap.inr ℝ ℝ (EuclideanSpace ℝ (Fin d)) := by
      funext z; simp only [Function.comp_apply, ContinuousLinearMap.inr_apply, Prod.mk_add_mk,
        add_zero, zero_add]; rfl
    have hderiv_le : ‖iteratedFDeriv ℝ b (slice τ) y‖ ≤ ‖iteratedFDeriv ℝ b H (τ, y)‖ := by
      rw [hfn]
      have hcomp := ContinuousLinearMap.iteratedFDeriv_comp_right
        (ContinuousLinearMap.inr ℝ ℝ (EuclideanSpace ℝ (Fin d)))
        (f := fun p : ℝ × EuclideanSpace ℝ (Fin d) ↦ H ((τ, 0) + p))
        (hH_cd.comp (contDiff_const.add contDiff_id)) y (i := b) (by simp)
      rw [hcomp]
      have hadd := iteratedFDeriv_comp_add_left (𝕜 := ℝ) b (τ, (0 : EuclideanSpace ℝ (Fin d))) (0, y)
        (f := H)
      have hinr_norm : ‖ContinuousLinearMap.inr ℝ ℝ (EuclideanSpace ℝ (Fin d))‖ ≤ 1 :=
        ContinuousLinearMap.opNorm_le_bound _ zero_le_one fun z ↦ by
          simp [Prod.norm_def, norm_nonneg]
      calc ‖(iteratedFDeriv ℝ b (fun p ↦ H ((τ, 0) + p)) (0, y)).compContinuousLinearMap
              (fun _ ↦ ContinuousLinearMap.inr ℝ ℝ (EuclideanSpace ℝ (Fin d)))‖
          ≤ ‖iteratedFDeriv ℝ b (fun p ↦ H ((τ, 0) + p)) (0, y)‖ *
              ∏ _ : Fin b, ‖ContinuousLinearMap.inr ℝ ℝ (EuclideanSpace ℝ (Fin d))‖ :=
            ContinuousMultilinearMap.norm_compContinuousLinearMap_le _ _
        _ ≤ ‖iteratedFDeriv ℝ b (fun p ↦ H ((τ, 0) + p)) (0, y)‖ * 1 := by
            gcongr
            simp only [Finset.prod_const, Finset.card_univ, Fintype.card_fin]
            exact pow_le_one₀ (norm_nonneg _) hinr_norm
        _ = ‖iteratedFDeriv ℝ b H (τ, y)‖ := by
            rw [mul_one, hadd]; simp
    by_cases hmem : (τ, y) ∈ tsupport H
    · calc ‖y‖ ^ a * ‖iteratedFDeriv ℝ b (slice τ) y‖
          ≤ ‖y‖ ^ a * ‖iteratedFDeriv ℝ b H (τ, y)‖ :=
            mul_le_mul_of_nonneg_left hderiv_le (pow_nonneg (norm_nonneg _) _)
        _ ≤ B₀ := by
            have hb := hB₀ (τ, y) hmem
            rwa [Real.norm_of_nonneg (mul_nonneg (pow_nonneg (norm_nonneg _) _) (norm_nonneg _))] at hb
        _ ≤ max B₀ 0 := le_max_left _ _
    · have h0 : iteratedFDeriv ℝ b H (τ, y) = 0 := by
        have hev : H =ᶠ[𝓝 (τ, y)] 0 := by
          filter_upwards [(isClosed_tsupport H).isOpen_compl.mem_nhds hmem] with q hq
          exact image_eq_zero_of_notMem_tsupport hq
        rw [(hev.iteratedFDeriv ℝ b).eq_of_nhds]
        simp
      rw [h0, norm_zero] at hderiv_le
      have h0' : ‖iteratedFDeriv ℝ b (slice τ) y‖ = 0 := le_antisymm hderiv_le (norm_nonneg _)
      rw [h0', mul_zero]; exact le_max_right _ _
  let q : Seminorm ℝ (SchwartzMap (EuclideanSpace ℝ (Fin d)) ℂ) :=
    ((Finset.Iic (d + 1, 0)).sup
      (schwartzSeminormFamily ℝ (EuclideanSpace ℝ (Fin d)) ℂ)).comp
      (SchwartzMap.fourierTransformCLM ℝ).toLinearMap
  have hq_cont : Continuous q := by
    have hsup_cont : ∀ s₀ : Finset (ℕ × ℕ),
        Continuous ⇑(s₀.sup (schwartzSeminormFamily ℝ (EuclideanSpace ℝ (Fin d)) ℂ)) := by
      intro s₀
      induction s₀ using Finset.induction_on with
      | empty =>
        change Continuous (fun _ : SchwartzMap (EuclideanSpace ℝ (Fin d)) ℂ ↦ (0 : ℝ))
        exact continuous_const
      | insert a s₀ _ ih =>
        rw [Finset.sup_insert]
        change Continuous (fun f : SchwartzMap (EuclideanSpace ℝ (Fin d)) ℂ ↦
          ((schwartzSeminormFamily ℝ (EuclideanSpace ℝ (Fin d)) ℂ a) ⊔
            s₀.sup (schwartzSeminormFamily ℝ (EuclideanSpace ℝ (Fin d)) ℂ)) f)
        have heq : (fun f : SchwartzMap (EuclideanSpace ℝ (Fin d)) ℂ ↦
              ((schwartzSeminormFamily ℝ (EuclideanSpace ℝ (Fin d)) ℂ a) ⊔
                s₀.sup (schwartzSeminormFamily ℝ (EuclideanSpace ℝ (Fin d)) ℂ)) f) =
            fun f ↦ max ((schwartzSeminormFamily ℝ (EuclideanSpace ℝ (Fin d)) ℂ a) f)
              ((s₀.sup (schwartzSeminormFamily ℝ (EuclideanSpace ℝ (Fin d)) ℂ)) f) :=
          funext fun f ↦ Seminorm.sup_apply _ _ f
        rw [heq]
        exact ((schwartz_withSeminorms ℝ (EuclideanSpace ℝ (Fin d)) ℂ).continuous_seminorm a).max ih
    exact (hsup_cont (Finset.Iic (d + 1, 0))).comp (SchwartzMap.fourierTransformCLM ℝ).continuous
  obtain ⟨s, C₀, _, hC₀⟩ :=
    Seminorm.bound_of_continuous (schwartz_withSeminorms ℝ (EuclideanSpace ℝ (Fin d)) ℂ) q hq_cont
  choose B hB_nn hB_le using fun p : ℕ × ℕ ↦ hsem_unif p.1 p.2
  let M_sum : ℝ := ∑ p ∈ s, B p
  have hM_nn : 0 ≤ M_sum := Finset.sum_nonneg fun p _ ↦ hB_nn p
  have hsup_le (τ : ℝ) : (s.sup (schwartzSeminormFamily ℝ (EuclideanSpace ℝ (Fin d)) ℂ)) (slice τ) ≤ M_sum := by
    refine Seminorm.finset_sup_apply_le hM_nn fun p hp ↦ ?_
    exact (hB_le p τ).trans (Finset.single_le_sum (fun r _ ↦ hB_nn r) hp)
  have hpi : 1 ≤ 2 * Real.pi := by linarith [Real.pi_gt_three]
  have hpi_pos : 0 < 2 * Real.pi := by positivity
  refine ⟨T, (4 * Real.pi) ^ (d + 1) * ((C₀ : ℝ) * M_sum), hT_nn, by positivity, hT_zero, fun τ k ↦ ?_⟩
  have hft_eq : sliceSpatialFT h τ k = (𝓕 (slice τ)) ((2 * Real.pi)⁻¹ • k) := by
    rw [SchwartzMap.fourier_coe, Real.fourier_eq]
    unfold sliceSpatialFT
    refine integral_congr_ae (ae_of_all _ fun y ↦ ?_)
    dsimp only
    rw [Circle.smul_def, smul_eq_mul, Real.fourierChar_apply, real_inner_smul_right]
    have hpi_ne : 2 * Real.pi ≠ 0 := hpi_pos.ne'
    have harg : 2 * Real.pi * -((2 * Real.pi)⁻¹ * inner ℝ y k) = -inner ℝ y k := by
      field_simp [hpi_ne]
    rw [harg]
    change Complex.exp (-Complex.I * (inner ℝ y k : ℂ)) * (h (τ, y) : ℂ) =
      Complex.exp (((-inner ℝ y k : ℝ) : ℂ) * Complex.I) * (h (τ, y) : ℂ)
    congr 2; push_cast; ring
  rw [hft_eq]
  have hsem := SchwartzMap.one_add_le_sup_seminorm_apply (𝕜 := ℝ)
    (m := (d + 1, 0)) (k := d + 1) (n := 0) le_rfl le_rfl (𝓕 (slice τ)) ((2 * Real.pi)⁻¹ • k)
  rw [norm_iteratedFDeriv_zero] at hsem
  have hq_le : ((Finset.Iic (d + 1, 0)).sup
      (schwartzSeminormFamily ℝ (EuclideanSpace ℝ (Fin d)) ℂ)) (𝓕 (slice τ)) ≤ (C₀ : ℝ) * M_sum := by
    calc _ = q (slice τ) := rfl
      _ ≤ (C₀ : ℝ) * (s.sup (schwartzSeminormFamily ℝ (EuclideanSpace ℝ (Fin d)) ℂ)) (slice τ) :=
          hC₀ (slice τ)
      _ ≤ (C₀ : ℝ) * M_sum := mul_le_mul_of_nonneg_left (hsup_le τ) C₀.coe_nonneg
  have h1k_pos : 0 < 1 + ‖k‖ := by linarith [norm_nonneg k]
  have h1k_le : 1 + ‖k‖ ≤ (2 * Real.pi) * (1 + ‖(2 * Real.pi)⁻¹ • k‖) := by
    rw [norm_smul, Real.norm_of_nonneg (inv_nonneg.mpr hpi_pos.le)]
    have hmul : (2 * Real.pi) * ((2 * Real.pi)⁻¹ * ‖k‖) = ‖k‖ := by
      rw [← mul_assoc, mul_inv_cancel₀ hpi_pos.ne', one_mul]
    nlinarith
  have hpow : (1 + ‖k‖) ^ (d + 1) * ‖(𝓕 (slice τ)) ((2 * Real.pi)⁻¹ • k)‖ ≤
      (4 * Real.pi) ^ (d + 1) * ((C₀ : ℝ) * M_sum) := by
    have h1 := pow_le_pow_left₀ h1k_pos.le h1k_le (d + 1)
    rw [mul_pow] at h1
    calc (1 + ‖k‖) ^ (d + 1) * ‖(𝓕 (slice τ)) ((2 * Real.pi)⁻¹ • k)‖
        ≤ ((2 * Real.pi) ^ (d + 1) * (1 + ‖(2 * Real.pi)⁻¹ • k‖) ^ (d + 1)) *
            ‖(𝓕 (slice τ)) ((2 * Real.pi)⁻¹ • k)‖ :=
          mul_le_mul_of_nonneg_right h1 (norm_nonneg _)
      _ = (2 * Real.pi) ^ (d + 1) *
            ((1 + ‖(2 * Real.pi)⁻¹ • k‖) ^ (d + 1) * ‖(𝓕 (slice τ)) ((2 * Real.pi)⁻¹ • k)‖) := by ring
      _ ≤ (2 * Real.pi) ^ (d + 1) * (2 ^ (d + 1) * ((C₀ : ℝ) * M_sum)) :=
          mul_le_mul_of_nonneg_left (hsem.trans (mul_le_mul_of_nonneg_left hq_le (by positivity)))
            (by positivity)
      _ = (4 * Real.pi) ^ (d + 1) * ((C₀ : ℝ) * M_sum) := by
          rw [← mul_assoc, ← mul_pow]; congr 2; ring
  rw [Real.rpow_neg h1k_pos.le, Real.rpow_natCast, ← div_eq_mul_inv,
    le_div_iff₀ (pow_pos h1k_pos _), mul_comm]
  exact hpow

theorem sliceSpatialFT_continuous {d : ℕ} {h : ℝ × EuclideanSpace ℝ (Fin d) → ℝ}
    (hh_cont : Continuous h) (hh_cs : HasCompactSupport h) :
    Continuous (fun p : ℝ × EuclideanSpace ℝ (Fin d) ↦ sliceSpatialFT h p.1 p.2) := by
  obtain ⟨R, hR⟩ := hh_cs.isBounded.subset_closedBall (0 : ℝ × EuclideanSpace ℝ (Fin d))
  let T : ℝ := max R 0
  obtain ⟨M, hM⟩ := hh_cs.exists_bound_of_continuousOn hh_cont.continuousOn
  let bound : EuclideanSpace ℝ (Fin d) → ℝ :=
    (Metric.closedBall (0 : EuclideanSpace ℝ (Fin d)) T).indicator (fun _ ↦ max M 0)
  have hbound_int : Integrable bound volume :=
    (integrableOn_const (hs := measure_closedBall_lt_top.ne)).integrable_indicator
      measurableSet_closedBall
  refine continuous_of_dominated (bound := bound) ?_ ?_ hbound_int ?_
  · intro ⟨τ, k⟩
    exact ((Complex.continuous_exp.comp
      (continuous_const.mul (Complex.continuous_ofReal.comp (continuous_id.inner continuous_const)))).mul
      (Complex.continuous_ofReal.comp (hh_cont.comp (continuous_const.prodMk continuous_id)))).aestronglyMeasurable
  · intro ⟨τ, k⟩
    refine ae_of_all _ fun y ↦ ?_
    by_cases h0 : h (τ, y) = 0
    · simp only [h0, Complex.ofReal_zero, mul_zero, norm_zero]
      exact Set.indicator_nonneg (fun _ _ ↦ le_max_right _ _) y
    · have hmem : y ∈ Metric.closedBall (0 : EuclideanSpace ℝ (Fin d)) T := by
        have hm := hR (subset_tsupport h h0)
        rw [Metric.mem_closedBall, dist_zero_right] at hm ⊢
        exact (norm_snd_le (τ, y)).trans (hm.trans (le_max_left R 0))
      dsimp only [bound]
      rw [Set.indicator_of_mem hmem, norm_mul, Complex.norm_real]
      have hexp1 : ‖Complex.exp (-Complex.I * (inner ℝ y k : ℂ))‖ = 1 := by
        rw [show -Complex.I * (inner ℝ y k : ℂ) = ((-inner ℝ y k : ℝ) : ℂ) * Complex.I by
          push_cast; ring]
        exact Complex.norm_exp_ofReal_mul_I _
      rw [hexp1, one_mul]
      exact (hM (τ, y) (subset_tsupport h h0)).trans (le_max_left _ _)
  · refine ae_of_all _ fun y ↦ ?_
    exact (Complex.continuous_exp.comp
      (continuous_const.mul (Complex.continuous_ofReal.comp
        (continuous_const.inner continuous_snd)))).mul
      (Complex.continuous_ofReal.comp (hh_cont.comp (continuous_fst.prodMk continuous_const)))

theorem pj_slice_integrable {d : ℕ} {m : ℝ} (hm : 0 < m)
    {h : ℝ × EuclideanSpace ℝ (Fin d) → ℝ}
    (hh_cd : ContDiff ℝ (⊤ : ℕ∞) h) (hh_cs : HasCompactSupport h) :
    Integrable (fun p : ℝ × EuclideanSpace ℝ (Fin d) ↦
      ((Real.sin (p.1 * modeDispersion m p.2) / modeDispersion m p.2 : ℝ) : ℂ) *
        sliceSpatialFT h p.1 p.2) (volume.prod volume) := by
  obtain ⟨T, C, hT_nn, hC_nn, hT_zero, hdecay⟩ := sliceSpatialFT_uniform_decay hh_cd hh_cs
  have hcont : Continuous (fun p : ℝ × EuclideanSpace ℝ (Fin d) ↦
      ((Real.sin (p.1 * modeDispersion m p.2) / modeDispersion m p.2 : ℝ) : ℂ) *
        sliceSpatialFT h p.1 p.2) := by
    refine Continuous.mul ?_ (sliceSpatialFT_continuous hh_cd.continuous hh_cs)
    apply Complex.continuous_ofReal.comp
    refine Continuous.div ?_ ?_ fun p ↦ (modeDispersion_pos hm p.2).ne'
    · unfold modeDispersion; fun_prop
    · unfold modeDispersion; fun_prop
  have hint_t : Integrable (fun τ : ℝ ↦ (Set.Icc (-T) T).indicator (fun t ↦ |t|) τ) volume :=
    (continuous_abs.integrableOn_Icc).integrable_indicator measurableSet_Icc
  have hint_k : Integrable (fun k : EuclideanSpace ℝ (Fin d) ↦
      C * (1 + ‖k‖) ^ (-((d + 1 : ℕ) : ℝ))) volume := by
    refine (integrable_one_add_norm ?_).const_mul C
    rw [finrank_euclideanSpace_fin]
    exact_mod_cast Nat.lt_succ_self d
  refine (hint_t.mul_prod hint_k).mono' hcont.aestronglyMeasurable (ae_of_all _ fun ⟨τ, k⟩ ↦ ?_)
  by_cases hτ : T < |τ|
  · have hft0 : sliceSpatialFT h τ k = 0 := by
      unfold sliceSpatialFT
      simp only [hT_zero τ _ hτ, Complex.ofReal_zero, mul_zero, integral_zero]
    simp only [hft0, mul_zero, norm_zero]
    exact mul_nonneg (Set.indicator_nonneg (fun _ _ ↦ abs_nonneg _) _)
      (mul_nonneg hC_nn (Real.rpow_nonneg (by linarith [norm_nonneg k]) _))
  · have hmem : τ ∈ Set.Icc (-T) T := abs_le.mp (not_lt.mp hτ)
    rw [Set.indicator_of_mem hmem, norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_div,
      abs_of_pos (modeDispersion_pos hm k)]
    have hsin : |Real.sin (τ * modeDispersion m k)| / modeDispersion m k ≤ |τ| := by
      rw [div_le_iff₀ (modeDispersion_pos hm k)]
      calc |Real.sin (τ * modeDispersion m k)|
          ≤ |τ * modeDispersion m k| := Real.abs_sin_le_abs
        _ = |τ| * modeDispersion m k := by rw [abs_mul, abs_of_pos (modeDispersion_pos hm k)]
    exact mul_le_mul hsin (hdecay τ k) (norm_nonneg _) (abs_nonneg τ)

private theorem hasCompactSupport_slice {d : ℕ} {h : ℝ × EuclideanSpace ℝ (Fin d) → ℝ}
    (hh_cs : HasCompactSupport h) (τ : ℝ) :
    HasCompactSupport (fun y : EuclideanSpace ℝ (Fin d) ↦ h (τ, y)) := by
  obtain ⟨R, hR⟩ := hh_cs.isBounded.subset_closedBall (0 : ℝ × EuclideanSpace ℝ (Fin d))
  refine HasCompactSupport.of_support_subset_isCompact (isCompact_closedBall (0 : EuclideanSpace ℝ (Fin d)) (max R 0)) ?_
  intro y hy
  have hm := hR (subset_tsupport h hy)
  rw [Metric.mem_closedBall, dist_zero_right] at hm ⊢
  exact (norm_snd_le (τ, y)).trans (hm.trans (le_max_left R 0))

/-- Pauli–Jordan functional on compactly supported smooth functions `h : ℝ × Space d → ℝ`. -/
noncomputable def pjFunctional {d : ℕ} (m : ℝ) (h : ℝ × EuclideanSpace ℝ (Fin d) → ℝ) : ℂ :=
  ∫ k : EuclideanSpace ℝ (Fin d), ∫ τ : ℝ,
    ((Real.sin (τ * modeDispersion m k) / modeDispersion m k : ℝ) : ℂ) *
      sliceSpatialFT h τ k

theorem pjFunctional_add {d : ℕ} {m : ℝ} (hm : 0 < m)
    {h₁ h₂ : ℝ × EuclideanSpace ℝ (Fin d) → ℝ}
    (h₁_cd : ContDiff ℝ (⊤ : ℕ∞) h₁) (h₁_cs : HasCompactSupport h₁)
    (h₂_cd : ContDiff ℝ (⊤ : ℕ∞) h₂) (h₂_cs : HasCompactSupport h₂) :
    pjFunctional m (h₁ + h₂) = pjFunctional m h₁ + pjFunctional m h₂ := by
  have hint1 := pj_slice_integrable hm h₁_cd h₁_cs
  have hint2 := pj_slice_integrable hm h₂_cd h₂_cs
  have hint12 : Integrable (fun p : ℝ × EuclideanSpace ℝ (Fin d) ↦
      ((Real.sin (p.1 * modeDispersion m p.2) / modeDispersion m p.2 : ℝ) : ℂ) *
        sliceSpatialFT (h₁ + h₂) p.1 p.2) (volume.prod volume) :=
    pj_slice_integrable hm (h₁_cd.add h₂_cd) (h₁_cs.add h₂_cs)
  unfold pjFunctional
  rw [← integral_prod_symm _ hint12, ← integral_prod_symm _ hint1, ← integral_prod_symm _ hint2,
    ← integral_add hint1 hint2]
  refine integral_congr_ae (ae_of_all _ fun ⟨τ, k⟩ ↦ ?_)
  dsimp only
  have hslice_add : sliceSpatialFT (h₁ + h₂) τ k = sliceSpatialFT h₁ τ k + sliceSpatialFT h₂ τ k := by
    unfold sliceSpatialFT
    have hi1 : Integrable (fun y : EuclideanSpace ℝ (Fin d) ↦
        Complex.exp (-Complex.I * (inner ℝ y k : ℂ)) * (h₁ (τ, y) : ℂ)) volume :=
      ((Complex.continuous_exp.comp
        (continuous_const.mul (Complex.continuous_ofReal.comp (continuous_id.inner continuous_const)))).mul
        (Complex.continuous_ofReal.comp (h₁_cd.continuous.comp (continuous_const.prodMk continuous_id)))).integrable_of_hasCompactSupport
        ((hasCompactSupport_slice h₁_cs τ).comp_left Complex.ofReal_zero).mul_left
    have hi2 : Integrable (fun y : EuclideanSpace ℝ (Fin d) ↦
        Complex.exp (-Complex.I * (inner ℝ y k : ℂ)) * (h₂ (τ, y) : ℂ)) volume :=
      ((Complex.continuous_exp.comp
        (continuous_const.mul (Complex.continuous_ofReal.comp (continuous_id.inner continuous_const)))).mul
        (Complex.continuous_ofReal.comp (h₂_cd.continuous.comp (continuous_const.prodMk continuous_id)))).integrable_of_hasCompactSupport
        ((hasCompactSupport_slice h₂_cs τ).comp_left Complex.ofReal_zero).mul_left
    rw [← integral_add hi1 hi2]
    refine integral_congr_ae (ae_of_all _ fun y ↦ ?_)
    simp only [Pi.add_apply, Complex.ofReal_add, mul_add]
  rw [hslice_add, mul_add]

private theorem continuous_uncurry_comp {α β γ δ : Type*} [TopologicalSpace α] [TopologicalSpace β]
    [TopologicalSpace γ] [TopologicalSpace δ] {f : α → β → γ} {g₁ : δ → α} {g₂ : δ → β}
    (hf : Continuous (fun p : α × β ↦ f p.1 p.2)) (hg₁ : Continuous g₁) (hg₂ : Continuous g₂) :
    Continuous (fun x ↦ f (g₁ x) (g₂ x)) :=
  hf.comp (hg₁.prodMk hg₂)

private theorem pj_wedge_kperp_zero {n : ℕ} {m τ δ : ℝ} (hm : 0 < m) (hδ : 0 < δ)
    (u : EuclideanSpace ℝ (Fin (n + 1))) (hu : ‖u‖ = 1)
    {h : ℝ × EuclideanSpace ℝ (Fin (n + 1)) → ℝ}
    (hh_cd : ContDiff ℝ (⊤ : ℕ∞) h) (hh_cs : HasCompactSupport h)
    (hwedge : ∀ p : ℝ × EuclideanSpace ℝ (Fin (n + 1)), h p ≠ 0 → |p.1| + δ ≤ inner ℝ u p.2)
    (k_perp : EuclideanSpace ℝ (Fin n)) :
    (∫ k₀ : ℝ,
      ((Real.sin (τ * modeDispersion m (MassShell.align u ((MassShell.split n).symm (k₀, k_perp)))) /
          modeDispersion m (MassShell.align u ((MassShell.split n).symm (k₀, k_perp))) : ℝ) : ℂ) *
        sliceSpatialFT h τ (MassShell.align u ((MassShell.split n).symm (k₀, k_perp)))) = 0 := by
  let R := MassShell.align u
  have hR_mp : MeasurePreserving R.toMeasurableEquiv volume volume := R.measurePreserving
  have hR_coe : ⇑R.toMeasurableEquiv = ⇑R := rfl
  have hsplit := (MassShell.split_volume n).symm
  let g : ℝ × EuclideanSpace ℝ (Fin n) → ℝ := fun q ↦
    h (τ, R ((MassShell.split n).symm q))
  have hmap_cd : ContDiff ℝ (⊤ : ℕ∞) (fun q : ℝ × EuclideanSpace ℝ (Fin n) ↦
      R ((MassShell.split n).symm q)) :=
    (R.toContinuousLinearMap.comp
      ((MassShell.splitIsometry n).symm.toContinuousLinearMap.comp
        (WithLp.prodContinuousLinearEquiv 2 ℝ ℝ (EuclideanSpace ℝ (Fin n))).symm.toContinuousLinearMap)).contDiff
  have hg_cd : ContDiff ℝ (⊤ : ℕ∞) g :=
    hh_cd.comp (contDiff_const.prodMk hmap_cd)
  have hg_cs : HasCompactSupport g := by
    let hhomeo : Homeomorph (ℝ × EuclideanSpace ℝ (Fin n)) (EuclideanSpace ℝ (Fin (n + 1))) :=
      ((WithLp.prodContinuousLinearEquiv 2 ℝ ℝ (EuclideanSpace ℝ (Fin n))).symm.toHomeomorph.trans
        (MassShell.splitIsometry n).symm.toHomeomorph).trans R.toHomeomorph
    have hgf : g = (fun y : EuclideanSpace ℝ (Fin (n + 1)) ↦ h (τ, y)) ∘ hhomeo := by
      funext q; rfl
    rw [hgf]
    exact (hasCompactSupport_slice hh_cs τ).comp_homeomorph hhomeo
  have hg_wedge : ∀ q : ℝ × EuclideanSpace ℝ (Fin n), g q ≠ 0 → |τ| + δ ≤ q.1 := by
    intro ⟨y₀, y_perp⟩ hne
    have hw := hwedge (τ, R ((MassShell.split n).symm (y₀, y_perp))) hne
    have hinner : inner ℝ u (R ((MassShell.split n).symm (y₀, y_perp))) = y₀ := by
      rw [← MassShell.align_axis u hu]
      change inner ℝ (R (MassShell.axis n)) (R ((MassShell.split n).symm (y₀, y_perp))) = y₀
      rw [R.inner_map_map]
      change inner ℝ (EuclideanSpace.basisFun (Fin (n + 1)) ℝ 0)
        ((MassShell.split n).symm (y₀, y_perp)) = y₀
      rw [EuclideanSpace.basisFun_inner]
      exact congrArg Prod.fst ((MassShell.split n).apply_symm_apply (y₀, y_perp))
    rwa [hinner] at hw
  let g₁ : ℝ × EuclideanSpace ℝ (Fin n) → ℝ := fun q ↦
    deriv (fun s : ℝ ↦ g (s, q.2)) q.1
  let g₂ : ℝ × EuclideanSpace ℝ (Fin n) → ℝ := fun q ↦
    deriv (fun s : ℝ ↦ g₁ (s, q.2)) q.1
  have hg₁_eq : g₁ = fun q ↦ fderiv ℝ g q (1, 0) := by
    funext ⟨y₀, y_perp⟩
    have hcomp : HasDerivAt (fun s : ℝ ↦ g (s, y_perp)) (fderiv ℝ g (y₀, y_perp) (1, 0)) y₀ := by
      have h1 : HasDerivAt (fun s : ℝ ↦ (s, y_perp)) ((1 : ℝ), (0 : EuclideanSpace ℝ (Fin n))) y₀ :=
        (hasDerivAt_id y₀).prodMk (hasDerivAt_const y₀ y_perp)
      exact (hg_cd.differentiable (by simp) (y₀, y_perp)).hasFDerivAt.comp_hasDerivAt y₀ h1
    exact hcomp.deriv
  have hg₁_cd : ContDiff ℝ (⊤ : ℕ∞) g₁ := by
    rw [hg₁_eq]
    exact (hg_cd.fderiv_right (m := (⊤ : ℕ∞)) (by simp)).clm_apply contDiff_const
  have hg₁_cs : HasCompactSupport g₁ := by
    refine HasCompactSupport.of_support_subset_isCompact hg_cs fun q hq ↦ ?_
    by_contra hnot
    have hev : (fun s : ℝ ↦ g (s, q.2)) =ᶠ[𝓝 q.1] 0 := by
      have hnh : (tsupport g)ᶜ ∈ 𝓝 q := (isClosed_tsupport g).isOpen_compl.mem_nhds hnot
      have hcont_in : Continuous (fun s : ℝ ↦ (s, q.2)) := continuous_id.prodMk continuous_const
      filter_upwards [hcont_in.continuousAt.preimage_mem_nhds hnh] with s hs
      exact image_eq_zero_of_notMem_tsupport hs
    exact hq (by dsimp [g₁]; rw [hev.deriv_eq]; simp)
  have hg₂_eq : g₂ = fun q ↦ fderiv ℝ g₁ q (1, 0) := by
    funext ⟨y₀, y_perp⟩
    have hcomp : HasDerivAt (fun s : ℝ ↦ g₁ (s, y_perp)) (fderiv ℝ g₁ (y₀, y_perp) (1, 0)) y₀ := by
      have h1 : HasDerivAt (fun s : ℝ ↦ (s, y_perp)) ((1 : ℝ), (0 : EuclideanSpace ℝ (Fin n))) y₀ :=
        (hasDerivAt_id y₀).prodMk (hasDerivAt_const y₀ y_perp)
      exact (hg₁_cd.differentiable (by simp) (y₀, y_perp)).hasFDerivAt.comp_hasDerivAt y₀ h1
    exact hcomp.deriv
  have hg₂_cd : ContDiff ℝ (⊤ : ℕ∞) g₂ := by
    rw [hg₂_eq]
    exact (hg₁_cd.fderiv_right (m := (⊤ : ℕ∞)) (by simp)).clm_apply contDiff_const
  have hg₂_cs : HasCompactSupport g₂ := by
    refine HasCompactSupport.of_support_subset_isCompact hg₁_cs fun q hq ↦ ?_
    by_contra hnot
    have hev : (fun s : ℝ ↦ g₁ (s, q.2)) =ᶠ[𝓝 q.1] 0 := by
      have hnh : (tsupport g₁)ᶜ ∈ 𝓝 q := (isClosed_tsupport g₁).isOpen_compl.mem_nhds hnot
      have hcont_in : Continuous (fun s : ℝ ↦ (s, q.2)) := continuous_id.prodMk continuous_const
      filter_upwards [hcont_in.continuousAt.preimage_mem_nhds hnh] with s hs
      exact image_eq_zero_of_notMem_tsupport hs
    exact hq (by dsimp [g₂]; rw [hev.deriv_eq]; simp)
  let ψ : ℝ → ℂ := fun y₀ ↦
    ∫ y_perp : EuclideanSpace ℝ (Fin n),
      Complex.exp (-Complex.I * (inner ℝ y_perp k_perp : ℂ)) * (g (y₀, y_perp) : ℂ)
  let ψ₁ : ℝ → ℂ := fun y₀ ↦
    ∫ y_perp : EuclideanSpace ℝ (Fin n),
      Complex.exp (-Complex.I * (inner ℝ y_perp k_perp : ℂ)) * (g₁ (y₀, y_perp) : ℂ)
  let ψ₂ : ℝ → ℂ := fun y₀ ↦
    ∫ y_perp : EuclideanSpace ℝ (Fin n),
      Complex.exp (-Complex.I * (inner ℝ y_perp k_perp : ℂ)) * (g₂ (y₀, y_perp) : ℂ)
  have hmk_cs_cont : ∀ (φ : ℝ × EuclideanSpace ℝ (Fin n) → ℝ),
      Continuous φ → HasCompactSupport φ →
      HasCompactSupport (fun y₀ : ℝ ↦ ∫ y_perp : EuclideanSpace ℝ (Fin n),
        Complex.exp (-Complex.I * (inner ℝ y_perp k_perp : ℂ)) * (φ (y₀, y_perp) : ℂ)) ∧
      Continuous (fun y₀ : ℝ ↦ ∫ y_perp : EuclideanSpace ℝ (Fin n),
        Complex.exp (-Complex.I * (inner ℝ y_perp k_perp : ℂ)) * (φ (y₀, y_perp) : ℂ)) := by
    intro φ hφ_cont hφ_cs
    obtain ⟨B, hB⟩ := hφ_cs.isBounded.subset_closedBall (0 : ℝ × EuclideanSpace ℝ (Fin n))
    let Tφ : ℝ := max B 0
    obtain ⟨Mφ, hMφ⟩ := hφ_cs.exists_bound_of_continuousOn hφ_cont.continuousOn
    refine ⟨?_, ?_⟩
    · refine HasCompactSupport.of_support_subset_isCompact (isCompact_Icc (a := -Tφ) (b := Tφ))
        fun y₀ hy₀ ↦ ?_
      by_contra hnot
      have h0 : ∀ y_perp, φ (y₀, y_perp) = 0 := fun y_perp ↦ by
        by_contra hne
        have hmem := hB (subset_tsupport φ hne)
        rw [Metric.mem_closedBall, dist_zero_right] at hmem
        have h1 : |y₀| ≤ Tφ :=
          le_trans (by rw [← Real.norm_eq_abs]; exact norm_fst_le (y₀, y_perp))
            (hmem.trans (le_max_left B 0))
        exact hnot (abs_le.mp h1)
      exact hy₀ (by simp [h0])
    · let bnd : EuclideanSpace ℝ (Fin n) → ℝ :=
        (Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) Tφ).indicator (fun _ ↦ max Mφ 0)
      refine continuous_of_dominated (bound := bnd)
        (fun y₀ ↦ ((Complex.continuous_exp.comp (continuous_const.mul
          (Complex.continuous_ofReal.comp (continuous_id.inner continuous_const)))).mul
          (Complex.continuous_ofReal.comp (hφ_cont.comp (continuous_const.prodMk continuous_id)))).aestronglyMeasurable)
        (fun y₀ ↦ ae_of_all _ fun y_perp ↦ by
          by_cases h0 : φ (y₀, y_perp) = 0
          · simp only [h0, Complex.ofReal_zero, mul_zero, norm_zero]
            exact Set.indicator_nonneg (fun _ _ ↦ le_max_right _ _) _
          · have hmem : y_perp ∈ Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) Tφ := by
              have hm := hB (subset_tsupport φ h0)
              rw [Metric.mem_closedBall, dist_zero_right] at hm ⊢
              exact (norm_snd_le (y₀, y_perp)).trans (hm.trans (le_max_left B 0))
            dsimp only [bnd]
            rw [Set.indicator_of_mem hmem, norm_mul, Complex.norm_real]
            have hexp1 : ‖Complex.exp (-Complex.I * (inner ℝ y_perp k_perp : ℂ))‖ = 1 := by
              rw [show -Complex.I * (inner ℝ y_perp k_perp : ℂ) =
                ((-inner ℝ y_perp k_perp : ℝ) : ℂ) * Complex.I by push_cast; ring]
              exact Complex.norm_exp_ofReal_mul_I _
            rw [hexp1, one_mul]
            exact (hMφ (y₀, y_perp) (subset_tsupport φ h0)).trans (le_max_left _ _))
        ((integrableOn_const (hs := measure_closedBall_lt_top.ne)).integrable_indicator
          measurableSet_closedBall)
        (ae_of_all _ fun y_perp ↦ continuous_const.mul
          (Complex.continuous_ofReal.comp (hφ_cont.comp (continuous_id.prodMk continuous_const))))
  have hmk_deriv : ∀ (φ φ' : ℝ × EuclideanSpace ℝ (Fin n) → ℝ),
      ContDiff ℝ (⊤ : ℕ∞) φ → HasCompactSupport φ →
      Continuous φ' → HasCompactSupport φ' →
      (∀ y₀ y_perp, HasDerivAt (fun s : ℝ ↦ φ (s, y_perp)) (φ' (y₀, y_perp)) y₀) →
      ∀ y₀ : ℝ, HasDerivAt
        (fun s : ℝ ↦ ∫ y_perp : EuclideanSpace ℝ (Fin n),
          Complex.exp (-Complex.I * (inner ℝ y_perp k_perp : ℂ)) * (φ (s, y_perp) : ℂ))
        (∫ y_perp : EuclideanSpace ℝ (Fin n),
          Complex.exp (-Complex.I * (inner ℝ y_perp k_perp : ℂ)) * (φ' (y₀, y_perp) : ℂ)) y₀ := by
    intro φ φ' hφ_cd hφ_cs hφ'_cont hφ'_cs hder y₀
    obtain ⟨B, hB⟩ := hφ'_cs.isBounded.subset_closedBall (0 : ℝ × EuclideanSpace ℝ (Fin n))
    let Tφ : ℝ := max B 0
    obtain ⟨Mφ, hMφ⟩ := hφ'_cs.exists_bound_of_continuousOn hφ'_cont.continuousOn
    let bnd : EuclideanSpace ℝ (Fin n) → ℝ :=
      (Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) Tφ).indicator (fun _ ↦ max Mφ 0)
    have h := hasDerivAt_integral_of_dominated_loc_of_deriv_le
      (F := fun s y_perp ↦ Complex.exp (-Complex.I * (inner ℝ y_perp k_perp : ℂ)) * (φ (s, y_perp) : ℂ))
      (F' := fun s y_perp ↦ Complex.exp (-Complex.I * (inner ℝ y_perp k_perp : ℂ)) * (φ' (s, y_perp) : ℂ))
      (bound := bnd)
      (x₀ := y₀) (s := Set.univ) Filter.univ_mem
      (Eventually.of_forall fun s ↦ ((Complex.continuous_exp.comp (continuous_const.mul
        (Complex.continuous_ofReal.comp (continuous_id.inner continuous_const)))).mul
        (Complex.continuous_ofReal.comp (hφ_cd.continuous.comp (continuous_const.prodMk continuous_id)))).aestronglyMeasurable)
      (((Complex.continuous_exp.comp (continuous_const.mul
        (Complex.continuous_ofReal.comp (continuous_id.inner continuous_const)))).mul
        (Complex.continuous_ofReal.comp (hφ_cd.continuous.comp (continuous_const.prodMk continuous_id)))).integrable_of_hasCompactSupport
        ((hasCompactSupport_slice hφ_cs y₀).comp_left Complex.ofReal_zero).mul_left)
      (((Complex.continuous_exp.comp (continuous_const.mul
        (Complex.continuous_ofReal.comp (continuous_id.inner continuous_const)))).mul
        (Complex.continuous_ofReal.comp (hφ'_cont.comp (continuous_const.prodMk continuous_id)))).aestronglyMeasurable)
      (ae_of_all _ fun y_perp s _ ↦ by
        by_cases h0 : φ' (s, y_perp) = 0
        · simp only [h0, Complex.ofReal_zero, mul_zero, norm_zero]
          exact Set.indicator_nonneg (fun _ _ ↦ le_max_right _ _) _
        · have hmem : y_perp ∈ Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) Tφ := by
            have hm := hB (subset_tsupport φ' h0)
            rw [Metric.mem_closedBall, dist_zero_right] at hm ⊢
            exact (norm_snd_le (s, y_perp)).trans (hm.trans (le_max_left B 0))
          dsimp only [bnd]
          rw [Set.indicator_of_mem hmem, norm_mul, Complex.norm_real]
          have hexp1 : ‖Complex.exp (-Complex.I * (inner ℝ y_perp k_perp : ℂ))‖ = 1 := by
            rw [show -Complex.I * (inner ℝ y_perp k_perp : ℂ) =
              ((-inner ℝ y_perp k_perp : ℝ) : ℂ) * Complex.I by push_cast; ring]
            exact Complex.norm_exp_ofReal_mul_I _
          rw [hexp1, one_mul]
          exact (hMφ (s, y_perp) (subset_tsupport φ' h0)).trans (le_max_left _ _))
      ((integrableOn_const (μ := (volume : Measure (EuclideanSpace ℝ (Fin n))))
          (hs := measure_closedBall_lt_top.ne)).integrable_indicator
        measurableSet_closedBall)
      (ae_of_all _ fun y_perp s _ ↦
        ((hder s y_perp).ofReal_comp).const_mul _)
    exact h.2
  have hψ_cs := (hmk_cs_cont g hg_cd.continuous hg_cs).1
  have hψ₁_pair := hmk_cs_cont g₁ hg₁_cd.continuous hg₁_cs
  have hψ₂_pair := hmk_cs_cont g₂ hg₂_cd.continuous hg₂_cs
  have hd1 : ∀ y₀, HasDerivAt ψ (ψ₁ y₀) y₀ :=
    hmk_deriv g g₁ hg_cd hg_cs hg₁_cd.continuous hg₁_cs fun y₀ y_perp ↦
      ((hg_cd.comp (contDiff_id.prodMk contDiff_const)).differentiable (by simp) y₀).hasDerivAt
  have hd2 : ∀ y₀, HasDerivAt ψ₁ (ψ₂ y₀) y₀ :=
    hmk_deriv g₁ g₂ hg₁_cd hg₁_cs hg₂_cd.continuous hg₂_cs fun y₀ y_perp ↦
      ((hg₁_cd.comp (contDiff_id.prodMk contDiff_const)).differentiable (by simp) y₀).hasDerivAt
  have hψ_supp : ∀ y₀, ψ y₀ ≠ 0 → |τ| + δ ≤ y₀ := by
    intro y₀ hne
    by_contra hlt
    have h0 : ∀ y_perp, g (y₀, y_perp) = 0 := fun y_perp ↦ by
      by_contra hne'; exact hlt (hg_wedge (y₀, y_perp) hne')
    exact hne (by simp [ψ, h0])
  have hslice_eq (k₀ : ℝ) :
      sliceSpatialFT h τ (R ((MassShell.split n).symm (k₀, k_perp))) =
        ∫ y₀ : ℝ, Complex.exp (-Complex.I * (k₀ : ℂ) * (y₀ : ℂ)) * ψ y₀ := by
    unfold sliceSpatialFT
    rw [← hR_mp.integral_comp' (fun y : EuclideanSpace ℝ (Fin (n + 1)) ↦
      Complex.exp (-Complex.I * (inner ℝ y (R ((MassShell.split n).symm (k₀, k_perp))) : ℂ)) *
        (h (τ, y) : ℂ))]
    simp_rw [hR_coe]
    rw [← hsplit.integral_comp' (fun y : EuclideanSpace ℝ (Fin (n + 1)) ↦
      Complex.exp (-Complex.I * (inner ℝ (R y) (R ((MassShell.split n).symm (k₀, k_perp))) : ℂ)) *
        (h (τ, R y) : ℂ))]
    have hinner_split (q : ℝ × EuclideanSpace ℝ (Fin n)) :
        inner ℝ (R ((MassShell.split n).symm q)) (R ((MassShell.split n).symm (k₀, k_perp))) =
          q.1 * k₀ + inner ℝ q.2 k_perp := by
      rw [R.inner_map_map]
      have hiso : (MassShell.split n).symm = fun p : ℝ × EuclideanSpace ℝ (Fin n) ↦
          (MassShell.splitIsometry n).symm (WithLp.toLp 2 p) := rfl
      rw [hiso, (MassShell.splitIsometry n).symm.inner_map_map, WithLp.prod_inner_apply]
      simp [real_inner_comm]; ring
    have hintegrand :
        (fun q : ℝ × EuclideanSpace ℝ (Fin n) ↦
          Complex.exp (-Complex.I * (inner ℝ (R ((MassShell.split n).symm q))
            (R ((MassShell.split n).symm (k₀, k_perp))) : ℂ)) * (h (τ, R ((MassShell.split n).symm q)) : ℂ)) =
        fun q ↦ Complex.exp (-Complex.I * (k₀ : ℂ) * (q.1 : ℂ)) *
          (Complex.exp (-Complex.I * (inner ℝ q.2 k_perp : ℂ)) * (g q : ℂ)) := by
      funext q
      rw [hinner_split q, Complex.ofReal_add, Complex.ofReal_mul, ← mul_assoc, ← Complex.exp_add]
      congr 2; ring
    rw [hintegrand]
    have hint_g : Integrable (fun q : ℝ × EuclideanSpace ℝ (Fin n) ↦
        Complex.exp (-Complex.I * (k₀ : ℂ) * (q.1 : ℂ)) *
          (Complex.exp (-Complex.I * (inner ℝ q.2 k_perp : ℂ)) * (g q : ℂ)))
        (volume.prod volume) := by
      have hcont_q : Continuous (fun q : ℝ × EuclideanSpace ℝ (Fin n) ↦
          Complex.exp (-Complex.I * (k₀ : ℂ) * (q.1 : ℂ)) *
            (Complex.exp (-Complex.I * (inner ℝ q.2 k_perp : ℂ)) * (g q : ℂ))) :=
        (Complex.continuous_exp.comp (continuous_const.mul
          (Complex.continuous_ofReal.comp continuous_fst))).mul
          ((Complex.continuous_exp.comp (continuous_const.mul
            (Complex.continuous_ofReal.comp (continuous_snd.inner continuous_const)))).mul
            (Complex.continuous_ofReal.comp hg_cd.continuous))
      have hcs_q : HasCompactSupport (fun q : ℝ × EuclideanSpace ℝ (Fin n) ↦
          Complex.exp (-Complex.I * (k₀ : ℂ) * (q.1 : ℂ)) *
            (Complex.exp (-Complex.I * (inner ℝ q.2 k_perp : ℂ)) * (g q : ℂ))) :=
        ((hg_cs.comp_left Complex.ofReal_zero).mul_left).mul_left
      change Integrable _ (volume : Measure (ℝ × EuclideanSpace ℝ (Fin n)))
      exact hcont_q.integrable_of_hasCompactSupport hcs_q
    rw [show (volume : Measure (ℝ × EuclideanSpace ℝ (Fin n))) = volume.prod volume from rfl,
      integral_prod _ hint_g]
    refine integral_congr_ae (ae_of_all _ fun y₀ ↦ ?_)
    dsimp only
    rw [integral_const_mul]
  have hpt_k0 (k₀ : ℝ) :
      ((Real.sin (τ * modeDispersion m (R ((MassShell.split n).symm (k₀, k_perp)))) /
          modeDispersion m (R ((MassShell.split n).symm (k₀, k_perp))) : ℝ) : ℂ) *
        sliceSpatialFT h τ (R ((MassShell.split n).symm (k₀, k_perp))) =
      ((Real.sin (τ * Real.sqrt (k₀ ^ 2 + (modeDispersion m k_perp) ^ 2)) /
          Real.sqrt (k₀ ^ 2 + (modeDispersion m k_perp) ^ 2) : ℝ) : ℂ) *
        ∫ y₀ : ℝ, Complex.exp (-Complex.I * (k₀ : ℂ) * (y₀ : ℂ)) * ψ y₀ := by
    rw [modeDispersion_isometry m R, hslice_eq k₀]
    have hdisp : modeDispersion m ((MassShell.split n).symm (k₀, k_perp)) =
        Real.sqrt (k₀ ^ 2 + (modeDispersion m k_perp) ^ 2) := by
      have h' := MassShell.split_energy m ((MassShell.split n).symm (k₀, k_perp))
      rw [(MassShell.split n).apply_symm_apply] at h'
      exact h'.symm
    rw [hdisp]
  refine (integral_congr_ae (ae_of_all _ hpt_k0)).trans ?_
  exact pj_1d_eq_zero_of_compactSupport_ge (modeDispersion_pos hm k_perp) (by linarith)
    hψ_cs hψ₁_pair.1 hψ₂_pair.1 hψ₁_pair.2 hψ₂_pair.2 hd1 hd2 hψ_supp

/-- Wedge vanishing: if `h ∈ C_c^∞(ℝ × Space (n + 1))` is supported in the spacelike half-space
`{ (τ, y) | |τ| + δ ≤ ⟨u, y⟩ }` (`‖u‖ = 1`, `δ > 0`), then `pjFunctional m h = 0`. -/
theorem pjFunctional_wedge_zero {n : ℕ} {m δ : ℝ} (hm : 0 < m) (hδ : 0 < δ)
    (u : EuclideanSpace ℝ (Fin (n + 1))) (hu : ‖u‖ = 1)
    {h : ℝ × EuclideanSpace ℝ (Fin (n + 1)) → ℝ}
    (hh_cd : ContDiff ℝ (⊤ : ℕ∞) h) (hh_cs : HasCompactSupport h)
    (hwedge : ∀ p : ℝ × EuclideanSpace ℝ (Fin (n + 1)), h p ≠ 0 → |p.1| + δ ≤ inner ℝ u p.2) :
    pjFunctional m h = 0 := by
  have hint_all := pj_slice_integrable hm hh_cd hh_cs
  unfold pjFunctional
  rw [← integral_prod_symm _ hint_all, integral_prod _ hint_all]
  refine integral_eq_zero_of_ae (ae_of_all _ fun τ ↦ ?_)
  dsimp only [Pi.zero_apply]
  let R := MassShell.align u
  have hR_mp : MeasurePreserving R.toMeasurableEquiv volume volume := R.measurePreserving
  rw [← hR_mp.integral_comp' (fun k : EuclideanSpace ℝ (Fin (n + 1)) ↦
    ((Real.sin (τ * modeDispersion m k) / modeDispersion m k : ℝ) : ℂ) * sliceSpatialFT h τ k)]
  have hR_coe : ⇑R.toMeasurableEquiv = ⇑R := rfl
  simp_rw [hR_coe]
  have hsplit := (MassShell.split_volume n).symm
  rw [← hsplit.integral_comp' (fun k : EuclideanSpace ℝ (Fin (n + 1)) ↦
    ((Real.sin (τ * modeDispersion m (R k)) / modeDispersion m (R k) : ℝ) : ℂ) *
      sliceSpatialFT h τ (R k))]
  obtain ⟨_, C, _, hC_nn, _, hdecay⟩ := sliceSpatialFT_uniform_decay hh_cd hh_cs
  have hcont_k : Continuous (fun p : ℝ × EuclideanSpace ℝ (Fin n) ↦
      ((Real.sin (τ * modeDispersion m (R ((MassShell.split n).symm p))) /
          modeDispersion m (R ((MassShell.split n).symm p)) : ℝ) : ℂ) *
        sliceSpatialFT h τ (R ((MassShell.split n).symm p))) := by
    have hsplit_cont : Continuous (MassShell.split n).symm :=
      (MassShell.splitIsometry n).symm.continuous.comp
        (WithLp.prodContinuousLinearEquiv 2 ℝ ℝ (EuclideanSpace ℝ (Fin n))).symm.continuous
    have hRsplit_cont : Continuous (fun p : ℝ × EuclideanSpace ℝ (Fin n) ↦
        R ((MassShell.split n).symm p)) := R.continuous.comp hsplit_cont
    have hdisp_cont : Continuous (fun p : ℝ × EuclideanSpace ℝ (Fin n) ↦
        modeDispersion m (R ((MassShell.split n).symm p))) := by
      change Continuous (fun p : ℝ × EuclideanSpace ℝ (Fin n) ↦
        Real.sqrt (‖R ((MassShell.split n).symm p)‖ ^ 2 + m ^ 2))
      exact Real.continuous_sqrt.comp ((hRsplit_cont.norm.pow 2).add continuous_const)
    refine Continuous.mul
      (Complex.continuous_ofReal.comp
        ((Real.continuous_sin.comp (continuous_const.mul hdisp_cont)).div hdisp_cont fun p ↦
          (modeDispersion_pos hm _).ne'))
      (continuous_uncurry_comp (sliceSpatialFT_continuous hh_cd.continuous hh_cs)
        continuous_const hRsplit_cont)
  have hint_k : Integrable (fun p : ℝ × EuclideanSpace ℝ (Fin n) ↦
      ((Real.sin (τ * modeDispersion m (R ((MassShell.split n).symm p))) /
          modeDispersion m (R ((MassShell.split n).symm p)) : ℝ) : ℂ) *
        sliceSpatialFT h τ (R ((MassShell.split n).symm p))) (volume.prod volume) := by
    have hdom_k : Integrable (fun k : EuclideanSpace ℝ (Fin (n + 1)) ↦
        |τ| * (C * (1 + ‖k‖) ^ (-((n + 2 : ℕ) : ℝ)))) volume := by
      refine ((integrable_one_add_norm ?_).const_mul C).const_mul |τ|
      rw [finrank_euclideanSpace_fin]
      exact_mod_cast Nat.lt_succ_self (n + 1)
    have hdom_p : Integrable (fun p : ℝ × EuclideanSpace ℝ (Fin n) ↦
        |τ| * (C * (1 + ‖R ((MassShell.split n).symm p)‖) ^ (-((n + 2 : ℕ) : ℝ))))
        (volume.prod volume) :=
      ((R.measurePreserving.comp hsplit).integrable_comp_emb
        ((MassShell.split n).symm.trans R.toMeasurableEquiv).measurableEmbedding).mpr hdom_k
    refine hdom_p.mono' hcont_k.aestronglyMeasurable (ae_of_all _ fun p ↦ ?_)
    rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_div,
      abs_of_pos (modeDispersion_pos hm _)]
    have hsin : |Real.sin (τ * modeDispersion m (R ((MassShell.split n).symm p)))| /
        modeDispersion m (R ((MassShell.split n).symm p)) ≤ |τ| := by
      rw [div_le_iff₀ (modeDispersion_pos hm _)]
      calc |Real.sin (τ * modeDispersion m (R ((MassShell.split n).symm p)))|
          ≤ |τ * modeDispersion m (R ((MassShell.split n).symm p))| := Real.abs_sin_le_abs
        _ = |τ| * modeDispersion m (R ((MassShell.split n).symm p)) := by
            rw [abs_mul, abs_of_pos (modeDispersion_pos hm _)]
    exact mul_le_mul hsin (hdecay τ _) (norm_nonneg _) (abs_nonneg τ)
  rw [show (volume : Measure (ℝ × EuclideanSpace ℝ (Fin n))) = volume.prod volume from rfl,
    integral_prod_symm _ hint_k]
  refine integral_eq_zero_of_ae (ae_of_all _ fun k_perp ↦ ?_)
  dsimp only [Pi.zero_apply]
  exact pj_wedge_kperp_zero hm hδ u hu hh_cd hh_cs hwedge k_perp

/-- Telescoping smooth partition-of-unity vanishing: for ANY `h ∈ C_c^∞(ℝ × Space (n + 1))`
whose compact support lies inside the spacelike region `{ (τ, y) | |τ| < ‖y‖ }`,
`pjFunctional m h = 0`. -/
theorem pjFunctional_spacelike_zero {n : ℕ} {m : ℝ} (hm : 0 < m)
    {h : ℝ × EuclideanSpace ℝ (Fin (n + 1)) → ℝ}
    (hh_cd : ContDiff ℝ (⊤ : ℕ∞) h) (hh_cs : HasCompactSupport h)
    (hsep : ∀ p ∈ tsupport h, |p.1| < ‖p.2‖) :
    pjFunctional m h = 0 := by
  have hcover : ∀ p ∈ tsupport h,
      ∃ (b : ContDiffBump p) (u : EuclideanSpace ℝ (Fin (n + 1))) (δ : ℝ),
        ‖u‖ = 1 ∧ 0 < δ ∧
        ∀ q ∈ Metric.closedBall p b.rOut, |q.1| + δ ≤ inner ℝ u q.2 := by
    intro p hp
    have hlt : |p.1| < ‖p.2‖ := hsep p hp
    have hp2_pos : 0 < ‖p.2‖ := lt_of_le_of_lt (abs_nonneg p.1) hlt
    let u : EuclideanSpace ℝ (Fin (n + 1)) := ‖p.2‖⁻¹ • p.2
    have hu : ‖u‖ = 1 := by
      simp [u, norm_smul, Real.norm_of_nonneg (inv_nonneg.mpr hp2_pos.le), inv_mul_cancel₀ hp2_pos.ne']
    have hup : inner ℝ u p.2 = ‖p.2‖ := by
      rw [real_inner_smul_left, real_inner_self_eq_norm_sq, sq, ← mul_assoc,
        inv_mul_cancel₀ hp2_pos.ne', one_mul]
    let δ : ℝ := (‖p.2‖ - |p.1|) / 2
    have hδ : 0 < δ := by dsimp [δ]; linarith
    have hopen : IsOpen {q : ℝ × EuclideanSpace ℝ (Fin (n + 1)) | |q.1| + δ < inner ℝ u q.2} :=
      isOpen_lt ((continuous_abs.comp continuous_fst).add continuous_const)
        (continuous_const.inner continuous_snd)
    have hp_mem : p ∈ {q : ℝ × EuclideanSpace ℝ (Fin (n + 1)) | |q.1| + δ < inner ℝ u q.2} := by
      change |p.1| + δ < inner ℝ u p.2
      rw [hup]; dsimp [δ]; linarith
    obtain ⟨ε, hε_pos, hball⟩ := Metric.isOpen_iff.mp hopen p hp_mem
    let b : ContDiffBump p :=
      { rIn := ε / 4
        rOut := ε / 2
        rIn_pos := by positivity
        rIn_lt_rOut := by linarith }
    refine ⟨b, u, δ, hu, hδ, fun q hq ↦ ?_⟩
    have hq_ball : q ∈ Metric.ball p ε := by
      rw [Metric.mem_ball]
      rw [Metric.mem_closedBall] at hq
      change dist q p ≤ ε / 2 at hq
      linarith
    exact (hball hq_ball).le
  choose b u δ hu hδ hclosed using hcover
  have hcomp : IsCompact (tsupport h) := hh_cs
  have hsub : tsupport h ⊆ ⋃ p : {p // p ∈ tsupport h}, Metric.ball p.1 (b p.1 p.2).rIn := by
    intro p hp
    exact Set.mem_iUnion.mpr ⟨⟨p, hp⟩, Metric.mem_ball_self (b p hp).rIn_pos⟩
  obtain ⟨S, hS⟩ := hcomp.elim_finite_subcover
    (fun p : {p // p ∈ tsupport h} ↦ Metric.ball p.1 (b p.1 p.2).rIn)
    (fun _ ↦ Metric.isOpen_ball) hsub
  -- Telescoping induction on the finite list `L = S.toList`
  suffices ∀ (L : List {p // p ∈ tsupport h}) (φ : ℝ × EuclideanSpace ℝ (Fin (n + 1)) → ℝ),
      ContDiff ℝ (⊤ : ℕ∞) φ → HasCompactSupport φ →
      (tsupport φ ⊆ ⋃ p ∈ L, Metric.ball p.1 (b p.1 p.2).rIn) →
      pjFunctional m φ = 0 by
    refine this S.toList h hh_cd hh_cs (fun x hx ↦ ?_)
    have hx' := hS hx
    simp only [Set.mem_iUnion] at hx' ⊢
    obtain ⟨p, hpS, hpx⟩ := hx'
    exact ⟨p, Finset.mem_toList.mpr hpS, hpx⟩
  intro L
  induction L with
  | nil =>
    intro φ _ _ hsub
    have hφ0 : φ = 0 := by
      funext x
      by_contra hne
      have hx := hsub (subset_tsupport φ hne)
      simp at hx
    rw [hφ0]
    unfold pjFunctional sliceSpatialFT
    simp
  | cons p rest ih =>
    intro φ hφ_cd hφ_cs hsub
    let bp : ContDiffBump p.1 := b p.1 p.2
    let φ₁ : ℝ × EuclideanSpace ℝ (Fin (n + 1)) → ℝ := fun x ↦ bp x * φ x
    let φ₂ : ℝ × EuclideanSpace ℝ (Fin (n + 1)) → ℝ := fun x ↦ (1 - bp x) * φ x
    have hφ_eq : φ = φ₁ + φ₂ := by
      funext x; simp only [Pi.add_apply, φ₁, φ₂]; ring
    have hφ₁_cd : ContDiff ℝ (⊤ : ℕ∞) φ₁ := bp.contDiff.mul hφ_cd
    have hφ₂_cd : ContDiff ℝ (⊤ : ℕ∞) φ₂ := (contDiff_const.sub bp.contDiff).mul hφ_cd
    have hφ₁_cs : HasCompactSupport φ₁ := hφ_cs.mul_left
    have hφ₂_cs : HasCompactSupport φ₂ := hφ_cs.mul_left
    have h1 : pjFunctional m φ₁ = 0 := by
      refine pjFunctional_wedge_zero hm (hδ p.1 p.2) (u p.1 p.2) (hu p.1 p.2) hφ₁_cd hφ₁_cs
        fun q hq ↦ ?_
      have hbp_ne : bp q ≠ 0 := left_ne_zero_of_mul hq
      have hq_mem : q ∈ Metric.ball p.1 bp.rOut := by
        rw [← bp.support_eq]; exact hbp_ne
      exact hclosed p.1 p.2 q (Metric.ball_subset_closedBall hq_mem)
    have h2 : pjFunctional m φ₂ = 0 := by
      refine ih φ₂ hφ₂_cd hφ₂_cs fun x hx ↦ ?_
      have hx_φ : x ∈ tsupport φ := tsupport_mul_subset_right (f := fun z ↦ 1 - bp z) (g := φ) hx
      have hx_not : x ∉ Metric.ball p.1 bp.rIn := by
        intro hball
        have hzero_on : ∀ z ∈ Metric.ball p.1 bp.rIn, φ₂ z = 0 := fun z hz ↦ by
          dsimp [φ₂]
          rw [bp.one_of_mem_closedBall (Metric.ball_subset_closedBall hz), sub_self, zero_mul]
        have hsub_compl : Function.support φ₂ ⊆ (Metric.ball p.1 bp.rIn)ᶜ := fun z hz hzb ↦
          hz (hzero_on z hzb)
        have htsub : tsupport φ₂ ⊆ (Metric.ball p.1 bp.rIn)ᶜ :=
          closure_minimal hsub_compl Metric.isOpen_ball.isClosed_compl
        exact htsub hx hball
      have hx_u := hsub hx_φ
      simp only [List.mem_cons, Set.mem_iUnion] at hx_u ⊢
      obtain ⟨q, hq | hq, hxq⟩ := hx_u
      · subst hq; exact absurd hxq hx_not
      · exact ⟨q, hq, hxq⟩
    rw [hφ_eq, pjFunctional_add hm hφ₁_cd hφ₁_cs hφ₂_cd hφ₂_cs, h1, h2, add_zero]

/-- Smooth compactly supported spacetime cross-correlation `h(r) = ∫ p, f(p) * f'(p + r)`. -/
noncomputable def crossCorr {d : ℕ}
    (f f' : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℝ)
    (r : ℝ × EuclideanSpace ℝ (Fin d)) : ℝ :=
  ∫ p : ℝ × EuclideanSpace ℝ (Fin d), f p * f' (p + r)

theorem crossCorr_eq_convolution {d : ℕ}
    (f f' : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℝ) :
    crossCorr f f' =
      convolution (fun p ↦ f (-p)) (f' : ℝ × EuclideanSpace ℝ (Fin d) → ℝ)
        (ContinuousLinearMap.mul ℝ ℝ) volume := by
  funext r
  unfold crossCorr
  have hneg : (∫ p : ℝ × EuclideanSpace ℝ (Fin d), f (-p) * f' (-p + r)) =
      ∫ p : ℝ × EuclideanSpace ℝ (Fin d), f p * f' (p + r) :=
    @integral_neg_eq_self (ℝ × EuclideanSpace ℝ (Fin d)) ℝ _ _ _ _ _
      (fun p ↦ f p * f' (p + r)) (volume : Measure (ℝ × EuclideanSpace ℝ (Fin d)))
      (prod_volume_isNegInvariant d)
  rw [convolution_def, ← hneg]
  refine integral_congr_ae (ae_of_all _ fun p ↦ ?_)
  simp only [ContinuousLinearMap.mul_apply', sub_eq_add_neg, add_comm r (-p)]

theorem crossCorr_contDiff_and_cs {d : ℕ}
    {f f' : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℝ}
    (hf_cs : HasCompactSupport f) (hf'_cs : HasCompactSupport f') :
    ContDiff ℝ (⊤ : ℕ∞) (crossCorr f f') ∧ HasCompactSupport (crossCorr f f') := by
  have _ := prod_volume_isAddLeftInvariant d
  have _ := prod_volume_isNegInvariant d
  rw [crossCorr_eq_convolution]
  have hneg_cs : HasCompactSupport (fun p : ℝ × EuclideanSpace ℝ (Fin d) ↦ f (-p)) :=
    hf_cs.comp_homeomorph (Homeomorph.neg _)
  have hneg_cd : ContDiff ℝ (⊤ : ℕ∞) (fun p : ℝ × EuclideanSpace ℝ (Fin d) ↦ f (-p)) :=
    (f.smooth ⊤).comp contDiff_neg
  exact ⟨hneg_cs.contDiff_convolution_left (ContinuousLinearMap.mul ℝ ℝ) hneg_cd
      f'.continuous.locallyIntegrable,
    hneg_cs.convolution (ContinuousLinearMap.mul ℝ ℝ) hf'_cs⟩

theorem crossCorr_tsupport_subset {d : ℕ}
    {f f' : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℝ}
    (hf_cs : HasCompactSupport f) (hf'_cs : HasCompactSupport f') :
    tsupport (crossCorr f f') ⊆
      (fun pq : (ℝ × EuclideanSpace ℝ (Fin d)) × (ℝ × EuclideanSpace ℝ (Fin d)) ↦ pq.2 - pq.1) ''
        (tsupport f ×ˢ tsupport f') := by
  have hcomp : IsCompact
      ((fun pq : (ℝ × EuclideanSpace ℝ (Fin d)) × (ℝ × EuclideanSpace ℝ (Fin d)) ↦ pq.2 - pq.1) ''
        (tsupport f ×ˢ tsupport f')) :=
    (hf_cs.prod hf'_cs).image (continuous_snd.sub continuous_fst)
  refine closure_minimal (fun r hr ↦ ?_) hcomp.isClosed
  by_contra hnot
  have h0 : ∀ p, f p * f' (p + r) = 0 := fun p ↦ by
    by_contra hne
    have hp : p ∈ tsupport f := subset_tsupport f (left_ne_zero_of_mul hne)
    have hpr : p + r ∈ tsupport f' := subset_tsupport f' (right_ne_zero_of_mul hne)
    exact hnot ⟨(p, p + r), ⟨hp, hpr⟩, by simp⟩
  exact hr (by unfold crossCorr; simp [h0])

private theorem hasCompactSupport_prod_mul {α β : Type*} [TopologicalSpace α] [TopologicalSpace β]
    [T2Space α] [T2Space β]
    {f : α → ℝ} {g : β → ℝ} (hf : HasCompactSupport f) (hg : HasCompactSupport g) :
    HasCompactSupport (fun p : α × β ↦ f p.1 * g p.2) :=
  HasCompactSupport.of_support_subset_isCompact (hf.prod hg) fun _ hp ↦
    ⟨subset_tsupport f (left_ne_zero_of_mul hp), subset_tsupport g (right_ne_zero_of_mul hp)⟩

private theorem crossCorr_ft_eq {d : ℕ} {m : ℝ}
    {f f' : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℝ}
    (hf_cs : HasCompactSupport f) (hf'_cs : HasCompactSupport f')
    (k : EuclideanSpace ℝ (Fin d)) :
    star (∫ p : ℝ × EuclideanSpace ℝ (Fin d),
        Complex.exp (Complex.I * ((p.1 * modeDispersion m k - inner ℝ p.2 k : ℝ) : ℂ)) *
          (f p : ℂ)) *
      (∫ q : ℝ × EuclideanSpace ℝ (Fin d),
        Complex.exp (Complex.I * ((q.1 * modeDispersion m k - inner ℝ q.2 k : ℝ) : ℂ)) *
          (f' q : ℂ)) =
    ∫ τ : ℝ, Complex.exp (Complex.I * ((τ * modeDispersion m k : ℝ) : ℂ)) *
      sliceSpatialFT (crossCorr f f') τ k := by
  have _ := prod_volume_isAddLeftInvariant d
  have hcc := crossCorr_contDiff_and_cs hf_cs hf'_cs
  have hstar_f :
      star (∫ p : ℝ × EuclideanSpace ℝ (Fin d),
          Complex.exp (Complex.I * ((p.1 * modeDispersion m k - inner ℝ p.2 k : ℝ) : ℂ)) *
            (f p : ℂ)) =
        ∫ p : ℝ × EuclideanSpace ℝ (Fin d),
          Complex.exp (-Complex.I * ((p.1 * modeDispersion m k - inner ℝ p.2 k : ℝ) : ℂ)) *
            (f p : ℂ) := by
    rw [RCLike.star_def, ← integral_conj]
    refine integral_congr_ae (ae_of_all _ fun p ↦ ?_)
    dsimp only
    rw [map_mul, Complex.conj_ofReal, ← Complex.exp_conj, map_mul, Complex.conj_I,
      Complex.conj_ofReal]
  rw [hstar_f]
  have hfi : Integrable (fun p : ℝ × EuclideanSpace ℝ (Fin d) ↦
      Complex.exp (-Complex.I * ((p.1 * modeDispersion m k - inner ℝ p.2 k : ℝ) : ℂ)) *
        (f p : ℂ)) volume := by
    have hcont : Continuous (fun p : ℝ × EuclideanSpace ℝ (Fin d) ↦
        Complex.exp (-Complex.I * ((p.1 * modeDispersion m k - inner ℝ p.2 k : ℝ) : ℂ)) *
          (f p : ℂ)) :=
      (Complex.continuous_exp.comp (continuous_const.mul (Complex.continuous_ofReal.comp
        ((continuous_fst.mul continuous_const).sub (continuous_snd.inner continuous_const))))).mul
        (Complex.continuous_ofReal.comp f.continuous)
    exact hcont.integrable_of_hasCompactSupport (hf_cs.comp_left Complex.ofReal_zero).mul_left
  have hf'i : Integrable (fun q : ℝ × EuclideanSpace ℝ (Fin d) ↦
      Complex.exp (Complex.I * ((q.1 * modeDispersion m k - inner ℝ q.2 k : ℝ) : ℂ)) *
        (f' q : ℂ)) volume := by
    have hcont : Continuous (fun q : ℝ × EuclideanSpace ℝ (Fin d) ↦
        Complex.exp (Complex.I * ((q.1 * modeDispersion m k - inner ℝ q.2 k : ℝ) : ℂ)) *
          (f' q : ℂ)) :=
      (Complex.continuous_exp.comp (continuous_const.mul (Complex.continuous_ofReal.comp
        ((continuous_fst.mul continuous_const).sub (continuous_snd.inner continuous_const))))).mul
        (Complex.continuous_ofReal.comp f'.continuous)
    exact hcont.integrable_of_hasCompactSupport (hf'_cs.comp_left Complex.ofReal_zero).mul_left
  rw [← integral_prod_mul, integral_prod _ (hfi.mul_prod hf'i)]
  have hshift :
      (∫ p : ℝ × EuclideanSpace ℝ (Fin d), ∫ q : ℝ × EuclideanSpace ℝ (Fin d),
        (Complex.exp (-Complex.I * ((p.1 * modeDispersion m k - inner ℝ p.2 k : ℝ) : ℂ)) *
          (f p : ℂ)) *
        (Complex.exp (Complex.I * ((q.1 * modeDispersion m k - inner ℝ q.2 k : ℝ) : ℂ)) *
          (f' q : ℂ))) =
      ∫ p : ℝ × EuclideanSpace ℝ (Fin d), ∫ r : ℝ × EuclideanSpace ℝ (Fin d),
        Complex.exp (Complex.I * ((r.1 * modeDispersion m k - inner ℝ r.2 k : ℝ) : ℂ)) *
          ((f p * f' (p + r) : ℝ) : ℂ) := by
    refine integral_congr_ae (ae_of_all _ fun p ↦ ?_)
    dsimp only
    rw [← integral_add_left_eq_self (μ := (volume : Measure (ℝ × EuclideanSpace ℝ (Fin d)))) _ p]
    refine integral_congr_ae (ae_of_all _ fun r ↦ ?_)
    dsimp only
    rw [Complex.ofReal_mul]
    have hexp :
        Complex.exp (-Complex.I * ((p.1 * modeDispersion m k - inner ℝ p.2 k : ℝ) : ℂ)) *
          Complex.exp (Complex.I * (((p + r).1 * modeDispersion m k - inner ℝ (p + r).2 k : ℝ) : ℂ)) =
        Complex.exp (Complex.I * ((r.1 * modeDispersion m k - inner ℝ r.2 k : ℝ) : ℂ)) := by
      rw [← Complex.exp_add]
      congr 1
      simp only [Prod.fst_add, Prod.snd_add, inner_add_left]
      push_cast; ring
    calc _ = (Complex.exp (-Complex.I * ((p.1 * modeDispersion m k - inner ℝ p.2 k : ℝ) : ℂ)) *
          Complex.exp (Complex.I * (((p + r).1 * modeDispersion m k - inner ℝ (p + r).2 k : ℝ) : ℂ))) *
          ((f p : ℂ) * (f' (p + r) : ℂ)) := by ring
      _ = _ := by rw [hexp]
  rw [hshift]
  have hjoint_int : Integrable (fun pr : (ℝ × EuclideanSpace ℝ (Fin d)) × (ℝ × EuclideanSpace ℝ (Fin d)) ↦
      Complex.exp (Complex.I * ((pr.2.1 * modeDispersion m k - inner ℝ pr.2.2 k : ℝ) : ℂ)) *
        ((f pr.1 * f' (pr.1 + pr.2) : ℝ) : ℂ)) (volume.prod volume) := by
    have hcont : Continuous (fun pr : (ℝ × EuclideanSpace ℝ (Fin d)) × (ℝ × EuclideanSpace ℝ (Fin d)) ↦
        Complex.exp (Complex.I * ((pr.2.1 * modeDispersion m k - inner ℝ pr.2.2 k : ℝ) : ℂ)) *
          ((f pr.1 * f' (pr.1 + pr.2) : ℝ) : ℂ)) :=
      (Complex.continuous_exp.comp (continuous_const.mul (Complex.continuous_ofReal.comp
        (((continuous_fst.comp continuous_snd).mul continuous_const).sub
          ((continuous_snd.comp continuous_snd).inner continuous_const))))).mul
        (Complex.continuous_ofReal.comp ((f.continuous.comp continuous_fst).mul
          (f'.continuous.comp (continuous_fst.add continuous_snd))))
    obtain ⟨R₁, hR₁⟩ := hf_cs.isBounded.subset_closedBall (0 : ℝ × EuclideanSpace ℝ (Fin d))
    obtain ⟨R₂, hR₂⟩ := hf'_cs.isBounded.subset_closedBall (0 : ℝ × EuclideanSpace ℝ (Fin d))
    obtain ⟨M₁, hM₁⟩ := hf_cs.exists_bound_of_continuousOn f.continuous.continuousOn
    obtain ⟨M₂, hM₂⟩ := hf'_cs.exists_bound_of_continuousOn f'.continuous.continuousOn
    let B₁ : ℝ × EuclideanSpace ℝ (Fin d) → ℝ :=
      (Metric.closedBall 0 (max R₁ 0)).indicator (fun _ ↦ max M₁ 0)
    let B₂ : ℝ × EuclideanSpace ℝ (Fin d) → ℝ :=
      (Metric.closedBall 0 (max R₁ 0 + max R₂ 0)).indicator (fun _ ↦ max M₂ 0)
    have hB₁ : Integrable B₁ (volume : Measure (ℝ × EuclideanSpace ℝ (Fin d))) :=
      (integrableOn_const (hs := measure_closedBall_lt_top.ne)).integrable_indicator
        measurableSet_closedBall
    have hB₂ : Integrable B₂ (volume : Measure (ℝ × EuclideanSpace ℝ (Fin d))) :=
      (integrableOn_const (hs := measure_closedBall_lt_top.ne)).integrable_indicator
        measurableSet_closedBall
    refine (hB₁.mul_prod hB₂).mono' hcont.aestronglyMeasurable (ae_of_all _ fun ⟨p, r⟩ ↦ ?_)
    have hexp1 : ‖Complex.exp (Complex.I * ((r.1 * modeDispersion m k - inner ℝ r.2 k : ℝ) : ℂ))‖ = 1 := by
      rw [show Complex.I * ((r.1 * modeDispersion m k - inner ℝ r.2 k : ℝ) : ℂ) =
        ((r.1 * modeDispersion m k - inner ℝ r.2 k : ℝ) : ℂ) * Complex.I by ring]
      exact Complex.norm_exp_ofReal_mul_I _
    rw [norm_mul, hexp1, one_mul, Complex.norm_real, norm_mul]
    by_cases h0 : f p = 0 ∨ f' (p + r) = 0
    · rcases h0 with h0 | h0
      · simp only [h0, norm_zero, zero_mul]
        exact mul_nonneg (Set.indicator_nonneg (fun _ _ ↦ le_max_right _ _) _)
          (Set.indicator_nonneg (fun _ _ ↦ le_max_right _ _) _)
      · simp only [h0, norm_zero, mul_zero]
        exact mul_nonneg (Set.indicator_nonneg (fun _ _ ↦ le_max_right _ _) _)
          (Set.indicator_nonneg (fun _ _ ↦ le_max_right _ _) _)
    · push Not at h0
      have hp_mem : p ∈ Metric.closedBall (0 : ℝ × EuclideanSpace ℝ (Fin d)) (max R₁ 0) := by
        have hm := hR₁ (subset_tsupport f h0.1)
        rw [Metric.mem_closedBall, dist_zero_right] at hm ⊢
        exact hm.trans (le_max_left _ _)
      have hr_mem : r ∈ Metric.closedBall (0 : ℝ × EuclideanSpace ℝ (Fin d)) (max R₁ 0 + max R₂ 0) := by
        have hm1 := hR₁ (subset_tsupport f h0.1)
        have hm2 := hR₂ (subset_tsupport f' h0.2)
        rw [Metric.mem_closedBall, dist_zero_right] at hm1 hm2 ⊢
        have htri : ‖r‖ ≤ ‖p + r‖ + ‖p‖ := by
          simpa only [add_sub_cancel_left] using norm_sub_le (p + r) p
        linarith [le_max_left R₁ 0, le_max_left R₂ 0]
      dsimp only [B₁, B₂]
      rw [Set.indicator_of_mem hp_mem, Set.indicator_of_mem hr_mem]
      exact mul_le_mul ((hM₁ p (subset_tsupport f h0.1)).trans (le_max_left _ _))
        ((hM₂ (p + r) (subset_tsupport f' h0.2)).trans (le_max_left _ _))
        (norm_nonneg _) (le_max_right _ _)
  rw [← integral_prod _ hjoint_int, integral_prod_symm _ hjoint_int]
  have hinner_r (r : ℝ × EuclideanSpace ℝ (Fin d)) :
      (∫ p : ℝ × EuclideanSpace ℝ (Fin d),
        Complex.exp (Complex.I * ((r.1 * modeDispersion m k - inner ℝ r.2 k : ℝ) : ℂ)) *
          ((f p * f' (p + r) : ℝ) : ℂ)) =
      Complex.exp (Complex.I * ((r.1 * modeDispersion m k : ℝ) : ℂ)) *
        (Complex.exp (-Complex.I * (inner ℝ r.2 k : ℂ)) * (crossCorr f f' r : ℂ)) := by
    have hreal_int : Integrable (fun p : ℝ × EuclideanSpace ℝ (Fin d) ↦ f p * f' (p + r)) volume :=
      (f.continuous.mul (f'.continuous.comp (continuous_id.add continuous_const))).integrable_of_hasCompactSupport
        hf_cs.mul_right
    have hcoe : (∫ p : ℝ × EuclideanSpace ℝ (Fin d), ((f p * f' (p + r) : ℝ) : ℂ)) =
        (crossCorr f f' r : ℂ) :=
      Complex.ofRealCLM.integral_comp_comm hreal_int
    rw [integral_const_mul, hcoe, ← mul_assoc, ← Complex.exp_add]
    congr 2; push_cast; ring
  simp_rw [hinner_r]
  have hcc_int : Integrable (fun r : ℝ × EuclideanSpace ℝ (Fin d) ↦
      Complex.exp (Complex.I * ((r.1 * modeDispersion m k : ℝ) : ℂ)) *
        (Complex.exp (-Complex.I * (inner ℝ r.2 k : ℂ)) * (crossCorr f f' r : ℂ)))
      (volume.prod volume) := by
    have hcont : Continuous (fun r : ℝ × EuclideanSpace ℝ (Fin d) ↦
        Complex.exp (Complex.I * ((r.1 * modeDispersion m k : ℝ) : ℂ)) *
          (Complex.exp (-Complex.I * (inner ℝ r.2 k : ℂ)) * (crossCorr f f' r : ℂ))) :=
      (Complex.continuous_exp.comp (continuous_const.mul (Complex.continuous_ofReal.comp
        (continuous_fst.mul continuous_const)))).mul
        ((Complex.continuous_exp.comp (continuous_const.mul (Complex.continuous_ofReal.comp
          (continuous_snd.inner continuous_const)))).mul
          (Complex.continuous_ofReal.comp hcc.1.continuous))
    change Integrable _ (volume : Measure (ℝ × EuclideanSpace ℝ (Fin d)))
    exact hcont.integrable_of_hasCompactSupport
      ((hcc.2.comp_left Complex.ofReal_zero).mul_left).mul_left
  rw [show (volume : Measure (ℝ × EuclideanSpace ℝ (Fin d))) = volume.prod volume from rfl,
    integral_prod _ hcc_int]
  refine integral_congr_ae (ae_of_all _ fun τ ↦ ?_)
  dsimp only
  rw [integral_const_mul]; rfl

private theorem crossCorr_conj_neg {d : ℕ} (ħ m : ℝ)
    (h : ℝ × EuclideanSpace ℝ (Fin d) → ℝ) (k : EuclideanSpace ℝ (Fin d)) :
    (starRingEnd ℂ) (((ħ / (2 * modeDispersion m (-k)) : ℝ) : ℂ) *
      ∫ τ : ℝ, Complex.exp (Complex.I * ((τ * modeDispersion m (-k) : ℝ) : ℂ)) *
        sliceSpatialFT h τ (-k)) =
    ((ħ / (2 * modeDispersion m k) : ℝ) : ℂ) *
      ∫ τ : ℝ, Complex.exp (-Complex.I * ((τ * modeDispersion m k : ℝ) : ℂ)) *
        sliceSpatialFT h τ k := by
  have hωneg : modeDispersion m (-k) = modeDispersion m k := by simp [modeDispersion]
  rw [hωneg, map_mul, Complex.conj_ofReal, ← integral_conj]
  congr 1
  refine integral_congr_ae (ae_of_all _ fun τ ↦ ?_)
  dsimp only
  rw [map_mul, ← Complex.exp_conj, map_mul, Complex.conj_I, Complex.conj_ofReal]
  congr 1
  unfold sliceSpatialFT
  rw [← integral_conj]
  refine integral_congr_ae (ae_of_all _ fun y ↦ ?_)
  dsimp only
  rw [map_mul, Complex.conj_ofReal, ← Complex.exp_conj, map_mul, map_neg, Complex.conj_I,
    Complex.conj_ofReal, inner_neg_right, Complex.ofReal_neg]
  congr 2; ring

private theorem pj_kernel_factor (ħ τ ω : ℝ) (hω : 0 < ω) (S : ℂ) :
    ((ħ / (2 * ω) : ℝ) : ℂ) *
        (Complex.exp (Complex.I * ((τ * ω : ℝ) : ℂ)) * S -
          Complex.exp (-Complex.I * ((τ * ω : ℝ) : ℂ)) * S) =
      (Complex.I * (ħ : ℂ)) * (((Real.sin (τ * ω) / ω : ℝ) : ℂ) * S) := by
  have hker := lorentzian_pauliJordan_kernel ħ τ ω hω
  have h1 : Complex.exp (Complex.I * ((τ * ω : ℝ) : ℂ)) -
      Complex.exp (-Complex.I * ((τ * ω : ℝ) : ℂ)) =
      -(Complex.exp (-Complex.I * (τ : ℂ) * (ω : ℂ)) -
        Complex.exp (Complex.I * (τ : ℂ) * (ω : ℂ))) := by
    have ha : Complex.I * ((τ * ω : ℝ) : ℂ) = Complex.I * (τ : ℂ) * (ω : ℂ) := by push_cast; ring
    have hb : -Complex.I * ((τ * ω : ℝ) : ℂ) = -Complex.I * (τ : ℂ) * (ω : ℂ) := by push_cast; ring
    rw [ha, hb]; ring
  have hker' : ((ħ / (2 * ω) : ℝ) : ℂ) *
      (Complex.exp (Complex.I * ((τ * ω : ℝ) : ℂ)) -
       Complex.exp (-Complex.I * ((τ * ω : ℝ) : ℂ))) =
      (Complex.I * (ħ : ℂ)) * ((Real.sin (τ * ω) / ω : ℝ) : ℂ) := by
    rw [h1, mul_neg, hker]; ring
  calc ((ħ / (2 * ω) : ℝ) : ℂ) *
        (Complex.exp (Complex.I * ((τ * ω : ℝ) : ℂ)) * S -
          Complex.exp (-Complex.I * ((τ * ω : ℝ) : ℂ)) * S)
      = (((ħ / (2 * ω) : ℝ) : ℂ) *
          (Complex.exp (Complex.I * ((τ * ω : ℝ) : ℂ)) -
           Complex.exp (-Complex.I * ((τ * ω : ℝ) : ℂ)))) * S := by ring
    _ = _ := by rw [hker', mul_assoc]

private theorem crossCorr_tau_diff_eq {d : ℕ} {ħ m : ℝ} (hm : 0 < m)
    {h : ℝ × EuclideanSpace ℝ (Fin d) → ℝ}
    (hh_cd : ContDiff ℝ (⊤ : ℕ∞) h) (hh_cs : HasCompactSupport h)
    {T : ℝ} (hT_zero : ∀ (τ : ℝ) (y : EuclideanSpace ℝ (Fin d)), T < |τ| → h (τ, y) = 0)
    (k : EuclideanSpace ℝ (Fin d)) :
    ((ħ / (2 * modeDispersion m k) : ℝ) : ℂ) *
        (∫ τ : ℝ, Complex.exp (Complex.I * ((τ * modeDispersion m k : ℝ) : ℂ)) * sliceSpatialFT h τ k) -
      ((ħ / (2 * modeDispersion m k) : ℝ) : ℂ) *
        (∫ τ : ℝ, Complex.exp (-Complex.I * ((τ * modeDispersion m k : ℝ) : ℂ)) * sliceSpatialFT h τ k) =
      (Complex.I * (ħ : ℂ)) *
        ∫ τ : ℝ, ((Real.sin (τ * modeDispersion m k) / modeDispersion m k : ℝ) : ℂ) *
          sliceSpatialFT h τ k := by
  have hslice_cs_t : HasCompactSupport (fun τ : ℝ ↦ sliceSpatialFT h τ k) :=
    HasCompactSupport.of_support_subset_isCompact (isCompact_Icc (a := -T) (b := T)) fun τ hτ ↦ by
      by_contra hnot
      have hgt : T < |τ| := not_le.mp (fun hle ↦ hnot (abs_le.mp hle))
      have h0 : sliceSpatialFT h τ k = 0 := by
        unfold sliceSpatialFT
        exact integral_eq_zero_of_ae (ae_of_all _ fun y ↦ by
          dsimp only [Pi.zero_apply]
          rw [hT_zero τ y hgt, Complex.ofReal_zero, mul_zero])
      exact hτ h0
  have hslice_cont_t : Continuous (fun τ : ℝ ↦ sliceSpatialFT h τ k) :=
    continuous_uncurry_comp (sliceSpatialFT_continuous hh_cd.continuous hh_cs)
      continuous_id continuous_const
  have ht1 : Integrable (fun τ : ℝ ↦
      Complex.exp (Complex.I * ((τ * modeDispersion m k : ℝ) : ℂ)) * sliceSpatialFT h τ k) volume :=
    ((Complex.continuous_exp.comp (continuous_const.mul (Complex.continuous_ofReal.comp
      (continuous_id.mul continuous_const)))).mul hslice_cont_t).integrable_of_hasCompactSupport
      hslice_cs_t.mul_left
  have ht2 : Integrable (fun τ : ℝ ↦
      Complex.exp (-Complex.I * ((τ * modeDispersion m k : ℝ) : ℂ)) * sliceSpatialFT h τ k) volume :=
    ((Complex.continuous_exp.comp (continuous_const.mul (Complex.continuous_ofReal.comp
      (continuous_id.mul continuous_const)))).mul hslice_cont_t).integrable_of_hasCompactSupport
      hslice_cs_t.mul_left
  rw [← mul_sub, ← integral_sub ht1 ht2, ← integral_const_mul, ← integral_const_mul]
  exact integral_congr_ae (ae_of_all _ fun τ ↦
    pj_kernel_factor ħ τ (modeDispersion m k) (modeDispersion_pos hm k) (sliceSpatialFT h τ k))

theorem shellFeatureReal_commutator_eq_pjFunctional {d : ℕ} {ħ m : ℝ} (hħ : 0 ≤ ħ) (hm : 0 < m)
    {f f' : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin d)) ℝ}
    (hf_cs : HasCompactSupport f) (hf'_cs : HasCompactSupport f') :
    inner ℂ (shellFeatureReal d ħ m hħ hm f) (shellFeatureReal d ħ m hħ hm f') -
      inner ℂ (shellFeatureReal d ħ m hħ hm f') (shellFeatureReal d ħ m hħ hm f) =
    (Complex.I * (ħ : ℂ)) * pjFunctional m (crossCorr f f') := by
  have hcc := crossCorr_contDiff_and_cs hf_cs hf'_cs
  obtain ⟨T, _, _, _, hT_zero, _⟩ := sliceSpatialFT_uniform_decay hcc.1 hcc.2
  let u_f := shellFeatureReal d ħ m hħ hm f
  let u_f' := shellFeatureReal d ħ m hħ hm f'
  have huf_ae : (u_f : EuclideanSpace ℝ (Fin d) → ℂ) =ᵐ[volume] fun k ↦
      ((Real.sqrt (ħ / (2 * modeDispersion m k)) : ℝ) : ℂ) *
        ∫ p : ℝ × EuclideanSpace ℝ (Fin d),
          Complex.exp (Complex.I * ((p.1 * modeDispersion m k - inner ℝ p.2 k : ℝ) : ℂ)) *
            (f p : ℂ) :=
    shellFeature_apply_ae d ħ m hħ hm (FeatureDensity.ofRealSchwartz f)
  have huf'_ae : (u_f' : EuclideanSpace ℝ (Fin d) → ℂ) =ᵐ[volume] fun k ↦
      ((Real.sqrt (ħ / (2 * modeDispersion m k)) : ℝ) : ℂ) *
        ∫ p : ℝ × EuclideanSpace ℝ (Fin d),
          Complex.exp (Complex.I * ((p.1 * modeDispersion m k - inner ℝ p.2 k : ℝ) : ℂ)) *
            (f' p : ℂ) :=
    shellFeature_apply_ae d ħ m hħ hm (FeatureDensity.ofRealSchwartz f')
  have hinner_ae :
      (fun k : EuclideanSpace ℝ (Fin d) ↦ inner ℂ (u_f k) (u_f' k)) =ᵐ[volume]
      fun k : EuclideanSpace ℝ (Fin d) ↦
        ((ħ / (2 * modeDispersion m k) : ℝ) : ℂ) *
          ∫ τ : ℝ, Complex.exp (Complex.I * ((τ * modeDispersion m k : ℝ) : ℂ)) *
            sliceSpatialFT (crossCorr f f') τ k := by
    filter_upwards [huf_ae, huf'_ae] with k h1 h2
    rw [RCLike.inner_apply, ← RCLike.star_def, h1, h2, star_mul', RCLike.star_def,
      Complex.conj_ofReal, ← RCLike.star_def]
    have hsq : ((Real.sqrt (ħ / (2 * modeDispersion m k)) : ℝ) : ℂ) *
        ((Real.sqrt (ħ / (2 * modeDispersion m k)) : ℝ) : ℂ) =
        ((ħ / (2 * modeDispersion m k) : ℝ) : ℂ) := by
      rw [← Complex.ofReal_mul, Real.mul_self_sqrt
        (div_nonneg hħ (mul_pos two_pos (modeDispersion_pos hm k)).le)]
    calc _ = (((Real.sqrt (ħ / (2 * modeDispersion m k)) : ℝ) : ℂ) *
          ((Real.sqrt (ħ / (2 * modeDispersion m k)) : ℝ) : ℂ)) *
          (star (∫ p : ℝ × EuclideanSpace ℝ (Fin d),
              Complex.exp (Complex.I * ((p.1 * modeDispersion m k - inner ℝ p.2 k : ℝ) : ℂ)) *
                (f p : ℂ)) *
            (∫ q : ℝ × EuclideanSpace ℝ (Fin d),
              Complex.exp (Complex.I * ((q.1 * modeDispersion m k - inner ℝ q.2 k : ℝ) : ℂ)) *
                (f' q : ℂ))) := by ring
      _ = _ := by rw [hsq, crossCorr_ft_eq hf_cs hf'_cs k]
  have hinner1 : inner ℂ u_f u_f' =
      ∫ k : EuclideanSpace ℝ (Fin d),
        ((ħ / (2 * modeDispersion m k) : ℝ) : ℂ) *
          ∫ τ : ℝ, Complex.exp (Complex.I * ((τ * modeDispersion m k : ℝ) : ℂ)) *
            sliceSpatialFT (crossCorr f f') τ k := by
    rw [L2.inner_def]
    exact integral_congr_ae hinner_ae
  have hinner2 : inner ℂ u_f' u_f =
      ∫ k : EuclideanSpace ℝ (Fin d),
        ((ħ / (2 * modeDispersion m k) : ℝ) : ℂ) *
          ∫ τ : ℝ, Complex.exp (-Complex.I * ((τ * modeDispersion m k : ℝ) : ℂ)) *
            sliceSpatialFT (crossCorr f f') τ k := by
    rw [← inner_conj_symm, hinner1, ← integral_conj,
      ← integral_neg_eq_self (fun k : EuclideanSpace ℝ (Fin d) ↦
        (starRingEnd ℂ) (((ħ / (2 * modeDispersion m k) : ℝ) : ℂ) *
          ∫ τ : ℝ, Complex.exp (Complex.I * ((τ * modeDispersion m k : ℝ) : ℂ)) *
            sliceSpatialFT (crossCorr f f') τ k)) volume]
    exact integral_congr_ae (ae_of_all _ (crossCorr_conj_neg ħ m (crossCorr f f')))
  have hint1 : Integrable (fun k : EuclideanSpace ℝ (Fin d) ↦
      ((ħ / (2 * modeDispersion m k) : ℝ) : ℂ) *
        ∫ τ : ℝ, Complex.exp (Complex.I * ((τ * modeDispersion m k : ℝ) : ℂ)) *
          sliceSpatialFT (crossCorr f f') τ k) volume :=
    (L2.integrable_inner (𝕜 := ℂ) u_f u_f').congr hinner_ae
  have hint2 : Integrable (fun k : EuclideanSpace ℝ (Fin d) ↦
      ((ħ / (2 * modeDispersion m k) : ℝ) : ℂ) *
        ∫ τ : ℝ, Complex.exp (-Complex.I * ((τ * modeDispersion m k : ℝ) : ℂ)) *
          sliceSpatialFT (crossCorr f f') τ k) volume :=
    ((Complex.conjCLE.toContinuousLinearMap.integrable_comp hint1).comp_neg).congr
      (ae_of_all _ (crossCorr_conj_neg ħ m (crossCorr f f')))
  change inner ℂ u_f u_f' - inner ℂ u_f' u_f = _
  rw [hinner1, hinner2, ← integral_sub hint1 hint2]
  unfold pjFunctional
  rw [← integral_const_mul]
  exact integral_congr_ae (ae_of_all _ (crossCorr_tau_diff_eq hm hcc.1 hcc.2 hT_zero))

end WightmanField

/-- **Unconditional Table 1 Spacelike Microcausality in Arbitrary Dimension `D = (n + 1) + 1 ≥ 2`**:
for ANY two compactly supported smooth real spacetime tests `f, f' : SchwartzMap (ℝ × Space (n + 1)) ℝ`
whose supports are spacelike separated (`∀ p ∈ tsupport f, ∀ q ∈ tsupport f', |p.1 - q.1| < ‖p.2 - q.2‖`),
the continuum Wightman field operators commute identically on `FiniteParticleFock volume`:
`[Φ_W(f), Φ_W(f')] ψ = 0`. -/
theorem wightman_spacelike_locality {n : ℕ} {ħ m : ℝ} (hħ : 0 ≤ ħ) (hm : 0 < m)
    (f f' : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin (n + 1))) ℝ)
    (hf_cs : HasCompactSupport f) (hf'_cs : HasCompactSupport f')
    (hsep : ∀ p ∈ tsupport f, ∀ q ∈ tsupport f', |p.1 - q.1| < ‖p.2 - q.2‖)
    (ψ : FiniteParticleFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))) :
    wightmanField (n + 1) ħ m hħ hm (FeatureDensity.ofRealSchwartz f)
        (wightmanField (n + 1) ħ m hħ hm (FeatureDensity.ofRealSchwartz f') ψ) -
      wightmanField (n + 1) ħ m hħ hm (FeatureDensity.ofRealSchwartz f')
        (wightmanField (n + 1) ħ m hħ hm (FeatureDensity.ofRealSchwartz f) ψ) = 0 := by
  have hzero :
      inner ℂ (shellFeatureReal (n + 1) ħ m hħ hm f) (shellFeatureReal (n + 1) ħ m hħ hm f') -
        inner ℂ (shellFeatureReal (n + 1) ħ m hħ hm f') (shellFeatureReal (n + 1) ħ m hħ hm f) = 0 := by
    rw [WightmanField.shellFeatureReal_commutator_eq_pjFunctional hħ hm hf_cs hf'_cs]
    have hcc := WightmanField.crossCorr_contDiff_and_cs hf_cs hf'_cs
    have hcc_sep : ∀ r ∈ tsupport (WightmanField.crossCorr f f'), |r.1| < ‖r.2‖ := by
      intro r hr
      obtain ⟨⟨p, q⟩, ⟨hp, hq⟩, rfl⟩ := WightmanField.crossCorr_tsupport_subset hf_cs hf'_cs hr
      have h := hsep p hp q hq
      simpa only [Prod.fst_sub, Prod.snd_sub, abs_sub_comm, norm_sub_rev] using h
    rw [WightmanField.pjFunctional_spacelike_zero hm hcc.1 hcc.2 hcc_sep, mul_zero]
  have h1 := wightmanField_ofReal (n + 1) ħ m hħ hm f
  have h2 := wightmanField_ofReal (n + 1) ħ m hħ hm f'
  exact (congrArg₂ (fun A B ↦ A (B ψ) - B (A ψ)) h1 h2).trans
    ((contField_commutator volume _ _ _ _ ψ).trans
      ((congrArg (· • ψ) hzero).trans (zero_smul ℂ ψ)))

end SpacelikeLocalityND

/-! ### Unified Master Theorem: All 4 Wightman Field Axioms on `momentumFock volume` (`D ≥ 2`) -/

section MasterWightman

/-- Unified Table 1 Wightman field theorem on the single concrete continuous-momentum Fock space
`momentumFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))` in arbitrary dimension
`D = (n + 1) + 1 ≥ 2`:
1. **Dense core & vacuum**: `FiniteParticleFock volume` is dense in `momentumFock volume` and
   contains `fockVacuum volume`; real fields are Hermitian and vacuum-cyclic.
2. **Tempered-distribution continuity**: for every `φ, ψ ∈ FiniteParticleFock volume`,
   `f ↦ ⟪φ, Φ_W(f) ψ⟫` is continuous on `SchwartzMap (ℝ × Space (n + 1)) ℂ`.
3. **Unconditional spacelike microcausality**: for all compactly supported real smooth tests
   `f, f'` with spacelike-separated supports, `[Φ_W(f), Φ_W(f')] ψ = 0`.
4. **Unitary Poincaré covariance**: second-quantized translations, `O(n + 1)` rotations, and
   directional Lorentz boosts fix the vacuum, form unitary representations, and intertwine `Φ_W`. -/
theorem wightman_axioms_on_momentumFock (n : ℕ) {ħ m : ℝ} (hħ : 0 ≤ ħ) (hm : 0 < m) :
    (FiniteParticleFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))).topologicalClosure = ⊤ ∧
    fockVacuum (volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))) ∈
      FiniteParticleFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))) ∧
    (∀ (φ ψ : FiniteParticleFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))),
      Continuous (fun f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin (n + 1))) ℂ ↦
        inner ℂ φ.1 (wightmanField (n + 1) ħ m hħ hm f ψ).1)) ∧
    (∀ (f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin (n + 1))) ℝ)
      (φ ψ : FiniteParticleFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))),
      inner ℂ (wightmanField (n + 1) ħ m hħ hm (FeatureDensity.ofRealSchwartz f) φ).1 ψ.1 =
        inner ℂ φ.1 (wightmanField (n + 1) ħ m hħ hm (FeatureDensity.ofRealSchwartz f) ψ).1) ∧
    (∀ (f f' : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin (n + 1))) ℝ),
      HasCompactSupport f → HasCompactSupport f' →
      (∀ p ∈ tsupport f, ∀ q ∈ tsupport f', |p.1 - q.1| < ‖p.2 - q.2‖) →
      ∀ ψ : FiniteParticleFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))),
        wightmanField (n + 1) ħ m hħ hm (FeatureDensity.ofRealSchwartz f)
            (wightmanField (n + 1) ħ m hħ hm (FeatureDensity.ofRealSchwartz f') ψ) -
          wightmanField (n + 1) ħ m hħ hm (FeatureDensity.ofRealSchwartz f')
            (wightmanField (n + 1) ħ m hħ hm (FeatureDensity.ofRealSchwartz f) ψ) = 0) ∧
    (∀ (a : ℝ × EuclideanSpace ℝ (Fin (n + 1)))
      (f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin (n + 1))) ℂ)
      (ψ : FiniteParticleFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))),
      fockTranslation (n + 1) m a (fockVacuum volume) = fockVacuum volume ∧
      secondQuantizeFin volume (translationUnitary (n + 1) m a)
          (wightmanField (n + 1) ħ m hħ hm f ψ) =
        wightmanField (n + 1) ħ m hħ hm (translateSchwartz a f)
          (secondQuantizeFin volume (translationUnitary (n + 1) m a) ψ)) ∧
    (∀ (R : EuclideanSpace ℝ (Fin (n + 1)) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin (n + 1)))
      (f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin (n + 1))) ℂ)
      (ψ : FiniteParticleFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))),
      fockRotation (n + 1) R (fockVacuum volume) = fockVacuum volume ∧
      secondQuantizeFin volume (rotationUnitary (n + 1) R)
          (wightmanField (n + 1) ħ m hħ hm f ψ) =
        wightmanField (n + 1) ħ m hħ hm (rotateSchwartz R f)
          (secondQuantizeFin volume (rotationUnitary (n + 1) R) ψ)) ∧
    (∀ (u : EuclideanSpace ℝ (Fin (n + 1))) (t : ℝ)
      (v vbar : Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))))
      (ψ : FiniteParticleFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))),
      fockDirectionalBoost n m hm u t (fockVacuum volume) = fockVacuum volume ∧
      secondQuantizeFin volume (directionalBoostUnitary n m hm u t) (contField volume v vbar ψ) =
        contField volume (directionalBoostUnitary n m hm u t v)
          (directionalBoostUnitary n m hm u t vbar)
          (secondQuantizeFin volume (directionalBoostUnitary n m hm u t) ψ)) :=
  ⟨finiteParticle_dense volume,
   fockVacuum_mem_finiteParticle volume,
   wightman_matrixElement_continuous (n + 1) ħ m hħ hm,
   wightmanField_symm_real (n + 1) ħ m hħ hm,
   fun f f' hf hf' hsep ψ ↦ wightman_spacelike_locality hħ hm f f' hf hf' hsep ψ,
   fun a f ψ ↦ ⟨secondQuantize_vacuum volume _,
     fockTranslation_intertwines_wightmanField (n + 1) ħ m hħ hm a f ψ⟩,
   fun R f ψ ↦ ⟨secondQuantize_vacuum volume _,
     fockRotation_intertwines_wightmanField (n + 1) ħ m hħ hm R f ψ⟩,
   fun u t v vbar ψ ↦ ⟨fockDirectionalBoost_vacuum n m hm u t,
     fockDirectionalBoost_intertwines_field n m hm u t v vbar ψ⟩⟩

end MasterWightman

end ContinuumWightmanField

/-!
==============================================================================
  PART 8: COMPOSITION — FOCK TENSOR & COMPLETED `L²` TENSOR PRODUCT (§3.4)
==============================================================================
-/
section Composition

open scoped InnerProductSpace

/-- Exponential factorization of the Fock Gram table forces tensor factorization (§3.4). -/
theorem fock_tensor_unique {𝔥₁ 𝔥₂ ℋ₁ ℋ₂ ℋ₁₂ ℋₜ : Type*}
    [NormedAddCommGroup 𝔥₁] [InnerProductSpace ℂ 𝔥₁]
    [NormedAddCommGroup 𝔥₂] [InnerProductSpace ℂ 𝔥₂]
    [NormedAddCommGroup ℋ₁] [InnerProductSpace ℂ ℋ₁]
    [NormedAddCommGroup ℋ₂] [InnerProductSpace ℂ ℋ₂]
    [NormedAddCommGroup ℋ₁₂] [InnerProductSpace ℂ ℋ₁₂] [CompleteSpace ℋ₁₂]
    [NormedAddCommGroup ℋₜ] [InnerProductSpace ℂ ℋₜ] [CompleteSpace ℋₜ]
    (ε₁ : 𝔥₁ → ℋ₁) (ε₂ : 𝔥₂ → ℋ₂) (ε₁₂ : 𝔥₁ × 𝔥₂ → ℋ₁₂) (τ : ℋ₁ → ℋ₂ → ℋₜ)
    (hd₁₂ : Dense ((Submodule.span ℂ (Set.range ε₁₂) : Submodule ℂ ℋ₁₂) : Set ℋ₁₂))
    (hdₜ : Dense ((Submodule.span ℂ (Set.range fun p : 𝔥₁ × 𝔥₂ => τ (ε₁ p.1) (ε₂ p.2)) : Submodule ℂ ℋₜ) : Set ℋₜ))
    (h₁ : ∀ u v, inner ℂ (ε₁ u) (ε₁ v) = Complex.exp (inner ℂ u v))
    (h₂ : ∀ u v, inner ℂ (ε₂ u) (ε₂ v) = Complex.exp (inner ℂ u v))
    (h₁₂ : ∀ p q : 𝔥₁ × 𝔥₂, inner ℂ (ε₁₂ p) (ε₁₂ q) = Complex.exp (inner ℂ p.1 q.1 + inner ℂ p.2 q.2))
    (hτ : ∀ x₁ y₁ x₂ y₂, inner ℂ (τ x₁ y₁) (τ x₂ y₂) = inner ℂ x₁ x₂ * inner ℂ y₁ y₂) :
    ∃! U : ℋ₁₂ ≃ₗᵢ[ℂ] ℋₜ, ∀ p : 𝔥₁ × 𝔥₂, U (ε₁₂ p) = τ (ε₁ p.1) (ε₂ p.2) :=
  gram_total_unique ε₁₂ (fun p => τ (ε₁ p.1) (ε₂ p.2)) hd₁₂ hdₜ
    (fun p q => by rw [h₁₂, hτ, h₁, h₂, Complex.exp_add])

end Composition

/-! ### §3.4 Concrete Completed Hilbert Tensor Product `L²(μ) ⊗̂ L²(ν) ≃ₗᵢ[ℂ] L²(μ ⊗ ν)` -/
section ProductL2Tensor

open MeasureTheory Set MeasurableSpace UniformSpace Submodule
open scoped ENNReal TensorProduct

/-! ### Rectangle π-system determination for `SFinite` product `L²` -/

/-- An integrable vector density on a product space is determined by its integrals on
measurable rectangles, which form a generating π-system for the product σ-algebra. -/
theorem integrable_zero_of_rectangles {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
    {ρ : Measure (α × β)}
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    {f : α × β → E} (hf : Integrable f ρ)
    (h : ∀ {s : Set α} {t : Set β}, MeasurableSet s → MeasurableSet t →
      ∫ z in s ×ˢ t, f z ∂ρ = 0) : f =ᵐ[ρ] 0 := by
  apply hf.ae_eq_of_withDensityᵥ_eq (integrable_zero _ _ _)
  rw [withDensityᵥ_zero]
  refine VectorMeasure.ext_of_generateFrom _ ?_ generateFrom_prod.symm isPiSystem_prod ?_
  · rintro _ ⟨s, hs, t, ht, rfl⟩
    simpa [withDensityᵥ_apply hf (hs.prod ht)] using h hs ht
  · simpa [withDensityᵥ_apply hf MeasurableSet.univ] using
      h MeasurableSet.univ MeasurableSet.univ

namespace ProductL2

private theorem sigmaFinite_zero {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
    {μ : Measure α} {ν : Measure β} [SigmaFinite μ] [SigmaFinite ν]
    (z : α × β → ℂ) (hz : MemLp z 2 (μ.prod ν))
    (h : ∀ {s : Set α} {t : Set β}, MeasurableSet s → MeasurableSet t → μ s ≠ ∞ → ν t ≠ ∞ →
      ∫ x in s ×ˢ t, z x ∂μ.prod ν = 0) : z =ᵐ[μ.prod ν] 0 := by
  have hloc (i j : ℕ) :
      ∀ᵐ x ∂μ.prod ν, x ∈ spanningSets μ i ×ˢ spanningSets ν j → z x = 0 := by
    let R := spanningSets μ i ×ˢ spanningSets ν j
    have hi := measurableSet_spanningSets μ i
    have hj := measurableSet_spanningSets ν j
    have hfin : (μ.prod ν) R ≠ ∞ := by
      rw [show R = spanningSets μ i ×ˢ spanningSets ν j from rfl, Measure.prod_prod]
      exact ENNReal.mul_ne_top (measure_spanningSets_lt_top μ i).ne
        (measure_spanningSets_lt_top ν j).ne
    have : IsFiniteMeasure ((μ.prod ν).restrict R) := isFiniteMeasure_restrict.mpr hfin
    apply (ae_restrict_iff' (hi.prod hj)).mp
    apply integrable_zero_of_rectangles ((hz.restrict R).integrable (by norm_num))
    intro s t hs ht
    rw [Measure.restrict_restrict (hs.prod ht), show R = _ from rfl, prod_inter_prod]
    apply h (hs.inter hi) (ht.inter hj)
    · exact ((measure_mono inter_subset_right).trans_lt (measure_spanningSets_lt_top μ i)).ne
    · exact ((measure_mono inter_subset_right).trans_lt (measure_spanningSets_lt_top ν j)).ne
  filter_upwards [ae_all_iff.mpr (fun i => ae_all_iff.mpr (hloc i))] with x hx
  obtain ⟨i, hi⟩ := iUnion_eq_univ_iff.mp (iUnion_spanningSets μ) x.1
  obtain ⟨j, hj⟩ := iUnion_eq_univ_iff.mp (iUnion_spanningSets ν) x.2
  exact hx i j ⟨hi, hj⟩

private theorem zero_of_absorbing_measure {X : Type*} [MeasurableSpace X] {ρ : Measure X}
    {f : X → ℂ} (hf : MemLp f 2 ρ) (hρ : ρ = (∞ : ℝ≥0∞) • ρ) : f =ᵐ[ρ] 0 := by
  apply (eLpNorm_eq_zero_iff (by norm_num : (2 : ℝ≥0∞) ≠ 0)).mp
  by_contra hn
  have e := eLpNorm_smul_measure_of_ne_zero ENNReal.top_ne_zero f 2 ρ
  have hp : (0 : ℝ) < (1 / (2 : ℝ≥0∞)).toReal := by norm_num
  rw [← hρ, ENNReal.top_rpow_of_pos hp, smul_eq_mul, ENNReal.top_mul hn] at e
  exact hf.eLpNorm_lt_top.ne e

private theorem compl_absorbs {X : Type*} [MeasurableSpace X] (ξ : Measure X) [SFinite ξ] :
    ξ.restrict ξ.sigmaFiniteSetᶜ = (∞ : ℝ≥0∞) • ξ.restrict ξ.sigmaFiniteSetᶜ :=
  restrict_compl_sigmaFiniteSetWRT (μ := ξ) Measure.AbsolutelyContinuous.rfl

private theorem product_memLp {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
    {μ : Measure α} {ν : Measure β} [SFinite ν]
    (f : Lp ℂ 2 μ) (g : Lp ℂ 2 ν) :
    MemLp (fun z : α × β => f z.1 * g z.2) 2 (μ.prod ν) := by
  apply (memLp_two_iff_integrable_sq_norm
    ((Lp.memLp f).aestronglyMeasurable.comp_fst.mul
      (Lp.memLp g).aestronglyMeasurable.comp_snd)).mpr
  have hf := (memLp_two_iff_integrable_sq_norm (Lp.memLp f).aestronglyMeasurable).mp (Lp.memLp f)
  have hg := (memLp_two_iff_integrable_sq_norm (Lp.memLp g).aestronglyMeasurable).mp (Lp.memLp g)
  simpa only [Pi.mul_apply, norm_mul, mul_pow] using hf.mul_prod hg

/-- Separated product of `L²` classes on independent coordinates. -/
noncomputable def pure {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
    {μ : Measure α} {ν : Measure β} [SFinite ν]
    (f : Lp ℂ 2 μ) (g : Lp ℂ 2 ν) : Lp ℂ 2 (μ.prod ν) :=
  (product_memLp f g).toLp _

theorem pure_ae {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
    {μ : Measure α} {ν : Measure β} [SFinite ν]
    (f : Lp ℂ 2 μ) (g : Lp ℂ 2 ν) :
    ⇑(pure f g) =ᵐ[μ.prod ν] fun z => f z.1 * g z.2 :=
  (product_memLp f g).coeFn_toLp

/-- Fubini factorization of the `L²(μ ⊗ ν)` inner product on separated products. -/
theorem inner_pure {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
    {μ : Measure α} {ν : Measure β} [SFinite μ] [SFinite ν]
    (f : Lp ℂ 2 μ) (g : Lp ℂ 2 ν) (f' : Lp ℂ 2 μ) (g' : Lp ℂ 2 ν) :
    inner ℂ (pure f g) (pure f' g') = inner ℂ f f' * inner ℂ g g' := by
  rw [L2.inner_def, L2.inner_def f, L2.inner_def g, ← integral_prod_mul]
  apply integral_congr_ae
  filter_upwards [pure_ae f g, pure_ae f' g'] with z hz hz'
  simp only [hz, hz', RCLike.inner_apply, map_mul]
  ring

theorem norm_pure {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
    {μ : Measure α} {ν : Measure β} [SFinite μ] [SFinite ν]
    (f : Lp ℂ 2 μ) (g : Lp ℂ 2 ν) :
    ‖pure f g‖ = ‖f‖ * ‖g‖ := by
  have h := inner_pure f g f g
  simp only [inner_self_eq_norm_sq_to_K] at h
  have hh : ‖pure f g‖ ^ 2 = ‖f‖ ^ 2 * ‖g‖ ^ 2 := by exact_mod_cast h
  exact (sq_eq_sq₀ (norm_nonneg _) (mul_nonneg (norm_nonneg _) (norm_nonneg _))).mp
    (hh.trans (mul_pow _ _ _).symm)

/-- Bilinear map sending `(f, g)` to the separated `L²` product. -/
noncomputable def bilinear {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
    {μ : Measure α} {ν : Measure β} [SFinite ν] :
    Lp ℂ 2 μ →ₗ[ℂ] Lp ℂ 2 ν →ₗ[ℂ] Lp ℂ 2 (μ.prod ν) := by
  apply LinearMap.mk₂ ℂ pure
  · intro f f' g
    apply Lp.ext
    refine ((pure_ae _ _).trans ?_).trans (Lp.coeFn_add _ _).symm
    filter_upwards [Measure.quasiMeasurePreserving_fst.ae_eq_comp (Lp.coeFn_add f f'),
      pure_ae f g, pure_ae f' g] with z h h₁ h₂
    simpa only [Function.comp_apply, Pi.add_apply, h₁, h₂, ← add_mul] using
      congrArg (· * g z.2) h
  · intro c f g
    apply Lp.ext
    refine ((pure_ae _ _).trans ?_).trans (Lp.coeFn_smul _ _).symm
    filter_upwards [Measure.quasiMeasurePreserving_fst.ae_eq_comp (Lp.coeFn_smul c f),
      pure_ae f g] with z h h₁
    simpa only [Function.comp_apply, Pi.smul_apply, smul_eq_mul, h₁, mul_assoc] using
      congrArg (· * g z.2) h
  · intro f g g'
    apply Lp.ext
    refine ((pure_ae _ _).trans ?_).trans (Lp.coeFn_add _ _).symm
    filter_upwards [Measure.quasiMeasurePreserving_snd.ae_eq_comp (Lp.coeFn_add g g'),
      pure_ae f g, pure_ae f g'] with z h h₁ h₂
    simpa only [Function.comp_apply, Pi.add_apply, h₁, h₂, ← mul_add] using
      congrArg (f z.1 * ·) h
  · intro c f g
    apply Lp.ext
    refine ((pure_ae _ _).trans ?_).trans (Lp.coeFn_smul _ _).symm
    filter_upwards [Measure.quasiMeasurePreserving_snd.ae_eq_comp (Lp.coeFn_smul c g),
      pure_ae f g] with z h h₁
    simpa only [Function.comp_apply, Pi.smul_apply, smul_eq_mul, h₁,
      mul_left_comm (f z.1) c] using congrArg (f z.1 * ·) h

@[simp] theorem bilinear_apply {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
    {μ : Measure α} {ν : Measure β} [SFinite ν]
    (f : Lp ℂ 2 μ) (g : Lp ℂ 2 ν) :
    bilinear f g = pure f g := rfl

/-- Jointly continuous bilinear map on `L²(μ) × L²(ν) → L²(μ ⊗ ν)`. -/
noncomputable def continuousBilinear {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
    {μ : Measure α} {ν : Measure β} [SFinite μ] [SFinite ν] :
    Lp ℂ 2 μ →L[ℂ] Lp ℂ 2 ν →L[ℂ] Lp ℂ 2 (μ.prod ν) :=
  bilinear.mkContinuous₂ 1 (fun f g => by simp [norm_pure])

@[simp] theorem continuousBilinear_apply {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
    {μ : Measure α} {ν : Measure β} [SFinite μ] [SFinite ν]
    (f : Lp ℂ 2 μ) (g : Lp ℂ 2 ν) :
    continuousBilinear f g = pure f g := rfl

/-- Multiplying two finite-measure set indicators gives the rectangle indicator in `L²`. -/
theorem pure_indicator {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
    {μ : Measure α} {ν : Measure β} [SFinite ν]
    {s : Set α} {t : Set β} (hs : MeasurableSet s) (ht : MeasurableSet t)
    (hμs : μ s ≠ ∞) (hνt : ν t ≠ ∞) :
    pure (indicatorConstLp 2 hs hμs (1 : ℂ)) (indicatorConstLp 2 ht hνt 1) =
      indicatorConstLp 2 (hs.prod ht)
        (by rw [Measure.prod_prod]; exact ENNReal.mul_ne_top hμs hνt) 1 := by
  let f := indicatorConstLp 2 hs hμs (1 : ℂ)
  let g := indicatorConstLp 2 ht hνt (1 : ℂ)
  apply Lp.ext
  refine (pure_ae f g).trans (Filter.EventuallyEq.trans ?_ indicatorConstLp_coeFn.symm)
  have h₁ := (Measure.quasiMeasurePreserving_fst (μ := μ) (ν := ν)).ae_eq_comp
    (show ⇑f =ᵐ[μ] _ from indicatorConstLp_coeFn)
  have h₂ := (Measure.quasiMeasurePreserving_snd (μ := μ) (ν := ν)).ae_eq_comp
    (show ⇑g =ᵐ[ν] _ from indicatorConstLp_coeFn)
  filter_upwards [h₁, h₂] with z hz₁ hz₂
  simp only [Function.comp_apply] at hz₁ hz₂
  rw [hz₁, hz₂]
  by_cases hx : z.1 ∈ s <;> by_cases hy : z.2 ∈ t <;>
    simp [Set.indicator, Set.mem_prod, hx, hy]

/-- Elementary tensor embedded into the Hilbert completion `Completion (E ⊗[ℂ] F)`. -/
noncomputable abbrev tensorPure {E F : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    [NormedAddCommGroup F] [InnerProductSpace ℂ F]
    (x : E) (y : F) : Completion (E ⊗[ℂ] F) :=
  (x ⊗ₜ[ℂ] y : E ⊗[ℂ] F)

private theorem extend_mem {ι E G : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    [NormedAddCommGroup G] [InnerProductSpace ℂ G]
    (a : ι → E) (ha : Dense (span ℂ (Set.range a) : Set E))
    (f : E →L[ℂ] G) (K : Submodule ℂ G) (hK : IsClosed (K : Set G))
    (h : ∀ i, f (a i) ∈ K) (x : E) : f x ∈ K := by
  have hl : span ℂ (Set.range a) ≤ K.comap f.toLinearMap :=
    span_le.mpr (by rintro _ ⟨i, rfl⟩; exact h i)
  exact ha.induction (fun y hy => hl hy) (hK.preimage f.continuous) x

private theorem total_id (E : Type*) [NormedAddCommGroup E] [NormedSpace ℂ E] :
    Dense (Submodule.span ℂ (Set.range (id : E → E)) : Set E) := by simp

end ProductL2

/-! ### Public `ProductL2Tensor` theorems in `DotProduct` -/

/-- For arbitrary `SFinite` factors `μ, ν`, finite-measure rectangles determine every element
of `L²(μ ⊗ ν)`: any `z ∈ L²(μ ⊗ ν)` whose integral vanishes on all finite rectangles is zero. -/
theorem lp_zero_of_rectangles {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
    {μ : Measure α} {ν : Measure β} [SFinite μ] [SFinite ν]
    (z : Lp ℂ 2 (μ.prod ν))
    (h : ∀ {s : Set α} {t : Set β}, MeasurableSet s → MeasurableSet t → μ s ≠ ∞ → ν t ≠ ∞ →
      ∫ x in s ×ˢ t, z x ∂μ.prod ν = 0) : z = 0 := by
  let S := μ.sigmaFiniteSet
  let T := ν.sigmaFiniteSet
  have hs : MeasurableSet S := measurableSet_sigmaFiniteSet
  have ht : MeasurableSet T := measurableSet_sigmaFiniteSet
  have hz := Lp.memLp z
  have good : ⇑z =ᵐ[(μ.restrict S).prod (ν.restrict T)] 0 := by
    apply ProductL2.sigmaFinite_zero z
      (hz.mono_measure (Measure.prod_mono Measure.restrict_le_self Measure.restrict_le_self))
    intro a b ha hb hma hnb
    rw [Measure.prod_restrict, Measure.restrict_restrict (ha.prod hb), prod_inter_prod]
    exact h (ha.inter hs) (hb.inter ht) (by rwa [Measure.restrict_apply ha] at hma)
      (by rwa [Measure.restrict_apply hb] at hnb)
  have left : ⇑z =ᵐ[(μ.restrict Sᶜ).prod ν] 0 := by
    apply ProductL2.zero_of_absorbing_measure
      (hz.mono_measure (Measure.prod_mono Measure.restrict_le_self le_rfl))
    exact (congrArg (fun m : Measure α => m.prod ν)
      (ProductL2.compl_absorbs μ)).trans (Measure.prod_smul_left _)
  have right : ⇑z =ᵐ[(μ.restrict S).prod (ν.restrict Tᶜ)] 0 := by
    apply ProductL2.zero_of_absorbing_measure
      (hz.mono_measure (Measure.prod_mono Measure.restrict_le_self Measure.restrict_le_self))
    exact (congrArg (μ.restrict S).prod
      (ProductL2.compl_absorbs ν)).trans (Measure.prod_smul_right _)
  have hsplit : μ.prod ν = ((μ.restrict S).prod (ν.restrict T) +
      (μ.restrict S).prod (ν.restrict Tᶜ)) + (μ.restrict Sᶜ).prod ν := by
    rw [← Measure.prod_add, Measure.restrict_add_restrict_compl ht, ← Measure.add_prod,
      Measure.restrict_add_restrict_compl hs]
  apply Lp.ext
  apply Filter.EventuallyEq.trans _ (Lp.coeFn_zero ..).symm
  apply (congrArg (fun ρ : Measure (α × β) => ∀ᵐ x ∂ρ, z x = 0) hsplit).mpr
  rw [ae_add_measure_iff, ae_add_measure_iff]
  exact ⟨⟨good, right⟩, left⟩

/-- Every subspace of `L²(μ ⊗ ν)` containing all finite measurable rectangle indicators is dense. -/
theorem dense_of_rectangles {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
    {μ : Measure α} {ν : Measure β} [SFinite μ] [SFinite ν]
    (K : Submodule ℂ (Lp ℂ 2 (μ.prod ν)))
    (hrect : ∀ {s : Set α} {t : Set β} (hs : MeasurableSet s) (ht : MeasurableSet t)
      (hμs : μ s ≠ ∞) (hνt : ν t ≠ ∞), indicatorConstLp 2 (hs.prod ht)
        (by rw [Measure.prod_prod]; exact ENNReal.mul_ne_top hμs hνt) (1 : ℂ) ∈ K) :
    K.topologicalClosure = ⊤ := by
  rw [Submodule.topologicalClosure_eq_top_iff, Submodule.eq_bot_iff]
  intro z hz
  apply lp_zero_of_rectangles z
  intro s t hs ht hμs hνt
  rw [← L2.inner_indicatorConstLp_one (hs.prod ht)
    (by rw [Measure.prod_prod]; exact ENNReal.mul_ne_top hμs hνt) z]
  exact Submodule.inner_right_of_mem_orthogonal (hrect hs ht hμs hνt) hz

/-- The canonical separated products span a dense subspace of `L²(μ ⊗ ν)`. -/
theorem dense_pure {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
    {μ : Measure α} {ν : Measure β} [SFinite μ] [SFinite ν] :
    (Submodule.span ℂ (Set.range fun z : Lp ℂ 2 μ × Lp ℂ 2 ν ↦
      ProductL2.pure z.1 z.2)).topologicalClosure = ⊤ := by
  apply dense_of_rectangles
  intro s t hs ht hμs hνt
  exact Submodule.subset_span
    ⟨(indicatorConstLp 2 hs hμs 1, indicatorConstLp 2 ht hνt 1),
      ProductL2.pure_indicator hs ht hμs hνt⟩

/-- Any realization with the same a.e. separated-product representatives is total in `L²(μ ⊗ ν)`. -/
theorem dense_of_product_representatives {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
    {μ : Measure α} {ν : Measure β} [SFinite μ] [SFinite ν]
    (p : Lp ℂ 2 μ → Lp ℂ 2 ν → Lp ℂ 2 (μ.prod ν))
    (hp : ∀ f g, ⇑(p f g) =ᵐ[μ.prod ν] fun z ↦ f z.1 * g z.2) :
    (Submodule.span ℂ (Set.range fun z : Lp ℂ 2 μ × Lp ℂ 2 ν ↦ p z.1 z.2)).topologicalClosure =
      ⊤ := by
  have he : p = ProductL2.pure :=
    funext fun f ↦ funext fun g ↦ Lp.ext ((hp f g).trans (ProductL2.pure_ae f g).symm)
  exact he ▸ dense_pure

/-- Total factor families yield total elementary product labels in the completed Hilbert
tensor product `Completion (E ⊗[ℂ] F)`. -/
theorem pure_labels_total {ι κ E F : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    [NormedAddCommGroup F] [InnerProductSpace ℂ F]
    (a : ι → E) (b : κ → F)
    (ha : Dense (span ℂ (Set.range a) : Set E))
    (hb : Dense (span ℂ (Set.range b) : Set F)) :
    Dense (span ℂ (Set.range (fun p : ι × κ ↦ ProductL2.tensorPure (a p.1) (b p.2))) :
      Set (Completion (E ⊗[ℂ] F))) := by
  let S := span ℂ (Set.range (fun p : ι × κ ↦ ProductL2.tensorPure (a p.1) (b p.2)))
  let K := S.topologicalClosure
  let j : E ⊗[ℂ] F →L[ℂ] Completion (E ⊗[ℂ] F) := Completion.toComplL
  let B := TensorProduct.mkL ℂ E F
  have hp (x : E) (y : F) : ProductL2.tensorPure x y ∈ K := by
    apply ProductL2.extend_mem a ha (j.comp (B.flip y)) K S.isClosed_topologicalClosure
    intro i
    apply ProductL2.extend_mem b hb (j.comp (B (a i))) K S.isClosed_topologicalClosure
    intro k
    exact S.le_topologicalClosure (subset_span ⟨(i, k), rfl⟩)
  apply dense_iff_topologicalClosure_eq_top.mpr
  apply top_unique
  intro z _
  change z ∈ K
  refine Completion.induction_on z S.isClosed_topologicalClosure fun t => ?_
  refine t.inductionOn hp fun s t hs ht => ?_
  simpa only [Completion.coe_add] using K.add_mem hs ht

/-- Product Gram data and minimality identify any complete Hilbert space `G` with the
completed Hilbert tensor product `Completion (E ⊗[ℂ] F)` via a unique label-preserving unitary. -/
theorem hilbertTensor_product_unique {ι κ E F G : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    [NormedAddCommGroup F] [InnerProductSpace ℂ F]
    [NormedAddCommGroup G] [InnerProductSpace ℂ G] [CompleteSpace G]
    (a : ι → E) (b : κ → F) (c : ι × κ → G)
    (ha : Dense (span ℂ (Set.range a) : Set E))
    (hb : Dense (span ℂ (Set.range b) : Set F))
    (hc : Dense (span ℂ (Set.range c) : Set G))
    (hg : ∀ p q, inner ℂ (c p) (c q) =
      inner ℂ (a p.1) (a q.1) * inner ℂ (b p.2) (b q.2)) :
    ∃! U : Completion (E ⊗[ℂ] F) ≃ₗᵢ[ℂ] G,
      ∀ p, U (ProductL2.tensorPure (a p.1) (b p.2)) = c p := by
  apply gram_total_unique _ _ (pure_labels_total a b ha hb) hc
  intro p q
  rw [hg, ProductL2.tensorPure, ProductL2.tensorPure, Completion.inner_coe,
    TensorProduct.inner_tmul]

/-- Concrete completed Hilbert tensor product equivalence `L²(μ) ⊗̂ L²(ν) ≃ₗᵢ[ℂ] L²(μ ⊗ ν)`
for arbitrary `SFinite` measures `μ, ν`, uniquely fixed by its action on elementary tensors. -/
theorem tensor_product_L2_unique {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
    (μ : Measure α) (ν : Measure β) [SFinite μ] [SFinite ν] :
    ∃! U : Completion ((Lp ℂ 2 μ) ⊗[ℂ] (Lp ℂ 2 ν)) ≃ₗᵢ[ℂ] Lp ℂ 2 (μ.prod ν),
      ∀ f g, U (ProductL2.tensorPure f g) = ProductL2.pure f g := by
  let c (p : Lp ℂ 2 μ × Lp ℂ 2 ν) := ProductL2.pure p.1 p.2
  have hd : Dense (Submodule.span ℂ (Set.range c) : Set (Lp ℂ 2 (μ.prod ν))) :=
    Submodule.dense_iff_topologicalClosure_eq_top.mpr dense_pure
  obtain ⟨U, hU, hu⟩ := hilbertTensor_product_unique id id c
    (ProductL2.total_id _) (ProductL2.total_id _) hd
    (fun p q ↦ ProductL2.inner_pure p.1 p.2 q.1 q.2)
  exact ⟨U, fun f g ↦ hU (f, g), fun V hV ↦ hu V fun p ↦ hV p.1 p.2⟩

/-- Pointwise a.e. form of `tensor_product_L2_unique`: the unique unitary sends every pure
tensor `f ⊗ₜ g` to the pointwise product `(x, y) ↦ f x * g y` almost everywhere. -/
theorem tensor_product_L2_unique_ae {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
    (μ : Measure α) (ν : Measure β) [SFinite μ] [SFinite ν] :
    ∃! U : Completion ((Lp ℂ 2 μ) ⊗[ℂ] (Lp ℂ 2 ν)) ≃ₗᵢ[ℂ] Lp ℂ 2 (μ.prod ν),
      ∀ f g, ⇑(U (ProductL2.tensorPure f g)) =ᵐ[μ.prod ν] fun z ↦ f z.1 * g z.2 := by
  obtain ⟨U, hU, hu⟩ := tensor_product_L2_unique μ ν
  exact ⟨U, fun f g ↦ hU f g ▸ ProductL2.pure_ae f g,
    fun V hV ↦ hu V fun f g ↦ Lp.ext ((hV f g).trans (ProductL2.pure_ae f g).symm)⟩

end ProductL2Tensor

/-! ### §3.4 Concrete Tensor Product Equivalence Directly on `momentumFock` -/
section MomentumFockTensor

open MeasureTheory Set UniformSpace Submodule
open scoped ENNReal InnerProductSpace TensorProduct

/-- Disjoint-union measure `μ₁ ⊕ μ₂ := μ₁.map Sum.inl + μ₂.map Sum.inr` on `α₁ ⊕ α₂`. -/
noncomputable def sumMeasure {α₁ α₂ : Type*} [MeasurableSpace α₁] [MeasurableSpace α₂]
    (μ₁ : Measure α₁) (μ₂ : Measure α₂) : Measure (α₁ ⊕ α₂) :=
  μ₁.map Sum.inl + μ₂.map Sum.inr

namespace MomentumFockTensor

lemma preimage_inl_union_images {α₁ α₂ : Type*} (s₁ : Set α₁) (s₂ : Set α₂) :
    Sum.inl ⁻¹' (Sum.inl '' s₁ ∪ Sum.inr '' s₂) = s₁ := by
  ext x
  simp

lemma preimage_inr_union_images {α₁ α₂ : Type*} (s₁ : Set α₁) (s₂ : Set α₂) :
    Sum.inr ⁻¹' (Sum.inl '' s₁ ∪ Sum.inr '' s₂) = s₂ := by
  ext y
  simp

lemma measurableSet_union_images {α₁ α₂ : Type*} [MeasurableSpace α₁] [MeasurableSpace α₂]
    {s₁ : Set α₁} {s₂ : Set α₂} (hs₁ : MeasurableSet s₁) (hs₂ : MeasurableSet s₂) :
    MeasurableSet (Sum.inl '' s₁ ∪ Sum.inr '' s₂) :=
  measurableSet_sum_iff.mpr
    ⟨by rwa [preimage_inl_union_images], by rwa [preimage_inr_union_images]⟩

lemma sumElim_memLp {α₁ α₂ : Type*} [MeasurableSpace α₁] [MeasurableSpace α₂]
    (μ₁ : Measure α₁) (μ₂ : Measure α₂) (u : Lp ℂ 2 μ₁) (v : Lp ℂ 2 μ₂) :
    MemLp (Sum.elim (u : α₁ → ℂ) (v : α₂ → ℂ)) 2 (sumMeasure μ₁ μ₂) := by
  have hmeas : Measurable (Sum.elim (u : α₁ → ℂ) (v : α₂ → ℂ)) :=
    (Lp.stronglyMeasurable u).measurable.sumElim (Lp.stronglyMeasurable v).measurable
  refine (memLp_two_iff_integrable_sq_norm hmeas.aestronglyMeasurable).mpr ?_
  unfold sumMeasure
  refine integrable_add_measure.mpr ⟨?_, ?_⟩
  · rw [integrable_map_measure (hmeas.norm.pow_const 2).aestronglyMeasurable
      measurable_inl.aemeasurable]
    exact (memLp_two_iff_integrable_sq_norm (Lp.aestronglyMeasurable u)).mp (Lp.memLp u)
  · rw [integrable_map_measure (hmeas.norm.pow_const 2).aestronglyMeasurable
      measurable_inr.aemeasurable]
    exact (memLp_two_iff_integrable_sq_norm (Lp.aestronglyMeasurable v)).mp (Lp.memLp v)

lemma comp_inl_memLp {α₁ α₂ : Type*} [MeasurableSpace α₁] [MeasurableSpace α₂]
    (μ₁ : Measure α₁) (μ₂ : Measure α₂) (w : Lp ℂ 2 (sumMeasure μ₁ μ₂)) :
    MemLp (fun x : α₁ ↦ w (Sum.inl x)) 2 μ₁ := by
  have hw_meas : Measurable (w : α₁ ⊕ α₂ → ℂ) := (Lp.stronglyMeasurable w).measurable
  have h1 : MemLp (w : α₁ ⊕ α₂ → ℂ) 2 (μ₁.map Sum.inl) :=
    (Lp.memLp w).mono_measure (Measure.le_add_right le_rfl)
  have hint : Integrable (fun z : α₁ ⊕ α₂ ↦ ‖w z‖ ^ 2) (μ₁.map Sum.inl) :=
    (memLp_two_iff_integrable_sq_norm hw_meas.aestronglyMeasurable).mp h1
  rw [integrable_map_measure (hw_meas.norm.pow_const 2).aestronglyMeasurable
    measurable_inl.aemeasurable] at hint
  exact (memLp_two_iff_integrable_sq_norm (hw_meas.comp measurable_inl).aestronglyMeasurable).mpr
    hint

lemma comp_inr_memLp {α₁ α₂ : Type*} [MeasurableSpace α₁] [MeasurableSpace α₂]
    (μ₁ : Measure α₁) (μ₂ : Measure α₂) (w : Lp ℂ 2 (sumMeasure μ₁ μ₂)) :
    MemLp (fun y : α₂ ↦ w (Sum.inr y)) 2 μ₂ := by
  have hw_meas : Measurable (w : α₁ ⊕ α₂ → ℂ) := (Lp.stronglyMeasurable w).measurable
  have h2 : MemLp (w : α₁ ⊕ α₂ → ℂ) 2 (μ₂.map Sum.inr) :=
    (Lp.memLp w).mono_measure (Measure.le_add_left le_rfl)
  have hint : Integrable (fun z : α₁ ⊕ α₂ ↦ ‖w z‖ ^ 2) (μ₂.map Sum.inr) :=
    (memLp_two_iff_integrable_sq_norm hw_meas.aestronglyMeasurable).mp h2
  rw [integrable_map_measure (hw_meas.norm.pow_const 2).aestronglyMeasurable
    measurable_inr.aemeasurable] at hint
  exact (memLp_two_iff_integrable_sq_norm (hw_meas.comp measurable_inr).aestronglyMeasurable).mpr
    hint

end MomentumFockTensor

/-- `sumMeasure μ₁ μ₂` is `SigmaFinite` whenever `μ₁` and `μ₂` are `SigmaFinite`. -/
noncomputable instance sumMeasure_sigmaFinite {α₁ α₂ : Type*}
    [MeasurableSpace α₁] [MeasurableSpace α₂]
    (μ₁ : Measure α₁) (μ₂ : Measure α₂) [SigmaFinite μ₁] [SigmaFinite μ₂] :
    SigmaFinite (sumMeasure μ₁ μ₂) := by
  refine (Measure.FiniteSpanningSetsIn.mk
    (set := fun n ↦ Sum.inl '' spanningSets μ₁ n ∪ Sum.inr '' spanningSets μ₂ n)
    (set_mem := fun _ ↦ Set.mem_univ _)
    (finite := fun n ↦ ?_)
    (spanning := ?_)).sigmaFinite
  · have hmeas : MeasurableSet (Sum.inl '' spanningSets μ₁ n ∪ Sum.inr '' spanningSets μ₂ n) :=
      MomentumFockTensor.measurableSet_union_images
        (measurableSet_spanningSets μ₁ n) (measurableSet_spanningSets μ₂ n)
    unfold sumMeasure
    rw [Measure.add_apply, Measure.map_apply measurable_inl hmeas,
      Measure.map_apply measurable_inr hmeas,
      MomentumFockTensor.preimage_inl_union_images,
      MomentumFockTensor.preimage_inr_union_images]
    exact ENNReal.add_lt_top.mpr
      ⟨measure_spanningSets_lt_top μ₁ n, measure_spanningSets_lt_top μ₂ n⟩
  · ext z
    simp only [Set.mem_iUnion, Set.mem_univ, iff_true]
    cases z with
    | inl x =>
      obtain ⟨n, hn⟩ := Set.iUnion_eq_univ_iff.mp (iUnion_spanningSets μ₁) x
      exact ⟨n, Or.inl ⟨x, hn, rfl⟩⟩
    | inr y =>
      obtain ⟨n, hn⟩ := Set.iUnion_eq_univ_iff.mp (iUnion_spanningSets μ₂) y
      exact ⟨n, Or.inr ⟨y, hn, rfl⟩⟩

/-- Canonical embedding `Lp ℂ 2 μ₁ × Lp ℂ 2 μ₂ → Lp ℂ 2 (sumMeasure μ₁ μ₂)` gluing two one-particle
wavefunctions on the disjoint union `α₁ ⊕ α₂`. -/
noncomputable def sumLp {α₁ α₂ : Type*} [MeasurableSpace α₁] [MeasurableSpace α₂]
    (μ₁ : Measure α₁) (μ₂ : Measure α₂) (u : Lp ℂ 2 μ₁) (v : Lp ℂ 2 μ₂) :
    Lp ℂ 2 (sumMeasure μ₁ μ₂) :=
  (MomentumFockTensor.sumElim_memLp μ₁ μ₂ u v).toLp (Sum.elim (u : α₁ → ℂ) (v : α₂ → ℂ))

/-- Pointwise a.e. characterization of `sumLp`. -/
theorem sumLp_ae {α₁ α₂ : Type*} [MeasurableSpace α₁] [MeasurableSpace α₂]
    (μ₁ : Measure α₁) (μ₂ : Measure α₂) (u : Lp ℂ 2 μ₁) (v : Lp ℂ 2 μ₂) :
    (sumLp μ₁ μ₂ u v : α₁ ⊕ α₂ → ℂ) =ᵐ[sumMeasure μ₁ μ₂] Sum.elim (u : α₁ → ℂ) (v : α₂ → ℂ) :=
  (MomentumFockTensor.sumElim_memLp μ₁ μ₂ u v).coeFn_toLp

/-- Orthogonal direct-sum inner-product identity on `Lp ℂ 2 (sumMeasure μ₁ μ₂)`:
`⟪sumLp u₁ v₁, sumLp u₂ v₂⟫ = ⟪u₁, u₂⟫ + ⟪v₁, v₂⟫`. -/
theorem sumLp_inner {α₁ α₂ : Type*} [MeasurableSpace α₁] [MeasurableSpace α₂]
    (μ₁ : Measure α₁) (μ₂ : Measure α₂)
    (u₁ u₂ : Lp ℂ 2 μ₁) (v₁ v₂ : Lp ℂ 2 μ₂) :
    inner ℂ (sumLp μ₁ μ₂ u₁ v₁) (sumLp μ₁ μ₂ u₂ v₂) =
      inner ℂ u₁ u₂ + inner ℂ v₁ v₂ := by
  rw [L2.inner_def, L2.inner_def u₁ u₂, L2.inner_def v₁ v₂]
  have hf_eq : (fun z : α₁ ⊕ α₂ ↦ inner ℂ ((sumLp μ₁ μ₂ u₁ v₁) z) ((sumLp μ₁ μ₂ u₂ v₂) z))
      =ᵐ[sumMeasure μ₁ μ₂]
      (fun z : α₁ ⊕ α₂ ↦ inner ℂ (Sum.elim (u₁ : α₁ → ℂ) (v₁ : α₂ → ℂ) z)
        (Sum.elim (u₂ : α₁ → ℂ) (v₂ : α₂ → ℂ) z)) := by
    filter_upwards [sumLp_ae μ₁ μ₂ u₁ v₁, sumLp_ae μ₁ μ₂ u₂ v₂] with z h1 h2
    rw [h1, h2]
  rw [integral_congr_ae hf_eq]
  have hint : Integrable (fun z : α₁ ⊕ α₂ ↦
      inner ℂ (Sum.elim (u₁ : α₁ → ℂ) (v₁ : α₂ → ℂ) z)
        (Sum.elim (u₂ : α₁ → ℂ) (v₂ : α₂ → ℂ) z)) (sumMeasure μ₁ μ₂) :=
    (L2.integrable_inner (𝕜 := ℂ) (sumLp μ₁ μ₂ u₁ v₁) (sumLp μ₁ μ₂ u₂ v₂)).congr hf_eq
  have hmeas_in : Measurable (fun z : α₁ ⊕ α₂ ↦
      inner ℂ (Sum.elim (u₁ : α₁ → ℂ) (v₁ : α₂ → ℂ) z)
        (Sum.elim (u₂ : α₁ → ℂ) (v₂ : α₂ → ℂ) z)) := by
    have hm1 : Measurable (Sum.elim (u₁ : α₁ → ℂ) (v₁ : α₂ → ℂ)) :=
      (Lp.stronglyMeasurable u₁).measurable.sumElim (Lp.stronglyMeasurable v₁).measurable
    have hm2 : Measurable (Sum.elim (u₂ : α₁ → ℂ) (v₂ : α₂ → ℂ)) :=
      (Lp.stronglyMeasurable u₂).measurable.sumElim (Lp.stronglyMeasurable v₂).measurable
    exact hm1.inner hm2
  unfold sumMeasure at hint ⊢
  rw [integral_add_measure (hint.mono_measure (Measure.le_add_right le_rfl))
    (hint.mono_measure (Measure.le_add_left le_rfl)),
    integral_map measurable_inl.aemeasurable hmeas_in.aestronglyMeasurable,
    integral_map measurable_inr.aemeasurable hmeas_in.aestronglyMeasurable]
  rfl

/-- `sumLp` sends `(0, 0)` to `0`. -/
theorem sumLp_zero {α₁ α₂ : Type*} [MeasurableSpace α₁] [MeasurableSpace α₂]
    (μ₁ : Measure α₁) (μ₂ : Measure α₂) :
    sumLp μ₁ μ₂ 0 0 = 0 := by
  apply (inner_self_eq_zero (𝕜 := ℂ)).mp
  rw [sumLp_inner]
  simp

/-- Surjectivity of `(u, v) ↦ sumLp μ₁ μ₂ u v` onto `Lp ℂ 2 (sumMeasure μ₁ μ₂)`. -/
theorem sumLp_surjective {α₁ α₂ : Type*} [MeasurableSpace α₁] [MeasurableSpace α₂]
    (μ₁ : Measure α₁) (μ₂ : Measure α₂) :
    Function.Surjective (fun p : Lp ℂ 2 μ₁ × Lp ℂ 2 μ₂ ↦ sumLp μ₁ μ₂ p.1 p.2) := by
  intro w
  let hu := MomentumFockTensor.comp_inl_memLp μ₁ μ₂ w
  let hv := MomentumFockTensor.comp_inr_memLp μ₁ μ₂ w
  refine ⟨(hu.toLp _, hv.toLp _), ?_⟩
  apply Lp.ext
  refine (sumLp_ae μ₁ μ₂ (hu.toLp _) (hv.toLp _)).trans ?_
  unfold sumMeasure
  rw [Filter.EventuallyEq, ae_add_measure_iff]
  have h1 : ∀ᵐ z ∂(μ₁.map Sum.inl),
      Sum.elim ((hu.toLp _ : Lp ℂ 2 μ₁) : α₁ → ℂ) ((hv.toLp _ : Lp ℂ 2 μ₂) : α₂ → ℂ) z = w z := by
    have hm_set : MeasurableSet {z : α₁ ⊕ α₂ |
        Sum.elim ((hu.toLp _ : Lp ℂ 2 μ₁) : α₁ → ℂ) ((hv.toLp _ : Lp ℂ 2 μ₂) : α₂ → ℂ) z = w z} :=
      measurableSet_eq_fun
        ((Lp.stronglyMeasurable (hu.toLp _)).measurable.sumElim
          (Lp.stronglyMeasurable (hv.toLp _)).measurable)
        (Lp.stronglyMeasurable w).measurable
    rw [ae_map_iff measurable_inl.aemeasurable hm_set]
    exact hu.coeFn_toLp
  have h2 : ∀ᵐ z ∂(μ₂.map Sum.inr),
      Sum.elim ((hu.toLp _ : Lp ℂ 2 μ₁) : α₁ → ℂ) ((hv.toLp _ : Lp ℂ 2 μ₂) : α₂ → ℂ) z = w z := by
    have hm_set : MeasurableSet {z : α₁ ⊕ α₂ |
        Sum.elim ((hu.toLp _ : Lp ℂ 2 μ₁) : α₁ → ℂ) ((hv.toLp _ : Lp ℂ 2 μ₂) : α₂ → ℂ) z = w z} :=
      measurableSet_eq_fun
        ((Lp.stronglyMeasurable (hu.toLp _)).measurable.sumElim
          (Lp.stronglyMeasurable (hv.toLp _)).measurable)
        (Lp.stronglyMeasurable w).measurable
    rw [ae_map_iff measurable_inr.aemeasurable hm_set]
    exact hv.coeFn_toLp
  exact ⟨h1, h2⟩

/-- Pure tensors `{coherentVec μ₁ u ⊗ₜ coherentVec μ₂ v}` span densely in the completed Hilbert
tensor product `Completion (momentumFock μ₁ ⊗[ℂ] momentumFock μ₂)`. -/
theorem momentumFock_product_coherent_dense {α₁ α₂ : Type*}
    [MeasurableSpace α₁] [MeasurableSpace α₂]
    (μ₁ : Measure α₁) (μ₂ : Measure α₂) [SigmaFinite μ₁] [SigmaFinite μ₂] :
    Dense (Submodule.span ℂ (Set.range (fun p : Lp ℂ 2 μ₁ × Lp ℂ 2 μ₂ ↦
        ProductL2.tensorPure (coherentVec μ₁ p.1) (coherentVec μ₂ p.2))) :
      Set (Completion (momentumFock μ₁ ⊗[ℂ] momentumFock μ₂))) :=
  pure_labels_total (coherentVec μ₁) (coherentVec μ₂)
    (Submodule.dense_iff_topologicalClosure_eq_top.mpr (coherentVec_dense μ₁))
    (Submodule.dense_iff_topologicalClosure_eq_top.mpr (coherentVec_dense μ₂))

/-- Concrete §3.4 Fock tensor-product equivalence directly on continuous `momentumFock`:
for any `SigmaFinite` measures `μ₁, μ₂`, there exists a UNIQUE linear isometry equivalence
`U : Completion (momentumFock μ₁ ⊗[ℂ] momentumFock μ₂) ≃ₗᵢ[ℂ] momentumFock (sumMeasure μ₁ μ₂)`
sending `coherentVec μ₁ u ⊗ₜ coherentVec μ₂ v ↦ coherentVec (sumMeasure μ₁ μ₂) (sumLp μ₁ μ₂ u v)`
for all `u ∈ L²(μ₁)`, `v ∈ L²(μ₂)`. -/
theorem momentumFock_tensor_unique {α₁ α₂ : Type*}
    [MeasurableSpace α₁] [MeasurableSpace α₂]
    (μ₁ : Measure α₁) (μ₂ : Measure α₂) [SigmaFinite μ₁] [SigmaFinite μ₂] :
    ∃! U : Completion (momentumFock μ₁ ⊗[ℂ] momentumFock μ₂) ≃ₗᵢ[ℂ]
        momentumFock (sumMeasure μ₁ μ₂),
      ∀ (u : Lp ℂ 2 μ₁) (v : Lp ℂ 2 μ₂),
        U (ProductL2.tensorPure (coherentVec μ₁ u) (coherentVec μ₂ v)) =
          coherentVec (sumMeasure μ₁ μ₂) (sumLp μ₁ μ₂ u v) := by
  let c : Lp ℂ 2 μ₁ × Lp ℂ 2 μ₂ → momentumFock (sumMeasure μ₁ μ₂) :=
    fun p ↦ coherentVec (sumMeasure μ₁ μ₂) (sumLp μ₁ μ₂ p.1 p.2)
  have hrange : Set.range c = Set.range (coherentVec (sumMeasure μ₁ μ₂)) := by
    have hcomp : c = (coherentVec (sumMeasure μ₁ μ₂)) ∘
        (fun p : Lp ℂ 2 μ₁ × Lp ℂ 2 μ₂ ↦ sumLp μ₁ μ₂ p.1 p.2) := rfl
    rw [hcomp, Set.range_comp, (sumLp_surjective μ₁ μ₂).range_eq, Set.image_univ]
  have hc : Dense (Submodule.span ℂ (Set.range c) : Set (momentumFock (sumMeasure μ₁ μ₂))) := by
    rw [hrange]
    exact Submodule.dense_iff_topologicalClosure_eq_top.mpr
      (coherentVec_dense (sumMeasure μ₁ μ₂))
  have hg : ∀ p q : Lp ℂ 2 μ₁ × Lp ℂ 2 μ₂,
      inner ℂ (c p) (c q) =
        inner ℂ (coherentVec μ₁ p.1) (coherentVec μ₁ q.1) *
          inner ℂ (coherentVec μ₂ p.2) (coherentVec μ₂ q.2) := fun p q ↦ by
    dsimp only [c]
    rw [coherentVec_gram, coherentVec_gram, coherentVec_gram, sumLp_inner, Complex.exp_add]
  have : ∀ n : ℕ, CompleteSpace ↥(momentumSector (sumMeasure μ₁ μ₂) n) :=
    fun n ↦ (Submodule.isClosed_topologicalClosure _).completeSpace_coe
  have : CompleteSpace (momentumFock (sumMeasure μ₁ μ₂)) := inferInstance
  let hU_ex := @hilbertTensor_product_unique
    (Lp ℂ 2 μ₁) (Lp ℂ 2 μ₂) (momentumFock μ₁) (momentumFock μ₂) (momentumFock (sumMeasure μ₁ μ₂))
    _ _ _ _ _ _ this
    (coherentVec μ₁) (coherentVec μ₂) c
    (Submodule.dense_iff_topologicalClosure_eq_top.mpr (coherentVec_dense μ₁))
    (Submodule.dense_iff_topologicalClosure_eq_top.mpr (coherentVec_dense μ₂))
    hc hg
  obtain ⟨U, hU, huniq⟩ := hU_ex
  exact ⟨U, fun u v ↦ hU (u, v), fun V hV ↦ huniq V fun p ↦ hV p.1 p.2⟩

/-- The canonical unitary equivalence
`Completion (momentumFock μ₁ ⊗[ℂ] momentumFock μ₂) ≃ₗᵢ[ℂ] momentumFock (sumMeasure μ₁ μ₂)`. -/
noncomputable def momentumFockTensorEquiv {α₁ α₂ : Type*}
    [MeasurableSpace α₁] [MeasurableSpace α₂]
    (μ₁ : Measure α₁) (μ₂ : Measure α₂) [SigmaFinite μ₁] [SigmaFinite μ₂] :
    Completion (momentumFock μ₁ ⊗[ℂ] momentumFock μ₂) ≃ₗᵢ[ℂ] momentumFock (sumMeasure μ₁ μ₂) :=
  (momentumFock_tensor_unique μ₁ μ₂).exists.choose

/-- Action of `momentumFockTensorEquiv` on pure coherent tensors. -/
theorem momentumFockTensorEquiv_coherent {α₁ α₂ : Type*}
    [MeasurableSpace α₁] [MeasurableSpace α₂]
    (μ₁ : Measure α₁) (μ₂ : Measure α₂) [SigmaFinite μ₁] [SigmaFinite μ₂]
    (u : Lp ℂ 2 μ₁) (v : Lp ℂ 2 μ₂) :
    momentumFockTensorEquiv μ₁ μ₂ (ProductL2.tensorPure (coherentVec μ₁ u) (coherentVec μ₂ v)) =
      coherentVec (sumMeasure μ₁ μ₂) (sumLp μ₁ μ₂ u v) :=
  (momentumFock_tensor_unique μ₁ μ₂).exists.choose_spec u v

/-- Vacuum factorization: `momentumFockTensorEquiv` sends `Ω₁ ⊗ₜ Ω₂` to `Ω₁₂`. -/
theorem momentumFockTensorEquiv_vacuum {α₁ α₂ : Type*}
    [MeasurableSpace α₁] [MeasurableSpace α₂]
    (μ₁ : Measure α₁) (μ₂ : Measure α₂) [SigmaFinite μ₁] [SigmaFinite μ₂] :
    momentumFockTensorEquiv μ₁ μ₂ (ProductL2.tensorPure (fockVacuum μ₁) (fockVacuum μ₂)) =
      fockVacuum (sumMeasure μ₁ μ₂) := by
  unfold fockVacuum
  rw [momentumFockTensorEquiv_coherent, sumLp_zero]

/-- Unitary time-evolution factorization across the Fock tensor equivalence:
`U (U₁(t) E(u) ⊗ₜ U₂(t) E(v)) = U₁₂(t) U (E(u) ⊗ₜ E(v))` for `ω₁₂ = Sum.elim ω₁ ω₂`. -/
theorem momentumFockTensorEquiv_fockUnitary {α₁ α₂ : Type*}
    [MeasurableSpace α₁] [MeasurableSpace α₂]
    (μ₁ : Measure α₁) (μ₂ : Measure α₂) [SigmaFinite μ₁] [SigmaFinite μ₂]
    (ω₁ : α₁ → ℝ) (hω₁ : Measurable ω₁) (ω₂ : α₂ → ℝ) (hω₂ : Measurable ω₂)
    (t : ℝ) (u : Lp ℂ 2 μ₁) (v : Lp ℂ 2 μ₂) :
    momentumFockTensorEquiv μ₁ μ₂
        (ProductL2.tensorPure
          (fockUnitary μ₁ ω₁ hω₁ t (coherentVec μ₁ u))
          (fockUnitary μ₂ ω₂ hω₂ t (coherentVec μ₂ v))) =
      fockUnitary (sumMeasure μ₁ μ₂) (Sum.elim ω₁ ω₂) (hω₁.sumElim hω₂) t
        (momentumFockTensorEquiv μ₁ μ₂
          (ProductL2.tensorPure (coherentVec μ₁ u) (coherentVec μ₂ v))) := by
  have hL1 := fockUnitary_coherent μ₁ ω₁ hω₁ t u
  have hL2 := fockUnitary_coherent μ₂ ω₂ hω₂ t v
  have hR := fockUnitary_coherent (sumMeasure μ₁ μ₂) (Sum.elim ω₁ ω₂) (hω₁.sumElim hω₂) t
    (sumLp μ₁ μ₂ u v)
  have h1p : sumLp μ₁ μ₂ (oneParticleUnitary μ₁ ω₁ hω₁ t u) (oneParticleUnitary μ₂ ω₂ hω₂ t v) =
      oneParticleUnitary (sumMeasure μ₁ μ₂) (Sum.elim ω₁ ω₂) (hω₁.sumElim hω₂) t
        (sumLp μ₁ μ₂ u v) := by
    apply Lp.ext
    refine (sumLp_ae μ₁ μ₂ _ _).trans ?_
    refine Filter.EventuallyEq.trans ?_
      (FeatureDensity.complexMultiplier_apply_ae
        (MomentumFock.unitaryWeight (Sum.elim ω₁ ω₂) t)
        (MomentumFock.unitaryWeight_memLp (sumMeasure μ₁ μ₂) (Sum.elim ω₁ ω₂)
          (hω₁.sumElim hω₂) t)
        (sumLp μ₁ μ₂ u v)).symm
    have hae_sum := sumLp_ae μ₁ μ₂ u v
    unfold sumMeasure at hae_sum ⊢
    rw [Filter.EventuallyEq, ae_add_measure_iff]
    have h1 : ∀ᵐ z ∂(μ₁.map Sum.inl),
        Sum.elim ((oneParticleUnitary μ₁ ω₁ hω₁ t u : Lp ℂ 2 μ₁) : α₁ → ℂ)
          ((oneParticleUnitary μ₂ ω₂ hω₂ t v : Lp ℂ 2 μ₂) : α₂ → ℂ) z =
        MomentumFock.unitaryWeight (Sum.elim ω₁ ω₂) t z * (sumLp μ₁ μ₂ u v) z := by
      have h1_u := FeatureDensity.complexMultiplier_apply_ae
        (MomentumFock.unitaryWeight ω₁ t) (MomentumFock.unitaryWeight_memLp μ₁ ω₁ hω₁ t) u
      have h1_s : ∀ᵐ x ∂μ₁, (sumLp μ₁ μ₂ u v) (Sum.inl x) = u x := by
        have hm_set : MeasurableSet {z : α₁ ⊕ α₂ |
            (sumLp μ₁ μ₂ u v : α₁ ⊕ α₂ → ℂ) z = Sum.elim (u : α₁ → ℂ) (v : α₂ → ℂ) z} :=
          measurableSet_eq_fun (Lp.stronglyMeasurable (sumLp μ₁ μ₂ u v)).measurable
            ((Lp.stronglyMeasurable u).measurable.sumElim (Lp.stronglyMeasurable v).measurable)
        exact (ae_map_iff measurable_inl.aemeasurable hm_set).mp (ae_add_measure_iff.mp hae_sum).1
      have hm_eq : MeasurableSet {z : α₁ ⊕ α₂ |
          Sum.elim ((oneParticleUnitary μ₁ ω₁ hω₁ t u : Lp ℂ 2 μ₁) : α₁ → ℂ)
            ((oneParticleUnitary μ₂ ω₂ hω₂ t v : Lp ℂ 2 μ₂) : α₂ → ℂ) z =
          MomentumFock.unitaryWeight (Sum.elim ω₁ ω₂) t z * (sumLp μ₁ μ₂ u v) z} :=
        measurableSet_eq_fun
          ((Lp.stronglyMeasurable (oneParticleUnitary μ₁ ω₁ hω₁ t u)).measurable.sumElim
            (Lp.stronglyMeasurable (oneParticleUnitary μ₂ ω₂ hω₂ t v)).measurable)
          ((MomentumFock.unitaryWeight_measurable (Sum.elim ω₁ ω₂) (hω₁.sumElim hω₂) t).mul
            (Lp.stronglyMeasurable (sumLp μ₁ μ₂ u v)).measurable)
      rw [ae_map_iff measurable_inl.aemeasurable hm_eq]
      filter_upwards [h1_u, h1_s] with x hx1 hx2
      dsimp only [Set.mem_ofPred_eq, Sum.elim_inl, MomentumFock.unitaryWeight]
      rw [hx2]
      exact hx1
    have h2 : ∀ᵐ z ∂(μ₂.map Sum.inr),
        Sum.elim ((oneParticleUnitary μ₁ ω₁ hω₁ t u : Lp ℂ 2 μ₁) : α₁ → ℂ)
          ((oneParticleUnitary μ₂ ω₂ hω₂ t v : Lp ℂ 2 μ₂) : α₂ → ℂ) z =
        MomentumFock.unitaryWeight (Sum.elim ω₁ ω₂) t z * (sumLp μ₁ μ₂ u v) z := by
      have h2_v := FeatureDensity.complexMultiplier_apply_ae
        (MomentumFock.unitaryWeight ω₂ t) (MomentumFock.unitaryWeight_memLp μ₂ ω₂ hω₂ t) v
      have h2_s : ∀ᵐ y ∂μ₂, (sumLp μ₁ μ₂ u v) (Sum.inr y) = v y := by
        have hm_set : MeasurableSet {z : α₁ ⊕ α₂ |
            (sumLp μ₁ μ₂ u v : α₁ ⊕ α₂ → ℂ) z = Sum.elim (u : α₁ → ℂ) (v : α₂ → ℂ) z} :=
          measurableSet_eq_fun (Lp.stronglyMeasurable (sumLp μ₁ μ₂ u v)).measurable
            ((Lp.stronglyMeasurable u).measurable.sumElim (Lp.stronglyMeasurable v).measurable)
        exact (ae_map_iff measurable_inr.aemeasurable hm_set).mp (ae_add_measure_iff.mp hae_sum).2
      have hm_eq : MeasurableSet {z : α₁ ⊕ α₂ |
          Sum.elim ((oneParticleUnitary μ₁ ω₁ hω₁ t u : Lp ℂ 2 μ₁) : α₁ → ℂ)
            ((oneParticleUnitary μ₂ ω₂ hω₂ t v : Lp ℂ 2 μ₂) : α₂ → ℂ) z =
          MomentumFock.unitaryWeight (Sum.elim ω₁ ω₂) t z * (sumLp μ₁ μ₂ u v) z} :=
        measurableSet_eq_fun
          ((Lp.stronglyMeasurable (oneParticleUnitary μ₁ ω₁ hω₁ t u)).measurable.sumElim
            (Lp.stronglyMeasurable (oneParticleUnitary μ₂ ω₂ hω₂ t v)).measurable)
          ((MomentumFock.unitaryWeight_measurable (Sum.elim ω₁ ω₂) (hω₁.sumElim hω₂) t).mul
            (Lp.stronglyMeasurable (sumLp μ₁ μ₂ u v)).measurable)
      rw [ae_map_iff measurable_inr.aemeasurable hm_eq]
      filter_upwards [h2_v, h2_s] with y hy1 hy2
      dsimp only [Set.mem_ofPred_eq, Sum.elim_inr, MomentumFock.unitaryWeight]
      rw [hy2]
      exact hy1
    exact ⟨h1, h2⟩
  exact
    (congrArg (momentumFockTensorEquiv μ₁ μ₂) (congrArg₂ ProductL2.tensorPure hL1 hL2)).trans <|
    (momentumFockTensorEquiv_coherent μ₁ μ₂ _ _).trans <|
    (congrArg (coherentVec (sumMeasure μ₁ μ₂)) h1p).trans <|
    hR.symm.trans <|
    congrArg (fockUnitary (sumMeasure μ₁ μ₂) (Sum.elim ω₁ ω₂) (hω₁.sumElim hω₂) t)
      (momentumFockTensorEquiv_coherent μ₁ μ₂ u v).symm

end MomentumFockTensor

/-!
==============================================================================
  PART 9: BORN RULE & SELF-ADJOINT PVM OBSERVABLES (§3.5)
==============================================================================
-/
section Born

open Submodule Set Function
open scoped InnerProductSpace

universe u

section RaySymmetry

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]

private theorem unit_phase {a b : ℂ} (h : ‖a‖ = ‖b‖) : ∃ c : ℂ, ‖c‖ = 1 ∧ a = c * b :=
  if hb : b = 0 then ⟨1, norm_one, by simpa [hb] using h⟩
  else ⟨a / b, by rw [norm_div, h, div_self (norm_ne_zero_iff.mpr hb)], (div_mul_cancel₀ _ hb).symm⟩

private theorem rotate_subspace (K : Submodule ℂ H) [K.HasOrthogonalProjection] (c : ℂ) (hc : ‖c‖ = 1) :
    ∃ U : H ≃ₗᵢ[ℂ] H, ∀ x, U x = c • K.starProjection x + Kᗮ.starProjection x := by
  let g : H →ₗᵢ[ℂ] H :=
    { toLinearMap := c • K.starProjection.toLinearMap + Kᗮ.starProjection.toLinearMap
      norm_map' := fun x => by
        change ‖c • K.starProjection x + Kᗮ.starProjection x‖ = ‖x‖
        rw [← sq_eq_sq₀ (norm_nonneg _) (norm_nonneg _), pow_two,
          @norm_add_sq_eq_norm_sq_add_norm_sq_of_inner_eq_zero ℂ _ _ _ _
            (c • K.starProjection x) (Kᗮ.starProjection x)
            (K.inner_right_of_mem_orthogonal (K.smul_mem c (K.starProjection_apply_mem _))
              (Kᗮ.starProjection_apply_mem _)),
          norm_smul, hc, one_mul, ← pow_two, ← pow_two, ← K.norm_sq_eq_add_norm_sq_starProjection] }
  have hc' : c ≠ 0 := fun h => by simp [h] at hc
  refine ⟨LinearIsometryEquiv.ofSurjective g fun x => ⟨c⁻¹ • K.starProjection x + Kᗮ.starProjection x, ?_⟩, fun _ => rfl⟩
  change c • K.starProjection _ + Kᗮ.starProjection _ = x
  simp [Submodule.starProjection_eq_self_iff.mpr, K.starProjection_apply_mem, smul_smul, hc']

/-- Two equal-length vectors with equal overlap magnitudes lie on rays in the same
orbit under the unitary stabilizer of `ψ`. -/
theorem ray_orbit (ψ u v : H) (huv : ‖u‖ = ‖v‖)
    (h : ‖inner ℂ ψ u‖ = ‖inner ℂ ψ v‖) :
    ∃ (U : H ≃ₗᵢ[ℂ] H) (c : ℂ), ‖c‖ = 1 ∧ U ψ = ψ ∧ U u = c • v := by
  obtain ⟨c, hc, he⟩ := unit_phase h
  let y := c • v; let d := u - y; let K := ℂ ∙ d
  by_cases hd0 : d = 0
  · exact ⟨LinearIsometryEquiv.refl ℂ H, c, hc, rfl, sub_eq_zero.mp hd0⟩
  have hp : K.starProjection ψ = 0 := (starProjection_apply_eq_zero_iff K).mpr <|
    mem_orthogonal_singleton_iff_inner_left.mpr (by simp [d, y, inner_sub_right, inner_smul_right, he])
  have hq : Kᗮ.starProjection u = Kᗮ.starProjection y := sub_eq_zero.mp <|
    (map_sub _ _ _).symm.trans ((starProjection_apply_eq_zero_iff Kᗮ).mpr (K.le_orthogonal_orthogonal (mem_span_singleton_self _)))
  have hnp : ‖K.starProjection u‖ = ‖K.starProjection y‖ := by
    have h₁ := K.norm_sq_eq_add_norm_sq_starProjection u
    have h₂ := K.norm_sq_eq_add_norm_sq_starProjection y
    rw [show ‖u‖ = ‖y‖ by simp [y, norm_smul, hc, huv], hq] at h₁
    exact (sq_eq_sq₀ (norm_nonneg _) (norm_nonneg _)).mp (by linarith)
  obtain ⟨a, ha⟩ := mem_span_singleton.mp (K.starProjection_apply_mem u)
  obtain ⟨b, hb⟩ := mem_span_singleton.mp (K.starProjection_apply_mem y)
  rw [← ha, ← hb, norm_smul, norm_smul] at hnp
  obtain ⟨z, hz, hba⟩ := unit_phase (mul_right_cancel₀ (norm_ne_zero_iff.mpr hd0) hnp.symm)
  obtain ⟨U, hU⟩ := rotate_subspace K z hz
  refine ⟨U, c, hc, ?_, ?_⟩
  · rw [hU, hp, smul_zero, zero_add]
    simpa only [hp, zero_add] using K.starProjection_add_starProjection_orthogonal ψ
  · change U u = y
    rw [hU, ← ha, smul_smul, ← hba, hb, hq, starProjection_add_starProjection_orthogonal]

theorem ray_profile (ψ : H) (p : ClosedSubmodule ℂ H → ℝ)
    (hinv : ∀ (U : H ≃ₗᵢ[ℂ] H), U ψ = ψ → ∀ u, p (ray (U u)) = p (ray u))
    (hnull : ∀ u, inner ℂ ψ u = 0 → p (ray u) = 0) :
    ∃ f : ℝ → ℝ, ∀ u, p (ray u) = f (‖(ℂ ∙ u).starProjection ψ‖ ^ 2) := by
  let q (u : H) := ‖(ℂ ∙ u).starProjection ψ‖ ^ 2
  have zero (u) (h : q u = 0) : p (ray u) = 0 := hnull u <|
    mem_orthogonal_singleton_iff_inner_left.mp ((starProjection_apply_eq_zero_iff _).mp (norm_eq_zero.mp (sq_eq_zero_iff.mp h)))
  have unit (u : H) (hu : u ≠ 0) : ∃ x : H, ‖x‖ = 1 ∧ (ℂ ∙ x) = ℂ ∙ u ∧ ‖inner ℂ ψ x‖ ^ 2 = q u := by
    let x := ((‖u‖ : ℂ))⁻¹ • u
    have hn := norm_ne_zero_iff.mpr hu
    have h1 : ‖x‖ = 1 := by simp [x, norm_smul, Complex.norm_real, hn]
    have hspan : ℂ ∙ x = ℂ ∙ u := span_singleton_smul_eq (inv_ne_zero (Complex.ofReal_ne_zero.mpr hn)).isUnit u
    refine ⟨x, h1, hspan, ?_⟩
    dsimp only [q]
    have same (A B : Submodule ℂ H) [A.HasOrthogonalProjection] [B.HasOrthogonalProjection]
        (hAB : A = B) : A.starProjection = B.starProjection := by subst B; rfl
    rw [← same _ _ hspan, starProjection_singleton, h1, one_pow, RCLike.ofReal_one, div_one,
      norm_smul, h1, mul_one, norm_inner_symm]
  obtain ⟨f, hf⟩ := (Function.factorsThrough_iff _).mp (show (fun u ↦ p (ray u)).FactorsThrough q from fun u v h => by
    by_cases hz : q u = 0
    · exact (zero u hz).trans (zero v (h.symm.trans hz)).symm
    obtain ⟨x, hx, hux, hs⟩ := unit u (by rintro rfl; simp [q] at hz)
    obtain ⟨y, hy, hvy, ht⟩ := unit v (by rintro rfl; exact hz (h.trans (by simp [q])))
    obtain ⟨U, c, hc, hψ, hU⟩ := ray_orbit ψ x y (hx.trans hy.symm)
      ((sq_eq_sq₀ (norm_nonneg _) (norm_nonneg _)).mp (hs.trans (h.trans ht.symm)))
    have hc' : c ≠ 0 := fun h0 => by simp [h0] at hc
    have hxy := hinv U hψ x; rw [hU] at hxy
    have eq₁ : ray x = ray u := ClosedSubmodule.toSubmodule_injective hux
    have eq₂ : ray (c • y) = ray v :=
      ClosedSubmodule.toSubmodule_injective ((span_singleton_smul_eq hc'.isUnit y).trans hvy)
    simpa only [eq₁, eq₂] using hxy.symm)
  exact ⟨f, congrFun hf⟩

end RaySymmetry

section PerpendicularEvents

variable {H : Type u} [NormedAddCommGroup H] [InnerProductSpace ℂ H]

/-- Countable additivity on pairwise orthogonal closed events. -/
def CountablyAdditive (p : ClosedSubmodule ℂ H → ℝ) : Prop :=
  ∀ (ι : Type u) [Countable ι] (A : ι → ClosedSubmodule ℂ H),
    (∀ i j, i ≠ j → A j ≤ (A i)ᗮ) → HasSum (fun i => p (A i)) (p (⨆ i, A i))

theorem binary_of_countable {p : ClosedSubmodule ℂ H → ℝ} (hσ : CountablyAdditive p)
    (A B : ClosedSubmodule ℂ H) (h : B ≤ Aᗮ) : p (A ⊔ B) = p A + p B := by
  let R (i : ULift.{u} Bool) := cond i.down A B
  have h' : A ≤ Bᗮ := (ClosedSubmodule.orthogonal_gc ℂ H _ _).mp h
  have hs := (hσ _ R fun i j hne => by obtain ⟨_ | _⟩ := i <;> obtain ⟨_ | _⟩ := j <;> simp_all [R]).tsum_eq
  rw [← (Equiv.ulift.symm : Bool ≃ ULift.{u} Bool).tsum_eq, tsum_fintype, Fintype.sum_bool] at hs
  simpa [R, iSup_ulift, iSup_bool_eq] using hs.symm

private theorem orthonormal_countable {ι V : Type*} [NormedAddCommGroup V]
    [InnerProductSpace ℂ V] [TopologicalSpace.SeparableSpace V] (b : ι → V) (h : Orthonormal ℂ b) :
    Countable ι :=
  (show Pairwise (Disjoint on fun i : ι => Metric.ball (b i) (1 / 2)) from fun i j hij =>
    Metric.ball_disjoint_ball <| by
      have e := norm_sub_sq (𝕜 := ℂ) (b i) (b j)
      rw [h.1 i, h.1 j, h.2 hij] at e; simp at e; rw [dist_eq_norm]; nlinarith [norm_nonneg (b i - b j)]).countable_of_isOpen_disjoint
    (fun _ => Metric.isOpen_ball) (fun _ => Metric.nonempty_ball.mpr (by norm_num))

theorem hasSum_basis_weights [SecondCountableTopology H]
    {p : ClosedSubmodule ℂ H → ℝ} (hσ : CountablyAdditive p)
    (K : ClosedSubmodule ℂ H) {ι : Type u} (b : HilbertBasis ι ℂ K) :
    HasSum (fun i => p (ray (b i : H))) (p K) := by
  have := orthonormal_countable b b.orthonormal
  let R (i : ι) := ray (b i : H)
  have hsup : (⨆ i, R i) = K := le_antisymm
    (iSup_le fun i => (Submodule.span_singleton_le_iff_mem _ _).mpr (b i).property) fun x hx =>
      (⨆ i, R i).isClosed.mem_of_tendsto ((b.hasSum_repr ⟨x, hx⟩).mapL K.toSubmodule.subtypeL)
        (Filter.Eventually.of_forall fun s => Submodule.sum_mem _ fun i _ =>
          (⨆ i, R i).smul_mem _ ((le_iSup R i) (Submodule.mem_span_singleton_self _)))
  simpa only [hsup] using hσ ι R fun i j hij =>
    (Submodule.span_singleton_le_iff_mem _ _).mpr (Submodule.mem_orthogonal_singleton_iff_inner_right.mpr (b.orthonormal.2 hij))

/-- In infinite dimension, countable additivity forces every event orthogonal to `ψ`
to have probability zero. -/
theorem perpendicular_null [CompleteSpace H] [SecondCountableTopology H]
    (hinf : ¬FiniteDimensional ℂ H) (ψ : H) (p : ClosedSubmodule ℂ H → ℝ)
    (hσ : CountablyAdditive p) (w : ℝ)
    (hw : ∀ v : H, ‖v‖ = 1 → inner ℂ ψ v = 0 → p (ray v) = w) :
    ∀ K : ClosedSubmodule ℂ H, K ≤ (ray ψ)ᗮ → p K = 0 := by
  let R := (ray ψ)ᗮ
  obtain ⟨ι, b, _⟩ := exists_hilbertBasis ℂ R
  have hI : Infinite ι := by
    by_contra! hfinite; let := Fintype.ofFinite ι
    have : FiniteDimensional ℂ (ℂ ∙ ψ)ᗮ := Module.Finite.of_basis b.toOrthonormalBasis.toBasis
    have htop : FiniteDimensional ℂ ((ℂ ∙ ψ) ⊔ (ℂ ∙ ψ)ᗮ : Submodule ℂ H) := inferInstance
    rw [(ℂ ∙ ψ).sup_orthogonal_of_hasOrthogonalProjection] at htop
    exact hinf (Module.Finite.equiv Submodule.topEquiv)
  have hv {K : ClosedSubmodule ℂ H} (hk : K ≤ R) {J : Type u} (c : HilbertBasis J ℂ K) (j : J) :
      p (ray (c j : H)) = w := hw _ (c.orthonormal.1 j)
        (Submodule.mem_orthogonal_singleton_iff_inner_right.mp (hk (c j).property))
  have hs := (hasSum_basis_weights hσ R b).summable
  simp_rw [hv (le_refl R) b] at hs
  have hz : w = 0 := by simpa only [summable_const_iff] using hs
  intro K hk
  obtain ⟨J, c, _⟩ := exists_hilbertBasis ℂ K
  have hj := hasSum_basis_weights hσ K c
  simp_rw [hv hk c, hz] at hj
  exact hj.unique hasSum_zero

end PerpendicularEvents

section BornDetermination

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]

theorem realize_pair (e : Fin 3 → H) (he : Orthonormal ℂ e) {x y : ℝ}
    (hx : 0 ≤ x) (hy : 0 ≤ y) (hxy : x + y ≤ 1) :
    ∃ u v : H, ‖u‖ = 1 ∧ ‖v‖ = 1 ∧ inner ℂ u v = 0 ∧
      ‖(ℂ ∙ u).starProjection (e 0)‖ ^ 2 = x ∧
      ‖(ℂ ∙ v).starProjection (e 0)‖ ^ 2 = y := by
  let a := Real.sqrt x; let b := Real.sqrt (1 - x)
  let c := Real.sqrt (y / (1 - x)); let d := Real.sqrt (1 - y / (1 - x))
  have hr : y / (1 - x) ≤ 1 := by
    rcases eq_or_lt_of_le (show x ≤ 1 by linarith) with rfl | h
    · simp
    · exact (div_le_one (by linarith)).2 (by linarith)
  have ha : a ^ 2 = x := Real.sq_sqrt hx
  have hb : b ^ 2 = 1 - x := Real.sq_sqrt (by linarith)
  have hc : c ^ 2 = y / (1 - x) := Real.sq_sqrt (div_nonneg hy (by linarith))
  have hd : d ^ 2 = 1 - y / (1 - x) := Real.sq_sqrt (by linarith)
  have hab : (a : ℂ) ^ 2 + (b : ℂ) ^ 2 = 1 := by exact_mod_cast (by linarith : a ^ 2 + b ^ 2 = 1)
  have hcd : (c : ℂ) ^ 2 + (d : ℂ) ^ 2 = 1 := by exact_mod_cast (by linarith : c ^ 2 + d ^ 2 = 1)
  have hbc : (c * b) ^ 2 = y := by
    rw [mul_pow, hb, hc]; rcases eq_or_lt_of_le (show x ≤ 1 by linarith) with rfl | h
    · simp; linarith
    · exact div_mul_cancel₀ _ (by linarith)
  let u := (a : ℂ) • e 0 + (b : ℂ) • e 1
  let v := (c : ℂ) • ((b : ℂ) • e 0 - (a : ℂ) • e 1) + (d : ℂ) • e 2
  have gram := orthonormal_iff_ite.mp he
  have data : inner ℂ u v = 0 ∧ inner ℂ u u = 1 ∧ inner ℂ v v = 1 ∧
      inner ℂ u (e 0) = (a : ℂ) ∧ inner ℂ v (e 0) = ((c * b : ℝ) : ℂ) := by
    refine ⟨?_, ?_, ?_, ?_, ?_⟩ <;>
      simp only [u, v, inner_smul_left, inner_smul_right, inner_add_left,
        inner_add_right, inner_sub_left, inner_sub_right, gram] <;> norm_num
    · right; ring
    · linear_combination hab
    · linear_combination (c : ℂ) ^ 2 * hab + hcd
  obtain ⟨huv, huu, hvv, huo, hvo⟩ := data
  have hnu : ‖u‖ ^ 2 = 1 := by rw [norm_sq_eq_re_inner (𝕜 := ℂ), huu]; rfl
  have hnv : ‖v‖ ^ 2 = 1 := by rw [norm_sq_eq_re_inner (𝕜 := ℂ), hvv]; rfl
  exact ⟨u, v, by nlinarith [norm_nonneg u], by nlinarith [norm_nonneg v], huv,
    by simpa [he.1 0, hnu, huo, Complex.norm_real, Real.norm_eq_abs, sq_abs, ha] using ray_fraction u (e 0),
    by simpa only [he.1 0, one_pow, div_one, hnv, mul_one, hvo, Complex.norm_real,
      Real.norm_eq_abs, sq_abs, hbc] using ray_fraction v (e 0)⟩

theorem orthogonal_join [CompleteSpace H] (A B : ClosedSubmodule ℂ H) (h : B ≤ Aᗮ) (ψ : H) :
    ‖(A ⊔ B).toSubmodule.starProjection ψ‖ ^ 2 =
      ‖A.toSubmodule.starProjection ψ‖ ^ 2 + ‖B.toSubmodule.starProjection ψ‖ ^ 2 := by
  let a := A.toSubmodule.starProjection ψ; let b := B.toSubmodule.starProjection ψ
  have ha := A.toSubmodule.starProjection_apply_mem ψ; have hb := B.toSubmodule.starProjection_apply_mem ψ
  have h' : A ≤ Bᗮ := (ClosedSubmodule.orthogonal_gc ℂ H _ _).mp h
  have hp : (A ⊔ B).toSubmodule.starProjection ψ = a + b := eq_starProjection_of_mem_orthogonal
    ((A ⊔ B).add_mem ((show A ≤ A ⊔ B from le_sup_left) ha) ((show B ≤ A ⊔ B from le_sup_right) hb)) <| by
      change ψ - (a + b) ∈ (A ⊔ B)ᗮ; rw [← ClosedSubmodule.inf_orthogonal]
      exact ⟨by rw [← sub_sub]; exact Aᗮ.sub_mem (A.toSubmodule.sub_starProjection_mem_orthogonal _) (h hb),
        by rw [add_comm a b, ← sub_sub]; exact Bᗮ.sub_mem (B.toSubmodule.sub_starProjection_mem_orthogonal _) (h' ha)⟩
  rw [hp]
  simpa only [sq] using norm_add_sq_eq_norm_sq_add_norm_sq_of_inner_eq_zero a b
    (Submodule.inner_right_of_mem_orthogonal ha (h hb))

theorem event_profile [CompleteSpace H] (ψ : H) (p : ClosedSubmodule ℂ H → ℝ) (f : ℝ → ℝ)
    (hadd : ∀ A B : ClosedSubmodule ℂ H, B ≤ Aᗮ → p (A ⊔ B) = p A + p B)
    (hnull : ∀ B : ClosedSubmodule ℂ H, B ≤ (ray ψ)ᗮ → p B = 0)
    (hray : ∀ u : H, p (ray u) = f (‖(ℂ ∙ u).starProjection ψ‖ ^ 2))
    (K : ClosedSubmodule ℂ H) : p K = f (‖K.toSubmodule.starProjection ψ‖ ^ 2) := by
  let u := K.toSubmodule.starProjection ψ
  have hp : (ℂ ∙ u).starProjection ψ = u := eq_starProjection_of_mem_orthogonal
    (mem_span_singleton_self _) (orthogonal_le ((span_singleton_le_iff_mem _ _).mpr
      (K.toSubmodule.starProjection_apply_mem _)) (K.toSubmodule.sub_starProjection_mem_orthogonal ψ))
  rw [event_eq_projected_ray ψ p hadd hnull K, hray]; change f (‖(ℂ ∙ u).starProjection ψ‖ ^ 2) = f (‖u‖ ^ 2); rw [hp]

theorem born_of_ray_profile [CompleteSpace H] (ψ : H) (e : Fin 3 → H) (he : Orthonormal ℂ e)
    (he0 : e 0 = ψ) (p : ClosedSubmodule ℂ H → ℝ) (f : ℝ → ℝ)
    (hnonneg : ∀ K, 0 ≤ p K) (htop : p ⊤ = 1)
    (hadd : ∀ A B : ClosedSubmodule ℂ H, B ≤ Aᗮ → p (A ⊔ B) = p A + p B)
    (hnull : ∀ B : ClosedSubmodule ℂ H, B ≤ (ray ψ)ᗮ → p B = 0)
    (hray : ∀ u : H, p (ray u) = f (‖(ℂ ∙ u).starProjection ψ‖ ^ 2)) :
    ∀ K : ClosedSubmodule ℂ H, p K = ‖K.toSubmodule.starProjection ψ‖ ^ 2 := by
  subst ψ
  have events := event_profile (e 0) p f hadd hnull hray
  have hpos (x : ℝ) (hx : 0 ≤ x) (hx' : x ≤ 1) : 0 ≤ f x := by
    obtain ⟨u, _, _, _, _, hu, _⟩ := realize_pair e he hx (y := 0) (by norm_num) (by linarith)
    rw [← hu, ← hray]; exact hnonneg _
  have hone : f 1 = 1 := by simpa [he.1 0, htop, starProjection_top] using (events ⊤).symm
  have hscalar (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hs : x + y ≤ 1) : f (x + y) = f x + f y := by
    obtain ⟨u, v, _, _, huv, hu, hv⟩ := realize_pair e he hx hy hs
    have hAB : ray v ≤ (ray u)ᗮ := (span_singleton_le_iff_mem _ _).mpr (mem_orthogonal_singleton_iff_inner_right.mpr huv)
    have h := hadd _ _ hAB
    rw [events (ray u ⊔ ray v), orthogonal_join _ _ hAB, hray u, hray v] at h
    simpa only [ray, hu, hv] using h
  intro K
  rw [events K]
  exact unitInterval_weight_determined f hpos hone hscalar _ (sq_nonneg _)
    (pow_le_one₀ (norm_nonneg _) (by simpa [he.1 0] using K.toSubmodule.norm_starProjection_apply_le (e 0)))

end BornDetermination

section BornExistence

variable {H : Type u} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

theorem born_of_event_rules [SecondCountableTopology H] (hdim : ¬FiniteDimensional ℂ H)
    (ψ : H) (hu : ‖ψ‖ = 1) (p : ClosedSubmodule ℂ H → ℝ)
    (hnonneg : ∀ K, 0 ≤ p K) (htop : p ⊤ = 1) (hσ : CountablyAdditive p)
    (hinv : ∀ U : H ≃ₗᵢ[ℂ] H, U ψ = ψ → ∀ u, p (ray (U u)) = p (ray u)) :
    ∀ K : ClosedSubmodule ℂ H, p K = ‖K.toSubmodule.starProjection ψ‖ ^ 2 := by
  obtain ⟨v, hperp, hv⟩ := unit_perpendicular_to_finite hdim (ℂ ∙ ψ)
  have hz := mem_orthogonal_singleton_iff_inner_right.mp hperp
  have hnull := perpendicular_null hdim ψ p hσ (p (ray v)) fun x hx horth => by
    obtain ⟨U, c, hc, hfix, hxv⟩ := ray_orbit ψ x v (hx.trans hv.symm) (by simp only [horth, hz])
    have hc' : c ≠ 0 := fun hc0 => by simp [hc0] at hc
    have hray : ray (c • v) = ray v := ClosedSubmodule.toSubmodule_injective (span_singleton_smul_eq hc'.isUnit v)
    simpa only [hxv, hray] using (hinv U hfix x).symm
  obtain ⟨f, hf⟩ := ray_profile ψ p hinv fun x hx =>
    hnull _ ((span_singleton_le_iff_mem _ _).mpr (mem_orthogonal_singleton_iff_inner_right.mpr hx))
  obtain ⟨e, he, he0⟩ := exists_three_frame hdim ψ hu
  exact born_of_ray_profile ψ e he he0 p f hnonneg htop (binary_of_countable hσ) hnull hf

theorem born_of_phase_gram {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [TopologicalSpace.SeparableSpace E] (a : E → H) (u : E) (hu : u ≠ 0)
    (hg : ∀ x y, inner ℂ (a x) (a y) = (Real.exp (inner ℝ x y) : ℂ))
    (ht : Dense (Submodule.span ℂ (Set.range a) : Set H))
    (ψ : H) (hψ : ‖ψ‖ = 1) (p : ClosedSubmodule ℂ H → ℝ)
    (hnonneg : ∀ K, 0 ≤ p K) (htop : p ⊤ = 1) (hσ : CountablyAdditive p)
    (hinv : ∀ U : H ≃ₗᵢ[ℂ] H, U ψ = ψ → ∀ u, p (ray (U u)) = p (ray u)) :
    ∀ K : ClosedSubmodule ℂ H, p K = ‖K.toSubmodule.starProjection ψ‖ ^ 2 :=
  have := separable_phase_span a hg ht
  born_of_event_rules (gaussian_infinite_dimension a hg u hu) ψ hψ p hnonneg htop hσ hinv

theorem born_of_labelled_gram {V E : Type*} [AddCommGroup V] [Module ℝ V]
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [TopologicalSpace.SeparableSpace E]
    (J : V →ₗ[ℝ] E) (a : V → H) (v₀ : V) (h₀ : J v₀ ≠ 0)
    (hg : ∀ x y, inner ℂ (a x) (a y) = (Real.exp (inner ℝ (J x) (J y)) : ℂ))
    (ht : Dense (Submodule.span ℂ (Set.range a) : Set H))
    (ψ : H) (hψ : ‖ψ‖ = 1) (p : ClosedSubmodule ℂ H → ℝ)
    (hnonneg : ∀ K, 0 ≤ p K) (htop : p ⊤ = 1) (hσ : CountablyAdditive p)
    (hinv : ∀ U : H ≃ₗᵢ[ℂ] H, U ψ = ψ → ∀ u, p (ray (U u)) = p (ray u)) :
    ∀ K : ClosedSubmodule ℂ H, p K = ‖K.toSubmodule.starProjection ψ‖ ^ 2 := by
  let b (z : LinearMap.range J) := a (Classical.choose z.property)
  have lift (z : LinearMap.range J) : J (Classical.choose z.property) = z := Classical.choose_spec z.property
  have hrange : Set.range b = Set.range a := Set.Subset.antisymm (by rintro _ ⟨z, rfl⟩; exact ⟨_, rfl⟩) <| by
    rintro _ ⟨v, rfl⟩
    have hv : J (Classical.choose (J.rangeRestrict v).property) = J v := lift _
    refine ⟨J.rangeRestrict v, sub_eq_zero.mp ((inner_self_eq_zero (𝕜 := ℂ)).mp ?_)⟩
    simp only [b, inner_sub_left, inner_sub_right, hg, hv, sub_self]
  exact born_of_phase_gram b (J.rangeRestrict v₀) (fun he => h₀ (congrArg Subtype.val he))
    (fun x y => by simp only [b, hg, lift]; rfl) (by simpa only [hrange] using ht) ψ hψ p hnonneg htop hσ hinv

/-- Parseval on orthogonal Hilbert sums establishes countable additivity of the Born rule. -/
theorem born_countably_additive (ψ : H) :
    CountablyAdditive (fun K : ClosedSubmodule ℂ H => ‖K.toSubmodule.starProjection ψ‖ ^ 2) := by
  classical
  intro ι _ A ho
  let V (i : ι) := (A i).toSubmodule; let S := (⨆ i, A i).toSubmodule
  let (i : ι) : CompleteSpace (V i) := (A i).isClosed.completeSpace_coe
  have hV : OrthogonalFamily ℂ (fun i => V i) (fun i => (V i).subtypeₗᵢ) := fun i j hij x y =>
    Submodule.inner_right_of_mem_orthogonal x.property (ho i j hij y.property)
  have hrange : LinearMap.range hV.linearIsometry.toLinearMap = S := by
    rw [hV.range_linearIsometry]; simp only [subtypeₗᵢ_toLinearMap, range_subtype, S, V, ClosedSubmodule.toSubmodule_iSup]; rfl
  obtain ⟨z, hz⟩ : S.starProjection ψ ∈ LinearMap.range hV.linearIsometry.toLinearMap :=
    hrange.symm ▸ S.starProjection_apply_mem ψ
  change hV.linearIsometry z = S.starProjection ψ at hz
  have coord (i : ι) : (V i).starProjection ψ = (z i : H) := by
    have hnested := congrArg (fun F : H →L[ℂ] H => F ψ) (starProjection_comp_starProjection_of_le (show V i ≤ S from le_iSup A i))
    have hs := (hV.hasSum_linearIsometry z).mapL (V i).starProjection
    have hw (j : ι) : (V i).starProjection ((V j).subtypeₗᵢ (z j)) = if j = i then (z i : H) else 0 := by
      split_ifs with h
      · subst j; exact starProjection_eq_self_iff.mpr (z i).property
      · exact (starProjection_apply_eq_zero_iff _).mpr (ho i j (Ne.symm h) (z j).property)
    simp only [hw, hz] at hs
    exact hnested.symm.trans (hs.unique (hasSum_ite_eq i (z i : H)))
  have hnorm := hV.linearIsometry.norm_map z; rw [hz] at hnorm
  have hs : HasSum (fun i => ‖z i‖ ^ 2) (‖z‖ ^ 2) := by simpa using lp.hasSum_norm (p := 2) (by norm_num) z
  rw [← hnorm] at hs
  change HasSum (fun i => ‖(V i).starProjection ψ‖ ^ 2) (‖S.starProjection ψ‖ ^ 2)
  simp_rw [coord]; exact hs

/-- The four operational rules on closed-event weights for a unit state `ψ`. -/
def EventRules (ψ : H) (p : ClosedSubmodule ℂ H → ℝ) : Prop :=
  (∀ K, 0 ≤ p K) ∧ p ⊤ = 1 ∧ CountablyAdditive p ∧
    ∀ U : H ≃ₗᵢ[ℂ] H, U ψ = ψ → ∀ u, p (ray (U u)) = p (ray u)

theorem born_satisfies_event_rules (ψ : H) (hψ : ‖ψ‖ = 1) :
    EventRules ψ (fun K => ‖K.toSubmodule.starProjection ψ‖ ^ 2) :=
  ⟨fun _ => sq_nonneg _, by simp [starProjection_top, hψ], born_countably_additive ψ, fun U hfix u => by
    have he : inner ℂ (U u) ψ = inner ℂ u ψ := by simpa only [hfix] using U.inner_map_map u ψ
    simp [ray, starProjection_singleton, norm_smul, he]⟩

/-- Full §3.5 Born existence and uniqueness on any separable infinite-dimensional Hilbert space. -/
theorem existsUnique_event_weights [SecondCountableTopology H] (hdim : ¬FiniteDimensional ℂ H)
    (ψ : H) (hψ : ‖ψ‖ = 1) : ∃! p : ClosedSubmodule ℂ H → ℝ, EventRules ψ p :=
  ⟨fun K => ‖K.toSubmodule.starProjection ψ‖ ^ 2, born_satisfies_event_rules ψ hψ,
    fun p ⟨hn, ht, hσ, hi⟩ => funext (born_of_event_rules hdim ψ hψ p hn ht hσ hi)⟩

/-- Full §3.5 Born existence and uniqueness directly from a total labelled phase Gram family
(with `dim H = ∞` and separability derived from the Vandermonde rank and feature space). -/
theorem existsUnique_phase_event_weights {V E : Type*} [AddCommGroup V] [Module ℝ V]
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [TopologicalSpace.SeparableSpace E]
    (J : V →ₗ[ℝ] E) (a : V → H) (v₀ : V) (h₀ : J v₀ ≠ 0)
    (hg : ∀ x y, inner ℂ (a x) (a y) = (Real.exp (inner ℝ (J x) (J y)) : ℂ))
    (ht : Dense (Submodule.span ℂ (Set.range a) : Set H))
    (ψ : H) (hψ : ‖ψ‖ = 1) : ∃! p : ClosedSubmodule ℂ H → ℝ, EventRules ψ p :=
  ⟨fun K => ‖K.toSubmodule.starProjection ψ‖ ^ 2, born_satisfies_event_rules ψ hψ,
    fun p ⟨hn, htop, hσ, hi⟩ => funext (born_of_labelled_gram J a v₀ h₀ hg ht ψ hψ p hn htop hσ hi)⟩

end BornExistence

end Born

/-! ### §2.2 → §3.1 → §3.5 End-to-End Join: `measured_determination` -/
section MeasuredDetermination

open MeasureTheory ProbabilityTheory Submodule
open scoped InnerProductSpace

universe u

/-- Minimal Hilbert space generated by a labelled family `W : V → H` (no ambient totality assumed). -/
abbrev GeneratedSpace {V H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (W : V → H) : Type _ :=
  (Submodule.span ℂ (Set.range W)).topologicalClosure

/-- Lift of a label `v : V` into the generated closed span `GeneratedSpace W`. -/
def generatedLabel {V H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (W : V → H) (v : V) : GeneratedSpace W :=
  ⟨W v, Submodule.le_topologicalClosure _ (Submodule.subset_span ⟨v, rfl⟩)⟩

/-- The lifted labels are automatically total (dense complex span) inside `GeneratedSpace W`. -/
theorem generatedLabel_dense {V H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (W : V → H) :
    Dense (Submodule.span ℂ (Set.range (generatedLabel W)) : Set (GeneratedSpace W)) := by
  have himg : Subtype.val '' (Submodule.span ℂ (Set.range (generatedLabel W)) : Set (GeneratedSpace W)) =
      (Submodule.span ℂ (Set.range W) : Set H) :=
    congrArg SetLike.coe (show Submodule.map ((Submodule.span ℂ (Set.range W)).topologicalClosure).subtype
      (Submodule.span ℂ (Set.range (generatedLabel W))) = Submodule.span ℂ (Set.range W) by
        rw [Submodule.map_span]; congr 1; ext x; simp [generatedLabel])
  intro x
  rw [Topology.IsInducing.subtypeVal.closure_eq_preimage_closure_image, Set.mem_preimage]
  have hx : (x : H) ∈ closure (Submodule.span ℂ (Set.range W) : Set H) := x.property
  rwa [← himg] at hx

/-- End-to-end §2.2 → §3.1 → §3.5 determination: starting directly from a copy-rotation-invariant
linear reading family `Φ`, reflected pairing covariance `⟨Jf, Jg⟩`, and separable real feature
space `E` with one nonzero `J v₀`, on the generated Hilbert space
`M = (Submodule.span ℂ (Set.range W)).topologicalClosure` inside `H` (with NO ambient totality
assumption on `H`), this derives Gaussian characteristic functions (§2.2), the exponential Gram
table `⟨W f, W g⟩ = exp⟨Jf, Jg⟩` (§3.1), `¬FiniteDimensional ℂ M` and `SeparableSpace M`, and
existence and uniqueness of the Born rule `p K = ‖K.starProjection ψ‖²` on `M` (§3.5). -/
theorem measured_determination {Ω R V E : Type*} {H : Type u}
    [MeasurableSpace Ω] (P : Measure Ω) [IsProbabilityMeasure P]
    [NormedAddCommGroup R] [InnerProductSpace ℝ R]
    [AddCommGroup V] [Module ℝ V]
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [TopologicalSpace.SeparableSpace E]
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (Φ : Ω → R →ₗ[ℝ] ℝ)
    (hmeas : ∀ x : R, Measurable (fun ω ↦ Φ ω x))
    (hrot : ∀ x : R, RotationInvariantCopies (P.map (fun ω ↦ Φ ω x)))
    (hvar : ∀ x : R, variance (fun ω ↦ Φ ω x) P = ‖x‖ ^ 2)
    (reflected prepared : V → R)
    (J : V →ₗ[ℝ] E) (v₀ : V) (hv₀ : J v₀ ≠ 0)
    (hcov : ∀ f g : V, inner ℝ (reflected f) (prepared g) = inner ℝ (J f) (J g))
    (W : V → H)
    (hpair : ∀ f g : V, inner ℂ (W f) (W g) =
      ∫ ω, star (Complex.exp ((‖reflected f‖ ^ 2 / 2 : ℝ) + (Φ ω (reflected f) : ℂ) * Complex.I)) *
        Complex.exp ((‖prepared g‖ ^ 2 / 2 : ℝ) + (Φ ω (prepared g) : ℂ) * Complex.I) ∂P) :
    letI : CompleteSpace (GeneratedSpace W) := (Submodule.isClosed_topologicalClosure _).completeSpace_coe
    (∀ x : R, (∫ ω, Complex.exp ((Φ ω x : ℂ) * Complex.I) ∂P) = (Real.exp (-(‖x‖ ^ 2) / 2) : ℂ)) ∧
    (∀ f g : V, inner ℂ (generatedLabel W f) (generatedLabel W g) =
      (Real.exp (inner ℝ (J f) (J g)) : ℂ)) ∧
    ¬FiniteDimensional ℂ (GeneratedSpace W) ∧
    TopologicalSpace.SeparableSpace (GeneratedSpace W) ∧
    ∀ ψ : GeneratedSpace W, ‖ψ‖ = 1 →
      (∃! p : ClosedSubmodule ℂ (GeneratedSpace W) → ℝ, EventRules ψ p) ∧
      ∀ p : ClosedSubmodule ℂ (GeneratedSpace W) → ℝ,
        EventRules ψ p ↔ p = fun K ↦ ‖K.toSubmodule.starProjection ψ‖ ^ 2 := by
  let : CompleteSpace (GeneratedSpace W) := (Submodule.isClosed_topologicalClosure _).completeSpace_coe
  have hchar := charFun_of_copyRotation_variance P Φ hmeas hrot hvar
  have hgram (f g : V) :
      inner ℂ (generatedLabel W f) (generatedLabel W g) = (Real.exp (inner ℝ (J f) (J g)) : ℂ) := by
    change inner ℂ (W f) (W g) = _; rw [hpair, gaussian_phase_overlap P Φ hchar, hcov]
  have hdense := generatedLabel_dense W
  let b (z : LinearMap.range J) : GeneratedSpace W := generatedLabel W (Classical.choose z.property)
  have hlift (z : LinearMap.range J) : J (Classical.choose z.property) = z := Classical.choose_spec z.property
  have hbgram (x y : LinearMap.range J) : inner ℂ (b x) (b y) = (Real.exp (inner ℝ x y) : ℂ) := by
    simp only [b, hgram, hlift]; rfl
  have hrange : Set.range b = Set.range (generatedLabel W) := Set.Subset.antisymm (by rintro _ ⟨z, rfl⟩; exact ⟨_, rfl⟩) <| by
    rintro _ ⟨v, rfl⟩
    have hv : J (Classical.choose (J.rangeRestrict v).property) = J v := hlift _
    refine ⟨J.rangeRestrict v, sub_eq_zero.mp ((inner_self_eq_zero (𝕜 := ℂ)).mp ?_)⟩
    simp only [b, inner_sub_left, inner_sub_right, hgram, hv, sub_self]
  refine ⟨hchar, hgram,
    gaussian_infinite_dimension b hbgram (J.rangeRestrict v₀) (fun h ↦ hv₀ (congrArg Subtype.val h)),
    separable_phase_span b hbgram (by simpa only [hrange] using hdense), fun ψ hψ ↦ ?_⟩
  have hex := existsUnique_phase_event_weights J (generatedLabel W) v₀ hv₀ hgram hdense ψ hψ
  exact ⟨hex, fun p ↦ ⟨fun hp ↦ hex.unique hp (born_satisfies_event_rules ψ hψ),
    fun h ↦ h ▸ born_satisfies_event_rules ψ hψ⟩⟩

end MeasuredDetermination

/-! ### §3.5 Self-Adjoint Observables from Projection-Valued Measures on `ℝ` -/
section PVMObservable

open MeasureTheory Set Filter
open scoped InnerProductSpace Topology

/-- A sharp Borel projection-valued measure (PVM) on `ℝ` acting on a complex Hilbert space `H`:
orthogonal projections `proj s` (`s` Borel measurable) satisfying `proj ∅ = 0`, `proj univ = 1`,
multiplicativity `proj (s ∩ t) = proj s ∘ proj t`, and strong countable additivity via
`HasSum (fun n => ‖proj (s n) ψ‖²) ‖proj (⋃ n, s n) ψ‖²`. -/
structure PVM (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] where
  proj : Set ℝ → H →L[ℂ] H
  proj_selfAdjoint : ∀ ⦃s : Set ℝ⦄, MeasurableSet s →
    ∀ x y : H, inner ℂ x (proj s y) = inner ℂ (proj s x) y
  proj_empty : proj ∅ = 0
  proj_univ : proj Set.univ = ContinuousLinearMap.id ℂ H
  proj_inter : ∀ ⦃s t : Set ℝ⦄, MeasurableSet s → MeasurableSet t →
    proj (s ∩ t) = (proj s).comp (proj t)
  proj_iUnion_norm_sq : ∀ (ψ : H) (s : ℕ → Set ℝ),
    (∀ n, MeasurableSet (s n)) → Pairwise (Function.onFun Disjoint s) →
    HasSum (fun n => ‖proj (s n) ψ‖ ^ 2) (‖proj (⋃ n, s n) ψ‖ ^ 2)

/-- Construct a `PVM H` from a family of closed subspaces `E : Set ℝ → ClosedSubmodule ℂ H`
whose orthogonal projections satisfy the PVM axioms. -/
noncomputable def PVM.ofSubmodules {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H]
    (E : Set ℝ → ClosedSubmodule ℂ H)
    (h_empty : E ∅ = ⊥)
    (h_univ : E Set.univ = ⊤)
    (h_inter : ∀ ⦃s t : Set ℝ⦄, MeasurableSet s → MeasurableSet t →
      (E (s ∩ t)).toSubmodule.starProjection =
        (E s).toSubmodule.starProjection.comp (E t).toSubmodule.starProjection)
    (h_iUnion : ∀ (ψ : H) (s : ℕ → Set ℝ),
      (∀ n, MeasurableSet (s n)) → Pairwise (Function.onFun Disjoint s) →
      HasSum (fun n => ‖(E (s n)).toSubmodule.starProjection ψ‖ ^ 2)
        (‖(E (⋃ n, s n)).toSubmodule.starProjection ψ‖ ^ 2)) :
    PVM H where
  proj s := (E s).toSubmodule.starProjection
  proj_selfAdjoint _ _ x y := ((E _).toSubmodule.inner_starProjection_left_eq_right x y).symm
  proj_empty := by rw [h_empty]; exact Submodule.starProjection_bot
  proj_univ := by rw [h_univ]; exact Submodule.starProjection_top
  proj_inter := h_inter
  proj_iUnion_norm_sq := h_iUnion

/-- The finite Borel spectral measure `μ_ψ(s) = ‖P(s) ψ‖²` associated with a PVM `P` and vector `ψ`. -/
noncomputable def PVM.specMeasure {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] (P : PVM H) (ψ : H) : Measure ℝ :=
  Measure.ofMeasurable
    (fun s _ => ENNReal.ofReal (‖P.proj s ψ‖ ^ 2))
    (by simp [P.proj_empty])
    (fun f hf hdisj => by
      have hs := P.proj_iUnion_norm_sq ψ f hf hdisj
      rw [← hs.tsum_eq]
      exact ENNReal.ofReal_tsum_of_nonneg (fun _ => sq_nonneg _) hs.summable)

namespace PVMObservable

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

lemma specMeasure_apply (P : PVM H) (ψ : H) {s : Set ℝ} (hs : MeasurableSet s) :
    P.specMeasure ψ s = ENNReal.ofReal (‖P.proj s ψ‖ ^ 2) :=
  Measure.ofMeasurable_apply s hs

lemma specMeasure_real_apply (P : PVM H) (ψ : H) {s : Set ℝ} (hs : MeasurableSet s) :
    (P.specMeasure ψ).real s = ‖P.proj s ψ‖ ^ 2 := by
  rw [Measure.real, specMeasure_apply P ψ hs, ENNReal.toReal_ofReal (sq_nonneg _)]

lemma specMeasure_univ (P : PVM H) (ψ : H) :
    P.specMeasure ψ Set.univ = ENNReal.ofReal (‖ψ‖ ^ 2) := by
  rw [specMeasure_apply P ψ MeasurableSet.univ, P.proj_univ, ContinuousLinearMap.id_apply]

instance specMeasure_isFinite (P : PVM H) (ψ : H) : IsFiniteMeasure (P.specMeasure ψ) :=
  ⟨by rw [specMeasure_univ]; exact ENNReal.ofReal_lt_top⟩

lemma proj_idem (P : PVM H) {s : Set ℝ} (hs : MeasurableSet s) (ψ : H) :
    P.proj s (P.proj s ψ) = P.proj s ψ := by
  have h := DFunLike.congr_fun (P.proj_inter hs hs) ψ
  simpa [Set.inter_self] using h.symm

lemma inner_proj_self (P : PVM H) {s : Set ℝ} (hs : MeasurableSet s) (ψ : H) :
    inner ℂ ψ (P.proj s ψ) = ((‖P.proj s ψ‖ ^ 2 : ℝ) : ℂ) := by
  calc inner ℂ ψ (P.proj s ψ)
      = inner ℂ ψ (P.proj s (P.proj s ψ)) := by rw [proj_idem P hs]
    _ = inner ℂ (P.proj s ψ) (P.proj s ψ) := P.proj_selfAdjoint hs _ _
    _ = ((‖P.proj s ψ‖ ^ 2 : ℝ) : ℂ) := by
        rw [inner_self_eq_norm_sq_to_K, RCLike.ofReal_eq_complex_ofReal, ← Complex.ofReal_pow]

lemma proj_comp_disjoint (P : PVM H) {s t : Set ℝ} (hs : MeasurableSet s) (ht : MeasurableSet t)
    (hd : Disjoint s t) (ψ : H) :
    P.proj s (P.proj t ψ) = 0 := by
  have h := DFunLike.congr_fun (P.proj_inter hs ht) ψ
  rw [hd.inter_eq, P.proj_empty] at h
  simpa using h.symm

lemma inner_proj_disjoint (P : PVM H) {s t : Set ℝ} (hs : MeasurableSet s) (ht : MeasurableSet t)
    (hd : Disjoint s t) (φ ψ : H) :
    inner ℂ (P.proj s φ) (P.proj t ψ) = 0 := by
  rw [← P.proj_selfAdjoint hs, proj_comp_disjoint P hs ht hd, inner_zero_right]

lemma proj_pythagoras (P : PVM H) {s : Set ℝ} (hs : MeasurableSet s) (ψ : H) :
    ‖ψ‖ ^ 2 = ‖P.proj s ψ‖ ^ 2 + ‖ψ - P.proj s ψ‖ ^ 2 := by
  have hsub := norm_sub_sq (𝕜 := ℂ) ψ (P.proj s ψ)
  rw [inner_proj_self P hs, RCLike.re_to_complex, Complex.ofReal_re] at hsub
  linarith

lemma proj_norm_le (P : PVM H) {s : Set ℝ} (hs : MeasurableSet s) (ψ : H) :
    ‖P.proj s ψ‖ ≤ ‖ψ‖ := by
  have h := proj_pythagoras P hs ψ
  have hsq : ‖P.proj s ψ‖ ^ 2 ≤ ‖ψ‖ ^ 2 := by nlinarith [sq_nonneg ‖ψ - P.proj s ψ‖]
  nlinarith [norm_nonneg (P.proj s ψ), norm_nonneg ψ]

lemma proj_union_disjoint (P : PVM H) {s t : Set ℝ} (hs : MeasurableSet s) (ht : MeasurableSet t)
    (hd : Disjoint s t) (ψ : H) :
    P.proj (s ∪ t) ψ = P.proj s ψ + P.proj t ψ := by
  let f : ℕ → Set ℝ := fun n => if n = 0 then s else if n = 1 then t else ∅
  have hf : ∀ n, MeasurableSet (f n) := fun n => by
    dsimp only [f]; split_ifs <;> [exact hs; exact ht; exact MeasurableSet.empty]
  have hdisj : Pairwise (Function.onFun Disjoint f) := by
    intro i j hij
    show Disjoint (f i) (f j)
    dsimp only [f]
    split_ifs <;> first
      | exact absurd (by omega) hij
      | exact hd
      | exact hd.symm
      | exact disjoint_empty _
      | exact empty_disjoint _
  have hunion : (⋃ n, f n) = s ∪ t := by
    ext x; simp only [Set.mem_iUnion, Set.mem_union]
    constructor
    · rintro ⟨n, hn⟩; dsimp only [f] at hn; split_ifs at hn <;> simp_all
    · rintro (hx | hx)
      · exact ⟨0, by simpa [f] using hx⟩
      · exact ⟨1, by simpa [f] using hx⟩
  have hsum := P.proj_iUnion_norm_sq ψ f hf hdisj
  rw [hunion] at hsum
  have hfin : ∑' n, ‖P.proj (f n) ψ‖ ^ 2 = ‖P.proj s ψ‖ ^ 2 + ‖P.proj t ψ‖ ^ 2 := by
    rw [tsum_eq_sum (s := ({0, 1} : Finset ℕ))]
    · simp [f]
    · intro n hn
      simp only [Finset.mem_insert, Finset.mem_singleton, not_or] at hn
      simp [f, hn.1, hn.2, P.proj_empty]
  have hnorm_union : ‖P.proj (s ∪ t) ψ‖ ^ 2 = ‖P.proj s ψ‖ ^ 2 + ‖P.proj t ψ‖ ^ 2 :=
    hsum.tsum_eq.symm.trans hfin
  have hinner_s : inner ℂ (P.proj (s ∪ t) ψ) (P.proj s ψ) = ((‖P.proj s ψ‖ ^ 2 : ℝ) : ℂ) := by
    rw [← P.proj_selfAdjoint (hs.union ht)]
    have hcomp := DFunLike.congr_fun (P.proj_inter (hs.union ht) hs) ψ
    rw [Set.union_inter_cancel_left, ContinuousLinearMap.comp_apply] at hcomp
    rw [← hcomp, inner_proj_self P hs]
  have hinner_t : inner ℂ (P.proj (s ∪ t) ψ) (P.proj t ψ) = ((‖P.proj t ψ‖ ^ 2 : ℝ) : ℂ) := by
    rw [← P.proj_selfAdjoint (hs.union ht)]
    have hcomp := DFunLike.congr_fun (P.proj_inter (hs.union ht) ht) ψ
    rw [Set.union_inter_cancel_right, ContinuousLinearMap.comp_apply] at hcomp
    rw [← hcomp, inner_proj_self P ht]
  have hnorm_add : ‖P.proj s ψ + P.proj t ψ‖ ^ 2 = ‖P.proj s ψ‖ ^ 2 + ‖P.proj t ψ‖ ^ 2 := by
    rw [norm_add_sq (𝕜 := ℂ), inner_proj_disjoint P hs ht hd, RCLike.re_to_complex,
      Complex.zero_re]
    ring
  have hdiff : ‖P.proj (s ∪ t) ψ - (P.proj s ψ + P.proj t ψ)‖ ^ 2 = 0 := by
    rw [norm_sub_sq (𝕜 := ℂ), inner_add_right, hinner_s, hinner_t, RCLike.re_to_complex,
      Complex.add_re, Complex.ofReal_re, Complex.ofReal_re, hnorm_union, hnorm_add]
    ring
  exact sub_eq_zero.mp (norm_eq_zero.mp (sq_eq_zero_iff.mp hdiff))

lemma proj_biUnion_finset {ι : Type*} [DecidableEq ι] (P : PVM H) (s : Finset ι)
    (B : ι → Set ℝ) (hB : ∀ i ∈ s, MeasurableSet (B i))
    (hdisj : Set.Pairwise (s : Set ι) (Function.onFun Disjoint B)) (ψ : H) :
    P.proj (⋃ i ∈ s, B i) ψ = ∑ i ∈ s, P.proj (B i) ψ := by
  induction s using Finset.induction with
  | empty => simp [P.proj_empty]
  | insert a t ha ih =>
    have hBa : MeasurableSet (B a) := hB a (Finset.mem_insert_self a t)
    have hBt : ∀ i ∈ t, MeasurableSet (B i) := fun i hi => hB i (Finset.mem_insert_of_mem hi)
    have hBt_union : MeasurableSet (⋃ i ∈ t, B i) :=
      Finset.measurableSet_biUnion t hBt
    have hdisj_t : Set.Pairwise (t : Set ι) (Function.onFun Disjoint B) :=
      hdisj.mono (Finset.coe_subset.mpr (Finset.subset_insert a t))
    have hdisj_a : Disjoint (B a) (⋃ i ∈ t, B i) := by
      rw [Set.disjoint_iUnion₂_right]
      intro i hi
      exact hdisj (Finset.mem_coe.mpr (Finset.mem_insert_self a t))
        (Finset.mem_coe.mpr (Finset.mem_insert_of_mem hi))
        (fun h => ha (h ▸ hi))
    rw [Finset.set_biUnion_insert, proj_union_disjoint P hBa hBt_union hdisj_a,
      Finset.sum_insert ha, ih hBt hdisj_t]

omit [CompleteSpace H] in
lemma norm_sq_sum_orthogonal {ι : Type*} (s : Finset ι) (v : ι → H)
    (horth : ∀ i ∈ s, ∀ j ∈ s, i ≠ j → inner ℂ (v i) (v j) = 0) :
    ‖∑ i ∈ s, v i‖ ^ 2 = ∑ i ∈ s, ‖v i‖ ^ 2 := by
  classical
  induction s using Finset.induction with
  | empty => simp
  | insert a t ha ih =>
    have horth_t : ∀ i ∈ t, ∀ j ∈ t, i ≠ j → inner ℂ (v i) (v j) = 0 :=
      fun i hi j hj hij => horth i (Finset.mem_insert_of_mem hi) j (Finset.mem_insert_of_mem hj) hij
    have hinner : inner ℂ (v a) (∑ i ∈ t, v i) = 0 := by
      rw [inner_sum]
      exact Finset.sum_eq_zero fun i hi =>
        horth a (Finset.mem_insert_self a t) i (Finset.mem_insert_of_mem hi) (fun h => ha (h ▸ hi))
    rw [Finset.sum_insert ha, Finset.sum_insert ha, norm_add_sq (𝕜 := ℂ), hinner,
      RCLike.re_to_complex, Complex.zero_re, ih horth_t]
    ring

lemma specMeasure_zero (P : PVM H) : P.specMeasure (0 : H) = 0 := by
  ext s hs
  rw [specMeasure_apply P 0 hs]
  simp

lemma specMeasure_smul (P : PVM H) (c : ℂ) (ψ : H) :
    P.specMeasure (c • ψ) = ENNReal.ofReal (‖c‖ ^ 2) • P.specMeasure ψ := by
  ext s hs
  rw [Measure.smul_apply, smul_eq_mul, specMeasure_apply P (c • ψ) hs,
    specMeasure_apply P ψ hs, map_smul, norm_smul, mul_pow,
    ENNReal.ofReal_mul (sq_nonneg ‖c‖)]

lemma specMeasure_add_le (P : PVM H) (φ ψ : H) :
    P.specMeasure (φ + ψ) ≤ (2 : ENNReal) • P.specMeasure φ + (2 : ENNReal) • P.specMeasure ψ := by
  rw [Measure.le_iff]
  intro s hs
  rw [Measure.add_apply, Measure.smul_apply, Measure.smul_apply, smul_eq_mul, smul_eq_mul,
    specMeasure_apply P (φ + ψ) hs, specMeasure_apply P φ hs, specMeasure_apply P ψ hs,
    map_add]
  have hbound : ‖P.proj s φ + P.proj s ψ‖ ^ 2 ≤ 2 * ‖P.proj s φ‖ ^ 2 + 2 * ‖P.proj s ψ‖ ^ 2 := by
    have ht := norm_add_le (P.proj s φ) (P.proj s ψ)
    nlinarith [sq_nonneg (‖P.proj s φ‖ - ‖P.proj s ψ‖), norm_nonneg (P.proj s φ + P.proj s ψ)]
  calc ENNReal.ofReal (‖P.proj s φ + P.proj s ψ‖ ^ 2)
      ≤ ENNReal.ofReal (2 * ‖P.proj s φ‖ ^ 2 + 2 * ‖P.proj s ψ‖ ^ 2) :=
        ENNReal.ofReal_le_ofReal hbound
    _ = (2 : ENNReal) * ENNReal.ofReal (‖P.proj s φ‖ ^ 2) +
          (2 : ENNReal) * ENNReal.ofReal (‖P.proj s ψ‖ ^ 2) := by
        rw [ENNReal.ofReal_add (by positivity) (by positivity),
          ENNReal.ofReal_mul (by norm_num), ENNReal.ofReal_mul (by norm_num)]
        simp

lemma specMeasure_proj (P : PVM H) {s : Set ℝ} (hs : MeasurableSet s) (ψ : H) :
    P.specMeasure (P.proj s ψ) = (P.specMeasure ψ).restrict s := by
  ext t ht
  rw [Measure.restrict_apply ht, specMeasure_apply P (P.proj s ψ) ht,
    specMeasure_apply P ψ (ht.inter hs)]
  have hcomp := DFunLike.congr_fun (P.proj_inter ht hs) ψ
  rw [ContinuousLinearMap.comp_apply] at hcomp
  rw [← hcomp]

/-- Dyadic half-open cell `[m / 2^k, (m + 1) / 2^k)`. -/
noncomputable def cell (k : ℕ) (m : ℤ) : Set ℝ :=
  Set.Ico ((m : ℝ) / (2 : ℝ) ^ k) (((m : ℝ) + 1) / (2 : ℝ) ^ k)

/-- Left endpoint `m / 2^k` of the dyadic cell `cell k m`. -/
noncomputable def dyadVal (k : ℕ) (m : ℤ) : ℝ := (m : ℝ) / (2 : ℝ) ^ k

/-- Index set `[-N * 2^k, N * 2^k)` covering `[-N, N)` at resolution `2^{-k}`. -/
def dyadRange (N k : ℕ) : Finset ℤ :=
  Finset.Ico (-(N : ℤ) * (2 : ℤ) ^ k) ((N : ℤ) * (2 : ℤ) ^ k)

/-- Truncation band `[-N, N)`. -/
noncomputable def band (N : ℕ) : Set ℝ := Set.Ico (-(N : ℝ)) (N : ℝ)

lemma measurableSet_cell (k : ℕ) (m : ℤ) : MeasurableSet (cell k m) :=
  measurableSet_Ico

lemma measurableSet_band (N : ℕ) : MeasurableSet (band N) :=
  measurableSet_Ico

lemma cell_pairwise_disjoint (k : ℕ) : Pairwise (Function.onFun Disjoint (cell k)) := by
  intro m₁ m₂ hne
  have h2 : (0 : ℝ) < (2 : ℝ) ^ k := by positivity
  rcases lt_or_gt_of_ne hne with hlt | hgt
  · have hle : ((m₁ : ℝ) + 1) / (2 : ℝ) ^ k ≤ (m₂ : ℝ) / (2 : ℝ) ^ k := by
      have : (m₁ : ℝ) + 1 ≤ (m₂ : ℝ) := by exact_mod_cast Int.add_one_le_iff.mpr hlt
      exact div_le_div_of_nonneg_right this h2.le
    exact Set.disjoint_left.mpr fun x hx₁ hx₂ => by linarith [hx₁.2, hx₂.1]
  · have hle : ((m₂ : ℝ) + 1) / (2 : ℝ) ^ k ≤ (m₁ : ℝ) / (2 : ℝ) ^ k := by
      have : (m₂ : ℝ) + 1 ≤ (m₁ : ℝ) := by exact_mod_cast Int.add_one_le_iff.mpr hgt
      exact div_le_div_of_nonneg_right this h2.le
    exact Set.disjoint_left.mpr fun x hx₁ hx₂ => by linarith [hx₂.2, hx₁.1]

lemma cell_split (k : ℕ) (m : ℤ) :
    cell k m = cell (k + 1) (2 * m) ∪ cell (k + 1) (2 * m + 1) := by
  have h2 : (0 : ℝ) < (2 : ℝ) ^ k := by positivity
  have h1 : ((2 * m : ℤ) : ℝ) / (2 : ℝ) ^ (k + 1) = (m : ℝ) / (2 : ℝ) ^ k := by
    push_cast; rw [pow_succ]; field_simp [h2.ne']
  have h3 : (((2 * m + 1 : ℤ) : ℝ) + 1) / (2 : ℝ) ^ (k + 1) = ((m : ℝ) + 1) / (2 : ℝ) ^ k := by
    push_cast; rw [pow_succ]; field_simp [h2.ne']; ring
  have hmid1 : ((2 * m : ℤ) : ℝ) / (2 : ℝ) ^ (k + 1) ≤ (((2 * m : ℤ) : ℝ) + 1) / (2 : ℝ) ^ (k + 1) :=
    div_le_div_of_nonneg_right (by linarith) (by positivity)
  have hmid2 : (((2 * m : ℤ) : ℝ) + 1) / (2 : ℝ) ^ (k + 1) ≤ (((2 * m + 1 : ℤ) : ℝ) + 1) / (2 : ℝ) ^ (k + 1) := by
    apply div_le_div_of_nonneg_right _ (by positivity); push_cast; linarith
  have heq : (((2 * m : ℤ) : ℝ) + 1) / (2 : ℝ) ^ (k + 1) = ((2 * m + 1 : ℤ) : ℝ) / (2 : ℝ) ^ (k + 1) := by
    push_cast; ring
  unfold cell
  rw [← heq, Set.Ico_union_Ico_eq_Ico hmid1 hmid2, h1, h3]

lemma cell_subset_band {N k : ℕ} {m : ℤ} (hm : m ∈ dyadRange N k) :
    cell k m ⊆ band N := by
  simp only [dyadRange, Finset.mem_Ico] at hm
  have h2 : (0 : ℝ) < (2 : ℝ) ^ k := by positivity
  intro a ha
  refine ⟨?_, ?_⟩
  · have hlow : -(N : ℝ) * (2 : ℝ) ^ k ≤ (m : ℝ) := by exact_mod_cast hm.1
    have : -(N : ℝ) ≤ (m : ℝ) / (2 : ℝ) ^ k := (le_div_iff₀ h2).mpr hlow
    exact this.trans ha.1
  · have hhi : (m : ℝ) + 1 ≤ (N : ℝ) * (2 : ℝ) ^ k := by
      exact_mod_cast Int.add_one_le_iff.mpr hm.2
    have : ((m : ℝ) + 1) / (2 : ℝ) ^ k ≤ (N : ℝ) := (div_le_iff₀ h2).mpr hhi
    exact ha.2.trans_le this

lemma cell_disjoint_band_of_not_mem {N k : ℕ} {m : ℤ} (hm : m ∉ dyadRange N k) :
    Disjoint (band N) (cell k m) := by
  simp only [dyadRange, Finset.mem_Ico, not_and_or, not_le, not_lt] at hm
  have h2 : (0 : ℝ) < (2 : ℝ) ^ k := by positivity
  rcases hm with hlt | hge
  · have hle : ((m : ℝ) + 1) / (2 : ℝ) ^ k ≤ -(N : ℝ) := by
      rw [div_le_iff₀ h2]
      have : m + 1 ≤ -(N : ℤ) * (2 : ℤ) ^ k := Int.add_one_le_iff.mpr hlt
      exact_mod_cast this
    exact Set.disjoint_left.mpr fun x hx₁ hx₂ => by linarith [hx₁.1, hx₂.2]
  · have hle : (N : ℝ) ≤ (m : ℝ) / (2 : ℝ) ^ k := by
      rw [le_div_iff₀ h2]
      exact_mod_cast hge
    exact Set.disjoint_left.mpr fun x hx₁ hx₂ => by linarith [hx₁.2, hx₂.1]

lemma mem_cell_floor (k : ℕ) (a : ℝ) : a ∈ cell k ⌊a * (2 : ℝ) ^ k⌋ := by
  have h2 : (0 : ℝ) < (2 : ℝ) ^ k := by positivity
  refine ⟨(div_le_iff₀ h2).mpr (Int.floor_le (a * (2 : ℝ) ^ k)),
    (lt_div_iff₀ h2).mpr (Int.lt_floor_add_one (a * (2 : ℝ) ^ k))⟩

lemma floor_mem_dyadRange {N k : ℕ} {a : ℝ} (ha : a ∈ band N) :
    ⌊a * (2 : ℝ) ^ k⌋ ∈ dyadRange N k := by
  have h2 : (0 : ℝ) < (2 : ℝ) ^ k := by positivity
  simp only [dyadRange, Finset.mem_Ico]
  refine ⟨Int.le_floor.mpr ?_, Int.floor_lt.mpr ?_⟩
  · push_cast
    exact mul_le_mul_of_nonneg_right ha.1 h2.le
  · push_cast
    exact mul_lt_mul_of_pos_right ha.2 h2

lemma biUnion_cell_eq_band (N k : ℕ) :
    (⋃ m ∈ dyadRange N k, cell k m) = band N := by
  ext a
  simp only [Set.mem_iUnion]
  constructor
  · rintro ⟨m, hm, ha⟩
    exact cell_subset_band hm ha
  · intro ha
    exact ⟨⌊a * (2 : ℝ) ^ k⌋, floor_mem_dyadRange ha, mem_cell_floor k a⟩

lemma sum_Ico_double {E : Type*} [AddCommMonoid E] (a b : ℤ) (g : ℤ → E) :
    ∑ r ∈ Finset.Ico (2 * a) (2 * b), g r =
      ∑ m ∈ Finset.Ico a b, (g (2 * m) + g (2 * m + 1)) := by
  let f : ℤ → Finset ℤ := fun m => {2 * m, 2 * m + 1}
  have hdisj : Set.PairwiseDisjoint (Finset.Ico a b : Set ℤ) f := by
    intro m₁ _ m₂ _ hne
    show Disjoint (f m₁) (f m₂)
    rw [Finset.disjoint_left]
    intro x hx₁ hx₂
    simp only [f, Finset.mem_insert, Finset.mem_singleton] at hx₁ hx₂
    omega
  have hbi : (Finset.Ico a b).biUnion f = Finset.Ico (2 * a) (2 * b) := by
    ext r
    simp only [Finset.mem_biUnion, Finset.mem_Ico, f, Finset.mem_insert, Finset.mem_singleton]
    constructor
    · rintro ⟨m, ⟨hm1, hm2⟩, rfl | rfl⟩ <;> omega
    · rintro ⟨hr1, hr2⟩
      refine ⟨r / 2, ⟨by omega, by omega⟩, ?_⟩
      omega
  rw [← hbi, Finset.sum_biUnion hdisj]
  refine Finset.sum_congr rfl fun m _ => ?_
  rw [Finset.sum_pair (by omega)]

/-- Dyadic step operator `A_{N, k} = ∑_{m} (m / 2^k) P(cell k m)` approximating `∫_{[-N, N)} a dP(a)`. -/
noncomputable def approxOp (P : PVM H) (N k : ℕ) : H →L[ℂ] H :=
  ∑ m ∈ dyadRange N k, ((dyadVal k m : ℝ) : ℂ) • P.proj (cell k m)

lemma approxOp_apply (P : PVM H) (N k : ℕ) (ψ : H) :
    approxOp P N k ψ = ∑ m ∈ dyadRange N k, ((dyadVal k m : ℝ) : ℂ) • P.proj (cell k m) ψ := by
  simp [approxOp]

lemma approxOp_selfAdjoint (P : PVM H) (N k : ℕ) (φ ψ : H) :
    inner ℂ φ (approxOp P N k ψ) = inner ℂ (approxOp P N k φ) ψ := by
  simp only [approxOp_apply, inner_sum, sum_inner, inner_smul_right, inner_smul_left,
    Complex.conj_ofReal]
  refine Finset.sum_congr rfl fun m _ => ?_
  rw [P.proj_selfAdjoint (measurableSet_cell k m)]

lemma approxOp_comm_proj (P : PVM H) (N k : ℕ) {s : Set ℝ} (hs : MeasurableSet s) (ψ : H) :
    approxOp P N k (P.proj s ψ) = P.proj s (approxOp P N k ψ) := by
  simp only [approxOp_apply, map_sum, map_smul]
  refine Finset.sum_congr rfl fun m _ => ?_
  congr 1
  have h1 := DFunLike.congr_fun (P.proj_inter (measurableSet_cell k m) hs) ψ
  have h2 := DFunLike.congr_fun (P.proj_inter hs (measurableSet_cell k m)) ψ
  rw [Set.inter_comm] at h1
  exact h1.symm.trans h2

lemma approxOp_restrict (P : PVM H) {N M : ℕ} (hNM : N ≤ M) (k : ℕ) (ψ : H) :
    P.proj (band N) (approxOp P M k ψ) = approxOp P N k ψ := by
  simp only [approxOp_apply, map_sum, map_smul]
  have hsub : dyadRange N k ⊆ dyadRange M k := by
    intro m hm
    simp only [dyadRange, Finset.mem_Ico] at hm ⊢
    have hNMz : (N : ℤ) ≤ (M : ℤ) := by exact_mod_cast hNM
    have h2 : (0 : ℤ) ≤ (2 : ℤ) ^ k := by positivity
    exact ⟨by nlinarith, by nlinarith⟩
  rw [← Finset.sum_subset hsub]
  · refine Finset.sum_congr rfl fun m hm => ?_
    congr 1
    have hcomp := DFunLike.congr_fun (P.proj_inter (measurableSet_band N) (measurableSet_cell k m)) ψ
    rw [Set.inter_eq_right.mpr (cell_subset_band hm)] at hcomp
    exact hcomp.symm
  · intro m _ hm
    rw [proj_comp_disjoint P (measurableSet_band N) (measurableSet_cell k m)
      (cell_disjoint_band_of_not_mem hm), smul_zero]

lemma approxOp_step_sub (P : PVM H) (N k : ℕ) (ψ : H) :
    approxOp P N (k + 1) ψ - approxOp P N k ψ =
      (((1 / (2 : ℝ) ^ (k + 1)) : ℝ) : ℂ) •
        P.proj (⋃ m ∈ dyadRange N k, cell (k + 1) (2 * m + 1)) ψ := by
  have hrange : dyadRange N (k + 1) =
      Finset.Ico (2 * (-(N : ℤ) * (2 : ℤ) ^ k)) (2 * ((N : ℤ) * (2 : ℤ) ^ k)) := by
    simp only [dyadRange, pow_succ]
    congr 1 <;> ring
  rw [approxOp_apply, approxOp_apply, hrange, sum_Ico_double]
  change (∑ m ∈ dyadRange N k, _) - (∑ m ∈ dyadRange N k, _) = _
  rw [← Finset.sum_sub_distrib]
  have hdisj : Set.Pairwise (dyadRange N k : Set ℤ)
      (Function.onFun Disjoint (fun m => cell (k + 1) (2 * m + 1))) := by
    intro m₁ _ m₂ _ hne
    exact cell_pairwise_disjoint (k + 1) (by omega)
  rw [proj_biUnion_finset P (dyadRange N k) (fun m => cell (k + 1) (2 * m + 1))
    (fun m _ => measurableSet_cell (k + 1) (2 * m + 1)) hdisj, Finset.smul_sum]
  refine Finset.sum_congr rfl fun m _ => ?_
  have hsplit : P.proj (cell k m) ψ =
      P.proj (cell (k + 1) (2 * m)) ψ + P.proj (cell (k + 1) (2 * m + 1)) ψ := by
    rw [cell_split k m]
    exact proj_union_disjoint P (measurableSet_cell (k + 1) (2 * m))
      (measurableSet_cell (k + 1) (2 * m + 1))
      (cell_pairwise_disjoint (k + 1) (by omega)) ψ
  rw [hsplit, smul_add]
  have h2 : (0 : ℝ) < (2 : ℝ) ^ k := by positivity
  have hc0 : (dyadVal (k + 1) (2 * m) : ℂ) = (dyadVal k m : ℂ) := by
    exact congrArg Complex.ofReal <| by
      unfold dyadVal
      push_cast
      rw [pow_succ]
      field_simp [h2.ne']
  have hc1 : (dyadVal (k + 1) (2 * m + 1) : ℂ) - (dyadVal k m : ℂ) =
      (((1 / (2 : ℝ) ^ (k + 1)) : ℝ) : ℂ) := by
    rw [← Complex.ofReal_sub]
    exact congrArg Complex.ofReal <| by
      unfold dyadVal
      push_cast
      rw [pow_succ]
      field_simp [h2.ne']
      ring
  rw [hc0, ← hc1, sub_smul]
  abel

lemma approxOp_step_norm_le (P : PVM H) (N k : ℕ) :
    ‖approxOp P N (k + 1) - approxOp P N k‖ ≤ ((1 / 2 : ℝ) ^ k) := by
  refine ContinuousLinearMap.opNorm_le_bound _ (by positivity) fun ψ => ?_
  rw [sub_apply, approxOp_step_sub, norm_smul, Complex.norm_real,
    Real.norm_of_nonneg (by positivity)]
  have hmeas : MeasurableSet (⋃ m ∈ dyadRange N k, cell (k + 1) (2 * m + 1)) :=
    Finset.measurableSet_biUnion _ fun m _ => measurableSet_cell (k + 1) (2 * m + 1)
  have hproj_le := proj_norm_le P hmeas ψ
  have hpow : (1 : ℝ) / (2 : ℝ) ^ (k + 1) ≤ (1 / 2 : ℝ) ^ k := by
    rw [one_div, one_div, inv_pow, pow_succ]
    exact inv_anti₀ (by positivity) (by linarith [pow_pos (show (0 : ℝ) < 2 by norm_num) k])
  calc (1 / (2 : ℝ) ^ (k + 1)) * ‖P.proj (⋃ m ∈ dyadRange N k, cell (k + 1) (2 * m + 1)) ψ‖
      ≤ (1 / (2 : ℝ) ^ (k + 1)) * ‖ψ‖ := mul_le_mul_of_nonneg_left hproj_le (by positivity)
    _ ≤ (1 / 2 : ℝ) ^ k * ‖ψ‖ := mul_le_mul_of_nonneg_right hpow (norm_nonneg ψ)

lemma approxOp_cauchy (P : PVM H) (N : ℕ) : CauchySeq (approxOp P N) :=
  cauchySeq_of_le_geometric (1 / 2) 1 (by norm_num) fun k => by
    rw [dist_comm, dist_eq_norm, one_mul]
    exact approxOp_step_norm_le P N k

/-- Bounded truncated spectral integral `A_N = ∫_{[-N, N)} a dP(a) ∈ B(H)`. -/
noncomputable def truncOp (P : PVM H) (N : ℕ) : H →L[ℂ] H :=
  atTop.limUnder (approxOp P N)

lemma tendsto_approxOp (P : PVM H) (N : ℕ) :
    Tendsto (approxOp P N) atTop (nhds (truncOp P N)) :=
  tendsto_nhds_limUnder (cauchySeq_tendsto_of_complete (approxOp_cauchy P N))

lemma tendsto_approxOp_apply (P : PVM H) (N : ℕ) (ψ : H) :
    Tendsto (fun k => approxOp P N k ψ) atTop (nhds (truncOp P N ψ)) :=
  ((ContinuousLinearMap.apply ℂ H ψ).continuous.tendsto _).comp (tendsto_approxOp P N)

/-- Pointwise dyadic step function approximating `band N` indicator of `id`. -/
noncomputable def dyadFn (N k : ℕ) (a : ℝ) : ℝ :=
  ∑ m ∈ dyadRange N k, (cell k m).indicator (fun _ => dyadVal k m) a

lemma measurable_dyadFn (N k : ℕ) : Measurable (dyadFn N k) :=
  Finset.measurable_sum _ fun m _ => measurable_const.indicator (measurableSet_cell k m)

lemma dyadFn_eq_of_mem_cell {N k : ℕ} {m : ℤ} (hm : m ∈ dyadRange N k) {a : ℝ}
    (ha : a ∈ cell k m) : dyadFn N k a = dyadVal k m := by
  unfold dyadFn
  rw [Finset.sum_eq_single m]
  · simp [Set.indicator_of_mem ha]
  · intro m' _ hne
    have hnot : a ∉ cell k m' := fun ha' =>
      Set.disjoint_left.mp (cell_pairwise_disjoint k hne.symm) ha ha'
    simp [Set.indicator_of_notMem hnot]
  · intro h; exact absurd hm h

lemma dyadFn_eq_zero_of_not_mem_band {N k : ℕ} {a : ℝ} (ha : a ∉ band N) :
    dyadFn N k a = 0 := by
  unfold dyadFn
  refine Finset.sum_eq_zero fun m hm => ?_
  have hnot : a ∉ cell k m := fun h => ha (cell_subset_band hm h)
  simp [Set.indicator_of_notMem hnot]

lemma abs_dyadFn_le (N k : ℕ) (a : ℝ) : |dyadFn N k a| ≤ (N : ℝ) := by
  by_cases ha : a ∈ band N
  · set m := ⌊a * (2 : ℝ) ^ k⌋
    have hm : m ∈ dyadRange N k := floor_mem_dyadRange ha
    have hcell : a ∈ cell k m := mem_cell_floor k a
    rw [dyadFn_eq_of_mem_cell hm hcell]
    have hsub := cell_subset_band hm hcell
    have hval_le : dyadVal k m ≤ a := hcell.1
    have hlow : -(N : ℝ) ≤ dyadVal k m := by
      have h2 : (0 : ℝ) < (2 : ℝ) ^ k := by positivity
      simp only [dyadRange, Finset.mem_Ico] at hm
      have : -(N : ℝ) * (2 : ℝ) ^ k ≤ (m : ℝ) := by exact_mod_cast hm.1
      exact (le_div_iff₀ h2).mpr this
    exact abs_le.mpr ⟨hlow, hval_le.trans ha.2.le⟩
  · rw [dyadFn_eq_zero_of_not_mem_band ha, abs_zero]
    exact Nat.cast_nonneg N

lemma tendsto_dyadFn (N : ℕ) (a : ℝ) :
    Tendsto (fun k => dyadFn N k a) atTop (nhds ((band N).indicator id a)) := by
  by_cases ha : a ∈ band N
  · rw [Set.indicator_of_mem ha, id]
    refine Metric.tendsto_atTop.mpr fun ε hε => ?_
    obtain ⟨K, hK⟩ := exists_pow_lt_of_lt_one hε (show (1 / 2 : ℝ) < 1 by norm_num)
    refine ⟨K, fun k hk => ?_⟩
    set m := ⌊a * (2 : ℝ) ^ k⌋
    have hm : m ∈ dyadRange N k := floor_mem_dyadRange ha
    have hcell : a ∈ cell k m := mem_cell_floor k a
    rw [dyadFn_eq_of_mem_cell hm hcell, Real.dist_eq, abs_sub_comm]
    have h2 : (0 : ℝ) < (2 : ℝ) ^ k := by positivity
    have hge : 0 ≤ a - dyadVal k m := sub_nonneg.mpr hcell.1
    have hlt : a - dyadVal k m < (1 / 2 : ℝ) ^ k := by
      unfold dyadVal
      have hsub : ((m : ℝ) + 1) / (2 : ℝ) ^ k - (m : ℝ) / (2 : ℝ) ^ k = (1 / 2 : ℝ) ^ k := by
        rw [one_div, inv_pow]; ring
      linarith [hcell.2]
    rw [abs_of_nonneg hge]
    exact hlt.trans_le ((pow_le_pow_of_le_one (by norm_num) (by norm_num) hk).trans hK.le)
  · rw [Set.indicator_of_notMem ha]
    exact tendsto_const_nhds.congr fun k => (dyadFn_eq_zero_of_not_mem_band ha).symm

lemma dyadFn_sq_eq (N k : ℕ) (a : ℝ) :
    (dyadFn N k a) ^ 2 =
      ∑ m ∈ dyadRange N k, (cell k m).indicator (fun _ => (dyadVal k m) ^ 2) a := by
  by_cases ha : a ∈ band N
  · set m := ⌊a * (2 : ℝ) ^ k⌋
    have hm : m ∈ dyadRange N k := floor_mem_dyadRange ha
    have hcell : a ∈ cell k m := mem_cell_floor k a
    rw [dyadFn_eq_of_mem_cell hm hcell, Finset.sum_eq_single m]
    · simp [Set.indicator_of_mem hcell]
    · intro m' _ hne
      have hnot : a ∉ cell k m' := fun ha' =>
        Set.disjoint_left.mp (cell_pairwise_disjoint k hne.symm) hcell ha'
      simp [Set.indicator_of_notMem hnot]
    · intro h; exact absurd hm h
  · rw [dyadFn_eq_zero_of_not_mem_band ha, zero_pow two_ne_zero]
    symm
    refine Finset.sum_eq_zero fun m hm => ?_
    have hnot : a ∉ cell k m := fun h => ha (cell_subset_band hm h)
    simp [Set.indicator_of_notMem hnot]

lemma approxOp_norm_sq (P : PVM H) (N k : ℕ) (ψ : H) :
    ‖approxOp P N k ψ‖ ^ 2 = ∫ a, (dyadFn N k a) ^ 2 ∂(P.specMeasure ψ) := by
  rw [approxOp_apply]
  have horth : ∀ m₁ ∈ dyadRange N k, ∀ m₂ ∈ dyadRange N k, m₁ ≠ m₂ →
      inner ℂ (((dyadVal k m₁ : ℝ) : ℂ) • P.proj (cell k m₁) ψ)
        (((dyadVal k m₂ : ℝ) : ℂ) • P.proj (cell k m₂) ψ) = 0 := by
    intro m₁ _ m₂ _ hne
    rw [inner_smul_left, inner_smul_right,
      inner_proj_disjoint P (measurableSet_cell k m₁) (measurableSet_cell k m₂)
        (cell_pairwise_disjoint k hne)]
    simp
  rw [norm_sq_sum_orthogonal _ _ horth]
  have hterm : ∀ m ∈ dyadRange N k,
      ‖((dyadVal k m : ℝ) : ℂ) • P.proj (cell k m) ψ‖ ^ 2 =
        ∫ a, (cell k m).indicator (fun _ => (dyadVal k m) ^ 2) a ∂(P.specMeasure ψ) := by
    intro m _
    rw [norm_smul, Complex.norm_real, mul_pow, Real.norm_eq_abs, sq_abs,
      integral_indicator_const _ (measurableSet_cell k m), smul_eq_mul,
      specMeasure_real_apply P ψ (measurableSet_cell k m), mul_comm]
  rw [Finset.sum_congr rfl hterm, ← integral_finsetSum]
  · congr 1; ext a; exact (dyadFn_sq_eq N k a).symm
  · intro m _
    exact (integrable_const _).indicator (measurableSet_cell k m)

lemma approxOp_inner_self (P : PVM H) (N k : ℕ) (ψ : H) :
    inner ℂ ψ (approxOp P N k ψ) = ((∫ a, dyadFn N k a ∂(P.specMeasure ψ) : ℝ) : ℂ) := by
  rw [approxOp_apply, inner_sum]
  have hsum : (∑ m ∈ dyadRange N k,
      inner ℂ ψ (((dyadVal k m : ℝ) : ℂ) • P.proj (cell k m) ψ)) =
      ((∑ m ∈ dyadRange N k,
        ∫ a, (cell k m).indicator (fun _ => dyadVal k m) a ∂(P.specMeasure ψ) : ℝ) : ℂ) := by
    rw [Complex.ofReal_sum]
    refine Finset.sum_congr rfl fun m _ => ?_
    rw [inner_smul_right, inner_proj_self P (measurableSet_cell k m),
      integral_indicator_const _ (measurableSet_cell k m), smul_eq_mul,
      specMeasure_real_apply P ψ (measurableSet_cell k m), mul_comm]
    push_cast; rfl
  rw [hsum, ← integral_finsetSum]
  · rfl
  · intro m _
    exact (integrable_const _).indicator (measurableSet_cell k m)

lemma truncOp_selfAdjoint (P : PVM H) (N : ℕ) (φ ψ : H) :
    inner ℂ φ (truncOp P N ψ) = inner ℂ (truncOp P N φ) ψ := by
  have h1 : Tendsto (fun k => inner ℂ φ (approxOp P N k ψ)) atTop
      (nhds (inner ℂ φ (truncOp P N ψ))) :=
    ((innerSL ℂ φ).continuous.tendsto _).comp (tendsto_approxOp_apply P N ψ)
  have h2 : Tendsto (fun k => inner ℂ (approxOp P N k φ) ψ) atTop
      (nhds (inner ℂ (truncOp P N φ) ψ)) :=
    ((Continuous.inner continuous_id continuous_const).tendsto _).comp (tendsto_approxOp_apply P N φ)
  have heq : (fun k => inner ℂ φ (approxOp P N k ψ)) =
      fun k => inner ℂ (approxOp P N k φ) ψ :=
    funext fun k => approxOp_selfAdjoint P N k φ ψ
  rw [heq] at h1
  exact tendsto_nhds_unique h1 h2

lemma truncOp_comm_proj (P : PVM H) (N : ℕ) {s : Set ℝ} (hs : MeasurableSet s) (ψ : H) :
    truncOp P N (P.proj s ψ) = P.proj s (truncOp P N ψ) := by
  have h1 := tendsto_approxOp_apply P N (P.proj s ψ)
  have h2 := ((P.proj s).continuous.tendsto _).comp (tendsto_approxOp_apply P N ψ)
  have heq : (fun k => approxOp P N k (P.proj s ψ)) = fun k => P.proj s (approxOp P N k ψ) :=
    funext fun k => approxOp_comm_proj P N k hs ψ
  rw [heq] at h1
  exact tendsto_nhds_unique h1 h2

lemma truncOp_restrict (P : PVM H) {N M : ℕ} (hNM : N ≤ M) (ψ : H) :
    P.proj (band N) (truncOp P M ψ) = truncOp P N ψ := by
  have h1 : Tendsto (fun k => P.proj (band N) (approxOp P M k ψ)) atTop
      (nhds (P.proj (band N) (truncOp P M ψ))) :=
    ((P.proj (band N)).continuous.tendsto _).comp (tendsto_approxOp_apply P M ψ)
  have h2 := tendsto_approxOp_apply P N ψ
  have heq : (fun k => P.proj (band N) (approxOp P M k ψ)) = fun k => approxOp P N k ψ :=
    funext fun k => approxOp_restrict P hNM k ψ
  rw [heq] at h1
  exact tendsto_nhds_unique h1 h2

lemma truncOp_norm_sq (P : PVM H) (N : ℕ) (ψ : H) :
    ‖truncOp P N ψ‖ ^ 2 = ∫ a in band N, a ^ 2 ∂(P.specMeasure ψ) := by
  have h1 : Tendsto (fun k => ‖approxOp P N k ψ‖ ^ 2) atTop (nhds (‖truncOp P N ψ‖ ^ 2)) :=
    ((continuous_norm.pow 2).tendsto _).comp (tendsto_approxOp_apply P N ψ)
  have h2 : Tendsto (fun k => ∫ a, (dyadFn N k a) ^ 2 ∂(P.specMeasure ψ)) atTop
      (nhds (∫ a, (band N).indicator (fun x : ℝ => x ^ 2) a ∂(P.specMeasure ψ))) := by
    refine tendsto_integral_of_dominated_convergence (fun _ => (N : ℝ) ^ 2)
      (fun k => ((measurable_dyadFn N k).pow_const 2).aestronglyMeasurable)
      (integrable_const _) (fun k => Filter.Eventually.of_forall fun a => ?_)
      (Filter.Eventually.of_forall fun a => ?_)
    · rw [Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _), ← sq_abs]
      exact pow_le_pow_left₀ (abs_nonneg _) (abs_dyadFn_le N k a) 2
    · have ht := ((continuous_pow 2).tendsto _).comp (tendsto_dyadFn N a)
      have hind : ((band N).indicator id a) ^ 2 = (band N).indicator (fun x : ℝ => x ^ 2) a := by
        by_cases h : a ∈ band N <;> simp [h]
      simpa only [Function.comp_def, hind] using ht
  have heq : (fun k => ‖approxOp P N k ψ‖ ^ 2) =
      fun k => ∫ a, (dyadFn N k a) ^ 2 ∂(P.specMeasure ψ) :=
    funext fun k => approxOp_norm_sq P N k ψ
  rw [heq] at h1
  rw [tendsto_nhds_unique h1 h2, integral_indicator (measurableSet_band N)]

lemma truncOp_inner_self (P : PVM H) (N : ℕ) (ψ : H) :
    inner ℂ ψ (truncOp P N ψ) = ((∫ a in band N, a ∂(P.specMeasure ψ) : ℝ) : ℂ) := by
  have h1 : Tendsto (fun k => inner ℂ ψ (approxOp P N k ψ)) atTop
      (nhds (inner ℂ ψ (truncOp P N ψ))) :=
    ((innerSL ℂ ψ).continuous.tendsto _).comp (tendsto_approxOp_apply P N ψ)
  have h2_real : Tendsto (fun k => ∫ a, dyadFn N k a ∂(P.specMeasure ψ)) atTop
      (nhds (∫ a, (band N).indicator id a ∂(P.specMeasure ψ))) := by
    refine tendsto_integral_of_dominated_convergence (fun _ => (N : ℝ))
      (fun k => (measurable_dyadFn N k).aestronglyMeasurable)
      (integrable_const _) (fun k => Filter.Eventually.of_forall fun a => ?_)
      (Filter.Eventually.of_forall fun a => tendsto_dyadFn N a)
    rw [Real.norm_eq_abs]
    exact abs_dyadFn_le N k a
  have h2 : Tendsto (fun k => ((∫ a, dyadFn N k a ∂(P.specMeasure ψ) : ℝ) : ℂ)) atTop
      (nhds ((∫ a, (band N).indicator id a ∂(P.specMeasure ψ) : ℝ) : ℂ)) :=
    (Complex.continuous_ofReal.tendsto _).comp h2_real
  have heq : (fun k => inner ℂ ψ (approxOp P N k ψ)) =
      fun k => ((∫ a, dyadFn N k a ∂(P.specMeasure ψ) : ℝ) : ℂ) :=
    funext fun k => approxOp_inner_self P N k ψ
  rw [heq] at h1
  rw [tendsto_nhds_unique h1 h2, integral_indicator (measurableSet_band N)]
  rfl

lemma truncOp_sub_norm_sq (P : PVM H) {N M : ℕ} (hNM : N ≤ M) (ψ : H) :
    ‖truncOp P M ψ - truncOp P N ψ‖ ^ 2 =
      (∫ a in band M, a ^ 2 ∂(P.specMeasure ψ)) - (∫ a in band N, a ^ 2 ∂(P.specMeasure ψ)) := by
  have hpyth := proj_pythagoras P (measurableSet_band N) (truncOp P M ψ)
  rw [truncOp_restrict P hNM ψ, truncOp_norm_sq P M ψ, truncOp_norm_sq P N ψ] at hpyth
  linarith

lemma band_mono : Monotone band := by
  intro N M hNM a ha
  have hle : (N : ℝ) ≤ (M : ℝ) := by exact_mod_cast hNM
  exact ⟨by linarith [ha.1], by linarith [ha.2]⟩

lemma iUnion_band : (⋃ N : ℕ, band N) = Set.univ := by
  ext a
  simp only [Set.mem_iUnion, Set.mem_univ, iff_true]
  refine ⟨⌈|a|⌉₊ + 1, ?_, ?_⟩
  · have h1 : |a| ≤ (⌈|a|⌉₊ : ℝ) := Nat.le_ceil |a|
    have h2 : -|a| ≤ a := neg_abs_le a
    push_cast; linarith
  · have h1 : |a| ≤ (⌈|a|⌉₊ : ℝ) := Nat.le_ceil |a|
    have h2 : a ≤ |a| := le_abs_self a
    push_cast; linarith

lemma tendsto_proj_band (P : PVM H) (ψ : H) :
    Tendsto (fun N => P.proj (band N) ψ) atTop (nhds ψ) := by
  have hmeas : Tendsto (fun N => P.specMeasure ψ (band N)) atTop
      (nhds (P.specMeasure ψ (⋃ N, band N))) :=
    tendsto_measure_iUnion_atTop band_mono
  rw [iUnion_band] at hmeas
  have hreal : Tendsto (fun N => (P.specMeasure ψ).real (band N)) atTop
      (nhds ((P.specMeasure ψ).real Set.univ)) :=
    (ENNReal.tendsto_toReal (measure_ne_top (P.specMeasure ψ) Set.univ)).comp hmeas
  have hnorm_sq : Tendsto (fun N => ‖ψ - P.proj (band N) ψ‖ ^ 2) atTop (nhds 0) := by
    have hsub : Tendsto (fun N => ‖ψ‖ ^ 2 - ‖P.proj (band N) ψ‖ ^ 2) atTop (nhds (‖ψ‖ ^ 2 - ‖ψ‖ ^ 2)) := by
      refine tendsto_const_nhds.sub ?_
      simpa only [specMeasure_real_apply P ψ (measurableSet_band _),
        specMeasure_real_apply P ψ MeasurableSet.univ, P.proj_univ,
        ContinuousLinearMap.id_apply] using hreal
    rw [sub_self] at hsub
    refine hsub.congr fun N => ?_
    linarith [proj_pythagoras P (measurableSet_band N) ψ]
  rw [tendsto_iff_norm_sub_tendsto_zero]
  have hsqrt : Tendsto (fun N => Real.sqrt (‖ψ - P.proj (band N) ψ‖ ^ 2)) atTop (nhds (Real.sqrt 0)) :=
    (Real.continuous_sqrt.tendsto 0).comp hnorm_sq
  rw [Real.sqrt_zero] at hsqrt
  refine hsqrt.congr fun N => ?_
  rw [Real.sqrt_sq (norm_nonneg _), norm_sub_rev]

lemma tendsto_setIntegral_band_of_integrable {μ : Measure ℝ} {f : ℝ → ℝ}
    (hf : Integrable f μ) :
    Tendsto (fun N => ∫ a in band N, f a ∂μ) atTop (nhds (∫ a, f a ∂μ)) := by
  have h := tendsto_integral_of_dominated_convergence (fun a => ‖f a‖)
    (fun N => hf.aestronglyMeasurable.indicator (measurableSet_band N))
    hf.norm
    (fun N => Filter.Eventually.of_forall fun a => by
      by_cases ha : a ∈ band N
      · simp [Set.indicator_of_mem ha]
      · simp [Set.indicator_of_notMem ha])
    (Filter.Eventually.of_forall fun a => by
      obtain ⟨N₀, hN₀⟩ : ∃ N₀, a ∈ band N₀ := by
        have : a ∈ ⋃ N, band N := by rw [iUnion_band]; trivial
        exact Set.mem_iUnion.mp this
      exact tendsto_const_nhds.congr' (Filter.eventually_atTop.mpr ⟨N₀, fun N hN =>
        (Set.indicator_of_mem (band_mono hN hN₀) f).symm⟩))
  refine h.congr fun N => integral_indicator (measurableSet_band N)

lemma truncOp_cauchy_of_integrable (P : PVM H) (ψ : H)
    (hψ : Integrable (fun a : ℝ => a ^ 2) (P.specMeasure ψ)) :
    CauchySeq (fun N => truncOp P N ψ) := by
  have hI : CauchySeq (fun N => ∫ a in band N, a ^ 2 ∂(P.specMeasure ψ)) :=
    (tendsto_setIntegral_band_of_integrable hψ).cauchySeq
  rw [Metric.cauchySeq_iff] at hI ⊢
  intro ε hε
  obtain ⟨N₀, hN₀⟩ := hI (ε ^ 2) (sq_pos_of_pos hε)
  refine ⟨N₀, fun m hm n hn => ?_⟩
  rcases le_total n m with hnm | hmn
  · have hsq := truncOp_sub_norm_sq P hnm ψ
    have hdist := hN₀ m hm n hn
    rw [Real.dist_eq] at hdist
    have hlt : ‖truncOp P m ψ - truncOp P n ψ‖ ^ 2 < ε ^ 2 := by
      rw [hsq]; exact (le_abs_self _).trans_lt hdist
    rw [dist_eq_norm]
    nlinarith [norm_nonneg (truncOp P m ψ - truncOp P n ψ)]
  · have hsq := truncOp_sub_norm_sq P hmn ψ
    have hdist := hN₀ n hn m hm
    rw [Real.dist_eq] at hdist
    have hlt : ‖truncOp P n ψ - truncOp P m ψ‖ ^ 2 < ε ^ 2 := by
      rw [hsq]; exact (le_abs_self _).trans_lt hdist
    rw [dist_eq_norm, norm_sub_rev]
    nlinarith [norm_nonneg (truncOp P n ψ - truncOp P m ψ)]

lemma integrable_id_of_integrable_sq {μ : Measure ℝ} [IsFiniteMeasure μ]
    (h : Integrable (fun a : ℝ => a ^ 2) μ) :
    Integrable (fun a : ℝ => a) μ := by
  refine ((integrable_const (1 : ℝ)).add h).mono' measurable_id.aestronglyMeasurable ?_
  refine Filter.Eventually.of_forall fun a => ?_
  change ‖a‖ ≤ 1 + a ^ 2
  rw [Real.norm_eq_abs]
  nlinarith [sq_nonneg (|a| - 1), sq_abs a]

lemma integrable_sq_of_proj_band (P : PVM H) (N : ℕ) (ψ : H) :
    Integrable (fun a : ℝ => a ^ 2) (P.specMeasure (P.proj (band N) ψ)) := by
  rw [specMeasure_proj P (measurableSet_band N) ψ]
  refine (integrable_const ((N : ℝ) ^ 2)).mono'
    (measurable_id.pow_const 2).aestronglyMeasurable ?_
  rw [ae_restrict_iff' (measurableSet_band N)]
  refine Filter.Eventually.of_forall fun a ha => ?_
  rw [Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _), ← sq_abs]
  have habs : |a| ≤ (N : ℝ) := abs_le.mpr ⟨ha.1, ha.2.le⟩
  exact pow_le_pow_left₀ (abs_nonneg _) habs 2

end PVMObservable

section PublicPVM

open PVMObservable

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-- Exact spectral domain `Dom(A) = {ψ ∈ H | ∫ a² dμ_ψ(a) < ∞}` of the self-adjoint observable
`A = ∫ a dP(a)` associated with a projection-valued measure `P` on `ℝ`, packaged as a complex
linear subspace of `H`. -/
noncomputable def pvmDom (P : PVM H) : Submodule ℂ H where
  carrier := {ψ : H | Integrable (fun a : ℝ => a ^ 2) (P.specMeasure ψ)}
  zero_mem' := by
    change Integrable (fun a : ℝ => a ^ 2) (P.specMeasure 0)
    rw [specMeasure_zero]; exact integrable_zero_measure
  add_mem' := fun {φ ψ} hφ hψ => by
    change Integrable (fun a : ℝ => a ^ 2) (P.specMeasure (φ + ψ))
    have hsum : Integrable (fun a : ℝ => a ^ 2)
        ((2 : ENNReal) • P.specMeasure φ + (2 : ENNReal) • P.specMeasure ψ) :=
      (hφ.smul_measure ENNReal.ofNat_ne_top).add_measure (hψ.smul_measure ENNReal.ofNat_ne_top)
    exact hsum.mono_measure (specMeasure_add_le P φ ψ)
  smul_mem' := fun c {ψ} hψ => by
    change Integrable (fun a : ℝ => a ^ 2) (P.specMeasure (c • ψ))
    rw [specMeasure_smul]
    exact hψ.smul_measure ENNReal.ofReal_ne_top

theorem mem_pvmDom_iff (P : PVM H) (ψ : H) :
    ψ ∈ pvmDom P ↔ Integrable (fun a : ℝ => a ^ 2) (P.specMeasure ψ) := Iff.rfl

/-- Unbounded self-adjoint observable `A = ∫ a dP(a)` defined on `pvmDom P` as the norm limit
`lim_{N → ∞} ∫_{[-N, N)} a dP(a) ψ`. -/
noncomputable def pvmOp (P : PVM H) (ψ : H) (_ : ψ ∈ pvmDom P) : H :=
  atTop.limUnder (fun N => truncOp P N ψ)

theorem tendsto_truncOp_pvmOp (P : PVM H) (ψ : H) (hψ : ψ ∈ pvmDom P) :
    Tendsto (fun N => truncOp P N ψ) atTop (nhds (pvmOp P ψ hψ)) :=
  tendsto_nhds_limUnder (cauchySeq_tendsto_of_complete (truncOp_cauchy_of_integrable P ψ hψ))

theorem pvmOp_add (P : PVM H) {φ ψ : H} (hφ : φ ∈ pvmDom P) (hψ : ψ ∈ pvmDom P) :
    pvmOp P (φ + ψ) ((pvmDom P).add_mem hφ hψ) = pvmOp P φ hφ + pvmOp P ψ hψ := by
  have h1 := tendsto_truncOp_pvmOp P (φ + ψ) ((pvmDom P).add_mem hφ hψ)
  have h2 := (tendsto_truncOp_pvmOp P φ hφ).add (tendsto_truncOp_pvmOp P ψ hψ)
  have heq : (fun N => truncOp P N (φ + ψ)) = fun N => truncOp P N φ + truncOp P N ψ :=
    funext fun N => map_add (truncOp P N) φ ψ
  rw [heq] at h1
  exact tendsto_nhds_unique h1 h2

theorem pvmOp_smul (P : PVM H) (c : ℂ) {ψ : H} (hψ : ψ ∈ pvmDom P) :
    pvmOp P (c • ψ) ((pvmDom P).smul_mem c hψ) = c • pvmOp P ψ hψ := by
  have h1 := tendsto_truncOp_pvmOp P (c • ψ) ((pvmDom P).smul_mem c hψ)
  have h2 := (tendsto_truncOp_pvmOp P ψ hψ).const_smul c
  have heq : (fun N => truncOp P N (c • ψ)) = fun N => c • truncOp P N ψ :=
    funext fun N => map_smul (truncOp P N) c ψ
  rw [heq] at h1
  exact tendsto_nhds_unique h1 h2

/-- `pvmOp P` packaged as a `ℂ`-linear operator `pvmDom P →ₗ[ℂ] H`. -/
noncomputable def pvmOp_linear (P : PVM H) : pvmDom P →ₗ[ℂ] H where
  toFun v := pvmOp P v.1 v.2
  map_add' u v := pvmOp_add P u.2 v.2
  map_smul' c v := pvmOp_smul P c v.2

/-- The domain `Dom(A)` of the observable associated with any PVM is dense in `H`. -/
theorem pvmDom_dense (P : PVM H) : Dense (pvmDom P : Set H) := by
  intro ψ
  rw [mem_closure_iff_seq_limit]
  exact ⟨fun N => P.proj (band N) ψ, fun N => integrable_sq_of_proj_band P N ψ,
    tendsto_proj_band P ψ⟩

/-- Symmetry of `A = ∫ a dP(a)` on `Dom(A)`. -/
theorem pvmOp_symm (P : PVM H) {φ ψ : H} (hφ : φ ∈ pvmDom P) (hψ : ψ ∈ pvmDom P) :
    inner ℂ φ (pvmOp P ψ hψ) = inner ℂ (pvmOp P φ hφ) ψ := by
  have h1 : Tendsto (fun N => inner ℂ φ (truncOp P N ψ)) atTop
      (nhds (inner ℂ φ (pvmOp P ψ hψ))) :=
    ((innerSL ℂ φ).continuous.tendsto _).comp (tendsto_truncOp_pvmOp P ψ hψ)
  have h2 : Tendsto (fun N => inner ℂ (truncOp P N φ) ψ) atTop
      (nhds (inner ℂ (pvmOp P φ hφ) ψ)) :=
    ((Continuous.inner continuous_id continuous_const).tendsto _).comp
      (tendsto_truncOp_pvmOp P φ hφ)
  have heq : (fun N => inner ℂ φ (truncOp P N ψ)) = fun N => inner ℂ (truncOp P N φ) ψ :=
    funext fun N => truncOp_selfAdjoint P N φ ψ
  rw [heq] at h1
  exact tendsto_nhds_unique h1 h2

/-- Exact `L²` spectral isometry `‖A ψ‖² = ∫ a² dμ_ψ(a)` for every `ψ ∈ Dom(A)`. -/
theorem pvmOp_norm_sq (P : PVM H) {ψ : H} (hψ : ψ ∈ pvmDom P) :
    ‖pvmOp P ψ hψ‖ ^ 2 = ∫ a, a ^ 2 ∂(P.specMeasure ψ) := by
  have h1 : Tendsto (fun N => ‖truncOp P N ψ‖ ^ 2) atTop (nhds (‖pvmOp P ψ hψ‖ ^ 2)) :=
    ((continuous_norm.pow 2).tendsto _).comp (tendsto_truncOp_pvmOp P ψ hψ)
  have h2 := tendsto_setIntegral_band_of_integrable hψ
  have heq : (fun N => ‖truncOp P N ψ‖ ^ 2) = fun N => ∫ a in band N, a ^ 2 ∂(P.specMeasure ψ) :=
    funext fun N => truncOp_norm_sq P N ψ
  rw [heq] at h1
  exact tendsto_nhds_unique h1 h2

/-- Exact complex expectation value `⟪ψ, A ψ⟫ = ∫ a dμ_ψ(a)` for every `ψ ∈ Dom(A)`. -/
theorem pvmOp_inner_self (P : PVM H) {ψ : H} (hψ : ψ ∈ pvmDom P) :
    inner ℂ ψ (pvmOp P ψ hψ) = ((∫ a, a ∂(P.specMeasure ψ) : ℝ) : ℂ) := by
  have h1 : Tendsto (fun N => inner ℂ ψ (truncOp P N ψ)) atTop
      (nhds (inner ℂ ψ (pvmOp P ψ hψ))) :=
    ((innerSL ℂ ψ).continuous.tendsto _).comp (tendsto_truncOp_pvmOp P ψ hψ)
  have h2 : Tendsto (fun N => ((∫ a in band N, a ∂(P.specMeasure ψ) : ℝ) : ℂ)) atTop
      (nhds ((∫ a, a ∂(P.specMeasure ψ) : ℝ) : ℂ)) :=
    (Complex.continuous_ofReal.tendsto _).comp
      (tendsto_setIntegral_band_of_integrable (integrable_id_of_integrable_sq hψ))
  have heq : (fun N => inner ℂ ψ (truncOp P N ψ)) =
      fun N => ((∫ a in band N, a ∂(P.specMeasure ψ) : ℝ) : ℂ) :=
    funext fun N => truncOp_inner_self P N ψ
  rw [heq] at h1
  exact tendsto_nhds_unique h1 h2

/-- Exact real expectation value `Re ⟪ψ, A ψ⟫ = ∫ a dμ_ψ(a)` for every `ψ ∈ Dom(A)`. -/
theorem pvmOp_expectation (P : PVM H) {ψ : H} (hψ : ψ ∈ pvmDom P) :
    (inner ℂ ψ (pvmOp P ψ hψ)).re = ∫ a, a ∂(P.specMeasure ψ) := by
  rw [pvmOp_inner_self P hψ, Complex.ofReal_re]

/-- Action of `pvmOp P` on spectral-band vectors `P([-N, N)) u`: equals `truncOp P N u`. -/
theorem pvmOp_proj_band (P : PVM H) (N : ℕ) (u : H) :
    pvmOp P (P.proj (band N) u) (integrable_sq_of_proj_band P N u) = truncOp P N u := by
  have h1 := tendsto_truncOp_pvmOp P (P.proj (band N) u) (integrable_sq_of_proj_band P N u)
  have h2 : Tendsto (fun M => truncOp P M (P.proj (band N) u)) atTop (nhds (truncOp P N u)) :=
    tendsto_const_nhds.congr' (Filter.eventually_atTop.mpr ⟨N, fun M hNM => by
      dsimp only
      rw [truncOp_comm_proj P M (measurableSet_band N) u, truncOp_restrict P hNM u]⟩)
  exact tendsto_nhds_unique h1 h2

/-- Exact self-adjointness (`Dom(A*) = Dom(A)` and `A* = A`) of `A = ∫ a dP(a)`:
a pair `(φ, χ)` lies in the graph of the adjoint `A*` if and only if `φ ∈ Dom(A)` and `A φ = χ`. -/
theorem pvmOp_selfAdjoint (P : PVM H) (φ χ : H) :
    (∀ ψ (hψ : ψ ∈ pvmDom P), inner ℂ φ (pvmOp P ψ hψ) = inner ℂ χ ψ) ↔
      ∃ hφ : φ ∈ pvmDom P, pvmOp P φ hφ = χ := by
  constructor
  · intro h
    have htrunc : ∀ N : ℕ, truncOp P N φ = P.proj (band N) χ := fun N => by
      refine ext_inner_right ℂ fun u => ?_
      have hu := h (P.proj (band N) u) (integrable_sq_of_proj_band P N u)
      rw [pvmOp_proj_band P N u, truncOp_selfAdjoint P N φ u,
        P.proj_selfAdjoint (measurableSet_band N) χ u] at hu
      exact hu
    have hlintegral_le :
        (∫⁻ a, ENNReal.ofReal (a ^ 2) ∂(P.specMeasure φ)) ≤ ENNReal.ofReal (‖χ‖ ^ 2) := by
      have hsup : (fun a : ℝ => ENNReal.ofReal (a ^ 2)) =
          fun a => ⨆ N : ℕ, (band N).indicator (fun x : ℝ => ENNReal.ofReal (x ^ 2)) a := by
        ext a
        apply le_antisymm
        · obtain ⟨N, hN⟩ : ∃ N, a ∈ band N := by
            have : a ∈ ⋃ N, band N := by rw [iUnion_band]; trivial
            exact Set.mem_iUnion.mp this
          exact le_iSup_of_le N (by simp [Set.indicator_of_mem hN])
        · exact iSup_le fun N => by
            by_cases hN : a ∈ band N
            · simp [Set.indicator_of_mem hN]
            · simp [Set.indicator_of_notMem hN]
      have hmono : Monotone (fun N : ℕ =>
          (band N).indicator (fun x : ℝ => ENNReal.ofReal (x ^ 2))) := by
        intro N M hNM a
        by_cases hN : a ∈ band N
        · simp [Set.indicator_of_mem hN, Set.indicator_of_mem (band_mono hNM hN)]
        · simp [Set.indicator_of_notMem hN]
      have hmeas_ind : ∀ N : ℕ, Measurable
          (fun a : ℝ => (band N).indicator (fun x : ℝ => ENNReal.ofReal (x ^ 2)) a) := fun N =>
        (ENNReal.continuous_ofReal.measurable.comp (measurable_id.pow_const 2)).indicator
          (measurableSet_band N)
      rw [hsup, lintegral_iSup hmeas_ind hmono]
      refine iSup_le fun N => ?_
      rw [lintegral_indicator (measurableSet_band N)]
      have hint_N : IntegrableOn (fun a : ℝ => a ^ 2) (band N) (P.specMeasure φ) := by
        refine (integrable_const ((N : ℝ) ^ 2)).mono'
          (measurable_id.pow_const 2).aestronglyMeasurable ?_
        rw [ae_restrict_iff' (measurableSet_band N)]
        refine Filter.Eventually.of_forall fun a ha => ?_
        rw [Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _), ← sq_abs]
        exact pow_le_pow_left₀ (abs_nonneg _) (abs_le.mpr ⟨ha.1, ha.2.le⟩) 2
      rw [← ofReal_integral_eq_lintegral_ofReal hint_N
        (Filter.Eventually.of_forall fun _ => sq_nonneg _)]
      rw [← truncOp_norm_sq P N φ, htrunc N]
      exact ENNReal.ofReal_le_ofReal
        (pow_le_pow_left₀ (norm_nonneg _) (proj_norm_le P (measurableSet_band N) χ) 2)
    have hφ : φ ∈ pvmDom P := by
      refine ⟨(measurable_id.pow_const 2).aestronglyMeasurable, ?_⟩
      rw [HasFiniteIntegral]
      have hnorm : (fun a : ℝ => ‖a ^ 2‖ₑ) = fun a : ℝ => ENNReal.ofReal (a ^ 2) := by
        ext a
        rw [Real.enorm_eq_ofReal (sq_nonneg a)]
      rw [hnorm]
      exact hlintegral_le.trans_lt ENNReal.ofReal_lt_top
    refine ⟨hφ, ?_⟩
    have h1 := tendsto_truncOp_pvmOp P φ hφ
    have h2 := tendsto_proj_band P χ
    have heq : (fun N => truncOp P N φ) = fun N => P.proj (band N) χ := funext htrunc
    rw [heq] at h1
    exact tendsto_nhds_unique h1 h2
  · rintro ⟨hφ, rfl⟩ ψ hψ
    exact pvmOp_symm P hφ hψ

end PublicPVM

end PVMObservable

/-!
==============================================================================
  PART 10: LÜDERS PROJECTION UPDATE, NORMAL MIXTURES & OPERATOR TRACE (§3.6)
==============================================================================
-/
section Update

open scoped InnerProductSpace

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]

theorem null_of_certain (p : ClosedSubmodule ℂ H → ℝ)
    (hprob : ∀ A, p A ∈ Set.Icc 0 1)
    (hadd : ∀ A B : ClosedSubmodule ℂ H, B ≤ Aᗮ → p (A ⊔ B) = p A + p B)
    {K R : ClosedSubmodule ℂ H} (hc : p K = 1) (hR : R ≤ Kᗮ) : p R = 0 := by
  have h := hadd K R hR; linarith [(hprob (K ⊔ R)).2, (hprob R).1]

/-- Cauchy–Schwarz for the positive semidefinite form `⟨σ u, v⟩` forces zero diagonal weight
to annihilate the vector. -/
theorem map_eq_zero_of_zero_weight (σ : H →ₗ[ℂ] H) (hσ : σ.IsPositive) {x : H}
    (hx : (inner ℂ (σ x) x).re = 0) : σ x = 0 := by
  let form : PreInnerProductSpace.Core ℂ H :=
    { inner u v := inner ℂ (σ u) v
      conj_inner_symm u v := (inner_conj_symm _ _).trans (hσ.isSymmetric _ _).symm
      re_inner_nonneg := hσ.re_inner_nonneg_left
      add_left := fun u v w => by rw [map_add, inner_add_left]
      smul_left := fun u v c => by rw [map_smul, inner_smul_left] }
  have h := @InnerProductSpace.Core.inner_mul_inner_self_le ℂ H _ _ _ form x (σ x)
  change ‖inner ℂ (σ x) (σ x)‖ * ‖inner ℂ (σ (σ x)) x‖ ≤
    (inner ℂ (σ x) x).re * (inner ℂ (σ (σ x)) (σ x)).re at h
  rw [hσ.isSymmetric (σ x) x, hx, zero_mul, ← sq] at h
  simpa using le_antisymm h (sq_nonneg _)

/-- Algebraic support from certainty: any positive linear map vanishing on `ker P` satisfies
`P τ = τ = τ P`. -/
theorem support_of_psd_ker_zero (P τ : H →ₗ[ℂ] H)
    (hproj : ∀ x, P (P x) = P x) (hself : ∀ x y, inner ℂ (P x) y = inner ℂ x (P y))
    (hτ : τ.IsPositive) (hcert : ∀ y, P y = 0 → (inner ℂ (τ y) y).re = 0) :
    (∀ x, P (τ x) = τ x) ∧ (∀ x, τ (P x) = τ x) := by
  have hright (x : H) : τ (P x) = τ x :=
    (sub_eq_zero.mp ((map_sub τ x (P x)).symm.trans
      (map_eq_zero_of_zero_weight τ hτ (hcert (x - P x) (by rw [map_sub, hproj, sub_self]))))).symm
  exact ⟨fun x => ext_inner_right ℂ fun y => by rw [hself, hτ.isSymmetric, hright, hτ.isSymmetric], hright⟩

theorem projection_ratio_determines_map (P ρ τ : H →ₗ[ℂ] H) (w : ℝ)
    (h : ∀ x : H, inner ℂ (τ x) x = inner ℂ (((P.comp ρ).comp P) x) x / (w : ℂ)) :
    τ = ((w : ℂ)⁻¹) • (P.comp ρ).comp P :=
  (ext_inner_map _ _).mp fun x => by rw [h]; simp [inner_smul_left, div_eq_inv_mul]

/-- Trace-free uniqueness of ideal Lüders compression on a fixed projection range. -/
theorem supported_ratio_determines_compression (P ρ τ : H →ₗ[ℂ] H) (w : ℝ)
    (hproj : ∀ x, P (P x) = P x)
    (hself : ∀ x y, inner ℂ (P x) y = inner ℂ x (P y))
    (hleft : ∀ x, P (τ x) = τ x) (hright : ∀ x, τ (P x) = τ x)
    (h : ∀ y, P y = y → inner ℂ (τ y) y = inner ℂ (ρ y) y / (w : ℂ)) :
    τ = ((w : ℂ)⁻¹) • (P.comp ρ).comp P :=
  projection_ratio_determines_map P ρ τ w fun x => by
    calc inner ℂ (τ x) x = inner ℂ (P (τ (P x))) x := by rw [hright, hleft]
      _ = inner ℂ (τ (P x)) (P x) := hself _ _
      _ = inner ℂ (ρ (P x)) (P x) / (w : ℂ) := h _ (hproj x)
      _ = inner ℂ (((P.comp ρ).comp P) x) x / (w : ℂ) := by simp only [LinearMap.comp_apply, hself]

/-- Vanishing quadratic weights on `Kᗮ` force both support identities for a bounded positive operator. -/
theorem support_of_null_weights [CompleteSpace H] (K : ClosedSubmodule ℂ H) (σ : H →L[ℂ] H)
    (hσ : σ.IsPositive) (hzero : ∀ z ∈ Kᗮ, (inner ℂ (σ z) z).re = 0) :
    let P := K.toSubmodule.starProjection
    (∀ x, P (σ x) = σ x) ∧ (∀ x, σ (P x) = σ x) :=
  support_of_psd_ker_zero K.toSubmodule.starProjection.toLinearMap σ.toLinearMap
    (fun x => Submodule.starProjection_eq_self_iff.mpr (K.toSubmodule.starProjection_apply_mem x))
    K.toSubmodule.inner_starProjection_left_eq_right hσ.toLinearMap
    (fun y hy => hzero y ((Submodule.starProjection_apply_eq_zero_iff _).mp hy))

/-- Full §3.6 Lüders update uniqueness from posterior certainty and subevent ray ratios. -/
theorem update_of_certain [CompleteSpace H] (K : ClosedSubmodule ℂ H) (ρ σ : H →L[ℂ] H)
    (prior post : ClosedSubmodule ℂ H → ℝ)
    (hprob : ∀ A, post A ∈ Set.Icc 0 1)
    (hadd : ∀ A B : ClosedSubmodule ℂ H, B ≤ Aᗮ → post (A ⊔ B) = post A + post B)
    (hc : post K = 1)
    (hρray : ∀ x : H, inner ℂ (ρ x) x = ((‖x‖ ^ 2 * prior (ray x) : ℝ) : ℂ))
    (hσray : ∀ x : H, inner ℂ (σ x) x = ((‖x‖ ^ 2 * post (ray x) : ℝ) : ℂ))
    (hw : 0 < prior K)
    (hratio : ∀ y ∈ K, post (ray y) * prior K = prior (ray y)) :
    let P := K.toSubmodule.starProjection
    σ = ((prior K : ℂ)⁻¹) • ((P.comp ρ).comp P) := by
  have hσ : σ.IsPositive := (ContinuousLinearMap.isPositive_iff_complex σ).mpr fun x =>
    by rw [hσray]; exact ⟨rfl, mul_nonneg (sq_nonneg _) (hprob _).1⟩
  obtain ⟨hl, hr⟩ := support_of_null_weights K σ hσ fun z hz => by
    have hray : ray z ≤ Kᗮ := (Submodule.span_singleton_le_iff_mem _ _).mpr hz
    simp [hσray, null_of_certain post hprob hadd hc hray]
  have h := supported_ratio_determines_compression K.toSubmodule.starProjection.toLinearMap
    ρ.toLinearMap σ.toLinearMap (prior K)
    (fun x => Submodule.starProjection_eq_self_iff.mpr (K.toSubmodule.starProjection_apply_mem x))
    K.toSubmodule.inner_starProjection_left_eq_right hl hr fun y hy => by
      change inner ℂ (σ y) y = inner ℂ (ρ y) y / (prior K : ℂ)
      rw [hσray, hρray]; norm_cast; rw [eq_div_iff hw.ne', mul_assoc, hratio y (Submodule.starProjection_eq_self_iff.mp hy)]
  exact ContinuousLinearMap.ext (LinearMap.congr_fun h)

/-- Pure-state conditioning existence: `ψ' = P_K ψ / ‖P_K ψ‖` is a unit state in `K`
realizing the exact conditional probability ratio on every closed subevent `R ≤ K`. -/
theorem pure_update_exists [CompleteSpace H] (K : ClosedSubmodule ℂ H) (ψ : H)
    (hw : 0 < ‖K.toSubmodule.starProjection ψ‖ ^ 2) :
    let v := K.toSubmodule.starProjection ψ
    let ψ' := (‖v‖⁻¹ : ℂ) • v
    ‖ψ'‖ = 1 ∧ ‖K.toSubmodule.starProjection ψ'‖ ^ 2 = 1 ∧
      ∀ R : ClosedSubmodule ℂ H, R ≤ K →
        ‖R.toSubmodule.starProjection ψ'‖ ^ 2 = ‖R.toSubmodule.starProjection ψ‖ ^ 2 / ‖v‖ ^ 2 := by
  let v := K.toSubmodule.starProjection ψ; let ψ' := (‖v‖⁻¹ : ℂ) • v
  have hunit : ‖ψ'‖ = 1 := norm_smul_inv_norm fun e => by change 0 < ‖v‖ ^ 2 at hw; simp [e] at hw
  refine ⟨hunit, by rw [Submodule.starProjection_eq_self_iff.mpr (K.smul_mem _ (K.toSubmodule.starProjection_apply_mem ψ)),
    hunit, one_pow], fun R hR => ?_⟩
  have hproj : R.toSubmodule.starProjection v = R.toSubmodule.starProjection ψ :=
    DFunLike.congr_fun (Submodule.starProjection_comp_starProjection_of_le (show R.toSubmodule ≤ K.toSubmodule from hR)) ψ
  change ‖R.toSubmodule.starProjection ((‖v‖⁻¹ : ℂ) • v)‖ ^ 2 = _
  rw [map_smul, hproj, norm_smul, norm_inv, Complex.norm_real, Real.norm_eq_abs,
    abs_of_nonneg (norm_nonneg v), mul_pow, inv_pow, div_eq_inv_mul]

end Update

/-! ### §3.6 Uniqueness of the Updated Pure Ray up to Unit Phase -/
section PureRayUniqueness

open Submodule

/-- Uniqueness of the updated pure ray up to a unit phase (§3.6): if a unit vector `φ` matches
the conditioned Born weights `‖P_Q φ‖² = ‖P_Q ψ‖² / ‖P_K ψ‖²` on every closed subevent `Q ≤ K`,
then `φ = c • (‖P_K ψ‖⁻¹ • P_K ψ)` for a phase `c : ℂ` with `‖c‖ = 1`. -/
theorem pure_update_ray_unique {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] (K : ClosedSubmodule ℂ H) (ψ φ : H)
    (hφ : ‖φ‖ = 1)
    (hv : K.toSubmodule.starProjection ψ ≠ 0)
    (hratio : ∀ Q : ClosedSubmodule ℂ H, Q ≤ K →
      ‖Q.toSubmodule.starProjection φ‖ ^ 2 =
        ‖Q.toSubmodule.starProjection ψ‖ ^ 2 / ‖K.toSubmodule.starProjection ψ‖ ^ 2) :
    ∃ c : ℂ, ‖c‖ = 1 ∧
      φ = c • ((‖K.toSubmodule.starProjection ψ‖⁻¹ : ℂ) • K.toSubmodule.starProjection ψ) := by
  let v : H := K.toSubmodule.starProjection ψ
  let ψ' : H := (‖v‖⁻¹ : ℂ) • v
  have hnv : ‖v‖ ≠ 0 := norm_ne_zero_iff.mpr hv
  have hψ' : ‖ψ'‖ = 1 := norm_smul_inv_norm hv
  have hψ'_mem : ψ' ∈ K := K.smul_mem _ (K.toSubmodule.starProjection_apply_mem ψ)
  have hray_le : ray ψ' ≤ K := (Submodule.span_singleton_le_iff_mem _ _).mpr hψ'_mem
  have hv_in_ray : v ∈ (ray ψ').toSubmodule := by
    have hv_eq : v = (‖v‖ : ℂ) • ψ' := by
      simp only [ψ', smul_smul]
      have hnv_c : (‖v‖ : ℂ) ≠ 0 := Complex.ofReal_ne_zero.mpr hnv
      rw [mul_inv_cancel₀ hnv_c, one_smul]
    rw [hv_eq]
    exact Submodule.smul_mem _ _ (Submodule.subset_span (Set.mem_singleton ψ'))
  have hproj_ψ : (ray ψ').toSubmodule.starProjection ψ = v := by
    have hcomp := DFunLike.congr_fun
      (Submodule.starProjection_comp_starProjection_of_le
        (show (ray ψ').toSubmodule ≤ K.toSubmodule from hray_le)) ψ
    change (ray ψ').toSubmodule.starProjection v = (ray ψ').toSubmodule.starProjection ψ at hcomp
    rw [← hcomp, Submodule.starProjection_eq_self_iff.mpr hv_in_ray]
  have hproj_φ_norm : ‖(ray ψ').toSubmodule.starProjection φ‖ ^ 2 = 1 := by
    rw [hratio (ray ψ') hray_le, hproj_ψ, div_self (pow_ne_zero 2 hnv)]
  have hproj_φ_eq : (ray ψ').toSubmodule.starProjection φ = inner ℂ ψ' φ • ψ' := by
    simp [ray, Submodule.starProjection_singleton, hψ']
  let c : ℂ := inner ℂ ψ' φ
  have hc : ‖c‖ = 1 := by
    have h1 : ‖c‖ ^ 2 = 1 := by
      simpa [hproj_φ_eq, norm_smul, hψ', c] using hproj_φ_norm
    nlinarith [norm_nonneg c]
  have horth_zero : (ray ψ').toSubmoduleᗮ.starProjection φ = 0 := by
    have hpyth := Submodule.norm_sq_eq_add_norm_sq_starProjection φ (ray ψ').toSubmodule
    rw [hφ, one_pow, hproj_φ_norm] at hpyth
    have hsq0 : ‖(ray ψ').toSubmoduleᗮ.starProjection φ‖ ^ 2 = 0 := by linarith
    exact norm_eq_zero.mp (sq_eq_zero_iff.mp hsq0)
  have hφ_eq : φ = c • ψ' := by
    have hsum := Submodule.starProjection_add_starProjection_orthogonal (K := (ray ψ').toSubmodule) φ
    rw [horth_zero, add_zero, hproj_φ_eq] at hsum
    exact hsum.symm
  exact ⟨c, hc, hφ_eq⟩

/-- Combined pure-state Lüders update existence and ray-uniqueness theorem (§3.6). -/
theorem pure_update_exists_unique {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] (K : ClosedSubmodule ℂ H) (ψ : H)
    (hv : K.toSubmodule.starProjection ψ ≠ 0) :
    let ψ' := (‖K.toSubmodule.starProjection ψ‖⁻¹ : ℂ) • K.toSubmodule.starProjection ψ
    ‖ψ'‖ = 1 ∧ ‖K.toSubmodule.starProjection ψ'‖ ^ 2 = 1 ∧
      (∀ Q : ClosedSubmodule ℂ H, Q ≤ K →
        ‖Q.toSubmodule.starProjection ψ'‖ ^ 2 =
          ‖Q.toSubmodule.starProjection ψ‖ ^ 2 / ‖K.toSubmodule.starProjection ψ‖ ^ 2) ∧
      (∀ φ : H, ‖φ‖ = 1 →
        (∀ Q : ClosedSubmodule ℂ H, Q ≤ K →
          ‖Q.toSubmodule.starProjection φ‖ ^ 2 =
            ‖Q.toSubmodule.starProjection ψ‖ ^ 2 / ‖K.toSubmodule.starProjection ψ‖ ^ 2) →
        ∃ c : ℂ, ‖c‖ = 1 ∧ φ = c • ψ') := by
  have hw : 0 < ‖K.toSubmodule.starProjection ψ‖ ^ 2 := sq_pos_of_pos (norm_pos_iff.mpr hv)
  obtain ⟨h1, h2, h3⟩ := pure_update_exists K ψ hw
  exact ⟨h1, h2, h3, fun φ hφ hratio => pure_update_ray_unique K ψ φ hφ hv hratio⟩

end PureRayUniqueness

/-! ### §3.5–§3.6 Normal-Mixture Density Operators, Event Trace & Trace-Normalized Lüders Update -/
section NormalMixtures

open Submodule
open scoped InnerProductSpace

universe u

/-- A normal (countable convex) mixture of unit pure states `ψ n` with nonnegative weights
summing to `1`. -/
structure NormalMixture (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] where
  w : ℕ → ℝ
  ψ : ℕ → H
  hw : ∀ n, 0 ≤ w n
  hsum : HasSum w 1
  hnorm : ∀ n, ‖ψ n‖ = 1

variable {H : Type u} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-- Pure-state embedding of a unit vector `u` as a normal mixture supported at index `0`. -/
def NormalMixture.pure (u : H) (hu : ‖u‖ = 1) : NormalMixture H where
  w := fun n => if n = 0 then 1 else 0
  ψ := fun _ => u
  hw := fun n => by split_ifs <;> norm_num
  hsum := hasSum_ite_eq 0 (1 : ℝ)
  hnorm := fun _ => hu

private lemma densityOp_term_norm_le (ρ : NormalMixture H) (x : H) (n : ℕ) :
    ‖(ρ.w n : ℂ) • (inner ℂ (ρ.ψ n) x • ρ.ψ n)‖ ≤ ρ.w n * ‖x‖ := by
  rw [norm_smul, norm_smul, Complex.norm_real, Real.norm_of_nonneg (ρ.hw n), ρ.hnorm n, mul_one]
  exact mul_le_mul_of_nonneg_left (by simpa [ρ.hnorm n] using norm_inner_le_norm (ρ.ψ n) x) (ρ.hw n)

private lemma densityOp_norm_summable (ρ : NormalMixture H) (x : H) :
    Summable (fun n => ‖(ρ.w n : ℂ) • (inner ℂ (ρ.ψ n) x • ρ.ψ n)‖) :=
  Summable.of_nonneg_of_le (fun _ => norm_nonneg _)
    (densityOp_term_norm_le ρ x) (ρ.hsum.summable.mul_right ‖x‖)

/-- The rank-one series defining `densityOp ρ x` is norm-summable. -/
theorem densityOp_summable (ρ : NormalMixture H) (x : H) :
    Summable (fun n => (ρ.w n : ℂ) • (inner ℂ (ρ.ψ n) x • ρ.ψ n)) :=
  (densityOp_norm_summable ρ x).of_norm

private lemma densityOp_tsum_norm_le (ρ : NormalMixture H) (x : H) :
    ‖∑' n, (ρ.w n : ℂ) • (inner ℂ (ρ.ψ n) x • ρ.ψ n)‖ ≤ ‖x‖ := by
  calc ‖∑' n, (ρ.w n : ℂ) • (inner ℂ (ρ.ψ n) x • ρ.ψ n)‖
      ≤ ∑' n, ‖(ρ.w n : ℂ) • (inner ℂ (ρ.ψ n) x • ρ.ψ n)‖ :=
        norm_tsum_le_tsum_norm (densityOp_norm_summable ρ x)
    _ ≤ ∑' n, ρ.w n * ‖x‖ :=
        (densityOp_norm_summable ρ x).tsum_le_tsum (densityOp_term_norm_le ρ x)
          (ρ.hsum.summable.mul_right ‖x‖)
    _ = (∑' n, ρ.w n) * ‖x‖ := tsum_mul_right
    _ = ‖x‖ := by rw [ρ.hsum.tsum_eq, one_mul]

/-- Bounded density operator `ρ = ∑ w_n |ψ_n⟩⟨ψ_n|` associated with a normal mixture. -/
noncomputable def densityOp (ρ : NormalMixture H) : H →L[ℂ] H :=
  LinearMap.mkContinuous
    { toFun := fun x => ∑' n, (ρ.w n : ℂ) • (inner ℂ (ρ.ψ n) x • ρ.ψ n)
      map_add' := fun x y => by
        simp only [inner_add_right, add_smul, smul_add]
        exact (densityOp_summable ρ x).tsum_add (densityOp_summable ρ y)
      map_smul' := fun c x => by
        simp only [RingHom.id_apply, inner_smul_right]
        have hs := ((densityOp_summable ρ x).hasSum.mapL (c • ContinuousLinearMap.id ℂ H)).tsum_eq
        refine Eq.trans ?_ hs
        congr 1; ext n
        simp only [smul_apply, ContinuousLinearMap.id_apply, smul_smul]
        congr 1; ring }
    1 (fun x => by simpa using densityOp_tsum_norm_le ρ x)

theorem densityOp_apply (ρ : NormalMixture H) (x : H) :
    densityOp ρ x = ∑' n, (ρ.w n : ℂ) • (inner ℂ (ρ.ψ n) x • ρ.ψ n) := rfl

theorem densityOp_norm_le (ρ : NormalMixture H) : ‖densityOp ρ‖ ≤ 1 :=
  LinearMap.mkContinuous_norm_le _ zero_le_one _

private lemma inner_densityOp_hasSum (ρ : NormalMixture H) (x y : H) :
    HasSum (fun n => (ρ.w n : ℂ) * (inner ℂ (ρ.ψ n) y * inner ℂ x (ρ.ψ n)))
      (inner ℂ x (densityOp ρ y)) := by
  have hs := (densityOp_summable ρ y).hasSum.mapL (innerSL ℂ x)
  refine hs.congr_fun fun n => ?_
  simp

theorem densityOp_selfAdjoint (ρ : NormalMixture H) (x y : H) :
    inner ℂ x (densityOp ρ y) = inner ℂ (densityOp ρ x) y := by
  rw [← (inner_densityOp_hasSum ρ x y).tsum_eq, ← inner_conj_symm (densityOp ρ x) y,
    ← ((inner_densityOp_hasSum ρ y x).map (starRingEnd ℂ) Complex.continuous_conj).tsum_eq]
  congr 1; ext n
  simp [map_mul, Complex.conj_ofReal, inner_conj_symm, mul_comm]

theorem densityOp_psd (ρ : NormalMixture H) (x : H) :
    inner ℂ x (densityOp ρ x) = ((∑' n, ρ.w n * ‖inner ℂ (ρ.ψ n) x‖ ^ 2 : ℝ) : ℂ) := by
  rw [← (inner_densityOp_hasSum ρ x x).tsum_eq, Complex.ofReal_tsum]
  congr 1; ext n
  rw [← inner_conj_symm x (ρ.ψ n), Complex.mul_conj, Complex.normSq_eq_norm_sq]
  push_cast; ring

theorem densityOp_isPositive (ρ : NormalMixture H) : (densityOp ρ).IsPositive :=
  (ContinuousLinearMap.isPositive_iff_complex (densityOp ρ)).mpr fun x => by
    rw [← densityOp_selfAdjoint, densityOp_psd]
    exact ⟨rfl, tsum_nonneg fun n => mul_nonneg (ρ.hw n) (sq_nonneg _)⟩

theorem densityOp_pure (u : H) (hu : ‖u‖ = 1) (x : H) :
    densityOp (NormalMixture.pure u hu) x = inner ℂ u x • u := by
  rw [densityOp_apply]
  have h : (fun n => ((NormalMixture.pure u hu).w n : ℂ) •
      (inner ℂ ((NormalMixture.pure u hu).ψ n) x • (NormalMixture.pure u hu).ψ n)) =
      fun n => if n = 0 then inner ℂ u x • u else 0 := by
    ext n; dsimp [NormalMixture.pure]; split_ifs <;> simp
  rw [h, tsum_ite_eq]

/-- Event trace / mixed Born probability `Tr(ρ P_K) = ∑ w_n ‖P_K ψ_n‖²`. -/
noncomputable def mixTrace (ρ : NormalMixture H) (K : ClosedSubmodule ℂ H) : ℝ :=
  ∑' n, ρ.w n * ‖K.toSubmodule.starProjection (ρ.ψ n)‖ ^ 2

private lemma mixTrace_term_le (ρ : NormalMixture H) (K : ClosedSubmodule ℂ H) (n : ℕ) :
    ρ.w n * ‖K.toSubmodule.starProjection (ρ.ψ n)‖ ^ 2 ≤ ρ.w n := by
  have hle : ‖K.toSubmodule.starProjection (ρ.ψ n)‖ ≤ 1 := by
    simpa [ρ.hnorm n] using K.toSubmodule.norm_starProjection_apply_le (ρ.ψ n)
  exact mul_le_of_le_one_right (ρ.hw n) (by nlinarith [norm_nonneg (K.toSubmodule.starProjection (ρ.ψ n))])

theorem mixTrace_summable (ρ : NormalMixture H) (K : ClosedSubmodule ℂ H) :
    Summable (fun n => ρ.w n * ‖K.toSubmodule.starProjection (ρ.ψ n)‖ ^ 2) :=
  Summable.of_nonneg_of_le (fun n => mul_nonneg (ρ.hw n) (sq_nonneg _))
    (mixTrace_term_le ρ K) ρ.hsum.summable

theorem mixTrace_nonneg (ρ : NormalMixture H) (K : ClosedSubmodule ℂ H) :
    0 ≤ mixTrace ρ K :=
  tsum_nonneg fun n => mul_nonneg (ρ.hw n) (sq_nonneg _)

theorem mixTrace_le_one (ρ : NormalMixture H) (K : ClosedSubmodule ℂ H) :
    mixTrace ρ K ≤ 1 :=
  ((mixTrace_summable ρ K).tsum_le_tsum (mixTrace_term_le ρ K) ρ.hsum.summable).trans_eq ρ.hsum.tsum_eq

theorem mixTrace_top (ρ : NormalMixture H) : mixTrace ρ ⊤ = 1 := by
  simp [mixTrace, Submodule.starProjection_top, ρ.hnorm, ρ.hsum.tsum_eq]

theorem mixTrace_bot (ρ : NormalMixture H) : mixTrace ρ ⊥ = 0 := by
  simp [mixTrace, Submodule.starProjection_bot]

theorem mixTrace_pure (u : H) (hu : ‖u‖ = 1) (K : ClosedSubmodule ℂ H) :
    mixTrace (NormalMixture.pure u hu) K = ‖K.toSubmodule.starProjection u‖ ^ 2 := by
  unfold mixTrace
  have h : (fun n => (NormalMixture.pure u hu).w n *
      ‖K.toSubmodule.starProjection ((NormalMixture.pure u hu).ψ n)‖ ^ 2) =
      fun n => if n = 0 then ‖K.toSubmodule.starProjection u‖ ^ 2 else 0 := by
    ext n; dsimp [NormalMixture.pure]; split_ifs <;> simp
  rw [h, tsum_ite_eq]

theorem mixTrace_ray (ρ : NormalMixture H) {u : H} (hu : ‖u‖ = 1) :
    mixTrace ρ (ray u) = (inner ℂ u (densityOp ρ u)).re := by
  rw [densityOp_psd, Complex.ofReal_re]
  unfold mixTrace
  congr 1; ext n
  have hp : ‖(ray u).toSubmodule.starProjection (ρ.ψ n)‖ = ‖inner ℂ (ρ.ψ n) u‖ := by
    simp [ray, starProjection_singleton, norm_smul, hu, norm_inner_symm]
  rw [hp]

theorem densityOp_inner_eq_mixTrace_ray (ρ : NormalMixture H) (x : H) :
    inner ℂ (densityOp ρ x) x = ((‖x‖ ^ 2 * mixTrace ρ (ray x) : ℝ) : ℂ) := by
  rw [← densityOp_selfAdjoint]
  by_cases hx : x = 0
  · subst hx; simp
  · let u : H := (‖x‖⁻¹ : ℂ) • x
    have hu : ‖u‖ = 1 := norm_smul_inv_norm hx
    have hnx : (‖x‖ : ℂ) ≠ 0 := by exact_mod_cast norm_ne_zero_iff.mpr hx
    have hxu : x = (‖x‖ : ℂ) • u := by
      simp [u, smul_smul, mul_inv_cancel₀ hnx]
    have hray : ray x = ray u := ClosedSubmodule.toSubmodule_injective <| by
      dsimp only [ray]; rw [hxu]
      exact Submodule.span_singleton_smul_eq hnx.isUnit u
    rw [hray, mixTrace_ray ρ hu]
    conv_lhs => rw [hxu]
    rw [map_smul, inner_smul_left, inner_smul_right, Complex.conj_ofReal, densityOp_psd,
      Complex.ofReal_re]
    set S : ℝ := ∑' n, ρ.w n * ‖inner ℂ (ρ.ψ n) u‖ ^ 2
    push_cast; ring

/-- General countable additivity of `mixTrace ρ` over any countable orthogonal event family. -/
theorem mixTrace_countablyAdditive (ρ : NormalMixture H) :
    CountablyAdditive (mixTrace ρ) := by
  intro ι _ K hK
  have heq : ∑' m, ENNReal.ofReal (mixTrace ρ (K m)) = ENNReal.ofReal (mixTrace ρ (⨆ m, K m)) := by
    calc ∑' m, ENNReal.ofReal (mixTrace ρ (K m))
        = ∑' m, ∑' n, ENNReal.ofReal (ρ.w n * ‖(K m).toSubmodule.starProjection (ρ.ψ n)‖ ^ 2) := by
          congr 1; ext m
          exact ENNReal.ofReal_tsum_of_nonneg (fun n => mul_nonneg (ρ.hw n) (sq_nonneg _))
            (mixTrace_summable ρ (K m))
      _ = ∑' n, ∑' m, ENNReal.ofReal (ρ.w n * ‖(K m).toSubmodule.starProjection (ρ.ψ n)‖ ^ 2) :=
          ENNReal.tsum_comm
      _ = ∑' n, ENNReal.ofReal (ρ.w n * ‖(⨆ m, K m).toSubmodule.starProjection (ρ.ψ n)‖ ^ 2) := by
          congr 1; ext n
          have hbn := (born_countably_additive (ρ.ψ n) ι K hK).mul_left (ρ.w n)
          rw [← hbn.tsum_eq]
          exact (ENNReal.ofReal_tsum_of_nonneg
            (fun m => mul_nonneg (ρ.hw n) (sq_nonneg _)) hbn.summable).symm
      _ = ENNReal.ofReal (mixTrace ρ (⨆ m, K m)) :=
          (ENNReal.ofReal_tsum_of_nonneg (fun n => mul_nonneg (ρ.hw n) (sq_nonneg _))
            (mixTrace_summable ρ (⨆ m, K m))).symm
  have hsum : Summable (fun m => mixTrace ρ (K m)) := by
    have hne : (∑' m, ENNReal.ofReal (mixTrace ρ (K m))) ≠ ⊤ := by
      rw [heq]; exact ENNReal.ofReal_ne_top
    exact (ENNReal.summable_toReal hne).congr fun m =>
      ENNReal.toReal_ofReal (mixTrace_nonneg ρ (K m))
  have htsum : (∑' m, mixTrace ρ (K m)) = mixTrace ρ (⨆ m, K m) := by
    have h1 := ENNReal.ofReal_tsum_of_nonneg (fun m => mixTrace_nonneg ρ (K m)) hsum
    rw [heq] at h1
    exact (ENNReal.ofReal_eq_ofReal_iff (tsum_nonneg fun m => mixTrace_nonneg ρ (K m))
      (mixTrace_nonneg ρ (⨆ m, K m))).mp h1
  exact htsum ▸ hsum.hasSum

/-- Countable additivity of `mixTrace ρ` for `ℕ`-indexed pairwise orthogonal closed events. -/
theorem mixTrace_countable_add (ρ : NormalMixture H) (K : ℕ → ClosedSubmodule ℂ H)
    (hK : ∀ i j, i ≠ j → K j ≤ (K i)ᗮ) :
    HasSum (fun m => mixTrace ρ (K m)) (mixTrace ρ (⨆ m, K m)) := by
  let K' (i : ULift.{u} ℕ) : ClosedSubmodule ℂ H := K i.down
  have hK' : ∀ i j : ULift.{u} ℕ, i ≠ j → K' j ≤ (K' i)ᗮ := fun i j hij =>
    hK i.down j.down fun he => hij (ULift.ext _ _ he)
  have hs := mixTrace_countablyAdditive ρ (ULift.{u} ℕ) K' hK'
  have hsup : (⨆ i : ULift.{u} ℕ, K' i) = ⨆ m : ℕ, K m := by
    simp [K']
  rw [hsup] at hs
  exact Equiv.ulift.hasSum_iff.mp hs

private lemma exists_unit_mem_of_mixTrace_pos (ρ : NormalMixture H) (K : ClosedSubmodule ℂ H)
    (hpos : 0 < mixTrace ρ K) : ∃ u : H, u ∈ K ∧ ‖u‖ = 1 := by
  by_contra h
  have hzero : ∀ n, K.toSubmodule.starProjection (ρ.ψ n) = 0 := fun n => by
    by_contra hv
    exact h ⟨_, K.smul_mem _ (K.toSubmodule.starProjection_apply_mem (ρ.ψ n)),
      norm_smul_inv_norm hv⟩
  have : mixTrace ρ K = 0 := by simp [mixTrace, hzero]
  linarith

/-- Trace-normalized Lüders conditioned normal mixture `ρ_K`. -/
noncomputable def condMixture (ρ : NormalMixture H) (K : ClosedSubmodule ℂ H)
    (hpos : 0 < mixTrace ρ K) : NormalMixture H :=
  letI := Classical.propDecidable
  let u₀ : H := Classical.choose (exists_unit_mem_of_mixTrace_pos ρ K hpos)
  let hu₀ : u₀ ∈ K ∧ ‖u₀‖ = 1 := Classical.choose_spec (exists_unit_mem_of_mixTrace_pos ρ K hpos)
  { w := fun n => ρ.w n * ‖K.toSubmodule.starProjection (ρ.ψ n)‖ ^ 2 / mixTrace ρ K
    ψ := fun n =>
      if h : K.toSubmodule.starProjection (ρ.ψ n) = 0 then u₀
      else (‖K.toSubmodule.starProjection (ρ.ψ n)‖⁻¹ : ℂ) • K.toSubmodule.starProjection (ρ.ψ n)
    hw := fun n => div_nonneg (mul_nonneg (ρ.hw n) (sq_nonneg _)) hpos.le
    hsum := by
      have hs := (mixTrace_summable ρ K).hasSum.div_const (mixTrace ρ K)
      change HasSum _ (mixTrace ρ K / mixTrace ρ K) at hs
      rwa [div_self hpos.ne'] at hs
    hnorm := fun n => by
      split_ifs with h
      · exact hu₀.2
      · exact norm_smul_inv_norm h }

/-- The density operator of the conditioned mixture equals the trace-normalized Lüders compression
`(Tr(ρ P_K))⁻¹ P_K ρ P_K`. -/
theorem densityOp_condMixture (ρ : NormalMixture H) (K : ClosedSubmodule ℂ H)
    (hpos : 0 < mixTrace ρ K) :
    densityOp (condMixture ρ K hpos) =
      (mixTrace ρ K : ℂ)⁻¹ • (K.toSubmodule.starProjection.comp
        ((densityOp ρ).comp K.toSubmodule.starProjection)) := by
  ext x
  let P := K.toSubmodule.starProjection
  rw [densityOp_apply, smul_apply, ContinuousLinearMap.comp_apply,
    ContinuousLinearMap.comp_apply]
  have hs := ((densityOp_summable ρ (P x)).hasSum.mapL (((mixTrace ρ K : ℂ)⁻¹ : ℂ) • P)).tsum_eq
  change ∑' n, (mixTrace ρ K : ℂ)⁻¹ • P ((ρ.w n : ℂ) • (inner ℂ (ρ.ψ n) (P x) • ρ.ψ n)) =
    (mixTrace ρ K : ℂ)⁻¹ • P (densityOp ρ (P x)) at hs
  rw [← hs]
  congr 1; ext n
  dsimp only [condMixture]
  split_ifs with hv
  · simp [P, hv]
  · have hnv : (‖K.toSubmodule.starProjection (ρ.ψ n)‖ : ℂ) ≠ 0 := by
      exact_mod_cast norm_ne_zero_iff.mpr hv
    have hpos_c : (mixTrace ρ K : ℂ) ≠ 0 := by exact_mod_cast hpos.ne'
    rw [inner_smul_left, map_inv₀, Complex.conj_ofReal,
      K.toSubmodule.inner_starProjection_left_eq_right, map_smul, map_smul]
    simp only [smul_smul]
    congr 1
    push_cast
    dsimp only [P]
    field_simp [hnv, hpos_c]

/-- Exact Bayes conditioning ratio on every closed subevent `Q ≤ K`. -/
theorem mixTrace_condMixture_sub (ρ : NormalMixture H) (K : ClosedSubmodule ℂ H)
    (hpos : 0 < mixTrace ρ K) {Q : ClosedSubmodule ℂ H} (hQK : Q ≤ K) :
    mixTrace (condMixture ρ K hpos) Q = mixTrace ρ Q / mixTrace ρ K := by
  change (∑' n, (condMixture ρ K hpos).w n *
      ‖Q.toSubmodule.starProjection ((condMixture ρ K hpos).ψ n)‖ ^ 2) =
    (∑' n, ρ.w n * ‖Q.toSubmodule.starProjection (ρ.ψ n)‖ ^ 2) / mixTrace ρ K
  rw [← tsum_div_const]
  congr 1; ext n
  dsimp only [condMixture]
  have hproj : Q.toSubmodule.starProjection (K.toSubmodule.starProjection (ρ.ψ n)) =
      Q.toSubmodule.starProjection (ρ.ψ n) :=
    DFunLike.congr_fun
      (Submodule.starProjection_comp_starProjection_of_le (show Q.toSubmodule ≤ K.toSubmodule from hQK))
      (ρ.ψ n)
  split_ifs with hv
  · have hq0 : Q.toSubmodule.starProjection (ρ.ψ n) = 0 := by rw [← hproj, hv, map_zero]
    simp [hv, hq0]
  · rw [map_smul, hproj, norm_smul, norm_inv, Complex.norm_real,
      Real.norm_of_nonneg (norm_nonneg _), mul_pow, inv_pow]
    have hnv : ‖K.toSubmodule.starProjection (ρ.ψ n)‖ ≠ 0 := norm_ne_zero_iff.mpr hv
    field_simp [hnv, hpos.ne']

theorem mixTrace_condMixture_self (ρ : NormalMixture H) (K : ClosedSubmodule ℂ H)
    (hpos : 0 < mixTrace ρ K) :
    mixTrace (condMixture ρ K hpos) K = 1 := by
  rw [mixTrace_condMixture_sub ρ K hpos le_rfl, div_self hpos.ne']

/-- Uniqueness for any (not even assumed continuous) linear operator `σ : H →ₗ[ℂ] H` satisfying the
§3.6 conditioning hypotheses with prior `mixTrace ρ`: it must equal
`(densityOp (condMixture ρ K hpos)).toLinearMap`. -/
theorem condMixture_unique (ρ : NormalMixture H) (K : ClosedSubmodule ℂ H)
    (hpos : 0 < mixTrace ρ K) (σ : H →ₗ[ℂ] H)
    (post : ClosedSubmodule ℂ H → ℝ)
    (hprob : ∀ A, post A ∈ Set.Icc 0 1)
    (hadd : ∀ A B : ClosedSubmodule ℂ H, B ≤ Aᗮ → post (A ⊔ B) = post A + post B)
    (hc : post K = 1)
    (hσray : ∀ x : H, inner ℂ (σ x) x = ((‖x‖ ^ 2 * post (ray x) : ℝ) : ℂ))
    (hratio : ∀ y ∈ K, post (ray y) * mixTrace ρ K = mixTrace ρ (ray y)) :
    σ = (densityOp (condMixture ρ K hpos)).toLinearMap := by
  have hσ : σ.IsPositive :=
    (LinearMap.isPositive_iff_complex σ).mpr fun x => by
      rw [hσray]; exact ⟨rfl, mul_nonneg (sq_nonneg _) (hprob _).1⟩
  let P := K.toSubmodule.starProjection
  obtain ⟨hl, hr⟩ := support_of_psd_ker_zero P.toLinearMap σ
    (fun x => Submodule.starProjection_eq_self_iff.mpr (K.toSubmodule.starProjection_apply_mem x))
    K.toSubmodule.inner_starProjection_left_eq_right hσ fun y hy => by
      have hz : y ∈ Kᗮ := (Submodule.starProjection_apply_eq_zero_iff _).mp hy
      have hray : ray y ≤ Kᗮ := (Submodule.span_singleton_le_iff_mem _ _).mpr hz
      simp [hσray, null_of_certain post hprob hadd hc hray]
  have hcomp := supported_ratio_determines_compression P.toLinearMap
    (densityOp ρ).toLinearMap σ (mixTrace ρ K)
    (fun x => Submodule.starProjection_eq_self_iff.mpr (K.toSubmodule.starProjection_apply_mem x))
    K.toSubmodule.inner_starProjection_left_eq_right hl hr fun y hy => by
      change inner ℂ (σ y) y = inner ℂ (densityOp ρ y) y / (mixTrace ρ K : ℂ)
      rw [hσray, densityOp_inner_eq_mixTrace_ray]
      norm_cast
      rw [eq_div_iff hpos.ne', mul_assoc, hratio y (Submodule.starProjection_eq_self_iff.mp hy)]
  rw [hcomp, densityOp_condMixture ρ K hpos]
  rfl

/-- Complete §3.6 normal-mixture Lüders update theorem: existence of the trace-normalized
conditioned normal mixture `condMixture ρ K hpos` realizing the exact Lüders compression and
subevent probability ratios, together with uniqueness via `update_of_certain`. -/
theorem normal_mixture_luders_update (ρ : NormalMixture H) (K : ClosedSubmodule ℂ H)
    (hpos : 0 < mixTrace ρ K) :
    let ρ' := condMixture ρ K hpos
    let P := K.toSubmodule.starProjection
    densityOp ρ' = (mixTrace ρ K : ℂ)⁻¹ • (P.comp ((densityOp ρ).comp P)) ∧
    mixTrace ρ' K = 1 ∧
    (∀ Q : ClosedSubmodule ℂ H, Q ≤ K → mixTrace ρ' Q = mixTrace ρ Q / mixTrace ρ K) ∧
    CountablyAdditive (mixTrace ρ') ∧
    ∀ (σ : H →L[ℂ] H) (post : ClosedSubmodule ℂ H → ℝ),
      (∀ A, post A ∈ Set.Icc 0 1) →
      (∀ A B : ClosedSubmodule ℂ H, B ≤ Aᗮ → post (A ⊔ B) = post A + post B) →
      post K = 1 →
      (∀ x : H, inner ℂ (σ x) x = ((‖x‖ ^ 2 * post (ray x) : ℝ) : ℂ)) →
      (∀ y ∈ K, post (ray y) * mixTrace ρ K = mixTrace ρ (ray y)) →
      σ = densityOp ρ' := by
  refine ⟨densityOp_condMixture ρ K hpos, mixTrace_condMixture_self ρ K hpos,
    fun Q hQK => mixTrace_condMixture_sub ρ K hpos hQK, mixTrace_countablyAdditive _,
    fun σ post hprob hadd hc hσray hratio => ?_⟩
  have h := update_of_certain K (densityOp ρ) σ (mixTrace ρ) post hprob hadd hc
    (densityOp_inner_eq_mixTrace_ray ρ) hσray hpos hratio
  rw [h, densityOp_condMixture ρ K hpos]
  rfl

end NormalMixtures

/-! ### §3.6 Basis-Independent Hilbert-Space Operator Trace `Tr(ρ P) = mixTrace ρ P` -/
section OperatorTrace

open Submodule
open scoped InnerProductSpace

namespace OperatorTrace

universe u

variable {H : Type u} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

lemma inner_densityOp_hasSum' (ρ : NormalMixture H) (x y : H) :
    HasSum (fun n => (ρ.w n : ℂ) * (inner ℂ (ρ.ψ n) y * inner ℂ x (ρ.ψ n)))
      (inner ℂ x (densityOp ρ y)) := by
  have hs := (densityOp_summable ρ y).hasSum.mapL (innerSL ℂ x)
  change HasSum _ (inner ℂ x (densityOp ρ y)) at hs
  refine hs.congr_fun fun n => ?_
  simp

omit [CompleteSpace H] in
lemma hilbertBasis_norm_sq_hasSum {ι : Type*} (b : HilbertBasis ι ℂ H) (x : H) :
    HasSum (fun i : ι => ‖inner ℂ (b i) x‖ ^ 2) (‖x‖ ^ 2) := by
  have h := b.hasSum_inner_mul_inner x x
  have hre : HasSum (fun i : ι => (inner ℂ x (b i) * inner ℂ (b i) x).re) (inner ℂ x x).re :=
    h.map Complex.reCLM.toAddMonoidHom Complex.continuous_re
  have h1 : (inner ℂ x x).re = ‖x‖ ^ 2 := by
    rw [inner_self_eq_norm_sq_to_K, RCLike.ofReal_eq_complex_ofReal, ← Complex.ofReal_pow,
      Complex.ofReal_re]
  rw [h1] at hre
  refine hre.congr_fun fun i => ?_
  rw [mul_comm, ← inner_conj_symm x (b i), Complex.mul_conj, Complex.normSq_eq_norm_sq,
    Complex.ofReal_re]

/-- The double series `(n, i) ↦ w_n ⟨B* ψ_n, b_i⟩ ⟨b_i, ψ_n⟩` is norm-summable on `ℕ × ι`
for every normal mixture `ρ`, bounded operator `B : H →L[ℂ] H`, and Hilbert basis `b`. -/
lemma double_trace_summable {ι : Type*} (b : HilbertBasis ι ℂ H)
    (ρ : NormalMixture H) (B : H →L[ℂ] H) :
    Summable (fun p : ℕ × ι =>
      (ρ.w p.1 : ℂ) * (inner ℂ (B.adjoint (ρ.ψ p.1)) (b p.2) * inner ℂ (b p.2) (ρ.ψ p.1))) := by
  refine Summable.of_norm ?_
  rw [summable_prod_of_nonneg (fun _ => norm_nonneg _)]
  have hbound : ∀ n i,
      ‖(ρ.w n : ℂ) * (inner ℂ (B.adjoint (ρ.ψ n)) (b i) * inner ℂ (b i) (ρ.ψ n))‖ ≤
        ρ.w n * ((‖inner ℂ (b i) (B.adjoint (ρ.ψ n))‖ ^ 2 + ‖inner ℂ (b i) (ρ.ψ n)‖ ^ 2) / 2) := by
    intro n i
    rw [norm_mul, norm_mul, Complex.norm_real, Real.norm_of_nonneg (ρ.hw n),
      norm_inner_symm (B.adjoint (ρ.ψ n)) (b i)]
    refine mul_le_mul_of_nonneg_left ?_ (ρ.hw n)
    nlinarith [sq_nonneg (‖inner ℂ (b i) (B.adjoint (ρ.ψ n))‖ - ‖inner ℂ (b i) (ρ.ψ n)‖)]
  have hinner_sum : ∀ n, Summable (fun i : ι =>
      ‖(ρ.w n : ℂ) * (inner ℂ (B.adjoint (ρ.ψ n)) (b i) * inner ℂ (b i) (ρ.ψ n))‖) := fun n => by
    have hmaj : Summable (fun i : ι =>
        ρ.w n * ((‖inner ℂ (b i) (B.adjoint (ρ.ψ n))‖ ^ 2 + ‖inner ℂ (b i) (ρ.ψ n)‖ ^ 2) / 2)) :=
      (((hilbertBasis_norm_sq_hasSum b (B.adjoint (ρ.ψ n))).summable.add
        (hilbertBasis_norm_sq_hasSum b (ρ.ψ n)).summable).div_const 2).mul_left (ρ.w n)
    exact Summable.of_nonneg_of_le (fun _ => norm_nonneg _) (hbound n) hmaj
  refine ⟨hinner_sum, ?_⟩
  refine Summable.of_nonneg_of_le (fun n => tsum_nonneg fun _ => norm_nonneg _) (fun n => ?_)
    (ρ.hsum.summable.mul_right ((‖B‖ ^ 2 + 1) / 2))
  have hmaj_has : HasSum (fun i : ι =>
      ρ.w n * ((‖inner ℂ (b i) (B.adjoint (ρ.ψ n))‖ ^ 2 + ‖inner ℂ (b i) (ρ.ψ n)‖ ^ 2) / 2))
      (ρ.w n * ((‖B.adjoint (ρ.ψ n)‖ ^ 2 + ‖ρ.ψ n‖ ^ 2) / 2)) :=
    (((hilbertBasis_norm_sq_hasSum b (B.adjoint (ρ.ψ n))).add
      (hilbertBasis_norm_sq_hasSum b (ρ.ψ n))).div_const 2).mul_left (ρ.w n)
  have hle1 : (∑' i : ι, ‖(ρ.w n : ℂ) *
      (inner ℂ (B.adjoint (ρ.ψ n)) (b i) * inner ℂ (b i) (ρ.ψ n))‖) ≤
      ρ.w n * ((‖B.adjoint (ρ.ψ n)‖ ^ 2 + ‖ρ.ψ n‖ ^ 2) / 2) :=
    ((hinner_sum n).tsum_le_tsum (hbound n) hmaj_has.summable).trans_eq hmaj_has.tsum_eq
  have hadj : ‖B.adjoint (ρ.ψ n)‖ ≤ ‖B‖ := by
    calc ‖B.adjoint (ρ.ψ n)‖ ≤ ‖B.adjoint‖ * ‖ρ.ψ n‖ := B.adjoint.le_opNorm _
      _ = ‖B‖ := by rw [LinearIsometryEquiv.norm_map, ρ.hnorm n, mul_one]
  have hadj_sq : ‖B.adjoint (ρ.ψ n)‖ ^ 2 ≤ ‖B‖ ^ 2 :=
    pow_le_pow_left₀ (norm_nonneg _) hadj 2
  calc (∑' i : ι, ‖(ρ.w n : ℂ) *
        (inner ℂ (B.adjoint (ρ.ψ n)) (b i) * inner ℂ (b i) (ρ.ψ n))‖)
      ≤ ρ.w n * ((‖B.adjoint (ρ.ψ n)‖ ^ 2 + ‖ρ.ψ n‖ ^ 2) / 2) := hle1
    _ ≤ ρ.w n * ((‖B‖ ^ 2 + 1) / 2) := by
        rw [ρ.hnorm n, one_pow]
        exact mul_le_mul_of_nonneg_left (by linarith) (ρ.hw n)

/-- General Hilbert-space operator trace formula for a normal mixture `ρ` and any bounded
operator `B : H →L[ℂ] H`: `HasSum (fun i => ⟨b_i, ρ B b_i⟩) (∑' n, w_n ⟨ψ_n, B ψ_n⟩)`. -/
lemma densityOp_bounded_trace_hasSum {ι : Type*} (b : HilbertBasis ι ℂ H)
    (ρ : NormalMixture H) (B : H →L[ℂ] H) :
    HasSum (fun i : ι => inner ℂ (b i) (densityOp ρ (B (b i))))
      (∑' n : ℕ, (ρ.w n : ℂ) * inner ℂ (ρ.ψ n) (B (ρ.ψ n))) := by
  let f : ℕ × ι → ℂ := fun p =>
    (ρ.w p.1 : ℂ) * (inner ℂ (B.adjoint (ρ.ψ p.1)) (b p.2) * inner ℂ (b p.2) (ρ.ψ p.1))
  have hf : Summable f := double_trace_summable b ρ B
  have h_by_n : HasSum (fun n : ℕ => (ρ.w n : ℂ) * inner ℂ (ρ.ψ n) (B (ρ.ψ n))) (∑' p, f p) :=
    hf.hasSum.prod_fiberwise fun n => by
      have h := (b.hasSum_inner_mul_inner (B.adjoint (ρ.ψ n)) (ρ.ψ n)).mul_left (ρ.w n : ℂ)
      rwa [ContinuousLinearMap.adjoint_inner_left] at h
  have hswap : HasSum (fun p : ι × ℕ => f p.swap) (∑' p, f p) :=
    (Equiv.prodComm ι ℕ).hasSum_iff.mpr hf.hasSum
  have h_by_i : HasSum (fun i : ι => inner ℂ (b i) (densityOp ρ (B (b i)))) (∑' p, f p) :=
    hswap.prod_fiberwise fun i =>
      (inner_densityOp_hasSum' ρ (b i) (B (b i))).congr_fun fun n => by
        dsimp only [f, Prod.swap]
        rw [ContinuousLinearMap.adjoint_inner_left]
  rwa [h_by_n.tsum_eq]

lemma densityOp_bounded_trace_summable {ι : Type*} (b : HilbertBasis ι ℂ H)
    (ρ : NormalMixture H) (B : H →L[ℂ] H) :
    Summable (fun i : ι => inner ℂ (b i) (densityOp ρ (B (b i)))) :=
  (densityOp_bounded_trace_hasSum b ρ B).summable

lemma densityOp_bounded_trace_eq {ι : Type*} (b : HilbertBasis ι ℂ H)
    (ρ : NormalMixture H) (B : H →L[ℂ] H) :
    ∑' i : ι, inner ℂ (b i) (densityOp ρ (B (b i))) =
      ∑' n : ℕ, (ρ.w n : ℂ) * inner ℂ (ρ.ψ n) (B (ρ.ψ n)) :=
  (densityOp_bounded_trace_hasSum b ρ B).tsum_eq

end OperatorTrace

section PublicTrace

open OperatorTrace

universe u

variable {H : Type u} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-- Summability of the Hilbert-space trace series `∑' i, ⟨b_i, ρ P_K b_i⟩` in any Hilbert basis
`b : HilbertBasis ι ℂ H`. -/
theorem densityOp_proj_basis_summable {ι : Type*} (b : HilbertBasis ι ℂ H)
    (ρ : NormalMixture H) (K : ClosedSubmodule ℂ H) :
    Summable (fun i : ι => inner ℂ (b i) (densityOp ρ (K.toSubmodule.starProjection (b i)))) :=
  densityOp_bounded_trace_summable b ρ K.toSubmodule.starProjection

/-- Identification of the basis-independent Hilbert-space operator trace `Tr(ρ P_K)` with
`mixTrace ρ K = ∑ w_n ‖P_K ψ_n‖²` in every Hilbert basis `b : HilbertBasis ι ℂ H`. -/
theorem densityOp_basis_trace_eq_mixTrace {ι : Type*} (b : HilbertBasis ι ℂ H)
    (ρ : NormalMixture H) (K : ClosedSubmodule ℂ H) :
    ∑' i : ι, inner ℂ (b i) (densityOp ρ (K.toSubmodule.starProjection (b i))) =
      (mixTrace ρ K : ℂ) := by
  rw [densityOp_bounded_trace_eq b ρ K.toSubmodule.starProjection, mixTrace, Complex.ofReal_tsum]
  congr 1; ext n
  have hp : inner ℂ (ρ.ψ n) (K.toSubmodule.starProjection (ρ.ψ n)) =
      ((‖K.toSubmodule.starProjection (ρ.ψ n)‖ ^ 2 : ℝ) : ℂ) := by
    have hidem : K.toSubmodule.starProjection (K.toSubmodule.starProjection (ρ.ψ n)) =
        K.toSubmodule.starProjection (ρ.ψ n) :=
      Submodule.starProjection_eq_self_iff.mpr (K.toSubmodule.starProjection_apply_mem (ρ.ψ n))
    calc inner ℂ (ρ.ψ n) (K.toSubmodule.starProjection (ρ.ψ n))
        = inner ℂ (ρ.ψ n) (K.toSubmodule.starProjection (K.toSubmodule.starProjection (ρ.ψ n))) := by
          rw [hidem]
      _ = inner ℂ (K.toSubmodule.starProjection (ρ.ψ n)) (K.toSubmodule.starProjection (ρ.ψ n)) :=
          (K.toSubmodule.inner_starProjection_left_eq_right _ _).symm
      _ = ((‖K.toSubmodule.starProjection (ρ.ψ n)‖ ^ 2 : ℝ) : ℂ) := by
          rw [inner_self_eq_norm_sq_to_K, RCLike.ofReal_eq_complex_ofReal, ← Complex.ofReal_pow]
  rw [hp]
  push_cast; rfl

/-- Unit trace normalization `Tr(ρ) = ∑' i, ⟨b_i, ρ b_i⟩ = 1` in every Hilbert basis `b`. -/
theorem densityOp_basis_trace_eq_one {ι : Type*} (b : HilbertBasis ι ℂ H)
    (ρ : NormalMixture H) :
    ∑' i : ι, inner ℂ (b i) (densityOp ρ (b i)) = 1 := by
  have h := densityOp_bounded_trace_eq b ρ (ContinuousLinearMap.id ℂ H)
  simp only [ContinuousLinearMap.id_apply] at h
  rw [h]
  have hnorm : (fun n => (ρ.w n : ℂ) * inner ℂ (ρ.ψ n) (ρ.ψ n)) = fun n => (ρ.w n : ℂ) := by
    ext n
    rw [inner_self_eq_norm_sq_to_K, ρ.hnorm n]; simp
  rw [hnorm, ← Complex.ofReal_tsum, ρ.hsum.tsum_eq, Complex.ofReal_one]

/-- Basis independence of the Hilbert-space operator trace `Tr(ρ P_K)` across any two
Hilbert bases `b₁` and `b₂` (with arbitrary index types `ι₁, ι₂`). -/
theorem densityOp_trace_independent_of_basis {ι₁ ι₂ : Type*}
    (b₁ : HilbertBasis ι₁ ℂ H) (b₂ : HilbertBasis ι₂ ℂ H)
    (ρ : NormalMixture H) (K : ClosedSubmodule ℂ H) :
    ∑' i : ι₁, inner ℂ (b₁ i) (densityOp ρ (K.toSubmodule.starProjection (b₁ i))) =
      ∑' j : ι₂, inner ℂ (b₂ j) (densityOp ρ (K.toSubmodule.starProjection (b₂ j))) := by
  rw [densityOp_basis_trace_eq_mixTrace b₁ ρ K, densityOp_basis_trace_eq_mixTrace b₂ ρ K]

/-- Basis-independent Lüders conditioning formula `Tr(ρ_K Q) = Tr(ρ Q) / Tr(ρ K)` for every
closed subevent `Q ≤ K` and every Hilbert basis `b`. -/
theorem condMixture_basis_trace {ι : Type*} (b : HilbertBasis ι ℂ H)
    (ρ : NormalMixture H) (K : ClosedSubmodule ℂ H) (hpos : 0 < mixTrace ρ K)
    {Q : ClosedSubmodule ℂ H} (hQK : Q ≤ K) :
    ∑' i : ι, inner ℂ (b i) (densityOp (condMixture ρ K hpos) (Q.toSubmodule.starProjection (b i))) =
      (∑' i : ι, inner ℂ (b i) (densityOp ρ (Q.toSubmodule.starProjection (b i)))) /
        (∑' i : ι, inner ℂ (b i) (densityOp ρ (K.toSubmodule.starProjection (b i)))) := by
  rw [densityOp_basis_trace_eq_mixTrace b (condMixture ρ K hpos) Q,
    densityOp_basis_trace_eq_mixTrace b ρ Q,
    densityOp_basis_trace_eq_mixTrace b ρ K,
    mixTrace_condMixture_sub ρ K hpos hQK, Complex.ofReal_div]

/-- Finite-dimensional `OrthonormalBasis` specialization of `densityOp_basis_trace_eq_mixTrace`. -/
theorem densityOp_orthonormalBasis_trace_eq_mixTrace {ι : Type*} [Fintype ι]
    (b : OrthonormalBasis ι ℂ H) (ρ : NormalMixture H) (K : ClosedSubmodule ℂ H) :
    ∑' i : ι, inner ℂ (b i) (densityOp ρ (K.toSubmodule.starProjection (b i))) =
      (mixTrace ρ K : ℂ) := by
  simpa using densityOp_basis_trace_eq_mixTrace b.toHilbertBasis ρ K

end PublicTrace

end OperatorTrace

/-!
==============================================================================
  PART 11: MASTER CAPSTONE — ALL 12 ROWS OF TABLE 1 ON `momentumFock volume` (§1, §4)
==============================================================================
-/
section Table1Capstone

open MeasureTheory Set Filter Submodule
open scoped InnerProductSpace BigOperators Topology TensorProduct

private lemma modeDispersion_ge_m {d : ℕ} (m : ℝ)
    (k : EuclideanSpace ℝ (Fin d)) : m ≤ modeDispersion m k :=
  Real.le_sqrt_of_sq_le (by nlinarith [sq_nonneg ‖k‖])

private lemma separableSpace_of_dense_continuous_range {X H : Type*}
    [TopologicalSpace X] [TopologicalSpace.SeparableSpace X]
    [NormedAddCommGroup H] [NormedSpace ℂ H]
    {f : X → H} (hf : Continuous f)
    (hd : Dense (Submodule.span ℂ (Set.range f) : Set H)) :
    TopologicalSpace.SeparableSpace H :=
  hd.isSeparable_iff.mp (TopologicalSpace.isSeparable_range hf).span

/-- Separability of the concrete continuous-momentum Fock space `momentumFock volume` in every
spatial dimension `n + 1` (`D = (n + 1) + 1 ≥ 2`). -/
theorem momentumFock_separable (n : ℕ) :
    TopologicalSpace.SeparableSpace
      (momentumFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))) := by
  let μ : Measure (EuclideanSpace ℝ (Fin (n + 1))) := volume
  have : Fact ((2 : ENNReal) ≠ ⊤) := ⟨by norm_num⟩
  have hcont : Continuous (coherentVec μ) := by
    apply continuous_iff_continuous_dist.mpr
    have hd (u v : Lp ℂ 2 μ) :
        dist (coherentVec μ u) (coherentVec μ v) =
          Real.sqrt (Real.exp (‖u‖ ^ 2) - 2 * (Complex.exp (inner ℂ u v)).re +
            Real.exp (‖v‖ ^ 2)) := by
      rw [dist_eq_norm, ← Real.sqrt_sq (norm_nonneg (coherentVec μ u - coherentVec μ v)),
        norm_sub_sq (𝕜 := ℂ), norm_sq_eq_re_inner (𝕜 := ℂ), norm_sq_eq_re_inner (𝕜 := ℂ),
        coherentVec_gram, coherentVec_gram, coherentVec_gram]
      simp only [RCLike.re_to_complex]
      have hu : (Complex.exp (inner ℂ u u)).re = Real.exp (‖u‖ ^ 2) := by
        rw [inner_self_eq_norm_sq_to_K, RCLike.ofReal_eq_complex_ofReal,
          ← Complex.ofReal_pow, ← Complex.ofReal_exp, Complex.ofReal_re]
      have hv : (Complex.exp (inner ℂ v v)).re = Real.exp (‖v‖ ^ 2) := by
        rw [inner_self_eq_norm_sq_to_K, RCLike.ofReal_eq_complex_ofReal,
          ← Complex.ofReal_pow, ← Complex.ofReal_exp, Complex.ofReal_re]
      rw [hu, hv]
    simp_rw [hd]
    fun_prop
  have hdense : Dense (Submodule.span ℂ (Set.range (coherentVec μ)) : Set (momentumFock μ)) := by
    rw [dense_iff_closure_eq]
    have hcl := congrArg (fun S : Submodule ℂ (momentumFock μ) ↦ (S : Set (momentumFock μ)))
      (coherentVec_dense μ)
    simpa [Submodule.topologicalClosure_coe] using hcl
  exact separableSpace_of_dense_continuous_range hcont hdense

/-- Infinite dimensionality of the concrete continuous-momentum Fock space `momentumFock volume`
in every spatial dimension `n + 1` (`D = (n + 1) + 1 ≥ 2`). -/
theorem momentumFock_infinite_dim (n : ℕ) :
    ¬ Module.Finite ℂ
      (momentumFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))) := by
  let μ : Measure (EuclideanSpace ℝ (Fin (n + 1))) := volume
  let B : Set (EuclideanSpace ℝ (Fin (n + 1))) := Metric.ball 0 1
  have hB_meas : MeasurableSet B := Metric.isOpen_ball.measurableSet
  have hB_lt : μ B < ⊤ := measure_ball_lt_top
  have hB_pos : 0 < μ B := Metric.measure_ball_pos μ 0 zero_lt_one
  let v : Lp ℂ 2 μ := indicatorConstLp (2 : ENNReal) hB_meas hB_lt.ne (1 : ℂ)
  have hv_norm_pos : 0 < ‖v‖ := by
    rw [norm_indicatorConstLp (by norm_num : (2 : ENNReal) ≠ 0) (by norm_num : (2 : ENNReal) ≠ ⊤)]
    have htr : 0 < μ.real B := ENNReal.toReal_pos hB_pos.ne' hB_lt.ne
    simpa [norm_one] using Real.rpow_pos_of_pos htr (1 / (2 : ENNReal).toReal)
  let u₀ : Lp ℂ 2 μ := ((‖v‖⁻¹ : ℝ) : ℂ) • v
  have hu₀_norm : ‖u₀‖ = 1 := by
    dsimp only [u₀]
    rw [norm_smul, Complex.norm_real, Real.norm_of_nonneg (inv_nonneg.mpr hv_norm_pos.le),
      inv_mul_cancel₀ hv_norm_pos.ne']
  let a : ℝ → momentumFock μ := fun t ↦ coherentVec μ ((t : ℂ) • u₀)
  have hg : ∀ x y : ℝ, inner ℂ (a x) (a y) = (Real.exp (inner ℝ x y) : ℂ) := fun x y ↦ by
    dsimp only [a]
    rw [coherentVec_gram, inner_smul_left, inner_smul_right, inner_self_eq_norm_sq_to_K, hu₀_norm]
    simp [RCLike.inner_apply, Complex.ofReal_exp, mul_comm]
  exact gaussian_infinite_dimension a hg (1 : ℝ) one_ne_zero

/-- Table 1, Row 1 (Hilbert space): `momentumFock volume` is separable and infinite-dimensional,
has real positive-half-space Schwartz coherent totality, and is uniquely fixed up to unitary
equivalence by its coherent Gram table (`gram_total_unique`). -/
def Table1HilbertSpace (n : ℕ) (ħ m : ℝ) : Prop :=
  let H := momentumFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))
  TopologicalSpace.SeparableSpace H ∧ ¬ Module.Finite ℂ H ∧
    (∀ (h : ℝ → ℝ), Measurable h → (∀ t, 0 ≤ h t) → IntegrableOn h (Ioi (0 : ℝ)) →
      0 < ∫ t in Ioi (0 : ℝ), h t →
      let b := fun k : EuclideanSpace ℝ (Fin (n + 1)) ↦
        Real.sqrt (ħ / (2 * modeDispersion m k)) * laplaceBump h (modeDispersion m k)
      ∃ hb : MemLp (fun k ↦ (b k : ℂ)) (⊤ : ENNReal)
          (volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))),
        (Submodule.span ℂ (Set.range (fun g : SchwartzMap (EuclideanSpace ℝ (Fin (n + 1))) ℝ ↦
          coherentVec (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))
            (realFixedProfileMap b hb g)))).topologicalClosure = ⊤) ∧
    (∀ (F : Type) [NormedAddCommGroup F] [InnerProductSpace ℂ F] [CompleteSpace F]
      (b : Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))) → F),
      Dense (Submodule.span ℂ (Set.range b) : Set F) →
      (∀ u v, inner ℂ (b u) (b v) = Complex.exp (inner ℂ u v)) →
      ∃! W : H ≃ₗᵢ[ℂ] F,
        ∀ u, W (coherentVec (volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))) u) = b u)

/-- Table 1, Row 2 (Unitary evolution): strongly continuous 1-parameter unitary group `fockUnitary`
on `momentumFock volume` with exact Schrödinger generator domain `Dom(H)` and symmetric nonnegative
mass-shell Hamiltonian `fockH`. -/
def Table1UnitaryEvolution (n : ℕ) (ħ m : ℝ) : Prop :=
  let μ : Measure (EuclideanSpace ℝ (Fin (n + 1))) := volume
  let U := fockUnitary μ (modeDispersion m) (modeDispersion_measurable m)
  U 0 = ContinuousLinearMap.id ℂ (momentumFock μ) ∧
    (∀ t₁ t₂, U (t₁ + t₂) = (U t₁).comp (U t₂)) ∧
    (∀ t ψ, ‖U t ψ‖ = ‖ψ‖) ∧
    (∀ ψ χ, HasDerivAt (fun t ↦ U t ψ) χ 0 ↔
      ∃ hψ : fockDomH μ ħ (modeDispersion m) ψ,
        χ = -(Complex.I / (ħ : ℂ)) •
          fockH μ ħ (modeDispersion m) (modeDispersion_measurable m) ψ hψ) ∧
    (∀ φ ψ (hφ : fockDomH μ ħ (modeDispersion m) φ) (hψ : fockDomH μ ħ (modeDispersion m) ψ),
      inner ℂ φ (fockH μ ħ (modeDispersion m) (modeDispersion_measurable m) ψ hψ) =
        inner ℂ (fockH μ ħ (modeDispersion m) (modeDispersion_measurable m) φ hφ) ψ) ∧
    (∀ ψ (hψ : fockDomH μ ħ (modeDispersion m) ψ),
      0 ≤ (inner ℂ ψ
        (fockH μ ħ (modeDispersion m) (modeDispersion_measurable m) ψ hψ)).re)

/-- Table 1, Row 3 (Tensor product): canonical unitary equivalence
`Completion (momentumFock μ ⊗[ℂ] momentumFock μ) ≃ₗᵢ[ℂ] momentumFock (sumMeasure μ μ)` sending
pure coherent tensors `E(u) ⊗ₜ E(v)` to `E(u ⊕ v)`. -/
def Table1TensorProduct {X : Type*} [MeasurableSpace X] (μ : Measure X) [SigmaFinite μ] : Prop :=
  ∃! W : UniformSpace.Completion (momentumFock μ ⊗[ℂ] momentumFock μ) ≃ₗᵢ[ℂ]
      momentumFock (sumMeasure μ μ),
    ∀ (u v : Lp ℂ 2 μ),
      W (ProductL2.tensorPure (coherentVec μ u) (coherentVec μ v)) =
        coherentVec (sumMeasure μ μ) (sumLp μ μ u v)

/-- Table 1, Row 4 (Born rule): existence and uniqueness of the event-weight law `‖P_K ψ‖²`
for every unit vector `ψ` in `H`. -/
def Table1BornRule (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] : Prop :=
  ∀ ψ : H, ‖ψ‖ = 1 →
    (∃! p : ClosedSubmodule ℂ H → ℝ, EventRules ψ p) ∧
    EventRules ψ (fun K ↦ ‖K.toSubmodule.starProjection ψ‖ ^ 2)

/-- Table 1, Row 5 (Self-adjoint observables): every Borel PVM `P` on `H` generates a densely
defined, genuinely self-adjoint observable `A = ∫ a dP(a)` on `pvmDom P` whose expectation equals
`∫ a dμ_ψ(a)`. -/
def Table1SelfAdjointObservables (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] : Prop :=
  ∀ P : PVM H,
    Dense (pvmDom P : Set H) ∧
    (∀ φ χ, (∀ ψ (hψ : ψ ∈ pvmDom P), inner ℂ φ (pvmOp P ψ hψ) = inner ℂ χ ψ) ↔
      ∃ hφ : φ ∈ pvmDom P, pvmOp P φ hφ = χ) ∧
    (∀ ψ (hψ : ψ ∈ pvmDom P),
      (inner ℂ ψ (pvmOp P ψ hψ)).re = ∫ a, a ∂(P.specMeasure ψ))

/-- Table 1, Row 6 (Projection update & operator trace): pure-state normalized projection ray
uniqueness up to unit phase, normal-mixture Lüders operator uniqueness `P_K ρ P_K / Tr(ρ P_K)`,
and basis-independent Hilbert-space operator trace `∑' i, ⟨b_i, ρ P_K b_i⟩ = mixTrace ρ K`. -/
def Table1ProjectionUpdate.{u} (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] : Prop :=
  (∀ (K : ClosedSubmodule ℂ H) (ψ : H), K.toSubmodule.starProjection ψ ≠ 0 →
      let ψ' := (‖K.toSubmodule.starProjection ψ‖⁻¹ : ℂ) • K.toSubmodule.starProjection ψ
      ‖ψ'‖ = 1 ∧ ‖K.toSubmodule.starProjection ψ'‖ ^ 2 = 1 ∧
      (∀ Q : ClosedSubmodule ℂ H, Q ≤ K →
        ‖Q.toSubmodule.starProjection ψ'‖ ^ 2 =
          ‖Q.toSubmodule.starProjection ψ‖ ^ 2 / ‖K.toSubmodule.starProjection ψ‖ ^ 2) ∧
      (∀ φ : H, ‖φ‖ = 1 →
        (∀ Q : ClosedSubmodule ℂ H, Q ≤ K →
          ‖Q.toSubmodule.starProjection φ‖ ^ 2 =
            ‖Q.toSubmodule.starProjection ψ‖ ^ 2 / ‖K.toSubmodule.starProjection ψ‖ ^ 2) →
        ∃ c : ℂ, ‖c‖ = 1 ∧ φ = c • ψ')) ∧
    (∀ (ρ : NormalMixture H) (K : ClosedSubmodule ℂ H) (hpos : 0 < mixTrace ρ K),
      (∃! σ : H →L[ℂ] H, ∃ post : ClosedSubmodule ℂ H → ℝ,
        (∀ A, post A ∈ Set.Icc 0 1) ∧
        (∀ A B : ClosedSubmodule ℂ H, B ≤ Aᗮ → post (A ⊔ B) = post A + post B) ∧
        post K = 1 ∧
        (∀ x : H, inner ℂ (σ x) x = ((‖x‖ ^ 2 * post (ray x) : ℝ) : ℂ)) ∧
        (∀ y ∈ K, post (ray y) * mixTrace ρ K = mixTrace ρ (ray y))) ∧
      densityOp (condMixture ρ K hpos) =
        (mixTrace ρ K : ℂ)⁻¹ •
          (K.toSubmodule.starProjection.comp
            ((densityOp ρ).comp K.toSubmodule.starProjection)) ∧
      (∀ (ι : Type u) (b : HilbertBasis ι ℂ H),
        ∑' i : ι, inner ℂ (b i) (densityOp ρ (K.toSubmodule.starProjection (b i))) =
          (mixTrace ρ K : ℂ)))

/-- Table 1, Row 7 (Poincaré covariance): unitary spacetime translations, `O(n + 1)` spatial
rotations, and 1-parameter directional Lorentz boosts fix `Ω := fockVacuum volume` and intertwine
`Φ := wightmanField` / `contField` on `core := FiniteParticleFock volume`. -/
def Table1PoincareCovariance (n : ℕ) {ħ m : ℝ} (hħ : 0 ≤ ħ) (hm : 0 < m) : Prop :=
  let Ω := fockVacuum (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))
  let Φ := wightmanField (n + 1) ħ m hħ hm
  let core := FiniteParticleFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))
  (∀ (a : ℝ × EuclideanSpace ℝ (Fin (n + 1)))
      (f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin (n + 1))) ℂ) (ψ : core),
      fockTranslation (n + 1) m a Ω = Ω ∧
      secondQuantizeFin volume (translationUnitary (n + 1) m a) (Φ f ψ) =
        Φ (translateSchwartz a f)
          (secondQuantizeFin volume (translationUnitary (n + 1) m a) ψ)) ∧
    (∀ (R : EuclideanSpace ℝ (Fin (n + 1)) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin (n + 1)))
      (f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin (n + 1))) ℂ) (ψ : core),
      fockRotation (n + 1) R Ω = Ω ∧
      secondQuantizeFin volume (rotationUnitary (n + 1) R) (Φ f ψ) =
        Φ (rotateSchwartz R f)
          (secondQuantizeFin volume (rotationUnitary (n + 1) R) ψ)) ∧
    (∀ (u : EuclideanSpace ℝ (Fin (n + 1))) (s t : ℝ)
      (v vbar : Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))) (ψ : core),
      fockDirectionalBoost n m hm u 0 = 1 ∧
      fockDirectionalBoost n m hm u (s + t) =
        fockDirectionalBoost n m hm u s * fockDirectionalBoost n m hm u t ∧
      fockDirectionalBoost n m hm u t Ω = Ω ∧
      secondQuantizeFin volume (directionalBoostUnitary n m hm u t) (contField volume v vbar ψ) =
        contField volume (directionalBoostUnitary n m hm u t v)
          (directionalBoostUnitary n m hm u t vbar)
          (secondQuantizeFin volume (directionalBoostUnitary n m hm u t) ψ))

/-- Table 1, Row 8 (Forward-cone spectrum): multi-particle forward cone, energy mass gap
`{0} ∪ [ħm, ∞)`, and exponential contraction decay `‖(fockShift s ψ)_k‖ ≤ exp(-s k m) ‖ψ_k‖`. -/
def Table1ForwardConeSpectrum (n : ℕ) (ħ m : ℝ) (hm : 0 < m) : Prop :=
  (∀ {I : Type} (S : Finset I) (k : I → EuclideanSpace ℝ (Fin (n + 1))),
      ‖∑ i ∈ S, k i‖ ≤ ∑ i ∈ S, MassShell.rate m (k i)) ∧
    (∀ {I : Type} (S : Finset I) (k : I → EuclideanSpace ℝ (Fin (n + 1))),
      (∑ i ∈ S, ħ * MassShell.rate m (k i)) ∈ ({0} : Set ℝ) ∪ Set.Ici (ħ * m) ∧
        ((∑ i ∈ S, ħ * MassShell.rate m (k i)) = 0 ↔ S = ∅)) ∧
    (∀ (s : ℝ) (hs : 0 ≤ s)
      (ψ : momentumFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))) (k : ℕ),
      ‖(fockShift (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))
          (modeDispersion m) (modeDispersion_measurable m)
          (fun p ↦ hm.le.trans (modeDispersion_ge_m m p)) s hs ψ) k‖ ≤
        Real.exp (-s * (k : ℝ) * m) * ‖ψ k‖)

/-- Table 1, Row 9 (Unique vacuum): `fockH Ω = 0`, `fockShift s ψ = ψ ↔ ψ ∈ ℂ · Ω` for `s > 0`,
and zero total dispersion iff the particle sector is empty. -/
def Table1UniqueVacuum (n : ℕ) (ħ m : ℝ) (hm : 0 < m) : Prop :=
  let μ : Measure (EuclideanSpace ℝ (Fin (n + 1))) := volume
  let Ω := fockVacuum μ
  fockH μ ħ (modeDispersion m) (modeDispersion_measurable m) Ω
      (fockDomH_vacuum μ ħ (modeDispersion m)) = 0 ∧
    (∀ (s : ℝ) (hs : 0 < s) (ψ : momentumFock μ),
      fockShift μ (modeDispersion m) (modeDispersion_measurable m)
        (fun p ↦ hm.le.trans (modeDispersion_ge_m m p)) s hs.le ψ = ψ ↔
          ψ ∈ Submodule.span ℂ {Ω}) ∧
    (∀ {I : Type} (S : Finset I) (k : I → EuclideanSpace ℝ (Fin (n + 1))),
      (∑ i ∈ S, MassShell.rate m (k i)) = 0 ↔ S = ∅)

/-- Table 1, Row 10 (Field distributions): dense finite-particle core containing `Ω`,
tempered-distribution continuity of `f ↦ ⟨φ, Φ(f) ψ⟩`, and real-test Hermiticity. -/
def Table1FieldDistributions (n : ℕ) {ħ m : ℝ} (hħ : 0 ≤ ħ) (hm : 0 < m) : Prop :=
  let core := FiniteParticleFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))
  let Φ := wightmanField (n + 1) ħ m hħ hm
  Dense (core : Set (momentumFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))))) ∧
    fockVacuum (volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))) ∈ core ∧
    (∀ (φ ψ : core),
      Continuous (fun f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin (n + 1))) ℂ ↦
        inner ℂ φ.1 (Φ f ψ).1)) ∧
    (∀ (f : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin (n + 1))) ℝ) (φ ψ : core),
      inner ℂ (Φ (FeatureDensity.ofRealSchwartz f) φ).1 ψ.1 =
        inner ℂ φ.1 (Φ (FeatureDensity.ofRealSchwartz f) ψ).1)

/-- Table 1, Row 11 (Spacelike commutativity): `[Φ(f), Φ(f')] ψ = 0` on `FiniteParticleFock`
for all compactly supported real smooth tests with spacelike-separated supports in `D ≥ 2`. -/
def Table1SpacelikeCommutativity (n : ℕ) {ħ m : ℝ} (hħ : 0 ≤ ħ) (hm : 0 < m) : Prop :=
  let core := FiniteParticleFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))
  let Φ := wightmanField (n + 1) ħ m hħ hm
  ∀ (f f' : SchwartzMap (ℝ × EuclideanSpace ℝ (Fin (n + 1))) ℝ),
    HasCompactSupport f → HasCompactSupport f' →
    (∀ p ∈ tsupport f, ∀ q ∈ tsupport f', |p.1 - q.1| < ‖p.2 - q.2‖) →
    ∀ ψ : core,
      Φ (FeatureDensity.ofRealSchwartz f) (Φ (FeatureDensity.ofRealSchwartz f') ψ) =
        Φ (FeatureDensity.ofRealSchwartz f') (Φ (FeatureDensity.ofRealSchwartz f) ψ)

/-- Table 1, Row 12 (Cyclic vacuum): real-Schwartz field polynomials applied to the vacuum
`fockVacuumFin volume` are dense in `momentumFock volume`. -/
def Table1CyclicVacuum (n : ℕ) (ħ m : ℝ) : Prop :=
  ∀ (h : ℝ → ℝ), Measurable h → (∀ t, 0 ≤ h t) → IntegrableOn h (Ioi (0 : ℝ)) →
    0 < ∫ t in Ioi (0 : ℝ), h t →
    let b := fun k : EuclideanSpace ℝ (Fin (n + 1)) ↦
      Real.sqrt (ħ / (2 * modeDispersion m k)) * laplaceBump h (modeDispersion m k)
    ∃ hb : MemLp (fun k ↦ (b k : ℂ)) (⊤ : ENNReal)
        (volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))),
      (Submodule.span ℂ
        (Set.range fun L : List (SchwartzMap (EuclideanSpace ℝ (Fin (n + 1))) ℝ) ↦
          (L.foldl (fun ψ g ↦
            contField (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))
              (realFixedProfileMap b hb g) (realFixedProfileMap b hb g) ψ)
            (fockVacuumFin (volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))))).1)).topologicalClosure =
        ⊤

private lemma table1HilbertSpace_holds (n : ℕ) {ħ m : ℝ} (hħ : 0 < ħ) (hm : 0 < m) :
    Table1HilbertSpace n ħ m := by
  refine ⟨momentumFock_separable n, momentumFock_infinite_dim n, ?_, ?_⟩
  · intro h hM hn hi hh
    exact coherentVec_realSchwartz_dense (modeDispersion m) (modeDispersion_measurable m) m ħ
      hm hħ (modeDispersion_ge_m m) h hM hn hi hh
  · intro F _ _ _ b hb hgram
    let H := momentumFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))
    have hcoh_dense :
        Dense (Submodule.span ℂ
          (Set.range (coherentVec (volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))))) :
          Set H) := by
      rw [dense_iff_closure_eq]
      have hcl := congrArg (fun S : Submodule ℂ H ↦ (S : Set H))
        (coherentVec_dense (volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))))
      simpa [Submodule.topologicalClosure_coe] using hcl
    exact gram_total_unique (coherentVec (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))) b
      hcoh_dense hb fun u v ↦ by rw [coherentVec_gram, hgram]

private lemma table1UnitaryEvolution_holds (n : ℕ) {ħ m : ℝ} (hħ : 0 < ħ) (hm : 0 < m) :
    Table1UnitaryEvolution n ħ m :=
  ⟨fockUnitary_zero volume (modeDispersion m) (modeDispersion_measurable m),
   fockUnitary_add volume (modeDispersion m) (modeDispersion_measurable m),
   fockUnitary_norm volume (modeDispersion m) (modeDispersion_measurable m),
   fockUnitary_hasDerivAt_iff volume hħ.ne' (modeDispersion m) (modeDispersion_measurable m),
   fun _ _ hφ hψ ↦ fockH_symm volume ħ (modeDispersion m) (modeDispersion_measurable m) hφ hψ,
   fun _ hψ ↦ modeFockH_nonneg volume hħ hm hψ⟩

private lemma table1TensorProduct_holds {X : Type*} [MeasurableSpace X] (μ : Measure X)
    [SigmaFinite μ] : Table1TensorProduct μ :=
  momentumFock_tensor_unique μ μ

private lemma table1BornRule_holds (H : Type*) [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] [CompleteSpace H] [SecondCountableTopology H]
    (hinf : ¬ Module.Finite ℂ H) : Table1BornRule H :=
  fun ψ hψ ↦ ⟨existsUnique_event_weights hinf ψ hψ, born_satisfies_event_rules ψ hψ⟩

private lemma table1SelfAdjointObservables_holds (H : Type*) [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] [CompleteSpace H] : Table1SelfAdjointObservables H :=
  fun P ↦ ⟨pvmDom_dense P, pvmOp_selfAdjoint P, fun _ hψ ↦ pvmOp_expectation P hψ⟩

private lemma table1ProjectionUpdate_holds.{u} (H : Type*) [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] [CompleteSpace H] : Table1ProjectionUpdate.{u} H := by
  refine ⟨fun K ψ hv ↦ pure_update_exists_unique K ψ hv, fun ρ K hpos ↦ ?_⟩
  obtain ⟨hcomp, hself, hsub, hca, huniq⟩ := normal_mixture_luders_update ρ K hpos
  refine ⟨?_, hcomp, fun ι b ↦ densityOp_basis_trace_eq_mixTrace b ρ K⟩
  refine ⟨densityOp (condMixture ρ K hpos),
    ⟨mixTrace (condMixture ρ K hpos),
      fun A ↦ ⟨mixTrace_nonneg _ A, mixTrace_le_one _ A⟩,
      fun A B hAB ↦ binary_of_countable hca A B hAB,
      hself,
      densityOp_inner_eq_mixTrace_ray (condMixture ρ K hpos),
      fun y hy ↦ by
        have hray : ray y ≤ K := (Submodule.span_singleton_le_iff_mem _ _).mpr hy
        rw [hsub (ray y) hray, div_mul_cancel₀ _ hpos.ne']⟩,
    fun σ ⟨post, hprob, hadd, hc, hσray, hratio⟩ ↦ huniq σ post hprob hadd hc hσray hratio⟩

private lemma table1PoincareCovariance_holds (n : ℕ) {ħ m : ℝ} (hħ : 0 ≤ ħ) (hm : 0 < m) :
    Table1PoincareCovariance n hħ hm := by
  have hW := wightman_axioms_on_momentumFock n hħ hm
  exact ⟨hW.2.2.2.2.2.1, hW.2.2.2.2.2.2.1, fun u s t v vbar ψ ↦
    ⟨fockDirectionalBoost_zero n m hm u,
     fockDirectionalBoost_add n m hm u s t,
     (hW.2.2.2.2.2.2.2 u t v vbar ψ).1,
     (hW.2.2.2.2.2.2.2 u t v vbar ψ).2⟩⟩

private lemma table1ForwardConeSpectrum_holds (n : ℕ) {ħ m : ℝ} (hħ : 0 < ħ) (hm : 0 < m) :
    Table1ForwardConeSpectrum n ħ m hm :=
  ⟨fun S k ↦ sector_forward S m k,
   fun S k ↦ sector_energy_spectrum S ħ m hħ hm k,
   fun s hs ψ k ↦ fockShift_sector_norm_le volume (modeDispersion m) (modeDispersion_measurable m)
     hm.le (modeDispersion_ge_m m) s hs ψ k⟩

private lemma table1UniqueVacuum_holds (n : ℕ) (ħ : ℝ) {m : ℝ} (hm : 0 < m) :
    Table1UniqueVacuum n ħ m hm :=
  ⟨fockH_vacuum volume ħ (modeDispersion m) (modeDispersion_measurable m),
   fun _ hs ψ ↦ fockShift_fixed_iff_mem_vacuum volume (modeDispersion m)
     (modeDispersion_measurable m) hm (modeDispersion_ge_m m) hs ψ,
   fun S k ↦ sector_zero_iff S m hm k⟩

private lemma table1FieldDistributions_holds (n : ℕ) {ħ m : ℝ} (hħ : 0 ≤ ħ) (hm : 0 < m) :
    Table1FieldDistributions n hħ hm := by
  have hW := wightman_axioms_on_momentumFock n hħ hm
  let H := momentumFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))
  have hcore_dense :
      Dense (FiniteParticleFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))) : Set H) := by
    rw [dense_iff_closure_eq]
    have hcl := congrArg (fun S : Submodule ℂ H ↦ (S : Set H))
      (finiteParticle_dense (volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))))
    simpa [Submodule.topologicalClosure_coe] using hcl
  exact ⟨hcore_dense, hW.2.1, hW.2.2.1, hW.2.2.2.1⟩

private lemma table1SpacelikeCommutativity_holds (n : ℕ) {ħ m : ℝ} (hħ : 0 ≤ ħ) (hm : 0 < m) :
    Table1SpacelikeCommutativity n hħ hm :=
  fun f f' hf hf' hsep ψ ↦ sub_eq_zero.mp (wightman_spacelike_locality hħ hm f f' hf hf' hsep ψ)

private lemma table1CyclicVacuum_holds (n : ℕ) {ħ m : ℝ} (hħ : 0 < ħ) (hm : 0 < m) :
    Table1CyclicVacuum n ħ m :=
  fun h hM hn hi hh ↦
    contField_vacuum_cyclic_realSchwartz (modeDispersion m) (modeDispersion_measurable m)
      m ħ hm hħ (modeDispersion_ge_m m) h hM hn hi hh

/-- **Master Capstone Theorem (Table 1, all 12 rows unified on one concrete Hilbert space).**

For every spatial dimension `n + 1` (`D = (n + 1) + 1 ≥ 2`) and every `ħ > 0`, `m > 0`, on the
single concrete Hilbert space
`H := momentumFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))`, vacuum `Ω := fockVacuum`,
unitary time evolution `U := fockUnitary`, Hamiltonian `fockH`, and tempered field
`Φ := wightmanField` with dense finite-particle core `core := FiniteParticleFock`:

- **von Neumann axioms (Rows 1–6):**
  1. `Table1HilbertSpace`: separable, infinite-dimensional Hilbert space with real-Schwartz
     coherent totality and unique coherent Gram realization up to unitary equivalence.
  2. `Table1UnitaryEvolution`: strongly continuous unitary time evolution with exact Schrödinger
     generator domain `Dom(H)`, symmetric nonnegative mass-shell Hamiltonian `fockH`.
  3. `Table1TensorProduct`: canonical completed Hilbert tensor product
     `H ⊗̂ H ≃ₗᵢ[ℂ] momentumFock (sumMeasure volume volume)`.
  4. `Table1BornRule`: existence and uniqueness of Born-rule event weights `‖P_K ψ‖²` for every
     unit vector `ψ ∈ H`.
  5. `Table1SelfAdjointObservables`: self-adjoint unbounded observables `A = ∫ a dP(a)` on dense
     `pvmDom P` for every Borel PVM `P` on `H`.
  6. `Table1ProjectionUpdate`: pure-state normalized projection ray uniqueness, normal-mixture
     Lüders operator uniqueness, and basis-independent Hilbert-space operator trace
     `Tr(ρ P_K) = mixTrace ρ K`.
- **Wightman axioms (Rows 7–12):**
  7. `Table1PoincareCovariance`: unitary Poincaré covariance under spacetime translations,
     `O(n + 1)` spatial rotations, and 1-parameter directional Lorentz boosts fixing `Ω` and
     intertwining `Φ` / `contField`.
  8. `Table1ForwardConeSpectrum`: forward-cone energy-momentum spectrum `{0} ∪ [ħm, ∞)` and
     exponential shift contraction decay.
  9. `Table1UniqueVacuum`: unique zero-energy vacuum (`fockH Ω = 0`,
     `fockShift s ψ = ψ ↔ ψ ∈ ℂ · Ω`, `sector_zero_iff`).
  10. `Table1FieldDistributions`: dense finite-particle core containing `Ω`, tempered-distribution
      continuity of matrix elements `f ↦ ⟨φ, Φ(f) ψ⟩`, and real-test Hermiticity.
  11. `Table1SpacelikeCommutativity`: unconditional spacelike commutativity `[Φ(f), Φ(f')] ψ = 0`
      for compactly supported real Schwartz tests with spacelike-separated supports.
  12. `Table1CyclicVacuum`: real-Schwartz vacuum cyclicity of the field polynomial algebra. -/
theorem theorem1_table1_axioms.{u} (n : ℕ) {ħ m : ℝ} (hħ : 0 < ħ) (hm : 0 < m) :
    let H := momentumFock (volume : Measure (EuclideanSpace ℝ (Fin (n + 1))))
    Table1HilbertSpace n ħ m ∧
    Table1UnitaryEvolution n ħ m ∧
    Table1TensorProduct (volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))) ∧
    Table1BornRule H ∧
    Table1SelfAdjointObservables H ∧
    Table1ProjectionUpdate.{u} H ∧
    Table1PoincareCovariance n hħ.le hm ∧
    Table1ForwardConeSpectrum n ħ m hm ∧
    Table1UniqueVacuum n ħ m hm ∧
    Table1FieldDistributions n hħ.le hm ∧
    Table1SpacelikeCommutativity n hħ.le hm ∧
    Table1CyclicVacuum n ħ m := by
  intro H
  have : TopologicalSpace.SeparableSpace H := momentumFock_separable n
  have : SecondCountableTopology H := UniformSpace.secondCountable_of_separable H
  exact ⟨table1HilbertSpace_holds n hħ hm,
    table1UnitaryEvolution_holds n hħ hm,
    table1TensorProduct_holds (volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))),
    table1BornRule_holds H (momentumFock_infinite_dim n),
    table1SelfAdjointObservables_holds H,
    table1ProjectionUpdate_holds.{u} H,
    table1PoincareCovariance_holds n hħ.le hm,
    table1ForwardConeSpectrum_holds n hħ hm,
    table1UniqueVacuum_holds n ħ hm,
    table1FieldDistributions_holds n hħ.le hm,
    table1SpacelikeCommutativity_holds n hħ.le hm,
    table1CyclicVacuum_holds n hħ hm⟩

end Table1Capstone

end DotProduct
