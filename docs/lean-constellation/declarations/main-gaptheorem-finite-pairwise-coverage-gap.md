[← Public API](../PUBLIC_API.md) · [Public boundaries](../PUBLIC_BOUNDARIES.md)

# `finite_pairwise_coverage_gap`

Exact protected five-conjunct theorem witnessing the finite pairwise coverage gap.

- Kind: `theorem`
- Node: `Main.GapTheorem`
- Module: `FinitePairwiseCoverageGap.Main.GapTheorem.Theorems.finite_pairwise_coverage_gap`
- State: `proved`
- Revision status: `committed`
- Repository completion: `graph_proved`
- Formal code: final proof projection

## Lean code

```lean
-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.GapTheorem.Prelude
import FinitePairwiseCoverageGap.Main.GapTheorem.Theorems.strict_ratio_comparison
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

namespace FinitePairwiseCoverageGap

/--
# lean-constellation target: `finite_pairwise_coverage_gap`

The explicit finite coverage instance violates the proposed `4/3` upper bound. Precisely, the
following five conjuncts hold:

1. For all implicit `s t : Finset Element`, if `s ⊆ t`, then `coverage s ≤ coverage t`.
2. For all `s t : Finset Element`, `coverage (s ∪ t) + coverage (s ∩ t) ≤ coverage s + coverage t`.
3. `IsUnrestrictedOptimum 4`.
4. `IsPairwiseUpperBound (479 / 160)`.
5. In the real numbers, `(4 : ℝ) / (479 / 160) > 4 / 3`.

These are conjoined in exactly the displayed order, with no additional hypotheses.

## Sources

- Source `formal_target.lean`, lines 55–64
- Source `article/sections/02_counterexample.tex`, lines 126–131

## Statement dependencies

- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
- `Main.Foundations::IsPairwiseUpperBound` → `IsPairwiseUpperBound` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.IsPairwiseUpperBound`
- `Main.Foundations::IsUnrestrictedOptimum` → `IsUnrestrictedOptimum` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.IsUnrestrictedOptimum`
- `Main.Foundations::coverage` → `coverage` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.coverage`

## Proof outline

Construct the five-fold conjunction in the protected statement order. For the first conjunct,
introduce the implicit finsets `s` and `t` and the inclusion hypothesis, then apply
`coverage_monotone`. For the second conjunct, apply `coverage_submodular` directly. The third and
fourth conjuncts are exactly the proved public theorems `unrestricted_optimum_four` and
`pairwise_upper_bound_479_160`, respectively. For the final strict real-number inequality, apply the
already proved local helper `strict_ratio_comparison`.

This is a pure assembly proof: no unfolding, arithmetic normalization, new assumptions, case split,
or auxiliary declaration is required. In Proof Formal, the route should be implemented by a nested
`refine ⟨?_, ?_, ?_, ?_, ?_⟩` (or equivalent conjunction construction) followed by the five named
theorems, preserving the current accepted source-exact theorem command unchanged.

## Proof sources

- Source `article/sections/02_counterexample.tex`, lines 110–131

## Proof dependencies

- `Main.Foundations::coverage_monotone` → `coverage_monotone` from
  `FinitePairwiseCoverageGap.Main.Foundations.Theorems.coverage_monotone`
- `Main.Foundations::coverage_submodular` → `coverage_submodular` from
  `FinitePairwiseCoverageGap.Main.Foundations.Theorems.coverage_submodular`
- `Main.GapTheorem::strict_ratio_comparison` → `strict_ratio_comparison` from
  `FinitePairwiseCoverageGap.Main.GapTheorem.Theorems.strict_ratio_comparison`
- `Main.PairwiseBound::pairwise_upper_bound_479_160` → `pairwise_upper_bound_479_160` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Theorems.pairwise_upper_bound_479_160`
- `Main.UnrestrictedOptimum::unrestricted_optimum_four` → `unrestricted_optimum_four` from
  `FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Theorems.unrestricted_optimum_four`
-/
theorem finite_pairwise_coverage_gap :
    (∀ ⦃s t : Finset Element⦄, s ⊆ t → coverage s ≤ coverage t) ∧
    (∀ s t : Finset Element, coverage (s ∪ t) + coverage (s ∩ t) ≤ coverage s + coverage t) ∧
    IsUnrestrictedOptimum 4 ∧
    IsPairwiseUpperBound (479 / 160) ∧
    (4 : ℝ) / (479 / 160) > 4 / 3 := by
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · intro s t hst
    exact coverage_monotone s t hst
  · exact coverage_submodular
  · exact unrestricted_optimum_four
  · exact pairwise_upper_bound_479_160
  · exact strict_ratio_comparison

end FinitePairwiseCoverageGap
```

## Statement dependencies

- `current repo:Main.Foundations.Element`
- `current repo:Main.Foundations.IsPairwiseUpperBound`
- `current repo:Main.Foundations.IsUnrestrictedOptimum`
- `current repo:Main.Foundations.coverage`

## Proof dependencies

- `current repo:Main.Foundations.coverage_monotone`
- `current repo:Main.Foundations.coverage_submodular`
- `current repo:Main.GapTheorem.strict_ratio_comparison`
- `current repo:Main.PairwiseBound.pairwise_upper_bound_479_160`
- `current repo:Main.UnrestrictedOptimum.unrestricted_optimum_four`

## Sources

- `formal_target.lean:55-64`
- `article/sections/02_counterexample.tex:126-131`
