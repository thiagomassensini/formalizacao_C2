# Positive Box Raw vs Continued Odd Truncation Audit

## Scope

This audit resolves the formal mismatch between the current raw odd truncation
target and the diagnostic/continued target for the positive box.

No numerical scanner output is used here.  In particular, no `mpmath` value and
no `zeta_diagnostic` result is used as evidence for a Lean bound.

## Definitions Audited

`oddDirichletChannel` is defined in `LeanC2/Analytic/OddChannel.lean` as:

```lean
noncomputable def oddDirichletChannel (s : ℂ) : ℂ :=
  ∑' n : ℕ, complexDirichletCoeff s (2 * n + 1)
```

This is a total Lean term because `tsum` is total.  The definition itself does
not carry a convergence hypothesis.  The useful summability and tail theorems
found around this channel require `1 < s.re`.

`continuedOddDirichletChannel` is currently defined in
`LeanC2/Analytic/GenuineContinuation.lean` as:

```lean
noncomputable def continuedOddDirichletChannel (s : ℂ) : ℂ :=
  (1 - complexDirichletCoeff s 2) * riemannZeta s
```

Therefore the existing symbol is not a genuine-first analytic input for the
middle route if its definition is used.  It can still be audited as an existing
repository object, but a strict genuine-first positive-box proof must not close
the middle by appealing to this definition.

`rectangularOddCoreSum` is defined in
`LeanC2/Operators/TruncatedGenuine.lean` as:

```lean
noncomputable def rectangularOddCoreSum (s : ℂ) (M : Nat) : ℂ :=
  ∑ m ∈ oddCoresUpTo M, complexDirichletCoeff s m
```

The generic truncation error is defined in `LeanC2/Route/BulkEstimates.lean`:

```lean
noncomputable def c2OddTruncationError
    (ZoddRef : ℂ → ℂ) (coreCutoff : ℕ → ℕ) : ℂ → ℕ → ℂ :=
  fun s j => rectangularOddCoreSum s (coreCutoff j) - ZoddRef s
```

The route-specialized truncation error fixes the raw channel:

```lean
noncomputable def c2ConcreteOddTruncationError
    (coreCutoff : ℕ → ℕ) : ℂ → ℕ → ℂ :=
  c2OddTruncationError oddDirichletChannel coreCutoff
```

The positive-box scalar norm currently consumed by the ledger is defined in
`LeanC2/AuditContinuedQuartetDominance.lean`:

```lean
noncomputable def constantCoreOddTruncationNorm (N : ℕ) : ℂ → ℝ :=
  fun s => ‖c2ConcreteOddTruncationError (constantCoreCutoff N) s 0‖
```

Unfolding this gives the raw target:

```lean
‖rectangularOddCoreSum s positiveBoxN - oddDirichletChannel s‖
```

The public horizontal budgets are also raw-specialized:

```lean
structure C2ExpandedHorizontalLayerBudget ... where
  layer_bound : ∀ j : ℕ,
    ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤ ...
```

and

```lean
structure C2ExpandedOddTruncationBudget ... where
  truncation_bound : ∀ j : ℕ,
    ‖c2ConcreteOddTruncationError coreCutoff s j‖ ≤ ...
```

Both use `c2Concrete...`, hence `oddDirichletChannel`.

## Answers

1. The current ledger consumes the raw object, not the continued object.

The current field `PositiveBoxOddTruncationData.odd_truncation_bound` is a bound
on `constantCoreOddTruncationNorm positiveBoxN s`.  The theorem
`positiveBox_constantCoreOddTruncationNorm_eq_rawOddChannel` identifies this
with:

```lean
‖rectangularOddCoreSum s positiveBoxN - oddDirichletChannel s‖
```

2. The genuine-first positive-box proof should not rely on the raw `tsum`
target below `Re(s) = 1`.

The box has `21 / 25 <= s.re <= 43 / 50`, so it lies below `1`.  The raw tail
lemma found in the repository is:

```lean
rectangularOddCoreSum_sub_oddDirichletChannel_norm_le_explicit_of_one_lt_re
```

and it requires `1 < s.re`.  It is not applicable to this box.

