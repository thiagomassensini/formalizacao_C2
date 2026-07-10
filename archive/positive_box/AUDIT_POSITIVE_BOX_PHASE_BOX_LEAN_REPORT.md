# Audit Positive Box Phase Box Lean Report

## Scope

This pass keeps the work audit-only. It refines the active `positiveBox`
imaginary interval to the robust phase subbox while preserving the old endpoints
as audit trail:

- old `t` endpoints retained as `positiveBoxOldTMin = 525 / 16` and
  `positiveBoxOldTMax = 263 / 8`;
- active audit-only `positiveBoxTMin = 1641 / 50`;
- active audit-only `positiveBoxTMax = 1643 / 50`;
- `sigma` remains `[21 / 25, 43 / 50]`;
- `N = 50`, `K = 3`, `M = 50` remain unchanged.

No separate `phaseBox` object was introduced. The existing audit-only
`positiveBox` was refined to the smaller phase subbox, with the old box
endpoints kept in the file.

## Lean Results

The q-norm endpoint bounds were reused on the refined box:

- `positiveBox_q_norm_lower_11_40`;
- `positiveBox_q_norm_upper_7_25`;
- the earlier `q` interval bounds used by the sector package.

The first phase field is now closed:

```lean
theorem positiveBox_re_q_slope_lower
    {s : ℂ} (hs : s ∈ positiveBox) :
    (-(73 : ℝ) / 100) * ‖q s‖ ≤ (q s).re
```

The doubled-phase product field is now closed without splitting away the
available margin:

```lean
theorem positiveBox_re_q_sq_lower_closed
    {s : ℂ} (hs : s ∈ positiveBox) :
    positiveBoxReQSqLowerValue ≤ ((q s) ^ 2).re
```

Here `positiveBoxReQSqLowerValue` is `-(1 / 600)`.

The sector lower is now unconditional on this refined audit box:

```lean
theorem positiveBox_sector_lower
    {s : ℂ} (hs : s ∈ positiveBox) :
    positiveBoxSectorLowerValue ≤ ‖verticalQuartetPrefix (q s)‖
```

This is packaged as:

- `positiveBoxQTrigPhaseData`;
- `positiveBoxQSqTrigPhaseData`;
- `positiveBoxSectorFactorData`;
- `positiveBoxSectorData`.

## Remaining Open Certificate Fields

The full `PositiveBoxCertificate` is not closed in this pass. The remaining
fields are:

- `anchor_bound`;
- `cut_bound`;
- `ledger_strict`.

This pass did not attack `anchor_bound`, `cut_bound`, odd truncation, or the
odd reference line.

## Route Discipline Checks

- `oddRef` was not edited and remains frozen.
- No new operator was introduced.
- Nothing was promoted to the main route.
- The work remains in the audit-only positive-box files.
- No `riemannZeta`, `zeta`, or `zeta_diagnostic` input was used.
- No `sorry`, `admit`, `axiom`, or `constant` declaration was added in the
  edited Lean files.

## Verification

The following commands compile after the refinement:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxSector.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxInterval.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBox.lean
```
