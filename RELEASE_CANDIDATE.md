# Git content release candidate — 2026-09-14

This candidate publishes the recovered Lean Constellation (LC) business truth and
reviewed natural-language documentation as a new Git content version. It is **not**
a newly certified LC semantic release and does not replace the existing release
`release_a10eaec4358641bea524acdf0c33717e`.

Original Git baseline: `d52ca75df74d0ddb287d626c28590a69cf023b4b`.
The candidate contains 30 active declarations: 18 Content-public declarations and
12 private declarations. All 30 Statement NL records and all 13 existing Proof NL
records are present in the structured declaration graph. The current public API,
public boundaries and complete public/private declaration graph were regenerated
from that truth. The seven-file Source Corpus is retained with its recorded hashes.

All 43 tracked Lean files are byte-identical to the baseline. They retain the older
named target-marker spelling (`# lean-constellation target: name`), which the current
projection parser does not rewrite. The structured JSON and generated publication
documents are therefore the authoritative display of the reviewed NL. This marker
format limitation is not missing source and does not affect the Lean text.

Current-schema validation and publication preparation pass. Lean/Lake compilation
was not rerun, so existing checks and proof-availability claims remain historical;
no new proof certification or dependency change is implied. Migration receipts,
archives and runtime data remain outside the repository. This preparation creates
no tag or GitHub Release.
