import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.84_t4

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
namespace S084T4

open ProjectedJ0RectangleArithmetic

def s084_t4_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((9830320586224747 : ℚ) / 5000000000000000000)
              hi := ((3457878830772247 : ℚ) / 500000000000000000) }
      im := { lo := ((-3293764720932413 : ℚ) / 50000000000000000)
              hi := ((-3048666824652529 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((582799064873399 : ℚ) / 62500000000000000)
              hi := ((2714195819040899 : ℚ) / 250000000000000000) }
      im := { lo := ((-2787239532758657 : ℚ) / 400000000000000000)
              hi := ((-5438840837476617 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3510252824415513 : ℚ) / 2500000000000000000)
              hi := ((-3232706995459683 : ℚ) / 5000000000000000000) }
      im := { lo := ((1311674423262121 : ℚ) / 625000000000000000)
              hi := ((571281702242677 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8878271203246727 : ℚ) / 10000000000000000000)
              hi := ((6808748393583633 : ℚ) / 10000000000000000000) }
      im := { lo := ((-4498495732111553 : ℚ) / 12500000000000000000)
              hi := ((11624809080974497 : ℚ) / 10000000000000000000) } }
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

def s084_t4_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((61697858963597 : ℚ) / 31250000000000000)
              hi := ((3461967000279531 : ℚ) / 500000000000000000) }
      im := { lo := ((-1317158638651397 : ℚ) / 20000000000000000)
              hi := ((-1523902394123139 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((232912005702673 : ℚ) / 25000000000000000)
              hi := ((108482391232597 : ℚ) / 10000000000000000) }
      im := { lo := ((-6981570303117989 : ℚ) / 1000000000000000000)
              hi := ((-1363144955527129 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7002878698903523 : ℚ) / 5000000000000000000)
              hi := ((-3215243172024981 : ℚ) / 5000000000000000000) }
      im := { lo := ((1050077231987527 : ℚ) / 500000000000000000)
              hi := ((28578532889719983 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8876995334361101 : ℚ) / 10000000000000000000)
              hi := ((1702468036203411 : ℚ) / 2500000000000000000) }
      im := { lo := ((-17992931660959377 : ℚ) / 50000000000000000000)
              hi := ((2324933041943521 : ℚ) / 2000000000000000000) } }
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

def s084_t4_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((9913101658250657 : ℚ) / 5000000000000000000)
              hi := ((1733032914066317 : ℚ) / 250000000000000000) }
      im := { lo := ((-1316811647490023 : ℚ) / 20000000000000000)
              hi := ((-15234716794221571 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((4654078287070561 : ℚ) / 500000000000000000)
              hi := ((1083967710921119 : ℚ) / 100000000000000000) }
      im := { lo := ((-1748757725765473 : ℚ) / 250000000000000000)
              hi := ((-2733153402908893 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13970485129196461 : ℚ) / 10000000000000000000)
              hi := ((-6395535511740913 : ℚ) / 10000000000000000000) }
      im := { lo := ((420324929171921 : ℚ) / 200000000000000000)
              hi := ((5718586681290467 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1775143059760589 : ℚ) / 2000000000000000000)
              hi := ((340549543485069 : ℚ) / 500000000000000000) }
      im := { lo := ((-7196751515726633 : ℚ) / 20000000000000000000)
              hi := ((2906130255909773 : ℚ) / 2500000000000000000) } }
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

def s084_t4_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((995465303067831 : ℚ) / 500000000000000000)
              hi := ((3470175330385019 : ℚ) / 500000000000000000) }
      im := { lo := ((-6582324475024517 : ℚ) / 100000000000000000)
              hi := ((-12184330354554447 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((2324953679055687 : ℚ) / 250000000000000000)
              hi := ((135388708093273 : ℚ) / 12500000000000000) }
      im := { lo := ((-7008479967748057 : ℚ) / 1000000000000000000)
              hi := ((-1370005597993743 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3483797875416531 : ℚ) / 2500000000000000000)
              hi := ((-6360564681190989 : ℚ) / 10000000000000000000) }
      im := { lo := ((5257724820075607 : ℚ) / 2500000000000000000)
              hi := ((572145671222219 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4437218784959517 : ℚ) / 5000000000000000000)
              hi := ((6812111040986813 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3598161108501531 : ℚ) / 10000000000000000000)
              hi := ((11624372768941449 : ℚ) / 10000000000000000000) } }
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

def s084_t4_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((999630358752723 : ℚ) / 500000000000000000)
              hi := ((6948592565159011 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3290296005831571 : ℚ) / 50000000000000000)
              hi := ((-15226112149215919 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((4645727019349697 : ℚ) / 500000000000000000)
              hi := ((10822498387780549 : ℚ) / 1000000000000000000) }
      im := { lo := ((-7021917317152681 : ℚ) / 1000000000000000000)
              hi := ((-5493726713563207 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13899877520183307 : ℚ) / 10000000000000000000)
              hi := ((-1265114598022131 : ℚ) / 2000000000000000000) }
      im := { lo := ((420910033169519 : ℚ) / 200000000000000000)
              hi := ((286215847502391 : ℚ) / 100000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1774633649213573 : ℚ) / 2000000000000000000)
              hi := ((1703309689679499 : ℚ) / 2500000000000000000) }
      im := { lo := ((-35979464731364087 : ℚ) / 100000000000000000000)
              hi := ((11624224539119857 : ℚ) / 10000000000000000000) } }
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

