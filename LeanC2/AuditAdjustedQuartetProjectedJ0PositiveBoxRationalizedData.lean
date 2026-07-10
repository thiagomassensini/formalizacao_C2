import LeanC2.AuditAdjustedQuartetProjectedJ0RationalizedCertificateSchema

/-!
# Rationalized positive-box data for projected-j0

This file is generated from the rationalized positive-box pack.  It
checks only rational algebraic budgets and sign side conditions.  It
does not prove the analytic enclosure obligations for the functions.
-/

namespace C2
namespace AdjustedQuartetProjectedJ0Aliases

def positiveBox_s0_84_t0_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((55948109141 : ℚ) / 1000000000000)
  numeratorUpper := ((49323311 : ℚ) / 1000000000000)
  restUpper := ((956474701 : ℚ) / 100000000000)

def positiveBox_s0_84_t0_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_84_t0_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_84_t0_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_84_t0_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_84_t0_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_84_t0_combined_constants
    ]

def positiveBox_s0_84_t0_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((55948109141 : ℚ) / 1000000000000)
  numeratorUpper := ((49323311 : ℚ) / 1000000000000)
  restUpper := ((1913932859 : ℚ) / 200000000000)

def positiveBox_s0_84_t0_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_84_t0_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_84_t0_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_84_t0_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_84_t0_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_84_t0_separate_constants
    ]

def positiveBox_s0_84_t1_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((55214852713 : ℚ) / 1000000000000)
  numeratorUpper := ((2715979 : ℚ) / 250000000000)
  restUpper := ((9538753597 : ℚ) / 1000000000000)

def positiveBox_s0_84_t1_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_84_t1_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_84_t1_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_84_t1_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_84_t1_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_84_t1_combined_constants
    ]

def positiveBox_s0_84_t1_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((55214852713 : ℚ) / 1000000000000)
  numeratorUpper := ((2715979 : ℚ) / 250000000000)
  restUpper := ((9549648951 : ℚ) / 1000000000000)

def positiveBox_s0_84_t1_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_84_t1_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_84_t1_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_84_t1_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_84_t1_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_84_t1_separate_constants
    ]

def positiveBox_s0_84_t2_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((6812382729 : ℚ) / 125000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((475295773 : ℚ) / 50000000000)

def positiveBox_s0_84_t2_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_84_t2_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_84_t2_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_84_t2_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_84_t2_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_84_t2_combined_constants
    ]

def positiveBox_s0_84_t2_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((6812382729 : ℚ) / 125000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((952507511 : ℚ) / 100000000000)

def positiveBox_s0_84_t2_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_84_t2_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_84_t2_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_84_t2_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_84_t2_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_84_t2_separate_constants
    ]

def positiveBox_s0_84_t3_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((10760172889 : ℚ) / 200000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((9466110069 : ℚ) / 1000000000000)

def positiveBox_s0_84_t3_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_84_t3_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_84_t3_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_84_t3_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_84_t3_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_84_t3_combined_constants
    ]

def positiveBox_s0_84_t3_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((10760172889 : ℚ) / 200000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((9495764741 : ℚ) / 1000000000000)

def positiveBox_s0_84_t3_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_84_t3_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_84_t3_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_84_t3_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_84_t3_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_84_t3_separate_constants
    ]

def positiveBox_s0_84_t4_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((53123162603 : ℚ) / 1000000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((9419938493 : ℚ) / 1000000000000)

def positiveBox_s0_84_t4_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_84_t4_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_84_t4_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_84_t4_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_84_t4_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_84_t4_combined_constants
    ]

def positiveBox_s0_84_t4_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((53123162603 : ℚ) / 1000000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((1182789839 : ℚ) / 125000000000)

def positiveBox_s0_84_t4_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_84_t4_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_84_t4_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_84_t4_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_84_t4_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_84_t4_separate_constants
    ]

def positiveBox_s0_84_t5_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((10493632927 : ℚ) / 200000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((9367361903 : ℚ) / 1000000000000)

def positiveBox_s0_84_t5_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_84_t5_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_84_t5_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_84_t5_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_84_t5_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_84_t5_combined_constants
    ]

