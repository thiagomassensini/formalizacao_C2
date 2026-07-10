import Mathlib

/-!
# Abstract rectangle arithmetic for projected-j0 certificates

This file formalizes the small rectangle-arithmetic contract used by the
external projected-j0 sector verifier.  It does not prove analytic enclosures
for the finite objects, and it does not include certificate data.
-/

namespace C2
namespace ProjectedJ0RectangleArithmetic

structure RealInterval where
  lo : ℝ
  hi : ℝ

namespace RealInterval

def Valid (I : RealInterval) : Prop :=
  I.lo ≤ I.hi

def Contains (I : RealInterval) (x : ℝ) : Prop :=
  I.lo ≤ x ∧ x ≤ I.hi

theorem add_contains
    {I J K : RealInterval} {x y : ℝ}
    (hx : I.Contains x)
    (hy : J.Contains y)
    (hlo : K.lo ≤ I.lo + J.lo)
    (hhi : I.hi + J.hi ≤ K.hi) :
    K.Contains (x + y) := by
  rcases hx with ⟨hIxlo, hIxhi⟩
  rcases hy with ⟨hJylo, hJyhi⟩
  constructor
  · calc
      K.lo ≤ I.lo + J.lo := hlo
      _ ≤ x + y := add_le_add hIxlo hJylo
  · calc
      x + y ≤ I.hi + J.hi := add_le_add hIxhi hJyhi
      _ ≤ K.hi := hhi

def neg (I : RealInterval) : RealInterval :=
  { lo := -I.hi, hi := -I.lo }

theorem neg_contains
    {I : RealInterval} {x : ℝ}
    (hx : I.Contains x) :
    I.neg.Contains (-x) := by
  rcases hx with ⟨hlo, hhi⟩
  constructor
  · change -I.hi ≤ -x
    exact neg_le_neg hhi
  · change -x ≤ -I.lo
    exact neg_le_neg hlo

/--
Endpoint condition used by external rectangle arithmetic for multiplication.
The endpoint-to-product theorem is intentionally left to a later, case-split
layer; the consumer below uses a direct functional bound hypothesis.
-/
def MulBoundsValid (I J K : RealInterval) : Prop :=
  K.lo ≤ I.lo * J.lo ∧
  K.lo ≤ I.lo * J.hi ∧
  K.lo ≤ I.hi * J.lo ∧
  K.lo ≤ I.hi * J.hi ∧
  I.lo * J.lo ≤ K.hi ∧
  I.lo * J.hi ≤ K.hi ∧
  I.hi * J.lo ≤ K.hi ∧
  I.hi * J.hi ≤ K.hi

def MulBoundsFunctional (I J K : RealInterval) : Prop :=
  ∀ a : ℝ, I.Contains a →
  ∀ b : ℝ, J.Contains b →
    K.Contains (a * b)

theorem mul_contains_of_functional_bounds
    {I J K : RealInterval} {x y : ℝ}
    (hx : I.Contains x)
    (hy : J.Contains y)
    (hmul : MulBoundsFunctional I J K) :
    K.Contains (x * y) :=
  hmul x hx y hy

end RealInterval

structure ComplexRect where
  re : RealInterval
  im : RealInterval

namespace ComplexRect

def Contains (R : ComplexRect) (z : ℂ) : Prop :=
  R.re.Contains z.re ∧ R.im.Contains z.im

theorem add_contains
    {A B C : ComplexRect} {z w : ℂ}
    (hz : A.Contains z)
    (hw : B.Contains w)
    (hre_lo : C.re.lo ≤ A.re.lo + B.re.lo)
    (hre_hi : A.re.hi + B.re.hi ≤ C.re.hi)
    (him_lo : C.im.lo ≤ A.im.lo + B.im.lo)
    (him_hi : A.im.hi + B.im.hi ≤ C.im.hi) :
    C.Contains (z + w) := by
  constructor
  · simpa [Complex.add_re] using
      RealInterval.add_contains hz.1 hw.1 hre_lo hre_hi
  · simpa [Complex.add_im] using
      RealInterval.add_contains hz.2 hw.2 him_lo him_hi

