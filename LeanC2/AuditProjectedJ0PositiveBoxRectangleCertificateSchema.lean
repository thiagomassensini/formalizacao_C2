import LeanC2.AuditProjectedJ0SubboxToSectorBridge

/-!
# Rational rectangle certificate schema for positive-box subboxes

This file separates exact rational rectangle data from analytic enclosure
hypotheses.  A certificate stores four raw rational rectangles and only the
rational endpoint conditions needed by the rectangle arithmetic.  Membership
of the four analytic values is supplied explicitly to `toSectorBridgeData`.
-/

namespace C2
namespace ProjectedJ0RectangleArithmetic

/-- A closed interval whose endpoints are exact rational data. -/
structure RationalRealInterval where
  lo : ℚ
  hi : ℚ

namespace RationalRealInterval

def toRealInterval (I : RationalRealInterval) : RealInterval :=
  { lo := (I.lo : ℝ), hi := (I.hi : ℝ) }

def Valid (I : RationalRealInterval) : Prop :=
  I.lo ≤ I.hi

def add (I J : RationalRealInterval) : RationalRealInterval :=
  { lo := I.lo + J.lo, hi := I.hi + J.hi }

/-- Exact product interval when both input intervals are nonnegative. -/
def mulNonneg (I J : RationalRealInterval) : RationalRealInterval :=
  { lo := I.lo * J.lo, hi := I.hi * J.hi }

/-- Exact product interval when both input intervals are nonpositive. -/
def mulNonpos (I J : RationalRealInterval) : RationalRealInterval :=
  { lo := I.hi * J.hi, hi := I.lo * J.lo }

def neg (I : RationalRealInterval) : RationalRealInterval :=
  { lo := -I.hi, hi := -I.lo }

/-- The exact rational maximum of the absolute endpoint values. -/
def absEndpointMax (I : RationalRealInterval) : ℚ :=
  max |I.lo| |I.hi|

theorem valid_toRealInterval
    {I : RationalRealInterval} (hI : I.Valid) :
    I.toRealInterval.Valid := by
  change (I.lo : ℝ) ≤ (I.hi : ℝ)
  exact_mod_cast hI

theorem add_contains
    {I J : RationalRealInterval} {x y : ℝ}
    (hx : I.toRealInterval.Contains x)
    (hy : J.toRealInterval.Contains y) :
    (I.add J).toRealInterval.Contains (x + y) := by
  apply RealInterval.add_contains hx hy
  · simp [add, toRealInterval]
  · simp [add, toRealInterval]

theorem mulNonneg_contains
    {I J : RationalRealInterval} {x y : ℝ}
    (hx : I.toRealInterval.Contains x)
    (hy : J.toRealInterval.Contains y)
    (hI : 0 ≤ I.lo)
    (hJ : 0 ≤ J.lo) :
    (I.mulNonneg J).toRealInterval.Contains (x * y) := by
  have hI0 : (0 : ℝ) ≤ (I.lo : ℝ) := by exact_mod_cast hI
  have hJ0 : (0 : ℝ) ≤ (J.lo : ℝ) := by exact_mod_cast hJ
  have hx0 : 0 ≤ x := le_trans hI0 hx.1
  have hy0 : 0 ≤ y := le_trans hJ0 hy.1
  constructor
  · simpa [mulNonneg, toRealInterval] using
      (mul_le_mul hx.1 hy.1 hJ0 hx0)
  · simpa [mulNonneg, toRealInterval] using
      (mul_le_mul hx.2 hy.2 hy0 (le_trans hx0 hx.2))