def s084_t4_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((2007610528521129 : ℚ) / 1000000000000000000)
              hi := ((6956857471594973 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1315772167344491 : ℚ) / 20000000000000000)
              hi := ((-1902726806048257 : ℚ) / 31250000000000000) } }
  D0Rect :=
    { re := { lo := ((74264599663231 : ℚ) / 8000000000000000)
              hi := ((1351735240732133 : ℚ) / 125000000000000000) }
      im := { lo := ((-703534368733003 : ℚ) / 100000000000000000)
              hi := ((-5507418983451003 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3466136117311171 : ℚ) / 2500000000000000000)
              hi := ((-3145279630593637 : ℚ) / 5000000000000000000) }
      im := { lo := ((1053002652098991 : ℚ) / 500000000000000000)
              hi := ((28635837437369833 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8871910026575253 : ℚ) / 10000000000000000000)
              hi := ((6814376724800587 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3597726947070803 : ℚ) / 10000000000000000000)
              hi := ((2906017857556677 : ℚ) / 2500000000000000000) } }
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

def s084_t4_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((125998884304613 : ℚ) / 62500000000000000)
              hi := ((34825716178069 : ℚ) / 5000000000000000) }
      im := { lo := ((-6577130973098867 : ℚ) / 100000000000000000)
              hi := ((-760875988353147 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((9274678182903283 : ℚ) / 1000000000000000000)
              hi := ((1080524660126221 : ℚ) / 100000000000000000) }
      im := { lo := ((-3524379304546599 : ℚ) / 500000000000000000)
              hi := ((-5521099628109319 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2765837940837269 : ℚ) / 2000000000000000000)
              hi := ((-6255526303200271 : ℚ) / 10000000000000000000) }
      im := { lo := ((5268639073573939 : ℚ) / 2500000000000000000)
              hi := ((7162509683896741 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4435325269432523 : ℚ) / 5000000000000000000)
              hi := ((681551256767009 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1798756204152013 : ℚ) / 5000000000000000000)
              hi := ((726495207163477 : ℚ) / 625000000000000000) } }
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

def s084_t4_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((20243759770526243 : ℚ) / 10000000000000000000)
              hi := ((3486724756968439 : ℚ) / 500000000000000000) }
      im := { lo := ((-1643850580020317 : ℚ) / 25000000000000000)
              hi := ((-12170582722237773 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((115828293958781 : ℚ) / 12500000000000000)
              hi := ((2159318524739397 : ℚ) / 200000000000000000) }
      im := { lo := ((-7062161943427421 : ℚ) / 1000000000000000000)
              hi := ((-5534768725491501 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1379381342457413 : ℚ) / 1000000000000000000)
              hi := ((-6220474038791447 : ℚ) / 10000000000000000000) }
      im := { lo := ((21089011033219103 : ℚ) / 10000000000000000000)
              hi := ((286641889228621 : ℚ) / 100000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8869388603777917 : ℚ) / 10000000000000000000)
              hi := ((6816645104901107 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1798647980002091 : ℚ) / 5000000000000000000)
              hi := ((726485831505629 : ℚ) / 625000000000000000) } }
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

