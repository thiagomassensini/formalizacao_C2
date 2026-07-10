import LeanC2.AuditProjectedJ0SectorAtlasFromSubboxes
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

/-!
# Positive-box skeleton for projected-j0 sector certificates

This file records the 27 certified positive-box identifiers and their box
regions.  It does not include the 771 subboxes, raw rectangles, or analytic
enclosure proofs.  The global region is defined as the union of the certified
boxes, because the current pack certifies three sampled sigma lines rather than
a continuous sigma strip.
-/

namespace C2
namespace ProjectedJ0PositiveBoxSkeleton

open ProjectedJ0RectangleArithmetic
open AdjustedQuartetProjectedJ0Aliases

inductive PositiveBoxId where
  | s084_t0 | s084_t1 | s084_t2 | s084_t3 | s084_t4
  | s084_t5 | s084_t6 | s084_t7 | s084_t8
  | s085_t0 | s085_t1 | s085_t2 | s085_t3 | s085_t4
  | s085_t5 | s085_t6 | s085_t7 | s085_t8
  | s086_t0 | s086_t1 | s086_t2 | s086_t3 | s086_t4
  | s086_t5 | s086_t6 | s086_t7 | s086_t8
  deriving DecidableEq, Repr, Fintype

def positiveBoxes : Finset PositiveBoxId :=
  Finset.univ

theorem mem_positiveBoxes_all (b : PositiveBoxId) :
    b ∈ positiveBoxes := by
  simp [positiveBoxes]

structure RectRegion where
  sigmaMin : ℚ
  sigmaMax : ℚ
  tMin : ℚ
  tMax : ℚ

namespace RectRegion

def toSet (R : RectRegion) : Set ℂ :=
  {s |
    (R.sigmaMin : ℝ) ≤ s.re ∧
    s.re ≤ (R.sigmaMax : ℝ) ∧
    (R.tMin : ℝ) ≤ s.im ∧
    s.im ≤ (R.tMax : ℝ)}

end RectRegion

def mkSigmaLineRect (sigma tMin tMax : ℚ) : RectRegion :=
  { sigmaMin := sigma
    sigmaMax := sigma
    tMin := tMin
    tMax := tMax }

def q084 : ℚ := (84 : ℚ) / 100
def q085 : ℚ := (85 : ℚ) / 100
def q086 : ℚ := (86 : ℚ) / 100

def t0Min : ℚ := (32820 : ℚ) / 1000
def t0Max : ℚ := (32824 : ℚ) / 1000
def t1Min : ℚ := (32825 : ℚ) / 1000
def t1Max : ℚ := (32829 : ℚ) / 1000
def t2Min : ℚ := (32830 : ℚ) / 1000
def t2Max : ℚ := (32834 : ℚ) / 1000
def t3Min : ℚ := (32835 : ℚ) / 1000
def t3Max : ℚ := (32839 : ℚ) / 1000
def t4Min : ℚ := (32840 : ℚ) / 1000
def t4Max : ℚ := (32844 : ℚ) / 1000
def t5Min : ℚ := (32845 : ℚ) / 1000

/-- Exact rational form of the CSV value `32.849000000000004`. -/
def t5Max : ℚ := (8212250000000001 : ℚ) / 250000000000000

def t6Min : ℚ := (32850 : ℚ) / 1000
def t6Max : ℚ := (32854 : ℚ) / 1000
def t7Min : ℚ := (32855 : ℚ) / 1000
def t7Max : ℚ := (32859 : ℚ) / 1000
def t8Min : ℚ := (32860 : ℚ) / 1000
def t8Max : ℚ := (32860 : ℚ) / 1000

def positiveBoxRect : PositiveBoxId → RectRegion
  | .s084_t0 => mkSigmaLineRect q084 t0Min t0Max
  | .s084_t1 => mkSigmaLineRect q084 t1Min t1Max
  | .s084_t2 => mkSigmaLineRect q084 t2Min t2Max
  | .s084_t3 => mkSigmaLineRect q084 t3Min t3Max
  | .s084_t4 => mkSigmaLineRect q084 t4Min t4Max
  | .s084_t5 => mkSigmaLineRect q084 t5Min t5Max
  | .s084_t6 => mkSigmaLineRect q084 t6Min t6Max
  | .s084_t7 => mkSigmaLineRect q084 t7Min t7Max
  | .s084_t8 => mkSigmaLineRect q084 t8Min t8Max
  | .s085_t0 => mkSigmaLineRect q085 t0Min t0Max
  | .s085_t1 => mkSigmaLineRect q085 t1Min t1Max
  | .s085_t2 => mkSigmaLineRect q085 t2Min t2Max
  | .s085_t3 => mkSigmaLineRect q085 t3Min t3Max
  | .s085_t4 => mkSigmaLineRect q085 t4Min t4Max
  | .s085_t5 => mkSigmaLineRect q085 t5Min t5Max
  | .s085_t6 => mkSigmaLineRect q085 t6Min t6Max
  | .s085_t7 => mkSigmaLineRect q085 t7Min t7Max
  | .s085_t8 => mkSigmaLineRect q085 t8Min t8Max
  | .s086_t0 => mkSigmaLineRect q086 t0Min t0Max
  | .s086_t1 => mkSigmaLineRect q086 t1Min t1Max
  | .s086_t2 => mkSigmaLineRect q086 t2Min t2Max
  | .s086_t3 => mkSigmaLineRect q086 t3Min t3Max
  | .s086_t4 => mkSigmaLineRect q086 t4Min t4Max
  | .s086_t5 => mkSigmaLineRect q086 t5Min t5Max
  | .s086_t6 => mkSigmaLineRect q086 t6Min t6Max
  | .s086_t7 => mkSigmaLineRect q086 t7Min t7Max
  | .s086_t8 => mkSigmaLineRect q086 t8Min t8Max

