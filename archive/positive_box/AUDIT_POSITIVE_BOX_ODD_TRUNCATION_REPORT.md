# Audit positive box odd truncation report

## Status

This step stayed audit-only.  Nothing was promoted to the main route, and no
new proof of the odd-truncation bound is claimed.

The positive-box q endpoints remain closed.  The remaining ledger-side field is
still:

```lean
PositiveBoxOddTruncationData
```

## Exact Lean Target

The selected target is:

```lean
constantCoreOddTruncationNorm positiveBoxN s <= 7 / 180
```

with `positiveBoxN = 50`.  Unfolding the current definitions gives:

```lean
constantCoreOddTruncationNorm 50 s
  = ‖c2ConcreteOddTruncationError (constantCoreCutoff 50) s 0‖
  = ‖rectangularOddCoreSum s 50 - oddDirichletChannel s‖
```

The exact definitions are:

```lean
constantCoreOddTruncationNorm
c2ConcreteOddTruncationError
c2OddTruncationError
rectangularOddCoreSum
oddDirichletChannel
continuedOddDirichletChannel
```

The key point is that the current truncation norm compares the finite odd-core
sum against the raw `oddDirichletChannel`, not against
`continuedOddDirichletChannel`.

I added two audit-only helpers:

```lean
positiveBox_constantCoreOddTruncationNorm_eq_rawOddChannel
PositiveBoxOddTruncationData.ofRawOddChannelBound
```

So a future interval proof can feed `PositiveBoxOddTruncationData` through the
explicit raw-channel statement:

```lean
∀ s ∈ positiveBox,
  ‖rectangularOddCoreSum s positiveBoxN - oddDirichletChannel s‖ <= 7 / 180
```

## Why The Existing Tail Lemmas Do Not Apply

The available explicit tail route proves bounds such as:

```lean
rectangularOddCoreSum_sub_oddDirichletChannel_norm_le_explicit_of_one_lt_re
```

but it requires:

```lean
1 < s.re
```

The positive box is:

```text
21 / 25 <= s.re <= 43 / 50
```

so every point in this box has `s.re < 1`.  The `1 < s.re` tail lemmas cannot
be used directly.

## Search Result For `0 < s.re`

There is substantial `0 < s.re` infrastructure for continued/genuine objects
and for finite regularized middle models, plus the generic interface:

```lean
C2ExpandedOddTruncationBudget
```

But I did not find an existing lemma that directly proves a bound for:

```lean
‖c2ConcreteOddTruncationError coreCutoff s j‖
```

or equivalently:

```lean
‖rectangularOddCoreSum s M - oddDirichletChannel s‖
```

on `0 < s.re`.

## Diagnostic Scanner

I added:

```text
audit_positive_box_odd_truncation_scanner.py
```

This scanner computes:

```text
rectangularOddCoreSum(s, 50)
```

and compares it to the same continued odd-channel diagnostic mode used by the
existing horizontal scanner:

```text
channel_mode = zeta_diagnostic
```

This is numerical reconnaissance only, not a Lean proof input.

Generated artifacts:

```text
audit_positive_box_odd_truncation_subboxes.csv
audit_positive_box_odd_truncation_points.csv
audit_positive_box_odd_truncation_summary.json
audit_positive_box_odd_truncation_fine_subboxes.csv
audit_positive_box_odd_truncation_fine_points.csv
audit_positive_box_odd_truncation_fine_summary.json
```

Fine scan:

```text
subboxes: 256
points: 20736
cutoff: 50
guard factor: 1.10
```

Diagnostic sup:

```text
sampled sup = 0.0306465288369729407129069
target      = 0.0388888888888888888888889
ratio       = 0.788053598665018475474749
sample slack = 0.00824236005191594817598199
```

With the 10 percent diagnostic guard:

```text
guarded sup = 0.0337111817206702347841976
guarded slack = 0.0051777071682186541046913
```

The worst sampled point was the lower-left corner:

```text
s = 0.84 + 32.8125 i
```

The corresponding q-ratio horizontal contribution was:

```text
0.00663558945988876530297867 < 1 / 100
```

So diagnostically, `7 / 180` looks comfortably feasible.  I do not recommend
relaxing it at this point.

## Next Lean Lemma Needed

There are two possible formal paths:

1. If the current raw target is retained, the needed lemma is:

```lean
theorem positiveBox_rawOddTruncation_bound :
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    ‖rectangularOddCoreSum s positiveBoxN - oddDirichletChannel s‖ ≤
      positiveBoxOddTruncationUpperValue
```

Then Lean can close:

```lean
PositiveBoxOddTruncationData
```

using:

```lean
PositiveBoxOddTruncationData.ofRawOddChannelBound
```

2. If the intended middle object is the continued odd channel below
`Re(s)=1`, the route should introduce an audit-only continued-channel
horizontal/truncation package and prove the corresponding bridge deliberately.
The current `constantCoreOddTruncationNorm` does not use that object.

The scanner supports the second path diagnostically, but the Lean target still
spells the first path.

## Verification

Compiled:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxInterval.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBox.lean
```

Checked:

```bash
python3 -m py_compile audit_positive_box_odd_truncation_scanner.py
```

No `sorry`, `admit`, `axiom`, or top-level `constant` was introduced in the
positive-box audit Lean files.
