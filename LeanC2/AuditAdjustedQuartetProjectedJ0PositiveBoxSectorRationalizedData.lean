import LeanC2.AuditAdjustedQuartetProjectedJ0SectorRationalizedCertificateSchema

set_option linter.style.longLine false

/-!
# Sector rationalized positive-box data for projected-j0

This file is generated from the sector rationalized positive-box pack.
It checks only rational algebraic budgets and sign side conditions.
It does not prove the analytic enclosure obligations for the functions.
-/

namespace C2
namespace AdjustedQuartetProjectedJ0Aliases

def positiveBoxSector_s0_84_t0_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((12660659409 : ℚ) / 200000000000)
  d0NegReUpper := ((-4167947 : ℚ) / 20000000000)
  restUpper := ((468878597 : ℚ) / 100000000000)

theorem positiveBoxSector_s0_84_t0_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_84_t0_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_84_t0_combined_constants
  ]

theorem positiveBoxSector_s0_84_t0_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_84_t0_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_84_t0_combined_constants
  ]

def positiveBoxSector_s0_84_t0_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_84_t0_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_84_t0_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_84_t0_combined_constants]
  nondestructive := positiveBoxSector_s0_84_t0_combined_nondestructive
  budget_pos := positiveBoxSector_s0_84_t0_combined_budget_pos

def positiveBoxSector_s0_84_t0_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((12660659409 : ℚ) / 200000000000)
  d0NegReUpper := ((-4167947 : ℚ) / 20000000000)
  restUpper := ((4688898631 : ℚ) / 1000000000000)

theorem positiveBoxSector_s0_84_t0_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_84_t0_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_84_t0_separate_constants
  ]

theorem positiveBoxSector_s0_84_t0_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_84_t0_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_84_t0_separate_constants
  ]

def positiveBoxSector_s0_84_t0_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_84_t0_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_84_t0_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_84_t0_separate_constants]
  nondestructive := positiveBoxSector_s0_84_t0_separate_nondestructive
  budget_pos := positiveBoxSector_s0_84_t0_separate_budget_pos

def positiveBoxSector_s0_84_t1_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((50055307 : ℚ) / 800000000)
  d0NegReUpper := ((-49208351 : ℚ) / 200000000000)
  restUpper := ((467853481 : ℚ) / 100000000000)

theorem positiveBoxSector_s0_84_t1_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_84_t1_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_84_t1_combined_constants
  ]

theorem positiveBoxSector_s0_84_t1_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_84_t1_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_84_t1_combined_constants
  ]

def positiveBoxSector_s0_84_t1_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_84_t1_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_84_t1_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_84_t1_combined_constants]
  nondestructive := positiveBoxSector_s0_84_t1_combined_nondestructive
  budget_pos := positiveBoxSector_s0_84_t1_combined_budget_pos

def positiveBoxSector_s0_84_t1_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((50055307 : ℚ) / 800000000)
  d0NegReUpper := ((-49208351 : ℚ) / 200000000000)
  restUpper := ((2340176931 : ℚ) / 500000000000)

theorem positiveBoxSector_s0_84_t1_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_84_t1_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_84_t1_separate_constants
  ]

theorem positiveBoxSector_s0_84_t1_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_84_t1_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_84_t1_separate_constants
  ]

def positiveBoxSector_s0_84_t1_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_84_t1_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_84_t1_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_84_t1_separate_constants]
  nondestructive := positiveBoxSector_s0_84_t1_separate_nondestructive
  budget_pos := positiveBoxSector_s0_84_t1_separate_budget_pos

def positiveBoxSector_s0_84_t2_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((15463389323 : ℚ) / 250000000000)
  d0NegReUpper := ((-141124617 : ℚ) / 500000000000)
  restUpper := ((4664722311 : ℚ) / 1000000000000)

theorem positiveBoxSector_s0_84_t2_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_84_t2_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_84_t2_combined_constants
  ]

theorem positiveBoxSector_s0_84_t2_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_84_t2_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_84_t2_combined_constants
  ]

def positiveBoxSector_s0_84_t2_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_84_t2_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_84_t2_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_84_t2_combined_constants]
  nondestructive := positiveBoxSector_s0_84_t2_combined_nondestructive
  budget_pos := positiveBoxSector_s0_84_t2_combined_budget_pos

def positiveBoxSector_s0_84_t2_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((15463389323 : ℚ) / 250000000000)
  d0NegReUpper := ((-141124617 : ℚ) / 500000000000)
  restUpper := ((2335143367 : ℚ) / 500000000000)

theorem positiveBoxSector_s0_84_t2_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_84_t2_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_84_t2_separate_constants
  ]

theorem positiveBoxSector_s0_84_t2_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_84_t2_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_84_t2_separate_constants
  ]

def positiveBoxSector_s0_84_t2_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_84_t2_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_84_t2_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_84_t2_separate_constants]
  nondestructive := positiveBoxSector_s0_84_t2_separate_nondestructive
  budget_pos := positiveBoxSector_s0_84_t2_separate_budget_pos

def positiveBoxSector_s0_84_t3_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((9785339 : ℚ) / 160000000)
  d0NegReUpper := ((-316917903 : ℚ) / 1000000000000)
  restUpper := ((145228683 : ℚ) / 31250000000)

theorem positiveBoxSector_s0_84_t3_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_84_t3_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_84_t3_combined_constants
  ]

theorem positiveBoxSector_s0_84_t3_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_84_t3_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_84_t3_combined_constants
  ]

def positiveBoxSector_s0_84_t3_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_84_t3_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_84_t3_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_84_t3_combined_constants]
  nondestructive := positiveBoxSector_s0_84_t3_combined_nondestructive
  budget_pos := positiveBoxSector_s0_84_t3_combined_budget_pos

