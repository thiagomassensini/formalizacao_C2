import Mathlib

/-!
# Adjusted quartet horizontal projection ledger

This audit-only file isolates the vector ledger suggested by the adjusted
quartet horizontal-defect diagnostics.  It contains no analytic input: the
variables are just complex vectors.

The intended later substitution is:

* `M`: seeded adjusted main;
* `D0`: first horizontal defect layer, handled by radial/phase cost;
* `Drest`: remaining horizontal layers;
* `R`: vertical tail, horizontal tail, tilt tail, cutoff, and other norm-paid
  residuals.
-/

namespace C2
namespace AdjustedQuartetHorizontalProjection

/-- Signed radial loss from adding `D` to `M`. -/
noncomputable def radialLoss (M D : ℂ) : ℝ :=
  ‖M‖ - ‖M + D‖

/-- Nonnegative radial loss budget. -/
noncomputable def radialLossPos (M D : ℂ) : ℝ :=
  max 0 (radialLoss M D)

/--
Real coordinate of `D` in the direction of `M`.

The formula is only intended to be used when `M ≠ 0`; if `M = 0`, the
denominator makes this a bookkeeping expression rather than a direction.
-/
noncomputable def parallelCoord (M D : ℂ) : ℝ :=
  ((D * starRingEnd ℂ M).re) / ‖M‖

/-- Destructive parallel part of `D` against the direction of `M`. -/
noncomputable def destructiveParallel (M D : ℂ) : ℝ :=
  max 0 (-(parallelCoord M D))

/-- The real part of a complex number is bounded above by its norm. -/
theorem complex_re_le_norm (z : ℂ) : z.re ≤ ‖z‖ := by
  exact le_trans (le_abs_self z.re) (Complex.abs_re_le_norm z)

/-- `M * conj M` has real part `‖M‖ * ‖M‖`. -/
theorem mul_conj_re_eq_norm_mul_norm (M : ℂ) :
    (M * starRingEnd ℂ M).re = ‖M‖ * ‖M‖ := by
  calc
    (M * starRingEnd ℂ M).re = ((Complex.normSq M : ℝ) : ℂ).re := by
      rw [Complex.mul_conj]
    _ = Complex.normSq M := by simp
    _ = ‖M‖ ^ 2 := by rw [Complex.normSq_eq_norm_sq]
    _ = ‖M‖ * ‖M‖ := by ring

