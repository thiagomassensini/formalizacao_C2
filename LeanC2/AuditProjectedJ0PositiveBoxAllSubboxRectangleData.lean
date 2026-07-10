import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S084T0
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S084T1
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S084T2
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S084T3
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S084T4
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S084T5
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S084T6
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S084T7
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S084T8
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S085T0
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S085T1
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S085T2
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S085T3
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S085T4
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S085T5
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S085T6
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S085T7
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S085T8
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S086T0
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S086T1
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S086T2
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S086T3
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S086T4
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S086T5
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S086T6
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S086T7
import LeanC2.Generated.ProjectedJ0PositiveBoxRectangleData.S086T8
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxBoundsFromRectangles
import LeanC2.AuditProjectedJ0PositiveBoxRectangleExternalConfig

/-!
# Exact rectangle data for all positive-box subboxes

The generated shards supply exact rational rectangle data and arithmetic for
all 771 subboxes.  This file dispatches those data by the formal box/subbox
identifiers and keeps analytic enclosure membership as four explicit
hypotheses.  No membership statement is inferred from the generated data.
-/

namespace C2
namespace ProjectedJ0PositiveBoxSkeleton

open AdjustedQuartetProjectedJ0Aliases
open ProjectedJ0RectangleArithmetic

/-- The horizontal cutoff recorded by the external rectangle-data producer. -/
abbrev positiveBoxRectangleDataCoreCutoff : ℕ → ℕ :=
  C2.ProjectedJ0PositiveBoxRectangleData.positiveBoxRectangleCoreCutoff

/-- The outer cutoff recorded by the external rectangle-data producer. -/
abbrev positiveBoxRectangleDataK : ℕ :=
  C2.ProjectedJ0PositiveBoxRectangleData.positiveBoxRectangleK

/-- The finite tail index recorded by the external rectangle-data producer. -/
abbrev positiveBoxRectangleDataMidx : ℕ :=
  C2.ProjectedJ0PositiveBoxRectangleData.positiveBoxRectangleMidx

/--
The exact rectangle certificate selected by a parent box and a formal subbox
membership proof.  Exhaustive case analysis on `b` delegates to the matching
generated shard; no certificate is selected for an unrelated identifier.
-/
def positiveBoxSubboxRectangleCertificateData
    (b : PositiveBoxId) (i : PositiveBoxSubboxId)
    (hi : i ∈ positiveBoxSubboxesOf b) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert b).constants.mainLower)
      ((positiveBoxCombinedCert b).constants.d0NegReUpper)
      ((positiveBoxCombinedCert b).constants.restUpper) := by
  cases b with
  | s084_t0 => exact ProjectedJ0PositiveBoxRectangleData.S084T0.certificate i hi
  | s084_t1 => exact ProjectedJ0PositiveBoxRectangleData.S084T1.certificate i hi
  | s084_t2 => exact ProjectedJ0PositiveBoxRectangleData.S084T2.certificate i hi
  | s084_t3 => exact ProjectedJ0PositiveBoxRectangleData.S084T3.certificate i hi
  | s084_t4 => exact ProjectedJ0PositiveBoxRectangleData.S084T4.certificate i hi
  | s084_t5 => exact ProjectedJ0PositiveBoxRectangleData.S084T5.certificate i hi
  | s084_t6 => exact ProjectedJ0PositiveBoxRectangleData.S084T6.certificate i hi
  | s084_t7 => exact ProjectedJ0PositiveBoxRectangleData.S084T7.certificate i hi
  | s084_t8 => exact ProjectedJ0PositiveBoxRectangleData.S084T8.certificate i hi
  | s085_t0 => exact ProjectedJ0PositiveBoxRectangleData.S085T0.certificate i hi
  | s085_t1 => exact ProjectedJ0PositiveBoxRectangleData.S085T1.certificate i hi
  | s085_t2 => exact ProjectedJ0PositiveBoxRectangleData.S085T2.certificate i hi
  | s085_t3 => exact ProjectedJ0PositiveBoxRectangleData.S085T3.certificate i hi
  | s085_t4 => exact ProjectedJ0PositiveBoxRectangleData.S085T4.certificate i hi
  | s085_t5 => exact ProjectedJ0PositiveBoxRectangleData.S085T5.certificate i hi
  | s085_t6 => exact ProjectedJ0PositiveBoxRectangleData.S085T6.certificate i hi
  | s085_t7 => exact ProjectedJ0PositiveBoxRectangleData.S085T7.certificate i hi
  | s085_t8 => exact ProjectedJ0PositiveBoxRectangleData.S085T8.certificate i hi
  | s086_t0 => exact ProjectedJ0PositiveBoxRectangleData.S086T0.certificate i hi
  | s086_t1 => exact ProjectedJ0PositiveBoxRectangleData.S086T1.certificate i hi
  | s086_t2 => exact ProjectedJ0PositiveBoxRectangleData.S086T2.certificate i hi
  | s086_t3 => exact ProjectedJ0PositiveBoxRectangleData.S086T3.certificate i hi
  | s086_t4 => exact ProjectedJ0PositiveBoxRectangleData.S086T4.certificate i hi
  | s086_t5 => exact ProjectedJ0PositiveBoxRectangleData.S086T5.certificate i hi
  | s086_t6 => exact ProjectedJ0PositiveBoxRectangleData.S086T6.certificate i hi
  | s086_t7 => exact ProjectedJ0PositiveBoxRectangleData.S086T7.certificate i hi
  | s086_t8 => exact ProjectedJ0PositiveBoxRectangleData.S086T8.certificate i hi

