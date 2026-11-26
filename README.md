# A Dot Product Is All You Need

<p align="center">
  <strong>Quantum mechanics and special relativity from a single axiom</strong><br />
  <em>One dot product. Two readings of Pythagoras.</em>
</p>

<p align="center">
  <a href="verification/README.md#paper-1-plane"><img src="https://img.shields.io/badge/Lean-proved-2e7d32?style=for-the-badge" alt="Lean proved" /></a>
  <a href="https://emad-ii.github.io/dot-product/"><img src="https://img.shields.io/badge/Explore-Interactive_website-236d88?style=for-the-badge" alt="Explore the interactive website" /></a>
  <a href="https://emad-ii.github.io/dot-product/talk/"><img src="https://img.shields.io/badge/Watch-The_proof-6d557f?style=for-the-badge" alt="Watch the animated proof" /></a>
  <a href="paper/A_Dot_Product_Is_All_You_Need_Final.pdf"><img src="https://img.shields.io/badge/Read-The_paper-0f233f?style=for-the-badge" alt="Read the paper PDF" /></a>
  <a href="#run-it-yourself"><img src="https://img.shields.io/badge/Run-The_Lean_check-F9AB00?style=for-the-badge" alt="Run the Lean check" /></a>
</p>

<p align="center">
  <img src="docs/assets/reflection-plane-hero.png" alt="Illustration of blue and amber curves meeting at a luminous plane on a dark grid" width="1000" />
</p>

Quantum mechanics is usually stated with several axioms. **Here, one axiom suffices:** displacements are measured by a single positive dot product. Applying the stated rules of inference determines the von Neumann axioms of quantum mechanics and the Lorentzian structure of special relativity for a free scalar field. The invariant speed of light is finite and nonzero.

**Squared lengths add. Read that equation twice.** With the product rule it determines the Gaussian law of the readings. With the sum rule it determines the Born weights. The same geometry answers two questions that quantum theory usually treats separately: what the field readings look like, and how states give probabilities.

## The uniqueness and no-go theorem

**Axiom.** Displacements are measured by a single positive dot product $g$ in dimension $D \geq 2$.

For orthogonal displacements,

$$
\|x+y\|_g^2 = \|x\|_g^2 + \|y\|_g^2.
$$

Apply the stated inference rules. At the specified lattice moments, the covariance is

$$
C = \hbar(-\Delta_g + m^2)^{-1}.
$$

**Uniqueness.** For each pair of positive scales $m$ and $\hbar$, the stated rules and lattice moments determine one law of the readings. Its reflected overlaps fix the state space up to a unitary preserving those readings.

**No-go.** Within the stated local polynomial class, every higher degree fails the reflection test. Two opposite pulses suffice to witness the failure.

**Special relativity.** Rotations continue to Lorentz boosts. The continued form $|x|_g^2-t^2$ gives the null cone $|x|_g=|t|$: the invariant speed is $c=1$ in the shared units used here. The result fixes the cone, not a numerical value for $c$ in independently chosen units.

## Follow the proof

1. **Rotate two copies.** The law of independent readings is unchanged by rotation of the copies. The characteristic function must turn addition of squared lengths into multiplication. That forces the Gaussian.
2. **Reflect two pulses.** The lattice entropy calculation gives a degree-one precision. Separately, two pulses with opposite signs provide a witness against each higher degree: its reflected square would be negative.
3. **Read the plane.** What the plane knows of a preparation supplies the inner product. The shift continues to unitary time evolution, and rotations continue to Lorentz boosts.
4. **Ask what an event weighs.** Orthogonal event weights add. Decomposing and recombining them fixes the squared-norm rule; the product rule gives composition and ideal projection conditioning.

The [paper](paper/A_Dot_Product_Is_All_You_Need_Final.pdf) gives the full argument in four pages. The [proof guide](docs/plane-proof-guide.md) maps the steps to Lean and the interactive figures.

## Lean-checked theorem

The capstone `DotProduct.theorem1_table1_axioms` establishes all twelve statements of Table 1, as formulated in the companion, on one specified Fock space. Its local axiom audit found only `propext`, `Classical.choice` and `Quot.sound`.

The companion also checks the Gaussian, finite-lattice and two-pulse results. It does not claim to formalise every analytic bridge in the manuscript. The proof guide lists those boundaries, including the scope of the continuum and Poincaré statements.

[Exact Lean source](lean/A_Dot_Product_Is_All_You_Need_Final.lean) · [Proof scope](docs/plane-proof-guide.md#what-the-plane-lean-file-proves) · [Verification record](verification/README.md)

## Run it yourself

The package pins Lean 4.34.1 and Mathlib `d13f23b`. With [Lean installed](https://leanprover-community.github.io/get_started.html), run from a fresh clone:

```sh
(cd lean && lake exe cache get)
bash scripts/check-lean.sh plane
python3 scripts/verify.py
```

To run the interactive explainer, install Node.js, then run `npm ci` and `npm run serve`. Open [localhost:4173](http://localhost:4173). The prebuilt page is included; `npm run build` regenerates it.

| Check | What it establishes |
| :--- | :--- |
| **Manuscript** | The determination, including analytic bridges identified in the proof guide |
| **Lean 4 / Mathlib** | The stated formal results and the Table 1 capstone |
| **SHA-256 manifest and site build** | The deposited files and the explainer's downloads agree |

The badge refers to the formal results above. The [verification record](verification/README.md) gives the reproducible check and axiom audit.

## Everything in one place

| Read or explore | Source |
| :--- | :--- |
| Four-page paper | [PDF](paper/A_Dot_Product_Is_All_You_Need_Final.pdf) · [LaTeX](paper/A_Dot_Product_Is_All_You_Need_Final.tex) |
| Formal companion | [Lean](lean/A_Dot_Product_Is_All_You_Need_Final.lean) · [Proof guide](docs/plane-proof-guide.md) |
| Interactive explainer and animated talk | [Watch the proof](https://emad-ii.github.io/dot-product/talk/) · [Interactive website](https://emad-ii.github.io/dot-product/) · [Build and run](docs/plane-proof-guide.md#build-the-website) · [Site source](site/) |
| Verify or cite | [Check record](verification/README.md) · [Manifest](release.json) · [Citation](CITATION.cff) |

[Download the complete repository](https://github.com/emad-ii/dot-product/archive/refs/heads/main.zip) to keep the paper, proof and explainer together.

## Challenge the mathematics

Try to break one of the steps. Which hypotheses force the Gaussian law? When do the two pulses exclude a higher-degree precision? Where does the manuscript supply an analytic bridge that the Lean file does not? Start with the [paper](paper/A_Dot_Product_Is_All_You_Need_Final.pdf) and the [proof scope](docs/plane-proof-guide.md#what-the-plane-lean-file-proves). A useful objection names the claim, its hypotheses and the step that fails.

---

**Emad Mostaque · 26 November 2026**

**Acknowledgments.** This work used the Logos AI system, incorporating several frontier models. The Lean formalisation used GPT 6.2 Astra and Gemini Neon.