def positiveBox_s0_84_t5_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((10493632927 : ℚ) / 200000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((2356188459 : ℚ) / 250000000000)

def positiveBox_s0_84_t5_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_84_t5_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_84_t5_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_84_t5_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_84_t5_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_84_t5_separate_constants
    ]

def positiveBox_s0_84_t6_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((12959079549 : ℚ) / 250000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((930803759 : ℚ) / 100000000000)

def positiveBox_s0_84_t6_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_84_t6_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_84_t6_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_84_t6_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_84_t6_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_84_t6_combined_constants
    ]

def positiveBox_s0_84_t6_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((12959079549 : ℚ) / 250000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((9382794529 : ℚ) / 1000000000000)

def positiveBox_s0_84_t6_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_84_t6_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_84_t6_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_84_t6_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_84_t6_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_84_t6_separate_constants
    ]

def positiveBox_s0_84_t7_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((51230417689 : ℚ) / 1000000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((9242234469 : ℚ) / 1000000000000)

def positiveBox_s0_84_t7_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_84_t7_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_84_t7_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_84_t7_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_84_t7_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_84_t7_combined_constants
    ]

def positiveBox_s0_84_t7_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((51230417689 : ℚ) / 1000000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((9336474601 : ℚ) / 1000000000000)

def positiveBox_s0_84_t7_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_84_t7_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_84_t7_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_84_t7_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_84_t7_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_84_t7_separate_constants
    ]

def positiveBox_s0_84_t8_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((477623621 : ℚ) / 7812500000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((3093384931 : ℚ) / 1000000000000)

def positiveBox_s0_84_t8_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_84_t8_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_84_t8_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_84_t8_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_84_t8_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_84_t8_combined_constants
    ]

def positiveBox_s0_84_t8_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((477623621 : ℚ) / 7812500000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((618739179 : ℚ) / 200000000000)

def positiveBox_s0_84_t8_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_84_t8_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_84_t8_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_84_t8_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_84_t8_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_84_t8_separate_constants
    ]

def positiveBox_s0_85_t0_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((11409389359 : ℚ) / 200000000000)
  numeratorUpper := ((20642639 : ℚ) / 1000000000000)
  restUpper := ((4398080117 : ℚ) / 500000000000)

def positiveBox_s0_85_t0_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_85_t0_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_85_t0_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_85_t0_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_85_t0_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_85_t0_combined_constants
    ]

def positiveBox_s0_85_t0_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((11409389359 : ℚ) / 200000000000)
  numeratorUpper := ((20642639 : ℚ) / 1000000000000)
  restUpper := ((550030327 : ℚ) / 62500000000)

def positiveBox_s0_85_t0_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_85_t0_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_85_t0_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_85_t0_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_85_t0_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_85_t0_separate_constants
    ]

def positiveBox_s0_85_t1_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((56381958691 : ℚ) / 1000000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((438623643 : ℚ) / 50000000000)

def positiveBox_s0_85_t1_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_85_t1_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_85_t1_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_85_t1_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_85_t1_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_85_t1_combined_constants
    ]

def positiveBox_s0_85_t1_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((56381958691 : ℚ) / 1000000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((8782120871 : ℚ) / 1000000000000)

def positiveBox_s0_85_t1_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_85_t1_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_85_t1_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_85_t1_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_85_t1_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_85_t1_separate_constants
    ]

def positiveBox_s0_85_t2_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((55733281347 : ℚ) / 1000000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((8742589849 : ℚ) / 1000000000000)

def positiveBox_s0_85_t2_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_85_t2_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_85_t2_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_85_t2_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_85_t2_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_85_t2_combined_constants
    ]

def positiveBox_s0_85_t2_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((55733281347 : ℚ) / 1000000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((8759612559 : ℚ) / 1000000000000)

def positiveBox_s0_85_t2_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_85_t2_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_85_t2_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_85_t2_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_85_t2_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_85_t2_separate_constants
    ]

def positiveBox_s0_85_t3_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((55100999351 : ℚ) / 1000000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((4353196973 : ℚ) / 500000000000)

def positiveBox_s0_85_t3_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_85_t3_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_85_t3_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_85_t3_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_85_t3_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_85_t3_combined_constants
    ]

