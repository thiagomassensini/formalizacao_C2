import LeanC2.AuditAdjustedQuartetProjectedJ0Shim

/-!
# Projected-j0 adjusted quartet real-map shim

This file is a lightweight bridge shape for the adjusted quartet audit.
It keeps the complex remainder vector `Rvec : ℂ` separate from the real upper
budget `restUpper : ℝ`.
-/

namespace C2
namespace AdjustedQuartetProjectedJ0RealMap

open AdjustedQuartetHorizontalProjection
open AdjustedQuartetProjectedJ0Shim

/--
Pointwise data in the notation of the adjusted quartet mapping.

`Rvec` is a complex vector contribution.  It is not the real sum of tail or
cutoff upper bounds; those belong in `restUpper`.
-/
structure AdjustedQuartetProjectedJ0RealPointData where
  s : ℂ
  M : ℂ
  D0 : ℂ
  Drest : ℂ
  Rvec : ℂ
  total : ℂ
  mainLower : ℝ
  parallelUpper : ℝ
  restUpper : ℝ
  total_eq : total = M + D0 + Drest + Rvec
  hM : M ≠ 0
  hMain : mainLower ≤ ‖M‖
  hParallel : destructiveParallel M D0 ≤ parallelUpper
  hRest : ‖Drest + Rvec‖ ≤ restUpper
  hBudget : parallelUpper + restUpper < mainLower

theorem AdjustedQuartetProjectedJ0RealPointData.total_ne_zero
    (data : AdjustedQuartetProjectedJ0RealPointData) :
    data.total ≠ 0 := by
  let shimData : AdjustedQuartetProjectedJ0PointData :=
    { M := data.M
      D0 := data.D0
      Drest := data.Drest
      R := data.Rvec
      total := data.total
      mainLower := data.mainLower
      parallelUpper := data.parallelUpper
      restUpper := data.restUpper
      total_eq := data.total_eq
      hM := data.hM
      hMain := data.hMain
      hParallel := data.hParallel
      hRest := data.hRest
      hBudget := data.hBudget }
  exact AdjustedQuartetProjectedJ0PointData.total_ne_zero shimData

end AdjustedQuartetProjectedJ0RealMap
end C2
