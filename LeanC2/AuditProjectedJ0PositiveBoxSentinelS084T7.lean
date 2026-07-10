import LeanC2.AuditProjectedJ0PositiveBoxSkeleton

/-!
# Positive-box sentinel skeleton for `s0.84_t7`

This file introduces the 32 subbox identifiers and subbox regions for the
positive-box sentinel `s0.84_t7`.  It does not include raw rectangles or
analytic enclosure proofs.
-/

namespace C2
namespace ProjectedJ0PositiveBoxSkeleton

open ProjectedJ0RectangleArithmetic
open AdjustedQuartetProjectedJ0Aliases

inductive S084T7SubboxId where
  | sb0 | sb1 | sb2 | sb3 | sb4 | sb5 | sb6 | sb7
  | sb8 | sb9 | sb10 | sb11 | sb12 | sb13 | sb14 | sb15
  | sb16 | sb17 | sb18 | sb19 | sb20 | sb21 | sb22 | sb23
  | sb24 | sb25 | sb26 | sb27 | sb28 | sb29 | sb30 | sb31
  deriving DecidableEq, Repr, Fintype

def s084T7Subboxes : Finset S084T7SubboxId :=
  Finset.univ

theorem mem_s084T7Subboxes_all (i : S084T7SubboxId) :
    i ∈ s084T7Subboxes := by
  simp [s084T7Subboxes]

/-- Rationals parsed from decimal strings with 15 fractional digits. -/
def q15 (n : ℕ) : ℚ :=
  (n : ℚ) / 1000000000000000

def s084T7T0 : ℚ := q15 32855000000000000
def s084T7T1 : ℚ := q15 32855124999999994
def s084T7T2 : ℚ := q15 32855250000000000
def s084T7T3 : ℚ := q15 32855374999999995
def s084T7T4 : ℚ := q15 32855500000000000
def s084T7T5 : ℚ := q15 32855624999999996
def s084T7T6 : ℚ := q15 32855750000000000
def s084T7T7 : ℚ := q15 32855875000000000
def s084T7T8 : ℚ := q15 32855999999999995
def s084T7T9 : ℚ := q15 32856125000000000
def s084T7T10 : ℚ := q15 32856249999999996
def s084T7T11 : ℚ := q15 32856375000000000
def s084T7T12 : ℚ := q15 32856500000000000
def s084T7T13 : ℚ := q15 32856625000000000
def s084T7T14 : ℚ := q15 32856750000000000
def s084T7T15 : ℚ := q15 32856875000000000
def s084T7T16 : ℚ := q15 32857000000000000
def s084T7T17 : ℚ := q15 32857124999999996
def s084T7T18 : ℚ := q15 32857250000000000
def s084T7T19 : ℚ := q15 32857375000000000
def s084T7T20 : ℚ := q15 32857500000000000
def s084T7T21 : ℚ := q15 32857625000000000
def s084T7T22 : ℚ := q15 32857750000000000
def s084T7T23 : ℚ := q15 32857875000000000
def s084T7T24 : ℚ := q15 32858000000000004
def s084T7T25 : ℚ := q15 32858125000000000
def s084T7T26 : ℚ := q15 32858250000000000
def s084T7T27 : ℚ := q15 32858375000000000
def s084T7T28 : ℚ := q15 32858500000000000
def s084T7T29 : ℚ := q15 32858625000000000
def s084T7T30 : ℚ := q15 32858750000000000
def s084T7T31 : ℚ := q15 32858875000000005
def s084T7T32 : ℚ := q15 32859000000000000

def s084T7SubboxRect : S084T7SubboxId → RectRegion
  | .sb0 => mkSigmaLineRect q084 s084T7T0 s084T7T1
  | .sb1 => mkSigmaLineRect q084 s084T7T1 s084T7T2
  | .sb2 => mkSigmaLineRect q084 s084T7T2 s084T7T3
  | .sb3 => mkSigmaLineRect q084 s084T7T3 s084T7T4
  | .sb4 => mkSigmaLineRect q084 s084T7T4 s084T7T5
  | .sb5 => mkSigmaLineRect q084 s084T7T5 s084T7T6
  | .sb6 => mkSigmaLineRect q084 s084T7T6 s084T7T7
  | .sb7 => mkSigmaLineRect q084 s084T7T7 s084T7T8
  | .sb8 => mkSigmaLineRect q084 s084T7T8 s084T7T9
  | .sb9 => mkSigmaLineRect q084 s084T7T9 s084T7T10
  | .sb10 => mkSigmaLineRect q084 s084T7T10 s084T7T11
  | .sb11 => mkSigmaLineRect q084 s084T7T11 s084T7T12
  | .sb12 => mkSigmaLineRect q084 s084T7T12 s084T7T13
  | .sb13 => mkSigmaLineRect q084 s084T7T13 s084T7T14
  | .sb14 => mkSigmaLineRect q084 s084T7T14 s084T7T15
  | .sb15 => mkSigmaLineRect q084 s084T7T15 s084T7T16
  | .sb16 => mkSigmaLineRect q084 s084T7T16 s084T7T17
  | .sb17 => mkSigmaLineRect q084 s084T7T17 s084T7T18
  | .sb18 => mkSigmaLineRect q084 s084T7T18 s084T7T19
  | .sb19 => mkSigmaLineRect q084 s084T7T19 s084T7T20
  | .sb20 => mkSigmaLineRect q084 s084T7T20 s084T7T21
  | .sb21 => mkSigmaLineRect q084 s084T7T21 s084T7T22
  | .sb22 => mkSigmaLineRect q084 s084T7T22 s084T7T23
  | .sb23 => mkSigmaLineRect q084 s084T7T23 s084T7T24
  | .sb24 => mkSigmaLineRect q084 s084T7T24 s084T7T25
  | .sb25 => mkSigmaLineRect q084 s084T7T25 s084T7T26
  | .sb26 => mkSigmaLineRect q084 s084T7T26 s084T7T27
  | .sb27 => mkSigmaLineRect q084 s084T7T27 s084T7T28
  | .sb28 => mkSigmaLineRect q084 s084T7T28 s084T7T29
  | .sb29 => mkSigmaLineRect q084 s084T7T29 s084T7T30
  | .sb30 => mkSigmaLineRect q084 s084T7T30 s084T7T31
  | .sb31 => mkSigmaLineRect q084 s084T7T31 s084T7T32

