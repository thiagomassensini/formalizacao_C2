import LeanC2.Analytic.ProjectedJ0SuperGaussianSurrogate
import LeanC2.AuditAdjustedQuartetHorizontalProjection

/-!
# Quantitative transfer from a surrogate

These lemmas are purely norm-geometric.  They do not assert an error bound
between any particular surrogate and any particular continuation.
-/

namespace C2

/-- A certified norm margin survives a strictly smaller approximation error. -/
theorem ne_zero_of_surrogate_norm_lower_and_error
    (Tcont Tsg : ℂ) (mu : ℝ)
    (hlower : mu ≤ ‖Tsg‖)
    (herror : ‖Tcont - Tsg‖ < mu) :
    Tcont ≠ 0 := by
  intro hzero
  have hsg_lt : ‖Tsg‖ < mu := by
    simpa [hzero] using herror
  exact (not_lt_of_ge hlower) hsg_lt

/--
Norm lower bound behind the projected-J0 bookkeeping.  In contrast with a
mere nonvanishing proposition, this retains the explicit usable margin
`mainLower - parallelUpper - restUpper`.
-/
theorem norm_lower_of_projected_j0_bounds
    (M D0 Drest R total : ℂ)
    (mainLower parallelUpper restUpper : ℝ)
    (hM : M ≠ 0)
    (hMain : mainLower ≤ ‖M‖)
    (hParallel :
      AdjustedQuartetHorizontalProjection.destructiveParallel M D0 ≤ parallelUpper)
    (hRest : ‖Drest + R‖ ≤ restUpper)
    (htotal : total = M + D0 + Drest + R) :
    mainLower - parallelUpper - restUpper ≤ ‖total‖ := by
  open AdjustedQuartetHorizontalProjection in
    have hRadial : ‖M‖ - ‖M + D0‖ ≤ parallelUpper := by
      exact (radialLoss_le_destructiveParallel M D0 hM).trans hParallel
  have hMainAfter : mainLower - parallelUpper ≤ ‖M + D0‖ := by
    linarith
  have hReverse := norm_sub_norm_le (M + D0) (-(Drest + R))
  have hTotalLower : ‖M + D0‖ - ‖Drest + R‖ ≤ ‖total‖ := by
    rw [norm_neg] at hReverse
    calc
      ‖M + D0‖ - ‖Drest + R‖
          ≤ ‖(M + D0) - (-(Drest + R))‖ := hReverse
      _ = ‖total‖ := by
        rw [htotal]
        congr 1
        ring
  linarith

/-- The same explicit lower bound specialized to the finite SG decomposition. -/
theorem projectedJ0SG_totalFinite_norm_lower_of_bounds
    (s : ℂ) (mainLower parallelUpper restUpper : ℝ)
    (hM : projectedJ0SG_M s ≠ 0)
    (hMain : mainLower ≤ ‖projectedJ0SG_M s‖)
    (hParallel :
      AdjustedQuartetHorizontalProjection.destructiveParallel
        (projectedJ0SG_M s) (projectedJ0SG_D0 s) ≤ parallelUpper)
    (hRest : ‖projectedJ0SG_Drest s + projectedJ0SG_RvecTail s‖ ≤ restUpper) :
    mainLower - parallelUpper - restUpper ≤ ‖projectedJ0SG_totalFinite s‖ := by
  exact norm_lower_of_projected_j0_bounds
    (M := projectedJ0SG_M s)
    (D0 := projectedJ0SG_D0 s)
    (Drest := projectedJ0SG_Drest s)
    (R := projectedJ0SG_RvecTail s)
    (total := projectedJ0SG_totalFinite s)
    mainLower parallelUpper restUpper hM hMain hParallel hRest
    (projectedJ0SG_totalFinite_decomposition s)

end C2
