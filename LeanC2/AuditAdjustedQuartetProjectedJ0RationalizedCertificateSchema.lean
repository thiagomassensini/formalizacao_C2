import LeanC2.AuditAdjustedQuartetProjectedJ0ExternalManifest

/-!
# Rationalized external certificate schema for projected-j0 boxes

This file records the shape of rationalized constants produced by an external
pack processor.  It does not contain the concrete box data and does not prove
the analytic enclosure obligations.
-/

namespace C2
namespace AdjustedQuartetProjectedJ0Aliases

/-- Rational constants for one projected-j0 box and one chosen rest mode. -/
structure ProjectedJ0RationalizedBoxConstants where
  mainLower : ℚ
  numeratorUpper : ℚ
  restUpper : ℚ

/-- Algebraic budget value for rationalized constants. -/
def ProjectedJ0RationalizedBudgetValue
    (box : ProjectedJ0RationalizedBoxConstants) : ℚ :=
  box.mainLower - box.numeratorUpper / box.mainLower - box.restUpper

/-- Algebraic budget positivity for rationalized constants. -/
def ProjectedJ0RationalizedBudgetPositive
    (box : ProjectedJ0RationalizedBoxConstants) : Prop :=
  0 < ProjectedJ0RationalizedBudgetValue box

/--
Rationalized certificate payload for one box.

This proves only algebraic side conditions about the rounded constants.  The
analytic facts connecting the constants to the functions remain external.
-/
structure ProjectedJ0RationalizedBoxCertificate where
  constants : ProjectedJ0RationalizedBoxConstants
  main_pos :
    0 < constants.mainLower
  numerator_nonneg :
    0 ≤ constants.numeratorUpper
  rest_nonneg :
    0 ≤ constants.restUpper
  budget_pos :
    ProjectedJ0RationalizedBudgetPositive constants

end AdjustedQuartetProjectedJ0Aliases
end C2
