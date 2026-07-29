[← Public API index](../PUBLIC_API.md)

# `coverage`

Real-valued cardinality of the union of selected feature sets.

- Kind: `definition`
- Node: `Main.Foundations`
- Module: `FinitePairwiseCoverageGap.Main.Foundations.Defs.coverage`
- State: `declared`
- Revision status: `committed`
- Repository completion: `graph_proved`
- Formal code: final statement projection

## Lean code

```lean
-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.Foundations.Prelude
import FinitePairwiseCoverageGap.Main.Foundations.Defs.Element
import FinitePairwiseCoverageGap.Main.Foundations.Defs.elementFeatures
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `coverage`

Define `coverage (s : Finset Element) : ℝ` as the real-valued cardinality `((s.biUnion
elementFeatures).card : ℝ)` of the union of the feature sets assigned to the elements of `s`, with
no normalization or alternative representation.

## Sources

- Source `formal_target.lean`, lines 17–19

## Statement dependencies

- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
- `Main.Foundations::elementFeatures` → `elementFeatures` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.elementFeatures`
-/
def coverage (s : Finset Element) : ℝ :=
  ((s.biUnion elementFeatures).card : ℝ)
```

## Statement dependencies

- `current repo:Main.Foundations.Element`
- `current repo:Main.Foundations.elementFeatures`

## Sources

- `formal_target.lean:17-19`
