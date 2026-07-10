import LeanC2.Analytic.ProjectedJ0SuperGaussianSurrogate
import LeanC2.AuditC2CenterGaussianCarrier

/-!
# Genuine genealogy of the center Gaussian carrier

This file records only exact local and finite identities.  The infinite center
Gaussian address term is the corresponding genuine central family term
multiplied by the Gaussian window, and the finite projected-J0 reference is
the already existing center-Gaussian rectangle with the producer parameters.
-/

namespace C2

open GenuineMiddleAudit

/-- At every natural C2 address, the center-Gaussian carrier term is the
corresponding genuine central family term multiplied by its Gaussian window. -/
theorem c2CenterGaussianSeriesAddressTerm_eq_genuineCentralRawFamily_mul_window
    (X : ℝ) (s : ℂ) (p : ℕ × ℕ) :
    c2CenterGaussianSeriesAddressTerm X s p =
      genuineCentralRawFamily s p *
        superGaussianCutoffWeight 2 X
          (2 ^ (p.1 + 2) * (2 * p.2 + 1)) := by
  unfold c2CenterGaussianSeriesAddressTerm c2CenterGaussianAddressTerm
    genuineCentralRawFamily
  have hcoord :=
    c2_center_coordinate_coeff_eq
      s (p.1 + 2) (2 * p.2 + 1) (by omega)
  rw [← hcoord]
  ring

/-- The producer's central finite sum with exponent `2` is exactly the
center-Gaussian rectangle with the same scale and inclusive cutoffs. -/
theorem projectedJ0SG_centralFinite_two_eq_c2CenterGaussianRectangle
    (X : ℝ) (s : ℂ) (K M : ℕ) :
    projectedJ0SG_centralFinite s K M X 2 =
      c2CenterGaussianRectangle X s K M := by
  unfold projectedJ0SG_centralFinite c2CenterGaussianRectangle
  refine Finset.sum_congr rfl ?_
  intro k _hk
  refine Finset.sum_congr rfl ?_
  intro m _hm
  rw [c2CenterGaussianAddressTerm_eq_center_pow_formula]
  unfold projectedJ0SG_weight superGaussianCutoffWeight
  have hinv : ((2 : ℂ) ^ k)⁻¹ = (1 / 2 : ℂ) ^ k := by
    rw [← inv_pow]
    norm_num
  rw [hinv]
  ring

/-- The exact finite projected-J0 reference is the `X = 10661`,
`K = 17`, `M = 16001` center-Gaussian rectangle. -/
theorem projectedJ0SG_reference_eq_c2CenterGaussianRectangle
    (s : ℂ) :
    projectedJ0SG_reference s =
      c2CenterGaussianRectangle 10661 s 17 16001 := by
  unfold projectedJ0SG_reference projectedJ0SG_referenceK
    projectedJ0SG_referenceM projectedJ0SG_X projectedJ0SG_p
  exact
    projectedJ0SG_centralFinite_two_eq_c2CenterGaussianRectangle
      10661 s 17 16001

/-- The same reference is the pre-existing genuine super-Gaussian finite
rectangle, with no change of endpoints or normalization. -/
theorem projectedJ0SG_reference_eq_superGaussianFiniteGenuineRectangle
    (s : ℂ) :
    projectedJ0SG_reference s =
      superGaussianFiniteGenuineRectangle 2 10661 s 17 16001 := by
  rw [projectedJ0SG_reference_eq_c2CenterGaussianRectangle]
  exact
    c2CenterGaussianRectangle_eq_superGaussianFiniteGenuineRectangle
      10661 s 17 16001

/-- In the positive real half-plane, the producer bookkeeping total is the
same exact center-Gaussian rectangle as its finite reference. -/
theorem projectedJ0SG_totalFinite_eq_c2CenterGaussianRectangle
    (s : ℂ) (hs : 0 < s.re) :
    projectedJ0SG_totalFinite s =
      c2CenterGaussianRectangle 10661 s 17 16001 := by
  rw [projectedJ0SG_totalFinite_eq_reference s hs]
  exact projectedJ0SG_reference_eq_c2CenterGaussianRectangle s

end C2
