# Audit positive box Lean report

Update: this first report has been superseded by
`AUDIT_POSITIVE_BOX_INTERVAL_NEXT_REPORT.md` for the box constants.  The Lean
file now uses conservative rational values `1 / 125`, `3 / 1000`, and
`819 / 1000`; the sampled/guarded sector lower values below are diagnostic
context only.

## Route status

This is audit-only.  Nothing is promoted to the main route, and sampled
numerics are not used as Lean proof objects.

The file compiled with:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBox.lean
```

## Selected subbox

Source: `audit_anchor_subbox_ledger_boxes.csv`, filtered to
`box_id = positive_pocket`, full current/Qsector pass on the sampled grid, and
maximal `current_worst_slack_Qsector`.

| field | value |
|---|---:|
| subbox_id | `0,1` |
| sigma_min | `0.84` |
| sigma_max | `0.86` |
| t_min | `32.8125` |
| t_max | `32.875` |
| N | `50` |
| K | `3` |
| M | `50` |
| sample_count | `25` |
| anchor upper sampled | `0.00741369746517814024376368` |
| cut upper sampled | `0.00266791109265765197487775` |
| sector lower sampled | `0.820724783612405168937278` |
| sector lower guarded | `0.823709934002352627403605` |
| Q_worst min | `0.0585513079738606092458115` |
| Q_sector min | `0.061905836329982978833314` |
| current ledger max | `0.0372777104017183699213484` |
| minimum current/Qsector slack | `0.0246281259282646089119656` |
| maximum current/Qsector slack | `0.025128482799192664035924` |
| seed tax max | `0.0129585645358514331125702` |

## Lean artifacts

New file:

* `LeanC2/AuditContinuedQuartetPositiveBox.lean`

Definitions created:

* `positiveBoxSigmaMin = 21 / 25`
* `positiveBoxSigmaMax = 43 / 50`
* `positiveBoxTMin = 525 / 16`
* `positiveBoxTMax = 263 / 8`
* `positiveBoxN = 50`
* `positiveBoxK = 3`
* `positiveBoxM = 50`
* `positiveBox`
* `positiveBoxAnchorUpperValue`
* `positiveBoxCutUpperValue`
* `positiveBoxSectorLowerValue`
* `positiveBoxAnchorUpper`
* `positiveBoxCutUpper`
* `positiveBoxSectorLower`

Certificate structure:

* `PositiveBoxCertificate`

The structure keeps the future interval obligations explicit:

* `anchor_bound`
* `cut_bound`
* `sector_lower`
* `ledger_strict`

Bridge theorem:

* `PositiveBoxCertificate.toAnchorUpperData`

Audit consequences:

* `positiveBox_qratio_sectorResidualDominance`
* `positiveBox_qratio_truePrefixResidualDominance`

The first theorem uses
`vSplitQRatio_sectorResidualDominance_of_upperData`; the second transports the
same certificate to the true quartet-prefix residual statement using the sector
lower field.

## What is still conditional

The following fields are not proved yet:

1. For every `s` in `positiveBox`,
   `norm (anchor s) <= positiveBoxAnchorUpperValue`.
2. For every `s` in `positiveBox`,
   `norm (cutVec positiveBoxK positiveBoxM s) <= positiveBoxCutUpperValue`.
3. For every `s` in `positiveBox`,
   `positiveBoxSectorLowerValue <= norm (verticalQuartetPrefix (q s))`.
4. For every `s` in `positiveBox`, the q-ratio V-split ledger using these
   box constants is strictly below the sector margin.

These are exactly the fields that should be replaced later by real
interval/sector proofs.

## Next interval steps

1. Prove interval bounds for `q s` over this small rectangle.
2. Prove a sector lower for `verticalQuartetPrefix (q s)` on the same image.
3. Prove the anchor bound using the factorization
   `anchor = verticalDepthTailFromTwo * (1 - 2 * continuedOddDirichletChannel)`,
   or a sharper structural cancellation lemma if the factor bound is too loose.
4. Prove the `cutVec` bound for `(K,M) = (3,50)`.
5. Close `ledger_strict` by interval arithmetic over `positiveBox`.

This would turn the conditional positive-box API into the first genuine
interval certificate for a small middle subbox, still audit-only.
