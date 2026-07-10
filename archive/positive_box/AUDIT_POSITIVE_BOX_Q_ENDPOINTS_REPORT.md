# Audit positive box q endpoints report

## Status

This step stayed audit-only.  No object was promoted to the main route, and no
sampled diagnostic value was used as a proof.

## Q endpoints

The two endpoint inequalities are now proved in
`LeanC2/AuditContinuedQuartetPositiveBoxInterval.lean`:

```lean
positiveBox_q_endpoint_lower
positiveBox_q_endpoint_upper
positiveBoxQEndpointData
positiveBoxQBounds
positiveBox_q_norm_lower_27_100
positiveBox_q_norm_upper_3_10
```

The lower endpoint uses a rational lower bound for `log (50 / 27)` and the
certified mathlib upper bound for `log 2`.

The upper endpoint uses the symmetric logarithm expansion at `x = 1 / 4` to
bound `log (5 / 3)` from above, then compares it with the certified mathlib
lower bound for `log 2`.

## Odd truncation

The odd-truncation target remains conditional:

```lean
PositiveBoxOddTruncationData
```

with field:

```lean
constantCoreOddTruncationNorm positiveBoxN s <= 7 / 180
```

The existing tail machinery found in the repository is not enough to close this
for the selected positive box, because the available explicit odd-tail bounds
are stated for `1 < s.re`, while this box has
`21 / 25 <= s.re <= 43 / 50`.

## Ledger strictness

The scalar ledger no longer depends on q endpoint hypotheses.  With the
endpoints closed, the audit file now has:

```lean
positiveBox_ledger_strict_ofOddTruncation
```

So the ledger-side remaining input is exactly the odd-truncation package above.

The non-ledger certificate fields remain open and unchanged:

```lean
anchor_bound
cut_bound
sector_lower
```

## Guardrails

Nothing was promoted to the main route.

No new proof placeholder or top-level axiom/constant declaration was introduced
in the positive-box audit Lean files.

Compiled commands:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxInterval.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBox.lean
```
