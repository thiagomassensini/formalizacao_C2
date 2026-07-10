import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S084T7
import LeanC2.AuditProjectedJ0PositiveBoxRectangleExternalConfig
import LeanC2.AuditProjectedJ0PositiveBoxSubboxCoverage

/-!
# Rectangle certificate data for the s0.84_t7 sentinel

The 32 subboxes contain exact rational rectangle data and arithmetic proofs.
Membership of the four projected-j0 values in those rectangles remains an
explicit analytic hypothesis.
-/

namespace C2
namespace ProjectedJ0PositiveBoxSkeleton

open AdjustedQuartetProjectedJ0Aliases
open ProjectedJ0RectangleArithmetic

private abbrev sentinelCoreCutoff : ℕ → ℕ :=
  C2.ProjectedJ0PositiveBoxRectangleData.positiveBoxRectangleCoreCutoff

private abbrev sentinelK : ℕ :=
  C2.ProjectedJ0PositiveBoxRectangleData.positiveBoxRectangleK

private abbrev sentinelMidx : ℕ :=
  C2.ProjectedJ0PositiveBoxRectangleData.positiveBoxRectangleMidx

def s084T7RectangleCertificateData
    (i : PositiveBoxSubboxId)
    (hi : i ∈ positiveBoxSubboxesOf .s084_t7) :=
  ProjectedJ0PositiveBoxRectangleData.S084T7.certificate i hi

theorem s084T7RectangleSubboxes_card :
    (positiveBoxSubboxesOf .s084_t7).card = 32 := by
  decide

/-- The only analytic input to the sentinel rectangle bridge. -/
structure S084T7RectangleAnalyticEnclosureHypotheses
    (tiltSeed : ℂ → ℂ) : Prop where
  M_mem :
    ∀ (i : PositiveBoxSubboxId)
      (hi : i ∈ positiveBoxSubboxesOf .s084_t7)
      (s : ℂ) (_hs : s ∈ positiveBoxSubboxRegion i),
      (s084T7RectangleCertificateData i hi).MRect.toComplexRect.Contains
        (adjustedProjectedJ0_M tiltSeed s)
  D0_mem :
    ∀ (i : PositiveBoxSubboxId)
      (hi : i ∈ positiveBoxSubboxesOf .s084_t7)
      (s : ℂ) (_hs : s ∈ positiveBoxSubboxRegion i),
      (s084T7RectangleCertificateData i hi).D0Rect.toComplexRect.Contains
        (adjustedProjectedJ0_D0 sentinelCoreCutoff s)
  Drest_mem :
    ∀ (i : PositiveBoxSubboxId)
      (hi : i ∈ positiveBoxSubboxesOf .s084_t7)
      (s : ℂ) (_hs : s ∈ positiveBoxSubboxRegion i),
      (s084T7RectangleCertificateData i hi).DrestRect.toComplexRect.Contains
        (adjustedProjectedJ0_Drest sentinelCoreCutoff s)
  RvecTail_mem :
    ∀ (i : PositiveBoxSubboxId)
      (hi : i ∈ positiveBoxSubboxesOf .s084_t7)
      (s : ℂ) (_hs : s ∈ positiveBoxSubboxRegion i),
      (s084T7RectangleCertificateData i hi).RvecTailRect.toComplexRect.Contains
        (adjustedProjectedJ0_RvecTail
          tiltSeed sentinelCoreCutoff sentinelK sentinelMidx s)

noncomputable def s084T7RectangleBridgeData
    {tiltSeed : ℂ → ℂ}
    (h : S084T7RectangleAnalyticEnclosureHypotheses tiltSeed)
    (i : PositiveBoxSubboxId)
    (hi : i ∈ positiveBoxSubboxesOf .s084_t7)
    (s : ℂ) (hs : s ∈ positiveBoxSubboxRegion i) :
    ProjectedJ0SubboxSectorBridgeData
      (adjustedProjectedJ0_M tiltSeed s)
      (adjustedProjectedJ0_D0 sentinelCoreCutoff s)
      (adjustedProjectedJ0_Drest sentinelCoreCutoff s)
      (adjustedProjectedJ0_RvecTail
        tiltSeed sentinelCoreCutoff sentinelK sentinelMidx s)
      ((positiveBoxCombinedCert .s084_t7).constants.mainLower : ℝ)
      ((positiveBoxCombinedCert .s084_t7).constants.d0NegReUpper : ℝ)
      ((positiveBoxCombinedCert .s084_t7).constants.restUpper : ℝ) :=
  (s084T7RectangleCertificateData i hi).toSectorBridgeData
    (h.M_mem i hi s hs)
    (h.D0_mem i hi s hs)
    (h.Drest_mem i hi s hs)
    (h.RvecTail_mem i hi s hs)

noncomputable def s084T7RectangleSubboxCoverData
    {tiltSeed : ℂ → ℂ}
    (h : S084T7RectangleAnalyticEnclosureHypotheses tiltSeed) :
    ProjectedJ0SubboxCoverData
      (positiveBoxRegion .s084_t7)
      PositiveBoxSubboxId
      (positiveBoxSubboxesOf .s084_t7)
      positiveBoxSubboxRegion
      tiltSeed sentinelCoreCutoff sentinelK sentinelMidx
      ((positiveBoxCombinedCert .s084_t7).constants.mainLower : ℝ)
      ((positiveBoxCombinedCert .s084_t7).constants.d0NegReUpper : ℝ)
      ((positiveBoxCombinedCert .s084_t7).constants.restUpper : ℝ) where
  cover := positiveBox_subbox_cover_s084_t7
  main_lower_subbox := by
    intro i hi s hs
    exact (s084T7RectangleBridgeData h i hi s hs).main_lower
  d0_neg_subbox := by
    intro i hi s hs
    exact (s084T7RectangleBridgeData h i hi s hs).d0_neg_re_upper
  rest_upper_subbox := by
    intro i hi s hs
    exact (s084T7RectangleBridgeData h i hi s hs).rest_upper

theorem s084T7_totalFinite_ne_zero_of_rectangle_membership
    {tiltSeed : ℂ → ℂ}
    (h : S084T7RectangleAnalyticEnclosureHypotheses tiltSeed) :
    ∀ s ∈ positiveBoxRegion .s084_t7,
      adjustedProjectedJ0_totalFinite
        tiltSeed sentinelCoreCutoff sentinelK sentinelMidx s ≠ 0 := by
  exact (positiveBoxCombinedCert .s084_t7).total_ne_zero_of_subbox_cover
    (s084T7RectangleSubboxCoverData h)

end ProjectedJ0PositiveBoxSkeleton
end C2
