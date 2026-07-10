# Positive Box Sector Geometry Audit

Date: 2026-07-01

Route tags:

- AUDIT_SHIM
- OPTIONAL_REFINEMENT

## Scope

This pass continued only the concrete positive-box sector audit.  The oddRef
line was left frozen, no new operator was introduced, and nothing was promoted
to the main route.

The active Lean file is:

- `LeanC2/AuditContinuedQuartetPositiveBoxSector.lean`

## Definitions Checked

The sector field still targets:

```lean
positiveBoxSectorLowerValue <= ‖verticalQuartetPrefix (q s)‖
```

on:

```text
21 / 25 <= s.re <= 43 / 50
525 / 16 <= s.im <= 263 / 8
```

The factorization used is:

```text
verticalQuartetPrefix(q) = 1 + q + q^2 + q^3
                         = (1 + q) * (1 + q^2)
```

The two factor guards are:

```lean
positiveBoxOneAddQLowerValue   = 4091 / 5000
positiveBoxOneAddQSqLowerValue = 1001 / 1000
```

The existing q-norm bounds reused by the sector API are:

```lean
positiveBox_q_norm_lower_27_100
positiveBox_q_norm_upper_3_10
```

## New Lean Reductions

The common algebraic identity was isolated as:

```lean
norm_one_add_sq_eq :
  ‖(1 : ℂ) + z‖ ^ 2 = 1 + ‖z‖ ^ 2 + 2 * z.re
```

The `1 + q^2` factor is reduced by:

```lean
PositiveBoxQSqSectorData
```

with fields:

```lean
11 / 40 <= ‖q s‖
-(1 / 600) <= ((q s) ^ 2).re
```

These fields imply:

```lean
positiveBox_one_add_q_sq_norm_lower :
  1001 / 1000 <= ‖(1 : ℂ) + (q s) ^ 2‖
```

The `1 + q` factor is reduced by:

```lean
PositiveBoxQSectorData
```

with fields:

```lean
-(21 / 100) <= (q s).re

(4091 / 5000) ^ 2 <=
  1 + ‖q s‖ ^ 2 + 2 * (q s).re
```

These fields imply:

```lean
positiveBox_one_add_q_norm_lower :
  4091 / 5000 <= ‖(1 : ℂ) + q s‖
```

The standalone real-part lower for `q` is recorded for the phase audit, but the
decisive target is the coupled squared-norm expression.  A separated
real-part/norm estimate loses too much margin near the lower edge of this box.

## Sector Connection

The existing factor API was extended with:

```lean
PositiveBoxSectorFactorData.ofQSectorData
```

It packages:

- existing q-norm endpoint bounds;
- phase-box fields;
- `PositiveBoxQSectorData`;
- `PositiveBoxQSqSectorData`;

into `PositiveBoxSectorFactorData`.

The existing wrappers then continue to work:

```lean
PositiveBoxSectorFactorData.sector_lower
PositiveBoxSectorFactorData.toSectorData
PositiveBoxAnalyticBounds.ofSectorFactorData
PositiveBoxCertificate.withSectorLower
```

## Status

The two factor bounds were not proved unconditionally in this pass.  They are
now reduced to explicit geometric interval targets:

- for `1 + q^2`: prove `11 / 40 <= ‖q s‖` and `-(1 / 600) <= Re(q^2)`;
- for `1 + q`: prove the coupled quadratic lower above.

Therefore `sector_lower` is still conditional, but the remaining work is now
pure q-geometry on the positive box.

The certificate fields still open after this pass are:

- the q-sector interval data described above;
- `anchor_bound`;
- `cut_bound`;
- the horizontal ledger source.

## Verification

The following commands passed:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxSector.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxInterval.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBox.lean
```

Requested forbidden-token scan on edited audit artifacts: clean.
