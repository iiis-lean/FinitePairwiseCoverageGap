[← Public API](../PUBLIC_API.md) · [Public boundaries](../PUBLIC_BOUNDARIES.md) · [Complete graph](../DECLARATION_GRAPH.md)

# `unrestricted_optimum_four`

The unrestricted optimum for the prescribed marginal vector is exactly four.

- Kind: `theorem`
- Node: `Main.UnrestrictedOptimum`
- Module: `FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Theorems.unrestricted_optimum_four`
- State: `proved`
- Revision status: `committed`
- Repository completion: `graph_proved`
- Compatibility `formal_code`: final proof projection

## Statement NL

Theorem `unrestricted_optimum_four` states exactly `IsUnrestrictedOptimum 4`.  It asserts both that some `θ : Weight` is marginal-feasible and has `expectedCoverage θ = 4`, and that every `θ : Weight` satisfying `MarginalFeasible θ` has `expectedCoverage θ ≤ 4`; no additional assumptions are imposed.

## Statement Formal

```lean
-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Prelude
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `unrestricted_optimum_four`

Theorem `unrestricted_optimum_four` states exactly `IsUnrestrictedOptimum 4`.  It asserts both that
some `θ : Weight` is marginal-feasible and has `expectedCoverage θ = 4`, and that every `θ : Weight`
satisfying `MarginalFeasible θ` has `expectedCoverage θ ≤ 4`; no additional assumptions are imposed.

## Sources

- Source `article/sections/02_counterexample.tex`, lines 37–42

## Statement dependencies

- `Main.Foundations::IsUnrestrictedOptimum` → `IsUnrestrictedOptimum` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.IsUnrestrictedOptimum`
-/
theorem unrestricted_optimum_four : IsUnrestrictedOptimum 4 := by
  sorry
```

## Proof NL

Unfold `IsUnrestrictedOptimum` and construct its two required conjuncts without adding assumptions.

For attainment, choose `unrestrictedWitness`.  The already proved theorem `unrestrictedWitness_feasible` supplies `MarginalFeasible unrestrictedWitness`, and the already proved theorem `unrestrictedWitness_value` supplies `expectedCoverage unrestrictedWitness = 4`.

For the universal conjunct, introduce arbitrary `θ : Weight` and `hθ : MarginalFeasible θ`.  Unpack `hθ` into the all-set nonnegativity fact `h_nonneg : ∀ s, 0 ≤ θ s`, the total-mass equation `h_mass : (∑ s, θ s) = 1`, and the remaining marginal component (which is not needed for this upper bound).  Unfold `expectedCoverage`.  For every `s : Finset Element`, apply the proved universal bound `coverage_le_four s : coverage s ≤ 4` and multiply it on the left by the nonnegative factor `θ s` via `mul_le_mul_of_nonneg_left`.  Lift these termwise inequalities with `Finset.sum_le_sum`.

The resulting right-hand finite sum is `∑ s, θ s * 4`.  Rewrite it as `(∑ s, θ s) * 4` using `Finset.sum_mul`, substitute `h_mass`, and normalize to `4`.  This proves `expectedCoverage θ ≤ 4` for the original arbitrary marginal-feasible weight, preserving the exact quantifier and conclusion direction.

## Proof Formal

```lean
-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Prelude
import FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Defs.unrestrictedWitness
import FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Theorems.coverage_le_four
import FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Theorems.unrestrictedWitness_feasible
import FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Theorems.unrestrictedWitness_value
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Algebra.Order.GroupWithZero.Defs
import Mathlib.Tactic.NormNum.Core
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `unrestricted_optimum_four`

Theorem `unrestricted_optimum_four` states exactly `IsUnrestrictedOptimum 4`.  It asserts both that
some `θ : Weight` is marginal-feasible and has `expectedCoverage θ = 4`, and that every `θ : Weight`
satisfying `MarginalFeasible θ` has `expectedCoverage θ ≤ 4`; no additional assumptions are imposed.

## Sources

- Source `article/sections/02_counterexample.tex`, lines 37–42

## Statement dependencies

