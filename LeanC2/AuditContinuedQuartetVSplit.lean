import LeanC2.AuditContinuedQuartetQRatio

/-!
# Continued quartet V-split audit

This file is audit-only.  It keeps the q-ratio horizontal profile as the
baseline and opens the continued vertical residual into the two pieces suggested
by the diagnostic scanner:

* `anchor s = verticalDepthTailFromTwo s - continuedCentralOddChannel s`
* `cutVec K M s = rectangularGenuine s K M - continuedCentralOddChannel s`
* `vSplit K M s = anchor s + cutVec K M s`

No route is promoted here; the lemmas below only prepare conditional APIs for
later analytic bounds on `anchor`, `cutVec`, and sectorial quartet margins.
-/

namespace C2
namespace ContinuedQuartetAudit

/-- Continued vertical anchor after peeling off one central channel. -/
noncomputable def anchor : ℂ → ℂ :=
  fun s => verticalDepthTailFromTwo s - continuedCentralOddChannel s

/-- Rectangular cutoff vector against the same continued central channel. -/
noncomputable def cutVec (K M : ℕ) : ℂ → ℂ :=
  fun s => rectangularGenuine s K M - continuedCentralOddChannel s

/-- Two-piece split of the continued vertical residual. -/
noncomputable def vSplit (K M : ℕ) : ℂ → ℂ :=
  fun s => anchor s + cutVec K M s

theorem anchor_eq_continuedVerticalChannelAnchor (s : ℂ) :
    anchor s = continuedVerticalChannelAnchor s := by
  rfl

theorem cutVec_eq_continuedCutoffError
    (K M : ℕ) (s : ℂ) :
    cutVec K M s =
      c2ConcreteCutoffErrorFromTarget continuedCentralOddChannel K M s := by
  unfold cutVec c2ConcreteCutoffErrorFromTarget c2RectangularGenuineOperator
  rfl

/-- Reusable exact identity for the diagnostic split. -/
theorem c2ContinuedVerticalResidual_eq_vSplit
    (K M : ℕ) (s : ℂ) :
    c2ScaledSeededExplicitOddTailContinuedVerticalResidual K M s =
      vSplit K M s := by
  unfold c2ScaledSeededExplicitOddTailContinuedVerticalResidual
    vSplit anchor cutVec
  ring

theorem c2ContinuedVerticalResidual_eq_anchor_add_cutVec
    (K M : ℕ) (s : ℂ) :
    c2ScaledSeededExplicitOddTailContinuedVerticalResidual K M s =
      anchor s + cutVec K M s := by
  simpa [vSplit] using c2ContinuedVerticalResidual_eq_vSplit K M s

theorem vSplit_norm_le_anchorUpper_add_cutUpper
    {anchorUpper cutUpper : ℂ → ℝ} {K M : ℕ} {s : ℂ}
    (hanchor : ‖anchor s‖ ≤ anchorUpper s)
    (hcut : ‖cutVec K M s‖ ≤ cutUpper s) :
    ‖vSplit K M s‖ ≤ anchorUpper s + cutUpper s := by
  exact le_trans (by
    unfold vSplit
    exact norm_add_le _ _) (add_le_add hanchor hcut)

theorem c2ContinuedVerticalResidualExactUpper_le_vSplitUpper
    {anchorUpper cutUpper : ℂ → ℝ} {K M : ℕ} {s : ℂ}
    (hanchor : ‖anchor s‖ ≤ anchorUpper s)
    (hcut : ‖cutVec K M s‖ ≤ cutUpper s) :
    c2ContinuedVerticalResidualExactUpper K M s ≤
      anchorUpper s + cutUpper s := by
  unfold c2ContinuedVerticalResidualExactUpper
  rw [c2ContinuedVerticalResidual_eq_vSplit]
  exact vSplit_norm_le_anchorUpper_add_cutUpper hanchor hcut

/--
Q-ratio tilt constant driven by abstract upper bounds for the V-split pieces.
The expression mirrors the diagnostic ledger:
`(anchorUpper + cutUpper + H) * (1 + ‖q‖)`.
-/
noncomputable def vSplitTiltConstantQRatio
    (N : ℕ) (anchorUpper cutUpper : ℂ → ℝ) : ℂ → ℝ :=
  fun s =>
    ((anchorUpper s + cutUpper s) +
      constantCoreHorizontalUpperQRatio N s) *
      (1 + ‖q s‖)