def positiveBoxSector_s0_84_t3_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((9785339 : ℚ) / 160000000)
  d0NegReUpper := ((-316917903 : ℚ) / 1000000000000)
  restUpper := ((931728697 : ℚ) / 200000000000)

theorem positiveBoxSector_s0_84_t3_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_84_t3_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_84_t3_separate_constants
  ]

theorem positiveBoxSector_s0_84_t3_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_84_t3_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_84_t3_separate_constants
  ]

def positiveBoxSector_s0_84_t3_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_84_t3_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_84_t3_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_84_t3_separate_constants]
  nondestructive := positiveBoxSector_s0_84_t3_separate_nondestructive
  budget_pos := positiveBoxSector_s0_84_t3_separate_budget_pos

def positiveBoxSector_s0_84_t4_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((60486073903 : ℚ) / 1000000000000)
  d0NegReUpper := ((-349957397 : ℚ) / 1000000000000)
  restUpper := ((578311217 : ℚ) / 125000000000)

theorem positiveBoxSector_s0_84_t4_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_84_t4_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_84_t4_combined_constants
  ]

theorem positiveBoxSector_s0_84_t4_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_84_t4_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_84_t4_combined_constants
  ]

def positiveBoxSector_s0_84_t4_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_84_t4_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_84_t4_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_84_t4_combined_constants]
  nondestructive := positiveBoxSector_s0_84_t4_combined_nondestructive
  budget_pos := positiveBoxSector_s0_84_t4_combined_budget_pos

def positiveBoxSector_s0_84_t4_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((60486073903 : ℚ) / 1000000000000)
  d0NegReUpper := ((-349957397 : ℚ) / 1000000000000)
  restUpper := ((2322796169 : ℚ) / 500000000000)

theorem positiveBoxSector_s0_84_t4_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_84_t4_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_84_t4_separate_constants
  ]

theorem positiveBoxSector_s0_84_t4_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_84_t4_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_84_t4_separate_constants
  ]

def positiveBoxSector_s0_84_t4_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_84_t4_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_84_t4_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_84_t4_separate_constants]
  nondestructive := positiveBoxSector_s0_84_t4_separate_nondestructive
  budget_pos := positiveBoxSector_s0_84_t4_separate_budget_pos

def positiveBoxSector_s0_84_t5_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((59839033983 : ℚ) / 1000000000000)
  d0NegReUpper := ((-190642103 : ℚ) / 500000000000)
  restUpper := ((115055353 : ℚ) / 25000000000)

theorem positiveBoxSector_s0_84_t5_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_84_t5_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_84_t5_combined_constants
  ]

theorem positiveBoxSector_s0_84_t5_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_84_t5_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_84_t5_combined_constants
  ]

def positiveBoxSector_s0_84_t5_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_84_t5_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_84_t5_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_84_t5_combined_constants]
  nondestructive := positiveBoxSector_s0_84_t5_combined_nondestructive
  budget_pos := positiveBoxSector_s0_84_t5_combined_budget_pos

def positiveBoxSector_s0_84_t5_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((59839033983 : ℚ) / 1000000000000)
  d0NegReUpper := ((-190642103 : ℚ) / 500000000000)
  restUpper := ((115778281 : ℚ) / 25000000000)

theorem positiveBoxSector_s0_84_t5_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_84_t5_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_84_t5_separate_constants
  ]

theorem positiveBoxSector_s0_84_t5_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_84_t5_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_84_t5_separate_constants
  ]

def positiveBoxSector_s0_84_t5_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_84_t5_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_84_t5_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_84_t5_separate_constants]
  nondestructive := positiveBoxSector_s0_84_t5_separate_nondestructive
  budget_pos := positiveBoxSector_s0_84_t5_separate_budget_pos

def positiveBoxSector_s0_84_t6_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((29609609161 : ℚ) / 500000000000)
  d0NegReUpper := ((-410814633 : ℚ) / 1000000000000)
  restUpper := ((2287197939 : ℚ) / 500000000000)

theorem positiveBoxSector_s0_84_t6_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_84_t6_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_84_t6_combined_constants
  ]

theorem positiveBoxSector_s0_84_t6_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_84_t6_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_84_t6_combined_constants
  ]

def positiveBoxSector_s0_84_t6_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_84_t6_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_84_t6_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_84_t6_combined_constants]
  nondestructive := positiveBoxSector_s0_84_t6_combined_nondestructive
  budget_pos := positiveBoxSector_s0_84_t6_combined_budget_pos

def positiveBoxSector_s0_84_t6_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((29609609161 : ℚ) / 500000000000)
  d0NegReUpper := ((-410814633 : ℚ) / 1000000000000)
  restUpper := ((461520663 : ℚ) / 100000000000)

theorem positiveBoxSector_s0_84_t6_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_84_t6_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_84_t6_separate_constants
  ]

theorem positiveBoxSector_s0_84_t6_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_84_t6_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_84_t6_separate_constants
  ]

def positiveBoxSector_s0_84_t6_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_84_t6_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_84_t6_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_84_t6_separate_constants]
  nondestructive := positiveBoxSector_s0_84_t6_separate_nondestructive
  budget_pos := positiveBoxSector_s0_84_t6_separate_budget_pos

def positiveBoxSector_s0_84_t7_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((58629239793 : ℚ) / 1000000000000)
  d0NegReUpper := ((-438467649 : ℚ) / 1000000000000)
  restUpper := ((567899249 : ℚ) / 125000000000)

theorem positiveBoxSector_s0_84_t7_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_84_t7_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_84_t7_combined_constants
  ]

theorem positiveBoxSector_s0_84_t7_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_84_t7_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_84_t7_combined_constants
  ]

def positiveBoxSector_s0_84_t7_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_84_t7_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_84_t7_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_84_t7_combined_constants]
  nondestructive := positiveBoxSector_s0_84_t7_combined_nondestructive
  budget_pos := positiveBoxSector_s0_84_t7_combined_budget_pos