def s084_t4_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((2032791162880999 : ℚ) / 1000000000000000000)
              hi := ((1745444276042683 : ℚ) / 250000000000000000) }
      im := { lo := ((-6573674912555387 : ℚ) / 100000000000000000)
              hi := ((-12167152215681011 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((925783094158533 : ℚ) / 100000000000000000)
              hi := ((5393960028227519 : ℚ) / 500000000000000000) }
      im := { lo := ((-7075553310199557 : ℚ) / 1000000000000000000)
              hi := ((-1387106652888043 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-171980185012967 : ℚ) / 125000000000000000)
              hi := ((-6185403457568171 : ℚ) / 10000000000000000000) }
      im := { lo := ((10551708953216983 : ℚ) / 5000000000000000000)
              hi := ((14339143660947991 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8868129627022387 : ℚ) / 10000000000000000000)
              hi := ((340888987214609 : ℚ) / 500000000000000000) }
      im := { lo := ((-112408753889021 : ℚ) / 312500000000000000)
              hi := ((5811811959813369 : ℚ) / 5000000000000000000) } }
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

def s084_t4_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((163297996980253 : ℚ) / 80000000000000000)
              hi := ((6990128578330883 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6571948948103751 : ℚ) / 100000000000000000)
              hi := ((-7602327443449697 : ℚ) / 125000000000000000) } }
  D0Rect :=
    { re := { lo := ((462468975768393 : ℚ) / 50000000000000000)
              hi := ((1347403734217703 : ℚ) / 125000000000000000) }
      im := { lo := ((-7088932763738061 : ℚ) / 1000000000000000000)
              hi := ((-5562073190749133 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-274459923588149 : ℚ) / 200000000000000000)
              hi := ((-6150312344626121 : ℚ) / 10000000000000000000) }
      im := { lo := ((263972175770303 : ℚ) / 125000000000000000)
              hi := ((1434616837168629 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8866883636408823 : ℚ) / 10000000000000000000)
              hi := ((3409463261712393 : ℚ) / 5000000000000000000) }
      im := { lo := ((-35968719454879393 : ℚ) / 100000000000000000000)
              hi := ((2324696441479581 : ℚ) / 2000000000000000000) } }
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

def s084_t4_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((20496790187238437 : ℚ) / 10000000000000000000)
              hi := ((3499251261133557 : ℚ) / 500000000000000000) }
      im := { lo := ((-1642556107997849 : ℚ) / 25000000000000000)
              hi := ((-12160297800515929 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((9240909280564421 : ℚ) / 1000000000000000000)
              hi := ((430820882515937 : ℚ) / 40000000000000000) }
      im := { lo := ((-7102300685109377 : ℚ) / 1000000000000000000)
              hi := ((-5575708020798727 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3421889680783963 : ℚ) / 2500000000000000000)
              hi := ((-6115199690097937 : ℚ) / 10000000000000000000) }
      im := { lo := ((264150983033393 : ℚ) / 125000000000000000)
              hi := ((1435316898073463 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8865638993925993 : ℚ) / 10000000000000000000)
              hi := ((852509223757579 : ℚ) / 1250000000000000000) }
      im := { lo := ((-3596673076032859 : ℚ) / 10000000000000000000)
              hi := ((2905837454838981 : ℚ) / 2500000000000000000) } }
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

def s084_t4_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((128634592661599 : ℚ) / 62500000000000000)
              hi := ((1751724630647509 : ℚ) / 250000000000000000) }
      im := { lo := ((-262740047139373 : ℚ) / 4000000000000000)
              hi := ((-1519609284129 : ℚ) / 25000000000000) } }
  D0Rect :=
    { re := { lo := ((9232421021987543 : ℚ) / 1000000000000000000)
              hi := ((10761795864981497 : ℚ) / 1000000000000000000) }
      im := { lo := ((-7115657083384881 : ℚ) / 1000000000000000000)
              hi := ((-5589331047875901 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-136521009133269 : ℚ) / 100000000000000000)
              hi := ((-608006713774583 : ℚ) / 1000000000000000000) }
      im := { lo := ((2114633370352223 : ℚ) / 1000000000000000000)
              hi := ((2872028886476397 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-443220104092183 : ℚ) / 500000000000000000)
              hi := ((3410613971032283 : ℚ) / 5000000000000000000) }
      im := { lo := ((-8991176610187561 : ℚ) / 25000000000000000000)
              hi := ((290580347166643 : ℚ) / 250000000000000000) } }
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

def s084_t4_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((2583312855500357 : ℚ) / 1250000000000000000)
              hi := ((280612591641819 : ℚ) / 40000000000000000) }
      im := { lo := ((-6566779128456397 : ℚ) / 100000000000000000)
              hi := ((-6076726722095551 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((9223914931631837 : ℚ) / 1000000000000000000)
              hi := ((1075305111429633 : ℚ) / 100000000000000000) }
      im := { lo := ((-1782250393148259 : ℚ) / 250000000000000000)
              hi := ((-1400735653702717 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-851038838086079 : ℚ) / 625000000000000000)
              hi := ((-1511229037958261 : ℚ) / 2500000000000000000) }
      im := { lo := ((1322533781539207 : ℚ) / 625000000000000000)
              hi := ((28734188139430423 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2215790434539057 : ℚ) / 2500000000000000000)
              hi := ((1705594452156121 : ℚ) / 2500000000000000000) }
      im := { lo := ((-449533338794039 : ℚ) / 1250000000000000000)
              hi := ((11623076467709003 : ℚ) / 10000000000000000000) } }
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

def s084_t4_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((2075169508798207 : ℚ) / 1000000000000000000)
              hi := ((1404750233390237 : ℚ) / 200000000000000000) }
      im := { lo := ((-820632291172897 : ℚ) / 12500000000000000)
              hi := ((-6075017628721731 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4607695538337813 : ℚ) / 500000000000000000)
              hi := ((214885755786239 : ℚ) / 20000000000000000) }
      im := { lo := ((-7142334137374683 : ℚ) / 1000000000000000000)
              hi := ((-224661707142727 : ℚ) / 40000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13581120243309733 : ℚ) / 10000000000000000000)
              hi := ((-3004873439719901 : ℚ) / 5000000000000000000) }
      im := { lo := ((2117469911275549 : ℚ) / 1000000000000000000)
              hi := ((1437401783156661 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-14179066226669 : ℚ) / 16000000000000000)
              hi := ((3411760910791019 : ℚ) / 5000000000000000000) }
      im := { lo := ((-1798032167329893 : ℚ) / 5000000000000000000)
              hi := ((5811470315826269 : ℚ) / 5000000000000000000) } }
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