/--
Projection lower bound: the norm of `M + D` dominates its real projection onto
the direction of nonzero `M`.
-/
theorem norm_add_ge_norm_add_parallelCoord
    (M D : ℂ) (hM : M ≠ 0) :
    ‖M‖ + parallelCoord M D ≤ ‖M + D‖ := by
  have hMpos : 0 < ‖M‖ := norm_pos_iff.mpr hM
  have hre :
      (((M + D) * starRingEnd ℂ M).re) ≤
        ‖(M + D) * starRingEnd ℂ M‖ :=
    complex_re_le_norm _
  have hnorm :
      ‖(M + D) * starRingEnd ℂ M‖ = ‖M + D‖ * ‖M‖ := by
    simp
  have hdiv :
      (((M + D) * starRingEnd ℂ M).re) / ‖M‖ ≤ ‖M + D‖ := by
    rw [hnorm] at hre
    exact (div_le_iff₀ hMpos).mpr hre
  have hleft :
      (((M + D) * starRingEnd ℂ M).re) / ‖M‖ =
        ‖M‖ + parallelCoord M D := by
    rw [add_mul]
    simp only [Complex.add_re]
    rw [mul_conj_re_eq_norm_mul_norm]
    unfold parallelCoord
    field_simp [hMpos.ne']
  rw [← hleft]
  exact hdiv

/-- Signed radial loss is bounded by the negative parallel coordinate. -/
theorem radialLoss_le_neg_parallelCoord
    (M D : ℂ) (hM : M ≠ 0) :
    radialLoss M D ≤ -(parallelCoord M D) := by
  have h := norm_add_ge_norm_add_parallelCoord M D hM
  unfold radialLoss
  linarith

/--
The projected destructive part always bounds the radial loss caused by adding
`D` to nonzero `M`.
-/
theorem radialLoss_le_destructiveParallel
    (M D : ℂ) (hM : M ≠ 0) :
    radialLoss M D ≤ destructiveParallel M D := by
  have hneg := radialLoss_le_neg_parallelCoord M D hM
  unfold destructiveParallel
  by_cases hpc : parallelCoord M D ≤ 0
  · have hmax : max 0 (-(parallelCoord M D)) = -(parallelCoord M D) := by
      exact max_eq_right (by linarith)
    rw [hmax]
    exact hneg
  · have hpc_nonneg : 0 ≤ parallelCoord M D := le_of_lt (lt_of_not_ge hpc)
    have hrl_nonpos : radialLoss M D ≤ 0 := by
      linarith
    have hmax : max 0 (-(parallelCoord M D)) = 0 := by
      exact max_eq_left (by linarith)
    rw [hmax]
    exact hrl_nonpos

/--
If the already-defected main `M + D` has a lower bound that strictly dominates
the norm-paid rest `R`, then the full vector is nonzero.
-/
theorem ne_zero_of_main_after_defect_lower
    (M D R : ℂ)
    (mainAfterDefectLower restUpper : ℝ)
    (hLower : mainAfterDefectLower ≤ ‖M + D‖)
    (hRest : ‖R‖ ≤ restUpper)
    (hBudget : restUpper < mainAfterDefectLower) :
    M + D + R ≠ 0 := by
  intro hzero
  have hMD_eq : M + D = -R := by
    calc
      M + D = (M + D + R) - R := by ring
      _ = -R := by simp [hzero]
  have hMD_le : ‖M + D‖ ≤ restUpper := by
    calc
      ‖M + D‖ = ‖-R‖ := by rw [hMD_eq]
      _ = ‖R‖ := norm_neg R
      _ ≤ restUpper := hRest
  linarith

/--
Radial-loss version of the ledger: if adding `D` can reduce the main by at most
`radialUpper`, and the remaining norm-paid rest is smaller than the resulting
reserve, then no cancellation is possible.
-/
theorem ne_zero_of_radialLoss_budget
    (M D R : ℂ)
    (mainLower radialUpper restUpper : ℝ)
    (hMain : mainLower ≤ ‖M‖)
    (hRadial : ‖M‖ - ‖M + D‖ ≤ radialUpper)
    (hRest : ‖R‖ ≤ restUpper)
    (hBudget : radialUpper + restUpper < mainLower) :
    M + D + R ≠ 0 := by
  have hLower : mainLower - radialUpper ≤ ‖M + D‖ := by
    linarith
  have hBudget' : restUpper < mainLower - radialUpper := by
    linarith
  exact ne_zero_of_main_after_defect_lower
    (M := M) (D := D) (R := R)
    (mainAfterDefectLower := mainLower - radialUpper)
    (restUpper := restUpper)
    hLower hRest hBudget'

/--
Same ledger using the nonnegative radial-loss envelope.  This is often the more
convenient certificate shape for finite audits.
-/
theorem ne_zero_of_radialLossPos_budget
    (M D R : ℂ)
    (mainLower radialUpper restUpper : ℝ)
    (hMain : mainLower ≤ ‖M‖)
    (hRadial : radialLossPos M D ≤ radialUpper)
    (hRest : ‖R‖ ≤ restUpper)
    (hBudget : radialUpper + restUpper < mainLower) :
    M + D + R ≠ 0 := by
  have hRadialSigned : ‖M‖ - ‖M + D‖ ≤ radialUpper := by
    exact le_trans (le_max_right (0 : ℝ) (radialLoss M D)) hRadial
  exact ne_zero_of_radialLoss_budget
    (M := M) (D := D) (R := R)
    (mainLower := mainLower)
    (radialUpper := radialUpper)
    (restUpper := restUpper)
    hMain hRadialSigned hRest hBudget

/--
`j0`-first ledger: pay the dominant horizontal layer `D0` by a radial budget and
pay the remaining complex rest by norm.
-/
theorem ne_zero_of_projected_j0_and_rest
    (M D0 Drest R : ℂ)
    (mainLower radialUpper restUpper : ℝ)
    (hMain : mainLower ≤ ‖M‖)
    (hRadial : ‖M‖ - ‖M + D0‖ ≤ radialUpper)
    (hRest : ‖Drest + R‖ ≤ restUpper)
    (hBudget : radialUpper + restUpper < mainLower) :
    M + D0 + Drest + R ≠ 0 := by
  have hNonzero :
      M + D0 + (Drest + R) ≠ 0 :=
    ne_zero_of_radialLoss_budget
      (M := M) (D := D0) (R := Drest + R)
      (mainLower := mainLower)
      (radialUpper := radialUpper)
      (restUpper := restUpper)
      hMain hRadial hRest hBudget
  intro hzero
  apply hNonzero
  calc
    M + D0 + (Drest + R) = M + D0 + Drest + R := by ring
    _ = 0 := hzero

/--
Variant of the `j0` ledger where the rest budget is supplied as separate norm
bounds for `Drest` and `R`.
-/
theorem ne_zero_of_projected_j0_and_separate_rest
    (M D0 Drest R : ℂ)
    (mainLower radialUpper restUpper : ℝ)
    (hMain : mainLower ≤ ‖M‖)
    (hRadial : ‖M‖ - ‖M + D0‖ ≤ radialUpper)
    (hRest : ‖Drest‖ + ‖R‖ ≤ restUpper)
    (hBudget : radialUpper + restUpper < mainLower) :
    M + D0 + Drest + R ≠ 0 := by
  have hRestCombined : ‖Drest + R‖ ≤ restUpper := by
    exact le_trans (norm_add_le Drest R) hRest
  exact ne_zero_of_projected_j0_and_rest
    (M := M) (D0 := D0) (Drest := Drest) (R := R)
    (mainLower := mainLower)
    (radialUpper := radialUpper)
    (restUpper := restUpper)
    hMain hRadial hRestCombined hBudget

/--
`j0`-first ledger with the dominant layer paid by a destructive parallel budget.
-/
theorem ne_zero_of_projected_j0_and_rest_parallel
    (M D0 Drest R : ℂ)
    (mainLower parallelUpper restUpper : ℝ)
    (hM : M ≠ 0)
    (hMain : mainLower ≤ ‖M‖)
    (hParallel : destructiveParallel M D0 ≤ parallelUpper)
    (hRest : ‖Drest + R‖ ≤ restUpper)
    (hBudget : parallelUpper + restUpper < mainLower) :
    M + D0 + Drest + R ≠ 0 := by
  have hRadial : ‖M‖ - ‖M + D0‖ ≤ parallelUpper := by
    exact le_trans (radialLoss_le_destructiveParallel M D0 hM) hParallel
  exact ne_zero_of_projected_j0_and_rest
    (M := M) (D0 := D0) (Drest := Drest) (R := R)
    (mainLower := mainLower)
    (radialUpper := parallelUpper)
    (restUpper := restUpper)
    hMain hRadial hRest hBudget

/--
Parallel-budget variant where the remaining horizontal layers and the other
residuals are supplied as separate norm budgets.
-/
theorem ne_zero_of_projected_j0_and_separate_rest_parallel
    (M D0 Drest R : ℂ)
    (mainLower parallelUpper restUpper : ℝ)
    (hM : M ≠ 0)
    (hMain : mainLower ≤ ‖M‖)
    (hParallel : destructiveParallel M D0 ≤ parallelUpper)
    (hRest : ‖Drest‖ + ‖R‖ ≤ restUpper)
    (hBudget : parallelUpper + restUpper < mainLower) :
    M + D0 + Drest + R ≠ 0 := by
  have hRestCombined : ‖Drest + R‖ ≤ restUpper := by
    exact le_trans (norm_add_le Drest R) hRest
  exact ne_zero_of_projected_j0_and_rest_parallel
    (M := M) (D0 := D0) (Drest := Drest) (R := R)
    (mainLower := mainLower)
    (parallelUpper := parallelUpper)
    (restUpper := restUpper)
    hM hMain hParallel hRestCombined hBudget

def projectionBridgeTarget (M D : ℂ) : Prop :=
  M ≠ 0 → radialLoss M D ≤ destructiveParallel M D

theorem projectionBridgeTarget_holds
    (M D : ℂ) :
    projectionBridgeTarget M D := by
  intro hM
  exact radialLoss_le_destructiveParallel M D hM

end AdjustedQuartetHorizontalProjection
end C2