def s084T7SubboxRegion (i : S084T7SubboxId) : Set ℂ :=
  (s084T7SubboxRect i).toSet

structure S084T7SubboxCoverHypothesis where
  cover :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s084_t7,
      ∃ i ∈ s084T7Subboxes, s ∈ s084T7SubboxRegion i

def s084T7CombinedCert : ProjectedJ0SectorRationalizedBoxCertificate :=
  positiveBoxCombinedCert PositiveBoxId.s084_t7

def s084T7MainLower : ℝ :=
  (s084T7CombinedCert.constants.mainLower : ℝ)

def s084T7D0NegReUpper : ℝ :=
  (s084T7CombinedCert.constants.d0NegReUpper : ℝ)

def s084T7RestUpper : ℝ :=
  (s084T7CombinedCert.constants.restUpper : ℝ)

structure S084T7SubboxBounds
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K Midx : ℕ) where
  main_lower :
    ∀ i ∈ s084T7Subboxes, ∀ s ∈ s084T7SubboxRegion i,
      s084T7MainLower ≤ ‖adjustedProjectedJ0_M tiltSeed s‖
  d0_neg_upper :
    ∀ i ∈ s084T7Subboxes, ∀ s ∈ s084T7SubboxRegion i,
      adjustedProjectedJ0_D0NegReMain tiltSeed coreCutoff s ≤
        s084T7D0NegReUpper
  rest_upper :
    ∀ i ∈ s084T7Subboxes, ∀ s ∈ s084T7SubboxRegion i,
      adjustedProjectedJ0_restCostFinite tiltSeed coreCutoff K Midx s ≤
        s084T7RestUpper

namespace S084T7SubboxBounds

theorem toSubboxCoverData
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K Midx : ℕ}
    (bounds : S084T7SubboxBounds tiltSeed coreCutoff K Midx)
    (coverHyp : S084T7SubboxCoverHypothesis) :
    ProjectedJ0SubboxCoverData
      (positiveBoxRegion PositiveBoxId.s084_t7)
      S084T7SubboxId
      s084T7Subboxes
      s084T7SubboxRegion
      tiltSeed coreCutoff K Midx
      s084T7MainLower
      s084T7D0NegReUpper
      s084T7RestUpper where
  cover := coverHyp.cover
  main_lower_subbox := bounds.main_lower
  d0_neg_subbox := bounds.d0_neg_upper
  rest_upper_subbox := bounds.rest_upper

end S084T7SubboxBounds

theorem s084T7_totalFinite_ne_zero_of_subbox_bounds
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K Midx : ℕ}
    (bounds : S084T7SubboxBounds tiltSeed coreCutoff K Midx)
    (coverHyp : S084T7SubboxCoverHypothesis) :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s084_t7,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K Midx s ≠ 0 := by
  exact s084T7CombinedCert.total_ne_zero_of_subbox_cover
    (bounds.toSubboxCoverData coverHyp)

structure PositiveBoxPartialCoversS084T7
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K Midx : ℕ) where
  cover :
    S084T7SubboxCoverHypothesis
  bounds :
    S084T7SubboxBounds tiltSeed coreCutoff K Midx

namespace PositiveBoxPartialCoversS084T7

theorem totalFinite_ne_zero_on_s084T7
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K Midx : ℕ}
    (data : PositiveBoxPartialCoversS084T7 tiltSeed coreCutoff K Midx) :
    ∀ s ∈ positiveBoxRegion PositiveBoxId.s084_t7,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K Midx s ≠ 0 :=
  s084T7_totalFinite_ne_zero_of_subbox_bounds data.bounds data.cover

end PositiveBoxPartialCoversS084T7

end ProjectedJ0PositiveBoxSkeleton
end C2