def s084_t4_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((10418553812280337 : ℚ) / 5000000000000000000)
              hi := ((7032208015646559 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1312667737888173 : ℚ) / 20000000000000000)
              hi := ((-3036654969015987 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((1150856057747351 : ℚ) / 125000000000000000)
              hi := ((2683876727516579 : ℚ) / 250000000000000000) }
      im := { lo := ((-7155654406511817 : ℚ) / 1000000000000000000)
              hi := ((-5630131567033353 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6772799338894621 : ℚ) / 5000000000000000000)
              hi := ((-5974558178966011 : ℚ) / 10000000000000000000) }
      im := { lo := ((10594403722509209 : ℚ) / 5000000000000000000)
              hi := ((28761833464090057 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1772133164913121 : ℚ) / 2000000000000000000)
              hi := ((6824659764979093 : ℚ) / 10000000000000000000) }
      im := { lo := ((-359585717927851 : ℚ) / 1000000000000000000)
              hi := ((145285000414187 : ℚ) / 125000000000000000) } }
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

def s084_t4_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((2615342616543867 : ℚ) / 1250000000000000000)
              hi := ((7040685263123767 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6561620272663767 : ℚ) / 100000000000000000)
              hi := ((-6071603598723971 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((229957196057529 : ℚ) / 25000000000000000)
              hi := ((1340838469978151 : ℚ) / 125000000000000000) }
      im := { lo := ((-56007518629089 : ℚ) / 7812500000000000)
              hi := ((-22045739158549 : ℚ) / 3906250000000000) } }
  DrestRect :=
    { re := { lo := ((-13510055282673257 : ℚ) / 10000000000000000000)
              hi := ((-1484837909046917 : ℚ) / 2500000000000000000) }
      im := { lo := ((1060143373098867 : ℚ) / 500000000000000000)
              hi := ((2877557952896467 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4429706063973713 : ℚ) / 5000000000000000000)
              hi := ((6825793730477411 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3595650147091441 : ℚ) / 10000000000000000000)
              hi := ((11622659580832729 : ℚ) / 10000000000000000000) } }
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

