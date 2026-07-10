import LeanC2.AuditAdjustedQuartetHorizontalProjection

/-!
# Projected `j0` shim for the adjusted quartet ledger

This audit-only file connects the abstract projection ledger to the shape needed
by the adjusted quartet route.  It remains fully pointwise/abstract: no analytic
definitions of the adjusted quartet are imported here.

Future intended mapping:

* `M s`: seeded adjusted main complex vector;
* `D0 s`: horizontal defect layer `j = 0`;
* `Drest s`: horizontal defect layers `j = 1, 2, 3`;
* `R s`: vertical tail, horizontal tail, tilt tail, cutoff, and other norm-paid
  residuals;
* `total s`: adjusted total complex object.
-/

namespace C2
namespace AdjustedQuartetProjectedJ0Shim

open AdjustedQuartetHorizontalProjection

/--
Pointwise certificate for a projected-`j0` adjusted quartet ledger.

The dominant layer `D0` is paid by `destructiveParallel`; `Drest + R` is paid by
a norm budget.
-/
structure AdjustedQuartetProjectedJ0PointData where
  M : ℂ
  D0 : ℂ
  Drest : ℂ
  R : ℂ
  total : ℂ
  mainLower : ℝ
  parallelUpper : ℝ
  restUpper : ℝ
  total_eq : total = M + D0 + Drest + R
  hM : M ≠ 0
  hMain : mainLower ≤ ‖M‖
  hParallel : destructiveParallel M D0 ≤ parallelUpper
  hRest : ‖Drest + R‖ ≤ restUpper
  hBudget : parallelUpper + restUpper < mainLower

theorem AdjustedQuartetProjectedJ0PointData.total_ne_zero
    (data : AdjustedQuartetProjectedJ0PointData) :
    data.total ≠ 0 := by
  have hcore :
      data.M + data.D0 + data.Drest + data.R ≠ 0 :=
    ne_zero_of_projected_j0_and_rest_parallel
      (M := data.M) (D0 := data.D0) (Drest := data.Drest) (R := data.R)
      (mainLower := data.mainLower)
      (parallelUpper := data.parallelUpper)
      (restUpper := data.restUpper)
      data.hM data.hMain data.hParallel data.hRest data.hBudget
  intro hzero
  exact hcore (by simpa [data.total_eq] using hzero)

/--
Pointwise certificate variant with separate norm budgets for `Drest` and `R`.
-/
structure AdjustedQuartetProjectedJ0SeparateRestPointData where
  M : ℂ
  D0 : ℂ
  Drest : ℂ
  R : ℂ
  total : ℂ
  mainLower : ℝ
  parallelUpper : ℝ
  restUpper : ℝ
  total_eq : total = M + D0 + Drest + R
  hM : M ≠ 0
  hMain : mainLower ≤ ‖M‖
  hParallel : destructiveParallel M D0 ≤ parallelUpper
  hRest : ‖Drest‖ + ‖R‖ ≤ restUpper
  hBudget : parallelUpper + restUpper < mainLower

theorem AdjustedQuartetProjectedJ0SeparateRestPointData.total_ne_zero
    (data : AdjustedQuartetProjectedJ0SeparateRestPointData) :
    data.total ≠ 0 := by
  have hcore :
      data.M + data.D0 + data.Drest + data.R ≠ 0 :=
    ne_zero_of_projected_j0_and_separate_rest_parallel
      (M := data.M) (D0 := data.D0) (Drest := data.Drest) (R := data.R)
      (mainLower := data.mainLower)
      (parallelUpper := data.parallelUpper)
      (restUpper := data.restUpper)
      data.hM data.hMain data.hParallel data.hRest data.hBudget
  intro hzero
  exact hcore (by simpa [data.total_eq] using hzero)

/--
Region-level abstract data for the projected-`j0` ledger.

This is intentionally generic in the region and all vector-valued functions.
-/
structure AdjustedQuartetProjectedJ0OnRegionData
    (Region : Set ℂ)
    (M D0 Drest R total : ℂ → ℂ)
    (mainLower parallelUpper restUpper : ℂ → ℝ) where
  total_eq :
    ∀ s ∈ Region, total s = M s + D0 s + Drest s + R s
  hM :
    ∀ s ∈ Region, M s ≠ 0
  hMain :
    ∀ s ∈ Region, mainLower s ≤ ‖M s‖
  hParallel :
    ∀ s ∈ Region, destructiveParallel (M s) (D0 s) ≤ parallelUpper s
  hRest :
    ∀ s ∈ Region, ‖Drest s + R s‖ ≤ restUpper s
  hBudget :
    ∀ s ∈ Region, parallelUpper s + restUpper s < mainLower s

theorem AdjustedQuartetProjectedJ0OnRegionData.total_ne_zero
    {Region : Set ℂ}
    {M D0 Drest R total : ℂ → ℂ}
    {mainLower parallelUpper restUpper : ℂ → ℝ}
    (data : AdjustedQuartetProjectedJ0OnRegionData
      Region M D0 Drest R total mainLower parallelUpper restUpper) :
    ∀ s ∈ Region, total s ≠ 0 := by
  intro s hs
  have hcore :
      M s + D0 s + Drest s + R s ≠ 0 :=
    ne_zero_of_projected_j0_and_rest_parallel
      (M := M s) (D0 := D0 s) (Drest := Drest s) (R := R s)
      (mainLower := mainLower s)
      (parallelUpper := parallelUpper s)
      (restUpper := restUpper s)
      (data.hM s hs)
      (data.hMain s hs)
      (data.hParallel s hs)
      (data.hRest s hs)
      (data.hBudget s hs)
  intro hzero
  exact hcore (by simpa [data.total_eq s hs] using hzero)

end AdjustedQuartetProjectedJ0Shim
end C2
