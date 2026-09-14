[← Public API](../PUBLIC_API.md) · [Public boundaries](../PUBLIC_BOUNDARIES.md) · [Complete graph](../DECLARATION_GRAPH.md)

# `expectedCoverage_le_weightedDual`

Weighted pointwise dual majorization for every pairwise-feasible weight.

- Kind: `theorem`
- Node: `Main.PairwiseBound`
- Module: `FinitePairwiseCoverageGap.Main.PairwiseBound.Theorems.expectedCoverage_le_weightedDual`
- State: `proved`
- Revision status: `committed`
- Repository completion: `graph_proved`
- Compatibility `formal_code`: final proof projection

## Statement NL

For every `θ : Weight`, if `PairwiseFeasible θ`, then `expectedCoverage θ ≤ ∑ S : Finset Element, θ S * dualValue S`.  The sum ranges over the full `Finset Element` domain; the statement imposes no support restriction and does not replace the inequality with an equality.

## Statement Formal

```lean
-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.PairwiseBound.Prelude
import FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualValue
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `expectedCoverage_le_weightedDual`

For every `θ : Weight`, if `PairwiseFeasible θ`, then `expectedCoverage θ ≤ ∑ S : Finset Element, θ
S * dualValue S`.  The sum ranges over the full `Finset Element` domain; the statement imposes no
support restriction and does not replace the inequality with an equality.

## Sources

- Source `article/sections/02_counterexample.tex`, lines 110–112

## Statement dependencies

- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
- `Main.Foundations::PairwiseFeasible` → `PairwiseFeasible` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.PairwiseFeasible`
- `Main.Foundations::Weight` → `Weight` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Weight`
- `Main.Foundations::expectedCoverage` → `expectedCoverage` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.expectedCoverage`
- `Main.PairwiseBound::dualValue` → `dualValue` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualValue`
-/
theorem expectedCoverage_le_weightedDual (θ : Weight) (hθ : PairwiseFeasible θ) :
    expectedCoverage θ ≤ ∑ S : Finset Element, θ S * dualValue S := by
  sorry
```

## Proof NL

Fix an arbitrary `θ : Weight` and `hθ : PairwiseFeasible θ`.  Unfold `expectedCoverage`, so the left side is the full finite sum `∑ S : Finset Element, θ S * coverage S`.  Use only the nonnegativity component of feasibility, namely `hθ.1.1 S : 0 ≤ θ S`; no mass or moment equality is used here.

For each `S` in the full `Finset Element` domain, apply the already proved unrestricted theorem `coverage_le_dualValue S` and multiply it on the left by the nonnegative real `θ S` using `mul_le_mul_of_nonneg_left`.  This gives `θ S * coverage S ≤ θ S * dualValue S` for every subset, including the empty subset and every subset outside any prospective support.  Apply `Finset.sum_le_sum` to these termwise inequalities and fold the left sum back to `expectedCoverage θ`.  The resulting right sum is exactly `∑ S : Finset Element, θ S * dualValue S`, establishing the requested inequality without an equality shortcut or a restriction on `θ`.

## Proof Formal

```lean
-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.PairwiseBound.Prelude
import FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualValue
import FinitePairwiseCoverageGap.Main.PairwiseBound.Theorems.coverage_le_dualValue
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Algebra.Order.GroupWithZero.Defs
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `expectedCoverage_le_weightedDual`

For every `θ : Weight`, if `PairwiseFeasible θ`, then `expectedCoverage θ ≤ ∑ S : Finset Element, θ
S * dualValue S`.  The sum ranges over the full `Finset Element` domain; the statement imposes no
support restriction and does not replace the inequality with an equality.

## Sources

- Source `article/sections/02_counterexample.tex`, lines 110–112

## Statement dependencies

- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
- `Main.Foundations::PairwiseFeasible` → `PairwiseFeasible` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.PairwiseFeasible`
- `Main.Foundations::Weight` → `Weight` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Weight`
- `Main.Foundations::expectedCoverage` → `expectedCoverage` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.expectedCoverage`
- `Main.PairwiseBound::dualValue` → `dualValue` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualValue`

## Proof outline

Fix an arbitrary `θ : Weight` and `hθ : PairwiseFeasible θ`.  Unfold `expectedCoverage`, so the left
side is the full finite sum `∑ S : Finset Element, θ S * coverage S`.  Use only the nonnegativity
component of feasibility, namely `hθ.1.1 S : 0 ≤ θ S`; no mass or moment equality is used here.

For each `S` in the full `Finset Element` domain, apply the already proved unrestricted theorem
`coverage_le_dualValue S` and multiply it on the left by the nonnegative real `θ S` using
`mul_le_mul_of_nonneg_left`.  This gives `θ S * coverage S ≤ θ S * dualValue S` for every subset,
including the empty subset and every subset outside any prospective support.  Apply
`Finset.sum_le_sum` to these termwise inequalities and fold the left sum back to `expectedCoverage
θ`.  The resulting right sum is exactly `∑ S : Finset Element, θ S * dualValue S`, establishing the
requested inequality without an equality shortcut or a restriction on `θ`.

## Proof sources

- Source `article/sections/02_counterexample.tex`, lines 110–112

## Proof dependencies

- `Finset.sum_le_sum` from `Mathlib.Algebra.Order.BigOperators.Group.Finset`
- `mul_le_mul_of_nonneg_left` from `Mathlib.Algebra.Order.GroupWithZero.Defs`
- `Main.Foundations::PairwiseFeasible` → `PairwiseFeasible` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.PairwiseFeasible`
- `Main.Foundations::expectedCoverage` → `expectedCoverage` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.expectedCoverage`
- `Main.PairwiseBound::coverage_le_dualValue` → `coverage_le_dualValue` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Theorems.coverage_le_dualValue`
- `Main.PairwiseBound::dualValue` → `dualValue` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualValue`
-/
theorem expectedCoverage_le_weightedDual (θ : Weight) (hθ : PairwiseFeasible θ) :
    expectedCoverage θ ≤ ∑ S : Finset Element, θ S * dualValue S := by
  unfold expectedCoverage
  apply Finset.sum_le_sum
  intro S _
  exact mul_le_mul_of_nonneg_left (coverage_le_dualValue S) (hθ.1.1 S)
```

## Statement dependencies

- `current repo:Main.Foundations.Element`
- `current repo:Main.Foundations.PairwiseFeasible`
- `current repo:Main.Foundations.Weight`
- `current repo:Main.Foundations.expectedCoverage`
- `current repo:Main.PairwiseBound.dualValue`

## Proof dependencies

- `Mathlib:Mathlib.Algebra.Order.BigOperators.Group.Finset.Finset.sum_le_sum`
- `Mathlib:Mathlib.Algebra.Order.GroupWithZero.Defs.mul_le_mul_of_nonneg_left`
- `current repo:Main.Foundations.PairwiseFeasible`
- `current repo:Main.Foundations.expectedCoverage`
- `current repo:Main.PairwiseBound.coverage_le_dualValue`
- `current repo:Main.PairwiseBound.dualValue`

## Sources

- `article/sections/02_counterexample.tex:110-112`
