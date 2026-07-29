-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.PairwiseBound.Prelude
import FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualConstant
import FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualPairCoeff
import FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualSingletonCoeff
import FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualValue
import Mathlib.Data.Finset.Defs
import Mathlib.Data.Finset.Powerset
import Mathlib.Data.Fintype.Powerset
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.NormNum.Core
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `coverage_le_dualValue`

For every `S : Finset Element`, `coverage S ≤ dualValue S`.  This universal pointwise inequality
applies to the empty set and every other subset of `Element`, with no support, nonemptiness, sign,
or feasibility assumption on `S`.

## Sources

- Source `article/sections/02_counterexample.tex`, lines 46–58
- Source `article/sections/02_counterexample.tex`, lines 70–108

## Statement dependencies

- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
- `Main.Foundations::coverage` → `coverage` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.coverage`
- `Main.PairwiseBound::dualValue` → `dualValue` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualValue`

## Proof outline

Work with the original arbitrary `S : Finset Element`; introduce no support, nonemptiness, sign, or
feasibility hypothesis.  The exhaustive domain is `(Finset.univ : Finset Element).powerset`:
discharge the final membership obligation with `Finset.mem_powerset.mpr (by simp)`, and rewrite that
container by `Finset.powerset_univ`.  Thus the route covers every finset on `Element = Fin 5`,
matching the 32 rows of SourceIndex block `b_0016`, rather than a restricted family.

Use the verified `Mathlib.Tactic.FinCases` tactic as the actual finite case-elimination step.  The
Proof Formal skeleton is:
```lean
  classical
  suffices h_all :
      ∀ T ∈ (Finset.univ : Finset Element).powerset,
        coverage T ≤ dualValue T by
    exact h_all S (Finset.mem_powerset.mpr (by simp))
  rw [Finset.powerset_univ]
  intro T _
  fin_cases T <;>
    simp [coverage, elementFeatures, dualValue, dualConstant,
      dualSingletonCoeff, dualPairCoeff] <;>
    norm_num
```
Here `fin_cases T` is the concrete operation that generates the 32 goals for all finsets of `Fin 5`;
after it, the displayed `simp` list unfolds the coverage data and all accepted dual-coefficient
definitions, evaluates finite membership and `i < j` tests, and reduces the singleton/ordered-pair
sums.  `norm_num` checks each resulting exact rational inequality; use `ring_nf` on an individual
residual goal only if normalization leaves a polynomial rational expression.  The coefficient
computations are those of `b_0014` / source lines 61–67, and the resulting empty, singleton, pair,
triple, four-element, and full-set inequalities are exactly source lines 70–108.  Therefore the
conclusion is `coverage S ≤ dualValue S` for the original unrestricted `S`.

## Proof sources

- Source `article/sections/02_counterexample.tex`, lines 44–70
- Source `article/sections/02_counterexample.tex`, lines 70–108

## Proof dependencies

- `Finset.ext_iff` from `Mathlib.Data.Finset.Defs`
- `Finset.mem_powerset` from `Mathlib.Data.Finset.Powerset`
- `Finset.powerset` from `Mathlib.Data.Finset.Powerset`
- `Finset.powerset_univ` from `Mathlib.Data.Fintype.Powerset`
- `Lean.Elab.Tactic.finCases` from `Mathlib.Tactic.FinCases`
- `Mathlib.Tactic.normNum` from `Mathlib.Tactic.NormNum.Core`
- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
- `Main.Foundations::coverage` → `coverage` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.coverage`
- `Main.Foundations::elementFeatures` → `elementFeatures` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.elementFeatures`
- `Main.PairwiseBound::dualConstant` → `dualConstant` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualConstant`
- `Main.PairwiseBound::dualPairCoeff` → `dualPairCoeff` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualPairCoeff`
- `Main.PairwiseBound::dualSingletonCoeff` → `dualSingletonCoeff` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualSingletonCoeff`
- `Main.PairwiseBound::dualValue` → `dualValue` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualValue`
-/
theorem coverage_le_dualValue (S : Finset Element) : coverage S ≤ dualValue S := by
  classical
  suffices h_all :
      ∀ T ∈ (Finset.univ : Finset Element).powerset,
        coverage T ≤ dualValue T by
    exact h_all S (Finset.mem_powerset.mpr (by simp))
  rw [Finset.powerset_univ]
  intro T _
  let c : Finset Element → ℕ := fun U =>
    if U = ∅ then 0
    else if U = {0} then 2
    else if U = {2} then 2
    else if U = {3} then 2
    else if U = {4} then 2
    else if U = {0, 3} then 3
    else if U = {0, 4} then 3
    else if U = {2, 3} then 3
    else if U = {2, 4} then 3
    else 4
  have h_card (U : Finset Element) : (U.biUnion elementFeatures).card = c U := by
    fin_cases U <;> decide
  change ((T.biUnion elementFeatures).card : ℝ) ≤ dualValue T
  rw [h_card T]
  fin_cases T <;>
    simp [c, Finset.ext_iff, Fin.forall_fin_succ, dualValue, dualConstant,
      dualSingletonCoeff, dualPairCoeff] <;>
    norm_num