/-- Residual upper for the q-ratio profile using abstract V-split uppers. -/
noncomputable def vSplitResidualUpperQRatio
    (N : ℕ) (anchorUpper cutUpper : ℂ → ℝ) : ℂ → ℝ :=
  c2ExpandedQuartetResidualUpper
    (vSplitTiltConstantQRatio N anchorUpper cutUpper) unitScale
    (constantCoreHorizontalAmplitudeQRatio N) unitScale qNormHorizontalRatio
    cutUpper unitScale

/-- Closed form of the audit q-ratio V-split residual ledger. -/
noncomputable def vSplitResidualLedgerQRatio
    (N : ℕ) (anchorUpper cutUpper : ℂ → ℝ) : ℂ → ℝ :=
  fun s =>
    (((anchorUpper s + cutUpper s) +
        constantCoreHorizontalUpperQRatio N s) *
      (1 + ‖q s‖)) *
      (1 - ‖q s‖)⁻¹ +
    constantCoreHorizontalUpperQRatio N s +
    cutUpper s

theorem vSplitResidualUpperQRatio_eq_ledger
    (N : ℕ) (anchorUpper cutUpper : ℂ → ℝ) (s : ℂ) :
    vSplitResidualUpperQRatio N anchorUpper cutUpper s =
      vSplitResidualLedgerQRatio N anchorUpper cutUpper s := by
  simp [vSplitResidualUpperQRatio, vSplitResidualLedgerQRatio,
    vSplitTiltConstantQRatio, constantCoreHorizontalUpperQRatio,
    c2ExpandedQuartetResidualUpper, c2TiltAnalyticRegularizedUpper,
    c2TiltRegularizedUpper, c2TiltAnalyticRatio,
    c2HorizontalRegularizedUpper, c2CutoffUpperFromScale,
    unitScale, qNormHorizontalRatio]

/--
Conditional q-ratio V-split quartet dominance.

The hypotheses `hanchor` and `hcut` certify that the abstract budgets really
control the exact vertical residual split; the strict ledger inequality is the
remaining scalar audit obligation.
-/
theorem vSplitQRatio_quartetDominance_of_ledger
    {N K M : ℕ} {anchorUpper cutUpper : ℂ → ℝ} {s : ℂ}
    (hanchor : ‖anchor s‖ ≤ anchorUpper s)
    (hcut : ‖cutVec K M s‖ ≤ cutUpper s)
    (hledger :
      vSplitResidualLedgerQRatio N anchorUpper cutUpper s <
        c2ExpandedQuartetResidualMargin s) :
    C2ExpandedQuartetDominance
      (vSplitTiltConstantQRatio N anchorUpper cutUpper) unitScale
      (constantCoreHorizontalAmplitudeQRatio N) unitScale qNormHorizontalRatio
      cutUpper unitScale s := by
  have _hvertical :
      c2ContinuedVerticalResidualExactUpper K M s ≤
        anchorUpper s + cutUpper s :=
    c2ContinuedVerticalResidualExactUpper_le_vSplitUpper hanchor hcut
  exact c2ExpandedQuartetDominance_of_residualBound
    (by
      change vSplitResidualUpperQRatio N anchorUpper cutUpper s <
        c2ExpandedQuartetResidualMargin s
      rw [vSplitResidualUpperQRatio_eq_ledger]
      exact hledger)

/--
Same conditional dominance with the residual upper name exposed instead of the
closed ledger.
-/
theorem vSplitQRatio_quartetDominance_of_residualUpper
    {N K M : ℕ} {anchorUpper cutUpper : ℂ → ℝ} {s : ℂ}
    (hanchor : ‖anchor s‖ ≤ anchorUpper s)
    (hcut : ‖cutVec K M s‖ ≤ cutUpper s)
    (hresidual :
      vSplitResidualUpperQRatio N anchorUpper cutUpper s <
        c2ExpandedQuartetResidualMargin s) :
    C2ExpandedQuartetDominance
      (vSplitTiltConstantQRatio N anchorUpper cutUpper) unitScale
      (constantCoreHorizontalAmplitudeQRatio N) unitScale qNormHorizontalRatio
      cutUpper unitScale s := by
  apply vSplitQRatio_quartetDominance_of_ledger
    (N := N) (K := K) (M := M)
    (anchorUpper := anchorUpper) (cutUpper := cutUpper)
    hanchor hcut
  rw [← vSplitResidualUpperQRatio_eq_ledger]
  exact hresidual