def s084_t4_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((1050429169005809 : ℚ) / 500000000000000000)
              hi := ((14098368075982531 : ℚ) / 2000000000000000000) }
      im := { lo := ((-131198062414151 : ℚ) / 2000000000000000)
              hi := ((-6069898571070371 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((9189708869403191 : ℚ) / 1000000000000000000)
              hi := ((669868170179753 : ℚ) / 62500000000000000) }
      im := { lo := ((-3591129121720389 : ℚ) / 500000000000000000)
              hi := ((-707159429325321 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13474491462392947 : ℚ) / 10000000000000000000)
              hi := ((-5904125989656039 : ℚ) / 10000000000000000000) }
      im := { lo := ((132605485621743 : ℚ) / 62500000000000000)
              hi := ((14394637639596863 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8858160743765969 : ℚ) / 10000000000000000000)
              hi := ((682692916141573 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1797721117481799 : ℚ) / 5000000000000000000)
              hi := ((1452814783902403 : ℚ) / 1250000000000000000) } }
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

def s084_t4_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((1054732271202009 : ℚ) / 500000000000000000)
              hi := ((7057703299011393 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3279093565948849 : ℚ) / 50000000000000000)
              hi := ((-15170487406524321 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((9181111870963281 : ℚ) / 1000000000000000000)
              hi := ((428362219170133 : ℚ) / 40000000000000000) }
      im := { lo := ((-575643354926949 : ℚ) / 80000000000000000)
              hi := ((-5670830187673797 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3359726629394701 : ℚ) / 2500000000000000000)
              hi := ((-5868882045441479 : ℚ) / 10000000000000000000) }
      im := { lo := ((2123083905053421 : ℚ) / 1000000000000000000)
              hi := ((2880291971991537 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4428454051544239 : ℚ) / 5000000000000000000)
              hi := ((853507811158489 : ℚ) / 1250000000000000000) }
      im := { lo := ((-1797614244455577 : ℚ) / 5000000000000000000)
              hi := ((2905592787970373 : ℚ) / 2500000000000000000) } }
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

def s084_t4_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((2118092412816883 : ℚ) / 1000000000000000000)
              hi := ((7066243304329597 : ℚ) / 1000000000000000000) }
      im := { lo := ((-102444880214809 : ℚ) / 1562500000000000)
              hi := ((-3033246375314957 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((458624810072289 : ℚ) / 50000000000000000)
              hi := ((2675050682289533 : ℚ) / 250000000000000000) }
      im := { lo := ((-14417626893912813 : ℚ) / 2000000000000000000)
              hi := ((-5684373452430669 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2680660402467647 : ℚ) / 2000000000000000000)
              hi := ((-5833618421634433 : ℚ) / 10000000000000000000) }
      im := { lo := ((4248949921439673 : ℚ) / 2000000000000000000)
              hi := ((28816514734551447 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-442782604098627 : ℚ) / 500000000000000000)
              hi := ((3414595795270029 : ℚ) / 5000000000000000000) }
      im := { lo := ((-449376188245923 : ℚ) / 1250000000000000000)
              hi := ((11622218820761467 : ℚ) / 10000000000000000000) } }
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

def s084_t4_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((10633710481011457 : ℚ) / 5000000000000000000)
              hi := ((7074803871514623 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6554758773289439 : ℚ) / 100000000000000000)
              hi := ((-6064791891748897 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1145482751990093 : ℚ) / 125000000000000000)
              hi := ((10691332343156303 : ℚ) / 1000000000000000000) }
      im := { lo := ((-7222072936602941 : ℚ) / 1000000000000000000)
              hi := ((-5697905022544827 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13367678214773829 : ℚ) / 10000000000000000000)
              hi := ((-144958374344947 : ℚ) / 250000000000000000) }
      im := { lo := ((425172186785593 : ℚ) / 200000000000000000)
              hi := ((28830060297048757 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8854390998166967 : ℚ) / 10000000000000000000)
              hi := ((3415157392433259 : ℚ) / 5000000000000000000) }
      im := { lo := ((-1797394085615843 : ℚ) / 5000000000000000000)
              hi := ((5811032081858079 : ℚ) / 5000000000000000000) } }
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

def s084_t4_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((533853474033673 : ℚ) / 250000000000000000)
              hi := ((7083384685320551 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6553046504496857 : ℚ) / 100000000000000000)
              hi := ((-303154617085513 : ℚ) / 5000000000000000) } }
  D0Rect :=
    { re := { lo := ((2288802526447289 : ℚ) / 250000000000000000)
              hi := ((10682443559791793 : ℚ) / 1000000000000000000) }
      im := { lo := ((-18088300630042331 : ℚ) / 2500000000000000000)
              hi := ((-5711425001178171 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6666016579171749 : ℚ) / 5000000000000000000)
              hi := ((-1152606761702819 : ℚ) / 2000000000000000000) }
      im := { lo := ((5318105165626391 : ℚ) / 2500000000000000000)
              hi := ((1442177696485483 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4426562825799017 : ℚ) / 5000000000000000000)
              hi := ((3415716436177243 : ℚ) / 5000000000000000000) }
      im := { lo := ((-1797285106232213 : ℚ) / 5000000000000000000)
              hi := ((5810956456265817 : ℚ) / 5000000000000000000) } }
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

def s084_t4_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((10720538166102357 : ℚ) / 5000000000000000000)
              hi := ((7091985882577657 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6551335438039883 : ℚ) / 100000000000000000)
              hi := ((-6061394189565783 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((914654023372219 : ℚ) / 100000000000000000)
              hi := ((10673536653753863 : ℚ) / 1000000000000000000) }
      im := { lo := ((-7248555537971163 : ℚ) / 1000000000000000000)
              hi := ((-715616649675189 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13296367938744507 : ℚ) / 10000000000000000000)
              hi := ((-5727713977670473 : ℚ) / 10000000000000000000) }
      im := { lo := ((5321545619281111 : ℚ) / 2500000000000000000)
              hi := ((721424917213873 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-11064822235931 : ℚ) / 12500000000000000)
              hi := ((3416273800675457 : ℚ) / 5000000000000000000) }
      im := { lo := ((-1797173760793203 : ℚ) / 5000000000000000000)
              hi := ((2324351391462873 : ℚ) / 2000000000000000000) } }
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

