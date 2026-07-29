[← Public API index](../PUBLIC_API.md)

# `pairwise_upper_bound_479_160`

The pairwise-feasible domain is nonempty and all feasible weights have expected coverage at most 479/160.

- Kind: `theorem`
- Node: `Main.PairwiseBound`
- Module: `FinitePairwiseCoverageGap.Main.PairwiseBound.Theorems.pairwise_upper_bound_479_160`
- State: `proved`
- Revision status: `committed`
- Repository completion: `graph_proved`
- Formal code: final proof projection

## Lean code

```lean
-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.PairwiseBound.Prelude
import FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.independentWeight
import FinitePairwiseCoverageGap.Main.PairwiseBound.Theorems.expectedCoverage_le_weightedDual
import FinitePairwiseCoverageGap.Main.PairwiseBound.Theorems.independentWeight_pairwiseFeasible
import FinitePairwiseCoverageGap.Main.PairwiseBound.Theorems.weightedDual_eq_479_160
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `pairwise_upper_bound_479_160`

`pairwise_upper_bound_479_160` states exactly `IsPairwiseUpperBound (479 / 160)`: there exists a
`Weight` that is `PairwiseFeasible`, and every `θ : Weight` satisfying `PairwiseFeasible θ` has
`expectedCoverage θ ≤ 479 / 160`.  It asserts this for the full feasible domain, with the exact
rational bound and no additional assumptions or conclusions.

## Sources

- Source `formal_target.lean`, lines 50–53
- Source `article/sections/02_counterexample.tex`, lines 110–125

## Statement dependencies

- `Main.Foundations::IsPairwiseUpperBound` → `IsPairwiseUpperBound` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.IsPairwiseUpperBound`

## Proof outline

Unfold `IsPairwiseUpperBound (479 / 160)` into its two required conjuncts and prove exactly those
conjuncts.

For feasible-domain nonemptiness, choose the accepted `independentWeight : Weight` as the witness
and close `PairwiseFeasible independentWeight` with the already proved theorem
`independentWeight_pairwiseFeasible`.

For the universal conjunct, fix an arbitrary `θ : Weight` and `hθ : PairwiseFeasible θ`.  Chain the
two proved full-domain weak-duality facts:
```lean
  calc
    expectedCoverage θ ≤ ∑ S : Finset Element, θ S * dualValue S :=
      expectedCoverage_le_weightedDual θ hθ
    _ = 479 / 160 := weightedDual_eq_479_160 θ hθ
```
The first theorem uses the unrestricted pointwise dual majorization and feasibility nonnegativity;
the second evaluates the same full-domain weighted dual using the prescribed feasibility moments.
Hence the result applies to every arbitrary-real pairwise-feasible weight with the exact rational
`479 / 160`.  No support restriction, extra assumption, unrestricted-optimum claim, or final
conjunction is introduced.

## Proof sources

- Source `formal_target.lean`, lines 50–53
- Source `article/sections/02_counterexample.tex`, lines 110–125

## Proof dependencies

- `Main.Foundations::IsPairwiseUpperBound` → `IsPairwiseUpperBound` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.IsPairwiseUpperBound`
- `Main.PairwiseBound::expectedCoverage_le_weightedDual` → `expectedCoverage_le_weightedDual` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Theorems.expectedCoverage_le_weightedDual`
- `Main.PairwiseBound::independentWeight` → `independentWeight` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.independentWeight`
- `Main.PairwiseBound::independentWeight_pairwiseFeasible` → `independentWeight_pairwiseFeasible`
  from `FinitePairwiseCoverageGap.Main.PairwiseBound.Theorems.independentWeight_pairwiseFeasible`
- `Main.PairwiseBound::weightedDual_eq_479_160` → `weightedDual_eq_479_160` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Theorems.weightedDual_eq_479_160`
-/
theorem pairwise_upper_bound_479_160 : IsPairwiseUpperBound (479 / 160) := by
  refine ⟨⟨independentWeight, independentWeight_pairwiseFeasible⟩, ?_⟩
  intro θ hθ
  calc
    expectedCoverage θ ≤ ∑ S : Finset Element, θ S * dualValue S :=
      expectedCoverage_le_weightedDual θ hθ
    _ = 479 / 160 := weightedDual_eq_479_160 θ hθ
```

## Statement dependencies

- `current repo:Main.Foundations.IsPairwiseUpperBound`

## Proof dependencies

- `current repo:Main.Foundations.IsPairwiseUpperBound`
- `current repo:Main.PairwiseBound.expectedCoverage_le_weightedDual`
- `current repo:Main.PairwiseBound.independentWeight`
- `current repo:Main.PairwiseBound.independentWeight_pairwiseFeasible`
- `current repo:Main.PairwiseBound.weightedDual_eq_479_160`

## Sources

- `formal_target.lean:50-53`
- `article/sections/02_counterexample.tex:110-125`
