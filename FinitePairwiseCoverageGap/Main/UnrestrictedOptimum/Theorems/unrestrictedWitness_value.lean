-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Prelude
import FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Defs.unrestrictedWitness
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Piecewise
import Mathlib.Algebra.Ring.Defs
import Mathlib.Tactic.Field
import Mathlib.Tactic.NormNum.BigOperators
import Mathlib.Tactic.NormNum.Core
import Mathlib.Tactic.Ring.RingNF
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `unrestrictedWitness_value`

Theorem `unrestrictedWitness_value` states the exact real-valued equality `expectedCoverage
unrestrictedWitness = 4`.  It records that the three support sets of the accepted witness each cover
all four features and that their weights yield expected coverage `4`.

## Sources

- Source `article/sections/02_counterexample.tex`, lines 37–39

## Statement dependencies

- `Main.Foundations::expectedCoverage` → `expectedCoverage` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.expectedCoverage`
- `Main.UnrestrictedOptimum::unrestrictedWitness` → `unrestrictedWitness` from
  `FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Defs.unrestrictedWitness`

## Proof outline

Unfold `expectedCoverage`, `unrestrictedWitness`, `coverage`, and `elementFeatures`.  Evaluate the
finite sum over all `Finset Element`: the witness vanishes except at `{0,2}`, `{1}`, and `{3,4}`.
For each of those three sets, compute the `biUnion` of the assigned feature sets and its
cardinality; each is the full four-feature set, hence has coverage `4`.  The expected-coverage sum
therefore becomes
`(3/10) * 4 + (7/20) * 4 + (7/20) * 4`.
Use finite big-operator normalization and exact rational real arithmetic to reduce this expression
to `4`.  This establishes the exact accepted equality without asserting anything about sets outside
the witness support.

## Proof sources

- Source `article/sections/02_counterexample.tex`, lines 37–39

## Proof dependencies

- `Finset.sum_add_distrib` from `Mathlib.Algebra.BigOperators.Group.Finset.Basic`
- `Finset.sum_ite_eq'` from `Mathlib.Algebra.BigOperators.Group.Finset.Piecewise`
- `add_mul` from `Mathlib.Algebra.Ring.Defs`
- `Mathlib.Tactic.FieldSimp.field` from `Mathlib.Tactic.Field`
- `Mathlib.Meta.NormNum.evalFinsetSum` from `Mathlib.Tactic.NormNum.BigOperators`
- `Mathlib.Tactic.normNum` from `Mathlib.Tactic.NormNum.Core`
- `Mathlib.Tactic.RingNF.ring` from `Mathlib.Tactic.Ring.RingNF`
- `Main.Foundations::coverage` → `coverage` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.coverage`
- `Main.Foundations::elementFeatures` → `elementFeatures` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.elementFeatures`
- `Main.Foundations::expectedCoverage` → `expectedCoverage` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.expectedCoverage`
- `Main.UnrestrictedOptimum::unrestrictedWitness` → `unrestrictedWitness` from
  `FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Defs.unrestrictedWitness`
-/
theorem unrestrictedWitness_value : expectedCoverage unrestrictedWitness = 4 := by
  classical
  have h₀₁ : ({0, 2} : Finset Element) ≠ {1} := by decide
  have h₀₂ : ({0, 2} : Finset Element) ≠ {3, 4} := by decide
  have h₁₂ : ({1} : Finset Element) ≠ {3, 4} := by decide
  have h₁₀ : ({1} : Finset Element) ≠ {0, 2} := Ne.symm h₀₁
  have h₂₀ : ({3, 4} : Finset Element) ≠ {0, 2} := Ne.symm h₀₂
  have h₂₁ : ({3, 4} : Finset Element) ≠ {1} := Ne.symm h₁₂
  have hw (x : Finset Element) :
      unrestrictedWitness x =
        (if x = {0, 2} then (3 / 10 : ℝ) else 0) +
          (if x = {1} then (7 / 20 : ℝ) else 0) +
            (if x = {3, 4} then (7 / 20 : ℝ) else 0) := by
    by_cases h₀ : x = {0, 2}
    · subst x
      simp [unrestrictedWitness, h₀₁, h₀₂]
    by_cases h₁ : x = {1}
    · subst x
      simp [unrestrictedWitness, h₁₀, h₁₂]
    by_cases h₂ : x = {3, 4}
    · subst x
      simp [unrestrictedWitness, h₂₀, h₂₁]
    simp [unrestrictedWitness, h₀, h₁, h₂]
  simp only [expectedCoverage]
  simp_rw [hw, add_mul]
  rw [Finset.sum_add_distrib, Finset.sum_add_distrib]
  have hcard₄ : ({2, 0, 1, 3} : Finset Feature).card = 4 := by decide
  have hcard₂ : ({2, 3} : Finset Feature).card = 2 := by decide
  simp [Finset.sum_ite_eq', coverage, elementFeatures, Fin.ext_iff, hcard₄, hcard₂]
  field