theorem mulNonpos_contains
    {I J : RationalRealInterval} {x y : ℝ}
    (hx : I.toRealInterval.Contains x)
    (hy : J.toRealInterval.Contains y)
    (hI : I.hi ≤ 0)
    (hJ : J.hi ≤ 0) :
    (I.mulNonpos J).toRealInterval.Contains (x * y) := by
  have hI0 : (I.hi : ℝ) ≤ 0 := by exact_mod_cast hI
  have hJ0 : (J.hi : ℝ) ≤ 0 := by exact_mod_cast hJ
  have hx0 : x ≤ 0 := le_trans hx.2 hI0
  have hy0 : y ≤ 0 := le_trans hy.2 hJ0
  constructor
  · suffices (I.hi : ℝ) * (J.hi : ℝ) ≤ x * y by
      simpa [mulNonpos, toRealInterval] using this
    have hnx : -(I.hi : ℝ) ≤ -x := neg_le_neg hx.2
    have hny : -(J.hi : ℝ) ≤ -y := neg_le_neg hy.2
    have hnegI : 0 ≤ -(I.hi : ℝ) := by linarith
    have hnegJ : 0 ≤ -(J.hi : ℝ) := by linarith
    have hnegX : 0 ≤ -x := by linarith
    have h := mul_le_mul hnx hny hnegJ hnegX
    simpa only [neg_mul_neg] using h
  · suffices x * y ≤ (I.lo : ℝ) * (J.lo : ℝ) by
      simpa [mulNonpos, toRealInterval] using this
    have hnx : -x ≤ -(I.lo : ℝ) := neg_le_neg hx.1
    have hny : -y ≤ -(J.lo : ℝ) := neg_le_neg hy.1
    have hnegX : 0 ≤ -x := by linarith
    have hnegI : 0 ≤ -(I.lo : ℝ) :=
      le_trans (by linarith : 0 ≤ -x) hnx
    have h := mul_le_mul hnx hny (by linarith : 0 ≤ -y) hnegI
    simpa only [neg_mul_neg] using h

theorem neg_contains
    {I : RationalRealInterval} {x : ℝ}
    (hx : I.toRealInterval.Contains x) :
    I.neg.toRealInterval.Contains (-x) := by
  simpa [neg, toRealInterval] using RealInterval.neg_contains hx

theorem absEndpointMax_nonneg (I : RationalRealInterval) :
    0 ≤ I.absEndpointMax := by
  exact le_trans (abs_nonneg I.lo) (le_max_left _ _)

theorem abs_lo_le_absEndpointMax (I : RationalRealInterval) :
    |I.lo| ≤ I.absEndpointMax :=
  le_max_left _ _

theorem abs_hi_le_absEndpointMax (I : RationalRealInterval) :
    |I.hi| ≤ I.absEndpointMax :=
  le_max_right _ _

end RationalRealInterval

/-- A complex rectangle whose four endpoints are exact rational data. -/
structure RationalComplexRect where
  re : RationalRealInterval
  im : RationalRealInterval

namespace RationalComplexRect

def toComplexRect (R : RationalComplexRect) : ComplexRect :=
  { re := R.re.toRealInterval, im := R.im.toRealInterval }

def Valid (R : RationalComplexRect) : Prop :=
  R.re.Valid ∧ R.im.Valid

def add (A B : RationalComplexRect) : RationalComplexRect :=
  { re := A.re.add B.re, im := A.im.add B.im }

theorem valid_toComplexRect
    {R : RationalComplexRect} (hR : R.Valid) :
    R.toComplexRect.re.Valid ∧ R.toComplexRect.im.Valid :=
  ⟨RationalRealInterval.valid_toRealInterval hR.1,
    RationalRealInterval.valid_toRealInterval hR.2⟩

theorem add_contains
    {A B : RationalComplexRect} {z w : ℂ}
    (hz : A.toComplexRect.Contains z)
    (hw : B.toComplexRect.Contains w) :
    (A.add B).toComplexRect.Contains (z + w) := by
  constructor
  · simpa [toComplexRect, add, Complex.add_re] using
      RationalRealInterval.add_contains hz.1 hw.1
  · simpa [toComplexRect, add, Complex.add_im] using
      RationalRealInterval.add_contains hz.2 hw.2

end RationalComplexRect

