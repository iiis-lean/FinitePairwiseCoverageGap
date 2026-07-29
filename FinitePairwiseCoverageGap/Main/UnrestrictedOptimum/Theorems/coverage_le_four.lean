-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.UnrestrictedOptimum.Prelude
import Mathlib.Data.Finset.Card
import Mathlib.Data.Fintype.Card
import Mathlib.Data.Fintype.Defs
import Mathlib.Data.Nat.Cast.Order.Basic
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `coverage_le_four`

Theorem `coverage_le_four` states the universal real inequality `∀ s : Finset Element, coverage s ≤
4`.  It has no feasibility or distribution assumption: every finite subset of the five-element
ground type has coverage at most `4`.

## Sources

- Source `article/sections/02_counterexample.tex`, lines 38–41

## Statement dependencies

- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
- `Main.Foundations::coverage` → `coverage` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.coverage`

## Proof outline

Introduce an arbitrary `s : Finset Element`; no feasibility or distribution hypothesis is
introduced.  Unfold `coverage`, so the goal is a real-cardinality bound for `s.biUnion
elementFeatures`.

Apply `Finset.card_mono` to the universal inclusion `Finset.subset_univ (s.biUnion
elementFeatures)`.  This bounds the feature union by `(Finset.univ : Finset Feature)`.  Coerce the
resulting natural-number inequality to `ℝ` using `Nat.cast_le`.  Finally use `Finset.card_univ` and
the accepted definition `Feature = Fin 4` to normalize the cardinality of the feature universe to
`4`.

Thus `coverage s ≤ 4` holds for the original arbitrary finite subset.  The proof is a direct
universal cardinality argument (rather than a feasibility argument), matching the source claim that
no coverage value can exceed four.

## Proof sources

- Source `article/sections/02_counterexample.tex`, lines 38–41

## Proof dependencies

- `Finset.card_mono` from `Mathlib.Data.Finset.Card`
- `Finset.card_univ` from `Mathlib.Data.Fintype.Card`
- `Finset.subset_univ` from `Mathlib.Data.Fintype.Defs`
- `Nat.cast_le` from `Mathlib.Data.Nat.Cast.Order.Basic`
- `Main.Foundations::Feature` → `Feature` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Feature`
- `Main.Foundations::coverage` → `coverage` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.coverage`
-/
theorem coverage_le_four : ∀ s : Finset Element, coverage s ≤ 4 := by
  intro s
  unfold coverage
  have h := Finset.card_mono (Finset.subset_univ (s.biUnion elementFeatures))
  norm_num [Finset.card_univ] at h ⊢
  exact_mod_cast h