def positiveBoxSector_s0_84_t7_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((58629239793 : ℚ) / 1000000000000)
  d0NegReUpper := ((-438467649 : ℚ) / 1000000000000)
  restUpper := ((4597896309 : ℚ) / 1000000000000)

theorem positiveBoxSector_s0_84_t7_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_84_t7_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_84_t7_separate_constants
  ]

theorem positiveBoxSector_s0_84_t7_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_84_t7_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_84_t7_separate_constants
  ]

def positiveBoxSector_s0_84_t7_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_84_t7_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_84_t7_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_84_t7_separate_constants]
  nondestructive := positiveBoxSector_s0_84_t7_separate_nondestructive
  budget_pos := positiveBoxSector_s0_84_t7_separate_budget_pos

def positiveBoxSector_s0_84_t8_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((30567912527 : ℚ) / 500000000000)
  d0NegReUpper := ((-110191213 : ℚ) / 200000000000)
  restUpper := ((61867683 : ℚ) / 20000000000)

theorem positiveBoxSector_s0_84_t8_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_84_t8_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_84_t8_combined_constants
  ]

theorem positiveBoxSector_s0_84_t8_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_84_t8_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_84_t8_combined_constants
  ]

def positiveBoxSector_s0_84_t8_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_84_t8_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_84_t8_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_84_t8_combined_constants]
  nondestructive := positiveBoxSector_s0_84_t8_combined_nondestructive
  budget_pos := positiveBoxSector_s0_84_t8_combined_budget_pos

def positiveBoxSector_s0_84_t8_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((30567912527 : ℚ) / 500000000000)
  d0NegReUpper := ((-110191213 : ℚ) / 200000000000)
  restUpper := ((1546847551 : ℚ) / 500000000000)

theorem positiveBoxSector_s0_84_t8_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_84_t8_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_84_t8_separate_constants
  ]

theorem positiveBoxSector_s0_84_t8_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_84_t8_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_84_t8_separate_constants
  ]

def positiveBoxSector_s0_84_t8_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_84_t8_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_84_t8_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_84_t8_separate_constants]
  nondestructive := positiveBoxSector_s0_84_t8_separate_nondestructive
  budget_pos := positiveBoxSector_s0_84_t8_separate_budget_pos

def positiveBoxSector_s0_85_t0_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((3196303723 : ℚ) / 50000000000)
  d0NegReUpper := ((-202255911 : ℚ) / 1000000000000)
  restUpper := ((855071817 : ℚ) / 200000000000)

theorem positiveBoxSector_s0_85_t0_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_85_t0_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_85_t0_combined_constants
  ]

theorem positiveBoxSector_s0_85_t0_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_85_t0_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_85_t0_combined_constants
  ]

def positiveBoxSector_s0_85_t0_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_85_t0_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_85_t0_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_85_t0_combined_constants]
  nondestructive := positiveBoxSector_s0_85_t0_combined_nondestructive
  budget_pos := positiveBoxSector_s0_85_t0_combined_budget_pos

def positiveBoxSector_s0_85_t0_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((3196303723 : ℚ) / 50000000000)
  d0NegReUpper := ((-202255911 : ℚ) / 1000000000000)
  restUpper := ((2137715121 : ℚ) / 500000000000)

theorem positiveBoxSector_s0_85_t0_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_85_t0_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_85_t0_separate_constants
  ]

theorem positiveBoxSector_s0_85_t0_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_85_t0_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_85_t0_separate_constants
  ]

def positiveBoxSector_s0_85_t0_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_85_t0_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_85_t0_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_85_t0_separate_constants]
  nondestructive := positiveBoxSector_s0_85_t0_separate_nondestructive
  budget_pos := positiveBoxSector_s0_85_t0_separate_budget_pos

def positiveBoxSector_s0_85_t1_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((7908184789 : ℚ) / 125000000000)
  d0NegReUpper := ((-47200373 : ℚ) / 200000000000)
  restUpper := ((4265984997 : ℚ) / 1000000000000)

theorem positiveBoxSector_s0_85_t1_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_85_t1_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_85_t1_combined_constants
  ]

theorem positiveBoxSector_s0_85_t1_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_85_t1_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_85_t1_combined_constants
  ]

def positiveBoxSector_s0_85_t1_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_85_t1_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_85_t1_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_85_t1_combined_constants]
  nondestructive := positiveBoxSector_s0_85_t1_combined_nondestructive
  budget_pos := positiveBoxSector_s0_85_t1_combined_budget_pos

def positiveBoxSector_s0_85_t1_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((7908184789 : ℚ) / 125000000000)
  d0NegReUpper := ((-47200373 : ℚ) / 200000000000)
  restUpper := ((4267511351 : ℚ) / 1000000000000)

theorem positiveBoxSector_s0_85_t1_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_85_t1_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_85_t1_separate_constants
  ]

theorem positiveBoxSector_s0_85_t1_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_85_t1_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_85_t1_separate_constants
  ]

def positiveBoxSector_s0_85_t1_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_85_t1_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_85_t1_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_85_t1_separate_constants]
  nondestructive := positiveBoxSector_s0_85_t1_separate_nondestructive
  budget_pos := positiveBoxSector_s0_85_t1_separate_budget_pos

def positiveBoxSector_s0_85_t2_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((31311481089 : ℚ) / 500000000000)
  d0NegReUpper := ((-268459131 : ℚ) / 1000000000000)
  restUpper := ((132917333 : ℚ) / 31250000000)

theorem positiveBoxSector_s0_85_t2_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_85_t2_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_85_t2_combined_constants
  ]

theorem positiveBoxSector_s0_85_t2_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_85_t2_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_85_t2_combined_constants
  ]