/--
The rational endpoint upper bound for `-Re (D0 * conj M)` under the sign
pattern recorded in `ProjectedJ0SubboxRectangleCertificateData`.
-/
def projectedJ0D0NegReUpperRat
    (MRect D0Rect : RationalComplexRect) : ℚ :=
  -((D0Rect.re.mulNonneg MRect.re).lo +
    (D0Rect.im.mulNonpos MRect.im).lo)

/-- Exact combined raw rectangle for `Drest + RvecTail`. -/
def projectedJ0RestCombinedRectRat
    (DrestRect RvecTailRect : RationalComplexRect) : RationalComplexRect :=
  DrestRect.add RvecTailRect

def projectedJ0RestCombinedReAbsUpperRat
    (DrestRect RvecTailRect : RationalComplexRect) : ℚ :=
  (projectedJ0RestCombinedRectRat DrestRect RvecTailRect).re.absEndpointMax

def projectedJ0RestCombinedImAbsUpperRat
    (DrestRect RvecTailRect : RationalComplexRect) : ℚ :=
  (projectedJ0RestCombinedRectRat DrestRect RvecTailRect).im.absEndpointMax

/--
Pure rational certificate data for one positive-box subbox.  In particular,
this structure contains no analytic membership statement and no prepackaged
main, sector, or rest bound.
-/
structure ProjectedJ0SubboxRectangleCertificateData
    (mainLower d0NegReUpper restUpper : ℚ) where
  MRect : RationalComplexRect
  D0Rect : RationalComplexRect
  DrestRect : RationalComplexRect
  RvecTailRect : RationalComplexRect
  MRect_valid : MRect.Valid
  D0Rect_valid : D0Rect.Valid
  DrestRect_valid : DrestRect.Valid
  RvecTailRect_valid : RvecTailRect.Valid
  M_re_nonneg : 0 ≤ MRect.re.lo
  M_im_nonpos : MRect.im.hi ≤ 0
  D0_re_nonneg : 0 ≤ D0Rect.re.lo
  D0_im_nonpos : D0Rect.im.hi ≤ 0
  mainLower_nonneg : 0 ≤ mainLower
  mainLower_sq :
    mainLower ^ 2 ≤ MRect.re.lo ^ 2 + (-MRect.im.hi) ^ 2
  d0_endpoint_upper_le :
    projectedJ0D0NegReUpperRat MRect D0Rect ≤ d0NegReUpper
  restUpper_nonneg : 0 ≤ restUpper
  rest_endpoint_sq_le :
    projectedJ0RestCombinedReAbsUpperRat DrestRect RvecTailRect ^ 2 +
      projectedJ0RestCombinedImAbsUpperRat DrestRect RvecTailRect ^ 2 ≤
        restUpper ^ 2

namespace ProjectedJ0SubboxRectangleCertificateData

variable {mainLower d0NegReUpper restUpper : ℚ}

def mainLowerCert
    (data :
      ProjectedJ0SubboxRectangleCertificateData
        mainLower d0NegReUpper restUpper) :
    ComplexRectNormLowerCert data.MRect.toComplexRect where
  reLower := data.MRect.re.toRealInterval.absLower_of_nonneg (by
    simpa [RationalRealInterval.toRealInterval] using
      (show (0 : ℝ) ≤ (data.MRect.re.lo : ℝ) by
        exact_mod_cast data.M_re_nonneg))
  imLower := data.MRect.im.toRealInterval.absLower_of_nonpos (by
    simpa [RationalRealInterval.toRealInterval] using
      (show (data.MRect.im.hi : ℝ) ≤ 0 by
        exact_mod_cast data.M_im_nonpos))
  lower := (mainLower : ℝ)
  lower_nonneg := by exact_mod_cast data.mainLower_nonneg
  lower_sq := by
    change (mainLower : ℝ) ^ 2 ≤
      (data.MRect.re.lo : ℝ) ^ 2 + (-(data.MRect.im.hi : ℝ)) ^ 2
    exact_mod_cast data.mainLower_sq

def restCombinedRect
    (data :
      ProjectedJ0SubboxRectangleCertificateData
        mainLower d0NegReUpper restUpper) : ComplexRect :=
  (projectedJ0RestCombinedRectRat
    data.DrestRect data.RvecTailRect).toComplexRect

