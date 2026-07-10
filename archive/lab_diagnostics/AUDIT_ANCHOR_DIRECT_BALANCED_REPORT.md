# Anchor direct-balanced audit

This is an audit report only.  Nothing here is promoted to the main route, and
no sampled number is a Lean certificate.

The active proof discipline remains genuine-first.  The Python diagnostics use
the existing diagnostic channel evaluation only as laboratory data; it is not
an input to near-axis, middle, or global gluing.

## Lean Status

Compiled target:

```text
lake env lean LeanC2/AuditContinuedQuartetAnchor.lean
```

The file compiles and provides:

```lean
anchor_eq_tau_sub_continuedCentral
anchor_eq_tau_mul_one_sub_two_oddChannel
anchor_norm_eq_tau_norm_mul_factor
AnchorUpperData
vSplitQRatio_quartetDominance_of_upperData
vSplitQRatio_sectorResidualDominance_of_upperData
vSplitQRatio_truePrefixResidualDominance_of_sectorUpperData
vSplitDirectBalancedLedgerQRatio
VSplitDirectBalancedSectorAuditDominance
vSplitDirectBalanced_sectorAuditDominance_of_upperData
vSplitDirectBalanced_truePrefixAuditDominance_of_upperData
```

`AnchorUpperData` now packages the three conditional fields:

```lean
anchor_bound
cut_bound
sector_lower
```

The direct-balanced ledger is explicitly audit-only.  It does not produce
`C2ExpandedQuartetDominance`; it only records the diagnostic inequality that
would need a separate residual-control theorem before becoming route material.

## Subbox Scanner

Created:

```text
audit_anchor_subbox_ledger_scanner.py
audit_anchor_subbox_ledger_points.csv
audit_anchor_subbox_ledger_boxes.csv
audit_anchor_subbox_ledger_summary.json
AUDIT_ANCHOR_SUBBOX_LEDGER_REPORT.md
```

Run:

```text
sigma=[0.84,0.92]
t=[32.75,33.0]
N=25,50
K=3..5
M=25,50,100
```

plus the early and late failure boxes.

## Main Numerical Reading

With 4x4 subboxes and sampled local box uppers:

| box | current/Qsector | direct/Qsector | max anchor | max cut |
| --- | --- | --- | --- | --- |
| positive pocket | 5149/7200 | 7200/7200 | 0.0216104827485 | 0.0099512469601 |
| early anchor fail | 0/7200 | 0/7200 | 0.0769677354892 | 0.0138546141739 |
| late anchor fail | 0/7200 | 0/7200 | 0.165821088224 | 0.0228211747843 |

The positive pocket is promising after subdivision.  The current q-ratio ledger
passes many subbox samples, and the direct-balanced audit ledger passes all
sampled subbox rows.

The bad boxes are not close under triangle-style `anchorUpper`.  Even the
direct-balanced audit ledger fails everywhere sampled.

## Answers

1. Positive pocket formalizability:

The positive pocket looks locally promising, but not as one coarse box with the
current q-ratio ledger.  Subboxes make the current ledger pass many rows, and
the direct-balanced ledger passes all sampled rows.  A Lean attempt should start
with the smallest positive-pocket subboxes where `current_closes_subbox` already
has positive slack.

2. Bad boxes:

The early and late boxes require structural anchor work.  Subdivision alone did
not make a triangular `anchorUpper` close.  The obstruction is the growth of the
factor in:

```text
anchor = verticalDepthTailFromTwo * (1 - 2 * continuedOddDirichletChannel)
```

3. Resolvent tax:

In the positive pocket, the difference between current and direct-balanced is
the main remaining tax.  In the bad boxes, the anchor itself is already too
large at the margin scale.

4. Next Lean work:

Keep the route audit-only and add no main-route dependency.  The next useful
lemmas are conditional region lemmas for small subboxes:

```text
anchor_bound on a subbox
cut_bound on a subbox
sector_lower on the same subbox
```

Then test them through the already compiled
`vSplitQRatio_sectorResidualDominance_of_upperData`.  Direct-balanced should
remain an audit predicate until a genuine residual-control theorem exists.
