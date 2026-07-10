import LeanC2.AuditContinuedQuartetPositiveBoxInterval

/-!
# Positive-box continued odd truncation audit

This file keeps the raw odd-channel route unchanged and adds a separate
audit-only continued odd-channel ledger.  The point is to make the diagnostic
target explicit:

`rectangularOddCoreSum s positiveBoxN - continuedOddDirichletChannel s`.

No object here is promoted to the public positive-box certificate.
-/

namespace C2
namespace ContinuedQuartetAudit

noncomputable section

/-- Continued odd-channel truncation norm for a constant core cutoff. -/
noncomputable def continuedCoreOddTruncationNorm (N : ℕ) : ℂ → ℝ :=
  fun s =>
    ‖c2OddTruncationError
      continuedOddDirichletChannel (constantCoreCutoff N) s 0‖

/--
The selected continued odd-truncation norm is the finite odd-core sum against
`continuedOddDirichletChannel`, not the raw `oddDirichletChannel`.
-/
theorem positiveBox_continuedCoreOddTruncationNorm_eq_continuedOddChannel
    (s : ℂ) :
    continuedCoreOddTruncationNorm positiveBoxN s =
      ‖rectangularOddCoreSum s positiveBoxN -
        continuedOddDirichletChannel s‖ := by
  simp [continuedCoreOddTruncationNorm, c2OddTruncationError,
    constantCoreCutoff]

/-- Explicit raw odd-truncation data for the selected positive box. -/
structure PositiveBoxRawOddTruncationData : Prop where
  raw_odd_truncation_bound :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      ‖rectangularOddCoreSum s positiveBoxN - oddDirichletChannel s‖ ≤
        positiveBoxOddTruncationUpperValue

/--
The explicit raw data is exactly the old `PositiveBoxOddTruncationData`.
This conversion is audit-only naming, not a new analytic estimate.
-/
def PositiveBoxRawOddTruncationData.toOddTruncationData
    (data : PositiveBoxRawOddTruncationData) :
    PositiveBoxOddTruncationData :=
  PositiveBoxOddTruncationData.ofRawOddChannelBound
    data.raw_odd_truncation_bound

/-- The old odd-truncation package can be viewed as explicit raw data. -/
def PositiveBoxRawOddTruncationData.ofOddTruncationData
    (data : PositiveBoxOddTruncationData) :
    PositiveBoxRawOddTruncationData where
  raw_odd_truncation_bound := by
    intro s hs
    rw [← positiveBox_constantCoreOddTruncationNorm_eq_rawOddChannel]
    exact data.odd_truncation_bound hs

/-- Generic constant-cutoff identity for a supplied odd-channel reference. -/
theorem c2OddTruncationError_constantCoreCutoff
    (ZoddRef : ℂ → ℂ) (N : ℕ) (s : ℂ) (j : ℕ) :
    c2OddTruncationError ZoddRef (constantCoreCutoff N) s j =
      c2OddTruncationError ZoddRef (constantCoreCutoff N) s 0 := by
  simp [c2OddTruncationError, constantCoreCutoff]

/-- Continued horizontal layer defect, using the continued odd-channel target. -/
noncomputable def continuedOddHorizontalLayerDefect
    (coreCutoff : ℕ → ℕ) : ℂ → ℕ → ℂ :=
  c2ConcreteHorizontalLayerDefect continuedOddDirichletChannel coreCutoff

