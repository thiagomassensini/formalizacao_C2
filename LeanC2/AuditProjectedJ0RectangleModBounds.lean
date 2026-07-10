import LeanC2.AuditProjectedJ0RectangleArithmetic

/-!
# Abstract modulus bounds for projected-j0 rectangle certificates

This file adds a small certificate layer for turning complex rectangles into
lower/upper bounds for complex norms.  It does not prove analytic enclosures
for the finite objects and it does not include subbox data.
-/

namespace C2
namespace ProjectedJ0RectangleArithmetic

theorem complex_norm_sq_eq_re_sq_add_im_sq (z : ℂ) :
    ‖z‖ ^ 2 = z.re ^ 2 + z.im ^ 2 := by
  rw [Complex.sq_norm]
  simp [Complex.normSq_apply]
  ring

structure RealIntervalAbsLowerCert (I : RealInterval) where
  lower : ℝ
  lower_nonneg : 0 ≤ lower
  valid : ∀ x : ℝ, I.Contains x → lower ≤ |x|

structure RealIntervalAbsUpperCert (I : RealInterval) where
  upper : ℝ
  upper_nonneg : 0 ≤ upper
  valid : ∀ x : ℝ, I.Contains x → |x| ≤ upper

namespace RealInterval

def absLower_of_nonneg
    (I : RealInterval)
    (hlo : 0 ≤ I.lo) :
    RealIntervalAbsLowerCert I where
  lower := I.lo
  lower_nonneg := hlo
  valid := by
    intro x hx
    have hx0 : 0 ≤ x := le_trans hlo hx.1
    simpa [abs_of_nonneg hx0] using hx.1

def absLower_of_nonpos
    (I : RealInterval)
    (hhi : I.hi ≤ 0) :
    RealIntervalAbsLowerCert I where
  lower := -I.hi
  lower_nonneg := by linarith
  valid := by
    intro x hx
    have hx0 : x ≤ 0 := le_trans hx.2 hhi
    have hneg : -I.hi ≤ -x := neg_le_neg hx.2
    simpa [abs_of_nonpos hx0] using hneg

def absLower_zero
    (I : RealInterval) :
    RealIntervalAbsLowerCert I where
  lower := 0
  lower_nonneg := by norm_num
  valid := by
    intro x _hx
    exact abs_nonneg x

def absUpper_of_bounds
    (I : RealInterval) (U : ℝ)
    (hU0 : 0 ≤ U)
    (hlo : |I.lo| ≤ U)
    (hhi : |I.hi| ≤ U)
    (_hvalid : I.Valid) :
    RealIntervalAbsUpperCert I where
  upper := U
  upper_nonneg := hU0
  valid := by
    intro x hx
    have hlo_abs := abs_le.mp hlo
    have hhi_abs := abs_le.mp hhi
    exact abs_le.mpr ⟨le_trans hlo_abs.1 hx.1, le_trans hx.2 hhi_abs.2⟩

end RealInterval

structure ComplexRectNormLowerCert (R : ComplexRect) where
  reLower : RealIntervalAbsLowerCert R.re
  imLower : RealIntervalAbsLowerCert R.im
  lower : ℝ
  lower_nonneg : 0 ≤ lower
  lower_sq :
    lower ^ 2 ≤ reLower.lower ^ 2 + imLower.lower ^ 2

namespace ComplexRectNormLowerCert

theorem valid
    {R : ComplexRect}
    (cert : ComplexRectNormLowerCert R)
    {z : ℂ}
    (hz : R.Contains z) :
    cert.lower ≤ ‖z‖ := by
  have hre_abs : cert.reLower.lower ≤ |z.re| :=
    cert.reLower.valid z.re hz.1
  have him_abs : cert.imLower.lower ≤ |z.im| :=
    cert.imLower.valid z.im hz.2
  have hre_sq : cert.reLower.lower ^ 2 ≤ z.re ^ 2 := by
    have hsq := pow_le_pow_left₀ cert.reLower.lower_nonneg hre_abs 2
    simpa [sq_abs] using hsq
  have him_sq : cert.imLower.lower ^ 2 ≤ z.im ^ 2 := by
    have hsq := pow_le_pow_left₀ cert.imLower.lower_nonneg him_abs 2
    simpa [sq_abs] using hsq
  have hnorm_sq :
      cert.lower ^ 2 ≤ ‖z‖ ^ 2 := by
    rw [complex_norm_sq_eq_re_sq_add_im_sq]
    nlinarith [cert.lower_sq, hre_sq, him_sq]
  have h_abs : |cert.lower| ≤ |‖z‖| := sq_le_sq.mp hnorm_sq
  simpa [abs_of_nonneg cert.lower_nonneg, abs_of_nonneg (norm_nonneg z)] using h_abs

