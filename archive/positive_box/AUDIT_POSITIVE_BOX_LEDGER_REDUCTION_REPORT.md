# Audit positive box ledger reduction report

## Status

This step remains audit-only.  Nothing was promoted to the main route, no
middle closure is claimed, and no sampled diagnostic number was used as proof.

Compiled commands:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxInterval.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBox.lean
```

## Q bounds

The fine q bounds were not proved unconditionally from `exp`/`log` endpoint
arithmetic.

What was proved is the monotonic reduction from the box edges:

```lean
positiveBox_q_norm_lower_27_100_of_endpoint
positiveBox_q_norm_upper_3_10_of_endpoint
PositiveBoxQBounds.ofEndpointData
```

The remaining endpoint inequalities are isolated as:

```lean
PositiveBoxQEndpointData.lower_endpoint
PositiveBoxQEndpointData.upper_endpoint
```

Concretely, these are:

```text
27 / 100 <= (1 / 2) * exp (-(positiveBoxSigmaMax * log 2))
(1 / 2) * exp (-(positiveBoxSigmaMin * log 2)) <= 3 / 10
```

The already-proved elementary q facts remain available:

```lean
positiveBox_q_norm_nonneg
positiveBox_q_norm_lt_one
positiveBox_q_norm_lt_half
positiveBox_qNormHorizontalRatio_nonneg
positiveBox_qNormHorizontalRatio_lt_one
```

## Horizontal bound

The local horizontal upper

```lean
constantCoreHorizontalUpperQRatio positiveBoxN s <= 1 / 100
```

was not proved unconditionally.  It remains available as:

```lean
PositiveBoxHorizontalUpperData
```

It was refined to a smaller conditional odd-truncation obligation:

```lean
positiveBoxOddTruncationUpperValue = 7 / 180
PositiveBoxOddTruncationData
PositiveBoxHorizontalUpperData.ofOddTruncationAndQUpper
```

So a q upper `||q s|| <= 3 / 10` plus

```lean
constantCoreOddTruncationNorm positiveBoxN s <= 7 / 180
```

now imply the horizontal upper `<= 1 / 100`.

## Ledger strictness

The rational ledger arithmetic was already closed.  This step adds a shorter
constructor and direct wrappers:

```lean
PositiveBoxLedgerBounds.ofQAndHorizontal
PositiveBoxLedgerBounds.ofEndpointQAndOddTruncation
positiveBox_ledger_strict_ofQAndHorizontal
positiveBox_ledger_strict_ofEndpointQAndOddTruncation
```

Therefore `ledger_strict` is closed once the ledger-side data are supplied:

```text
27 / 100 <= ||q s||
||q s|| <= 3 / 10
constantCoreHorizontalUpperQRatio positiveBoxN s <= 1 / 100
```

or, equivalently through the refined path:

```text
q endpoint inequalities
constantCoreOddTruncationNorm positiveBoxN s <= 7 / 180
```

It is not yet an unconditional field of `PositiveBoxCertificate`.

## Certificate fields still open

The non-ledger certificate fields remain unchanged and conditional:

```lean
anchor_bound
cut_bound
sector_lower
```

The original `PositiveBoxCertificate.ledger_strict` field is now produced by
`PositiveBoxLedgerBounds.ledger_strict` whenever the ledger-side bounds above
are supplied.

## Guardrails

No main-route file was changed.  The work stayed in
`LeanC2/AuditContinuedQuartetPositiveBoxInterval.lean` plus this report.

The positive-box audit files were checked for forbidden proof placeholders and
new zeta references: no `sorry`, `admit`, `axiom`, top-level `constant`,
`riemannZeta`, or `zeta` reference was introduced.