- `Main.Foundations::IsUnrestrictedOptimum` → `IsUnrestrictedOptimum` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.IsUnrestrictedOptimum`

## Proof outline

Unfold `IsUnrestrictedOptimum` and construct its two required conjuncts without adding assumptions.

For attainment, choose `unrestrictedWitness`.  The already proved theorem
`unrestrictedWitness_feasible` supplies `MarginalFeasible unrestrictedWitness`, and the already
proved theorem `unrestrictedWitness_value` supplies `expectedCoverage unrestrictedWitness = 4`.

For the universal conjunct, introduce arbitrary `θ : Weight` and `hθ : MarginalFeasible θ`.  Unpack
`hθ` into the all-set nonnegativity fact `h_nonneg : ∀ s, 0 ≤ θ s`, the total-mass equation `h_mass
: (∑ s, θ s) = 1`, and the remaining marginal component (which is not needed for this upper bound).
Unfold `expectedCoverage`.  For every `s : Finset Element`, apply the proved universal bound
`coverage_le_four s : coverage s ≤ 4` and multiply it on the left by the nonnegative factor `θ s`
via `mul_le_mul_of_nonneg_left`.  Lift these termwise inequalities with `Finset.sum_le_sum`.

The resulting right-hand finite sum is `∑ s, θ s * 4`.  Rewrite it as `(∑ s, θ s) * 4` using
`Finset.sum_mul`, substitute `h_mass`, and normalize to `4`.  This proves `expectedCoverage θ ≤ 4`
for the original arbitrary marginal-feasible weight, preserving the exact quantifier and conclusion
direction.

## Proof sources

- Source `article/sections/02_counterexample.tex`, lines 37–42

## Proof dependencies

- `Finset.sum_mul` from `Mathlib.Algebra.BigOperators.Ring.Finset`
- `Finset.sum_le_sum` from `Mathlib.Algebra.Order.BigOperators.Group.Finset`
- `mul_le_mul_of_nonneg_left` from `Mathlib.Algebra.Order.GroupWithZero.Defs`
- `Mathlib.Tactic.normNum` from `Mathlib.Tactic.NormNum.Core`
- `Main.Foundations::IsUnrestrictedOptimum` → `IsUnrestrictedOptimum` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.IsUnrestrictedOptimum`
- `Main.Foundations::MarginalFeasible` → `MarginalFeasible` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.MarginalFeasible`
- `Main.Foundations::expectedCoverage` → `expectedCoverage` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.expectedCoverage`
- `Main.UnrestrictedOptimum::coverage_le_four` → `coverage_le_four` from
  `FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Theorems.coverage_le_four`
- `Main.UnrestrictedOptimum::unrestrictedWitness` → `unrestrictedWitness` from
  `FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Defs.unrestrictedWitness`
- `Main.UnrestrictedOptimum::unrestrictedWitness_feasible` → `unrestrictedWitness_feasible` from
  `FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Theorems.unrestrictedWitness_feasible`
- `Main.UnrestrictedOptimum::unrestrictedWitness_value` → `unrestrictedWitness_value` from
  `FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Theorems.unrestrictedWitness_value`
-/
theorem unrestricted_optimum_four : IsUnrestrictedOptimum 4 := by
  unfold IsUnrestrictedOptimum
  constructor
  · exact ⟨unrestrictedWitness, unrestrictedWitness_feasible, unrestrictedWitness_value⟩
  · intro θ hθ
    rcases hθ with ⟨h_nonneg, h_mass, _⟩
    unfold expectedCoverage
    calc
      ∑ s : Finset Element, θ s * coverage s ≤ ∑ s : Finset Element, θ s * 4 :=
        Finset.sum_le_sum fun s _ ↦
          mul_le_mul_of_nonneg_left (coverage_le_four s) (h_nonneg s)
      _ = (∑ s : Finset Element, θ s) * 4 := by rw [Finset.sum_mul]
      _ = 4 := by rw [h_mass]; norm_num
```

## Statement dependencies

- `current repo:Main.Foundations.IsUnrestrictedOptimum`

## Proof dependencies

- `Mathlib:Mathlib.Algebra.BigOperators.Ring.Finset.Finset.sum_mul`
- `Mathlib:Mathlib.Algebra.Order.BigOperators.Group.Finset.Finset.sum_le_sum`
- `Mathlib:Mathlib.Algebra.Order.GroupWithZero.Defs.mul_le_mul_of_nonneg_left`
- `Mathlib:Mathlib.Tactic.NormNum.Core.Mathlib.Tactic.normNum`
- `current repo:Main.Foundations.IsUnrestrictedOptimum`
- `current repo:Main.Foundations.MarginalFeasible`
- `current repo:Main.Foundations.expectedCoverage`
- `current repo:Main.UnrestrictedOptimum.coverage_le_four`
- `current repo:Main.UnrestrictedOptimum.unrestrictedWitness`
- `current repo:Main.UnrestrictedOptimum.unrestrictedWitness_feasible`
- `current repo:Main.UnrestrictedOptimum.unrestrictedWitness_value`

## Sources

- `article/sections/02_counterexample.tex:37-42`