def s084_t4_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((538205767635877 : ℚ) / 250000000000000000)
              hi := ((710060770042159 : ℚ) / 100000000000000000) }
      im := { lo := ((-20467579927649 : ℚ) / 312500000000000)
              hi := ((-6059697438226701 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4568925838638589 : ℚ) / 500000000000000000)
              hi := ((5332306185148179 : ℚ) / 500000000000000000) }
      im := { lo := ((-7261778657862987 : ℚ) / 1000000000000000000)
              hi := ((-5738429697664999 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13260683891710317 : ℚ) / 10000000000000000000)
              hi := ((-2846187135942739 : ℚ) / 5000000000000000000) }
      im := { lo := ((21299892936100413 : ℚ) / 10000000000000000000)
              hi := ((28870390350662083 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4425292680482051 : ℚ) / 5000000000000000000)
              hi := ((854207115382401 : ℚ) / 1250000000000000000) }
      im := { lo := ((-898529874929133 : ℚ) / 2500000000000000000)
              hi := ((1162159570084397 : ℚ) / 1000000000000000000) } }
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

def s084_t4_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((172924866270831 : ℚ) / 80000000000000000)
              hi := ((14218499014245831 : ℚ) / 2000000000000000000) }
      im := { lo := ((-6547916928911687 : ℚ) / 100000000000000000)
              hi := ((-242320083497497 : ℚ) / 4000000000000000) } }
  D0Rect :=
    { re := { lo := ((9129145232781603 : ℚ) / 1000000000000000000)
              hi := ((2663917488794049 : ℚ) / 250000000000000000) }
      im := { lo := ((-3637494665424211 : ℚ) / 500000000000000000)
              hi := ((-718989341596141 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-264499574145731 : ℚ) / 200000000000000000)
              hi := ((-707127145389923 : ℚ) / 1250000000000000000) }
      im := { lo := ((4262710947391929 : ℚ) / 2000000000000000000)
              hi := ((14441866086694053 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4424653986448779 : ℚ) / 5000000000000000000)
              hi := ((6834760441749427 : ℚ) / 10000000000000000000) }
      im := { lo := ((-4492362438797753 : ℚ) / 12500000000000000000)
              hi := ((1452679118750703 : ℚ) / 1250000000000000000) } }
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