def positiveBox_s0_85_t3_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((55100999351 : ℚ) / 1000000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((87327919 : ℚ) / 10000000000)

def positiveBox_s0_85_t3_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_85_t3_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_85_t3_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_85_t3_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_85_t3_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_85_t3_separate_constants
    ]

def positiveBox_s0_85_t4_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((54487788983 : ℚ) / 1000000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((866443007 : ℚ) / 100000000000)

def positiveBox_s0_85_t4_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_85_t4_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_85_t4_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_85_t4_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_85_t4_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_85_t4_combined_constants
    ]

def positiveBox_s0_85_t4_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((54487788983 : ℚ) / 1000000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((8702202229 : ℚ) / 1000000000000)

def positiveBox_s0_85_t4_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_85_t4_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_85_t4_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_85_t4_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_85_t4_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_85_t4_separate_constants
    ]

def positiveBox_s0_85_t5_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((6736958519 : ℚ) / 125000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((1077083821 : ℚ) / 125000000000)

def positiveBox_s0_85_t5_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_85_t5_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_85_t5_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_85_t5_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_85_t5_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_85_t5_combined_constants
    ]

def positiveBox_s0_85_t5_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((6736958519 : ℚ) / 125000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((8667865827 : ℚ) / 1000000000000)

def positiveBox_s0_85_t5_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_85_t5_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_85_t5_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_85_t5_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_85_t5_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_85_t5_separate_constants
    ]

def positiveBox_s0_85_t6_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((53325000457 : ℚ) / 1000000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((8562799157 : ℚ) / 1000000000000)

def positiveBox_s0_85_t6_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_85_t6_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_85_t6_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_85_t6_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_85_t6_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_85_t6_combined_constants
    ]

def positiveBox_s0_85_t6_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((53325000457 : ℚ) / 1000000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((8629525857 : ℚ) / 1000000000000)

def positiveBox_s0_85_t6_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_85_t6_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_85_t6_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_85_t6_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_85_t6_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_85_t6_separate_constants
    ]

def positiveBox_s0_85_t7_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((13194590339 : ℚ) / 250000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((212576559 : ℚ) / 25000000000)

def positiveBox_s0_85_t7_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_85_t7_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_85_t7_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_85_t7_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_85_t7_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_85_t7_combined_constants
    ]

def positiveBox_s0_85_t7_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((13194590339 : ℚ) / 250000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((4293607489 : ℚ) / 500000000000)

def positiveBox_s0_85_t7_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_85_t7_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_85_t7_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_85_t7_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_85_t7_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_85_t7_separate_constants
    ]

def positiveBox_s0_85_t8_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((62118558673 : ℚ) / 1000000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((174793319 : ℚ) / 62500000000)

def positiveBox_s0_85_t8_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_85_t8_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_85_t8_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_85_t8_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_85_t8_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_85_t8_combined_constants
    ]

def positiveBox_s0_85_t8_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((62118558673 : ℚ) / 1000000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((2797052907 : ℚ) / 1000000000000)

def positiveBox_s0_85_t8_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_85_t8_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_85_t8_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_85_t8_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_85_t8_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_85_t8_separate_constants
    ]

def positiveBox_s0_86_t0_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((3627301707 : ℚ) / 62500000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((4047819801 : ℚ) / 500000000000)

def positiveBox_s0_86_t0_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_86_t0_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_86_t0_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_86_t0_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_86_t0_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_86_t0_combined_constants
    ]

def positiveBox_s0_86_t0_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((3627301707 : ℚ) / 62500000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((2024859489 : ℚ) / 250000000000)

def positiveBox_s0_86_t0_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_86_t0_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_86_t0_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_86_t0_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_86_t0_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_86_t0_separate_constants
    ]

def positiveBox_s0_86_t1_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((28717060403 : ℚ) / 500000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((1614808489 : ℚ) / 200000000000)

def positiveBox_s0_86_t1_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_86_t1_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_86_t1_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_86_t1_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_86_t1_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_86_t1_combined_constants
    ]