/-- Local horizontal-layer budget for the continued odd-channel audit. -/
structure ContinuedOddHorizontalLayerBudget
    (coreCutoff : ℕ → ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop where
  layer_bound : ∀ j : ℕ,
    ‖continuedOddHorizontalLayerDefect coreCutoff s j‖ ≤
      (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j

/-- Amplitude for the continued constant-cutoff q-ratio profile. -/
noncomputable def continuedCoreHorizontalAmplitudeQRatio
    (N : ℕ) : ℂ → ℝ :=
  fun s => 2 * ‖q s‖ ^ 2 * continuedCoreOddTruncationNorm N s

/-- Regularized horizontal upper for the continued q-ratio profile. -/
noncomputable def continuedCoreHorizontalUpperQRatio
    (N : ℕ) : ℂ → ℝ :=
  c2HorizontalRegularizedUpper
    (continuedCoreHorizontalAmplitudeQRatio N)
    unitScale
    qNormHorizontalRatio

theorem continuedCoreHorizontalAmplitudeQRatio_nonneg
    (N : ℕ) (s : ℂ) :
    0 ≤ continuedCoreHorizontalAmplitudeQRatio N s := by
  unfold continuedCoreHorizontalAmplitudeQRatio continuedCoreOddTruncationNorm
  positivity

/--
Layer budget for the continued constant-cutoff q-ratio profile.

This is deliberately a local continued analogue, because the public
`C2ExpandedHorizontalLayerBudget` is tied to `oddDirichletChannel`.
-/
theorem continuedCoreHorizontalLayerBudgetQRatio
    (N : ℕ) (s : ℂ) :
    ContinuedOddHorizontalLayerBudget
      (constantCoreCutoff N)
      (continuedCoreHorizontalAmplitudeQRatio N)
      unitScale
      qNormHorizontalRatio
      s := by
  refine ⟨?_⟩
  intro j
  unfold continuedOddHorizontalLayerDefect
  rw [c2ConcreteHorizontalLayerDefect_norm_eq]
  rw [c2OddTruncationError_constantCoreCutoff
    continuedOddDirichletChannel N s j]
  have hpow :
      ‖q s‖ ^ (j + 2) = ‖q s‖ ^ 2 * ‖q s‖ ^ j := by
    rw [show j + 2 = 2 + j by omega]
    rw [pow_add]
  apply le_of_eq
  calc
    2 * ‖q s‖ ^ (j + 2) *
        ‖c2OddTruncationError
          continuedOddDirichletChannel (constantCoreCutoff N) s 0‖ =
      (2 * ‖q s‖ ^ 2 *
          ‖c2OddTruncationError
            continuedOddDirichletChannel (constantCoreCutoff N) s 0‖) *
        ‖q s‖ ^ j := by
          rw [hpow]
          ring
    _ =
      (continuedCoreHorizontalAmplitudeQRatio N s / unitScale s) *
        qNormHorizontalRatio s ^ j := by
          simp [continuedCoreHorizontalAmplitudeQRatio,
            continuedCoreOddTruncationNorm, unitScale,
            qNormHorizontalRatio]

/-- The continued q-ratio horizontal upper is nonnegative on the selected box. -/
theorem positiveBox_continuedCoreHorizontalUpperQRatio_nonneg
    {s : ℂ} (hs : s ∈ positiveBox) :
    0 ≤ continuedCoreHorizontalUpperQRatio positiveBoxN s := by
  unfold continuedCoreHorizontalUpperQRatio c2HorizontalRegularizedUpper
    unitScale qNormHorizontalRatio
  have hq_lt : ‖q s‖ < 1 := positiveBox_q_norm_lt_one hs
  have hgap : 0 ≤ (1 - ‖q s‖)⁻¹ := by
    exact inv_nonneg.mpr (by linarith [norm_nonneg (q s), hq_lt])
  have hamp :
      0 ≤ continuedCoreHorizontalAmplitudeQRatio positiveBoxN s :=
    continuedCoreHorizontalAmplitudeQRatio_nonneg positiveBoxN s
  positivity

/-- Conditional continued odd-truncation data for the selected positive box. -/
structure PositiveBoxContinuedOddTruncationData : Prop where
  continued_odd_truncation_bound :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      ‖rectangularOddCoreSum s positiveBoxN -
        continuedOddDirichletChannel s‖ ≤
        positiveBoxOddTruncationUpperValue

/-- The continued data as a bound on `continuedCoreOddTruncationNorm`. -/
theorem PositiveBoxContinuedOddTruncationData.norm_bound
    (data : PositiveBoxContinuedOddTruncationData)
    {s : ℂ} (hs : s ∈ positiveBox) :
    continuedCoreOddTruncationNorm positiveBoxN s ≤
      positiveBoxOddTruncationUpperValue := by
  rw [positiveBox_continuedCoreOddTruncationNorm_eq_continuedOddChannel]
  exact data.continued_odd_truncation_bound hs

/-- Conditional horizontal upper data for the continued q-ratio ledger. -/
structure PositiveBoxContinuedHorizontalUpperData : Prop where
  continued_horizontal_upper :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      continuedCoreHorizontalUpperQRatio positiveBoxN s ≤
        positiveBoxHorizontalUpperValue

/--
A q upper and a continued odd-truncation upper imply the continued horizontal
q-ratio upper.
-/
def PositiveBoxContinuedHorizontalUpperData.ofContinuedOddTruncationAndQUpper
    (q_bounds :
      PositiveBoxQBounds positiveBoxQLowerCandidate positiveBoxQUpperCandidate)
    (odd_data : PositiveBoxContinuedOddTruncationData) :
    PositiveBoxContinuedHorizontalUpperData where
  continued_horizontal_upper := by
    intro s hs
    have hq' : ‖q s‖ ≤ positiveBoxQUpperCandidate :=
      q_bounds.q_norm_upper hs
    have hden_low : (7 : ℝ) / 10 ≤ 1 - ‖q s‖ := by
      norm_num [positiveBoxQUpperCandidate] at hq'
      linarith
    have hden_nonneg : 0 ≤ 1 - ‖q s‖ := by
      linarith
    have hinv_nonneg : 0 ≤ (1 - ‖q s‖)⁻¹ :=
      inv_nonneg.mpr hden_nonneg
    have hinv : (1 - ‖q s‖)⁻¹ ≤ (10 : ℝ) / 7 := by
      have htmp :=
        inv_anti₀ (show (0 : ℝ) < (7 / 10 : ℝ) by norm_num) hden_low
      norm_num at htmp ⊢
      exact htmp
    have hr2up : ‖q s‖ ^ 2 ≤ positiveBoxQUpperCandidate ^ 2 := by
      exact pow_le_pow_left₀ (norm_nonneg (q s)) hq' 2
    have hodd' := odd_data.norm_bound hs
    have hodd_nonneg :
        0 ≤ continuedCoreOddTruncationNorm positiveBoxN s := by
      unfold continuedCoreOddTruncationNorm
      exact norm_nonneg _
    have hmul1 :
        ‖q s‖ ^ 2 * continuedCoreOddTruncationNorm positiveBoxN s ≤
          positiveBoxQUpperCandidate ^ 2 *
            positiveBoxOddTruncationUpperValue := by
      exact mul_le_mul hr2up hodd' hodd_nonneg (by positivity)
    have htop :
        2 * ‖q s‖ ^ 2 *
            continuedCoreOddTruncationNorm positiveBoxN s ≤
          (7 : ℝ) / 1000 := by
      calc
        2 * ‖q s‖ ^ 2 *
              continuedCoreOddTruncationNorm positiveBoxN s
            = 2 * (‖q s‖ ^ 2 *
                continuedCoreOddTruncationNorm positiveBoxN s) := by
              ring
        _ ≤ 2 * (positiveBoxQUpperCandidate ^ 2 *
              positiveBoxOddTruncationUpperValue) := by
            exact mul_le_mul_of_nonneg_left hmul1 (by norm_num)
        _ = (7 : ℝ) / 1000 := by
            norm_num [positiveBoxQUpperCandidate,
              positiveBoxOddTruncationUpperValue]
    unfold continuedCoreHorizontalUpperQRatio c2HorizontalRegularizedUpper
      continuedCoreHorizontalAmplitudeQRatio unitScale qNormHorizontalRatio
    have htop_nonneg :
        0 ≤ 2 * ‖q s‖ ^ 2 *
          continuedCoreOddTruncationNorm positiveBoxN s := by
      positivity
    calc
      (2 * ‖q s‖ ^ 2 *
          continuedCoreOddTruncationNorm positiveBoxN s / 1) *
          (1 - ‖q s‖)⁻¹
          =
        (2 * ‖q s‖ ^ 2 *
          continuedCoreOddTruncationNorm positiveBoxN s) *
          (1 - ‖q s‖)⁻¹ := by
            ring
      _ ≤ ((7 : ℝ) / 1000) * ((10 : ℝ) / 7) := by
            exact mul_le_mul htop hinv hinv_nonneg (by norm_num)
      _ = positiveBoxHorizontalUpperValue := by
            norm_num [positiveBoxHorizontalUpperValue]

/--
Continued q-ratio tilt constant driven by abstract upper bounds for the
V-split pieces.
-/
noncomputable def vSplitTiltConstantContinuedQRatio
    (N : ℕ) (anchorUpper cutUpper : ℂ → ℝ) : ℂ → ℝ :=
  fun s =>
    ((anchorUpper s + cutUpper s) +
      continuedCoreHorizontalUpperQRatio N s) *
      (1 + ‖q s‖)

/-- Residual upper for the continued q-ratio profile. -/
noncomputable def vSplitResidualUpperContinuedQRatio
    (N : ℕ) (anchorUpper cutUpper : ℂ → ℝ) : ℂ → ℝ :=
  c2ExpandedQuartetResidualUpper
    (vSplitTiltConstantContinuedQRatio N anchorUpper cutUpper) unitScale
    (continuedCoreHorizontalAmplitudeQRatio N) unitScale qNormHorizontalRatio
    cutUpper unitScale

/-- Closed form of the continued audit q-ratio V-split residual ledger. -/
noncomputable def vSplitResidualLedgerContinuedQRatio
    (N : ℕ) (anchorUpper cutUpper : ℂ → ℝ) : ℂ → ℝ :=
  fun s =>
    (((anchorUpper s + cutUpper s) +
        continuedCoreHorizontalUpperQRatio N s) *
      (1 + ‖q s‖)) *
      (1 - ‖q s‖)⁻¹ +
    continuedCoreHorizontalUpperQRatio N s +
    cutUpper s

theorem vSplitResidualUpperContinuedQRatio_eq_ledger
    (N : ℕ) (anchorUpper cutUpper : ℂ → ℝ) (s : ℂ) :
    vSplitResidualUpperContinuedQRatio N anchorUpper cutUpper s =
      vSplitResidualLedgerContinuedQRatio N anchorUpper cutUpper s := by
  simp [vSplitResidualUpperContinuedQRatio,
    vSplitResidualLedgerContinuedQRatio,
    vSplitTiltConstantContinuedQRatio,
    continuedCoreHorizontalUpperQRatio,
    c2ExpandedQuartetResidualUpper, c2TiltAnalyticRegularizedUpper,
    c2TiltRegularizedUpper, c2TiltAnalyticRatio,
    c2HorizontalRegularizedUpper, c2CutoffUpperFromScale,
    unitScale, qNormHorizontalRatio]

/-- Reduced data needed to prove the continued positive-box q-ratio ledger. -/
structure PositiveBoxContinuedLedgerBounds : Prop where
  q_bounds :
    PositiveBoxQBounds positiveBoxQLowerCandidate positiveBoxQUpperCandidate
  continued_horizontal_upper : PositiveBoxContinuedHorizontalUpperData

/-- Short constructor for the selected continued positive-box ledger bounds. -/
def PositiveBoxContinuedLedgerBounds.ofQAndContinuedHorizontal
    (q_lower :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        positiveBoxQLowerCandidate ≤ ‖q s‖)
    (q_upper :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        ‖q s‖ ≤ positiveBoxQUpperCandidate)
    (continued_horizontal_upper :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        continuedCoreHorizontalUpperQRatio positiveBoxN s ≤
          positiveBoxHorizontalUpperValue) :
    PositiveBoxContinuedLedgerBounds where
  q_bounds := {
    q_norm_lower := q_lower
    q_norm_upper := q_upper
    q_norm_lt_one := positiveBoxQUpperCandidate_lt_one }
  continued_horizontal_upper := {
    continued_horizontal_upper := continued_horizontal_upper }

/--
Endpoint q-data plus continued odd-truncation data produce the continued
ledger bounds.
-/
def PositiveBoxContinuedLedgerBounds.ofEndpointQAndContinuedOddTruncation
    (q_endpoint : PositiveBoxQEndpointData)
    (odd_data : PositiveBoxContinuedOddTruncationData) :
    PositiveBoxContinuedLedgerBounds where
  q_bounds := PositiveBoxQBounds.ofEndpointData q_endpoint
  continued_horizontal_upper :=
    PositiveBoxContinuedHorizontalUpperData.ofContinuedOddTruncationAndQUpper
      (PositiveBoxQBounds.ofEndpointData q_endpoint) odd_data

/--
The continued positive-box scalar ledger follows from q bounds and the
continued horizontal upper.  This is a parallel audit ledger; it does not close
the raw `PositiveBoxOddTruncationData` field.
-/
theorem PositiveBoxContinuedLedgerBounds.ledger_strict
    (data : PositiveBoxContinuedLedgerBounds)
    {s : ℂ} (hs : s ∈ positiveBox) :
    vSplitResidualLedgerContinuedQRatio
        positiveBoxN positiveBoxAnchorUpper positiveBoxCutUpper s <
      c2ExpandedQuartetSectorResidualMargin positiveBoxSectorLower s := by
  have hHnonneg :
      0 ≤ continuedCoreHorizontalUpperQRatio positiveBoxN s :=
    positiveBox_continuedCoreHorizontalUpperQRatio_nonneg hs
  have hstrict :=
    positiveBoxLedger_real_strict
      (r := ‖q s‖)
      (H := continuedCoreHorizontalUpperQRatio positiveBoxN s)
      (data.q_bounds.q_norm_lower hs)
      (data.q_bounds.q_norm_upper hs)
      hHnonneg
      (data.continued_horizontal_upper.continued_horizontal_upper hs)
  simpa [vSplitResidualLedgerContinuedQRatio,
    c2ExpandedQuartetSectorResidualMargin, c2QuartetVerticalTailUpper,
    positiveBoxAnchorUpper, positiveBoxCutUpper, positiveBoxSectorLower]
    using hstrict

/-- Direct continued ledger theorem from q endpoint data and continued odd data. -/
theorem positiveBox_continued_ledger_strict_ofEndpointQAndContinuedOddTruncation
    (q_endpoint : PositiveBoxQEndpointData)
    (odd_data : PositiveBoxContinuedOddTruncationData)
    {s : ℂ} (hs : s ∈ positiveBox) :
    vSplitResidualLedgerContinuedQRatio
        positiveBoxN positiveBoxAnchorUpper positiveBoxCutUpper s <
      c2ExpandedQuartetSectorResidualMargin positiveBoxSectorLower s :=
  (PositiveBoxContinuedLedgerBounds.ofEndpointQAndContinuedOddTruncation
    q_endpoint odd_data).ledger_strict hs

/--
After the endpoint numerics already closed in the positive-box audit, the
continued scalar ledger is conditional only on the continued odd-truncation
upper.
-/
theorem positiveBox_continued_ledger_strict_ofContinuedOddTruncation
    (odd_data : PositiveBoxContinuedOddTruncationData)
    {s : ℂ} (hs : s ∈ positiveBox) :
    vSplitResidualLedgerContinuedQRatio
        positiveBoxN positiveBoxAnchorUpper positiveBoxCutUpper s <
      c2ExpandedQuartetSectorResidualMargin positiveBoxSectorLower s :=
  positiveBox_continued_ledger_strict_ofEndpointQAndContinuedOddTruncation
    positiveBoxQEndpointData odd_data hs

end

end ContinuedQuartetAudit
end C2