def s084_t4_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((1356449935330159 : ℚ) / 625000000000000000)
              hi := ((711791221069337 : ℚ) / 100000000000000000) }
      im := { lo := ((-818276196826239 : ℚ) / 12500000000000000)
              hi := ((-3028154028646919 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((2280105198340687 : ℚ) / 250000000000000000)
              hi := ((5323354774525447 : ℚ) / 500000000000000000) }
      im := { lo := ((-7288187672818353 : ℚ) / 1000000000000000000)
              hi := ((-5765388133398347 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1318925312617229 : ℚ) / 1000000000000000000)
              hi := ((-1405410515371693 : ℚ) / 2500000000000000000) }
      im := { lo := ((21327167194397797 : ℚ) / 10000000000000000000)
              hi := ((28897022780249647 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4424015045806011 : ℚ) / 5000000000000000000)
              hi := ((3417931315112023 : ℚ) / 5000000000000000000) }
      im := { lo := ((-3593661723255029 : ℚ) / 10000000000000000000)
              hi := ((5810635775501513 : ℚ) / 5000000000000000000) } }
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

def s084_t4_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((4358201938402583 : ℚ) / 2000000000000000000)
              hi := ((3563297581678307 : ℚ) / 500000000000000000) }
      im := { lo := ((-818062933951743 : ℚ) / 12500000000000000)
              hi := ((-30273076994001783 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((455583933673199 : ℚ) / 50000000000000000)
              hi := ((5318865427753893 : ℚ) / 500000000000000000) }
      im := { lo := ((-1825343664617659 : ℚ) / 250000000000000000)
              hi := ((-5778848880726261 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6576754666886477 : ℚ) / 5000000000000000000)
              hi := ((-5586246890692657 : ℚ) / 10000000000000000000) }
      im := { lo := ((21340728978410453 : ℚ) / 10000000000000000000)
              hi := ((2891026343498191 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1769349716372499 : ℚ) / 2000000000000000000)
              hi := ((68369603503567 : ℚ) / 100000000000000000) }
      im := { lo := ((-35934278744709203 : ℚ) / 100000000000000000000)
              hi := ((11621104565640921 : ℚ) / 10000000000000000000) } }
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

def s084_t4_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((1093952013191159 : ℚ) / 500000000000000000)
              hi := ((7135298346896773 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3271399324301317 : ℚ) / 50000000000000000)
              hi := ((-6052924085599859 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((568932427298331 : ℚ) / 62500000000000000)
              hi := ((1328591746209993 : ℚ) / 125000000000000000) }
      im := { lo := ((-1462910066327573 : ℚ) / 200000000000000000)
              hi := ((-5792296897133737 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6558873864640287 : ℚ) / 5000000000000000000)
              hi := ((-1387707855537701 : ℚ) / 2500000000000000000) }
      im := { lo := ((21354239778805947 : ℚ) / 10000000000000000000)
              hi := ((5784690891066601 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8845462404728507 : ℚ) / 10000000000000000000)
              hi := ((1367610512718137 : ℚ) / 2000000000000000000) }
      im := { lo := ((-3593190065825581 : ℚ) / 10000000000000000000)
              hi := ((464837346206789 : ℚ) / 400000000000000000) } }
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

def s084_t4_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((686477666523003 : ℚ) / 312500000000000000)
              hi := ((14288044518349089 : ℚ) / 2000000000000000000) }
      im := { lo := ((-3270547552171089 : ℚ) / 50000000000000000)
              hi := ((-6051234125507027 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((9094141396938487 : ℚ) / 1000000000000000000)
              hi := ((84957750231447 : ℚ) / 8000000000000000) }
      im := { lo := ((-7327713813555711 : ℚ) / 1000000000000000000)
              hi := ((-725716624021227 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6540982880845203 : ℚ) / 5000000000000000000)
              hi := ((-110307966390271 : ℚ) / 200000000000000000) }
      im := { lo := ((534192541714151 : ℚ) / 250000000000000000)
              hi := ((723414840854629 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4422088419703071 : ℚ) / 5000000000000000000)
              hi := ((1367828910519827 : ℚ) / 2000000000000000000) }
      im := { lo := ((-1796475673916049 : ℚ) / 5000000000000000000)
              hi := ((11620761871616093 : ℚ) / 10000000000000000000) } }
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

def s084_t4_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((2205572569549523 : ℚ) / 1000000000000000000)
              hi := ((7152768866007707 : ℚ) / 1000000000000000000) }
      im := { lo := ((-163484821856259 : ℚ) / 2500000000000000)
              hi := ((-6049545490697911 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((9085346129065051 : ℚ) / 1000000000000000000)
              hi := ((10610685563787739 : ℚ) / 1000000000000000000) }
      im := { lo := ((-7340864846044657 : ℚ) / 1000000000000000000)
              hi := ((-2909578690548479 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-521846536058429 : ℚ) / 400000000000000000)
              hi := ((-1369986947361351 : ℚ) / 2500000000000000000) }
      im := { lo := ((2138111444449441 : ℚ) / 1000000000000000000)
              hi := ((723742029040453 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8842904440040353 : ℚ) / 10000000000000000000)
              hi := ((684024886694449 : ℚ) / 1000000000000000000) }
      im := { lo := ((-7185421141183547 : ℚ) / 20000000000000000000)
              hi := ((5810294033886203 : ℚ) / 5000000000000000000) } }
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

def s084_t4_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((22144328866028963 : ℚ) / 10000000000000000000)
              hi := ((89519266521497 : ℚ) / 12500000000000000) }
      im := { lo := ((-1634423032340879 : ℚ) / 25000000000000000)
              hi := ((-6047858006759499 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((9076532862542461 : ℚ) / 1000000000000000000)
              hi := ((5300817254115851 : ℚ) / 500000000000000000) }
      im := { lo := ((-14708006741401049 : ℚ) / 2000000000000000000)
              hi := ((-2333028029982763 : ℚ) / 400000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13010340985784197 : ℚ) / 10000000000000000000)
              hi := ((-5444479600314469 : ℚ) / 10000000000000000000) }
      im := { lo := ((2674309705701037 : ℚ) / 1250000000000000000)
              hi := ((14481358710492639 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8841664041379063 : ℚ) / 10000000000000000000)
              hi := ((6841384347836011 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3592473114207033 : ℚ) / 10000000000000000000)
              hi := ((363138050639099 : ℚ) / 312500000000000000) } }
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

def s084_t4_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((5558281056296607 : ℚ) / 2500000000000000000)
              hi := ((3585168253929671 : ℚ) / 500000000000000000) }
      im := { lo := ((-163399818280451 : ℚ) / 2500000000000000)
              hi := ((-15115429561921719 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((9067701512741281 : ℚ) / 1000000000000000000)
              hi := ((5296282878429757 : ℚ) / 500000000000000000) }
      im := { lo := ((-14734259466153041 : ℚ) / 2000000000000000000)
              hi := ((-292298534046383 : ℚ) / 50000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6487249945749281 : ℚ) / 5000000000000000000)
              hi := ((-2704496282883971 : ℚ) / 5000000000000000000) }
      im := { lo := ((267597376820519 : ℚ) / 125000000000000000)
              hi := ((28975703523041723 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1768087118573459 : ℚ) / 2000000000000000000)
              hi := ((6842530953328667 : ℚ) / 10000000000000000000) }
      im := { lo := ((-718446645785661 : ℚ) / 2000000000000000000)
              hi := ((2905061196463421 : ℚ) / 2500000000000000000) } }
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