def positiveBoxSector_s0_85_t2_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_85_t2_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_85_t2_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_85_t2_combined_constants]
  nondestructive := positiveBoxSector_s0_85_t2_combined_nondestructive
  budget_pos := positiveBoxSector_s0_85_t2_combined_budget_pos

def positiveBoxSector_s0_85_t2_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((31311481089 : ℚ) / 500000000000)
  d0NegReUpper := ((-268459131 : ℚ) / 1000000000000)
  restUpper := ((34065607 : ℚ) / 8000000000)

theorem positiveBoxSector_s0_85_t2_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_85_t2_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_85_t2_separate_constants
  ]

theorem positiveBoxSector_s0_85_t2_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_85_t2_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_85_t2_separate_constants
  ]

def positiveBoxSector_s0_85_t2_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_85_t2_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_85_t2_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_85_t2_separate_constants]
  nondestructive := positiveBoxSector_s0_85_t2_separate_nondestructive
  budget_pos := positiveBoxSector_s0_85_t2_separate_budget_pos

def positiveBoxSector_s0_85_t3_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((62000067433 : ℚ) / 1000000000000)
  d0NegReUpper := ((-37442047 : ℚ) / 125000000000)
  restUpper := ((4237438401 : ℚ) / 1000000000000)

theorem positiveBoxSector_s0_85_t3_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_85_t3_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_85_t3_combined_constants
  ]

theorem positiveBoxSector_s0_85_t3_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_85_t3_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_85_t3_combined_constants
  ]

def positiveBoxSector_s0_85_t3_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_85_t3_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_85_t3_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_85_t3_combined_constants]
  nondestructive := positiveBoxSector_s0_85_t3_combined_nondestructive
  budget_pos := positiveBoxSector_s0_85_t3_combined_budget_pos

def positiveBoxSector_s0_85_t3_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((62000067433 : ℚ) / 1000000000000)
  d0NegReUpper := ((-37442047 : ℚ) / 125000000000)
  restUpper := ((4247448143 : ℚ) / 1000000000000)

theorem positiveBoxSector_s0_85_t3_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_85_t3_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_85_t3_separate_constants
  ]

theorem positiveBoxSector_s0_85_t3_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_85_t3_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_85_t3_separate_constants
  ]

def positiveBoxSector_s0_85_t3_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_85_t3_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_85_t3_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_85_t3_separate_constants]
  nondestructive := positiveBoxSector_s0_85_t3_separate_nondestructive
  budget_pos := positiveBoxSector_s0_85_t3_separate_budget_pos

def positiveBoxSector_s0_85_t4_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((61398995541 : ℚ) / 1000000000000)
  d0NegReUpper := ((-329153297 : ℚ) / 1000000000000)
  restUpper := ((4218390063 : ℚ) / 1000000000000)

theorem positiveBoxSector_s0_85_t4_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_85_t4_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_85_t4_combined_constants
  ]

theorem positiveBoxSector_s0_85_t4_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_85_t4_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_85_t4_combined_constants
  ]

def positiveBoxSector_s0_85_t4_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_85_t4_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_85_t4_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_85_t4_combined_constants]
  nondestructive := positiveBoxSector_s0_85_t4_combined_nondestructive
  budget_pos := positiveBoxSector_s0_85_t4_combined_budget_pos

def positiveBoxSector_s0_85_t4_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((61398995541 : ℚ) / 1000000000000)
  d0NegReUpper := ((-329153297 : ℚ) / 1000000000000)
  restUpper := ((1058851709 : ℚ) / 250000000000)

theorem positiveBoxSector_s0_85_t4_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_85_t4_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_85_t4_separate_constants
  ]

theorem positiveBoxSector_s0_85_t4_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_85_t4_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_85_t4_separate_constants
  ]

def positiveBoxSector_s0_85_t4_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_85_t4_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_85_t4_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_85_t4_separate_constants]
  nondestructive := positiveBoxSector_s0_85_t4_separate_nondestructive
  budget_pos := positiveBoxSector_s0_85_t4_separate_budget_pos

def positiveBoxSector_s0_85_t5_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((60821811077 : ℚ) / 1000000000000)
  d0NegReUpper := ((-357235409 : ℚ) / 1000000000000)
  restUpper := ((1049046813 : ℚ) / 250000000000)

theorem positiveBoxSector_s0_85_t5_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_85_t5_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_85_t5_combined_constants
  ]

theorem positiveBoxSector_s0_85_t5_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_85_t5_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_85_t5_combined_constants
  ]

def positiveBoxSector_s0_85_t5_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_85_t5_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_85_t5_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_85_t5_combined_constants]
  nondestructive := positiveBoxSector_s0_85_t5_combined_nondestructive
  budget_pos := positiveBoxSector_s0_85_t5_combined_budget_pos

def positiveBoxSector_s0_85_t5_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((60821811077 : ℚ) / 1000000000000)
  d0NegReUpper := ((-357235409 : ℚ) / 1000000000000)
  restUpper := ((4222074457 : ℚ) / 1000000000000)

theorem positiveBoxSector_s0_85_t5_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_85_t5_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_85_t5_separate_constants
  ]

theorem positiveBoxSector_s0_85_t5_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_85_t5_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_85_t5_separate_constants
  ]

def positiveBoxSector_s0_85_t5_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_85_t5_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_85_t5_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_85_t5_separate_constants]
  nondestructive := positiveBoxSector_s0_85_t5_separate_nondestructive
  budget_pos := positiveBoxSector_s0_85_t5_separate_budget_pos

def positiveBoxSector_s0_85_t6_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((60270203289 : ℚ) / 1000000000000)
  d0NegReUpper := ((-383708109 : ℚ) / 1000000000000)
  restUpper := ((4170739301 : ℚ) / 1000000000000)

