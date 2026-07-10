# Audit positive box interval progress report

## Status

This step remains audit-only.  Nothing was promoted to the main route, no
middle closure is claimed, and no sampled diagnostic value was used as a Lean
proof.

Compiled commands:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxInterval.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBox.lean
```

The checked files contain no `sorry`, `admit`, `axiom`, or top-level
`constant`, and no `riemannZeta`/`zeta` references were introduced in the
positive-box audit files.

## Certificate fields

No field of `PositiveBoxCertificate` was made fully unconditional in this
step.

Still conditional:

* `anchor_bound`
* `cut_bound`
* `sector_lower`
* `ledger_strict`

The progress is that `ledger_strict` is no longer just an opaque field in the
new interval layer.  It is reduced to smaller interval obligations by:

```lean
PositiveBoxLedgerBounds.ledger_strict
PositiveBoxCertificate.ofAnalyticBoundsAndLedgerBounds
```

## Ledger reduction

The scalar q-ratio ledger arithmetic was proved for the conservative constants

```text
anchorUpper = 1 / 125
cutUpper    = 3 / 1000
sectorLower = 819 / 1000
```

under the conditional bounds

```text
27 / 100 <= ||q s||
||q s|| <= 3 / 10
constantCoreHorizontalUpperQRatio positiveBoxN s <= 1 / 100
```

The main new arithmetic lemmas are:

```lean
positiveBoxLedger_left_le
positiveBoxLedger_right_ge
positiveBoxLedger_real_strict
```

They prove the ledger inequality by bounding the left side by `13 / 250` and
the sector-margin side below by `14663 / 250000`.

## Q bounds

Proved unconditionally on `positiveBox`:

```lean
positiveBox_q_norm_nonneg
positiveBox_q_norm_lt_one
positiveBox_q_norm_lt_half
positiveBox_qNormHorizontalRatio_nonneg
positiveBox_qNormHorizontalRatio_lt_one
```

Still conditional:

```lean
PositiveBoxQBounds
```

In particular, the sharper candidate bracket

```text
27 / 100 <= ||q s|| <= 3 / 10
```

has not yet been proved from the exponential/log formula in Lean.

## Sector and cut status

The sector API remains conditional through:

```lean
PositiveBoxSectorData
PositiveBoxAnalyticBounds.sector_lower
```

The target is still:

```lean
819 / 1000 <= ||verticalQuartetPrefix (q s)||
```

using `verticalQuartetPrefix z = (1 + z) * (1 + z ^ 2)`.

The cutoff vector bound remains conditional:

```lean
||cutVec positiveBoxK positiveBoxM s|| <= 3 / 1000
```

No anchor estimate was changed.  The factorization

```lean
anchor s =
  verticalDepthTailFromTwo s *
    (1 - 2 * continuedOddDirichletChannel s)
```

remains the relevant later route, but this step did not attempt to prove it on
the box.

## Next field

Among `sector_lower`, `cut_bound`, and `anchor_bound`, the next most practical
certificate field still looks like `cut_bound`, because it is finite and
rectangular for `(K, M) = (3, 50)`.

Before the ledger can become an actual certificate field, the immediate
supporting obligations are the q bracket and the local horizontal upper
`constantCoreHorizontalUpperQRatio positiveBoxN s <= 1 / 100`.

