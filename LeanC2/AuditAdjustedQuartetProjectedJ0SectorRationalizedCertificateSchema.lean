import LeanC2.AuditAdjustedQuartetProjectedJ0SectorUpper

/-!
# Rationalized sector certificate schema for projected-j0 boxes

This file records the shape of rationalized sector constants produced by an
external pack processor.  It does not contain concrete box data and does not
prove analytic enclosure obligations.
-/

namespace C2
namespace AdjustedQuartetProjectedJ0Aliases

/-- Rational constants for one sector box and one chosen rest mode. -/
structure ProjectedJ0SectorRationalizedBoxConstants where
  mainLower : ℚ
  d0NegReUpper : ℚ
  restUpper : ℚ

/-- Algebraic sector budget value for rationalized constants. -/
def ProjectedJ0SectorRationalizedBudgetValue
    (box : ProjectedJ0SectorRationalizedBoxConstants) : ℚ :=
  box.mainLower - box.restUpper

/-- Algebraic sector budget positivity for rationalized constants. -/
def ProjectedJ0SectorRationalizedBudgetPositive
    (box : ProjectedJ0SectorRationalizedBoxConstants) : Prop :=
  0 < ProjectedJ0SectorRationalizedBudgetValue box

/-- Rational non-destructive sector condition. -/
def ProjectedJ0SectorRationalizedNonDestructive
    (box : ProjectedJ0SectorRationalizedBoxConstants) : Prop :=
  box.d0NegReUpper ≤ 0

/--
Rationalized sector certificate payload for one box.

This proves only algebraic side conditions about rounded constants.  The
analytic facts connecting the constants to the functions remain external.
-/
structure ProjectedJ0SectorRationalizedBoxCertificate where
  constants : ProjectedJ0SectorRationalizedBoxConstants
  main_pos :
    0 < constants.mainLower
  rest_nonneg :
    0 ≤ constants.restUpper
  nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive constants
  budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive constants

end AdjustedQuartetProjectedJ0Aliases
end C2