/-- Sectorial lower bound for the quartet prefix. -/
def QuartetPrefixSectorLower (Lsector : ℂ → ℝ) (s : ℂ) : Prop :=
  Lsector s ≤ ‖verticalQuartetPrefix (q s)‖

/--
Quartet residual margin using a supplied safe sectorial lower bound for
`‖verticalQuartetPrefix (q s)‖`.
-/
noncomputable def c2ExpandedQuartetSectorResidualMargin
    (Lsector : ℂ → ℝ) : ℂ → ℝ :=
  fun s => ‖q s‖ ^ 2 * Lsector s - c2QuartetVerticalTailUpper s

/--
The sectorial prefix lower is safe against the true quartet prefix contribution.
-/
theorem c2QuartetSectorK2Lower_le_truePrefix
    {Lsector : ℂ → ℝ} {s : ℂ}
    (hsector : QuartetPrefixSectorLower Lsector s) :
    ‖q s‖ ^ 2 * Lsector s ≤
      ‖c2QuartetBulkK2 s * verticalQuartetPrefix (q s)‖ := by
  have hq2_nonneg : 0 ≤ ‖q s‖ ^ 2 := by positivity
  calc
    ‖q s‖ ^ 2 * Lsector s
        ≤ ‖q s‖ ^ 2 * ‖verticalQuartetPrefix (q s)‖ := by
          exact mul_le_mul_of_nonneg_left hsector hq2_nonneg
    _ = ‖c2QuartetBulkK2 s‖ * ‖verticalQuartetPrefix (q s)‖ := by
          simp [c2QuartetBulkK2, norm_pow]
    _ = ‖c2QuartetBulkK2 s * verticalQuartetPrefix (q s)‖ := by
          rw [norm_mul]

theorem c2ExpandedQuartetSectorResidualMargin_le_trueResidualMargin
    {Lsector : ℂ → ℝ} {s : ℂ}
    (hsector : QuartetPrefixSectorLower Lsector s) :
    c2ExpandedQuartetSectorResidualMargin Lsector s ≤
      ‖c2QuartetBulkK2 s * verticalQuartetPrefix (q s)‖ -
        c2QuartetVerticalTailUpper s := by
  unfold c2ExpandedQuartetSectorResidualMargin
  linarith [c2QuartetSectorK2Lower_le_truePrefix hsector]

/--
Audit-only sector dominance predicate.  This is not the public dominance API;
it records the scalar criterion that would be available after a certified
sectorial lower bound has been proved.
-/
def C2ExpandedQuartetSectorResidualDominance
    (Lsector : ℂ → ℝ)
    (tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2ExpandedQuartetResidualUpper
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale s <
    c2ExpandedQuartetSectorResidualMargin Lsector s

/--
A sector ledger is a safe true-prefix residual ledger once the supplied
`Lsector` is certified below `‖verticalQuartetPrefix (q s)‖`.
-/
theorem truePrefixResidualDominance_of_sectorResidualDominance
    {Lsector : ℂ → ℝ}
    {tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ}
    {s : ℂ}
    (hsector : QuartetPrefixSectorLower Lsector s)
    (hdom : C2ExpandedQuartetSectorResidualDominance
      Lsector
      tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale s) :
    c2ExpandedQuartetResidualUpper
        tiltConstant tiltScale
        horizontalConstant horizontalScale horizontalRatio
        cutoffConstant cutoffScale s <
      ‖c2QuartetBulkK2 s * verticalQuartetPrefix (q s)‖ -
        c2QuartetVerticalTailUpper s := by
  exact lt_of_lt_of_le hdom
    (c2ExpandedQuartetSectorResidualMargin_le_trueResidualMargin hsector)

end ContinuedQuartetAudit
end C2