theorem positiveBoxSector_s0_85_t6_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_85_t6_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_85_t6_combined_constants
  ]

theorem positiveBoxSector_s0_85_t6_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_85_t6_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_85_t6_combined_constants
  ]

def positiveBoxSector_s0_85_t6_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_85_t6_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_85_t6_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_85_t6_combined_constants]
  nondestructive := positiveBoxSector_s0_85_t6_combined_nondestructive
  budget_pos := positiveBoxSector_s0_85_t6_combined_budget_pos

def positiveBoxSector_s0_85_t6_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((60270203289 : ℚ) / 1000000000000)
  d0NegReUpper := ((-383708109 : ℚ) / 1000000000000)
  restUpper := ((2103699079 : ℚ) / 500000000000)

theorem positiveBoxSector_s0_85_t6_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_85_t6_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_85_t6_separate_constants
  ]

theorem positiveBoxSector_s0_85_t6_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_85_t6_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_85_t6_separate_constants
  ]

def positiveBoxSector_s0_85_t6_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_85_t6_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_85_t6_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_85_t6_separate_constants]
  nondestructive := positiveBoxSector_s0_85_t6_separate_nondestructive
  budget_pos := positiveBoxSector_s0_85_t6_separate_budget_pos

def positiveBoxSector_s0_85_t7_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((14936611507 : ℚ) / 250000000000)
  d0NegReUpper := ((-204249409 : ℚ) / 500000000000)
  restUpper := ((2071096791 : ℚ) / 500000000000)

theorem positiveBoxSector_s0_85_t7_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_85_t7_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_85_t7_combined_constants
  ]

theorem positiveBoxSector_s0_85_t7_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_85_t7_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_85_t7_combined_constants
  ]

def positiveBoxSector_s0_85_t7_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_85_t7_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_85_t7_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_85_t7_combined_constants]
  nondestructive := positiveBoxSector_s0_85_t7_combined_nondestructive
  budget_pos := positiveBoxSector_s0_85_t7_combined_budget_pos

def positiveBoxSector_s0_85_t7_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((14936611507 : ℚ) / 250000000000)
  d0NegReUpper := ((-204249409 : ℚ) / 500000000000)
  restUpper := ((32745721 : ℚ) / 7812500000)

theorem positiveBoxSector_s0_85_t7_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_85_t7_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_85_t7_separate_constants
  ]

theorem positiveBoxSector_s0_85_t7_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_85_t7_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_85_t7_separate_constants
  ]

def positiveBoxSector_s0_85_t7_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_85_t7_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_85_t7_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_85_t7_separate_constants]
  nondestructive := positiveBoxSector_s0_85_t7_separate_nondestructive
  budget_pos := positiveBoxSector_s0_85_t7_separate_budget_pos

def positiveBoxSector_s0_85_t8_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((62118560151 : ℚ) / 1000000000000)
  d0NegReUpper := ((-509513111 : ℚ) / 1000000000000)
  restUpper := ((349586547 : ℚ) / 125000000000)

theorem positiveBoxSector_s0_85_t8_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_85_t8_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_85_t8_combined_constants
  ]

theorem positiveBoxSector_s0_85_t8_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_85_t8_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_85_t8_combined_constants
  ]

def positiveBoxSector_s0_85_t8_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_85_t8_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_85_t8_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_85_t8_combined_constants]
  nondestructive := positiveBoxSector_s0_85_t8_combined_nondestructive
  budget_pos := positiveBoxSector_s0_85_t8_combined_budget_pos

def positiveBoxSector_s0_85_t8_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((62118560151 : ℚ) / 1000000000000)
  d0NegReUpper := ((-509513111 : ℚ) / 1000000000000)
  restUpper := ((2797052167 : ℚ) / 1000000000000)

theorem positiveBoxSector_s0_85_t8_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_85_t8_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_85_t8_separate_constants
  ]

theorem positiveBoxSector_s0_85_t8_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_85_t8_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_85_t8_separate_constants
  ]

def positiveBoxSector_s0_85_t8_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_85_t8_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_85_t8_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_85_t8_separate_constants]
  nondestructive := positiveBoxSector_s0_85_t8_separate_nondestructive
  budget_pos := positiveBoxSector_s0_85_t8_separate_budget_pos

def positiveBoxSector_s0_86_t0_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((64509546961 : ℚ) / 1000000000000)
  d0NegReUpper := ((-193680497 : ℚ) / 1000000000000)
  restUpper := ((975479453 : ℚ) / 250000000000)

theorem positiveBoxSector_s0_86_t0_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_86_t0_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_86_t0_combined_constants
  ]

theorem positiveBoxSector_s0_86_t0_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_86_t0_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_86_t0_combined_constants
  ]

def positiveBoxSector_s0_86_t0_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_86_t0_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_86_t0_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_86_t0_combined_constants]
  nondestructive := positiveBoxSector_s0_86_t0_combined_nondestructive
  budget_pos := positiveBoxSector_s0_86_t0_combined_budget_pos

def positiveBoxSector_s0_86_t0_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((64509546961 : ℚ) / 1000000000000)
  d0NegReUpper := ((-193680497 : ℚ) / 1000000000000)
  restUpper := ((780391747 : ℚ) / 200000000000)

theorem positiveBoxSector_s0_86_t0_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_86_t0_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_86_t0_separate_constants
  ]

theorem positiveBoxSector_s0_86_t0_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_86_t0_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_86_t0_separate_constants
  ]

def positiveBoxSector_s0_86_t0_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_86_t0_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_86_t0_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_86_t0_separate_constants]
  nondestructive := positiveBoxSector_s0_86_t0_separate_nondestructive
  budget_pos := positiveBoxSector_s0_86_t0_separate_budget_pos

