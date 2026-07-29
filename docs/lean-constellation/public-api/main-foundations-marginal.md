[← Public API index](../PUBLIC_API.md)

# `marginal`

Prescribed rational singleton marginal vector.

- Kind: `definition`
- Node: `Main.Foundations`
- Module: `FinitePairwiseCoverageGap.Main.Foundations.Defs.marginal`
- State: `declared`
- Revision status: `committed`
- Repository completion: `graph_proved`
- Formal code: final statement projection

## Lean code

```lean
-- lean-constellation: managed-imports-begin
import FinitePairwiseCoverageGap.Main.Foundations.Prelude
import FinitePairwiseCoverageGap.Main.Foundations.Defs.Element
-- lean-constellation: managed-imports-end

-- lean-constellation: declaration-source-begin

/--
# lean-constellation target: `marginal`

Define `marginal : Element → ℝ` by zero-based cases, with values `(3/10, 7/20, 3/10, 7/20, 7/20)` at
elements `0, 1, 2, 3, 4`, respectively.

## Sources

- Source `formal_target.lean`, lines 21–26

## Statement dependencies

- `Main.Foundations::Element` → `Element` from
  `FinitePairwiseCoverageGap.Main.Foundations.Defs.Element`
-/
noncomputable def marginal : Element → ℝ
  | 0 => 3 / 10
  | 1 => 7 / 20
  | 2 => 3 / 10
  | 3 => 7 / 20
  | 4 => 7 / 20
```

## Statement dependencies

- `current repo:Main.Foundations.Element`

## Sources

- `formal_target.lean:21-26`