/-- Exact rational rectangle data indexed by every formal box/subbox pair. -/
structure PositiveBoxAllSubboxRectangleCertificateData where
  certificate :
    ∀ (b : PositiveBoxId), b ∈ positiveBoxes →
      ∀ (i : PositiveBoxSubboxId), i ∈ positiveBoxSubboxesOf b →
        ProjectedJ0SubboxRectangleCertificateData
          ((positiveBoxCombinedCert b).constants.mainLower)
          ((positiveBoxCombinedCert b).constants.d0NegReUpper)
          ((positiveBoxCombinedCert b).constants.restUpper)

/-- The concrete 27-box, 771-subbox data set assembled from the shards. -/
def positiveBoxAllSubboxRectangleCertificateData :
    PositiveBoxAllSubboxRectangleCertificateData where
  certificate := by
    intro b _hb i hi
    exact positiveBoxSubboxRectangleCertificateData b i hi

/--
The primitive analytic assumptions left open by the exact rectangle data.
There is one membership field for each projected-j0 vector and no prederived
main, sector, or combined-rest inequality.
-/
structure PositiveBoxAllSubboxAnalyticEnclosureHypotheses
    (data : PositiveBoxAllSubboxRectangleCertificateData)
    (tiltSeed : ℂ → ℂ) : Prop where
  M_mem :
    ∀ (b : PositiveBoxId) (_hb : b ∈ positiveBoxes)
      (i : PositiveBoxSubboxId) (hi : i ∈ positiveBoxSubboxesOf b)
      (s : ℂ) (_hs : s ∈ positiveBoxSubboxRegion i),
      (data.certificate b _hb i hi).MRect.toComplexRect.Contains
        (adjustedProjectedJ0_M tiltSeed s)
  D0_mem :
    ∀ (b : PositiveBoxId) (_hb : b ∈ positiveBoxes)
      (i : PositiveBoxSubboxId) (hi : i ∈ positiveBoxSubboxesOf b)
      (s : ℂ) (_hs : s ∈ positiveBoxSubboxRegion i),
      (data.certificate b _hb i hi).D0Rect.toComplexRect.Contains
        (adjustedProjectedJ0_D0 positiveBoxRectangleDataCoreCutoff s)
  Drest_mem :
    ∀ (b : PositiveBoxId) (_hb : b ∈ positiveBoxes)
      (i : PositiveBoxSubboxId) (hi : i ∈ positiveBoxSubboxesOf b)
      (s : ℂ) (_hs : s ∈ positiveBoxSubboxRegion i),
      (data.certificate b _hb i hi).DrestRect.toComplexRect.Contains
        (adjustedProjectedJ0_Drest positiveBoxRectangleDataCoreCutoff s)
  RvecTail_mem :
    ∀ (b : PositiveBoxId) (_hb : b ∈ positiveBoxes)
      (i : PositiveBoxSubboxId) (hi : i ∈ positiveBoxSubboxesOf b)
      (s : ℂ) (_hs : s ∈ positiveBoxSubboxRegion i),
      (data.certificate b _hb i hi).RvecTailRect.toComplexRect.Contains
        (adjustedProjectedJ0_RvecTail tiltSeed positiveBoxRectangleDataCoreCutoff
          positiveBoxRectangleDataK positiveBoxRectangleDataMidx s)