def positiveBoxSector_s0_86_t1_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((63914836093 : ℚ) / 1000000000000)
  d0NegReUpper := ((-8956913 : ℚ) / 40000000000)
  restUpper := ((77866821 : ℚ) / 20000000000)

theorem positiveBoxSector_s0_86_t1_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_86_t1_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_86_t1_combined_constants
  ]

theorem positiveBoxSector_s0_86_t1_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_86_t1_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_86_t1_combined_constants
  ]

def positiveBoxSector_s0_86_t1_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_86_t1_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_86_t1_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_86_t1_combined_constants]
  nondestructive := positiveBoxSector_s0_86_t1_combined_nondestructive
  budget_pos := positiveBoxSector_s0_86_t1_combined_budget_pos

def positiveBoxSector_s0_86_t1_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((63914836093 : ℚ) / 1000000000000)
  d0NegReUpper := ((-8956913 : ℚ) / 40000000000)
  restUpper := ((973653499 : ℚ) / 250000000000)

theorem positiveBoxSector_s0_86_t1_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_86_t1_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_86_t1_separate_constants
  ]

theorem positiveBoxSector_s0_86_t1_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_86_t1_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_86_t1_separate_constants
  ]

def positiveBoxSector_s0_86_t1_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_86_t1_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_86_t1_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_86_t1_separate_constants]
  nondestructive := positiveBoxSector_s0_86_t1_separate_nondestructive
  budget_pos := positiveBoxSector_s0_86_t1_separate_budget_pos

def positiveBoxSector_s0_86_t2_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((63337541827 : ℚ) / 1000000000000)
  d0NegReUpper := ((-126505071 : ℚ) / 500000000000)
  restUpper := ((1940893763 : ℚ) / 500000000000)

theorem positiveBoxSector_s0_86_t2_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_86_t2_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_86_t2_combined_constants
  ]

theorem positiveBoxSector_s0_86_t2_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_86_t2_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_86_t2_combined_constants
  ]

def positiveBoxSector_s0_86_t2_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_86_t2_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_86_t2_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_86_t2_combined_constants]
  nondestructive := positiveBoxSector_s0_86_t2_combined_nondestructive
  budget_pos := positiveBoxSector_s0_86_t2_combined_budget_pos

def positiveBoxSector_s0_86_t2_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((63337541827 : ℚ) / 1000000000000)
  d0NegReUpper := ((-126505071 : ℚ) / 500000000000)
  restUpper := ((971499137 : ℚ) / 250000000000)

theorem positiveBoxSector_s0_86_t2_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_86_t2_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_86_t2_separate_constants
  ]

theorem positiveBoxSector_s0_86_t2_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_86_t2_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_86_t2_separate_constants
  ]

def positiveBoxSector_s0_86_t2_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_86_t2_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_86_t2_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_86_t2_separate_constants]
  nondestructive := positiveBoxSector_s0_86_t2_separate_nondestructive
  budget_pos := positiveBoxSector_s0_86_t2_separate_budget_pos

def positiveBoxSector_s0_86_t3_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((62778994191 : ℚ) / 1000000000000)
  d0NegReUpper := ((-280860557 : ℚ) / 1000000000000)
  restUpper := ((3867228627 : ℚ) / 1000000000000)

theorem positiveBoxSector_s0_86_t3_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_86_t3_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_86_t3_combined_constants
  ]

theorem positiveBoxSector_s0_86_t3_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_86_t3_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_86_t3_combined_constants
  ]

def positiveBoxSector_s0_86_t3_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_86_t3_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_86_t3_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_86_t3_combined_constants]
  nondestructive := positiveBoxSector_s0_86_t3_combined_nondestructive
  budget_pos := positiveBoxSector_s0_86_t3_combined_budget_pos

def positiveBoxSector_s0_86_t3_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((62778994191 : ℚ) / 1000000000000)
  d0NegReUpper := ((-280860557 : ℚ) / 1000000000000)
  restUpper := ((3876058721 : ℚ) / 1000000000000)

theorem positiveBoxSector_s0_86_t3_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_86_t3_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_86_t3_separate_constants
  ]

theorem positiveBoxSector_s0_86_t3_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_86_t3_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_86_t3_separate_constants
  ]

def positiveBoxSector_s0_86_t3_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_86_t3_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_86_t3_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_86_t3_separate_constants]
  nondestructive := positiveBoxSector_s0_86_t3_separate_nondestructive
  budget_pos := positiveBoxSector_s0_86_t3_separate_budget_pos

def positiveBoxSector_s0_86_t4_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((62241140357 : ℚ) / 1000000000000)
  d0NegReUpper := ((-307402799 : ℚ) / 1000000000000)
  restUpper := ((3849804851 : ℚ) / 1000000000000)

theorem positiveBoxSector_s0_86_t4_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_86_t4_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_86_t4_combined_constants
  ]

theorem positiveBoxSector_s0_86_t4_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_86_t4_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_86_t4_combined_constants
  ]

def positiveBoxSector_s0_86_t4_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_86_t4_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_86_t4_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_86_t4_combined_constants]
  nondestructive := positiveBoxSector_s0_86_t4_combined_nondestructive
  budget_pos := positiveBoxSector_s0_86_t4_combined_budget_pos

def positiveBoxSector_s0_86_t4_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((62241140357 : ℚ) / 1000000000000)
  d0NegReUpper := ((-307402799 : ℚ) / 1000000000000)
  restUpper := ((966235191 : ℚ) / 250000000000)

theorem positiveBoxSector_s0_86_t4_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_86_t4_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_86_t4_separate_constants
  ]

theorem positiveBoxSector_s0_86_t4_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_86_t4_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_86_t4_separate_constants
  ]

def positiveBoxSector_s0_86_t4_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_86_t4_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_86_t4_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_86_t4_separate_constants]
  nondestructive := positiveBoxSector_s0_86_t4_separate_nondestructive
  budget_pos := positiveBoxSector_s0_86_t4_separate_budget_pos

