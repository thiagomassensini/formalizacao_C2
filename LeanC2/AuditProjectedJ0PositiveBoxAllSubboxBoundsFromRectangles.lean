import LeanC2.AuditProjectedJ0PositiveBoxSubboxCoverage
import LeanC2.AuditProjectedJ0SubboxToSectorBridge

/-!
# Positive-box all-subbox bounds from rectangles

This file adapts one rectangle bridge contract for every certified positive-box
subbox to `PositiveBoxAllSubboxBounds`.  It contains no concrete rectangle data
and does not prove the analytic generation of rectangle enclosures.
-/

namespace C2
namespace ProjectedJ0PositiveBoxSkeleton

open ProjectedJ0RectangleArithmetic
open AdjustedQuartetProjectedJ0Aliases

/--
Rectangle-backed bounds for all 771 positive-box subboxes.  Each bridge value
contains rectangle membership, derived projection bounds, modulus certificates,
and comparisons with the rationalized constants of its parent box.
-/
structure PositiveBoxAllSubboxRectangleBounds
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K Midx : ℕ) where
  bridge :
    ∀ b ∈ positiveBoxes,
      ∀ i ∈ positiveBoxSubboxesOf b,
        ∀ s ∈ positiveBoxSubboxRegion i,
          ProjectedJ0SubboxSectorBridgeData
            (adjustedProjectedJ0_M tiltSeed s)
            (adjustedProjectedJ0_D0 coreCutoff s)
            (adjustedProjectedJ0_Drest coreCutoff s)
            (adjustedProjectedJ0_RvecTail tiltSeed coreCutoff K Midx s)
            ((positiveBoxCombinedCert b).constants.mainLower : ℝ)
            ((positiveBoxCombinedCert b).constants.d0NegReUpper : ℝ)
            ((positiveBoxCombinedCert b).constants.restUpper : ℝ)

namespace PositiveBoxAllSubboxRectangleBounds

/-- Forget the rectangle witnesses after deriving the three subbox bounds. -/
theorem toPositiveBoxAllSubboxBounds
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K Midx : ℕ}
    (bounds : PositiveBoxAllSubboxRectangleBounds tiltSeed coreCutoff K Midx) :
    PositiveBoxAllSubboxBounds tiltSeed coreCutoff K Midx where
  main_lower := by
    intro b hb i hi s hs
    exact (bounds.bridge b hb i hi s hs).main_lower
  d0_neg_upper := by
    intro b hb i hi s hs
    exact (bounds.bridge b hb i hi s hs).d0_neg_re_upper
  rest_upper := by
    intro b hb i hi s hs
    exact (bounds.bridge b hb i hi s hs).rest_upper

end PositiveBoxAllSubboxRectangleBounds

/--
The positive-box finite model is nonzero once every subbox supplies its
rectangle bridge data.  Subbox coverage is discharged by
`positiveBox_all_subbox_cover` through the no-cover-hypothesis theorem.
-/
theorem positiveBox_totalFinite_ne_zero_of_all_subbox_rectangle_bounds
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K Midx : ℕ}
    (bounds : PositiveBoxAllSubboxRectangleBounds tiltSeed coreCutoff K Midx) :
    ∀ s ∈ positiveGlobalRegion,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K Midx s ≠ 0 := by
  exact positiveBox_totalFinite_ne_zero_of_all_subbox_bounds_no_cover_hyp
    bounds.toPositiveBoxAllSubboxBounds

end ProjectedJ0PositiveBoxSkeleton
end C2
