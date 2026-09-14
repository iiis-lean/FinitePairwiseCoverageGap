[← Public API](../PUBLIC_API.md) · [Public boundaries](../PUBLIC_BOUNDARIES.md) · [Complete graph](../DECLARATION_GRAPH.md)

# `Weight`

Arbitrary real-valued weights on all finite element subsets.

- Kind: `abbrev`
- Node: `Main.Foundations`
- Module: `FinitePairwiseCoverageGap.Main.Foundations.Defs.Weight`
- State: `declared`
- Revision status: `committed`
- Repository completion: `graph_proved`
- Compatibility `formal_code`: final statement projection

## Statement NL

Define `Weight` as the type `Finset Element → ℝ` of arbitrary real-valued functions on every finite subset of `Element`, with no nonnegativity, normalization, or feasibility restriction.

## Statement Formal

```lean
-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.Foundations.Prelude
import FinitePairwiseCoverageGap.Main.Foundations.Defs.Element
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `Weight`

Define `Weight` as the type `Finset Element → ℝ` of arbitrary real-valued functions on every finite
subset of `Element`, with no nonnegativity, normalization, or feasibility restriction.

## Sources

- Source `formal_target.lean`, line 7

## Statement dependencies

- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
-/
abbrev Weight := Finset Element → ℝ
```

## Proof NL

Not recorded.

## Proof Formal

Not recorded.

## Statement dependencies

- `current repo:Main.Foundations.Element`

## Sources

- `formal_target.lean:7-7`