The semantically correct audit interface is therefore a reference-channel
interface: the horizontal truncation error must be measured against the same
odd reference used by the horizontal layer.  For a future genuine-first route,
that reference should be a zeta-free continued/genuine odd reference.  The
existing `continuedOddDirichletChannel` symbol is not enough as a
genuine-first input because its current definition unfolds to `riemannZeta`.

3. No raw-equals-continued bridge in `0 < Re(s)` was found.

The available direct bridge is:

```lean
continuedOddDirichletChannel_eq_oddDirichletChannel_on_oneLtHalfPlane
```

with domain `oneLtHalfPlane`, i.e. `{s | 1 < s.re}`.  No theorem was found that
identifies `oddDirichletChannel = continuedOddDirichletChannel` throughout
`openRightHalfPlane`, i.e. `0 < s.re`.

4. The raw use in the positive-box audit is inherited from the raw concrete
horizontal route, not forced by the positive-box numerics.

The lower-level API is generic in `ZoddRef`:

```lean
c2OddTruncationError ZoddRef coreCutoff
c2ConcreteHorizontalLayerDefect ZoddRef coreCutoff
c2ConcreteHorizontalLayerDefect_eq_weighted_truncation_error
```

The public expanded horizontal budget, however, specializes to the raw
`oddDirichletChannel`.  Thus the current positive-box ledger is raw because it
plugs into that specialized route.

5. The audit-only continued route can feed a parallel scalar ledger.

The new file `LeanC2/AuditContinuedQuartetPositiveBoxContinuedOdd.lean` adds a
separate continued q-ratio layer and ledger.  It proves:

```lean
continued odd truncation bound
+ q endpoint bounds
=> continued horizontal upper <= 1 / 100
```

and then:

```lean
continued horizontal upper
+ q endpoint bounds
=> continued scalar ledger strict
```

This does not replace `PositiveBoxOddTruncationData` and does not close the
public positive-box certificate.

## Lean Artifacts Created

New audit-only file:

```text
LeanC2/AuditContinuedQuartetPositiveBoxContinuedOdd.lean
```

Key declarations:

```lean
PositiveBoxRawOddTruncationData
PositiveBoxRawOddTruncationData.toOddTruncationData
PositiveBoxRawOddTruncationData.ofOddTruncationData

continuedCoreOddTruncationNorm
positiveBox_continuedCoreOddTruncationNorm_eq_continuedOddChannel
PositiveBoxContinuedOddTruncationData
PositiveBoxContinuedOddTruncationData.norm_bound

continuedOddHorizontalLayerDefect
ContinuedOddHorizontalLayerBudget
continuedCoreHorizontalAmplitudeQRatio
continuedCoreHorizontalUpperQRatio
continuedCoreHorizontalLayerBudgetQRatio

PositiveBoxContinuedHorizontalUpperData
PositiveBoxContinuedHorizontalUpperData.ofContinuedOddTruncationAndQUpper

vSplitResidualLedgerContinuedQRatio
vSplitResidualUpperContinuedQRatio_eq_ledger
PositiveBoxContinuedLedgerBounds
PositiveBoxContinuedLedgerBounds.ledger_strict
positiveBox_continued_ledger_strict_ofContinuedOddTruncation
```

## Conclusion

Current formal target: raw.

Genuine-first target for the positive box: not the raw `tsum` below `Re(s)=1`;
use a continued/genuine odd reference through a `ZoddRef`-style interface.

Existing `continuedOddDirichletChannel`: useful for auditing the current
repository split, but not acceptable as a genuine-first analytic input if its
definition is unfolded.

Raw route status: blocked below `Re(s)=1` with the current tail lemmas.

Continued audit route status: scalar q-ratio ledger wrapper is available, still
conditional on the continued odd truncation bound and still audit-only.

## Verification

The following commands compile:

```text
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxInterval.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBox.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxContinuedOdd.lean
```

No new theorem was promoted to the main route.

No `sorry`, `admit`, `axiom`, or top-level `constant` was introduced in the
checked audit files.

No zeta-based numerical diagnostic was used.  The new Lean file does not contain
`riemannZeta`, `zeta_diagnostic`, or `mpmath.zeta`; it mentions the existing
continued channel only by name and keeps the route audit-only.
