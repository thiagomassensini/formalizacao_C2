import LeanC2.AuditGenuineMiddle
import LeanC2.AuditContinuedQuartetPositiveBoxSector
import LeanC2.AuditContinuedQuartetPositiveBoxGenuineOdd
import LeanC2.AuditContinuedQuartetPositiveBoxGenuineOddBridge
import LeanC2.AuditContinuedQuartetPositiveBoxCutoff

/-!
# Positive-box odd-reference phase interface

ROUTE_TAG: AUDIT_SHIM
ROUTE_TAG: OPTIONAL_REFINEMENT

This file names the missing phase-aware odd-reference estimate for the
positive-box audit.  It deliberately keeps the odd reference abstract, so the
obligation can be filled by genuine C2 data instead of by estimating the
legacy analytically-written continued channel.
-/

namespace C2
namespace ContinuedQuartetAudit

noncomputable section

/-- The lower-left corner is a concrete point of the selected positive box. -/
theorem positiveBox_corner_mem :
    ({ re := positiveBoxSigmaMin, im := positiveBoxTMin } : ℂ) ∈
      positiveBox := by
  change
    positiveBoxSigmaMin ≤ positiveBoxSigmaMin ∧
      positiveBoxSigmaMin ≤ positiveBoxSigmaMax ∧
        positiveBoxTMin ≤ positiveBoxTMin ∧
          positiveBoxTMin ≤ positiveBoxTMax
  norm_num [positiveBoxSigmaMin, positiveBoxSigmaMax,
    positiveBoxTMin, positiveBoxTMax]

/-- The selected positive box lies in the off-critical strip. -/
theorem positiveBox_offCriticalStrip {s : ℂ} (hs : s ∈ positiveBox) :
    offCriticalStrip s := by
  refine ⟨positiveBox_re_pos hs, ?_, ?_⟩
  · have hupper : s.re ≤ positiveBoxSigmaMax := positiveBox_re_upper hs
    have hmax_lt_one : positiveBoxSigmaMax < 1 := by
      norm_num [positiveBoxSigmaMax]
    exact lt_of_le_of_lt hupper hmax_lt_one
  · have hlower : positiveBoxSigmaMin ≤ s.re := positiveBox_re_lower hs
    have hhalf_lt_min : (1 : ℝ) / 2 < positiveBoxSigmaMin := by
      norm_num [positiveBoxSigmaMin]
    exact ne_of_gt (lt_of_lt_of_le hhalf_lt_min hlower)

/--
Existing analytic bounds for `cutVec` can be reused as the semantic continued
cutoff upper data.
-/
def PositiveBoxAnalyticBounds.to_cutoffUpperData
    (data : PositiveBoxAnalyticBounds) :
    PositiveBoxCutoffUpperData :=
  PositiveBoxCutoffUpperData.of_cut_bound data.cut_bound

/--
Full positive-box interval data carries the same cutoff certificate through
its `cut_bound` field.
-/
def PositiveBoxIntervalData.to_cutoffUpperData
    {qLower qUpper phaseLower phaseUpper : ℝ}
    (data : PositiveBoxIntervalData
      qLower qUpper phaseLower phaseUpper) :
    PositiveBoxCutoffUpperData :=
  PositiveBoxCutoffUpperData.of_cut_bound data.cut_bound

/--
The abstract odd-reference certificate also carries the diagnostic `cutVec`
bound, so it supplies the continued cutoff data.
-/
def PositiveBoxOddRefAuditCertificate.to_cutoffUpperData
    {oddRef : ℂ → ℂ}
    (data : PositiveBoxOddRefAuditCertificate oddRef) :
    PositiveBoxCutoffUpperData :=
  PositiveBoxCutoffUpperData.of_cut_bound data.cut_bound