/--
Derive the all-subbox rectangle bridges from the exact data and the four
primitive analytic memberships.
-/
noncomputable def positiveBoxAllSubboxRectangleBounds_of_data_and_membership
    {tiltSeed : ℂ → ℂ}
    (data : PositiveBoxAllSubboxRectangleCertificateData)
    (h : PositiveBoxAllSubboxAnalyticEnclosureHypotheses data tiltSeed) :
    PositiveBoxAllSubboxRectangleBounds tiltSeed
      positiveBoxRectangleDataCoreCutoff
      positiveBoxRectangleDataK positiveBoxRectangleDataMidx where
  bridge := by
    intro b hb i hi s hs
    exact (data.certificate b hb i hi).toSectorBridgeData
      (h.M_mem b hb i hi s hs)
      (h.D0_mem b hb i hi s hs)
      (h.Drest_mem b hb i hi s hs)
      (h.RvecTail_mem b hb i hi s hs)

/-- Forget the rectangle witnesses after deriving the three analytic bounds. -/
noncomputable def positiveBoxAllSubboxBounds_of_rectangle_data_and_membership
    {tiltSeed : ℂ → ℂ}
    (data : PositiveBoxAllSubboxRectangleCertificateData)
    (h : PositiveBoxAllSubboxAnalyticEnclosureHypotheses data tiltSeed) :
    PositiveBoxAllSubboxBounds tiltSeed
      positiveBoxRectangleDataCoreCutoff
      positiveBoxRectangleDataK positiveBoxRectangleDataMidx :=
  (positiveBoxAllSubboxRectangleBounds_of_data_and_membership data h).toPositiveBoxAllSubboxBounds

/--
Conditional positive-box nonvanishing for the parameter tuple recorded by the
external producer.  Formal subbox coverage is discharged by the existing
coverage theorem; the four analytic memberships remain the only hypotheses.
-/
theorem positiveBox_totalFinite_ne_zero_of_rectangle_data_and_membership
    {tiltSeed : ℂ → ℂ}
    (h : PositiveBoxAllSubboxAnalyticEnclosureHypotheses
      positiveBoxAllSubboxRectangleCertificateData tiltSeed) :
    ∀ s ∈ positiveGlobalRegion,
      adjustedProjectedJ0_totalFinite tiltSeed
        positiveBoxRectangleDataCoreCutoff
        positiveBoxRectangleDataK positiveBoxRectangleDataMidx s ≠ 0 := by
  exact positiveBox_totalFinite_ne_zero_of_all_subbox_rectangle_bounds
    (positiveBoxAllSubboxRectangleBounds_of_data_and_membership
      positiveBoxAllSubboxRectangleCertificateData h)

/--
Transport the conditional result to any numerically compatible Lean parameter
tuple.  This compatibility concerns only `coreCutoff`, `K`, and `Midx`; no
claim about the caller's `tiltSeed` is made here.
-/
theorem positiveBox_totalFinite_ne_zero_of_rectangle_data_and_compatible_parameters
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K Midx : ℕ}
    (compat :
      C2.ProjectedJ0PositiveBoxRectangleData.PositiveBoxRectangleLeanParameterCompatibility
        coreCutoff K Midx)
    (h : PositiveBoxAllSubboxAnalyticEnclosureHypotheses
      positiveBoxAllSubboxRectangleCertificateData tiltSeed) :
    ∀ s ∈ positiveGlobalRegion,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K Midx s ≠ 0 := by
  rw [compat.coreCutoff_eq, compat.K_eq, compat.Midx_eq]
  exact positiveBox_totalFinite_ne_zero_of_rectangle_data_and_membership h

end ProjectedJ0PositiveBoxSkeleton
end C2
