# Positive Box Route Alignment Audit

Date: 2026-07-01

## Scope

This audit checks whether the current positive-box files feed the existing
genuine middle route, or whether the recent abstract odd-reference files are a
parallel audit shim only.

No new operator was introduced in this pass.  The only Lean edits were route
tags in the two odd-reference audit files:

- `LeanC2/AuditContinuedQuartetPositiveBoxGenuineOdd.lean`
- `LeanC2/AuditContinuedQuartetPositiveBoxGenuineOddBridge.lean`

## Original Genuine Middle Route

The existing genuine middle route is in `LeanC2/AuditGenuineMiddle.lean`.

The core bridge is already present:

```lean
GenuineMiddleAudit.adjustedQuartetBalancedGenuineBulkModel_eq_central_of_re_pos
```

It proves that the balanced genuine bulk model is the genuine central object on
the open right half-plane.

The nonvanishing flow is:

```text
adjustedQuartetBalancedGenuineBulkConcreteRegion
  -> adjustedQuartetBalancedGenuineBulkModel coreCutoff K M s != 0
  -> genuineCentralDoubleSeries s != 0
```

Important route theorems:

- `adjustedQuartetBalancedGenuineBulkModel_ne_zero_of_mem_concreteRegion_ledger`
- `genuineCentral_ne_zero_of_mem_concreteRegion_ledger`
- `genuineCentral_ne_zero_of_localBulkData_rawBounds`
- `genuineCentral_ne_zero_of_exactVerticalResidualDominance`
- `genuineCentral_ne_zero_of_exactVerticalUpperBudgets`
- `genuineCentral_ne_zero_on_middle_of_exactVerticalUpperBudgets`

These theorems consume ordinary route inputs: horizontal layer bounds, raw
cutoff bounds, exact vertical residual budgets, and quartet dominance.  They do
not consume the new odd-reference compatibility layer.

## Positive-Box Route

The positive-box audit route currently has this conditional flow:

```text
PositiveBoxAnalyticBounds
  + PositiveBoxLedgerBounds
  -> PositiveBoxCertificate
  -> positiveBox_qratio_sectorResidualDominance
  -> positiveBox_qratio_truePrefixResidualDominance
```

The scalar ledger itself is reduced in
`LeanC2/AuditContinuedQuartetPositiveBoxInterval.lean`.

The no-oddRef ledger entry point is:

```lean
positiveBox_ledger_strict_ofQAndHorizontal
```

The raw odd-truncation entry point is:

```lean
positiveBox_ledger_strict_ofOddTruncation
```

The closest positive-box theorem that still speaks to the original route shape
without oddRef is:

```lean
positiveBox_qratio_truePrefixResidualDominance
```

It gives a true-prefix residual dominance inequality over the selected box.
However, it remains audit-only and is not yet wired into
`C2ExpandedHorizontalLayerBudget`, `C2ExpandedQuartetDominance`, or
`C2CanonicalClosedScaledLocalData`.

## Where Raw, Continued, And oddRef Enter

Raw route:

```lean
constantCoreOddTruncationNorm positiveBoxN s
  =
||rectangularOddCoreSum s positiveBoxN - oddDirichletChannel s||
```

This is the route consumed by `PositiveBoxOddTruncationData`.  Existing tail
lemmas for this channel require `1 < s.re`, so they do not apply to the
positive box.

Continued diagnostic route:

```lean
PositiveBoxContinuedOddTruncationData
```

This route is diagnostic and audit-only.  It separates the continued target from
the raw target, but it is not the active genuine-first input for the positive
box.

Abstract odd-reference route:

```lean
GenuineOddContinuationData
PositiveBoxOddRefCompatibility
PositiveBoxOddRefBridgeBounds
positiveBox_oddRef_bridge_result
```

This is an audit shim.  It shows what compatibility would be needed for an
external genuine odd reference.  It does not construct that reference and is not
consumed by the original genuine middle endpoint.

## Reverse Dependency Findings

Search result:

```text
PositiveBoxOddRefCompatibility appears only in
  LeanC2/AuditContinuedQuartetPositiveBoxGenuineOddBridge.lean

GenuineOddContinuationData appears only in
  LeanC2/AuditContinuedQuartetPositiveBoxGenuineOdd.lean
  LeanC2/AuditContinuedQuartetPositiveBoxGenuineOddBridge.lean
```

Therefore:

- no theorem in `GenuineMiddleAudit` consumes `PositiveBoxOddRefCompatibility`;
- no theorem in the original route consumes `GenuineOddContinuationData.oddRef`;
- the oddRef bridge is not necessary for the existing endpoint
  `genuineCentralDoubleSeries s != 0`;
- the bridge is a parallel audit-only guardrail, not a route input.

## File Classification

| File | Classification | Reason |
| --- | --- | --- |
| `LeanC2/AuditGenuineMiddle.lean` | ACTIVE_ROUTE_INPUT | Contains the existing genuine middle endpoint to central nonvanishing. |
| `LeanC2/Analytic/GenuineBulkConcrete.lean` | ACTIVE_ROUTE_INPUT | Contains canonical local data, horizontal budgets, quartet dominance, and core bulk APIs. |
| `LeanC2/PeerReview.lean` | ACTIVE_ROUTE_INPUT | Public compressed endpoint through `CanonicalMiddleObligation`. |
| `LeanC2/AuditContinuedQuartetPositiveBox.lean` | AUDIT_SHIM / OPTIONAL_REFINEMENT | Conditional positive-box certificate and dominance, not imported by the main module. |
| `LeanC2/AuditContinuedQuartetPositiveBoxInterval.lean` | OPTIONAL_REFINEMENT / BLOCKED_RAW_ROUTE | q endpoints and scalar ledger are proved; raw odd-truncation remains blocked below `Re(s)=1`. |
| `LeanC2/AuditContinuedQuartetPositiveBoxContinuedOdd.lean` | DIAGNOSTIC_ONLY / OPTIONAL_REFINEMENT | Separates raw and continued targets; does not feed the original route. |
| `LeanC2/AuditContinuedQuartetPositiveBoxGenuineOdd.lean` | AUDIT_SHIM / OPTIONAL_REFINEMENT | Abstract odd-reference ledger; route-tagged in this pass. |
| `LeanC2/AuditContinuedQuartetPositiveBoxGenuineOddBridge.lean` | AUDIT_SHIM / OPTIONAL_REFINEMENT | Conditional oddRef-to-genuine bridge; route-tagged in this pass. |

## Alignment Conclusion

The positive-box audit has not corrupted the main route.  It is currently a
conditional local certificate with useful interval and ledger reductions.

The oddRef files should be frozen as guardrails.  They answered the semantic
question: a genuine-first odd reference would need explicit compatibility with
the genuine object.  They do not currently feed the original genuine middle
endpoint.

The active work should return to positive-box fields that do not depend on the
odd channel.

## Recommended Next Step

Do not continue developing oddRef now.

Next target:

```lean
positiveBoxSectorLowerValue <= ||verticalQuartetPrefix (q s)||
```

on `s in positiveBox`.

This is sector geometry of `q` and the quartet prefix.  It is independent of the
odd channel.

After that, target:

```lean
||cutVec positiveBoxK positiveBoxM s|| <= positiveBoxCutUpperValue
```

This is finite and rectangular for `(K, M) = (3, 50)`.

Leave anchor and odd truncation for later, because both reopen the central/odd
channel issue.

## Verification Results

The two edited audit files compile:

```text
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxGenuineOdd.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxGenuineOddBridge.lean
```

The positive-box base files also compile:

```text
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxInterval.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBox.lean
```

Forbidden-token scan for the two edited oddRef Lean files and this report is
clean.  The literal declaration keyword scan for the two edited Lean files is
also clean.

## Promotion Status

Nothing was promoted to the main route.

`LeanC2.lean` imports the active core modules and does not import the positive-box
audit files.