/-- Half-disk bound for an abstract odd reference on the selected positive box. -/
def PositiveBoxOddRefHalfDiskBound
    (oddRef : ℂ → ℂ) (halfDiskUpper : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    ‖(1 / 2 : ℂ) - oddRef s‖ ≤ halfDiskUpper s

/-- Direct odd-gap bound for an abstract odd reference on the selected box. -/
def PositiveBoxOddRefGapBound
    (oddRef : ℂ → ℂ) (gapUpper : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    ‖1 - (2 : ℂ) * oddRef s‖ ≤ gapUpper s

/-- Gap upper induced by a phase-aware half-disk upper around `1 / 2`. -/
def positiveBoxOddRefGapUpperFromHalfDisk
    (halfDiskUpper : ℂ → ℝ) : ℂ → ℝ :=
  fun s => 2 * halfDiskUpper s

/-- Payment against an external local allowance for the selected box. -/
def PositiveBoxOddRefPhasePayment
    (halfDiskUpper allowanceLower : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    2 * halfDiskUpper s < allowanceLower s

/--
Minimal phase package for the positive-box odd-reference route.

The `allowanceLower` field is intentionally external: the next route decision is
whether this should be inherited from the global exact-gap anchor allowance or
from a purely local positive-box residual margin.
-/
structure PositiveBoxOddRefPhaseData
    (oddRef : ℂ → ℂ)
    (halfDiskUpper allowanceLower : ℂ → ℝ) : Prop where
  half_disk_bound :
    PositiveBoxOddRefHalfDiskBound oddRef halfDiskUpper
  payment :
    PositiveBoxOddRefPhasePayment halfDiskUpper allowanceLower

/-- A half-disk bound implies the corresponding direct odd-gap bound. -/
theorem PositiveBoxOddRefGapBound.of_halfDiskBound
    {oddRef : ℂ → ℂ} {halfDiskUpper : ℂ → ℝ}
    (hhalf : PositiveBoxOddRefHalfDiskBound oddRef halfDiskUpper) :
    PositiveBoxOddRefGapBound
      oddRef (positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper) := by
  intro s hs
  unfold PositiveBoxOddRefHalfDiskBound at hhalf
  unfold positiveBoxOddRefGapUpperFromHalfDisk
  have hrewrite :
      (1 : ℂ) - (2 : ℂ) * oddRef s =
        (2 : ℂ) * ((1 / 2 : ℂ) - oddRef s) := by
    ring
  rw [hrewrite, norm_mul]
  have hnorm_two : ‖(2 : ℂ)‖ = (2 : ℝ) := by
    norm_num
  rw [hnorm_two]
  nlinarith [hhalf hs]

/--
The phase package converts the half-disk estimate into a strict local gap
payment against the supplied allowance.
-/
theorem PositiveBoxOddRefPhaseData.gap_lt_allowance
    {oddRef : ℂ → ℂ} {halfDiskUpper allowanceLower : ℂ → ℝ}
    (data :
      PositiveBoxOddRefPhaseData oddRef halfDiskUpper allowanceLower)
    {s : ℂ} (hs : s ∈ positiveBox) :
    ‖1 - (2 : ℂ) * oddRef s‖ < allowanceLower s := by
  have hgap :
      ‖1 - (2 : ℂ) * oddRef s‖ ≤
        positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper s :=
    PositiveBoxOddRefGapBound.of_halfDiskBound
      data.half_disk_bound hs
  unfold positiveBoxOddRefGapUpperFromHalfDisk at hgap
  exact lt_of_le_of_lt hgap (data.payment hs)

/-- Local positive-box version of the global factor/allowance strict budget. -/
def PositiveBoxOddRefFactorUpperLowerBudgetOnBox
    (gapUpper allowanceLower : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    GenuineMiddleAudit.C2ExactGapAnchorFactorUpperLowerBudget
      gapUpper allowanceLower s

/-- The phase package supplies the direct odd-gap bound on the selected box. -/
theorem PositiveBoxOddRefPhaseData.to_gapBound
    {oddRef : ℂ → ℂ} {halfDiskUpper allowanceLower : ℂ → ℝ}
    (data :
      PositiveBoxOddRefPhaseData oddRef halfDiskUpper allowanceLower) :
    PositiveBoxOddRefGapBound
      oddRef (positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper) :=
  PositiveBoxOddRefGapBound.of_halfDiskBound data.half_disk_bound

/--
The phase payment is exactly the strict factor/allowance budget expected by the
global exact-gap anchor spine, restricted to the selected positive box.
-/
theorem PositiveBoxOddRefPhaseData.to_factorUpperLowerBudgetOnBox
    {oddRef : ℂ → ℂ} {halfDiskUpper allowanceLower : ℂ → ℝ}
    (data :
      PositiveBoxOddRefPhaseData oddRef halfDiskUpper allowanceLower) :
    PositiveBoxOddRefFactorUpperLowerBudgetOnBox
      (positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper)
      allowanceLower := by
  intro s hs
  unfold GenuineMiddleAudit.C2ExactGapAnchorFactorUpperLowerBudget
  unfold positiveBoxOddRefGapUpperFromHalfDisk
  exact data.payment hs

/-- Compatibility between an abstract odd reference and the global continued channel on the box. -/
def PositiveBoxOddRefContinuedCompatibility
    (oddRef : ℂ → ℂ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    oddRef s = continuedOddDirichletChannel s

/--
Flexible odd-reference truncation bound on the selected box.

This is the cutoff-facing version of `PositiveBoxOddRefTruncationData`: the
upper is supplied externally instead of being fixed to the horizontal value
`positiveBoxOddTruncationUpperValue`.
-/
def PositiveBoxOddRefTruncationUpperBoundOnBox
    (oddRef : ℂ → ℂ) (oddTruncationUpper : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    positiveBoxOddRefTruncationNorm oddRef positiveBoxN s ≤
      oddTruncationUpper s

/-- Fixed odd-reference truncation data is a constant flexible truncation bound. -/
theorem PositiveBoxOddRefTruncationData.to_truncationUpperBoundOnBox
    {oddRef : ℂ → ℂ}
    (data : PositiveBoxOddRefTruncationData oddRef) :
    PositiveBoxOddRefTruncationUpperBoundOnBox
      oddRef (fun _ => positiveBoxOddTruncationUpperValue) := by
  intro s hs
  exact data.oddRef_truncation_bound hs

/-- Continued-channel odd-gap bound restricted to the selected positive box. -/
def PositiveBoxContinuedOddGapBoundOnBox
    (gapUpper : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    GenuineMiddleAudit.C2ContinuedOddGapBound gapUpper s

/-- Transport an odd-reference gap bound to the continued channel under explicit compatibility. -/
theorem PositiveBoxOddRefGapBound.to_continuedOnBox
    {oddRef : ℂ → ℂ} {gapUpper : ℂ → ℝ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (hgap : PositiveBoxOddRefGapBound oddRef gapUpper) :
    PositiveBoxContinuedOddGapBoundOnBox gapUpper := by
  intro s hs
  unfold GenuineMiddleAudit.C2ContinuedOddGapBound
  unfold PositiveBoxOddRefGapBound at hgap
  rw [← hcompat hs]
  exact hgap hs

/-- Upper for `continuedOddDirichletChannel` induced by a half-disk estimate. -/
def positiveBoxContinuedOddUpperFromHalfDisk
    (halfDiskUpper : ℂ → ℝ) : ℂ → ℝ :=
  fun s => (1 : ℝ) / 2 + halfDiskUpper s

/--
Transport phase data to a continued odd-channel norm upper.

This is intentionally only a norm upper extracted from the phase package; it is
not an analytic shortcut.
-/
theorem PositiveBoxOddRefPhaseData.to_continuedOddUpperBoundOnBox
    {oddRef : ℂ → ℂ} {halfDiskUpper allowanceLower : ℂ → ℝ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (data :
      PositiveBoxOddRefPhaseData oddRef halfDiskUpper allowanceLower) :
    PositiveBoxContinuedOddUpperBoundOnBox
      (positiveBoxContinuedOddUpperFromHalfDisk halfDiskUpper) := by
  intro s hs
  have hhalf :
      ‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖ ≤
        halfDiskUpper s := by
    simpa [hcompat hs] using data.half_disk_bound hs
  have htri :
      ‖continuedOddDirichletChannel s‖ ≤
        ‖(1 / 2 : ℂ)‖ +
          ‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖ := by
    have h :=
      norm_sub_le (1 / 2 : ℂ)
        ((1 / 2 : ℂ) - continuedOddDirichletChannel s)
    have hrewrite :
        (1 / 2 : ℂ) -
            ((1 / 2 : ℂ) - continuedOddDirichletChannel s) =
          continuedOddDirichletChannel s := by
      ring
    simpa [hrewrite] using h
  have hnorm_half : ‖(1 / 2 : ℂ)‖ = (1 : ℝ) / 2 := by
    norm_num
  unfold positiveBoxContinuedOddUpperFromHalfDisk
  nlinarith

/-- Constant continued odd-channel upper forced by the active phase allowance. -/
def positiveBoxContinuedOddUpperPhaseCandidate : ℂ → ℝ :=
  fun _ => (21 : ℝ) / 40

/--
Transport odd-reference truncation data to the continued channel under explicit
compatibility on the selected box.
-/
theorem PositiveBoxContinuedOddTruncationData.of_oddRefTruncation
    {oddRef : ℂ → ℂ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (odd_data : PositiveBoxOddRefTruncationData oddRef) :
    PositiveBoxContinuedOddTruncationData where
  continued_odd_truncation_bound := by
    intro s hs
    have h := odd_data.oddRef_truncation_bound hs
    simpa [positiveBoxOddRefTruncationNorm, hcompat hs] using h

/--
Transport a flexible odd-reference truncation upper to the continued channel.
-/
theorem PositiveBoxContinuedOddTruncationUpperBoundOnBox.of_oddRefTruncationUpper
    {oddRef : ℂ → ℂ} {oddTruncationUpper : ℂ → ℝ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (htrunc :
      PositiveBoxOddRefTruncationUpperBoundOnBox
        oddRef oddTruncationUpper) :
    PositiveBoxContinuedOddTruncationUpperBoundOnBox
      oddTruncationUpper := by
  intro s hs
  have h := htrunc hs
  simpa [positiveBoxOddRefTruncationNorm, hcompat hs] using h

/--
Odd-reference truncation data, once compatible with the continued channel,
feeds the explicit depth/core cutoff route.
-/
theorem PositiveBoxCutoffUpperData.of_oddRefTruncation_explicitDepthCoreScalarBudget
    {oddRef : ℂ → ℂ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (odd_data : PositiveBoxOddRefTruncationData oddRef)
    {continuedOddUpper : ℂ → ℝ}
    (hodd :
      PositiveBoxContinuedOddUpperBoundOnBox continuedOddUpper)
    (hbudget :
      PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox
        continuedOddUpper) :
    PositiveBoxCutoffUpperData :=
  PositiveBoxCutoffUpperData.of_explicitDepthCoreScalarBudget
    (PositiveBoxContinuedOddTruncationData.of_oddRefTruncation
      hcompat odd_data)
    hodd
    hbudget

/--
Exact-odd specialization of the odd-reference truncation bridge into cutoff
upper data.
-/
theorem PositiveBoxCutoffUpperData.of_oddRefTruncation_explicitDepthCoreExactOddScalarBudget
    {oddRef : ℂ → ℂ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (odd_data : PositiveBoxOddRefTruncationData oddRef)
    (hbudget :
      PositiveBoxCutoffExplicitDepthCoreExactOddScalarBudgetOnBox) :
    PositiveBoxCutoffUpperData :=
  PositiveBoxCutoffUpperData.of_explicitDepthCoreExactOddScalarBudget
    (PositiveBoxContinuedOddTruncationData.of_oddRefTruncation
      hcompat odd_data)
    hbudget

/--
Bridge-bounds package version of the odd-reference depth/core cutoff route.
-/
theorem PositiveBoxCutoffUpperData.of_oddRefBridgeBounds_explicitDepthCoreScalarBudget
    {data : GenuineOddContinuationData}
    (hcompat : PositiveBoxOddRefContinuedCompatibility data.oddRef)
    (bounds : PositiveBoxOddRefBridgeBounds data)
    {continuedOddUpper : ℂ → ℝ}
    (hodd :
      PositiveBoxContinuedOddUpperBoundOnBox continuedOddUpper)
    (hbudget :
      PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox
        continuedOddUpper) :
    PositiveBoxCutoffUpperData :=
  PositiveBoxCutoffUpperData.of_oddRefTruncation_explicitDepthCoreScalarBudget
    hcompat bounds.truncation hodd hbudget

/--
Exact-odd specialization using the bridge-bounds truncation field.
-/
theorem PositiveBoxCutoffUpperData.of_oddRefBridgeBounds_explicitDepthCoreExactOddScalarBudget
    {data : GenuineOddContinuationData}
    (hcompat : PositiveBoxOddRefContinuedCompatibility data.oddRef)
    (bounds : PositiveBoxOddRefBridgeBounds data)
    (hbudget :
      PositiveBoxCutoffExplicitDepthCoreExactOddScalarBudgetOnBox) :
    PositiveBoxCutoffUpperData :=
  PositiveBoxCutoffUpperData.of_oddRefTruncation_explicitDepthCoreExactOddScalarBudget
    hcompat bounds.truncation hbudget

/-- Global allowance-lower scalar budget restricted to the selected positive box. -/
def PositiveBoxExactGapAnchorFactorAllowanceLowerScalarBudgetOnBox
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      allowanceLower : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    GenuineMiddleAudit.C2ExactGapAnchorFactorAllowanceLowerScalarBudget
      K M horizontalConstant horizontalScale horizontalRatio allowanceLower s

/-- Global exact-gap scalar budget restricted to the selected positive box. -/
def PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      gapUpper : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    GenuineMiddleAudit.C2ExactGapAnchorGapUpperScalarBudget
      K M horizontalConstant horizontalScale horizontalRatio gapUpper s

/-- Nonnegativity of the chosen allowance lower on the selected positive box. -/
def PositiveBoxAllowanceLowerNonnegOnBox
    (allowanceLower : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    0 ≤ allowanceLower s

/--
Working constant lower allowance for the selected positive box.

The value is deliberately localized: later component-payment or phase data can
sharpen it without changing the surrounding interface.
-/
def positiveBoxAllowanceLowerCandidate : ℂ → ℝ :=
  fun _ => (1 : ℝ) / 20

/-- The working allowance lower candidate is nonnegative on the positive box. -/
theorem positiveBox_allowanceLower_nonneg_candidate :
    PositiveBoxAllowanceLowerNonnegOnBox
      positiveBoxAllowanceLowerCandidate := by
  intro s hs
  norm_num [positiveBoxAllowanceLowerCandidate]

/-- The working allowance lower candidate is strictly positive on the positive box. -/
theorem positiveBox_allowanceLower_pos_candidate
    {s : ℂ} (_hs : s ∈ positiveBox) :
    0 < positiveBoxAllowanceLowerCandidate s := by
  norm_num [positiveBoxAllowanceLowerCandidate]

/-- The working allowance lower candidate is below one on the positive box. -/
theorem positiveBox_allowanceLower_lt_one_candidate
    {s : ℂ} (_hs : s ∈ positiveBox) :
    positiveBoxAllowanceLowerCandidate s < 1 := by
  norm_num [positiveBoxAllowanceLowerCandidate]

/--
With the active allowance `1 / 20`, phase data gives
`‖continuedOddDirichletChannel s‖ ≤ 21 / 40` on the box.
-/
theorem PositiveBoxOddRefPhaseData.to_continuedOddUpperBoundOnBox_candidate
    {oddRef : ℂ → ℂ} {halfDiskUpper : ℂ → ℝ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (data :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate) :
    PositiveBoxContinuedOddUpperBoundOnBox
      positiveBoxContinuedOddUpperPhaseCandidate := by
  intro s hs
  have hnorm :=
    (PositiveBoxOddRefPhaseData.to_continuedOddUpperBoundOnBox
      hcompat data) hs
  have hpay := data.payment hs
  unfold positiveBoxContinuedOddUpperFromHalfDisk at hnorm
  unfold positiveBoxContinuedOddUpperPhaseCandidate
  norm_num [positiveBoxAllowanceLowerCandidate] at hpay ⊢
  linarith

/--
With the phase-induced upper `21 / 40`, the depth-cutoff part alone already
exceeds the positive-box cutoff target.
-/
theorem positiveBox_phaseCandidate_depthCutoffTerm_exceeds_cutUpper
    {s : ℂ} (hs : s ∈ positiveBox) :
    positiveBoxCutUpperValue <
      2 * positiveBoxDepthCutoffExplicitUpper s *
        positiveBoxContinuedOddUpperPhaseCandidate s := by
  let r : ℝ := ‖q s‖
  have hr_nonneg : 0 ≤ r := by
    exact norm_nonneg _
  have hr_lower : (11 : ℝ) / 40 ≤ r := by
    simpa [r, positiveBoxQNormSharpLowerValue] using
      positiveBox_q_norm_lower_11_40 hs
  have hr_lt_one : r < 1 := by
    simpa [r] using positiveBox_q_norm_lt_one hs
  have hden_pos : 0 < 1 - r := by
    linarith
  have hden_le_one : 1 - r ≤ 1 := by
    linarith
  have hr4_lower : ((11 : ℝ) / 40) ^ 4 ≤ r ^ 4 :=
    pow_le_pow_left₀ (by norm_num) hr_lower 4
  have hdiv_ge_self : r ^ 4 ≤ r ^ 4 / (1 - r) := by
    rw [le_div_iff₀ hden_pos]
    have hr4_nonneg : 0 ≤ r ^ 4 := by
      positivity
    nlinarith
  have hdepth_lower :
      ((11 : ℝ) / 40) ^ 4 ≤ positiveBoxDepthCutoffExplicitUpper s := by
    unfold positiveBoxDepthCutoffExplicitUpper rectangularDepthCutoffUpper
    change ((11 : ℝ) / 40) ^ 4 ≤ r ^ (positiveBoxK + 1) / (1 - r)
    have hK : positiveBoxK + 1 = 4 := by
      norm_num [positiveBoxK]
    rw [hK]
    exact le_trans hr4_lower hdiv_ge_self
  have hscaled :
      2 * (((11 : ℝ) / 40) ^ 4) *
          positiveBoxContinuedOddUpperPhaseCandidate s ≤
        2 * positiveBoxDepthCutoffExplicitUpper s *
          positiveBoxContinuedOddUpperPhaseCandidate s := by
    have hleft :
        2 * (((11 : ℝ) / 40) ^ 4) ≤
          2 * positiveBoxDepthCutoffExplicitUpper s :=
      mul_le_mul_of_nonneg_left hdepth_lower (by norm_num)
    exact mul_le_mul_of_nonneg_right hleft
      (by norm_num [positiveBoxContinuedOddUpperPhaseCandidate])
  calc
    positiveBoxCutUpperValue <
        2 * (((11 : ℝ) / 40) ^ 4) * ((21 : ℝ) / 40) := by
          norm_num [positiveBoxCutUpperValue]
    _ =
        2 * (((11 : ℝ) / 40) ^ 4) *
          positiveBoxContinuedOddUpperPhaseCandidate s := by
          norm_num [positiveBoxContinuedOddUpperPhaseCandidate]
    _ ≤
        2 * positiveBoxDepthCutoffExplicitUpper s *
          positiveBoxContinuedOddUpperPhaseCandidate s :=
          hscaled

/--
The flexible phase-cutoff scalar budget cannot hold at any box point where the
truncation upper is nonnegative.
-/
theorem not_positiveBoxCutoffExplicitDepthCoreFlexibleScalarBudgetOnBox_phaseCandidate_at
    {oddTruncationUpper : ℂ → ℝ}
    {s : ℂ} (hs : s ∈ positiveBox)
    (htrunc_nonneg : 0 ≤ oddTruncationUpper s) :
    ¬ PositiveBoxCutoffExplicitDepthCoreFlexibleScalarBudgetOnBox
        oddTruncationUpper positiveBoxContinuedOddUpperPhaseCandidate := by
  intro hbudget
  have hbudget_s := hbudget hs
  have hdepth_nonneg :
      0 ≤ positiveBoxDepthFactorExplicitUpper s := by
    unfold positiveBoxDepthFactorExplicitUpper
    exact rectangularDepthFactorExplicitUpper_nonneg_of_re_pos
      s positiveBoxK (positiveBox_re_pos hs)
  have hfirst_nonneg :
      0 ≤
        2 * positiveBoxDepthFactorExplicitUpper s *
          oddTruncationUpper s := by
    exact mul_nonneg
      (mul_nonneg (by norm_num) hdepth_nonneg)
      htrunc_nonneg
  have hcut_gt :=
    positiveBox_phaseCandidate_depthCutoffTerm_exceeds_cutUpper hs
  nlinarith

/-- External upper bound for `verticalDepthTailUpper` on the selected box. -/
def PositiveBoxVerticalDepthTailUpperBoundOnBox
    (verticalTailUpper : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    verticalDepthTailUpper s ≤ verticalTailUpper s

/-- Constant positive-box upper candidate for the vertical depth tail. -/
def positiveBoxVerticalTailUpperCandidate : ℂ → ℝ :=
  fun _ => (49 : ℝ) / 450

/--
The selected positive-box `q`-bound gives the advertised constant upper bound
for `verticalDepthTailUpper`.
-/
theorem positiveBox_verticalDepthTailUpper_bound_candidate :
    PositiveBoxVerticalDepthTailUpperBoundOnBox
      positiveBoxVerticalTailUpperCandidate := by
  intro s hs
  unfold positiveBoxVerticalTailUpperCandidate verticalDepthTailUpper
  have hq_nonneg : 0 ≤ ‖q s‖ := norm_nonneg _
  have hq_upper : ‖q s‖ ≤ (7 : ℝ) / 25 := by
    simpa [positiveBoxQNormSharpUpperValue] using
      positiveBox_q_norm_upper_7_25 hs
  have hq_sq_upper : ‖q s‖ ^ 2 ≤ ((7 : ℝ) / 25) ^ 2 :=
    pow_le_pow_left₀ hq_nonneg hq_upper 2
  have hden_pos : 0 < 1 - (7 : ℝ) / 25 := by
    norm_num
  have hden_le : 1 - (7 : ℝ) / 25 ≤ 1 - ‖q s‖ := by
    linarith
  calc
    ‖q s‖ ^ 2 / (1 - ‖q s‖)
        ≤ ((7 : ℝ) / 25) ^ 2 / (1 - (7 : ℝ) / 25) := by
          exact div_le_div₀ (by positivity) hq_sq_upper hden_pos hden_le
    _ = (49 : ℝ) / 450 := by
          norm_num

/-- External upper bound for the two exact central rebasing debits on the box. -/
def PositiveBoxExactCentralUpperBoundOnBox
    (centralUpper : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    c2GenuineCentralExactUpper s +
        c2ContinuedCentralExactUpper s ≤ centralUpper s

/-- Exact central-debit candidate for the selected positive box. -/
def positiveBoxExactCentralUpperCandidate : ℂ → ℝ :=
  fun s => c2GenuineCentralExactUpper s +
    c2ContinuedCentralExactUpper s

/-- The exact central-debit candidate trivially bounds the central debits. -/
theorem positiveBox_exactCentralUpper_bound_candidate :
    PositiveBoxExactCentralUpperBoundOnBox
      positiveBoxExactCentralUpperCandidate := by
  intro s hs
  unfold positiveBoxExactCentralUpperCandidate
  exact le_rfl

/-- External lower bound for the exact vertical-anchor residual allowance. -/
def PositiveBoxExactVerticalAnchorAllowanceLowerBoundOnBox
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      anchorAllowanceLower : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    anchorAllowanceLower s ≤
      GenuineMiddleAudit.c2ExactVerticalAnchorResidualNormAllowance
        K M horizontalConstant horizontalScale horizontalRatio s

/-- Exact anchor-allowance lower candidate for the selected positive box. -/
def positiveBoxExactVerticalAnchorAllowanceLowerCandidate
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ) :
    ℂ → ℝ :=
  fun s =>
    GenuineMiddleAudit.c2ExactVerticalAnchorResidualNormAllowance
      K M horizontalConstant horizontalScale horizontalRatio s

/-- The exact anchor-allowance candidate trivially bounds the anchor allowance below. -/
theorem positiveBox_exactVerticalAnchorAllowanceLower_bound_candidate
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ) :
    PositiveBoxExactVerticalAnchorAllowanceLowerBoundOnBox
      K M horizontalConstant horizontalScale horizontalRatio
      (positiveBoxExactVerticalAnchorAllowanceLowerCandidate
        K M horizontalConstant horizontalScale horizontalRatio) := by
  intro s hs
  unfold positiveBoxExactVerticalAnchorAllowanceLowerCandidate
  exact le_rfl

/--
Scalar payment showing that the chosen `allowanceLower`, after multiplication
by a tail upper and after paying central debits, fits under the anchor allowance
lower.
-/
def PositiveBoxAllowanceLowerComponentPaymentOnBox
    (allowanceLower verticalTailUpper centralUpper
      anchorAllowanceLower : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    allowanceLower s * verticalTailUpper s + centralUpper s ≤
      anchorAllowanceLower s

/-- The single remaining scalar payment for the current positive-box candidates. -/
abbrev PositiveBoxExactGapAnchorCandidateComponentPaymentOnBox
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ) : Prop :=
  PositiveBoxAllowanceLowerComponentPaymentOnBox
    positiveBoxAllowanceLowerCandidate
    positiveBoxVerticalTailUpperCandidate
    positiveBoxExactCentralUpperCandidate
    (positiveBoxExactVerticalAnchorAllowanceLowerCandidate
      K M horizontalConstant horizontalScale horizontalRatio)

/--
Expanded scalar form of the current candidate payment.

This opens the exact vertical-anchor allowance back to the quartet residual
margin, horizontal debit, cutoff debit, and the off-critical resolvent factor.
It is the form intended for interval certification.
-/
def PositiveBoxExactGapAnchorCandidateExpandedPaymentOnBox
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    (((positiveBoxAllowanceLowerCandidate s *
            positiveBoxVerticalTailUpperCandidate s +
          positiveBoxExactCentralUpperCandidate s +
          GenuineMiddleAudit.c2RawCentralCutoffNormConstant K M s +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
      (1 - ‖q s‖)⁻¹ +
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s +
      GenuineMiddleAudit.c2RawCentralCutoffNormConstant K M s ≤
        c2ExpandedQuartetResidualMargin s)

/--
The candidate component payment is equivalent to the expanded scalar payment
on the selected positive box.
-/
theorem positiveBox_candidateComponentPayment_iff_expandedPayment
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ} :
    PositiveBoxExactGapAnchorCandidateExpandedPaymentOnBox
        K M horizontalConstant horizontalScale horizontalRatio ↔
      PositiveBoxExactGapAnchorCandidateComponentPaymentOnBox
        K M horizontalConstant horizontalScale horizontalRatio := by
  constructor
  · intro hexp s hs
    let V :=
      positiveBoxAllowanceLowerCandidate s *
          positiveBoxVerticalTailUpperCandidate s +
        positiveBoxExactCentralUpperCandidate s +
        GenuineMiddleAudit.c2RawCentralCutoffNormConstant K M s
    have hexp_point :
        (((V +
              c2HorizontalRegularizedUpper
                horizontalConstant horizontalScale horizontalRatio s) *
            (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s +
          GenuineMiddleAudit.c2RawCentralCutoffNormConstant K M s ≤
            c2ExpandedQuartetResidualMargin s) := by
      simpa [PositiveBoxExactGapAnchorCandidateExpandedPaymentOnBox, V,
        add_assoc, add_comm, add_left_comm] using hexp hs
    have hv :
        V ≤
          GenuineMiddleAudit.c2ExactVerticalResidualNormAllowance
            K M horizontalConstant horizontalScale horizontalRatio s :=
      (GenuineMiddleAudit.exactVerticalScalarBudget_iff_budget_le_allowance
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) (positiveBox_offCriticalStrip hs) V).1 hexp_point
    unfold positiveBoxExactVerticalAnchorAllowanceLowerCandidate
      GenuineMiddleAudit.c2ExactVerticalAnchorResidualNormAllowance
    dsimp [V] at hv
    linarith
  · intro hpayment s hs
    let V :=
      positiveBoxAllowanceLowerCandidate s *
          positiveBoxVerticalTailUpperCandidate s +
        positiveBoxExactCentralUpperCandidate s +
        GenuineMiddleAudit.c2RawCentralCutoffNormConstant K M s
    have hpay := hpayment hs
    have hv :
        V ≤
          GenuineMiddleAudit.c2ExactVerticalResidualNormAllowance
            K M horizontalConstant horizontalScale horizontalRatio s := by
      unfold positiveBoxExactVerticalAnchorAllowanceLowerCandidate
        GenuineMiddleAudit.c2ExactVerticalAnchorResidualNormAllowance at hpay
      dsimp [V]
      linarith
    have hexp_point :
        (((V +
              c2HorizontalRegularizedUpper
                horizontalConstant horizontalScale horizontalRatio s) *
            (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s +
          GenuineMiddleAudit.c2RawCentralCutoffNormConstant K M s ≤
            c2ExpandedQuartetResidualMargin s) :=
      (GenuineMiddleAudit.exactVerticalScalarBudget_iff_budget_le_allowance
        (K := K) (M := M)
        (horizontalConstant := horizontalConstant)
        (horizontalScale := horizontalScale)
        (horizontalRatio := horizontalRatio)
        (s := s) (positiveBox_offCriticalStrip hs) V).2 hv
    simpa [PositiveBoxExactGapAnchorCandidateExpandedPaymentOnBox, V,
      add_assoc, add_comm, add_left_comm] using hexp_point

/-- Expanded scalar payment implies the candidate component payment. -/
theorem PositiveBoxExactGapAnchorCandidateComponentPaymentOnBox.of_expandedPayment
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (hexp :
      PositiveBoxExactGapAnchorCandidateExpandedPaymentOnBox
        K M horizontalConstant horizontalScale horizontalRatio) :
    PositiveBoxExactGapAnchorCandidateComponentPaymentOnBox
      K M horizontalConstant horizontalScale horizontalRatio :=
  (positiveBox_candidateComponentPayment_iff_expandedPayment
    (K := K) (M := M)
    (horizontalConstant := horizontalConstant)
    (horizontalScale := horizontalScale)
    (horizontalRatio := horizontalRatio)).1 hexp

/-- Component certificate for the global allowance-lower scalar budget on the box. -/
structure PositiveBoxExactGapAnchorAllowanceLowerComponentData
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      allowanceLower verticalTailUpper centralUpper
      anchorAllowanceLower : ℂ → ℝ) : Prop where
  allowanceLower_nonneg :
    PositiveBoxAllowanceLowerNonnegOnBox allowanceLower
  verticalTail_upper :
    PositiveBoxVerticalDepthTailUpperBoundOnBox verticalTailUpper
  central_upper :
    PositiveBoxExactCentralUpperBoundOnBox centralUpper
  anchorAllowance_lower :
    PositiveBoxExactVerticalAnchorAllowanceLowerBoundOnBox
      K M horizontalConstant horizontalScale horizontalRatio
      anchorAllowanceLower
  component_payment :
    PositiveBoxAllowanceLowerComponentPaymentOnBox
      allowanceLower verticalTailUpper centralUpper
      anchorAllowanceLower

/--
Candidate component package reduced to the single remaining scalar payment.
-/
theorem positiveBox_exactGapAnchorAllowanceLowerComponentData_candidate
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (hpayment :
      PositiveBoxExactGapAnchorCandidateComponentPaymentOnBox
        K M horizontalConstant horizontalScale horizontalRatio) :
    PositiveBoxExactGapAnchorAllowanceLowerComponentData
      K M horizontalConstant horizontalScale horizontalRatio
      positiveBoxAllowanceLowerCandidate
      positiveBoxVerticalTailUpperCandidate
      positiveBoxExactCentralUpperCandidate
      (positiveBoxExactVerticalAnchorAllowanceLowerCandidate
        K M horizontalConstant horizontalScale horizontalRatio) where
  allowanceLower_nonneg := positiveBox_allowanceLower_nonneg_candidate
  verticalTail_upper := positiveBox_verticalDepthTailUpper_bound_candidate
  central_upper := positiveBox_exactCentralUpper_bound_candidate
  anchorAllowance_lower :=
    positiveBox_exactVerticalAnchorAllowanceLower_bound_candidate
      K M horizontalConstant horizontalScale horizontalRatio
  component_payment := hpayment

/--
Component bounds imply the exact-gap allowance-lower scalar budget restricted
to the selected positive box.
-/
theorem PositiveBoxExactGapAnchorAllowanceLowerComponentData.to_scalarBudgetOnBox
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      allowanceLower verticalTailUpper centralUpper
      anchorAllowanceLower : ℂ → ℝ}
    (data :
      PositiveBoxExactGapAnchorAllowanceLowerComponentData
        K M horizontalConstant horizontalScale horizontalRatio
        allowanceLower verticalTailUpper centralUpper
        anchorAllowanceLower) :
    PositiveBoxExactGapAnchorFactorAllowanceLowerScalarBudgetOnBox
      K M horizontalConstant horizontalScale horizontalRatio
      allowanceLower := by
  intro s hs
  unfold GenuineMiddleAudit.C2ExactGapAnchorFactorAllowanceLowerScalarBudget
  have htail :
      allowanceLower s * verticalDepthTailUpper s ≤
        allowanceLower s * verticalTailUpper s := by
    exact mul_le_mul_of_nonneg_left
      (data.verticalTail_upper hs) (data.allowanceLower_nonneg hs)
  have hcentral :
      c2GenuineCentralExactUpper s +
          c2ContinuedCentralExactUpper s ≤ centralUpper s :=
    data.central_upper hs
  have hcomponent :
      allowanceLower s * verticalTailUpper s + centralUpper s ≤
        anchorAllowanceLower s :=
    data.component_payment hs
  have hanchor :
      anchorAllowanceLower s ≤
        GenuineMiddleAudit.c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s :=
    data.anchorAllowance_lower hs
  linarith

/--
The current positive-box candidate payment is enough to produce the exact-gap
allowance-lower scalar budget on the selected box.
-/
theorem PositiveBoxExactGapAnchorFactorAllowanceLowerScalarBudgetOnBox.of_candidatePayment
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (hpayment :
      PositiveBoxExactGapAnchorCandidateComponentPaymentOnBox
        K M horizontalConstant horizontalScale horizontalRatio) :
    PositiveBoxExactGapAnchorFactorAllowanceLowerScalarBudgetOnBox
      K M horizontalConstant horizontalScale horizontalRatio
      positiveBoxAllowanceLowerCandidate :=
  PositiveBoxExactGapAnchorAllowanceLowerComponentData.to_scalarBudgetOnBox
    (positiveBox_exactGapAnchorAllowanceLowerComponentData_candidate
      hpayment)

/--
The expanded scalar candidate payment is enough to produce the exact-gap
allowance-lower scalar budget on the selected box.
-/
theorem PositiveBoxExactGapAnchorFactorAllowanceLowerScalarBudgetOnBox.of_candidateExpandedPayment
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    (hexp :
      PositiveBoxExactGapAnchorCandidateExpandedPaymentOnBox
        K M horizontalConstant horizontalScale horizontalRatio) :
    PositiveBoxExactGapAnchorFactorAllowanceLowerScalarBudgetOnBox
      K M horizontalConstant horizontalScale horizontalRatio
      positiveBoxAllowanceLowerCandidate :=
  PositiveBoxExactGapAnchorFactorAllowanceLowerScalarBudgetOnBox.of_candidatePayment
    (PositiveBoxExactGapAnchorCandidateComponentPaymentOnBox.of_expandedPayment
      hexp)

/--
Local positive-box bridge from phase data plus a global allowance-lower scalar
budget to the exact-gap scalar budget restricted to the box.
-/
theorem PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_allowanceLower
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper allowanceLower : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hphase :
      PositiveBoxOddRefPhaseData oddRef halfDiskUpper allowanceLower)
    (hallow :
      PositiveBoxExactGapAnchorFactorAllowanceLowerScalarBudgetOnBox
        K M horizontalConstant horizontalScale horizontalRatio
        allowanceLower) :
    PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox
      K M horizontalConstant horizontalScale horizontalRatio
      (positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper) := by
  intro s hs
  exact
    GenuineMiddleAudit.C2ExactGapAnchorGapUpperScalarBudget_of_allowanceLowerScalarBudget
      (positiveBox_offCriticalStrip hs)
      (hallow hs)
      (hphase.to_factorUpperLowerBudgetOnBox hs)

/--
Current candidate bridge: phase data plus the single scalar component payment
produce the exact-gap scalar budget on the selected box.
-/
theorem PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_candidatePayment
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (hpayment :
      PositiveBoxExactGapAnchorCandidateComponentPaymentOnBox
        K M horizontalConstant horizontalScale horizontalRatio) :
    PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox
      K M horizontalConstant horizontalScale horizontalRatio
      (positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper) :=
  PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_allowanceLower
    hphase
    (PositiveBoxExactGapAnchorFactorAllowanceLowerScalarBudgetOnBox.of_candidatePayment
      hpayment)

/--
Current expanded-payment bridge: phase data plus the expanded scalar payment
produce the exact-gap scalar budget on the selected box.
-/
theorem PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_candidateExpandedPayment
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (hexp :
      PositiveBoxExactGapAnchorCandidateExpandedPaymentOnBox
        K M horizontalConstant horizontalScale horizontalRatio) :
    PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox
      K M horizontalConstant horizontalScale horizontalRatio
      (positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper) :=
  PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_candidatePayment
    hphase
    (PositiveBoxExactGapAnchorCandidateComponentPaymentOnBox.of_expandedPayment
      hexp)

/-- Active positive-box specialization of the expanded exact-gap payment. -/
abbrev PositiveBoxExactGapAnchorActiveExpandedPaymentOnBox : Prop :=
  PositiveBoxExactGapAnchorCandidateExpandedPaymentOnBox
    positiveBoxK positiveBoxM
    (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
    unitScale qNormHorizontalRatio

/--
External upper/lower data sufficient for the active expanded payment.

This is the interval-certification surface: bound central, cutoff, and
horizontal debits from above, bound the quartet margin from below, and prove
the resulting scalar inequality.
-/
structure PositiveBoxExactGapAnchorActiveExpandedUpperData
    (centralBudget cutoffBudget horizontalBudget marginLower : ℂ → ℝ) :
    Prop where
  central_upper :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      positiveBoxExactCentralUpperCandidate s ≤ centralBudget s
  cutoff_upper :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      GenuineMiddleAudit.c2RawCentralCutoffNormConstant
        positiveBoxK positiveBoxM s ≤ cutoffBudget s
  horizontal_upper :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      constantCoreHorizontalUpperQRatio positiveBoxN s ≤
        horizontalBudget s
  margin_lower :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      marginLower s ≤ c2ExpandedQuartetResidualMargin s
  scalar_budget :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      (((positiveBoxAllowanceLowerCandidate s *
              positiveBoxVerticalTailUpperCandidate s +
            centralBudget s + cutoffBudget s + horizontalBudget s) *
          (1 + ‖q s‖)) *
        (1 - ‖q s‖)⁻¹ +
        horizontalBudget s + cutoffBudget s ≤ marginLower s)

/-- Exact central budget candidate for the active positive-box expanded payment. -/
abbrev positiveBoxActiveCentralBudgetExact : ℂ → ℝ :=
  positiveBoxExactCentralUpperCandidate

/-- Exact cutoff budget candidate for the active positive-box expanded payment. -/
abbrev positiveBoxActiveCutoffBudgetExact : ℂ → ℝ :=
  GenuineMiddleAudit.c2RawCentralCutoffNormConstant
    positiveBoxK positiveBoxM

/-- Exact horizontal budget candidate for the active positive-box expanded payment. -/
abbrev positiveBoxActiveHorizontalBudgetExact : ℂ → ℝ :=
  constantCoreHorizontalUpperQRatio positiveBoxN

/-- Concrete horizontal budget candidate already used by the positive-box ledger. -/
def positiveBoxActiveHorizontalBudgetCandidate : ℂ → ℝ :=
  fun _ => positiveBoxHorizontalUpperValue

/-- Exact margin lower candidate for the active positive-box expanded payment. -/
abbrev positiveBoxActiveMarginLowerExact : ℂ → ℝ :=
  c2ExpandedQuartetResidualMargin

/-- Constant debit from `allowanceLower * verticalTailUpper` for current candidates. -/
def positiveBoxAllowanceTailDebitCandidate : ℂ → ℝ :=
  fun _ => (49 : ℝ) / 9000

/-- The current allowance/tail candidates multiply to the named constant debit. -/
theorem positiveBox_allowance_mul_verticalTail_eq_tailDebit
    (s : ℂ) :
    positiveBoxAllowanceLowerCandidate s *
        positiveBoxVerticalTailUpperCandidate s =
      positiveBoxAllowanceTailDebitCandidate s := by
  norm_num [positiveBoxAllowanceLowerCandidate,
    positiveBoxVerticalTailUpperCandidate,
    positiveBoxAllowanceTailDebitCandidate]

/--
Scalar budget left after choosing exact active upper/lower candidates.
-/
def PositiveBoxExactGapAnchorActiveExactScalarBudgetOnBox : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    (((positiveBoxAllowanceLowerCandidate s *
            positiveBoxVerticalTailUpperCandidate s +
          positiveBoxActiveCentralBudgetExact s +
          positiveBoxActiveCutoffBudgetExact s +
          positiveBoxActiveHorizontalBudgetExact s) *
        (1 + ‖q s‖)) *
      (1 - ‖q s‖)⁻¹ +
      positiveBoxActiveHorizontalBudgetExact s +
      positiveBoxActiveCutoffBudgetExact s ≤
        positiveBoxActiveMarginLowerExact s)

/--
The exact active budget candidates reduce the interval data to one scalar
budget field.
-/
theorem positiveBox_activeExpandedUpperData_exact_of_scalarBudget
    (hbudget :
      PositiveBoxExactGapAnchorActiveExactScalarBudgetOnBox) :
    PositiveBoxExactGapAnchorActiveExpandedUpperData
      positiveBoxActiveCentralBudgetExact
      positiveBoxActiveCutoffBudgetExact
      positiveBoxActiveHorizontalBudgetExact
      positiveBoxActiveMarginLowerExact where
  central_upper := by
    intro s hs
    exact le_rfl
  cutoff_upper := by
    intro s hs
    exact le_rfl
  horizontal_upper := by
    intro s hs
    exact le_rfl
  margin_lower := by
    intro s hs
    exact le_rfl
  scalar_budget := hbudget

/--
The upper/lower interval data imply the active expanded payment.
-/
theorem PositiveBoxExactGapAnchorActiveExpandedUpperData.to_activeExpandedPayment
    {centralBudget cutoffBudget horizontalBudget marginLower : ℂ → ℝ}
    (data :
      PositiveBoxExactGapAnchorActiveExpandedUpperData
        centralBudget cutoffBudget horizontalBudget marginLower) :
    PositiveBoxExactGapAnchorActiveExpandedPaymentOnBox := by
  intro s hs
  have hcentral := data.central_upper hs
  have hcutoff := data.cutoff_upper hs
  have hhorizontal :
      c2HorizontalRegularizedUpper
          (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
          unitScale qNormHorizontalRatio s ≤ horizontalBudget s := by
    simpa [constantCoreHorizontalUpperQRatio] using
      data.horizontal_upper hs
  have hmargin := data.margin_lower hs
  have hq_lt : ‖q s‖ < 1 := positiveBox_q_norm_lt_one hs
  have hscale_nonneg :
      0 ≤ (1 + ‖q s‖) * (1 - ‖q s‖)⁻¹ := by
    have hgap_pos : 0 < 1 - ‖q s‖ := by
      linarith [norm_nonneg (q s), hq_lt]
    have hsum_nonneg : 0 ≤ 1 + ‖q s‖ := by
      linarith [norm_nonneg (q s)]
    exact mul_nonneg hsum_nonneg (inv_nonneg.mpr (le_of_lt hgap_pos))
  have hinside :
      positiveBoxAllowanceLowerCandidate s *
            positiveBoxVerticalTailUpperCandidate s +
          positiveBoxExactCentralUpperCandidate s +
          GenuineMiddleAudit.c2RawCentralCutoffNormConstant
            positiveBoxK positiveBoxM s +
          c2HorizontalRegularizedUpper
            (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
            unitScale qNormHorizontalRatio s ≤
        positiveBoxAllowanceLowerCandidate s *
            positiveBoxVerticalTailUpperCandidate s +
          centralBudget s + cutoffBudget s + horizontalBudget s := by
    linarith
  have hscaled :
      ((positiveBoxAllowanceLowerCandidate s *
              positiveBoxVerticalTailUpperCandidate s +
            positiveBoxExactCentralUpperCandidate s +
            GenuineMiddleAudit.c2RawCentralCutoffNormConstant
              positiveBoxK positiveBoxM s +
            c2HorizontalRegularizedUpper
              (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
              unitScale qNormHorizontalRatio s) *
          (1 + ‖q s‖)) *
        (1 - ‖q s‖)⁻¹ ≤
      ((positiveBoxAllowanceLowerCandidate s *
              positiveBoxVerticalTailUpperCandidate s +
            centralBudget s + cutoffBudget s + horizontalBudget s) *
          (1 + ‖q s‖)) *
        (1 - ‖q s‖)⁻¹ := by
    have hmul :=
      mul_le_mul_of_nonneg_right hinside hscale_nonneg
    simpa [mul_assoc] using hmul
  have hbudget := data.scalar_budget hs
  linarith

/--
Active positive-box bridge: phase data plus the active expanded payment produce
the exact-gap scalar budget for the selected positive-box parameters.
-/
theorem PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeExpandedPayment
    {halfDiskUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (hexp : PositiveBoxExactGapAnchorActiveExpandedPaymentOnBox) :
    PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio
      (positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper) :=
  PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_candidateExpandedPayment
    hphase hexp

/--
Active positive-box bridge from interval-style upper data.
-/
theorem PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeExpandedUpperData
    {halfDiskUpper centralBudget cutoffBudget horizontalBudget marginLower :
      ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (data :
      PositiveBoxExactGapAnchorActiveExpandedUpperData
        centralBudget cutoffBudget horizontalBudget marginLower) :
    PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio
      (positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper) :=
  PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeExpandedPayment
    hphase data.to_activeExpandedPayment

/--
Active positive-box bridge from the exact-candidate scalar budget.
-/
theorem PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeExactScalarBudget
    {halfDiskUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (hbudget :
      PositiveBoxExactGapAnchorActiveExactScalarBudgetOnBox) :
    PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio
      (positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper) :=
  PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeExpandedUpperData
    hphase
    (positiveBox_activeExpandedUpperData_exact_of_scalarBudget hbudget)

/--
Scalar budget after replacing the exact horizontal debit by the certified
positive-box horizontal budget `1 / 100`.
-/
def PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetOnBox :
    Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    (((positiveBoxAllowanceLowerCandidate s *
            positiveBoxVerticalTailUpperCandidate s +
          positiveBoxActiveCentralBudgetExact s +
          positiveBoxActiveCutoffBudgetExact s +
          positiveBoxActiveHorizontalBudgetCandidate s) *
        (1 + ‖q s‖)) *
      (1 - ‖q s‖)⁻¹ +
      positiveBoxActiveHorizontalBudgetCandidate s +
      positiveBoxActiveCutoffBudgetExact s ≤
        positiveBoxActiveMarginLowerExact s)

/--
Simplified scalar budget after replacing the constant allowance/tail product
by `49 / 9000`.
-/
def PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetSimplifiedOnBox :
    Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    (((positiveBoxAllowanceTailDebitCandidate s +
          positiveBoxActiveCentralBudgetExact s +
          positiveBoxActiveCutoffBudgetExact s +
          positiveBoxActiveHorizontalBudgetCandidate s) *
        (1 + ‖q s‖)) *
      (1 - ‖q s‖)⁻¹ +
      positiveBoxActiveHorizontalBudgetCandidate s +
      positiveBoxActiveCutoffBudgetExact s ≤
        positiveBoxActiveMarginLowerExact s)

/--
The horizontal-candidate scalar budget is equivalent to its simplified
`49 / 9000` form.
-/
theorem positiveBox_activeHorizontalCandidateScalarBudget_iff_simplified :
    PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetSimplifiedOnBox ↔
      PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetOnBox := by
  constructor
  · intro hsimp s hs
    have hpoint := hsimp hs
    rw [positiveBox_allowance_mul_verticalTail_eq_tailDebit s]
    exact hpoint
  · intro hbudget s hs
    have hpoint := hbudget hs
    rw [← positiveBox_allowance_mul_verticalTail_eq_tailDebit s]
    exact hpoint

/-- Constant upper for the positive-box resolvent factor `(1 + ‖q‖) / (1 - ‖q‖)`. -/
def positiveBoxActiveResolventFactorCandidate : ℝ :=
  (16 : ℝ) / 9

/-- The positive-box q-bound controls the active resolvent factor by `16 / 9`. -/
theorem positiveBox_activeResolventFactor_le_candidate
    {s : ℂ} (hs : s ∈ positiveBox) :
    (1 + ‖q s‖) * (1 - ‖q s‖)⁻¹ ≤
      positiveBoxActiveResolventFactorCandidate := by
  have hq_upper : ‖q s‖ ≤ (7 : ℝ) / 25 := by
    simpa [positiveBoxQNormSharpUpperValue] using
      positiveBox_q_norm_upper_7_25 hs
  have hden_pos : 0 < 1 - ‖q s‖ := by
    nlinarith [norm_nonneg (q s), hq_upper]
  rw [← div_eq_mul_inv]
  rw [div_le_iff₀ hden_pos]
  norm_num [positiveBoxActiveResolventFactorCandidate]
  nlinarith

/--
Scalar budget after replacing the variable resolvent factor by the constant
`16 / 9`.
-/
def PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetResolventOnBox :
    Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    ((positiveBoxAllowanceTailDebitCandidate s +
          positiveBoxActiveCentralBudgetExact s +
          positiveBoxActiveCutoffBudgetExact s +
          positiveBoxActiveHorizontalBudgetCandidate s) *
        positiveBoxActiveResolventFactorCandidate +
      positiveBoxActiveHorizontalBudgetCandidate s +
      positiveBoxActiveCutoffBudgetExact s ≤
        positiveBoxActiveMarginLowerExact s)

/--
Final interval-certification surface after the positive-box constants have
been fixed: tail debit `49 / 9000`, horizontal debit `1 / 100`, and resolvent
factor `16 / 9`.
-/
structure PositiveBoxExactGapAnchorActiveResolventUpperData
    (centralBudget cutoffBudget marginLower : ℂ → ℝ) : Prop where
  central_upper :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      positiveBoxActiveCentralBudgetExact s ≤ centralBudget s
  cutoff_upper :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      positiveBoxActiveCutoffBudgetExact s ≤ cutoffBudget s
  margin_lower :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      marginLower s ≤ positiveBoxActiveMarginLowerExact s
  scalar_budget :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      ((positiveBoxAllowanceTailDebitCandidate s +
            centralBudget s + cutoffBudget s +
            positiveBoxActiveHorizontalBudgetCandidate s) *
          positiveBoxActiveResolventFactorCandidate +
        positiveBoxActiveHorizontalBudgetCandidate s +
        cutoffBudget s ≤ marginLower s)

/--
Baseline final interval choice: keep the sensitive central, cutoff, and
canonical-margin terms exact.  This is the safe starting point before replacing
each component by a local interval constant.
-/
abbrev positiveBoxActiveCentralBudgetBaseline : ℂ → ℝ :=
  positiveBoxActiveCentralBudgetExact

/-- Baseline exact cutoff budget for the final interval surface. -/
abbrev positiveBoxActiveCutoffBudgetBaseline : ℂ → ℝ :=
  positiveBoxActiveCutoffBudgetExact

/-- Baseline exact canonical margin lower for the final interval surface. -/
abbrev positiveBoxActiveMarginLowerBaseline : ℂ → ℝ :=
  positiveBoxActiveMarginLowerExact

/-- Scalar target for the baseline final interval choice. -/
abbrev PositiveBoxExactGapAnchorActiveBaselineScalarBudgetOnBox : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    ((positiveBoxAllowanceTailDebitCandidate s +
          positiveBoxActiveCentralBudgetBaseline s +
          positiveBoxActiveCutoffBudgetBaseline s +
          positiveBoxActiveHorizontalBudgetCandidate s) *
        positiveBoxActiveResolventFactorCandidate +
      positiveBoxActiveHorizontalBudgetCandidate s +
      positiveBoxActiveCutoffBudgetBaseline s ≤
        positiveBoxActiveMarginLowerBaseline s)

/--
With the baseline exact choices, the final interval data are reduced to the
single baseline scalar budget.
-/
theorem positiveBox_activeResolventUpperData_baseline_of_scalarBudget
    (hbudget :
      PositiveBoxExactGapAnchorActiveBaselineScalarBudgetOnBox) :
    PositiveBoxExactGapAnchorActiveResolventUpperData
      positiveBoxActiveCentralBudgetBaseline
      positiveBoxActiveCutoffBudgetBaseline
      positiveBoxActiveMarginLowerBaseline where
  central_upper := by
    intro s hs
    exact le_rfl
  cutoff_upper := by
    intro s hs
    exact le_rfl
  margin_lower := by
    intro s hs
    exact le_rfl
  scalar_budget := hbudget

/--
The final interval data imply the current constant-resolvent scalar budget.
-/
theorem PositiveBoxExactGapAnchorActiveResolventUpperData.to_resolventBudget
    {centralBudget cutoffBudget marginLower : ℂ → ℝ}
    (data :
      PositiveBoxExactGapAnchorActiveResolventUpperData
        centralBudget cutoffBudget marginLower) :
    PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetResolventOnBox := by
  intro s hs
  have hcentral := data.central_upper hs
  have hcutoff := data.cutoff_upper hs
  have hmargin := data.margin_lower hs
  have hfactor_nonneg :
      0 ≤ positiveBoxActiveResolventFactorCandidate := by
    norm_num [positiveBoxActiveResolventFactorCandidate]
  have hinside :
      positiveBoxAllowanceTailDebitCandidate s +
            positiveBoxActiveCentralBudgetExact s +
            positiveBoxActiveCutoffBudgetExact s +
            positiveBoxActiveHorizontalBudgetCandidate s ≤
        positiveBoxAllowanceTailDebitCandidate s +
            centralBudget s + cutoffBudget s +
            positiveBoxActiveHorizontalBudgetCandidate s := by
    linarith
  have hscaled :
      (positiveBoxAllowanceTailDebitCandidate s +
            positiveBoxActiveCentralBudgetExact s +
            positiveBoxActiveCutoffBudgetExact s +
            positiveBoxActiveHorizontalBudgetCandidate s) *
          positiveBoxActiveResolventFactorCandidate ≤
        (positiveBoxAllowanceTailDebitCandidate s +
            centralBudget s + cutoffBudget s +
            positiveBoxActiveHorizontalBudgetCandidate s) *
          positiveBoxActiveResolventFactorCandidate :=
    mul_le_mul_of_nonneg_right hinside hfactor_nonneg
  have hbudget := data.scalar_budget hs
  linarith

/--
The constant-resolvent scalar budget implies the simplified horizontal scalar
budget.
-/
theorem positiveBox_activeHorizontalCandidateScalarBudgetSimplified_of_resolventBudget
    (hbudget :
      PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetResolventOnBox) :
    PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetSimplifiedOnBox := by
  intro s hs
  let B :=
    positiveBoxAllowanceTailDebitCandidate s +
      positiveBoxActiveCentralBudgetExact s +
      positiveBoxActiveCutoffBudgetExact s +
      positiveBoxActiveHorizontalBudgetCandidate s
  have hfactor := positiveBox_activeResolventFactor_le_candidate hs
  have hB_nonneg : 0 ≤ B := by
    have htail : 0 ≤ positiveBoxAllowanceTailDebitCandidate s := by
      norm_num [positiveBoxAllowanceTailDebitCandidate]
    have hcentral : 0 ≤ positiveBoxActiveCentralBudgetExact s := by
      unfold positiveBoxActiveCentralBudgetExact
        positiveBoxExactCentralUpperCandidate
        c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
      positivity
    have hcutoff : 0 ≤ positiveBoxActiveCutoffBudgetExact s := by
      unfold positiveBoxActiveCutoffBudgetExact
        GenuineMiddleAudit.c2RawCentralCutoffNormConstant
      exact norm_nonneg _
    have hhorizontal : 0 ≤ positiveBoxActiveHorizontalBudgetCandidate s := by
      norm_num [positiveBoxActiveHorizontalBudgetCandidate,
        positiveBoxHorizontalUpperValue]
    dsimp [B]
    linarith
  have hscaled :
      (B * (1 + ‖q s‖)) * (1 - ‖q s‖)⁻¹ ≤
        B * positiveBoxActiveResolventFactorCandidate := by
    have hmul := mul_le_mul_of_nonneg_left hfactor hB_nonneg
    simpa [mul_assoc] using hmul
  have hbudget_point := hbudget hs
  dsimp [B] at hscaled
  have htarget :
      (((B) * (1 + ‖q s‖)) *
        (1 - ‖q s‖)⁻¹ +
        positiveBoxActiveHorizontalBudgetCandidate s +
        positiveBoxActiveCutoffBudgetExact s ≤
          positiveBoxActiveMarginLowerExact s) := by
    linarith
  simpa [B] using htarget

/--
Horizontal upper data plus the horizontal-candidate scalar budget supply the
active expanded upper data.
-/
theorem positiveBox_activeExpandedUpperData_horizontalCandidate_of_horizontalData_scalarBudget
    (hhorizontal : PositiveBoxHorizontalUpperData)
    (hbudget :
      PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetOnBox) :
    PositiveBoxExactGapAnchorActiveExpandedUpperData
      positiveBoxActiveCentralBudgetExact
      positiveBoxActiveCutoffBudgetExact
      positiveBoxActiveHorizontalBudgetCandidate
      positiveBoxActiveMarginLowerExact where
  central_upper := by
    intro s hs
    exact le_rfl
  cutoff_upper := by
    intro s hs
    exact le_rfl
  horizontal_upper := by
    intro s hs
    simpa [positiveBoxActiveHorizontalBudgetCandidate] using
      hhorizontal.horizontal_upper hs
  margin_lower := by
    intro s hs
    exact le_rfl
  scalar_budget := hbudget

/--
Active positive-box bridge from horizontal upper data and the corresponding
horizontal-candidate scalar budget.
-/
theorem PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeHorizontalCandidateScalarBudget
    {halfDiskUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (hhorizontal : PositiveBoxHorizontalUpperData)
    (hbudget :
      PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetOnBox) :
    PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio
      (positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper) :=
  PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeExpandedUpperData
    hphase
    (positiveBox_activeExpandedUpperData_horizontalCandidate_of_horizontalData_scalarBudget
      hhorizontal hbudget)

/--
Version using the existing odd-truncation route to certify the horizontal
candidate.
-/
theorem PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeHorizontalCandidateScalarBudget_ofOddTruncation
    {halfDiskUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (odd_data : PositiveBoxOddTruncationData)
    (hbudget :
      PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetOnBox) :
    PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio
      (positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper) :=
  PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeHorizontalCandidateScalarBudget
    hphase
    (PositiveBoxHorizontalUpperData.ofOddTruncationAndQUpper
      positiveBoxQBounds odd_data)
    hbudget

/--
Active bridge from horizontal upper data and the simplified horizontal scalar
budget.
-/
theorem PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeHorizontalCandidateScalarBudgetSimplified
    {halfDiskUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (hhorizontal : PositiveBoxHorizontalUpperData)
    (hbudget :
      PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetSimplifiedOnBox) :
    PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio
      (positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper) :=
  PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeHorizontalCandidateScalarBudget
    hphase hhorizontal
    ((positiveBox_activeHorizontalCandidateScalarBudget_iff_simplified).1
      hbudget)

/--
Active bridge from horizontal upper data and the constant-resolvent scalar
budget.
-/
theorem PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeHorizontalCandidateScalarBudgetResolvent
    {halfDiskUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (hhorizontal : PositiveBoxHorizontalUpperData)
    (hbudget :
      PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetResolventOnBox) :
    PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio
      (positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper) :=
  PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeHorizontalCandidateScalarBudgetSimplified
    hphase hhorizontal
    (positiveBox_activeHorizontalCandidateScalarBudgetSimplified_of_resolventBudget
      hbudget)

/--
Active bridge from horizontal upper data and the final interval data.
-/
theorem PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeResolventUpperData
    {halfDiskUpper centralBudget cutoffBudget marginLower : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (hhorizontal : PositiveBoxHorizontalUpperData)
    (data :
      PositiveBoxExactGapAnchorActiveResolventUpperData
        centralBudget cutoffBudget marginLower) :
    PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio
      (positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper) :=
  PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeHorizontalCandidateScalarBudgetResolvent
    hphase hhorizontal data.to_resolventBudget

/--
Active bridge from horizontal upper data and the baseline exact scalar budget.
-/
theorem PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeBaselineScalarBudget
    {halfDiskUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (hhorizontal : PositiveBoxHorizontalUpperData)
    (hbudget :
      PositiveBoxExactGapAnchorActiveBaselineScalarBudgetOnBox) :
    PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio
      (positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper) :=
  PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeResolventUpperData
    hphase hhorizontal
    (positiveBox_activeResolventUpperData_baseline_of_scalarBudget hbudget)

/--
Version using the existing odd-truncation route and the simplified scalar
budget.
-/
theorem PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeHorizontalCandidateScalarBudgetSimplified_ofOddTruncation
    {halfDiskUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (odd_data : PositiveBoxOddTruncationData)
    (hbudget :
      PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetSimplifiedOnBox) :
    PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio
      (positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper) :=
  PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeHorizontalCandidateScalarBudgetSimplified
    hphase
    (PositiveBoxHorizontalUpperData.ofOddTruncationAndQUpper
      positiveBoxQBounds odd_data)
    hbudget

/--
Version using the existing odd-truncation route and the constant-resolvent
scalar budget.
-/
theorem PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeHorizontalCandidateScalarBudgetResolvent_ofOddTruncation
    {halfDiskUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (odd_data : PositiveBoxOddTruncationData)
    (hbudget :
      PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetResolventOnBox) :
    PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio
      (positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper) :=
  PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeHorizontalCandidateScalarBudgetResolvent
    hphase
    (PositiveBoxHorizontalUpperData.ofOddTruncationAndQUpper
      positiveBoxQBounds odd_data)
    hbudget

/--
Version using the existing odd-truncation route and the final interval data.
-/
theorem PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeResolventUpperData_ofOddTruncation
    {halfDiskUpper centralBudget cutoffBudget marginLower : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (odd_data : PositiveBoxOddTruncationData)
    (data :
      PositiveBoxExactGapAnchorActiveResolventUpperData
        centralBudget cutoffBudget marginLower) :
    PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio
      (positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper) :=
  PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeResolventUpperData
    hphase
    (PositiveBoxHorizontalUpperData.ofOddTruncationAndQUpper
      positiveBoxQBounds odd_data)
    data

/--
Version using the existing odd-truncation route and the baseline exact scalar
budget.
-/
theorem PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeBaselineScalarBudget_ofOddTruncation
    {halfDiskUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (odd_data : PositiveBoxOddTruncationData)
    (hbudget :
      PositiveBoxExactGapAnchorActiveBaselineScalarBudgetOnBox) :
    PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio
      (positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper) :=
  PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeBaselineScalarBudget
    hphase
    (PositiveBoxHorizontalUpperData.ofOddTruncationAndQUpper
      positiveBoxQBounds odd_data)
    hbudget

/--
Upper bound for the genuine/continued rebasing defect on the selected box.

This is the defect-aware replacement for paying the larger triangular quantity
`‖genuineCentralDoubleSeries‖ + ‖continuedCentralOddChannel‖`.
-/
def PositiveBoxCentralDefectUpperBoundOnBox
    (centralDefectUpper : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    ‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖ ≤
      centralDefectUpper s

/-- Exact central-defect upper for the selected box. -/
def positiveBoxCentralDefectExactUpper : ℂ → ℝ :=
  fun s => ‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖

/-- The exact central-defect upper bounds the rebasing defect definitionally. -/
theorem positiveBox_centralDefect_bound_exact :
    PositiveBoxCentralDefectUpperBoundOnBox
      positiveBoxCentralDefectExactUpper := by
  intro s hs
  rfl

/--
Allowance-lower scalar budget for the defect-aware continued-anchor route.
-/
def PositiveBoxExactGapAnchorDefectAllowanceLowerScalarBudgetOnBox
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      allowanceLower centralDefectUpper : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    allowanceLower s * verticalDepthTailUpper s + centralDefectUpper s ≤
      GenuineMiddleAudit.c2ExactVerticalAnchorResidualNormAllowance
        K M horizontalConstant horizontalScale horizontalRatio s

/--
The existing component-payment shape also certifies the defect-aware
allowance-lower scalar budget.
-/
theorem PositiveBoxExactGapAnchorDefectAllowanceLowerScalarBudgetOnBox.of_componentPayment
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      allowanceLower verticalTailUpper centralDefectUpper
      anchorAllowanceLower : ℂ → ℝ}
    (hallow_nonneg :
      PositiveBoxAllowanceLowerNonnegOnBox allowanceLower)
    (htail :
      PositiveBoxVerticalDepthTailUpperBoundOnBox verticalTailUpper)
    (hanchor :
      PositiveBoxExactVerticalAnchorAllowanceLowerBoundOnBox
        K M horizontalConstant horizontalScale horizontalRatio
        anchorAllowanceLower)
    (hpayment :
      PositiveBoxAllowanceLowerComponentPaymentOnBox
        allowanceLower verticalTailUpper centralDefectUpper
        anchorAllowanceLower) :
    PositiveBoxExactGapAnchorDefectAllowanceLowerScalarBudgetOnBox
      K M horizontalConstant horizontalScale horizontalRatio
      allowanceLower centralDefectUpper := by
  intro s hs
  have htail_mul :
      allowanceLower s * verticalDepthTailUpper s ≤
        allowanceLower s * verticalTailUpper s := by
    exact mul_le_mul_of_nonneg_left (htail hs) (hallow_nonneg hs)
  have hcomponent := hpayment hs
  have hanchor_point := hanchor hs
  linarith

/-- Exact vertical-residual dominance restricted to the selected box. -/
def PositiveBoxExactVerticalResidualDominanceOnBox
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ) :
    Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    GenuineMiddleAudit.C2ExactVerticalResidualDominance
      K M horizontalConstant horizontalScale horizontalRatio s

/--
Defect-aware bridge from phase data and an allowance-lower scalar budget to
exact vertical-residual dominance on the box.
-/
theorem PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_defectAllowanceLower
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper allowanceLower centralDefectUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData oddRef halfDiskUpper allowanceLower)
    (hcentral :
      PositiveBoxCentralDefectUpperBoundOnBox centralDefectUpper)
    (hallow :
      PositiveBoxExactGapAnchorDefectAllowanceLowerScalarBudgetOnBox
        K M horizontalConstant horizontalScale horizontalRatio
        allowanceLower centralDefectUpper) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      K M horizontalConstant horizontalScale horizontalRatio := by
  intro s hs
  let gapUpper := positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper
  have hoff := positiveBox_offCriticalStrip hs
  have hcontinued_gap_on_box :
      PositiveBoxContinuedOddGapBoundOnBox gapUpper :=
    PositiveBoxOddRefGapBound.to_continuedOnBox
      hcompat hphase.to_gapBound
  have hcontinued_gap :
      GenuineMiddleAudit.C2ContinuedOddGapBound gapUpper s :=
    hcontinued_gap_on_box hs
  have hanchor :
      ‖GenuineMiddleAudit.c2ContinuedVerticalAnchorResidual s‖ ≤
        verticalDepthTailUpper s * gapUpper s :=
    GenuineMiddleAudit.c2ContinuedVerticalAnchorResidual_norm_le_gapUpper
      hoff hcontinued_gap
  have hgap_lt_allow :
      gapUpper s < allowanceLower s := by
    simpa [GenuineMiddleAudit.C2ExactGapAnchorFactorUpperLowerBudget,
      gapUpper] using hphase.to_factorUpperLowerBudgetOnBox hs
  have htail_pos : 0 < verticalDepthTailUpper s :=
    verticalDepthTailUpper_pos_of_offCriticalStrip hoff
  have htail_gap_lt :
      verticalDepthTailUpper s * gapUpper s <
        verticalDepthTailUpper s * allowanceLower s :=
    mul_lt_mul_of_pos_left hgap_lt_allow htail_pos
  have hcentral_point := hcentral hs
  have hallow_point := hallow hs
  have hbudget :
      ‖GenuineMiddleAudit.c2ContinuedVerticalAnchorResidual s‖ +
          centralDefectUpper s <
        GenuineMiddleAudit.c2ExactVerticalAnchorResidualNormAllowance
          K M horizontalConstant horizontalScale horizontalRatio s := by
    nlinarith [hanchor, htail_gap_lt, hallow_point]
  exact
    GenuineMiddleAudit.C2ExactVerticalResidualDominance_of_continued_anchor_defect_lt_allowance
      hoff hcentral_point hbudget

/--
Candidate component payment for the defect-aware route.
-/
abbrev PositiveBoxExactGapAnchorDefectCandidateComponentPaymentOnBox
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      centralDefectUpper : ℂ → ℝ) : Prop :=
  PositiveBoxAllowanceLowerComponentPaymentOnBox
    positiveBoxAllowanceLowerCandidate
    positiveBoxVerticalTailUpperCandidate
    centralDefectUpper
    (positiveBoxExactVerticalAnchorAllowanceLowerCandidate
      K M horizontalConstant horizontalScale horizontalRatio)

/--
Current positive-box candidates certify the defect-aware allowance-lower scalar
budget once the component payment is supplied.
-/
theorem PositiveBoxExactGapAnchorDefectAllowanceLowerScalarBudgetOnBox.of_candidatePayment
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      centralDefectUpper : ℂ → ℝ}
    (hpayment :
      PositiveBoxExactGapAnchorDefectCandidateComponentPaymentOnBox
        K M horizontalConstant horizontalScale horizontalRatio
        centralDefectUpper) :
    PositiveBoxExactGapAnchorDefectAllowanceLowerScalarBudgetOnBox
      K M horizontalConstant horizontalScale horizontalRatio
      positiveBoxAllowanceLowerCandidate centralDefectUpper :=
  PositiveBoxExactGapAnchorDefectAllowanceLowerScalarBudgetOnBox.of_componentPayment
    positiveBox_allowanceLower_nonneg_candidate
    positiveBox_verticalDepthTailUpper_bound_candidate
    (positiveBox_exactVerticalAnchorAllowanceLower_bound_candidate
      K M horizontalConstant horizontalScale horizontalRatio)
    hpayment

/--
Defect-aware candidate bridge from phase data and component payment to exact
vertical-residual dominance on the selected box.
-/
theorem PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_defectCandidatePayment
    {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper centralDefectUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (hcentral :
      PositiveBoxCentralDefectUpperBoundOnBox centralDefectUpper)
    (hpayment :
      PositiveBoxExactGapAnchorDefectCandidateComponentPaymentOnBox
        K M horizontalConstant horizontalScale horizontalRatio
        centralDefectUpper) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      K M horizontalConstant horizontalScale horizontalRatio :=
  PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_defectAllowanceLower
    hcompat hphase hcentral
    (PositiveBoxExactGapAnchorDefectAllowanceLowerScalarBudgetOnBox.of_candidatePayment
      hpayment)

/--
Active positive-box defect-aware component payment.
-/
abbrev PositiveBoxExactGapAnchorActiveDefectCandidateComponentPaymentOnBox
    (centralDefectUpper : ℂ → ℝ) : Prop :=
  PositiveBoxExactGapAnchorDefectCandidateComponentPaymentOnBox
    positiveBoxK positiveBoxM
    (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
    unitScale qNormHorizontalRatio
    centralDefectUpper

/--
Resolved scalar target for the active defect-aware route.

Compared with `PositiveBoxExactGapAnchorActiveBaselineScalarBudgetOnBox`, the
central debit is the rebasing-defect upper rather than the triangular sum of
the two central channel norms.
-/
def PositiveBoxExactGapAnchorActiveDefectCandidateScalarBudgetResolventOnBox
    (centralDefectUpper : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    ((positiveBoxAllowanceTailDebitCandidate s +
          centralDefectUpper s +
          positiveBoxActiveCutoffBudgetExact s +
          positiveBoxActiveHorizontalBudgetCandidate s) *
        positiveBoxActiveResolventFactorCandidate +
      positiveBoxActiveHorizontalBudgetCandidate s +
      positiveBoxActiveCutoffBudgetExact s ≤
      positiveBoxActiveMarginLowerExact s)

/--
Raw cutoff budget induced by the continued cutoff certificate plus the
central rebasing defect.

The active middle surface asks for the genuine/raw cutoff.  A continued cutoff
bound pays for that only after adding the central defect.
-/
def positiveBoxActiveCutoffBudgetFromContinuedAndDefect
    (centralDefectBudget : ℂ → ℝ) : ℂ → ℝ :=
  fun s => positiveBoxCutUpperValue + centralDefectBudget s

/--
A positive-box continued cutoff bound supplies the raw active cutoff budget
after paying the central rebasing defect.
-/
theorem positiveBox_activeCutoffBudgetFromContinuedAndDefect_upper
    (cutoffData : PositiveBoxCutoffUpperData)
    {centralDefectBudget : ℂ → ℝ}
    (hcentral :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        positiveBoxCentralDefectExactUpper s ≤ centralDefectBudget s) :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      positiveBoxActiveCutoffBudgetExact s ≤
        positiveBoxActiveCutoffBudgetFromContinuedAndDefect
          centralDefectBudget s := by
  intro s hs
  have hraw :
      ‖c2ConcreteCutoffError positiveBoxK positiveBoxM s‖ ≤
        ‖c2ConcreteCutoffErrorFromTarget continuedCentralOddChannel
            positiveBoxK positiveBoxM s‖ +
          ‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖ :=
    c2ConcreteCutoffError_norm_le_continued_add_centralDefect
      positiveBoxK positiveBoxM s
  have hcontinued :
      ‖c2ConcreteCutoffErrorFromTarget continuedCentralOddChannel
          positiveBoxK positiveBoxM s‖ ≤ positiveBoxCutUpperValue := by
    simpa [c2ContinuedCutoffExactUpper] using
      cutoffData.cutoff_upper_bound hs
  have hdefect :
      ‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖ ≤
        centralDefectBudget s := by
    simpa [positiveBoxCentralDefectExactUpper] using hcentral hs
  have hsum :
      ‖c2ConcreteCutoffErrorFromTarget continuedCentralOddChannel
          positiveBoxK positiveBoxM s‖ +
        ‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖ ≤
          positiveBoxCutUpperValue + centralDefectBudget s := by
    linarith
  have hle :
      ‖c2ConcreteCutoffError positiveBoxK positiveBoxM s‖ ≤
        positiveBoxCutUpperValue + centralDefectBudget s :=
    le_trans hraw hsum
  simpa [positiveBoxActiveCutoffBudgetExact,
    GenuineMiddleAudit.c2RawCentralCutoffNormConstant,
    positiveBoxActiveCutoffBudgetFromContinuedAndDefect] using hle

/--
Final interval-certification surface for the defect-aware route.

This fixes the positive-box constants `49 / 9000`, `1 / 100`, and `16 / 9`,
and leaves only a central-defect upper, a raw-cutoff upper, and a canonical
margin lower.
-/
structure PositiveBoxExactGapAnchorActiveDefectResolventUpperData
    (centralDefectBudget cutoffBudget marginLower : ℂ → ℝ) : Prop where
  central_defect_upper :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      positiveBoxCentralDefectExactUpper s ≤ centralDefectBudget s
  cutoff_upper :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      positiveBoxActiveCutoffBudgetExact s ≤ cutoffBudget s
  margin_lower :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      marginLower s ≤ positiveBoxActiveMarginLowerExact s
  scalar_budget :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      ((positiveBoxAllowanceTailDebitCandidate s +
            centralDefectBudget s + cutoffBudget s +
            positiveBoxActiveHorizontalBudgetCandidate s) *
          positiveBoxActiveResolventFactorCandidate +
        positiveBoxActiveHorizontalBudgetCandidate s +
        cutoffBudget s ≤ marginLower s)

/--
Scalar target when the cutoff budget comes from continued cutoff plus central
defect.  This is intentionally a little more expensive than the raw exact
cutoff target: the defect appears once in the central debit and once in the
cutoff bridge.
-/
def PositiveBoxExactGapAnchorActiveDefectContinuedCutoffScalarBudgetOnBox
    (centralDefectBudget marginLower : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    ((positiveBoxAllowanceTailDebitCandidate s +
          centralDefectBudget s +
          positiveBoxActiveCutoffBudgetFromContinuedAndDefect
            centralDefectBudget s +
          positiveBoxActiveHorizontalBudgetCandidate s) *
        positiveBoxActiveResolventFactorCandidate +
      positiveBoxActiveHorizontalBudgetCandidate s +
      positiveBoxActiveCutoffBudgetFromContinuedAndDefect
        centralDefectBudget s ≤ marginLower s)

/--
Build the defect-aware interval data from continued cutoff data and the
corresponding scalar budget.
-/
theorem positiveBox_activeDefectResolventUpperData_of_continuedCutoffData
    (cutoffData : PositiveBoxCutoffUpperData)
    {centralDefectBudget marginLower : ℂ → ℝ}
    (hcentral :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        positiveBoxCentralDefectExactUpper s ≤ centralDefectBudget s)
    (hmargin :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        marginLower s ≤ positiveBoxActiveMarginLowerExact s)
    (hbudget :
      PositiveBoxExactGapAnchorActiveDefectContinuedCutoffScalarBudgetOnBox
        centralDefectBudget marginLower) :
    PositiveBoxExactGapAnchorActiveDefectResolventUpperData
      centralDefectBudget
      (positiveBoxActiveCutoffBudgetFromContinuedAndDefect
        centralDefectBudget)
      marginLower where
  central_defect_upper := hcentral
  cutoff_upper :=
    positiveBox_activeCutoffBudgetFromContinuedAndDefect_upper
      cutoffData hcentral
  margin_lower := hmargin
  scalar_budget := hbudget

/--
The defect-aware interval data imply the resolved scalar budget with the exact
central-defect upper.
-/
theorem PositiveBoxExactGapAnchorActiveDefectResolventUpperData.to_exactDefectResolventBudget
    {centralDefectBudget cutoffBudget marginLower : ℂ → ℝ}
    (data :
      PositiveBoxExactGapAnchorActiveDefectResolventUpperData
        centralDefectBudget cutoffBudget marginLower) :
    PositiveBoxExactGapAnchorActiveDefectCandidateScalarBudgetResolventOnBox
      positiveBoxCentralDefectExactUpper := by
  intro s hs
  have hdefect := data.central_defect_upper hs
  have hcutoff := data.cutoff_upper hs
  have hmargin := data.margin_lower hs
  have hfactor_nonneg :
      0 ≤ positiveBoxActiveResolventFactorCandidate := by
    norm_num [positiveBoxActiveResolventFactorCandidate]
  have hinside :
      positiveBoxAllowanceTailDebitCandidate s +
            positiveBoxCentralDefectExactUpper s +
            positiveBoxActiveCutoffBudgetExact s +
            positiveBoxActiveHorizontalBudgetCandidate s ≤
        positiveBoxAllowanceTailDebitCandidate s +
            centralDefectBudget s + cutoffBudget s +
            positiveBoxActiveHorizontalBudgetCandidate s := by
    linarith
  have hscaled :
      (positiveBoxAllowanceTailDebitCandidate s +
            positiveBoxCentralDefectExactUpper s +
            positiveBoxActiveCutoffBudgetExact s +
            positiveBoxActiveHorizontalBudgetCandidate s) *
          positiveBoxActiveResolventFactorCandidate ≤
        (positiveBoxAllowanceTailDebitCandidate s +
            centralDefectBudget s + cutoffBudget s +
            positiveBoxActiveHorizontalBudgetCandidate s) *
          positiveBoxActiveResolventFactorCandidate :=
    mul_le_mul_of_nonneg_right hinside hfactor_nonneg
  have hbudget := data.scalar_budget hs
  linarith

/-- Exact-budget baseline for the defect-aware interval surface. -/
abbrev positiveBoxActiveCentralDefectBudgetExact : ℂ → ℝ :=
  positiveBoxCentralDefectExactUpper

/--
Exact central-defect specialization of the continued-cutoff scalar target.
-/
abbrev PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox :
    Prop :=
  PositiveBoxExactGapAnchorActiveDefectContinuedCutoffScalarBudgetOnBox
    positiveBoxActiveCentralDefectBudgetExact
    positiveBoxActiveMarginLowerBaseline

/-- Baseline scalar target for the defect-aware exact budgets. -/
abbrev PositiveBoxExactGapAnchorActiveExactDefectScalarBudgetOnBox : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    ((positiveBoxAllowanceTailDebitCandidate s +
          positiveBoxActiveCentralDefectBudgetExact s +
          positiveBoxActiveCutoffBudgetBaseline s +
          positiveBoxActiveHorizontalBudgetCandidate s) *
        positiveBoxActiveResolventFactorCandidate +
      positiveBoxActiveHorizontalBudgetCandidate s +
      positiveBoxActiveCutoffBudgetBaseline s ≤
        positiveBoxActiveMarginLowerBaseline s)

/--
With exact defect/cutoff/margin choices, the defect-aware interval data reduce
to one scalar budget.
-/
theorem positiveBox_activeDefectResolventUpperData_exact_of_scalarBudget
    (hbudget :
      PositiveBoxExactGapAnchorActiveExactDefectScalarBudgetOnBox) :
    PositiveBoxExactGapAnchorActiveDefectResolventUpperData
      positiveBoxActiveCentralDefectBudgetExact
      positiveBoxActiveCutoffBudgetBaseline
      positiveBoxActiveMarginLowerBaseline where
  central_defect_upper := by
    intro s hs
    exact le_rfl
  cutoff_upper := by
    intro s hs
    exact le_rfl
  margin_lower := by
    intro s hs
    exact le_rfl
  scalar_budget := hbudget

/--
The active defect-aware resolved scalar budget implies the component payment
against the exact vertical-anchor allowance.
-/
theorem positiveBox_activeDefectCandidateComponentPayment_of_resolventBudget
    {centralDefectUpper : ℂ → ℝ}
    (hhorizontal : PositiveBoxHorizontalUpperData)
    (hcentral :
      PositiveBoxCentralDefectUpperBoundOnBox centralDefectUpper)
    (hbudget :
      PositiveBoxExactGapAnchorActiveDefectCandidateScalarBudgetResolventOnBox
        centralDefectUpper) :
    PositiveBoxExactGapAnchorActiveDefectCandidateComponentPaymentOnBox
      centralDefectUpper := by
  intro s hs
  let T := positiveBoxAllowanceTailDebitCandidate s
  let D := centralDefectUpper s
  let C := positiveBoxActiveCutoffBudgetExact s
  let H :=
    c2HorizontalRegularizedUpper
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio s
  let Hc := positiveBoxActiveHorizontalBudgetCandidate s
  let R := (1 + ‖q s‖) * (1 - ‖q s‖)⁻¹
  let Rc := positiveBoxActiveResolventFactorCandidate
  let V := T + D + C
  have hH : H ≤ Hc := by
    simpa [H, Hc, positiveBoxActiveHorizontalBudgetCandidate,
      constantCoreHorizontalUpperQRatio] using
        hhorizontal.horizontal_upper hs
  have hR : R ≤ Rc := by
    simpa [R, Rc] using positiveBox_activeResolventFactor_le_candidate hs
  have hR_nonneg : 0 ≤ R := by
    have hq_lt : ‖q s‖ < 1 := positiveBox_q_norm_lt_one hs
    have hgap_pos : 0 < 1 - ‖q s‖ := by
      linarith [norm_nonneg (q s), hq_lt]
    have hsum_nonneg : 0 ≤ 1 + ‖q s‖ := by
      linarith [norm_nonneg (q s)]
    exact mul_nonneg hsum_nonneg (inv_nonneg.mpr (le_of_lt hgap_pos))
  have hT_nonneg : 0 ≤ T := by
    norm_num [T, positiveBoxAllowanceTailDebitCandidate]
  have hD_nonneg : 0 ≤ D := by
    exact le_trans (norm_nonneg _)
      (by simpa [D] using hcentral hs)
  have hC_nonneg : 0 ≤ C := by
    unfold C positiveBoxActiveCutoffBudgetExact
      GenuineMiddleAudit.c2RawCentralCutoffNormConstant
    exact norm_nonneg _
  have hHc_nonneg : 0 ≤ Hc := by
    norm_num [Hc, positiveBoxActiveHorizontalBudgetCandidate,
      positiveBoxHorizontalUpperValue]
  have hinside :
      V + H ≤ V + Hc := by
    linarith
  have hVHc_nonneg : 0 ≤ V + Hc := by
    dsimp [V]
    linarith
  have hscaled_left :
      (V + H) * R ≤ (V + Hc) * R :=
    mul_le_mul_of_nonneg_right hinside hR_nonneg
  have hscaled_right :
      (V + Hc) * R ≤ (V + Hc) * Rc :=
    mul_le_mul_of_nonneg_left hR hVHc_nonneg
  have hscaled :
      (V + H) * R ≤ (V + Hc) * Rc :=
    le_trans hscaled_left hscaled_right
  have hbudget_point :
      (V + Hc) * Rc + Hc + C ≤ positiveBoxActiveMarginLowerExact s := by
    simpa [
      PositiveBoxExactGapAnchorActiveDefectCandidateScalarBudgetResolventOnBox,
      V, T, D, C, Hc, Rc, add_assoc, add_comm, add_left_comm] using
        hbudget hs
  have hexpanded_local :
      (V + H) * R + H + C ≤ positiveBoxActiveMarginLowerExact s := by
    linarith
  have hexpanded :
      (((V +
            c2HorizontalRegularizedUpper
              (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
              unitScale qNormHorizontalRatio s) *
          (1 + ‖q s‖)) *
        (1 - ‖q s‖)⁻¹ +
        c2HorizontalRegularizedUpper
          (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
          unitScale qNormHorizontalRatio s +
        GenuineMiddleAudit.c2RawCentralCutoffNormConstant
          positiveBoxK positiveBoxM s ≤
          c2ExpandedQuartetResidualMargin s) := by
    simpa [H, R, C, positiveBoxActiveCutoffBudgetExact,
      positiveBoxActiveMarginLowerExact, mul_assoc] using hexpanded_local
  have hv :
      V ≤
        GenuineMiddleAudit.c2ExactVerticalResidualNormAllowance
          positiveBoxK positiveBoxM
          (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
          unitScale qNormHorizontalRatio s :=
    (GenuineMiddleAudit.exactVerticalScalarBudget_iff_budget_le_allowance
      (K := positiveBoxK) (M := positiveBoxM)
      (horizontalConstant := constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      (horizontalScale := unitScale)
      (horizontalRatio := qNormHorizontalRatio)
      (s := s) (positiveBox_offCriticalStrip hs) V).1 hexpanded
  have htail_eq := positiveBox_allowance_mul_verticalTail_eq_tailDebit s
  unfold positiveBoxExactVerticalAnchorAllowanceLowerCandidate
    GenuineMiddleAudit.c2ExactVerticalAnchorResidualNormAllowance
  dsimp [V, T, D, C] at hv ⊢
  rw [htail_eq]
  unfold positiveBoxActiveCutoffBudgetExact at hv
  linarith

/--
Active defect-aware bridge using the current positive-box candidates.
-/
theorem PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectCandidatePayment
    {halfDiskUpper centralDefectUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (hcentral :
      PositiveBoxCentralDefectUpperBoundOnBox centralDefectUpper)
    (hpayment :
      PositiveBoxExactGapAnchorActiveDefectCandidateComponentPaymentOnBox
        centralDefectUpper) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_defectCandidatePayment
    hcompat hphase hcentral hpayment

/--
Active defect-aware bridge from the resolved scalar budget.
-/
theorem PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectCandidateResolventBudget
    {halfDiskUpper centralDefectUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (hhorizontal : PositiveBoxHorizontalUpperData)
    (hcentral :
      PositiveBoxCentralDefectUpperBoundOnBox centralDefectUpper)
    (hbudget :
      PositiveBoxExactGapAnchorActiveDefectCandidateScalarBudgetResolventOnBox
        centralDefectUpper) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectCandidatePayment
    hcompat hphase hcentral
    (positiveBox_activeDefectCandidateComponentPayment_of_resolventBudget
      hhorizontal hcentral hbudget)

/--
Version using the existing odd-truncation route and the resolved defect-aware
scalar budget.
-/
theorem PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectCandidateResolventBudget_ofOddTruncation
    {halfDiskUpper centralDefectUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (odd_data : PositiveBoxOddTruncationData)
    (hcentral :
      PositiveBoxCentralDefectUpperBoundOnBox centralDefectUpper)
    (hbudget :
      PositiveBoxExactGapAnchorActiveDefectCandidateScalarBudgetResolventOnBox
        centralDefectUpper) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectCandidateResolventBudget
    hcompat hphase
    (PositiveBoxHorizontalUpperData.ofOddTruncationAndQUpper
      positiveBoxQBounds odd_data)
    hcentral hbudget

/--
Specialization of the active defect-aware bridge to the exact central-defect
upper.
-/
theorem PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectCandidateResolventBudget
    {halfDiskUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (hhorizontal : PositiveBoxHorizontalUpperData)
    (hbudget :
      PositiveBoxExactGapAnchorActiveDefectCandidateScalarBudgetResolventOnBox
        positiveBoxCentralDefectExactUpper) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectCandidateResolventBudget
    hcompat hphase hhorizontal
    positiveBox_centralDefect_bound_exact hbudget

/--
Odd-truncation specialization with the exact central-defect upper.
-/
theorem PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectCandidateResolventBudget_ofOddTruncation
    {halfDiskUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (odd_data : PositiveBoxOddTruncationData)
    (hbudget :
      PositiveBoxExactGapAnchorActiveDefectCandidateScalarBudgetResolventOnBox
        positiveBoxCentralDefectExactUpper) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectCandidateResolventBudget_ofOddTruncation
    hcompat hphase odd_data
    positiveBox_centralDefect_bound_exact hbudget

/--
Active defect-aware bridge from interval upper/lower data.
-/
theorem PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectResolventUpperData
    {halfDiskUpper centralDefectBudget cutoffBudget marginLower : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (hhorizontal : PositiveBoxHorizontalUpperData)
    (data :
      PositiveBoxExactGapAnchorActiveDefectResolventUpperData
        centralDefectBudget cutoffBudget marginLower) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectCandidateResolventBudget
    hcompat hphase hhorizontal data.to_exactDefectResolventBudget

/--
Version using odd-truncation data and defect-aware interval upper/lower data.
-/
theorem PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectResolventUpperData_ofOddTruncation
    {halfDiskUpper centralDefectBudget cutoffBudget marginLower : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (odd_data : PositiveBoxOddTruncationData)
    (data :
      PositiveBoxExactGapAnchorActiveDefectResolventUpperData
        centralDefectBudget cutoffBudget marginLower) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectResolventUpperData
    hcompat hphase
    (PositiveBoxHorizontalUpperData.ofOddTruncationAndQUpper
      positiveBoxQBounds odd_data)
    data

/--
Active defect-aware bridge using a continued cutoff certificate.  The raw
cutoff budget is rebuilt as continued cutoff plus central defect.
-/
theorem PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectContinuedCutoffScalarBudget
    {halfDiskUpper centralDefectBudget marginLower : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (hhorizontal : PositiveBoxHorizontalUpperData)
    (cutoffData : PositiveBoxCutoffUpperData)
    (hcentral :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        positiveBoxCentralDefectExactUpper s ≤ centralDefectBudget s)
    (hmargin :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        marginLower s ≤ positiveBoxActiveMarginLowerExact s)
    (hbudget :
      PositiveBoxExactGapAnchorActiveDefectContinuedCutoffScalarBudgetOnBox
        centralDefectBudget marginLower) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectResolventUpperData
    hcompat hphase hhorizontal
    (positiveBox_activeDefectResolventUpperData_of_continuedCutoffData
      cutoffData hcentral hmargin hbudget)

/--
Odd-truncation version of the continued-cutoff scalar bridge.
-/
theorem PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectContinuedCutoffScalarBudget_ofOddTruncation
    {halfDiskUpper centralDefectBudget marginLower : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (odd_data : PositiveBoxOddTruncationData)
    (cutoffData : PositiveBoxCutoffUpperData)
    (hcentral :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        positiveBoxCentralDefectExactUpper s ≤ centralDefectBudget s)
    (hmargin :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        marginLower s ≤ positiveBoxActiveMarginLowerExact s)
    (hbudget :
      PositiveBoxExactGapAnchorActiveDefectContinuedCutoffScalarBudgetOnBox
        centralDefectBudget marginLower) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectContinuedCutoffScalarBudget
    hcompat hphase
    (PositiveBoxHorizontalUpperData.ofOddTruncationAndQUpper
      positiveBoxQBounds odd_data)
    cutoffData hcentral hmargin hbudget

/--
Exact-defect specialization of the continued-cutoff scalar bridge.
-/
theorem PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectContinuedCutoffScalarBudget
    {halfDiskUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (hhorizontal : PositiveBoxHorizontalUpperData)
    (cutoffData : PositiveBoxCutoffUpperData)
    (hbudget :
      PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectContinuedCutoffScalarBudget
    hcompat hphase hhorizontal cutoffData
    (by
      intro s hs
      exact le_rfl)
    (by
      intro s hs
      exact le_rfl)
    hbudget

/--
Odd-truncation specialization of the exact-defect continued-cutoff bridge.
-/
theorem PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectContinuedCutoffScalarBudget_ofOddTruncation
    {halfDiskUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (odd_data : PositiveBoxOddTruncationData)
    (cutoffData : PositiveBoxCutoffUpperData)
    (hbudget :
      PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectContinuedCutoffScalarBudget
    hcompat hphase
    (PositiveBoxHorizontalUpperData.ofOddTruncationAndQUpper
      positiveBoxQBounds odd_data)
    cutoffData hbudget

/--
Odd-truncation horizontal data plus odd-reference depth/core cutoff data feed
the exact-defect continued-cutoff bridge.
-/
theorem PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectContinuedCutoffScalarBudget_ofOddTruncation_oddRefDepthCore
    {halfDiskUpper continuedOddUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (odd_data : PositiveBoxOddTruncationData)
    (oddRef_data : PositiveBoxOddRefTruncationData oddRef)
    (hodd :
      PositiveBoxContinuedOddUpperBoundOnBox continuedOddUpper)
    (hcutoffBudget :
      PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox
        continuedOddUpper)
    (hbudget :
      PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectContinuedCutoffScalarBudget_ofOddTruncation
    hcompat hphase odd_data
    (PositiveBoxCutoffUpperData.of_oddRefTruncation_explicitDepthCoreScalarBudget
      hcompat oddRef_data hodd hcutoffBudget)
    hbudget

/--
Exact-odd specialization of the odd-reference depth/core cutoff bridge into the
exact-defect continued-cutoff target.
-/
theorem PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectContinuedCutoffScalarBudget_ofOddTruncation_oddRefExactOddDepthCore
    {halfDiskUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (odd_data : PositiveBoxOddTruncationData)
    (oddRef_data : PositiveBoxOddRefTruncationData oddRef)
    (hcutoffBudget :
      PositiveBoxCutoffExplicitDepthCoreExactOddScalarBudgetOnBox)
    (hbudget :
      PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectContinuedCutoffScalarBudget_ofOddTruncation_oddRefDepthCore
    hcompat hphase odd_data oddRef_data
    positiveBox_continuedOddUpper_bound_exact
    hcutoffBudget
    hbudget

/--
Bridge-bounds package version of the odd-reference depth/core cutoff bridge
into the exact-defect continued-cutoff target.
-/
theorem PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsDepthCore
    {halfDiskUpper continuedOddUpper : ℂ → ℝ}
    {data : GenuineOddContinuationData}
    (hcompat : PositiveBoxOddRefContinuedCompatibility data.oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        data.oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (hhorizontal : PositiveBoxHorizontalUpperData)
    (bounds : PositiveBoxOddRefBridgeBounds data)
    (hodd :
      PositiveBoxContinuedOddUpperBoundOnBox continuedOddUpper)
    (hcutoffBudget :
      PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox
        continuedOddUpper)
    (hbudget :
      PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectContinuedCutoffScalarBudget
    hcompat hphase hhorizontal
    (PositiveBoxCutoffUpperData.of_oddRefBridgeBounds_explicitDepthCoreScalarBudget
      hcompat bounds hodd hcutoffBudget)
    hbudget

/--
Exact-odd specialization of the bridge-bounds depth/core cutoff route.
-/
theorem PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsExactOddDepthCore
    {halfDiskUpper : ℂ → ℝ}
    {data : GenuineOddContinuationData}
    (hcompat : PositiveBoxOddRefContinuedCompatibility data.oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        data.oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (hhorizontal : PositiveBoxHorizontalUpperData)
    (bounds : PositiveBoxOddRefBridgeBounds data)
    (hcutoffBudget :
      PositiveBoxCutoffExplicitDepthCoreExactOddScalarBudgetOnBox)
    (hbudget :
      PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsDepthCore
    hcompat hphase hhorizontal bounds
    positiveBox_continuedOddUpper_bound_exact
    hcutoffBudget
    hbudget

/--
Current exact-defect positive-box frontier for the bridge-bounds depth/core
route.

This is a checklist package: filling these fields closes the local
`PositiveBoxExactVerticalResidualDominanceOnBox` target for the active
parameters.
-/
structure PositiveBoxActiveExactDefectBridgeBoundsDepthCoreFrontier
    (data : GenuineOddContinuationData)
    (halfDiskUpper continuedOddUpper : ℂ → ℝ) : Prop where
  continued_compat :
    PositiveBoxOddRefContinuedCompatibility data.oddRef
  phase :
    PositiveBoxOddRefPhaseData
      data.oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate
  horizontal :
    PositiveBoxHorizontalUpperData
  bridge_bounds :
    PositiveBoxOddRefBridgeBounds data
  continued_odd_upper :
    PositiveBoxContinuedOddUpperBoundOnBox continuedOddUpper
  cutoff_depth_core_budget :
    PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox
      continuedOddUpper
  defect_continued_cutoff_budget :
    PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox

/-- The current depth/core frontier package closes the local exact-defect target. -/
theorem PositiveBoxActiveExactDefectBridgeBoundsDepthCoreFrontier.to_verticalResidualDominance
    {data : GenuineOddContinuationData}
    {halfDiskUpper continuedOddUpper : ℂ → ℝ}
    (frontier :
      PositiveBoxActiveExactDefectBridgeBoundsDepthCoreFrontier
        data halfDiskUpper continuedOddUpper) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsDepthCore
    frontier.continued_compat
    frontier.phase
    frontier.horizontal
    frontier.bridge_bounds
    frontier.continued_odd_upper
    frontier.cutoff_depth_core_budget
    frontier.defect_continued_cutoff_budget

/--
Build the current frontier from raw positive-box odd-truncation data for the
horizontal field.
-/
theorem PositiveBoxActiveExactDefectBridgeBoundsDepthCoreFrontier.ofOddTruncation
    {data : GenuineOddContinuationData}
    {halfDiskUpper continuedOddUpper : ℂ → ℝ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility data.oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        data.oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (odd_data : PositiveBoxOddTruncationData)
    (bounds : PositiveBoxOddRefBridgeBounds data)
    (hodd :
      PositiveBoxContinuedOddUpperBoundOnBox continuedOddUpper)
    (hcutoffBudget :
      PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox
        continuedOddUpper)
    (hbudget :
      PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox) :
    PositiveBoxActiveExactDefectBridgeBoundsDepthCoreFrontier
      data halfDiskUpper continuedOddUpper where
  continued_compat := hcompat
  phase := hphase
  horizontal :=
    PositiveBoxHorizontalUpperData.ofOddTruncationAndQUpper
      positiveBoxQBounds odd_data
  bridge_bounds := bounds
  continued_odd_upper := hodd
  cutoff_depth_core_budget := hcutoffBudget
  defect_continued_cutoff_budget := hbudget

/--
Raw odd-truncation data, together with the other frontier fields, closes the
local exact-defect target.
-/
theorem PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsDepthCore_ofOddTruncation
    {data : GenuineOddContinuationData}
    {halfDiskUpper continuedOddUpper : ℂ → ℝ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility data.oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        data.oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (odd_data : PositiveBoxOddTruncationData)
    (bounds : PositiveBoxOddRefBridgeBounds data)
    (hodd :
      PositiveBoxContinuedOddUpperBoundOnBox continuedOddUpper)
    (hcutoffBudget :
      PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox
        continuedOddUpper)
    (hbudget :
      PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  (PositiveBoxActiveExactDefectBridgeBoundsDepthCoreFrontier.ofOddTruncation
    hcompat hphase odd_data bounds hodd hcutoffBudget hbudget
  ).to_verticalResidualDominance

/--
Build the current frontier from explicit raw odd-channel truncation data.
-/
theorem PositiveBoxActiveExactDefectBridgeBoundsDepthCoreFrontier.ofRawOddTruncation
    {data : GenuineOddContinuationData}
    {halfDiskUpper continuedOddUpper : ℂ → ℝ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility data.oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        data.oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (raw_odd_data : PositiveBoxRawOddTruncationData)
    (bounds : PositiveBoxOddRefBridgeBounds data)
    (hodd :
      PositiveBoxContinuedOddUpperBoundOnBox continuedOddUpper)
    (hcutoffBudget :
      PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox
        continuedOddUpper)
    (hbudget :
      PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox) :
    PositiveBoxActiveExactDefectBridgeBoundsDepthCoreFrontier
      data halfDiskUpper continuedOddUpper :=
  PositiveBoxActiveExactDefectBridgeBoundsDepthCoreFrontier.ofOddTruncation
    hcompat hphase raw_odd_data.toOddTruncationData bounds
    hodd hcutoffBudget hbudget

/--
Explicit raw odd-channel truncation data, together with the other frontier
fields, closes the local exact-defect target.
-/
theorem PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsDepthCore_ofRawOddTruncation
    {data : GenuineOddContinuationData}
    {halfDiskUpper continuedOddUpper : ℂ → ℝ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility data.oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        data.oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (raw_odd_data : PositiveBoxRawOddTruncationData)
    (bounds : PositiveBoxOddRefBridgeBounds data)
    (hodd :
      PositiveBoxContinuedOddUpperBoundOnBox continuedOddUpper)
    (hcutoffBudget :
      PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox
        continuedOddUpper)
    (hbudget :
      PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  (PositiveBoxActiveExactDefectBridgeBoundsDepthCoreFrontier.ofRawOddTruncation
    hcompat hphase raw_odd_data bounds hodd hcutoffBudget hbudget
  ).to_verticalResidualDominance

/--
Exact-odd specialization of the current positive-box frontier.
-/
structure PositiveBoxActiveExactDefectBridgeBoundsExactOddFrontier
    (data : GenuineOddContinuationData)
    (halfDiskUpper : ℂ → ℝ) : Prop where
  continued_compat :
    PositiveBoxOddRefContinuedCompatibility data.oddRef
  phase :
    PositiveBoxOddRefPhaseData
      data.oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate
  horizontal :
    PositiveBoxHorizontalUpperData
  bridge_bounds :
    PositiveBoxOddRefBridgeBounds data
  cutoff_depth_core_budget :
    PositiveBoxCutoffExplicitDepthCoreExactOddScalarBudgetOnBox
  defect_continued_cutoff_budget :
    PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox

/-- The exact-odd frontier package closes the local exact-defect target. -/
theorem PositiveBoxActiveExactDefectBridgeBoundsExactOddFrontier.to_verticalResidualDominance
    {data : GenuineOddContinuationData}
    {halfDiskUpper : ℂ → ℝ}
    (frontier :
      PositiveBoxActiveExactDefectBridgeBoundsExactOddFrontier
        data halfDiskUpper) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsExactOddDepthCore
    frontier.continued_compat
    frontier.phase
    frontier.horizontal
    frontier.bridge_bounds
    frontier.cutoff_depth_core_budget
    frontier.defect_continued_cutoff_budget

/--
Build the exact-odd frontier from raw positive-box odd-truncation data for the
horizontal field.
-/
theorem PositiveBoxActiveExactDefectBridgeBoundsExactOddFrontier.ofOddTruncation
    {data : GenuineOddContinuationData}
    {halfDiskUpper : ℂ → ℝ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility data.oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        data.oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (odd_data : PositiveBoxOddTruncationData)
    (bounds : PositiveBoxOddRefBridgeBounds data)
    (hcutoffBudget :
      PositiveBoxCutoffExplicitDepthCoreExactOddScalarBudgetOnBox)
    (hbudget :
      PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox) :
    PositiveBoxActiveExactDefectBridgeBoundsExactOddFrontier
      data halfDiskUpper where
  continued_compat := hcompat
  phase := hphase
  horizontal :=
    PositiveBoxHorizontalUpperData.ofOddTruncationAndQUpper
      positiveBoxQBounds odd_data
  bridge_bounds := bounds
  cutoff_depth_core_budget := hcutoffBudget
  defect_continued_cutoff_budget := hbudget

/--
Exact-odd raw odd-truncation data, together with the other frontier fields,
closes the local exact-defect target.
-/
theorem PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsExactOddDepthCore_ofOddTruncation
    {data : GenuineOddContinuationData}
    {halfDiskUpper : ℂ → ℝ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility data.oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        data.oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (odd_data : PositiveBoxOddTruncationData)
    (bounds : PositiveBoxOddRefBridgeBounds data)
    (hcutoffBudget :
      PositiveBoxCutoffExplicitDepthCoreExactOddScalarBudgetOnBox)
    (hbudget :
      PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  (PositiveBoxActiveExactDefectBridgeBoundsExactOddFrontier.ofOddTruncation
    hcompat hphase odd_data bounds hcutoffBudget hbudget
  ).to_verticalResidualDominance

/--
Build the exact-odd frontier from explicit raw odd-channel truncation data.
-/
theorem PositiveBoxActiveExactDefectBridgeBoundsExactOddFrontier.ofRawOddTruncation
    {data : GenuineOddContinuationData}
    {halfDiskUpper : ℂ → ℝ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility data.oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        data.oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (raw_odd_data : PositiveBoxRawOddTruncationData)
    (bounds : PositiveBoxOddRefBridgeBounds data)
    (hcutoffBudget :
      PositiveBoxCutoffExplicitDepthCoreExactOddScalarBudgetOnBox)
    (hbudget :
      PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox) :
    PositiveBoxActiveExactDefectBridgeBoundsExactOddFrontier
      data halfDiskUpper :=
  PositiveBoxActiveExactDefectBridgeBoundsExactOddFrontier.ofOddTruncation
    hcompat hphase raw_odd_data.toOddTruncationData bounds
    hcutoffBudget hbudget

/--
Explicit raw odd-channel truncation data, together with the other exact-odd
frontier fields, closes the local exact-defect target.
-/
theorem PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsExactOddDepthCore_ofRawOddTruncation
    {data : GenuineOddContinuationData}
    {halfDiskUpper : ℂ → ℝ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility data.oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        data.oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (raw_odd_data : PositiveBoxRawOddTruncationData)
    (bounds : PositiveBoxOddRefBridgeBounds data)
    (hcutoffBudget :
      PositiveBoxCutoffExplicitDepthCoreExactOddScalarBudgetOnBox)
    (hbudget :
      PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  (PositiveBoxActiveExactDefectBridgeBoundsExactOddFrontier.ofRawOddTruncation
    hcompat hphase raw_odd_data bounds hcutoffBudget hbudget
  ).to_verticalResidualDominance

/--
Flexible cutoff frontier for the active exact-defect positive-box target.

This is the preferred cutoff-facing frontier when the horizontal
`positiveBoxOddTruncationUpperValue` is too coarse for the cutoff depth/core
budget.
-/
structure PositiveBoxActiveExactDefectFlexibleCutoffDepthCoreFrontier
    (data : GenuineOddContinuationData)
    (halfDiskUpper : ℂ → ℝ)
    (oddTruncationUpper continuedOddUpper : ℂ → ℝ) : Prop where
  continued_compat :
    PositiveBoxOddRefContinuedCompatibility data.oddRef
  phase :
    PositiveBoxOddRefPhaseData
      data.oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate
  horizontal :
    PositiveBoxHorizontalUpperData
  continued_odd_truncation :
    PositiveBoxContinuedOddTruncationUpperBoundOnBox oddTruncationUpper
  continued_odd_upper :
    PositiveBoxContinuedOddUpperBoundOnBox continuedOddUpper
  cutoff_depth_core_budget :
    PositiveBoxCutoffExplicitDepthCoreFlexibleScalarBudgetOnBox
      oddTruncationUpper continuedOddUpper
  defect_continued_cutoff_budget :
    PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox

/-- The flexible cutoff frontier closes the local exact-defect target. -/
theorem PositiveBoxActiveExactDefectFlexibleCutoffDepthCoreFrontier.to_verticalResidualDominance
    {data : GenuineOddContinuationData}
    {halfDiskUpper : ℂ → ℝ}
    {oddTruncationUpper continuedOddUpper : ℂ → ℝ}
    (frontier :
      PositiveBoxActiveExactDefectFlexibleCutoffDepthCoreFrontier
        data halfDiskUpper oddTruncationUpper continuedOddUpper) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectContinuedCutoffScalarBudget
    frontier.continued_compat
    frontier.phase
    frontier.horizontal
    (PositiveBoxCutoffUpperData.of_explicitDepthCoreFlexibleScalarBudget
      frontier.continued_odd_truncation
      frontier.continued_odd_upper
      frontier.cutoff_depth_core_budget)
    frontier.defect_continued_cutoff_budget

/--
Exact-odd specialization of the flexible cutoff frontier.
-/
structure PositiveBoxActiveExactDefectFlexibleCutoffExactOddFrontier
    (data : GenuineOddContinuationData)
    (halfDiskUpper : ℂ → ℝ)
    (oddTruncationUpper : ℂ → ℝ) : Prop where
  continued_compat :
    PositiveBoxOddRefContinuedCompatibility data.oddRef
  phase :
    PositiveBoxOddRefPhaseData
      data.oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate
  horizontal :
    PositiveBoxHorizontalUpperData
  continued_odd_truncation :
    PositiveBoxContinuedOddTruncationUpperBoundOnBox oddTruncationUpper
  cutoff_depth_core_budget :
    PositiveBoxCutoffExplicitDepthCoreFlexibleExactOddScalarBudgetOnBox
      oddTruncationUpper
  defect_continued_cutoff_budget :
    PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox

/-- The flexible exact-odd cutoff frontier closes the local exact-defect target. -/
theorem PositiveBoxActiveExactDefectFlexibleCutoffExactOddFrontier.to_verticalResidualDominance
    {data : GenuineOddContinuationData}
    {halfDiskUpper : ℂ → ℝ}
    {oddTruncationUpper : ℂ → ℝ}
    (frontier :
      PositiveBoxActiveExactDefectFlexibleCutoffExactOddFrontier
        data halfDiskUpper oddTruncationUpper) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectContinuedCutoffScalarBudget
    frontier.continued_compat
    frontier.phase
    frontier.horizontal
    (PositiveBoxCutoffUpperData.of_explicitDepthCoreFlexibleExactOddScalarBudget
      frontier.continued_odd_truncation
      frontier.cutoff_depth_core_budget)
    frontier.defect_continued_cutoff_budget

/--
Phase-driven flexible cutoff frontier for the active exact-defect target.

This is more honest than the exact-odd specialization when using the phase
package: the phase gives a norm upper for the continued odd channel, while the
cutoff still asks for an independent odd-core truncation upper.
-/
structure PositiveBoxActiveExactDefectPhaseCutoffFrontier
    (data : GenuineOddContinuationData)
    (halfDiskUpper oddTruncationUpper : ℂ → ℝ) : Prop where
  continued_compat :
    PositiveBoxOddRefContinuedCompatibility data.oddRef
  phase :
    PositiveBoxOddRefPhaseData
      data.oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate
  horizontal :
    PositiveBoxHorizontalUpperData
  oddRef_truncation :
    PositiveBoxOddRefTruncationUpperBoundOnBox
      data.oddRef oddTruncationUpper
  cutoff_depth_core_budget :
    PositiveBoxCutoffExplicitDepthCoreFlexibleScalarBudgetOnBox
      oddTruncationUpper positiveBoxContinuedOddUpperPhaseCandidate
  defect_continued_cutoff_budget :
    PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox

/-- The phase-driven flexible cutoff frontier closes the local exact-defect target. -/
theorem PositiveBoxActiveExactDefectPhaseCutoffFrontier.to_verticalResidualDominance
    {data : GenuineOddContinuationData}
    {halfDiskUpper oddTruncationUpper : ℂ → ℝ}
    (frontier :
      PositiveBoxActiveExactDefectPhaseCutoffFrontier
        data halfDiskUpper oddTruncationUpper) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectContinuedCutoffScalarBudget
    frontier.continued_compat
    frontier.phase
    frontier.horizontal
    (PositiveBoxCutoffUpperData.of_explicitDepthCoreFlexibleScalarBudget
      (PositiveBoxContinuedOddTruncationUpperBoundOnBox.of_oddRefTruncationUpper
        frontier.continued_compat
        frontier.oddRef_truncation)
      (PositiveBoxOddRefPhaseData.to_continuedOddUpperBoundOnBox_candidate
        frontier.continued_compat
        frontier.phase)
      frontier.cutoff_depth_core_budget)
    frontier.defect_continued_cutoff_budget

/--
The phase-cutoff frontier is not a viable target with the current triangular
depth/core cutoff budget.
-/
theorem not_PositiveBoxActiveExactDefectPhaseCutoffFrontier
    {data : GenuineOddContinuationData}
    {halfDiskUpper oddTruncationUpper : ℂ → ℝ} :
    ¬ PositiveBoxActiveExactDefectPhaseCutoffFrontier
        data halfDiskUpper oddTruncationUpper := by
  intro frontier
  let s : ℂ := { re := positiveBoxSigmaMin, im := positiveBoxTMin }
  have hs : s ∈ positiveBox := by
    simpa [s] using positiveBox_corner_mem
  have htrunc := frontier.oddRef_truncation hs
  have htrunc_nonneg : 0 ≤ oddTruncationUpper s :=
    le_trans (norm_nonneg _) htrunc
  exact
    (not_positiveBoxCutoffExplicitDepthCoreFlexibleScalarBudgetOnBox_phaseCandidate_at
      hs htrunc_nonneg) frontier.cutoff_depth_core_budget

/--
Active bridge from the exact-budget defect-aware scalar target.
-/
theorem PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectScalarBudget
    {halfDiskUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (hhorizontal : PositiveBoxHorizontalUpperData)
    (hbudget :
      PositiveBoxExactGapAnchorActiveExactDefectScalarBudgetOnBox) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectResolventUpperData
    hcompat hphase hhorizontal
    (positiveBox_activeDefectResolventUpperData_exact_of_scalarBudget
      hbudget)

/--
Odd-truncation version of the exact-budget defect-aware bridge.
-/
theorem PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectScalarBudget_ofOddTruncation
    {halfDiskUpper : ℂ → ℝ}
    {oddRef : ℂ → ℂ}
    (hcompat : PositiveBoxOddRefContinuedCompatibility oddRef)
    (hphase :
      PositiveBoxOddRefPhaseData
        oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate)
    (odd_data : PositiveBoxOddTruncationData)
    (hbudget :
      PositiveBoxExactGapAnchorActiveExactDefectScalarBudgetOnBox) :
    PositiveBoxExactVerticalResidualDominanceOnBox
      positiveBoxK positiveBoxM
      (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
      unitScale qNormHorizontalRatio :=
  PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectResolventUpperData_ofOddTruncation
    hcompat hphase odd_data
    (positiveBox_activeDefectResolventUpperData_exact_of_scalarBudget
      hbudget)

/-- Named specialization for `GenuineOddContinuationData`. -/
abbrev PositiveBoxGenuineOddRefPhaseData
    (data : GenuineOddContinuationData)
    (halfDiskUpper allowanceLower : ℂ → ℝ) : Prop :=
  PositiveBoxOddRefPhaseData data.oddRef halfDiskUpper allowanceLower

end

end ContinuedQuartetAudit
end C2