def positiveBox_s0_86_t1_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((28717060403 : ℚ) / 500000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((1010321949 : ℚ) / 125000000000)

def positiveBox_s0_86_t1_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_86_t1_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_86_t1_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_86_t1_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_86_t1_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_86_t1_separate_constants
    ]

def positiveBox_s0_86_t2_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((3552916097 : ℚ) / 62500000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((2011708961 : ℚ) / 250000000000)

def positiveBox_s0_86_t2_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_86_t2_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_86_t2_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_86_t2_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_86_t2_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_86_t2_combined_constants
    ]

def positiveBox_s0_86_t2_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((3552916097 : ℚ) / 62500000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((2015485871 : ℚ) / 250000000000)

def positiveBox_s0_86_t2_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_86_t2_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_86_t2_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_86_t2_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_86_t2_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_86_t2_separate_constants
    ]

def positiveBox_s0_86_t3_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((56274495617 : ℚ) / 1000000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((1001737847 : ℚ) / 125000000000)

def positiveBox_s0_86_t3_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_86_t3_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_86_t3_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_86_t3_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_86_t3_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_86_t3_combined_constants
    ]

def positiveBox_s0_86_t3_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((56274495617 : ℚ) / 1000000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((8037377043 : ℚ) / 1000000000000)

def positiveBox_s0_86_t3_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_86_t3_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_86_t3_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_86_t3_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_86_t3_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_86_t3_separate_constants
    ]

def positiveBox_s0_86_t4_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((13930023121 : ℚ) / 250000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((3987873513 : ℚ) / 500000000000)

def positiveBox_s0_86_t4_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_86_t4_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_86_t4_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_86_t4_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_86_t4_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_86_t4_combined_constants
    ]

def positiveBox_s0_86_t4_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((13930023121 : ℚ) / 250000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((4004689061 : ℚ) / 500000000000)

def positiveBox_s0_86_t4_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_86_t4_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_86_t4_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_86_t4_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_86_t4_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_86_t4_separate_constants
    ]

def positiveBox_s0_86_t5_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((55185293511 : ℚ) / 1000000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((247885843 : ℚ) / 31250000000)

def positiveBox_s0_86_t5_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_86_t5_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_86_t5_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_86_t5_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_86_t5_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_86_t5_combined_constants
    ]

def positiveBox_s0_86_t5_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((55185293511 : ℚ) / 1000000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((7977969553 : ℚ) / 1000000000000)

def positiveBox_s0_86_t5_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_86_t5_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_86_t5_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_86_t5_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_86_t5_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_86_t5_separate_constants
    ]

def positiveBox_s0_86_t6_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((2733519581 : ℚ) / 50000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((7883410559 : ℚ) / 1000000000000)

def positiveBox_s0_86_t6_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_86_t6_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_86_t6_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_86_t6_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_86_t6_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_86_t6_combined_constants
    ]

def positiveBox_s0_86_t6_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((2733519581 : ℚ) / 50000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((397145591 : ℚ) / 50000000000)

def positiveBox_s0_86_t6_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_86_t6_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_86_t6_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_86_t6_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_86_t6_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_86_t6_separate_constants
    ]

def positiveBox_s0_86_t7_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((27088880951 : ℚ) / 500000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((3914581817 : ℚ) / 500000000000)

def positiveBox_s0_86_t7_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_86_t7_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_86_t7_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_86_t7_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_86_t7_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_86_t7_combined_constants
    ]

def positiveBox_s0_86_t7_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((27088880951 : ℚ) / 500000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((7904236399 : ℚ) / 1000000000000)

def positiveBox_s0_86_t7_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_86_t7_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_86_t7_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_86_t7_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_86_t7_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_86_t7_separate_constants
    ]

