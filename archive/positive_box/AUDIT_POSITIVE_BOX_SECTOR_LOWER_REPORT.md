# Positive Box Sector Lower Audit

Date: 2026-07-01

## Scope

This pass freezes the abstract odd-reference line and advances the concrete
positive-box audit through the first channel-independent field:

```lean
∀ s ∈ positiveBox,
  positiveBoxSectorLowerValue ≤ ‖verticalQuartetPrefix (q s)‖
```

No new operator was introduced.  Nothing was promoted to the main route.

## Definitions Checked

The selected box is:

```text
21 / 25 ≤ s.re ≤ 43 / 50
525 / 16 ≤ s.im ≤ 263 / 8
```

The target lower value is:

```text
positiveBoxSectorLowerValue = 819 / 1000
```

The quartet prefix is:

```text
verticalQuartetPrefix(q) = 1 + q + q^2 + q^3
                         = (1 + q) * (1 + q^2)
```

The existing q-norm bounds reused here are:

```lean
positiveBox_q_norm_lower_27_100
positiveBox_q_norm_upper_3_10
```

The phase coordinate already exists as:

```lean
positiveBoxQPhase s = Complex.arg (q s)
```

The q-norm endpoint lemmas use the existing vertical-ratio norm formula for
`q`.

## Lean Work

Created:

```text
LeanC2/AuditContinuedQuartetPositiveBoxSector.lean
```

New audit-only API:

```lean
positiveBoxOneAddQLowerValue = 4091 / 5000
positiveBoxOneAddQSqLowerValue = 1001 / 1000

PositiveBoxSectorFactorData phaseLower phaseUpper
```

The factor data keeps these fields:

```text
q_norm_bounds
q_phase_lower
q_phase_upper
one_add_q_lower
one_add_q_sq_lower
```

The two remaining interval targets are:

```lean
∀ s ∈ positiveBox,
  4091 / 5000 ≤ ‖1 + q s‖

∀ s ∈ positiveBox,
  1001 / 1000 ≤ ‖1 + (q s)^2‖
```

Lean proves the rational payment:

```lean
positiveBoxSectorLowerValue_le_factorProduct
```

and then proves:

```lean
PositiveBoxSectorFactorData.sector_lower
```

which derives the required `sector_lower` field from the two factor bounds and
the factorization of `verticalQuartetPrefix`.

The file also provides:

```lean
PositiveBoxSectorFactorData.toSectorData
PositiveBoxAnalyticBounds.ofSectorFactorData
PositiveBoxCertificate.withSectorLower
```

These wrappers fill the sector field while leaving anchor, cutoff, and ledger
inputs unchanged.

## Status

`sector_lower` is not unconditional yet.

It is reduced to explicit geometric/trigonometric interval obligations for:

```text
‖1 + q‖
‖1 + q^2‖
phase range of q
```

This is the intended next interval-proof surface.

## File Classification

```text
LeanC2/AuditContinuedQuartetPositiveBoxSector.lean
  AUDIT_SHIM / OPTIONAL_REFINEMENT
```

The abstract odd-reference files remain frozen as audit shims.  This pass did
not add to that line.

## Verification

Compiled:

```text
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxSector.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxInterval.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBox.lean
```

Forbidden-token scan for the edited Lean file is clean.
