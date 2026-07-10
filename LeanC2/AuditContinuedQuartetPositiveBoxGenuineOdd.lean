import LeanC2.AuditContinuedQuartetPositiveBoxInterval

/-!
# Positive-box abstract odd reference audit

ROUTE_TAG: AUDIT_SHIM
ROUTE_TAG: OPTIONAL_REFINEMENT

This file adds an audit-only odd-reference interface for the positive box.
The reference is supplied as data, and the local q-ratio ledger is rebuilt
against that reference.
-/

namespace C2
namespace ContinuedQuartetAudit

noncomputable section

/-- Abstract odd reference for a future genuine continuation argument. -/
structure GenuineOddContinuationData where
  oddRef : ℂ → ℂ
  agrees_on_one_lt :
    ∀ s : ℂ, 1 < s.re → oddRef s = oddDirichletChannel s

/-- Odd-reference truncation norm at a finite odd-core width. -/
noncomputable def positiveBoxOddRefTruncationNorm
    (oddRef : ℂ → ℂ) (N : ℕ) : ℂ → ℝ :=
  fun s => ‖rectangularOddCoreSum s N - oddRef s‖

/-- Positive-box truncation data against an abstract odd reference. -/
structure PositiveBoxOddRefTruncationData
    (oddRef : ℂ → ℂ) : Prop where
  oddRef_truncation_bound :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      positiveBoxOddRefTruncationNorm oddRef positiveBoxN s ≤
        positiveBoxOddTruncationUpperValue

/-- Horizontal layer defect against the abstract odd reference. -/
noncomputable def oddRefHorizontalLayerDefect
    (oddRef : ℂ → ℂ) (N : ℕ) : ℂ → ℕ → ℂ :=
  c2ConcreteHorizontalLayerDefect oddRef (fun _ : ℕ => N)