def positiveBoxSector_s0_86_t5_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((7715721237 : ℚ) / 125000000000)
  d0NegReUpper := ((-332570489 : ℚ) / 1000000000000)
  restUpper := ((239343451 : ℚ) / 62500000000)

theorem positiveBoxSector_s0_86_t5_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_86_t5_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_86_t5_combined_constants
  ]

theorem positiveBoxSector_s0_86_t5_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_86_t5_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_86_t5_combined_constants
  ]

def positiveBoxSector_s0_86_t5_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_86_t5_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_86_t5_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_86_t5_combined_constants]
  nondestructive := positiveBoxSector_s0_86_t5_combined_nondestructive
  budget_pos := positiveBoxSector_s0_86_t5_combined_budget_pos

def positiveBoxSector_s0_86_t5_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((7715721237 : ℚ) / 125000000000)
  d0NegReUpper := ((-332570489 : ℚ) / 1000000000000)
  restUpper := ((3852639817 : ℚ) / 1000000000000)

theorem positiveBoxSector_s0_86_t5_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_86_t5_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_86_t5_separate_constants
  ]

theorem positiveBoxSector_s0_86_t5_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_86_t5_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_86_t5_separate_constants
  ]

def positiveBoxSector_s0_86_t5_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_86_t5_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_86_t5_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_86_t5_separate_constants]
  nondestructive := positiveBoxSector_s0_86_t5_separate_nondestructive
  budget_pos := positiveBoxSector_s0_86_t5_separate_budget_pos

def positiveBoxSector_s0_86_t6_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((765429037 : ℚ) / 12500000000)
  d0NegReUpper := ((-356297059 : ℚ) / 1000000000000)
  restUpper := ((475776903 : ℚ) / 125000000000)

theorem positiveBoxSector_s0_86_t6_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_86_t6_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_86_t6_combined_constants
  ]

theorem positiveBoxSector_s0_86_t6_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_86_t6_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_86_t6_combined_constants
  ]

def positiveBoxSector_s0_86_t6_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_86_t6_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_86_t6_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_86_t6_combined_constants]
  nondestructive := positiveBoxSector_s0_86_t6_combined_nondestructive
  budget_pos := positiveBoxSector_s0_86_t6_combined_budget_pos

def positiveBoxSector_s0_86_t6_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((765429037 : ℚ) / 12500000000)
  d0NegReUpper := ((-356297059 : ℚ) / 1000000000000)
  restUpper := ((3839105811 : ℚ) / 1000000000000)

theorem positiveBoxSector_s0_86_t6_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_86_t6_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_86_t6_separate_constants
  ]

theorem positiveBoxSector_s0_86_t6_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_86_t6_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_86_t6_separate_constants
  ]

def positiveBoxSector_s0_86_t6_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_86_t6_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_86_t6_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_86_t6_separate_constants]
  nondestructive := positiveBoxSector_s0_86_t6_separate_nondestructive
  budget_pos := positiveBoxSector_s0_86_t6_separate_budget_pos

def positiveBoxSector_s0_86_t7_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((60768794051 : ℚ) / 1000000000000)
  d0NegReUpper := ((-94629357 : ℚ) / 250000000000)
  restUpper := ((1890050351 : ℚ) / 500000000000)

theorem positiveBoxSector_s0_86_t7_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_86_t7_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_86_t7_combined_constants
  ]

theorem positiveBoxSector_s0_86_t7_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_86_t7_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_86_t7_combined_constants
  ]

def positiveBoxSector_s0_86_t7_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_86_t7_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_86_t7_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_86_t7_combined_constants]
  nondestructive := positiveBoxSector_s0_86_t7_combined_nondestructive
  budget_pos := positiveBoxSector_s0_86_t7_combined_budget_pos

def positiveBoxSector_s0_86_t7_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((60768794051 : ℚ) / 1000000000000)
  d0NegReUpper := ((-94629357 : ℚ) / 250000000000)
  restUpper := ((3824408953 : ℚ) / 1000000000000)

theorem positiveBoxSector_s0_86_t7_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_86_t7_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_86_t7_separate_constants
  ]

theorem positiveBoxSector_s0_86_t7_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_86_t7_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_86_t7_separate_constants
  ]

def positiveBoxSector_s0_86_t7_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_86_t7_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_86_t7_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_86_t7_separate_constants]
  nondestructive := positiveBoxSector_s0_86_t7_separate_nondestructive
  budget_pos := positiveBoxSector_s0_86_t7_separate_budget_pos

def positiveBoxSector_s0_86_t8_combined_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((31504180963 : ℚ) / 500000000000)
  d0NegReUpper := ((-469374089 : ℚ) / 1000000000000)
  restUpper := ((2530741837 : ℚ) / 1000000000000)

theorem positiveBoxSector_s0_86_t8_combined_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_86_t8_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_86_t8_combined_constants
  ]

theorem positiveBoxSector_s0_86_t8_combined_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_86_t8_combined_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_86_t8_combined_constants
  ]

def positiveBoxSector_s0_86_t8_combined_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_86_t8_combined_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_86_t8_combined_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_86_t8_combined_constants]
  nondestructive := positiveBoxSector_s0_86_t8_combined_nondestructive
  budget_pos := positiveBoxSector_s0_86_t8_combined_budget_pos

def positiveBoxSector_s0_86_t8_separate_constants : ProjectedJ0SectorRationalizedBoxConstants where
  mainLower := ((31504180963 : ℚ) / 500000000000)
  d0NegReUpper := ((-469374089 : ℚ) / 1000000000000)
  restUpper := ((506229237 : ℚ) / 200000000000)

