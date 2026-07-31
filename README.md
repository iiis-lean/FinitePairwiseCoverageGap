<!-- BEGIN Lean Constellation: project-summary -->
<h1><img src="docs/lean-constellation/assets/lean-constellation-mark.svg" alt="Lean Constellation mark" width="42" align="absmiddle"> Finite Pairwise-Independent Coverage Gap</h1>

![status: proved](https://img.shields.io/static/v1?label=status&message=proved&color=0f8f88&style=flat-square) ![Lean: 4.32.0](https://img.shields.io/static/v1?label=Lean&message=4.32.0&color=6b4fbb&style=flat-square) [![source: arXiv 2606.19663](https://img.shields.io/static/v1?label=source&message=arXiv+2606.19663&color=b31b1b&style=flat-square)](https://arxiv.org/abs/2606.19663) [![LC: Lean Constellation](https://img.shields.io/static/v1?label=LC&message=Lean+Constellation&color=092745&style=flat-square)](https://github.com/iiis-lean/lean-constellation) [![MCP: Lean Toolkit](https://img.shields.io/static/v1?label=MCP&message=Lean+Toolkit&color=e45132&style=flat-square)](https://github.com/iiis-lean/lean-mcp-toolkit)

A Lean 4 formalization of an explicit finite coverage-function counterexample: the unrestricted optimum is 4, while every pairwise-independent feasible distribution has expected coverage at most 479/160.

## Project status

| Property | Value |
| --- | --- |
| Completion | `graph_proved` |
| Proof availability | `proved` |

## Build

```sh
lake build
```

## Public API

This repository exports **18 public declarations** across **4 nodes**.

Browse the [Public API index](docs/lean-constellation/PUBLIC_API.md) for the dependency graph, declaration index, final Lean code, dependencies, and sources.

## About this formalization

This repository contains an independent Lean 4 formalization of the explicit finite coverage-function counterexample and certificates from:

> Arjun Ramachandra and Karthik Natarajan,
> *Counterexample to a conjecture on the pairwise independent correlation gap using AI*,
> arXiv:2606.19663v1 [math.OC], 2026.
> <https://arxiv.org/abs/2606.19663>

The original mathematical results and proof are due to Arjun Ramachandra and Karthik Natarajan. The Lean formalization was produced by IIIS Lean using Lean Constellation. It is not presented as work by, or endorsed by, the original authors unless explicitly stated otherwise.

The article source retained under `.lean_constellation/source/article/` is derived from the arXiv TeX source for version 1. It was reorganized into a focused SourceCorpus containing the definitions, explicit instance, primal witness, and dual certificate needed for this formalization; this reorganization and the added Lean target do not claim authorship of the original mathematical content.

## Citation

If you use the mathematical result, cite the original paper:

```bibtex
@article{RamachandraNatarajan2026PairwiseIndependentGap,
  author        = {Arjun Ramachandra and Karthik Natarajan},
  title         = {Counterexample to a conjecture on the pairwise independent correlation gap using {AI}},
  journal       = {arXiv preprint},
  year          = {2026},
  eprint        = {2606.19663},
  archivePrefix = {arXiv},
  primaryClass  = {math.OC},
  doi           = {10.48550/arXiv.2606.19663},
  url           = {https://arxiv.org/abs/2606.19663}
}
```

If you use the Lean implementation, cite this repository in addition to the paper. Machine-readable citation metadata is available in [`CITATION.cff`](CITATION.cff).

## Licensing

- Lean source code, generated Lean Constellation metadata, and repository documentation outside the article SourceCorpus are licensed under the Apache License 2.0; see [`LICENSE`](LICENSE).
- The reproduced and reorganized article source under `.lean_constellation/source/article/` remains attributed to Arjun Ramachandra and Karthik Natarajan and is distributed under Creative Commons Attribution 4.0; see [`LICENSES/CC-BY-4.0.md`](LICENSES/CC-BY-4.0.md).

No repository license changes the authorship or attribution of the original paper.

<p align="center">
  <img src="docs/lean-constellation/assets/lean-constellation-mark.svg" alt="Lean Constellation" width="72">
  <br>
  <sub>Generated with <strong>Lean Constellation</strong></sub>
</p>
<!-- END Lean Constellation: project-summary -->