/-- Local horizontal-layer budget against the abstract odd reference. -/
structure OddRefHorizontalLayerBudget
    (oddRef : ℂ → ℂ) (N : ℕ)
    (horizontalBudget horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop where
  layer_bound : ∀ j : ℕ,
    ‖oddRefHorizontalLayerDefect oddRef N s j‖ ≤
      (horizontalBudget s / horizontalScale s) * horizontalRatio s ^ j

/-- q-ratio amplitude for the abstract odd-reference profile. -/
noncomputable def oddRefCoreHorizontalAmplitudeQRatio
    (oddRef : ℂ → ℂ) (N : ℕ) : ℂ → ℝ :=
  fun s => 2 * ‖q s‖ ^ 2 * positiveBoxOddRefTruncationNorm oddRef N s

/-- Regularized q-ratio upper for the abstract odd-reference profile. -/
noncomputable def oddRefCoreHorizontalUpperQRatio
    (oddRef : ℂ → ℂ) (N : ℕ) : ℂ → ℝ :=
  c2HorizontalRegularizedUpper
    (oddRefCoreHorizontalAmplitudeQRatio oddRef N)
    unitScale
    qNormHorizontalRatio

theorem oddRefCoreHorizontalAmplitudeQRatio_nonneg
    (oddRef : ℂ → ℂ) (N : ℕ) (s : ℂ) :
    0 ≤ oddRefCoreHorizontalAmplitudeQRatio oddRef N s := by
  unfold oddRefCoreHorizontalAmplitudeQRatio
    positiveBoxOddRefTruncationNorm
  positivity

/-- q-ratio layer budget for the abstract odd-reference profile. -/
theorem oddRefHorizontalLayerBudgetQRatio
    (oddRef : ℂ → ℂ) (N : ℕ) (s : ℂ) :
    OddRefHorizontalLayerBudget
      oddRef N
      (oddRefCoreHorizontalAmplitudeQRatio oddRef N)
      unitScale
      qNormHorizontalRatio
      s := by
  refine ⟨?_⟩
  intro j
  unfold oddRefHorizontalLayerDefect
  rw [c2ConcreteHorizontalLayerDefect_norm_eq]
  have herr :
      ‖c2OddTruncationError oddRef (fun _ : ℕ => N) s j‖ =
        positiveBoxOddRefTruncationNorm oddRef N s := by
    simp [positiveBoxOddRefTruncationNorm, c2OddTruncationError]
  rw [herr]
  have hpow :
      ‖q s‖ ^ (j + 2) = ‖q s‖ ^ 2 * ‖q s‖ ^ j := by
    rw [show j + 2 = 2 + j by omega]
    rw [pow_add]
  apply le_of_eq
  calc
    2 * ‖q s‖ ^ (j + 2) *
        positiveBoxOddRefTruncationNorm oddRef N s =
      (2 * ‖q s‖ ^ 2 *
          positiveBoxOddRefTruncationNorm oddRef N s) *
        ‖q s‖ ^ j := by
          rw [hpow]
          ring
    _ =
      (oddRefCoreHorizontalAmplitudeQRatio oddRef N s / unitScale s) *
        qNormHorizontalRatio s ^ j := by
          simp [oddRefCoreHorizontalAmplitudeQRatio,
            positiveBoxOddRefTruncationNorm, unitScale,
            qNormHorizontalRatio]

/-- The abstract odd-reference q-ratio upper is nonnegative on the box. -/
theorem positiveBox_oddRefCoreHorizontalUpperQRatio_nonneg
    (oddRef : ℂ → ℂ) {s : ℂ} (hs : s ∈ positiveBox) :
    0 ≤ oddRefCoreHorizontalUpperQRatio oddRef positiveBoxN s := by
  unfold oddRefCoreHorizontalUpperQRatio c2HorizontalRegularizedUpper
    unitScale qNormHorizontalRatio
  have hq_lt : ‖q s‖ < 1 := positiveBox_q_norm_lt_one hs
  have hgap : 0 ≤ (1 - ‖q s‖)⁻¹ := by
    exact inv_nonneg.mpr (by linarith [norm_nonneg (q s), hq_lt])
  have hamp :
      0 ≤ oddRefCoreHorizontalAmplitudeQRatio oddRef positiveBoxN s :=
    oddRefCoreHorizontalAmplitudeQRatio_nonneg oddRef positiveBoxN s
  positivity

/-- Positive-box horizontal upper data against an abstract odd reference. -/
structure PositiveBoxOddRefHorizontalUpperData
    (oddRef : ℂ → ℂ) : Prop where
  oddRef_horizontal_upper :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      oddRefCoreHorizontalUpperQRatio oddRef positiveBoxN s ≤
        positiveBoxHorizontalUpperValue

/--
An abstract odd-reference truncation bound and the closed q bracket imply the
horizontal q-ratio upper used by the positive-box scalar ledger.
-/
def PositiveBoxOddRefHorizontalUpperData.ofOddRefTruncationAndQUpper
    {oddRef : ℂ → ℂ}
    (q_bounds :
      PositiveBoxQBounds positiveBoxQLowerCandidate positiveBoxQUpperCandidate)
    (odd_data : PositiveBoxOddRefTruncationData oddRef) :
    PositiveBoxOddRefHorizontalUpperData oddRef where
  oddRef_horizontal_upper := by
    intro s hs
    have hq' : ‖q s‖ ≤ positiveBoxQUpperCandidate :=
      q_bounds.q_norm_upper (s := s) hs
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
    have hodd' :
        positiveBoxOddRefTruncationNorm oddRef positiveBoxN s ≤
          positiveBoxOddTruncationUpperValue :=
      odd_data.oddRef_truncation_bound (s := s) hs
    have hodd_nonneg :
        0 ≤ positiveBoxOddRefTruncationNorm oddRef positiveBoxN s := by
      unfold positiveBoxOddRefTruncationNorm
      exact norm_nonneg _
    have hmul1 :
        ‖q s‖ ^ 2 * positiveBoxOddRefTruncationNorm oddRef positiveBoxN s ≤
          positiveBoxQUpperCandidate ^ 2 *
            positiveBoxOddTruncationUpperValue := by
      exact mul_le_mul hr2up hodd' hodd_nonneg (by positivity)
    have htop :
        2 * ‖q s‖ ^ 2 *
            positiveBoxOddRefTruncationNorm oddRef positiveBoxN s ≤
          (7 : ℝ) / 1000 := by
      calc
        2 * ‖q s‖ ^ 2 *
              positiveBoxOddRefTruncationNorm oddRef positiveBoxN s
            = 2 * (‖q s‖ ^ 2 *
                positiveBoxOddRefTruncationNorm oddRef positiveBoxN s) := by
              ring
        _ ≤ 2 * (positiveBoxQUpperCandidate ^ 2 *
              positiveBoxOddTruncationUpperValue) := by
            exact mul_le_mul_of_nonneg_left hmul1 (by norm_num)
        _ = (7 : ℝ) / 1000 := by
            norm_num [positiveBoxQUpperCandidate,
              positiveBoxOddTruncationUpperValue]
    unfold oddRefCoreHorizontalUpperQRatio c2HorizontalRegularizedUpper
      oddRefCoreHorizontalAmplitudeQRatio unitScale qNormHorizontalRatio
    have htop_nonneg :
        0 ≤ 2 * ‖q s‖ ^ 2 *
          positiveBoxOddRefTruncationNorm oddRef positiveBoxN s := by
      positivity
    calc
      (2 * ‖q s‖ ^ 2 *
          positiveBoxOddRefTruncationNorm oddRef positiveBoxN s / 1) *
          (1 - ‖q s‖)⁻¹
          =
        (2 * ‖q s‖ ^ 2 *
          positiveBoxOddRefTruncationNorm oddRef positiveBoxN s) *
          (1 - ‖q s‖)⁻¹ := by
            ring
      _ ≤ ((7 : ℝ) / 1000) * ((10 : ℝ) / 7) := by
            exact mul_le_mul htop hinv hinv_nonneg (by norm_num)
      _ = positiveBoxHorizontalUpperValue := by
            norm_num [positiveBoxHorizontalUpperValue]

/-- q-ratio tilt upper using the abstract odd-reference horizontal upper. -/
noncomputable def vSplitTiltOddRefQRatio
    (oddRef : ℂ → ℂ) (N : ℕ)
    (anchorUpper cutUpper : ℂ → ℝ) : ℂ → ℝ :=
  fun s =>
    ((anchorUpper s + cutUpper s) +
      oddRefCoreHorizontalUpperQRatio oddRef N s) *
      (1 + ‖q s‖)

/-- Residual upper using the abstract odd-reference q-ratio profile. -/
noncomputable def vSplitResidualUpperOddRefQRatio
    (oddRef : ℂ → ℂ) (N : ℕ)
    (anchorUpper cutUpper : ℂ → ℝ) : ℂ → ℝ :=
  c2ExpandedQuartetResidualUpper
    (vSplitTiltOddRefQRatio oddRef N anchorUpper cutUpper) unitScale
    (oddRefCoreHorizontalAmplitudeQRatio oddRef N) unitScale
    qNormHorizontalRatio
    cutUpper unitScale

/-- Closed scalar ledger for the abstract odd-reference q-ratio profile. -/
noncomputable def vSplitResidualLedgerOddRefQRatio
    (oddRef : ℂ → ℂ) (N : ℕ)
    (anchorUpper cutUpper : ℂ → ℝ) : ℂ → ℝ :=
  fun s =>
    (((anchorUpper s + cutUpper s) +
        oddRefCoreHorizontalUpperQRatio oddRef N s) *
      (1 + ‖q s‖)) *
      (1 - ‖q s‖)⁻¹ +
    oddRefCoreHorizontalUpperQRatio oddRef N s +
    cutUpper s

theorem vSplitResidualUpperOddRefQRatio_eq_ledger
    (oddRef : ℂ → ℂ) (N : ℕ)
    (anchorUpper cutUpper : ℂ → ℝ) (s : ℂ) :
    vSplitResidualUpperOddRefQRatio oddRef N anchorUpper cutUpper s =
      vSplitResidualLedgerOddRefQRatio oddRef N anchorUpper cutUpper s := by
  simp [vSplitResidualUpperOddRefQRatio,
    vSplitResidualLedgerOddRefQRatio,
    vSplitTiltOddRefQRatio,
    oddRefCoreHorizontalUpperQRatio,
    c2ExpandedQuartetResidualUpper, c2TiltAnalyticRegularizedUpper,
    c2TiltRegularizedUpper, c2TiltAnalyticRatio,
    c2HorizontalRegularizedUpper, c2CutoffUpperFromScale,
    unitScale, qNormHorizontalRatio]

/-- Reduced ledger data for the abstract odd-reference profile. -/
structure PositiveBoxOddRefLedgerBounds
    (oddRef : ℂ → ℂ) : Prop where
  q_bounds :
    PositiveBoxQBounds positiveBoxQLowerCandidate positiveBoxQUpperCandidate
  oddRef_horizontal_upper : PositiveBoxOddRefHorizontalUpperData oddRef

/-- q bounds and abstract odd-reference horizontal data give ledger data. -/
def PositiveBoxOddRefLedgerBounds.ofQAndOddRefHorizontal
    {oddRef : ℂ → ℂ}
    (q_lower :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        positiveBoxQLowerCandidate ≤ ‖q s‖)
    (q_upper :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        ‖q s‖ ≤ positiveBoxQUpperCandidate)
    (oddRef_horizontal_upper :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        oddRefCoreHorizontalUpperQRatio oddRef positiveBoxN s ≤
          positiveBoxHorizontalUpperValue) :
    PositiveBoxOddRefLedgerBounds oddRef where
  q_bounds := {
    q_norm_lower := q_lower
    q_norm_upper := q_upper
    q_norm_lt_one := positiveBoxQUpperCandidate_lt_one }
  oddRef_horizontal_upper := {
    oddRef_horizontal_upper := oddRef_horizontal_upper }

/-- Closed q bounds plus odd-reference truncation data give ledger data. -/
def PositiveBoxOddRefLedgerBounds.ofOddRefTruncation
    {oddRef : ℂ → ℂ}
    (odd_data : PositiveBoxOddRefTruncationData oddRef) :
    PositiveBoxOddRefLedgerBounds oddRef where
  q_bounds := positiveBoxQBounds
  oddRef_horizontal_upper :=
    PositiveBoxOddRefHorizontalUpperData.ofOddRefTruncationAndQUpper
      positiveBoxQBounds odd_data

/-- Scalar ledger strictness for the abstract odd-reference profile. -/
theorem PositiveBoxOddRefLedgerBounds.ledger_strict
    {oddRef : ℂ → ℂ}
    (data : PositiveBoxOddRefLedgerBounds oddRef)
    {s : ℂ} (hs : s ∈ positiveBox) :
    vSplitResidualLedgerOddRefQRatio
        oddRef positiveBoxN positiveBoxAnchorUpper positiveBoxCutUpper s <
      c2ExpandedQuartetSectorResidualMargin positiveBoxSectorLower s := by
  have hHnonneg :
      0 ≤ oddRefCoreHorizontalUpperQRatio oddRef positiveBoxN s :=
    positiveBox_oddRefCoreHorizontalUpperQRatio_nonneg oddRef hs
  have hstrict :=
    positiveBoxLedger_real_strict
      (r := ‖q s‖)
      (H := oddRefCoreHorizontalUpperQRatio oddRef positiveBoxN s)
      (data.q_bounds.q_norm_lower (s := s) hs)
      (data.q_bounds.q_norm_upper (s := s) hs)
      hHnonneg
      (data.oddRef_horizontal_upper.oddRef_horizontal_upper (s := s) hs)
  simpa [vSplitResidualLedgerOddRefQRatio,
    c2ExpandedQuartetSectorResidualMargin, c2QuartetVerticalTailUpper,
    positiveBoxAnchorUpper, positiveBoxCutUpper, positiveBoxSectorLower]
    using hstrict

/-- Direct scalar ledger from abstract odd-reference truncation data. -/
theorem positiveBox_ledger_strict_ofOddRefTruncation
    {oddRef : ℂ → ℂ}
    (odd_data : PositiveBoxOddRefTruncationData oddRef)
    {s : ℂ} (hs : s ∈ positiveBox) :
    vSplitResidualLedgerOddRefQRatio
        oddRef positiveBoxN positiveBoxAnchorUpper positiveBoxCutUpper s <
      c2ExpandedQuartetSectorResidualMargin positiveBoxSectorLower s :=
  (PositiveBoxOddRefLedgerBounds.ofOddRefTruncation odd_data).ledger_strict hs

/-- Audit certificate for the positive box against an abstract odd reference. -/
structure PositiveBoxOddRefAuditCertificate
    (oddRef : ℂ → ℂ) : Prop where
  anchor_bound :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      ‖anchor s‖ ≤ positiveBoxAnchorUpperValue
  cut_bound :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      ‖cutVec positiveBoxK positiveBoxM s‖ ≤ positiveBoxCutUpperValue
  sector_lower :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      positiveBoxSectorLowerValue ≤ ‖verticalQuartetPrefix (q s)‖
  ledger_strict :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      vSplitResidualLedgerOddRefQRatio
          oddRef positiveBoxN positiveBoxAnchorUpper positiveBoxCutUpper s <
        c2ExpandedQuartetSectorResidualMargin positiveBoxSectorLower s

/-- Build the abstract odd-reference audit certificate from the reduced fields. -/
def PositiveBoxOddRefAuditCertificate.ofOddRefTruncationAndAnalyticBounds
    (data : GenuineOddContinuationData)
    (odd_data : PositiveBoxOddRefTruncationData data.oddRef)
    (anchor_bound :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        ‖anchor s‖ ≤ positiveBoxAnchorUpperValue)
    (cut_bound :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        ‖cutVec positiveBoxK positiveBoxM s‖ ≤ positiveBoxCutUpperValue)
    (sector_lower :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        positiveBoxSectorLowerValue ≤ ‖verticalQuartetPrefix (q s)‖) :
    PositiveBoxOddRefAuditCertificate data.oddRef where
  anchor_bound := anchor_bound
  cut_bound := cut_bound
  sector_lower := sector_lower
  ledger_strict := by
    intro s hs
    exact positiveBox_ledger_strict_ofOddRefTruncation odd_data hs

/--
Compatibility wrapper with the positive-box namespace.  The result is the
audit-only odd-reference certificate above, not the public raw certificate.
-/
def PositiveBoxCertificate.ofOddRefTruncationAndAnalyticBounds
    (data : GenuineOddContinuationData)
    (odd_data : PositiveBoxOddRefTruncationData data.oddRef)
    (anchor_bound :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        ‖anchor s‖ ≤ positiveBoxAnchorUpperValue)
    (cut_bound :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        ‖cutVec positiveBoxK positiveBoxM s‖ ≤ positiveBoxCutUpperValue)
    (sector_lower :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        positiveBoxSectorLowerValue ≤ ‖verticalQuartetPrefix (q s)‖) :
    PositiveBoxOddRefAuditCertificate data.oddRef :=
  PositiveBoxOddRefAuditCertificate.ofOddRefTruncationAndAnalyticBounds
    data odd_data anchor_bound cut_bound sector_lower

/-- Sector residual dominance statement for an abstract odd reference. -/
def PositiveBoxOddRefSectorResidualDominance
    (oddRef : ℂ → ℂ) (s : ℂ) : Prop :=
  C2ExpandedQuartetSectorResidualDominance
    positiveBoxSectorLower
    (vSplitTiltOddRefQRatio
      oddRef positiveBoxN positiveBoxAnchorUpper positiveBoxCutUpper)
    unitScale
    (oddRefCoreHorizontalAmplitudeQRatio oddRef positiveBoxN)
    unitScale qNormHorizontalRatio
    positiveBoxCutUpper unitScale s

/-- Audit-only sector residual dominance from an odd-reference certificate. -/
theorem PositiveBoxOddRefAuditCertificate.sectorResidualDominance
    {oddRef : ℂ → ℂ}
    (cert : PositiveBoxOddRefAuditCertificate oddRef)
    {s : ℂ} (hs : s ∈ positiveBox) :
    PositiveBoxOddRefSectorResidualDominance oddRef s := by
  unfold PositiveBoxOddRefSectorResidualDominance
    C2ExpandedQuartetSectorResidualDominance
  change
    vSplitResidualUpperOddRefQRatio
        oddRef positiveBoxN positiveBoxAnchorUpper positiveBoxCutUpper s <
      c2ExpandedQuartetSectorResidualMargin positiveBoxSectorLower s
  rw [vSplitResidualUpperOddRefQRatio_eq_ledger]
  exact cert.ledger_strict hs

/-- True-prefix residual statement from an odd-reference audit certificate. -/
theorem PositiveBoxOddRefAuditCertificate.truePrefixResidualDominance
    {oddRef : ℂ → ℂ}
    (cert : PositiveBoxOddRefAuditCertificate oddRef)
    {s : ℂ} (hs : s ∈ positiveBox) :
    c2ExpandedQuartetResidualUpper
        (vSplitTiltOddRefQRatio
          oddRef positiveBoxN positiveBoxAnchorUpper positiveBoxCutUpper)
        unitScale
        (oddRefCoreHorizontalAmplitudeQRatio oddRef positiveBoxN)
        unitScale qNormHorizontalRatio
        positiveBoxCutUpper unitScale s <
      ‖c2QuartetBulkK2 s * verticalQuartetPrefix (q s)‖ -
        c2QuartetVerticalTailUpper s := by
  exact truePrefixResidualDominance_of_sectorResidualDominance
    (by
      unfold QuartetPrefixSectorLower positiveBoxSectorLower
      exact cert.sector_lower hs)
    (cert.sectorResidualDominance hs)

end

end ContinuedQuartetAudit
end C2