private theorem abs_cast_le_absEndpointMax_cast
    (I : RationalRealInterval) (q : ℚ)
    (hq : |q| ≤ I.absEndpointMax) :
    |(q : ℝ)| ≤ (I.absEndpointMax : ℝ) := by
  exact_mod_cast hq

def restUpperCert
    (data :
      ProjectedJ0SubboxRectangleCertificateData
        mainLower d0NegReUpper restUpper) :
    ComplexRectNormUpperCert data.restCombinedRect where
  reUpper :=
    (projectedJ0RestCombinedRectRat
      data.DrestRect data.RvecTailRect).re.toRealInterval.absUpper_of_bounds
      (projectedJ0RestCombinedReAbsUpperRat
        data.DrestRect data.RvecTailRect : ℝ)
      (by
        exact_mod_cast
          (RationalRealInterval.absEndpointMax_nonneg
            (projectedJ0RestCombinedRectRat
              data.DrestRect data.RvecTailRect).re))
      (abs_cast_le_absEndpointMax_cast _ _
        (RationalRealInterval.abs_lo_le_absEndpointMax _))
      (abs_cast_le_absEndpointMax_cast _ _
        (RationalRealInterval.abs_hi_le_absEndpointMax _))
      (by
        apply RationalRealInterval.valid_toRealInterval
        exact add_le_add data.DrestRect_valid.1 data.RvecTailRect_valid.1)
  imUpper :=
    (projectedJ0RestCombinedRectRat
      data.DrestRect data.RvecTailRect).im.toRealInterval.absUpper_of_bounds
      (projectedJ0RestCombinedImAbsUpperRat
        data.DrestRect data.RvecTailRect : ℝ)
      (by
        exact_mod_cast
          (RationalRealInterval.absEndpointMax_nonneg
            (projectedJ0RestCombinedRectRat
              data.DrestRect data.RvecTailRect).im))
      (abs_cast_le_absEndpointMax_cast _ _
        (RationalRealInterval.abs_lo_le_absEndpointMax _))
      (abs_cast_le_absEndpointMax_cast _ _
        (RationalRealInterval.abs_hi_le_absEndpointMax _))
      (by
        apply RationalRealInterval.valid_toRealInterval
        exact add_le_add data.DrestRect_valid.2 data.RvecTailRect_valid.2)
  upper := (restUpper : ℝ)
  upper_nonneg := by exact_mod_cast data.restUpper_nonneg
  upper_sq := by
    change
      (projectedJ0RestCombinedReAbsUpperRat
          data.DrestRect data.RvecTailRect : ℝ) ^ 2 +
        (projectedJ0RestCombinedImAbsUpperRat
          data.DrestRect data.RvecTailRect : ℝ) ^ 2 ≤
            (restUpper : ℝ) ^ 2
    exact_mod_cast data.rest_endpoint_sq_le

private theorem d0_endpoint_bound
    (data :
      ProjectedJ0SubboxRectangleCertificateData
        mainLower d0NegReUpper restUpper)
    {M D0 : ℂ}
    (hM : data.MRect.toComplexRect.Contains M)
    (hD0 : data.D0Rect.toComplexRect.Contains D0) :
    -((D0 * starRingEnd ℂ M).re) ≤
      (projectedJ0D0NegReUpperRat data.MRect data.D0Rect : ℝ) := by
  let xu := data.D0Rect.re.mulNonneg data.MRect.re
  let yv := data.D0Rect.im.mulNonpos data.MRect.im
  let sum := xu.add yv
  let neg := sum.neg
  have hxu : xu.toRealInterval.Contains (D0.re * M.re) :=
    RationalRealInterval.mulNonneg_contains hD0.1 hM.1
      data.D0_re_nonneg data.M_re_nonneg
  have hyv : yv.toRealInterval.Contains (D0.im * M.im) :=
    RationalRealInterval.mulNonpos_contains hD0.2 hM.2
      data.D0_im_nonpos data.M_im_nonpos
  have hsum : sum.toRealInterval.Contains
      (D0.re * M.re + D0.im * M.im) :=
    RationalRealInterval.add_contains hxu hyv
  have hneg : neg.toRealInterval.Contains
      (-(D0.re * M.re + D0.im * M.im)) :=
    RationalRealInterval.neg_contains hsum
  apply d0NegReMain_upper_of_rects
    hD0 hM hxu hyv hsum hneg
  change
    ((-((data.D0Rect.re.mulNonneg data.MRect.re).lo +
      (data.D0Rect.im.mulNonpos data.MRect.im).lo) : ℚ) : ℝ) ≤
      (projectedJ0D0NegReUpperRat data.MRect data.D0Rect : ℝ)
  exact le_rfl