def positiveBoxRegion (b : PositiveBoxId) : Set ℂ :=
  (positiveBoxRect b).toSet

/-- The certified positive-box region is exactly the union of the 27 boxes. -/
def positiveGlobalRegion : Set ℂ :=
  {s | ∃ b ∈ positiveBoxes, s ∈ positiveBoxRegion b}

theorem positiveBox_cover :
    ∀ s ∈ positiveGlobalRegion,
      ∃ b ∈ positiveBoxes, s ∈ positiveBoxRegion b := by
  intro s hs
  exact hs

def positiveBoxCombinedCert :
    PositiveBoxId → ProjectedJ0SectorRationalizedBoxCertificate
  | .s084_t0 => positiveBoxSector_s0_84_t0_combined_certificate
  | .s084_t1 => positiveBoxSector_s0_84_t1_combined_certificate
  | .s084_t2 => positiveBoxSector_s0_84_t2_combined_certificate
  | .s084_t3 => positiveBoxSector_s0_84_t3_combined_certificate
  | .s084_t4 => positiveBoxSector_s0_84_t4_combined_certificate
  | .s084_t5 => positiveBoxSector_s0_84_t5_combined_certificate
  | .s084_t6 => positiveBoxSector_s0_84_t6_combined_certificate
  | .s084_t7 => positiveBoxSector_s0_84_t7_combined_certificate
  | .s084_t8 => positiveBoxSector_s0_84_t8_combined_certificate
  | .s085_t0 => positiveBoxSector_s0_85_t0_combined_certificate
  | .s085_t1 => positiveBoxSector_s0_85_t1_combined_certificate
  | .s085_t2 => positiveBoxSector_s0_85_t2_combined_certificate
  | .s085_t3 => positiveBoxSector_s0_85_t3_combined_certificate
  | .s085_t4 => positiveBoxSector_s0_85_t4_combined_certificate
  | .s085_t5 => positiveBoxSector_s0_85_t5_combined_certificate
  | .s085_t6 => positiveBoxSector_s0_85_t6_combined_certificate
  | .s085_t7 => positiveBoxSector_s0_85_t7_combined_certificate
  | .s085_t8 => positiveBoxSector_s0_85_t8_combined_certificate
  | .s086_t0 => positiveBoxSector_s0_86_t0_combined_certificate
  | .s086_t1 => positiveBoxSector_s0_86_t1_combined_certificate
  | .s086_t2 => positiveBoxSector_s0_86_t2_combined_certificate
  | .s086_t3 => positiveBoxSector_s0_86_t3_combined_certificate
  | .s086_t4 => positiveBoxSector_s0_86_t4_combined_certificate
  | .s086_t5 => positiveBoxSector_s0_86_t5_combined_certificate
  | .s086_t6 => positiveBoxSector_s0_86_t6_combined_certificate
  | .s086_t7 => positiveBoxSector_s0_86_t7_combined_certificate
  | .s086_t8 => positiveBoxSector_s0_86_t8_combined_certificate

/--
External subbox covers for the positive-box skeleton.  This structure does not
contain the 771 subboxes; it is the hypothesis shape that a future data layer
must provide.
-/
structure PositiveBoxSubboxCovers
    (SubboxId : Type)
    (SubboxRegion : PositiveBoxId → SubboxId → Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K Midx : ℕ) where
  subboxes :
    PositiveBoxId → Finset SubboxId
  cover :
    ∀ b ∈ positiveBoxes,
      ProjectedJ0SubboxCoverData
        (positiveBoxRegion b)
        SubboxId
        (subboxes b)
        (SubboxRegion b)
        tiltSeed coreCutoff K Midx
        ((positiveBoxCombinedCert b).constants.mainLower : ℝ)
        ((positiveBoxCombinedCert b).constants.d0NegReUpper : ℝ)
        ((positiveBoxCombinedCert b).constants.restUpper : ℝ)

theorem positiveBox_totalFinite_ne_zero_of_subbox_covers
    {SubboxId : Type}
    {SubboxRegion : PositiveBoxId → SubboxId → Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K Midx : ℕ}
    (covers :
      PositiveBoxSubboxCovers
        SubboxId SubboxRegion tiltSeed coreCutoff K Midx) :
    ∀ s ∈ positiveGlobalRegion,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K Midx s ≠ 0 := by
  let atlas :
      ProjectedJ0SectorAtlasFromSubboxes
        positiveGlobalRegion
        PositiveBoxId
        SubboxId
        positiveBoxes
        positiveBoxRegion
        covers.subboxes
        SubboxRegion
        tiltSeed coreCutoff K Midx :=
    { cover_boxes := positiveBox_cover
      cert := positiveBoxCombinedCert
      subbox_cover := covers.cover }
  exact ProjectedJ0SectorAtlasFromSubboxes.total_ne_zero atlas

end ProjectedJ0PositiveBoxSkeleton
end C2
