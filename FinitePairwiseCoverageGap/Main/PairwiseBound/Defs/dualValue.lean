-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.PairwiseBound.Prelude
import FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualConstant
import FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualPairCoeff
import FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualSingletonCoeff
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `dualValue`

For every `S : Finset Element`, `dualValue S` is the left-hand side λ(S) of the pairwise dual
constraint: `dualConstant` plus the sum of `dualSingletonCoeff i` over `i ∈ S`, plus the sum of
`dualPairCoeff i j` over exactly those ordered pairs `i, j ∈ S` with `i < j`.

## Sources

- Source `article/sections/02_counterexample.tex`, lines 46–58

## Statement dependencies

- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
- `Main.PairwiseBound::dualConstant` → `dualConstant` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualConstant`
- `Main.PairwiseBound::dualPairCoeff` → `dualPairCoeff` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualPairCoeff`
- `Main.PairwiseBound::dualSingletonCoeff` → `dualSingletonCoeff` from
  `FinitePairwiseCoverageGap.Main.PairwiseBound.Defs.dualSingletonCoeff`
-/
noncomputable def dualValue (S : Finset Element) : ℝ :=
  dualConstant +
    (∑ i ∈ S, dualSingletonCoeff i) +
      ∑ i ∈ S, ∑ j ∈ S, if i < j then dualPairCoeff i j else 0
