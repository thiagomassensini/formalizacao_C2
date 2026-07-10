import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.86_t7

This file contains exact rational endpoints and kernel-checkable
rectangle arithmetic. It intentionally contains no theorem asserting
analytic membership of M, D0, Drest, or RvecTail in these rectangles.

Source subboxes: audit_outputs/projected_j0_positive_box_sector_subbox_certificate/subboxes.jsonl
Source subboxes SHA256: ef8298cb0c2b09354f90d3c272fe37fb58ab63dcc84d4566a3d455087c9923fe
Source box constants: audit_outputs/projected_j0_positive_box_sector_rationalized_pack/boxes_sector_rationalized.csv
Source box constants SHA256: 7712949d582825faa70f6f6d362d697e15e6fa5f7f64a01a66570ccc5a0b8413
Skeleton: LeanC2/AuditProjectedJ0PositiveBoxAllSubboxSkeleton.lean
Skeleton SHA256: f6cfce6ac124ef7f0161de797faa441ec1fbb99a1a20d0f1ccdb57c22afe40b3
-/

namespace C2
namespace ProjectedJ0PositiveBoxSkeleton
namespace ProjectedJ0PositiveBoxRectangleData
namespace S086T7

open ProjectedJ0RectangleArithmetic

def s086_t7_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((5706924892420599 : ℚ) / 1000000000000000000)
              hi := ((2492927630974777 : ℚ) / 250000000000000000) }
      im := { lo := ((-6507453988434951 : ℚ) / 100000000000000000)
              hi := ((-6086025717667587 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((51399379312473 : ℚ) / 7812500000000000)
              hi := ((3926911895194983 : ℚ) / 500000000000000000) }
      im := { lo := ((-1374541545502559 : ℚ) / 200000000000000000)
              hi := ((-2801260605350853 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1959811634051203 : ℚ) / 2500000000000000000)
              hi := ((-390498798128113 : ℚ) / 2500000000000000000) }
      im := { lo := ((354369900414039 : ℚ) / 200000000000000000)
              hi := ((23999006591132687 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7736310213021061 : ℚ) / 10000000000000000000)
              hi := ((238788860628271 : ℚ) / 400000000000000000) }
      im := { lo := ((-277909714248173 : ℚ) / 1000000000000000000)
              hi := ((5221981563850901 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((11430793421284639 : ℚ) / 2000000000000000000)
              hi := ((623754413331411 : ℚ) / 62500000000000000) }
      im := { lo := ((-1301234700685959 : ℚ) / 20000000000000000)
              hi := ((-3042379758073123 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((6570771154777103 : ℚ) / 1000000000000000000)
              hi := ((313810275554679 : ℚ) / 40000000000000000) }
      im := { lo := ((-860288860606479 : ℚ) / 125000000000000000)
              hi := ((-2244944672782849 : ℚ) / 400000000000000000) } }
  DrestRect :=
    { re := { lo := ((-390475092835793 : ℚ) / 500000000000000000)
              hi := ((-30652460203999 : ℚ) / 200000000000000000) }
      im := { lo := ((8862699809883513 : ℚ) / 5000000000000000000)
              hi := ((2400555762745631 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3867526536040599 : ℚ) / 5000000000000000000)
              hi := ((1492694414031289 : ℚ) / 2500000000000000000) }
      im := { lo := ((-5557568941222049 : ℚ) / 20000000000000000000)
              hi := ((1044383213426181 : ℚ) / 1000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((1430971165430017 : ℚ) / 250000000000000000)
              hi := ((9988447496987251 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6504894286864611 : ℚ) / 100000000000000000)
              hi := ((-1216698936853931 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((3281204439723351 : ℚ) / 500000000000000000)
              hi := ((7836676676230473 : ℚ) / 1000000000000000000) }
      im := { lo := ((-8614878031151 : ℚ) / 1250000000000000)
              hi := ((-1405547708135561 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1944936627914461 : ℚ) / 2500000000000000000)
              hi := ((-7516211425109781 : ℚ) / 50000000000000000000) }
      im := { lo := ((2216532933809977 : ℚ) / 1250000000000000000)
              hi := ((4802413146752801 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3866900589088583 : ℚ) / 5000000000000000000)
              hi := ((5971838453724297 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2778468271721203 : ℚ) / 10000000000000000000)
              hi := ((1305462200786763 : ℚ) / 1250000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((5732388996825533 : ℚ) / 1000000000000000000)
              hi := ((4998420407118737 : ℚ) / 500000000000000000) }
      im := { lo := ((-6503616371900449 : ℚ) / 100000000000000000)
              hi := ((-1520557798155827 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((13108067341547373 : ℚ) / 2000000000000000000)
              hi := ((3914041612691043 : ℚ) / 500000000000000000) }
      im := { lo := ((-6901483051915881 : ℚ) / 1000000000000000000)
              hi := ((-2816003958999413 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-774998273378003 : ℚ) / 1000000000000000000)
              hi := ((-7369254422224531 : ℚ) / 50000000000000000000) }
      im := { lo := ((17739084841728193 : ℚ) / 10000000000000000000)
              hi := ((24018532586784183 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3866275274851679 : ℚ) / 5000000000000000000)
              hi := ((2986449966589437 : ℚ) / 5000000000000000000) }
      im := { lo := ((-694536907743099 : ℚ) / 2500000000000000000)
              hi := ((10443558629806217 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((71761373927401 : ℚ) / 12500000000000000)
              hi := ((10005250399997487 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6502339700408981 : ℚ) / 100000000000000000)
              hi := ((-3040484551463017 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((654564557437529 : ℚ) / 100000000000000000)
              hi := ((7819476532367557 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1382210398495551 : ℚ) / 200000000000000000)
              hi := ((-11283627367827979 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-772020838837931 : ℚ) / 1000000000000000000)
              hi := ((-14444510710652137 : ℚ) / 100000000000000000000) }
      im := { lo := ((1774586540146009 : ℚ) / 1000000000000000000)
              hi := ((2402495651902543 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7731302035230677 : ℚ) / 10000000000000000000)
              hi := ((5973962940043369 : ℚ) / 10000000000000000000) }
      im := { lo := ((-13889113136749003 : ℚ) / 50000000000000000000)
              hi := ((2088683056951313 : ℚ) / 2000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((5749447943954177 : ℚ) / 1000000000000000000)
              hi := ((5006837818603941 : ℚ) / 500000000000000000) }
      im := { lo := ((-6501064259937323 : ℚ) / 100000000000000000)
              hi := ((-379981776974621 : ℚ) / 6250000000000000) } }
  D0Rect :=
    { re := { lo := ((6537244384202043 : ℚ) / 1000000000000000000)
              hi := ((7810856828156709 : ℚ) / 1000000000000000000) }
      im := { lo := ((-865076154447709 : ℚ) / 125000000000000000)
              hi := ((-5651608099571553 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7690424020295281 : ℚ) / 10000000000000000000)
              hi := ((-14150424157788617 : ℚ) / 100000000000000000000) }
      im := { lo := ((17752604487525521 : ℚ) / 10000000000000000000)
              hi := ((2403133814559959 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3865025263784477 : ℚ) / 5000000000000000000)
              hi := ((5975022371808119 : ℚ) / 10000000000000000000) }
      im := { lo := ((-694373320684031 : ℚ) / 2500000000000000000)
              hi := ((10443267593789889 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((230320056324101 : ℚ) / 40000000000000000)
              hi := ((2004423653257453 : ℚ) / 200000000000000000) }
      im := { lo := ((-406236883717927 : ℚ) / 6250000000000000)
              hi := ((-15196122734210121 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((3264415289049683 : ℚ) / 500000000000000000)
              hi := ((312088946602967 : ℚ) / 40000000000000000) }
      im := { lo := ((-6930155291735343 : ℚ) / 1000000000000000000)
              hi := ((-1132278124835329 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7660630198784757 : ℚ) / 10000000000000000000)
              hi := ((-554249783635981 : ℚ) / 4000000000000000000) }
      im := { lo := ((554978196695937 : ℚ) / 312500000000000000)
              hi := ((300470965652221 : ℚ) / 125000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1932202179807141 : ℚ) / 2500000000000000000)
              hi := ((5976090916866357 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1388579822284267 : ℚ) / 5000000000000000000)
              hi := ((10443115605702933 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((5766570120420931 : ℚ) / 1000000000000000000)
              hi := ((2006115679728861 : ℚ) / 200000000000000000) }
      im := { lo := ((-203078667036631 : ℚ) / 3125000000000000)
              hi := ((-1519297771330311 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((8150504349033863 : ℚ) / 1250000000000000000)
              hi := ((7793577768274281 : ℚ) / 1000000000000000000) }
      im := { lo := ((-13879380097767383 : ℚ) / 2000000000000000000)
              hi := ((-2835580667640593 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3815414102133157 : ℚ) / 5000000000000000000)
              hi := ((-6780980344014773 : ℚ) / 50000000000000000000) }
      im := { lo := ((710638281463479 : ℚ) / 400000000000000000)
              hi := ((24043975621475247 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7727573910900789 : ℚ) / 10000000000000000000)
              hi := ((5977165878755811 : ℚ) / 10000000000000000000) }
      im := { lo := ((-277682163175773 : ℚ) / 1000000000000000000)
              hi := ((522147961965427 : ℚ) / 500000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((5775156081422049 : ℚ) / 1000000000000000000)
              hi := ((10039053993291077 : ℚ) / 1000000000000000000) }
      im := { lo := ((-406077863930099 : ℚ) / 6250000000000000)
              hi := ((-15189836173312151 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((3255981735806681 : ℚ) / 500000000000000000)
              hi := ((3892459384488557 : ℚ) / 500000000000000000) }
      im := { lo := ((-6949213019285949 : ℚ) / 1000000000000000000)
              hi := ((-1420230170318589 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7601015968534043 : ℚ) / 10000000000000000000)
              hi := ((-6633797043791263 : ℚ) / 50000000000000000000) }
      im := { lo := ((1777257073562669 : ℚ) / 1000000000000000000)
              hi := ((300627889706399 : ℚ) / 125000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3863167447901427 : ℚ) / 5000000000000000000)
              hi := ((239129442125501 : ℚ) / 400000000000000000) }
      im := { lo := ((-2776482462849307 : ℚ) / 10000000000000000000)
              hi := ((10442801716745841 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((180742466957469 : ℚ) / 31250000000000000)
              hi := ((10047545387022867 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1299195135514159 : ℚ) / 20000000000000000)
              hi := ((-3037339567424109 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((6503510615867141 : ℚ) / 1000000000000000000)
              hi := ((7776246632358073 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3479362026242017 : ℚ) / 500000000000000000)
              hi := ((-1422667194749869 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7571193065679097 : ℚ) / 10000000000000000000)
              hi := ((-40541094110539 : ℚ) / 312500000000000000) }
      im := { lo := ((17779143791844577 : ℚ) / 10000000000000000000)
              hi := ((2405644348555063 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1545018414673349 : ℚ) / 2000000000000000000)
              hi := ((597930183982479 : ℚ) / 1000000000000000000) }
      im := { lo := ((-347018764215711 : ℚ) / 1250000000000000000)
              hi := ((5221325504683773 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((2896189307922559 : ℚ) / 500000000000000000)
              hi := ((1005605268647857 : ℚ) / 100000000000000000) }
      im := { lo := ((-6494706800630433 : ℚ) / 100000000000000000)
              hi := ((-15183563008544499 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((3247522508570257 : ℚ) / 500000000000000000)
              hi := ((7767561299221583 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1742055768996507 : ℚ) / 250000000000000000)
              hi := ((-5700405663004293 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7541359245073387 : ℚ) / 10000000000000000000)
              hi := ((-6339316382641921 : ℚ) / 50000000000000000000) }
      im := { lo := ((3557135308902453 : ℚ) / 2000000000000000000)
              hi := ((120313060985567 : ℚ) / 50000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1544769868551489 : ℚ) / 2000000000000000000)
              hi := ((2990183567808723 : ℚ) / 5000000000000000000) }
      im := { lo := ((-693954042663781 : ℚ) / 2500000000000000000)
              hi := ((5221249354658193 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((90640856080927 : ℚ) / 15625000000000000)
              hi := ((1006457608047167 : ℚ) / 100000000000000000) }
      im := { lo := ((-3246719628065701 : ℚ) / 50000000000000000)
              hi := ((-12144345218881053 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((12973133928384421 : ℚ) / 2000000000000000000)
              hi := ((15517725010296829 : ℚ) / 2000000000000000000) }
      im := { lo := ((-3488855076153423 : ℚ) / 500000000000000000)
              hi := ((-1142026248719589 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3755757094088473 : ℚ) / 5000000000000000000)
              hi := ((-247680923536837 : ℚ) / 2000000000000000000) }
      im := { lo := ((177921696069793 : ℚ) / 100000000000000000)
              hi := ((1504296042255463 : ℚ) / 625000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3861304233969269 : ℚ) / 5000000000000000000)
              hi := ((2990716855613801 : ℚ) / 5000000000000000000) }
      im := { lo := ((-27754846975217473 : ℚ) / 100000000000000000000)
              hi := ((10442348878846187 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((5809667634242963 : ℚ) / 1000000000000000000)
              hi := ((10073115434063489 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6492173096219203 : ℚ) / 100000000000000000)
              hi := ((-6070921309447609 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((259123054742839 : ℚ) / 40000000000000000)
              hi := ((77501503742629 : ℚ) / 10000000000000000) }
      im := { lo := ((-6987185506395123 : ℚ) / 1000000000000000000)
              hi := ((-142996131458831 : ℚ) / 25000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7481658873394597 : ℚ) / 10000000000000000000)
              hi := ((-12089381859666121 : ℚ) / 100000000000000000000) }
      im := { lo := ((17798622154457607 : ℚ) / 10000000000000000000)
              hi := ((2407481772229383 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1930341602826439 : ℚ) / 2500000000000000000)
              hi := ((5982498526105077 : ℚ) / 10000000000000000000) }
      im := { lo := ((-44402531151581 : ℚ) / 160000000000000000)
              hi := ((2610551006032131 : ℚ) / 2500000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((11636673757215197 : ℚ) / 2000000000000000000)
              hi := ((10081670998193407 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1298181652813 : ℚ) / 20000000000000)
              hi := ((-6069671359772739 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((3234786220660269 : ℚ) / 500000000000000000)
              hi := ((77414257226231 : ℚ) / 10000000000000000) }
      im := { lo := ((-2798659814352333 : ℚ) / 400000000000000000)
              hi := ((-11459094534702079 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7451796234214317 : ℚ) / 10000000000000000000)
              hi := ((-235892233586917 : ℚ) / 2000000000000000000) }
      im := { lo := ((17805031010136327 : ℚ) / 10000000000000000000)
              hi := ((4816171693589449 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7720121752401239 : ℚ) / 10000000000000000000)
              hi := ((2991780080315559 : ℚ) / 5000000000000000000) }
      im := { lo := ((-27748289019855377 : ℚ) / 100000000000000000000)
              hi := ((5221028188139489 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((5827022807583463 : ℚ) / 1000000000000000000)
              hi := ((10090242448496423 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3244822354129377 : ℚ) / 50000000000000000)
              hi := ((-3034211408454389 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((323052770181081 : ℚ) / 50000000000000000)
              hi := ((7732688362835109 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3503050994251789 : ℚ) / 500000000000000000)
              hi := ((-28696187498176307 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7421925213227669 : ℚ) / 10000000000000000000)
              hi := ((-2299949456758891 : ℚ) / 20000000000000000000) }
      im := { lo := ((8905698628626341 : ℚ) / 5000000000000000000)
              hi := ((120434289139971 : ℚ) / 50000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3859437398116073 : ℚ) / 5000000000000000000)
              hi := ((1496154730310557 : ℚ) / 2500000000000000000) }
      im := { lo := ((-13872474951164007 : ℚ) / 50000000000000000000)
              hi := ((1044190411515211 : ℚ) / 1000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((5835725695721281 : ℚ) / 1000000000000000000)
              hi := ((10098829492977827 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3244191193783621 : ℚ) / 50000000000000000)
              hi := ((-6067175725876709 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((6452525150096771 : ℚ) / 1000000000000000000)
              hi := ((1544787685564343 : ℚ) / 200000000000000000) }
      im := { lo := ((-7015542322470619 : ℚ) / 1000000000000000000)
              hi := ((-287445822688197 : ℚ) / 50000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3696022323207311 : ℚ) / 5000000000000000000)
              hi := ((-2240960308556893 : ℚ) / 20000000000000000000) }
      im := { lo := ((8908860813425599 : ℚ) / 5000000000000000000)
              hi := ((12046407512752639 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-241175758151977 : ℚ) / 312500000000000000)
              hi := ((1197134705330297 : ℚ) / 2000000000000000000) }
      im := { lo := ((-1387078307443513 : ℚ) / 5000000000000000000)
              hi := ((5220873697211069 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((11688891893786777 : ℚ) / 2000000000000000000)
              hi := ((10107431684242859 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3243560654430821 : ℚ) / 50000000000000000)
              hi := ((-12131860166723861 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((201374442290667 : ℚ) / 31250000000000000)
              hi := ((1543035097070297 : ℚ) / 200000000000000000) }
      im := { lo := ((-280998829294319 : ℚ) / 40000000000000000)
              hi := ((-2879291953113607 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-230067319972189 : ℚ) / 312500000000000000)
              hi := ((-10909778668495707 : ℚ) / 100000000000000000000) }
      im := { lo := ((8912002480487563 : ℚ) / 5000000000000000000)
              hi := ((2409872921480341 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3858184558671453 : ℚ) / 5000000000000000000)
              hi := ((74834036866563 : ℚ) / 125000000000000000) }
      im := { lo := ((-27738144197538353 : ℚ) / 100000000000000000000)
              hi := ((5220793429455907 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((1170636413517821 : ℚ) / 200000000000000000)
              hi := ((5058025256024291 : ℚ) / 500000000000000000) }
      im := { lo := ((-6485861549905689 : ℚ) / 100000000000000000)
              hi := ((-1516171453692769 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((6435426451230847 : ℚ) / 1000000000000000000)
              hi := ((308255980816221 : ℚ) / 40000000000000000) }
      im := { lo := ((-7034387331616317 : ℚ) / 1000000000000000000)
              hi := ((-5768239697188813 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3666127191229107 : ℚ) / 5000000000000000000)
              hi := ((-2122935186959603 : ℚ) / 20000000000000000000) }
      im := { lo := ((1114390438697537 : ℚ) / 625000000000000000)
              hi := ((24104600578478603 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7715118686976483 : ℚ) / 10000000000000000000)
              hi := ((5987776510707111 : ℚ) / 10000000000000000000) }
      im := { lo := ((-866709333108547 : ℚ) / 3125000000000000000)
              hi := ((2610355992466091 : ℚ) / 2500000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((1172386860721763 : ℚ) / 200000000000000000)
              hi := ((5062342843190627 : ℚ) / 500000000000000000) }
      im := { lo := ((-6484603076290621 : ℚ) / 100000000000000000)
              hi := ((-303172147983027 : ℚ) / 5000000000000000) } }
  D0Rect :=
    { re := { lo := ((803357272599247 : ℚ) / 125000000000000000)
              hi := ((7697610436088069 : ℚ) / 1000000000000000000) }
      im := { lo := ((-88047401185933 : ℚ) / 12500000000000000)
              hi := ((-5777883829635423 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-182558621234567 : ℚ) / 250000000000000000)
              hi := ((-2579874196462011 : ℚ) / 25000000000000000000) }
      im := { lo := ((1783644816750143 : ℚ) / 1000000000000000000)
              hi := ((12055214379269373 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3856936242847903 : ℚ) / 5000000000000000000)
              hi := ((5988833728143207 : ℚ) / 10000000000000000000) }
      im := { lo := ((-13865605051104787 : ℚ) / 50000000000000000000)
              hi := ((10441256786246323 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((5870703228532069 : ℚ) / 1000000000000000000)
              hi := ((2533334154688237 : ℚ) / 250000000000000000) }
      im := { lo := ((-3241672927607749 : ℚ) / 50000000000000000)
              hi := ((-6062201553459341 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((6418276941851377 : ℚ) / 1000000000000000000)
              hi := ((7688808656079651 : ℚ) / 1000000000000000000) }
      im := { lo := ((-14106369540527729 : ℚ) / 2000000000000000000)
              hi := ((-5787516517754667 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-454526618548903 : ℚ) / 625000000000000000)
              hi := ((-1253029966704121 : ℚ) / 12500000000000000000) }
      im := { lo := ((8921303852625689 : ℚ) / 5000000000000000000)
              hi := ((24116214414747787 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1928156245818923 : ℚ) / 2500000000000000000)
              hi := ((5989889072017383 : ℚ) / 10000000000000000000) }
      im := { lo := ((-5545535139068761 : ℚ) / 20000000000000000000)
              hi := ((2610271256282851 : ℚ) / 2500000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((2939744384498159 : ℚ) / 500000000000000000)
              hi := ((2028400668661199 : ℚ) / 200000000000000000) }
      im := { lo := ((-3241044947994893 : ℚ) / 50000000000000000)
              hi := ((-3030480795796999 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((1602420571688237 : ℚ) / 250000000000000000)
              hi := ((1535998933524493 : ℚ) / 200000000000000000) }
      im := { lo := ((-3531282644616881 : ℚ) / 500000000000000000)
              hi := ((-5797137797876821 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1448499684179841 : ℚ) / 2000000000000000000)
              hi := ((-9728897111675873 : ℚ) / 100000000000000000000) }
      im := { lo := ((2231090551109617 : ℚ) / 1250000000000000000)
              hi := ((2412195876093383 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-15422747893109 : ℚ) / 20000000000000000)
              hi := ((5990940310374623 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2772409805770217 : ℚ) / 10000000000000000000)
              hi := ((5220454474943423 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((588829170969397 : ℚ) / 100000000000000000)
              hi := ((1015068505856561 : ℚ) / 100000000000000000) }
      im := { lo := ((-6480835178768053 : ℚ) / 100000000000000000)
              hi := ((-6059723095807817 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((12802150111838901 : ℚ) / 2000000000000000000)
              hi := ((1534233531308373 : ℚ) / 200000000000000000) }
      im := { lo := ((-1414386726461079 : ℚ) / 200000000000000000)
              hi := ((-29033738212432053 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7212560758198777 : ℚ) / 10000000000000000000)
              hi := ((-37733947244343 : ℚ) / 400000000000000000) }
      im := { lo := ((892740029601191 : ℚ) / 500000000000000000)
              hi := ((4825531885686153 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1542023684142877 : ℚ) / 2000000000000000000)
              hi := ((11703098611561 : ℚ) / 19531250000000000) }
      im := { lo := ((-27720487323395777 : ℚ) / 100000000000000000000)
              hi := ((10440729573239693 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((11794222733577147 : ℚ) / 2000000000000000000)
              hi := ((253984561897193 : ℚ) / 25000000000000000) }
      im := { lo := ((-6479581764281633 : ℚ) / 100000000000000000)
              hi := ((-12116972022905663 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((3196227481072593 : ℚ) / 500000000000000000)
              hi := ((1532465589753709 : ℚ) / 200000000000000000) }
      im := { lo := ((-3540645199114173 : ℚ) / 500000000000000000)
              hi := ((-2326538173534903 : ℚ) / 400000000000000000) } }
  DrestRect :=
    { re := { lo := ((-179565383390743 : ℚ) / 250000000000000000)
              hi := ((-4568992831087333 : ℚ) / 50000000000000000000) }
      im := { lo := ((8930417056586809 : ℚ) / 5000000000000000000)
              hi := ((1206665928574329 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-770886005680441 : ℚ) / 1000000000000000000)
              hi := ((5993029256611547 : ℚ) / 10000000000000000000) }
      im := { lo := ((-692920864892803 : ℚ) / 2500000000000000000)
              hi := ((52202730042241 : ℚ) / 50000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((5905946590154339 : ℚ) / 1000000000000000000)
              hi := ((508404828321983 : ℚ) / 50000000000000000) }
      im := { lo := ((-3239164845714757 : ℚ) / 50000000000000000)
              hi := ((-1514312575353333 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((6383821914364647 : ℚ) / 1000000000000000000)
              hi := ((765347565024661 : ℚ) / 100000000000000000) }
      im := { lo := ((-7090635742217041 : ℚ) / 1000000000000000000)
              hi := ((-2912965488474911 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7152662905979409 : ℚ) / 10000000000000000000)
              hi := ((-8842387088189059 : ℚ) / 100000000000000000000) }
      im := { lo := ((1786682429640247 : ℚ) / 1000000000000000000)
              hi := ((2413893680950631 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7707605155031537 : ℚ) / 10000000000000000000)
              hi := ((5994074923540957 : ℚ) / 10000000000000000000) }
      im := { lo := ((-5542626603376843 : ℚ) / 20000000000000000000)
              hi := ((1305044696184383 : ℚ) / 1250000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((739349831080181 : ℚ) / 125000000000000000)
              hi := ((2544206547963137 : ℚ) / 250000000000000000) }
      im := { lo := ((-3238539453349963 : ℚ) / 50000000000000000)
              hi := ((-6056016021804689 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((6375176269206173 : ℚ) / 1000000000000000000)
              hi := ((3822305230811187 : ℚ) / 500000000000000000) }
      im := { lo := ((-1774992313398549 : ℚ) / 250000000000000000)
              hi := ((-729438080461021 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3561350877145411 : ℚ) / 5000000000000000000)
              hi := ((-8546709945894011 : ℚ) / 100000000000000000000) }
      im := { lo := ((1787277289636501 : ℚ) / 1000000000000000000)
              hi := ((482890247790229 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7706348170915267 : ℚ) / 10000000000000000000)
              hi := ((1199023587234787 : ℚ) / 2000000000000000000) }
      im := { lo := ((-3463674243762513 : ℚ) / 12500000000000000000)
              hi := ((5220082696193603 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((5923666589873431 : ℚ) / 1000000000000000000)
              hi := ((1273196522612201 : ℚ) / 125000000000000000) }
      im := { lo := ((-3237914762274773 : ℚ) / 50000000000000000)
              hi := ((-1513695767073377 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((636651823839217 : ℚ) / 100000000000000000)
              hi := ((7635732185912961 : ℚ) / 1000000000000000000) }
      im := { lo := ((-7109291053098877 : ℚ) / 1000000000000000000)
              hi := ((-1461266571103979 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7092731876901753 : ℚ) / 10000000000000000000)
              hi := ((-8250955076699331 : ℚ) / 100000000000000000000) }
      im := { lo := ((3575736038516509 : ℚ) / 2000000000000000000)
              hi := ((4830008998941069 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1541018827952337 : ℚ) / 2000000000000000000)
              hi := ((299808166852129 : ℚ) / 500000000000000000) }
      im := { lo := ((-27705672315953407 : ℚ) / 100000000000000000000)
              hi := ((5219987487127221 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((1483137770808257 : ℚ) / 250000000000000000)
              hi := ((2548583476471293 : ℚ) / 250000000000000000) }
      im := { lo := ((-6474581505802997 : ℚ) / 100000000000000000)
              hi := ((-242142059070161 : ℚ) / 4000000000000000) } }
  D0Rect :=
    { re := { lo := ((12715695487117349 : ℚ) / 2000000000000000000)
              hi := ((38134204695283473 : ℚ) / 5000000000000000000) }
      im := { lo := ((-7118601582167229 : ℚ) / 1000000000000000000)
              hi := ((-5854615422340313 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1412550969998471 : ℚ) / 2000000000000000000)
              hi := ((-3977554009076497 : ℚ) / 50000000000000000000) }
      im := { lo := ((4471136234282519 : ℚ) / 2500000000000000000)
              hi := ((24155535854744107 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3851919098879767 : ℚ) / 5000000000000000000)
              hi := ((5997206259024759 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1385096492503771 : ℚ) / 5000000000000000000)
              hi := ((2609945621348691 : ℚ) / 2500000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((11882902281259931 : ℚ) / 2000000000000000000)
              hi := ((10203112289841769 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6473334950087087 : ℚ) / 100000000000000000)
              hi := ((-15130802879901 : ℚ) / 250000000000000) } }
  D0Rect :=
    { re := { lo := ((3174581887509573 : ℚ) / 500000000000000000)
              hi := ((3808968882993889 : ℚ) / 500000000000000000) }
      im := { lo := ((-7127901068865089 : ℚ) / 1000000000000000000)
              hi := ((-14660379474252419 : ℚ) / 2500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3516386800907933 : ℚ) / 5000000000000000000)
              hi := ((-7659140802247277 : ℚ) / 100000000000000000000) }
      im := { lo := ((1118147729494647 : ℚ) / 625000000000000000)
              hi := ((4832197679853563 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7702579412754577 : ℚ) / 10000000000000000000)
              hi := ((2999122886449261 : ℚ) / 5000000000000000000) }
      im := { lo := ((-2769819419921093 : ℚ) / 10000000000000000000)
              hi := ((2609897672866949 : ℚ) / 2500000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((1190073365012131 : ℚ) / 200000000000000000)
              hi := ((1021190723228531 : ℚ) / 100000000000000000) }
      im := { lo := ((-809011235472817 : ℚ) / 12500000000000000)
              hi := ((-6051092069275213 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((3170233214657207 : ℚ) / 500000000000000000)
              hi := ((7609022590787787 : ℚ) / 1000000000000000000) }
      im := { lo := ((-7137188464420141 : ℚ) / 1000000000000000000)
              hi := ((-2936838205760103 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7002785042742491 : ℚ) / 10000000000000000000)
              hi := ((-7363085175394789 : ℚ) / 100000000000000000000) }
      im := { lo := ((8948069403098227 : ℚ) / 5000000000000000000)
              hi := ((24166400199329007 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1540263590485607 : ℚ) / 2000000000000000000)
              hi := ((749910256046747 : ℚ) / 1250000000000000000) }
      im := { lo := ((-138472714043501 : ℚ) / 500000000000000000)
              hi := ((5219703668638713 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((5959296270157023 : ℚ) / 1000000000000000000)
              hi := ((1022072067243509 : ℚ) / 100000000000000000) }
      im := { lo := ((-1294169278632187 : ℚ) / 20000000000000000)
              hi := ((-604986416318691 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((1266351264453617 : ℚ) / 200000000000000000)
              hi := ((950011855532859 : ℚ) / 125000000000000000) }
      im := { lo := ((-3573231915534647 : ℚ) / 500000000000000000)
              hi := ((-5883189181135469 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3486394124637851 : ℚ) / 5000000000000000000)
              hi := ((-7066951960756961 : ℚ) / 100000000000000000000) }
      im := { lo := ((8950935918748369 : ℚ) / 5000000000000000000)
              hi := ((2417176973460641 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7700069294096603 : ℚ) / 10000000000000000000)
              hi := ((6000330557423683 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1384549406965263 : ℚ) / 5000000000000000000)
              hi := ((2609808419758641 : ℚ) / 2500000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((1492059707334087 : ℚ) / 250000000000000000)
              hi := ((10229553081339713 : ℚ) / 1000000000000000000) }
      im := { lo := ((-129392087106101 : ℚ) / 2000000000000000)
              hi := ((-6048637538849161 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1580758332623871 : ℚ) / 250000000000000000)
              hi := ((7591154673366961 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1788931778677533 : ℚ) / 250000000000000000)
              hi := ((-5892690126329909 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-867847929311709 : ℚ) / 1250000000000000000)
              hi := ((-135414799153939 : ℚ) / 2000000000000000000) }
      im := { lo := ((2238445306997337 : ℚ) / 1250000000000000000)
              hi := ((2417709729450699 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3849419779774473 : ℚ) / 5000000000000000000)
              hi := ((1500349357911371 : ℚ) / 2500000000000000000) }
      im := { lo := ((-2768743346794467 : ℚ) / 10000000000000000000)
              hi := ((10439060033487887 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s086_t7_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60768794051 : ℚ) / 1000000000000)
      ((-94629357 : ℚ) / 250000000000)
      ((1890050351 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((5977196710986833 : ℚ) / 1000000000000000000)
              hi := ((511920113373381 : ℚ) / 50000000000000000) }
      im := { lo := ((-3234181882080471 : ℚ) / 50000000000000000)
              hi := ((-1511853053785973 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((1262859564406951 : ℚ) / 200000000000000000)
              hi := ((3032880698955703 : ℚ) / 400000000000000000) }
      im := { lo := ((-7164978083142731 : ℚ) / 1000000000000000000)
              hi := ((-5902179440906941 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3456384662684667 : ℚ) / 5000000000000000000)
              hi := ((-1618615809561251 : ℚ) / 25000000000000000000) }
      im := { lo := ((1119575755711317 : ℚ) / 625000000000000000)
              hi := ((151139883907679 : ℚ) / 62500000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3848807384010141 : ℚ) / 5000000000000000000)
              hi := ((3001234344200909 : ℚ) / 5000000000000000000) }
      im := { lo := ((-110735742022071 : ℚ) / 400000000000000000)
              hi := ((208777841550243 : ℚ) / 200000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

/--
Return rectangle data only for a subbox formally belonging to this box.
The membership argument rules out every constructor from the other boxes;
there is no default or fallback certificate.
-/
def certificate (i : PositiveBoxSubboxId)
    (hi : i ∈ positiveBoxSubboxesOf .s086_t7) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s086_t7).constants.mainLower)
      ((positiveBoxCombinedCert .s086_t7).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s086_t7).constants.restUpper) := by
  if h0 : i = .s086_t7_sb000 then
    exact s086_t7_sb000_certificateData
  else if h1 : i = .s086_t7_sb001 then
    exact s086_t7_sb001_certificateData
  else if h2 : i = .s086_t7_sb002 then
    exact s086_t7_sb002_certificateData
  else if h3 : i = .s086_t7_sb003 then
    exact s086_t7_sb003_certificateData
  else if h4 : i = .s086_t7_sb004 then
    exact s086_t7_sb004_certificateData
  else if h5 : i = .s086_t7_sb005 then
    exact s086_t7_sb005_certificateData
  else if h6 : i = .s086_t7_sb006 then
    exact s086_t7_sb006_certificateData
  else if h7 : i = .s086_t7_sb007 then
    exact s086_t7_sb007_certificateData
  else if h8 : i = .s086_t7_sb008 then
    exact s086_t7_sb008_certificateData
  else if h9 : i = .s086_t7_sb009 then
    exact s086_t7_sb009_certificateData
  else if h10 : i = .s086_t7_sb010 then
    exact s086_t7_sb010_certificateData
  else if h11 : i = .s086_t7_sb011 then
    exact s086_t7_sb011_certificateData
  else if h12 : i = .s086_t7_sb012 then
    exact s086_t7_sb012_certificateData
  else if h13 : i = .s086_t7_sb013 then
    exact s086_t7_sb013_certificateData
  else if h14 : i = .s086_t7_sb014 then
    exact s086_t7_sb014_certificateData
  else if h15 : i = .s086_t7_sb015 then
    exact s086_t7_sb015_certificateData
  else if h16 : i = .s086_t7_sb016 then
    exact s086_t7_sb016_certificateData
  else if h17 : i = .s086_t7_sb017 then
    exact s086_t7_sb017_certificateData
  else if h18 : i = .s086_t7_sb018 then
    exact s086_t7_sb018_certificateData
  else if h19 : i = .s086_t7_sb019 then
    exact s086_t7_sb019_certificateData
  else if h20 : i = .s086_t7_sb020 then
    exact s086_t7_sb020_certificateData
  else if h21 : i = .s086_t7_sb021 then
    exact s086_t7_sb021_certificateData
  else if h22 : i = .s086_t7_sb022 then
    exact s086_t7_sb022_certificateData
  else if h23 : i = .s086_t7_sb023 then
    exact s086_t7_sb023_certificateData
  else if h24 : i = .s086_t7_sb024 then
    exact s086_t7_sb024_certificateData
  else if h25 : i = .s086_t7_sb025 then
    exact s086_t7_sb025_certificateData
  else if h26 : i = .s086_t7_sb026 then
    exact s086_t7_sb026_certificateData
  else if h27 : i = .s086_t7_sb027 then
    exact s086_t7_sb027_certificateData
  else if h28 : i = .s086_t7_sb028 then
    exact s086_t7_sb028_certificateData
  else if h29 : i = .s086_t7_sb029 then
    exact s086_t7_sb029_certificateData
  else if h30 : i = .s086_t7_sb030 then
    exact s086_t7_sb030_certificateData
  else if h31 : i = .s086_t7_sb031 then
    exact s086_t7_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S086T7
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
