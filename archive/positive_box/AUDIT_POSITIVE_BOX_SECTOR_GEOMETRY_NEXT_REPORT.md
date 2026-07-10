# Positive Box Sector Geometry Next Audit

Date: 2026-07-01

Route tags:

- AUDIT_SHIM
- OPTIONAL_REFINEMENT

## Scope

This pass continued only the concrete positive-box sector audit.  The oddRef
line stayed frozen, no new operator was introduced, and no audit theorem was
promoted to the main route.

Edited Lean file:

- `LeanC2/AuditContinuedQuartetPositiveBoxSector.lean`

## Scalar q-Norm Progress

The sharper lower q-norm endpoint was closed:

```lean
positiveBox_q_norm_lower_11_40 :
  s ∈ positiveBox ->
    11 / 40 <= ‖q s‖
```

The proof uses the same endpoint monotonicity pattern as the existing q-norm
bracket.  The new scalar input is a lower bound for `log (20 / 11)` from the
partial symmetric log expansion with `x = 9 / 31`.

A sharper upper q-norm endpoint was also closed:

```lean
positiveBox_q_norm_upper_7_25 :
  s ∈ positiveBox ->
    ‖q s‖ <= 7 / 25
```

This uses the upper symmetric log expansion for `log (25 / 14)` with
`x = 11 / 39`.

## The `1 + q^2` Factor

The q-norm half of the `1 + q^2` factor is now closed by
`positiveBox_q_norm_lower_11_40`.

The remaining field is exactly:

```lean
PositiveBoxQSqPhaseData.re_q_sq_lower :
  s ∈ positiveBox ->
    -(1 / 600) <= ((q s) ^ 2).re
```

Given this field, Lean proves:

```lean
positiveBox_one_add_q_sq_norm_lower :
  1001 / 1000 <= ‖(1 : ℂ) + (q s) ^ 2‖
```

So `‖1 + q^2‖` is not unconditional yet, but it is reduced to one explicit
real-part interval bound.

## The `1 + q` Factor

The coupled quadratic target is now proved from one phase-slope field:

```lean
PositiveBoxQPhaseData.re_q_slope_lower :
  s ∈ positiveBox ->
    -(73 / 100) * ‖q s‖ <= (q s).re
```

Together with `positiveBox_q_norm_upper_7_25`, Lean proves:

```lean
positiveBox_one_add_q_norm_coupled :
  (4091 / 5000) ^ 2 <=
    1 + ‖q s‖ ^ 2 + 2 * (q s).re
```

Then `norm_one_add_sq_eq` gives:

```lean
positiveBox_one_add_q_norm_lower :
  4091 / 5000 <= ‖(1 : ℂ) + q s‖
```

So `‖1 + q‖` is not unconditional yet, but it is reduced to one explicit
phase-slope lower bound.

## Sector Packaging

New wrappers:

```lean
PositiveBoxQSectorData.ofPhaseData
PositiveBoxQSqSectorData.ofPhaseData
PositiveBoxSectorFactorData.ofPhaseData
```

These connect the two remaining phase packages to the existing chain:

```lean
PositiveBoxSectorFactorData.sector_lower
PositiveBoxSectorFactorData.toSectorData
PositiveBoxAnalyticBounds.ofSectorFactorData
PositiveBoxCertificate.withSectorLower
```

## Status

`sector_lower` is still conditional.  The remaining sector-only fields are:

- `-(73 / 100) * ‖q s‖ <= (q s).re`;
- `-(1 / 600) <= ((q s) ^ 2).re`;
- the phase-box fields kept by the existing sector API.

The non-sector certificate fields remain untouched:

- `anchor_bound`;
- `cut_bound`;
- horizontal source.

## Verification

The following commands passed:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxSector.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxInterval.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBox.lean
```

Requested blocked-token scan on the edited audit artifacts: clean.