def rectContract
    (data :
      ProjectedJ0SubboxRectangleCertificateData
        mainLower d0NegReUpper restUpper)
    {M D0 Drest RvecTail : ℂ}
    (hM : data.MRect.toComplexRect.Contains M)
    (hD0 : data.D0Rect.toComplexRect.Contains D0)
    (hDrest : data.DrestRect.toComplexRect.Contains Drest)
    (hRvecTail : data.RvecTailRect.toComplexRect.Contains RvecTail) :
    ProjectedJ0SubboxRectangleContract M D0 Drest RvecTail where
  Mrect := data.MRect.toComplexRect
  D0rect := data.D0Rect.toComplexRect
  DrestRect := data.DrestRect.toComplexRect
  RvecTailRect := data.RvecTailRect.toComplexRect
  hM := hM
  hD0 := hD0
  hDrest := hDrest
  hRvecTail := hRvecTail

/--
Turn rational rectangle data and four primitive analytic memberships into the
existing sector bridge.  No membership is inferred from the rational data.
-/
def toSectorBridgeData
    (data :
      ProjectedJ0SubboxRectangleCertificateData
        mainLower d0NegReUpper restUpper)
    {M D0 Drest RvecTail : ℂ}
    (hM : data.MRect.toComplexRect.Contains M)
    (hD0 : data.D0Rect.toComplexRect.Contains D0)
    (hDrest : data.DrestRect.toComplexRect.Contains Drest)
    (hRvecTail : data.RvecTailRect.toComplexRect.Contains RvecTail) :
    ProjectedJ0SubboxSectorBridgeData
      M D0 Drest RvecTail
      (mainLower : ℝ) (d0NegReUpper : ℝ) (restUpper : ℝ) := by
  let contract := data.rectContract hM hD0 hDrest hRvecTail
  let modBounds : ProjectedJ0SubboxModBounds contract :=
    { mainLowerCert := data.mainLowerCert
      restRect := data.restCombinedRect
      rest_contains := by
        intro z w hz hw
        exact RationalComplexRect.add_contains hz hw
      restUpperCert := data.restUpperCert }
  let derivedBounds : ProjectedJ0SubboxDerivedBounds contract :=
    { d0NegReUpper :=
        (projectedJ0D0NegReUpperRat data.MRect data.D0Rect : ℝ)
      mainLower := (mainLower : ℝ)
      restUpper := (restUpper : ℝ)
      hD0Upper := d0_endpoint_bound data hM hD0
      hMainLower := data.mainLowerCert.valid hM
      hRestUpper := data.restUpperCert.valid
        (RationalComplexRect.add_contains hDrest hRvecTail) }
  exact
    { rectContract := contract
      derivedBounds := derivedBounds
      modBounds := modBounds
      mainLower_le_modLower := le_rfl
      d0Upper_le := by
        change
          (projectedJ0D0NegReUpperRat data.MRect data.D0Rect : ℝ) ≤
            (d0NegReUpper : ℝ)
        exact_mod_cast data.d0_endpoint_upper_le
      restUpper_le := le_rfl }

end ProjectedJ0SubboxRectangleCertificateData

end ProjectedJ0RectangleArithmetic
end C2