theorem positiveBoxSector_s0_86_t8_separate_budget_pos :
    ProjectedJ0SectorRationalizedBudgetPositive positiveBoxSector_s0_86_t8_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedBudgetPositive,
    ProjectedJ0SectorRationalizedBudgetValue,
    positiveBoxSector_s0_86_t8_separate_constants
  ]

theorem positiveBoxSector_s0_86_t8_separate_nondestructive :
    ProjectedJ0SectorRationalizedNonDestructive positiveBoxSector_s0_86_t8_separate_constants := by
  norm_num [
    ProjectedJ0SectorRationalizedNonDestructive,
    positiveBoxSector_s0_86_t8_separate_constants
  ]

def positiveBoxSector_s0_86_t8_separate_certificate : ProjectedJ0SectorRationalizedBoxCertificate where
  constants := positiveBoxSector_s0_86_t8_separate_constants
  main_pos := by
    norm_num [positiveBoxSector_s0_86_t8_separate_constants]
  rest_nonneg := by
    norm_num [positiveBoxSector_s0_86_t8_separate_constants]
  nondestructive := positiveBoxSector_s0_86_t8_separate_nondestructive
  budget_pos := positiveBoxSector_s0_86_t8_separate_budget_pos

def positiveBoxSectorCombinedRationalizedCertificates :
    List ProjectedJ0SectorRationalizedBoxCertificate :=
  [
    positiveBoxSector_s0_84_t0_combined_certificate,
    positiveBoxSector_s0_84_t1_combined_certificate,
    positiveBoxSector_s0_84_t2_combined_certificate,
    positiveBoxSector_s0_84_t3_combined_certificate,
    positiveBoxSector_s0_84_t4_combined_certificate,
    positiveBoxSector_s0_84_t5_combined_certificate,
    positiveBoxSector_s0_84_t6_combined_certificate,
    positiveBoxSector_s0_84_t7_combined_certificate,
    positiveBoxSector_s0_84_t8_combined_certificate,
    positiveBoxSector_s0_85_t0_combined_certificate,
    positiveBoxSector_s0_85_t1_combined_certificate,
    positiveBoxSector_s0_85_t2_combined_certificate,
    positiveBoxSector_s0_85_t3_combined_certificate,
    positiveBoxSector_s0_85_t4_combined_certificate,
    positiveBoxSector_s0_85_t5_combined_certificate,
    positiveBoxSector_s0_85_t6_combined_certificate,
    positiveBoxSector_s0_85_t7_combined_certificate,
    positiveBoxSector_s0_85_t8_combined_certificate,
    positiveBoxSector_s0_86_t0_combined_certificate,
    positiveBoxSector_s0_86_t1_combined_certificate,
    positiveBoxSector_s0_86_t2_combined_certificate,
    positiveBoxSector_s0_86_t3_combined_certificate,
    positiveBoxSector_s0_86_t4_combined_certificate,
    positiveBoxSector_s0_86_t5_combined_certificate,
    positiveBoxSector_s0_86_t6_combined_certificate,
    positiveBoxSector_s0_86_t7_combined_certificate,
    positiveBoxSector_s0_86_t8_combined_certificate,
  ]

def positiveBoxSectorSeparateRationalizedCertificates :
    List ProjectedJ0SectorRationalizedBoxCertificate :=
  [
    positiveBoxSector_s0_84_t0_separate_certificate,
    positiveBoxSector_s0_84_t1_separate_certificate,
    positiveBoxSector_s0_84_t2_separate_certificate,
    positiveBoxSector_s0_84_t3_separate_certificate,
    positiveBoxSector_s0_84_t4_separate_certificate,
    positiveBoxSector_s0_84_t5_separate_certificate,
    positiveBoxSector_s0_84_t6_separate_certificate,
    positiveBoxSector_s0_84_t7_separate_certificate,
    positiveBoxSector_s0_84_t8_separate_certificate,
    positiveBoxSector_s0_85_t0_separate_certificate,
    positiveBoxSector_s0_85_t1_separate_certificate,
    positiveBoxSector_s0_85_t2_separate_certificate,
    positiveBoxSector_s0_85_t3_separate_certificate,
    positiveBoxSector_s0_85_t4_separate_certificate,
    positiveBoxSector_s0_85_t5_separate_certificate,
    positiveBoxSector_s0_85_t6_separate_certificate,
    positiveBoxSector_s0_85_t7_separate_certificate,
    positiveBoxSector_s0_85_t8_separate_certificate,
    positiveBoxSector_s0_86_t0_separate_certificate,
    positiveBoxSector_s0_86_t1_separate_certificate,
    positiveBoxSector_s0_86_t2_separate_certificate,
    positiveBoxSector_s0_86_t3_separate_certificate,
    positiveBoxSector_s0_86_t4_separate_certificate,
    positiveBoxSector_s0_86_t5_separate_certificate,
    positiveBoxSector_s0_86_t6_separate_certificate,
    positiveBoxSector_s0_86_t7_separate_certificate,
    positiveBoxSector_s0_86_t8_separate_certificate,
  ]

def positiveBoxSectorCombinedCertificateCount : Nat := 27

def positiveBoxSectorSeparateCertificateCount : Nat := 27

theorem positiveBoxSectorCombinedCertificates_length :
    positiveBoxSectorCombinedRationalizedCertificates.length =
      positiveBoxSectorCombinedCertificateCount := by
  norm_num [
    positiveBoxSectorCombinedCertificateCount,
    positiveBoxSectorCombinedRationalizedCertificates]

theorem positiveBoxSectorSeparateCertificates_length :
    positiveBoxSectorSeparateRationalizedCertificates.length =
      positiveBoxSectorSeparateCertificateCount := by
  norm_num [
    positiveBoxSectorSeparateCertificateCount,
    positiveBoxSectorSeparateRationalizedCertificates]

end AdjustedQuartetProjectedJ0Aliases
end C2
