import LeanC2.Operators.Tilt

namespace C2

/-!
Center-Gaussian tilt bridge.

This file keeps the current Genuine-First route local: it packages the normalized
tilt curvature as a multiplicative weight and records the small algebraic facts
needed before formulating the full center-Gaussian ledger.
-/

/-- Perturbative center-Gaussian tilt factor used by the numerical ledger. -/
noncomputable def centerGaussianTiltFactor (lam δ c : ℝ) : ℝ :=
  1 + lam * normalizedTiltCurvature δ c

@[simp] theorem centerGaussianTiltFactor_zero_delta (lam c : ℝ) :
    centerGaussianTiltFactor lam 0 c = 1 := by
  simp [centerGaussianTiltFactor]

@[simp] theorem centerGaussianTiltFactor_zero_lambda (δ c : ℝ) :
    centerGaussianTiltFactor 0 δ c = 1 := by
  simp [centerGaussianTiltFactor]

theorem centerGaussianTiltFactor_sub_one
    (lam δ c : ℝ) :
    centerGaussianTiltFactor lam δ c - 1 =
      lam * normalizedTiltCurvature δ c := by
  simp [centerGaussianTiltFactor]

theorem centerGaussianTiltFactor_gt_one_of_pos
    {lam δ c : ℝ} (hlam : 0 < lam) (hδ : 0 < δ) (hc : 1 < c) :
    1 < centerGaussianTiltFactor lam δ c := by
  have hcurv : 0 < normalizedTiltCurvature δ c :=
    normalizedTiltCurvature_pos_of_pos (δ := δ) (c := c) hδ hc
  have hprod : 0 < lam * normalizedTiltCurvature δ c := mul_pos hlam hcurv
  rw [centerGaussianTiltFactor]
  linarith

theorem centerGaussianTiltFactor_lt_one_of_neg
    {lam δ c : ℝ} (hlam : 0 < lam) (hδlow : -1 < δ) (hδ : δ < 0) (hc : 1 < c) :
    centerGaussianTiltFactor lam δ c < 1 := by
  have hcurv : normalizedTiltCurvature δ c < 0 :=
    normalizedTiltCurvature_neg_of_neg_one_lt (δ := δ) (c := c) hδlow hδ hc
  have hprod : lam * normalizedTiltCurvature δ c < 0 := mul_neg_of_pos_of_neg hlam hcurv
  rw [centerGaussianTiltFactor]
  linarith

theorem centerGaussianTiltFactor_pos_of_product_gt_neg_one
    {lam δ c : ℝ}
    (hprod : -1 < lam * normalizedTiltCurvature δ c) :
    0 < centerGaussianTiltFactor lam δ c := by
  rw [centerGaussianTiltFactor]
  linarith

theorem centerGaussianTiltFactor_ne_zero_of_product_gt_neg_one
    {lam δ c : ℝ}
    (hprod : -1 < lam * normalizedTiltCurvature δ c) :
    centerGaussianTiltFactor lam δ c ≠ 0 :=
  ne_of_gt (centerGaussianTiltFactor_pos_of_product_gt_neg_one
    (lam := lam) (δ := δ) (c := c) hprod)

theorem centerGaussianTiltFactor_eq_one_iff_delta_zero
    {lam δ c : ℝ} (hlam : lam ≠ 0) (hδlow : -1 < δ) (hc : 1 < c) :
    centerGaussianTiltFactor lam δ c = 1 ↔ δ = 0 := by
  constructor
  · intro h
    have hprod : lam * normalizedTiltCurvature δ c = 0 := by
      have hsub := congrArg (fun x : ℝ => x - 1) h
      simpa [centerGaussianTiltFactor] using hsub
    have hcurv : normalizedTiltCurvature δ c = 0 :=
      (mul_eq_zero.mp hprod).resolve_left hlam
    exact (normalizedTiltCurvature_zero_iff_delta_zero
      (δ := δ) (c := c) hδlow hc).mp hcurv
  · intro hδ
    simp [hδ]

/-- A finite center-Gaussian ledger with an arbitrary address type. -/
noncomputable def centerGaussianTiltedFiniteLedger
    {α : Type*} (S : Finset α) (term : α → ℂ) (center : α → ℝ)
    (lam δ : ℝ) : ℂ :=
  ∑ a ∈ S, (centerGaussianTiltFactor lam δ (center a) : ℂ) * term a

/-- The tilted ledger is the untilted ledger on the critical line. -/
theorem centerGaussianTiltedFiniteLedger_zero_delta
    {α : Type*} (S : Finset α) (term : α → ℂ) (center : α → ℝ)
    (lam : ℝ) :
    centerGaussianTiltedFiniteLedger S term center lam 0 =
      ∑ a ∈ S, term a := by
  simp [centerGaussianTiltedFiniteLedger]

/--
Finite block split for the tilted ledger.  This is the abstract bookkeeping
identity behind the depth/core/center `main + rest` decompositions.
-/
theorem centerGaussianTiltedFiniteLedger_filter_add_filter_not
    {α : Type*} (S : Finset α) (term : α → ℂ) (center : α → ℝ)
    (lam δ : ℝ) (P : α → Prop) [DecidablePred P] :
    centerGaussianTiltedFiniteLedger S term center lam δ =
      centerGaussianTiltedFiniteLedger (S.filter P) term center lam δ +
        centerGaussianTiltedFiniteLedger (S.filter fun a => ¬ P a) term center lam δ := by
  unfold centerGaussianTiltedFiniteLedger
  rw [← Finset.sum_filter_add_sum_filter_not S P
    (fun a => (centerGaussianTiltFactor lam δ (center a) : ℂ) * term a)]

end C2