def s084_t4_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((60486073903 : ℚ) / 1000000000000)
      ((-349957397 : ℚ) / 1000000000000)
      ((578311217 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((22322140593651857 : ℚ) / 10000000000000000000)
              hi := ((7179151795427993 : ℚ) / 1000000000000000000) }
      im := { lo := ((-163357364841131 : ℚ) / 2500000000000000)
              hi := ((-15111217598005799 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((566178290768069 : ℚ) / 62500000000000000)
              hi := ((10583478748172647 : ℚ) / 1000000000000000000) }
      im := { lo := ((-922530498858839 : ℚ) / 125000000000000000)
              hi := ((-5859359098368127 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3234659791250007 : ℚ) / 2500000000000000000)
              hi := ((-5373487735120667 : ℚ) / 10000000000000000000) }
      im := { lo := ((4284210665489621 : ℚ) / 2000000000000000000)
              hi := ((14494319005949987 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8839203694386399 : ℚ) / 10000000000000000000)
              hi := ((6843673268278461 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3591990714901719 : ℚ) / 10000000000000000000)
              hi := ((145250867088359 : ℚ) / 125000000000000000) } }
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
    (hi : i ∈ positiveBoxSubboxesOf .s084_t4) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s084_t4).constants.mainLower)
      ((positiveBoxCombinedCert .s084_t4).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s084_t4).constants.restUpper) := by
  if h0 : i = .s084_t4_sb000 then
    exact s084_t4_sb000_certificateData
  else if h1 : i = .s084_t4_sb001 then
    exact s084_t4_sb001_certificateData
  else if h2 : i = .s084_t4_sb002 then
    exact s084_t4_sb002_certificateData
  else if h3 : i = .s084_t4_sb003 then
    exact s084_t4_sb003_certificateData
  else if h4 : i = .s084_t4_sb004 then
    exact s084_t4_sb004_certificateData
  else if h5 : i = .s084_t4_sb005 then
    exact s084_t4_sb005_certificateData
  else if h6 : i = .s084_t4_sb006 then
    exact s084_t4_sb006_certificateData
  else if h7 : i = .s084_t4_sb007 then
    exact s084_t4_sb007_certificateData
  else if h8 : i = .s084_t4_sb008 then
    exact s084_t4_sb008_certificateData
  else if h9 : i = .s084_t4_sb009 then
    exact s084_t4_sb009_certificateData
  else if h10 : i = .s084_t4_sb010 then
    exact s084_t4_sb010_certificateData
  else if h11 : i = .s084_t4_sb011 then
    exact s084_t4_sb011_certificateData
  else if h12 : i = .s084_t4_sb012 then
    exact s084_t4_sb012_certificateData
  else if h13 : i = .s084_t4_sb013 then
    exact s084_t4_sb013_certificateData
  else if h14 : i = .s084_t4_sb014 then
    exact s084_t4_sb014_certificateData
  else if h15 : i = .s084_t4_sb015 then
    exact s084_t4_sb015_certificateData
  else if h16 : i = .s084_t4_sb016 then
    exact s084_t4_sb016_certificateData
  else if h17 : i = .s084_t4_sb017 then
    exact s084_t4_sb017_certificateData
  else if h18 : i = .s084_t4_sb018 then
    exact s084_t4_sb018_certificateData
  else if h19 : i = .s084_t4_sb019 then
    exact s084_t4_sb019_certificateData
  else if h20 : i = .s084_t4_sb020 then
    exact s084_t4_sb020_certificateData
  else if h21 : i = .s084_t4_sb021 then
    exact s084_t4_sb021_certificateData
  else if h22 : i = .s084_t4_sb022 then
    exact s084_t4_sb022_certificateData
  else if h23 : i = .s084_t4_sb023 then
    exact s084_t4_sb023_certificateData
  else if h24 : i = .s084_t4_sb024 then
    exact s084_t4_sb024_certificateData
  else if h25 : i = .s084_t4_sb025 then
    exact s084_t4_sb025_certificateData
  else if h26 : i = .s084_t4_sb026 then
    exact s084_t4_sb026_certificateData
  else if h27 : i = .s084_t4_sb027 then
    exact s084_t4_sb027_certificateData
  else if h28 : i = .s084_t4_sb028 then
    exact s084_t4_sb028_certificateData
  else if h29 : i = .s084_t4_sb029 then
    exact s084_t4_sb029_certificateData
  else if h30 : i = .s084_t4_sb030 then
    exact s084_t4_sb030_certificateData
  else if h31 : i = .s084_t4_sb031 then
    exact s084_t4_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S084T4
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