end ComplexRectNormLowerCert

structure ComplexRectNormUpperCert (R : ComplexRect) where
  reUpper : RealIntervalAbsUpperCert R.re
  imUpper : RealIntervalAbsUpperCert R.im
  upper : ℝ
  upper_nonneg : 0 ≤ upper
  upper_sq :
    reUpper.upper ^ 2 + imUpper.upper ^ 2 ≤ upper ^ 2

namespace ComplexRectNormUpperCert

theorem valid
    {R : ComplexRect}
    (cert : ComplexRectNormUpperCert R)
    {z : ℂ}
    (hz : R.Contains z) :
    ‖z‖ ≤ cert.upper := by
  have hre_abs : |z.re| ≤ cert.reUpper.upper :=
    cert.reUpper.valid z.re hz.1
  have him_abs : |z.im| ≤ cert.imUpper.upper :=
    cert.imUpper.valid z.im hz.2
  have hre_sq : z.re ^ 2 ≤ cert.reUpper.upper ^ 2 := by
    have hsq := pow_le_pow_left₀ (abs_nonneg z.re) hre_abs 2
    simpa [sq_abs] using hsq
  have him_sq : z.im ^ 2 ≤ cert.imUpper.upper ^ 2 := by
    have hsq := pow_le_pow_left₀ (abs_nonneg z.im) him_abs 2
    simpa [sq_abs] using hsq
  have hnorm_sq :
      ‖z‖ ^ 2 ≤ cert.upper ^ 2 := by
    rw [complex_norm_sq_eq_re_sq_add_im_sq]
    nlinarith [cert.upper_sq, hre_sq, him_sq]
  have h_abs : |‖z‖| ≤ |cert.upper| := sq_le_sq.mp hnorm_sq
  simpa [abs_of_nonneg (norm_nonneg z), abs_of_nonneg cert.upper_nonneg] using h_abs

end ComplexRectNormUpperCert

structure ProjectedJ0SubboxModBounds
    {M D0 Drest RvecTail : ℂ}
    (contract : ProjectedJ0SubboxRectangleContract M D0 Drest RvecTail) where
  mainLowerCert : ComplexRectNormLowerCert contract.Mrect
  restRect : ComplexRect
  rest_contains :
    ∀ z w : ℂ,
      contract.DrestRect.Contains z →
      contract.RvecTailRect.Contains w →
        restRect.Contains (z + w)
  restUpperCert : ComplexRectNormUpperCert restRect

namespace ProjectedJ0SubboxModBounds

theorem main_lower
    {M D0 Drest RvecTail : ℂ}
    {contract : ProjectedJ0SubboxRectangleContract M D0 Drest RvecTail}
    (bounds : ProjectedJ0SubboxModBounds contract) :
    bounds.mainLowerCert.lower ≤ ‖M‖ :=
  bounds.mainLowerCert.valid contract.hM

theorem rest_upper
    {M D0 Drest RvecTail : ℂ}
    {contract : ProjectedJ0SubboxRectangleContract M D0 Drest RvecTail}
    (bounds : ProjectedJ0SubboxModBounds contract) :
    ‖Drest + RvecTail‖ ≤ bounds.restUpperCert.upper := by
  exact bounds.restUpperCert.valid
    (bounds.rest_contains Drest RvecTail contract.hDrest contract.hRvecTail)

end ProjectedJ0SubboxModBounds

end ProjectedJ0RectangleArithmetic
end C2
