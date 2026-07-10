# Audit positive box interval next report

## Status

This step stays audit-only.  No endpoint or main-route object was changed, and
no sampled number is treated as a Lean certificate.

Compiled command:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxInterval.lean
```

## Sector lower sanity

The scanner source was checked.  The helper `sector_lower_for_box` returns:

```text
sampled_min, sampled_min * (1 - guard)
```

so the guard direction is correct in the script.

For the selected subbox `positive_pocket / 0,1 / N=50 / K=3 / M=50`, the CSV
row has:

| field | value |
|---|---:|
| `P4_lower_sampled` | `0.82536065531297858457275` |
| `Lsector_guarded` | `0.823709934002352627403605` |

The older report mixed in `0.820724783612405...`, which belongs to a different
subbox row.  That value was diagnostic only and was not a certificate.

Even though the guarded value is below the selected sampled minimum, the Lean
box now uses the more conservative rational:

```text
positiveBoxSectorLowerValue = 819 / 1000 = 0.819
```

This avoids treating the sampled guard as a formal lower bound.

## Conservative constants

The positive-box constants in `LeanC2/AuditContinuedQuartetPositiveBox.lean`
were replaced by simple rationals:

| constant | value | role |
|---|---:|---|
| `positiveBoxAnchorUpperValue` | `1 / 125 = 0.008` | candidate anchor upper |
| `positiveBoxCutUpperValue` | `3 / 1000 = 0.003` | candidate cut upper |
| `positiveBoxSectorLowerValue` | `819 / 1000 = 0.819` | candidate sector lower |

Diagnostic rescan on the selected sampled grid with these conservative values:

| diagnostic | value |
|---|---:|
| points passing current/Qsector | `25 / 25` |
| conservative Qsector min | `0.06154841271926455...` |
| conservative ledger max | `0.04094164713469290...` |
| conservative min slack | `0.02229826974354115...` |

These numbers are still diagnostics only.

## Lean interval file

New file:

* `LeanC2/AuditContinuedQuartetPositiveBoxInterval.lean`

Compiled elementary box lemmas:

* `positiveBox_re_lower`
* `positiveBox_re_upper`
* `positiveBox_im_lower`
* `positiveBox_im_upper`
* `positiveBox_re_pos`

Compiled constant sanity lemmas:

* `positiveBoxAnchorUpperValue_pos`
* `positiveBoxCutUpperValue_pos`
* `positiveBoxSectorLowerValue_pos`
* `positiveBoxSectorLowerValue_lt_one`

Compiled q-ratio lemmas:

* `positiveBox_q_norm_nonneg`
* `positiveBox_q_norm_lt_one`
* `positiveBox_qNormHorizontalRatio_nonneg`
* `positiveBox_qNormHorizontalRatio_lt_one`

Prepared q interval API:

* `positiveBoxQLowerCandidate = 27 / 100`
* `positiveBoxQUpperCandidate = 3 / 10`
* `positiveBoxQUpperCandidate_lt_one`
* `PositiveBoxQBounds`
* `PositiveBoxQBounds.point_lt_one`

Prepared sector API:

* `positiveBoxQPhase`
* `PositiveBoxSectorData`
* `PositiveBoxSectorData.to_sector_lower`

Prepared interval-to-certificate bridge:

* `PositiveBoxIntervalData`
* `PositiveBoxCertificate.ofQBoundsAndIntervalBounds`
* `positiveBox_qratio_sectorResidualDominance_of_intervalData`
* `positiveBox_qratio_truePrefixResidualDominance_of_intervalData`

## Still conditional

The following are not proved yet:

1. `PositiveBoxQBounds.q_norm_lower`
2. `PositiveBoxQBounds.q_norm_upper`
3. `PositiveBoxSectorData.q_phase_lower`
4. `PositiveBoxSectorData.q_phase_upper`
5. `PositiveBoxSectorData.sector_lower`
6. `PositiveBoxIntervalData.anchor_bound`
7. `PositiveBoxIntervalData.cut_bound`
8. `PositiveBoxIntervalData.ledger_strict`

The existing `PositiveBoxCertificate` remains conditional on:

* `anchor_bound`
* `cut_bound`
* `sector_lower`
* `ledger_strict`

## Next field to replace

The easiest certificate field to attack next is `cut_bound` for
`K = 3, M = 50`, because it is small and finite-rectangular.  The easiest
supporting interval facts are the q-norm bracket
`27 / 100 <= norm (q s) <= 3 / 10`, which should feed the later ledger proof.

The hardest remaining certificate field is still `anchor_bound`, because it
depends on controlling the factor
`1 - 2 * continuedOddDirichletChannel s` across the box.

## Route discipline

Nothing was promoted to the main route.  The positive box is now a cleaner
audit-only formal scaffold with conservative rational constants and explicit
future interval obligations.