def positiveBox_s0_86_t8_combined_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((63008360531 : ℚ) / 1000000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((506148503 : ℚ) / 200000000000)

def positiveBox_s0_86_t8_combined_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_86_t8_combined_constants
  main_pos := by
    norm_num [positiveBox_s0_86_t8_combined_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_86_t8_combined_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_86_t8_combined_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_86_t8_combined_constants
    ]

def positiveBox_s0_86_t8_separate_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := ((63008360531 : ℚ) / 1000000000000)
  numeratorUpper := ((1 : ℚ) / 1000000000000)
  restUpper := ((1265573437 : ℚ) / 500000000000)

def positiveBox_s0_86_t8_separate_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := positiveBox_s0_86_t8_separate_constants
  main_pos := by
    norm_num [positiveBox_s0_86_t8_separate_constants]
  numerator_nonneg := by
    norm_num [positiveBox_s0_86_t8_separate_constants]
  rest_nonneg := by
    norm_num [positiveBox_s0_86_t8_separate_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      positiveBox_s0_86_t8_separate_constants
    ]

def positiveBoxCombinedRationalizedCertificates :
    List ProjectedJ0RationalizedBoxCertificate :=
  [
    positiveBox_s0_84_t0_combined_certificate,
    positiveBox_s0_84_t1_combined_certificate,
    positiveBox_s0_84_t2_combined_certificate,
    positiveBox_s0_84_t3_combined_certificate,
    positiveBox_s0_84_t4_combined_certificate,
    positiveBox_s0_84_t5_combined_certificate,
    positiveBox_s0_84_t6_combined_certificate,
    positiveBox_s0_84_t7_combined_certificate,
    positiveBox_s0_84_t8_combined_certificate,
    positiveBox_s0_85_t0_combined_certificate,
    positiveBox_s0_85_t1_combined_certificate,
    positiveBox_s0_85_t2_combined_certificate,
    positiveBox_s0_85_t3_combined_certificate,
    positiveBox_s0_85_t4_combined_certificate,
    positiveBox_s0_85_t5_combined_certificate,
    positiveBox_s0_85_t6_combined_certificate,
    positiveBox_s0_85_t7_combined_certificate,
    positiveBox_s0_85_t8_combined_certificate,
    positiveBox_s0_86_t0_combined_certificate,
    positiveBox_s0_86_t1_combined_certificate,
    positiveBox_s0_86_t2_combined_certificate,
    positiveBox_s0_86_t3_combined_certificate,
    positiveBox_s0_86_t4_combined_certificate,
    positiveBox_s0_86_t5_combined_certificate,
    positiveBox_s0_86_t6_combined_certificate,
    positiveBox_s0_86_t7_combined_certificate,
    positiveBox_s0_86_t8_combined_certificate,
  ]

def positiveBoxSeparateRationalizedCertificates :
    List ProjectedJ0RationalizedBoxCertificate :=
  [
    positiveBox_s0_84_t0_separate_certificate,
    positiveBox_s0_84_t1_separate_certificate,
    positiveBox_s0_84_t2_separate_certificate,
    positiveBox_s0_84_t3_separate_certificate,
    positiveBox_s0_84_t4_separate_certificate,
    positiveBox_s0_84_t5_separate_certificate,
    positiveBox_s0_84_t6_separate_certificate,
    positiveBox_s0_84_t7_separate_certificate,
    positiveBox_s0_84_t8_separate_certificate,
    positiveBox_s0_85_t0_separate_certificate,
    positiveBox_s0_85_t1_separate_certificate,
    positiveBox_s0_85_t2_separate_certificate,
    positiveBox_s0_85_t3_separate_certificate,
    positiveBox_s0_85_t4_separate_certificate,
    positiveBox_s0_85_t5_separate_certificate,
    positiveBox_s0_85_t6_separate_certificate,
    positiveBox_s0_85_t7_separate_certificate,
    positiveBox_s0_85_t8_separate_certificate,
    positiveBox_s0_86_t0_separate_certificate,
    positiveBox_s0_86_t1_separate_certificate,
    positiveBox_s0_86_t2_separate_certificate,
    positiveBox_s0_86_t3_separate_certificate,
    positiveBox_s0_86_t4_separate_certificate,
    positiveBox_s0_86_t5_separate_certificate,
    positiveBox_s0_86_t6_separate_certificate,
    positiveBox_s0_86_t7_separate_certificate,
    positiveBox_s0_86_t8_separate_certificate,
  ]

end AdjustedQuartetProjectedJ0Aliases
end C2