def conj (R : ComplexRect) : ComplexRect :=
  { re := R.re, im := R.im.neg }

theorem conj_contains
    {R : ComplexRect} {z : ℂ}
    (hz : R.Contains z) :
    R.conj.Contains (starRingEnd ℂ z) := by
  constructor
  · simpa [ComplexRect.conj] using hz.1
  · simpa [ComplexRect.conj] using
      (RealInterval.neg_contains hz.2)

end ComplexRect

theorem complex_mul_conj_re (D M : ℂ) :
    (D * starRingEnd ℂ M).re = D.re * M.re + D.im * M.im := by
  simp [Complex.mul_re]

theorem d0NegReMain_upper_of_rects
    {D M : ℂ}
    {Drect Mrect : ComplexRect}
    {xu yv sum neg : RealInterval}
    {upper : ℝ}
    (_hD : Drect.Contains D)
    (_hM : Mrect.Contains M)
    (_hxu : xu.Contains (D.re * M.re))
    (_hyv : yv.Contains (D.im * M.im))
    (_hsum : sum.Contains (D.re * M.re + D.im * M.im))
    (hneg : neg.Contains (-(D.re * M.re + D.im * M.im)))
    (hupper : neg.hi ≤ upper) :
    -((D * starRingEnd ℂ M).re) ≤ upper := by
  have hneg_hi :
      -(D.re * M.re + D.im * M.im) ≤ neg.hi := hneg.2
  rw [complex_mul_conj_re]
  exact le_trans hneg_hi hupper

structure MainLowerFromRect where
  rect : ComplexRect
  mainLower : ℝ
  valid :
    ∀ M : ℂ, rect.Contains M → mainLower ≤ ‖M‖

structure RestUpperFromRect where
  rect : ComplexRect
  restUpper : ℝ
  valid :
    ∀ R : ℂ, rect.Contains R → ‖R‖ ≤ restUpper

structure ProjectedJ0SubboxRectangleContract
    (M D0 Drest RvecTail : ℂ) where
  Mrect : ComplexRect
  D0rect : ComplexRect
  DrestRect : ComplexRect
  RvecTailRect : ComplexRect
  hM : Mrect.Contains M
  hD0 : D0rect.Contains D0
  hDrest : DrestRect.Contains Drest
  hRvecTail : RvecTailRect.Contains RvecTail

structure ProjectedJ0SubboxDerivedBounds
    {M D0 Drest RvecTail : ℂ}
    (contract : ProjectedJ0SubboxRectangleContract M D0 Drest RvecTail) where
  d0NegReUpper : ℝ
  mainLower : ℝ
  restUpper : ℝ
  hD0Upper :
    -((D0 * starRingEnd ℂ M).re) ≤ d0NegReUpper
  hMainLower :
    mainLower ≤ ‖M‖
  hRestUpper :
    ‖Drest + RvecTail‖ ≤ restUpper

theorem ProjectedJ0SubboxDerivedBounds.d0NegRe_le
    {M D0 Drest RvecTail : ℂ}
    {contract : ProjectedJ0SubboxRectangleContract M D0 Drest RvecTail}
    (bounds : ProjectedJ0SubboxDerivedBounds contract) :
    -((D0 * starRingEnd ℂ M).re) ≤ bounds.d0NegReUpper :=
  bounds.hD0Upper

theorem ProjectedJ0SubboxDerivedBounds.mainLower_le_norm
    {M D0 Drest RvecTail : ℂ}
    {contract : ProjectedJ0SubboxRectangleContract M D0 Drest RvecTail}
    (bounds : ProjectedJ0SubboxDerivedBounds contract) :
    bounds.mainLower ≤ ‖M‖ :=
  bounds.hMainLower

theorem ProjectedJ0SubboxDerivedBounds.rest_norm_le_upper
    {M D0 Drest RvecTail : ℂ}
    {contract : ProjectedJ0SubboxRectangleContract M D0 Drest RvecTail}
    (bounds : ProjectedJ0SubboxDerivedBounds contract) :
    ‖Drest + RvecTail‖ ≤ bounds.restUpper :=
  bounds.hRestUpper

end ProjectedJ0RectangleArithmetic
end C2
