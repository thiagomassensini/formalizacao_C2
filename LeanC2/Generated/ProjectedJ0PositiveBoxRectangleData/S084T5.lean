import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.84_t5

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
namespace S084T5

open ProjectedJ0RectangleArithmetic

def s084_t5_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((23132454498778353 : ℚ) / 10000000000000000000)
              hi := ((725946238010283 : ℚ) / 100000000000000000) }
      im := { lo := ((-6519072130306121 : ℚ) / 100000000000000000)
              hi := ((-6029383227284543 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4489211405856991 : ℚ) / 500000000000000000)
              hi := ((2625220490238899 : ℚ) / 250000000000000000) }
      im := { lo := ((-149954514888459 : ℚ) / 20000000000000000)
              hi := ((-2989649998256263 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6307519301095683 : ℚ) / 5000000000000000000)
              hi := ((-2526569247040039 : ℚ) / 5000000000000000000) }
      im := { lo := ((4307635892869751 : ℚ) / 2000000000000000000)
              hi := ((3637842518776261 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8828386937772669 : ℚ) / 10000000000000000000)
              hi := ((1713546770019601 : ℚ) / 2500000000000000000) }
      im := { lo := ((-17948929016273183 : ℚ) / 50000000000000000000)
              hi := ((181538598546741 : ℚ) / 156250000000000000) } }
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

def s084_t5_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((1161177195126837 : ℚ) / 500000000000000000)
              hi := ((454280616835061 : ℚ) / 62500000000000000) }
      im := { lo := ((-6517387104991831 : ℚ) / 100000000000000000)
              hi := ((-75346401265149 : ℚ) / 1250000000000000) } }
  D0Rect :=
    { re := { lo := ((8969398653014073 : ℚ) / 1000000000000000000)
              hi := ((10491614466862977 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1877679246122501 : ℚ) / 250000000000000000)
              hi := ((-119851315765861 : ℚ) / 20000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6289493170799613 : ℚ) / 5000000000000000000)
              hi := ((-200698359779881 : ℚ) / 400000000000000000) }
      im := { lo := ((2155094617428007 : ℚ) / 1000000000000000000)
              hi := ((14557579440488003 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4413598979590539 : ℚ) / 5000000000000000000)
              hi := ((6855364028053799 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3589520308968103 : ℚ) / 10000000000000000000)
              hi := ((2323654475455929 : ℚ) / 2000000000000000000) } }
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

def s084_t5_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((1165741631072487 : ℚ) / 500000000000000000)
              hi := ((7277539141632367 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3257851696109773 : ℚ) / 50000000000000000)
              hi := ((-6026042365768983 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8960356366031673 : ℚ) / 1000000000000000000)
              hi := ((5241164843119859 : ℚ) / 500000000000000000) }
      im := { lo := ((-1504739177370961 : ℚ) / 200000000000000000)
              hi := ((-3002909552019867 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-24497884784153 : ℚ) / 19531250000000000)
              hi := ((-4981760677460147 : ℚ) / 10000000000000000000) }
      im := { lo := ((2695457623975503 : ℚ) / 1250000000000000000)
              hi := ((116510111983523 : ℚ) / 40000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8826014899351719 : ℚ) / 10000000000000000000)
              hi := ((1714136519474327 : ℚ) / 2500000000000000000) }
      im := { lo := ((-17946244917064547 : ℚ) / 50000000000000000000)
              hi := ((11618068670323427 : ℚ) / 10000000000000000000) } }
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

def s084_t5_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((1170316353158401 : ℚ) / 500000000000000000)
              hi := ((14573219397290187 : ℚ) / 2000000000000000000) }
      im := { lo := ((-1628505235196107 : ℚ) / 25000000000000000)
              hi := ((-7530467599221013 : ℚ) / 125000000000000000) } }
  D0Rect :=
    { re := { lo := ((2237824077874537 : ℚ) / 250000000000000000)
              hi := ((10473027328424719 : ℚ) / 1000000000000000000) }
      im := { lo := ((-7536661960811177 : ℚ) / 1000000000000000000)
              hi := ((-3009530182526939 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-12506828739946743 : ℚ) / 10000000000000000000)
              hi := ((-4946045648248597 : ℚ) / 10000000000000000000) }
      im := { lo := ((21576325794216947 : ℚ) / 10000000000000000000)
              hi := ((14569922787741041 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2206209237364097 : ℚ) / 2500000000000000000)
              hi := ((1714433102489013 : ℚ) / 2500000000000000000) }
      im := { lo := ((-56077684380069 : ℚ) / 156250000000000000)
              hi := ((1452232395074069 : ℚ) / 1250000000000000000) } }
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

def s084_t5_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((73431375390461 : ℚ) / 31250000000000000)
              hi := ((3647850057623451 : ℚ) / 500000000000000000) }
      im := { lo := ((-1302467951039137 : ℚ) / 20000000000000000)
              hi := ((-6022707239181763 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((27944433637473 : ℚ) / 3125000000000000)
              hi := ((10463707134455167 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3774807716597611 : ℚ) / 500000000000000000)
              hi := ((-188509040930783 : ℚ) / 31250000000000000) } }
  DrestRect :=
    { re := { lo := ((-12470721691458199 : ℚ) / 10000000000000000000)
              hi := ((-491031384134963 : ℚ) / 1000000000000000000) }
      im := { lo := ((10794470390228547 : ℚ) / 5000000000000000000)
              hi := ((29152111369406177 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8823655141924609 : ℚ) / 10000000000000000000)
              hi := ((6858914065018691 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3588691141470553 : ℚ) / 10000000000000000000)
              hi := ((11617646230148917 : ℚ) / 10000000000000000000) } }
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

def s084_t5_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((1179498375814579 : ℚ) / 500000000000000000)
              hi := ((7304810861756157 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1627664977001229 : ℚ) / 25000000000000000)
              hi := ((-6021041783629163 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((446656188051441 : ℚ) / 50000000000000000)
              hi := ((5227184550093883 : ℚ) / 500000000000000000) }
      im := { lo := ((-1512511204844431 : ℚ) / 200000000000000000)
              hi := ((-6045506164409473 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2486919036360297 : ℚ) / 2000000000000000000)
              hi := ((-9749132179903147 : ℚ) / 20000000000000000000) }
      im := { lo := ((10800753261729363 : ℚ) / 5000000000000000000)
              hi := ((2916432474275419 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8822471582722513 : ℚ) / 10000000000000000000)
              hi := ((6860093145904923 : ℚ) / 10000000000000000000) }
      im := { lo := ((-17942061511020847 : ℚ) / 50000000000000000000)
              hi := ((11617435178777617 : ℚ) / 10000000000000000000) } }
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

def s084_t5_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((4736419031108629 : ℚ) / 2000000000000000000)
              hi := ((3656971620951521 : ℚ) / 500000000000000000) }
      im := { lo := ((-1627245362448201 : ℚ) / 25000000000000000)
              hi := ((-12038755320423293 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((8924010793557239 : ℚ) / 1000000000000000000)
              hi := ((10445013771786167 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3787742151975683 : ℚ) / 500000000000000000)
              hi := ((-6058710312272927 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-193725813944049 : ℚ) / 156250000000000000)
              hi := ((-4838799660332833 : ℚ) / 10000000000000000000) }
      im := { lo := ((21614020236682217 : ℚ) / 10000000000000000000)
              hi := ((5835297687620887 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4410645903643259 : ℚ) / 5000000000000000000)
              hi := ((1372255038742843 : ℚ) / 2000000000000000000) }
      im := { lo := ((-1794066157789027 : ℚ) / 5000000000000000000)
              hi := ((11617223036847109 : ℚ) / 10000000000000000000) } }
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

def s084_t5_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((5943609401303163 : ℚ) / 2500000000000000000)
              hi := ((292923833571229 : ℚ) / 40000000000000000) }
      im := { lo := ((-3253652131859537 : ℚ) / 50000000000000000)
              hi := ((-12035429986665569 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((445743989173941 : ℚ) / 50000000000000000)
              hi := ((10435641259991423 : ℚ) / 1000000000000000000) }
      im := { lo := ((-7588400061094549 : ℚ) / 1000000000000000000)
              hi := ((-6071901926264917 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1545286518772953 : ℚ) / 1250000000000000000)
              hi := ((-48030149549137003 : ℚ) / 100000000000000000000) }
      im := { lo := ((34602371279091 : ℚ) / 16000000000000000)
              hi := ((29188602291170033 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4410053815955307 : ℚ) / 5000000000000000000)
              hi := ((6862452021572741 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3587846520424069 : ℚ) / 10000000000000000000)
              hi := ((11617005146245243 : ℚ) / 10000000000000000000) } }
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

def s084_t5_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((1193349708918457 : ℚ) / 500000000000000000)
              hi := ((3666134351863981 : ℚ) / 500000000000000000) }
      im := { lo := ((-650562842177331 : ℚ) / 10000000000000000)
              hi := ((-376003357334857 : ℚ) / 6250000000000000) } }
  D0Rect :=
    { re := { lo := ((1781146201266869 : ℚ) / 200000000000000000)
              hi := ((5213125658254783 : ℚ) / 500000000000000000) }
      im := { lo := ((-3040521410517159 : ℚ) / 400000000000000000)
              hi := ((-6085080707198311 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-12326115617514613 : ℚ) / 10000000000000000000)
              hi := ((-47672118707151663 : ℚ) / 100000000000000000000) }
      im := { lo := ((432777841595573 : ℚ) / 200000000000000000)
              hi := ((29200666086191397 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1102364881270441 : ℚ) / 1250000000000000000)
              hi := ((171590590601743 : ℚ) / 250000000000000000) }
      im := { lo := ((-35875587074184087 : ℚ) / 100000000000000000000)
              hi := ((11616785298772857 : ℚ) / 10000000000000000000) } }
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

def s084_t5_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((2395976306387169 : ℚ) / 1000000000000000000)
              hi := ((7341461926096529 : ℚ) / 1000000000000000000) }
      im := { lo := ((-40649711986019 : ℚ) / 625000000000000)
              hi := ((-1503598460470231 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((889656509742811 : ℚ) / 100000000000000000)
              hi := ((520842167413859 : ℚ) / 50000000000000000) }
      im := { lo := ((-7614193920167041 : ℚ) / 1000000000000000000)
              hi := ((-6098247406394953 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3072479770214283 : ℚ) / 2500000000000000000)
              hi := ((-4731393954960343 : ℚ) / 10000000000000000000) }
      im := { lo := ((10825626852915989 : ℚ) / 5000000000000000000)
              hi := ((14606338220761379 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8817731199295671 : ℚ) / 10000000000000000000)
              hi := ((6864795142815627 : ℚ) / 10000000000000000000) }
      im := { lo := ((-17936362945650337 : ℚ) / 50000000000000000000)
              hi := ((5808283604149029 : ℚ) / 5000000000000000000) } }
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

def s084_t5_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((3006593099568377 : ℚ) / 1250000000000000000)
              hi := ((459417217164219 : ℚ) / 62500000000000000) }
      im := { lo := ((-1625570187016839 : ℚ) / 25000000000000000)
              hi := ((-6012735370970999 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1777476380098799 : ℚ) / 200000000000000000)
              hi := ((416296702030403 : ℚ) / 40000000000000000) }
      im := { lo := ((-7627071259595043 : ℚ) / 1000000000000000000)
              hi := ((-6111401953606299 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2450740624284243 : ℚ) / 2000000000000000000)
              hi := ((-1173890196890803 : ℚ) / 2500000000000000000) }
      im := { lo := ((21663566311625527 : ℚ) / 10000000000000000000)
              hi := ((1461231695980163 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4408271439146943 : ℚ) / 5000000000000000000)
              hi := ((137319307494911 : ℚ) / 200000000000000000) }
      im := { lo := ((-1793493797716691 : ℚ) / 5000000000000000000)
              hi := ((5808175151369719 : ℚ) / 5000000000000000000) } }
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

def s084_t5_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((24145942305980567 : ℚ) / 10000000000000000000)
              hi := ((7359909017060921 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3250304464380991 : ℚ) / 50000000000000000)
              hi := ((-601107830317127 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((1109772698557369 : ℚ) / 125000000000000000)
              hi := ((2079594756212241 : ℚ) / 200000000000000000) }
      im := { lo := ((-7639935598339399 : ℚ) / 1000000000000000000)
              hi := ((-382784015047199 : ℚ) / 62500000000000000) } }
  DrestRect :=
    { re := { lo := ((-3054366924896563 : ℚ) / 2500000000000000000)
              hi := ((-2329856276917269 : ℚ) / 5000000000000000000) }
      im := { lo := ((4335166027016799 : ℚ) / 2000000000000000000)
              hi := ((29236538214797757 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8815352329528323 : ℚ) / 10000000000000000000)
              hi := ((6867132564020473 : ℚ) / 10000000000000000000) }
      im := { lo := ((-224169050878973 : ℚ) / 625000000000000000)
              hi := ((1161613567664141 : ℚ) / 1000000000000000000) } }
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

def s084_t5_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((484787017374507 : ℚ) / 200000000000000000)
              hi := ((1842290748150661 : ℚ) / 250000000000000000) }
      im := { lo := ((-812367299604109 : ℚ) / 12500000000000000)
              hi := ((-30047113491405743 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((277155121732651 : ℚ) / 31250000000000000)
              hi := ((5194256163704193 : ℚ) / 500000000000000000) }
      im := { lo := ((-7652787039850391 : ℚ) / 1000000000000000000)
              hi := ((-6137674127430847 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-12181213809493731 : ℚ) / 10000000000000000000)
              hi := ((-2311924183990467 : ℚ) / 5000000000000000000) }
      im := { lo := ((4337608821899693 : ℚ) / 2000000000000000000)
              hi := ((584967806958459 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8814162794236733 : ℚ) / 10000000000000000000)
              hi := ((6868299953902119 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3586417723171717 : ℚ) / 10000000000000000000)
              hi := ((5807958402549667 : ℚ) / 5000000000000000000) } }
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

def s084_t5_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((24332970441046033 : ℚ) / 10000000000000000000)
              hi := ((3689218703184133 : ℚ) / 500000000000000000) }
      im := { lo := ((-3248634590954897 : ℚ) / 50000000000000000)
              hi := ((-12015537067699661 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((1107466116196783 : ℚ) / 125000000000000000)
              hi := ((1297379140820417 : ℚ) / 125000000000000000) }
      im := { lo := ((-3832812975322643 : ℚ) / 500000000000000000)
              hi := ((-6150791204667437 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1518117804946971 : ℚ) / 1250000000000000000)
              hi := ((-2293983699189517 : ℚ) / 5000000000000000000) }
      im := { lo := ((21700207629403727 : ℚ) / 10000000000000000000)
              hi := ((2926019089829563 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4406486908456341 : ℚ) / 5000000000000000000)
              hi := ((1717366771891 : ℚ) / 2500000000000000) }
      im := { lo := ((-1793063126247567 : ℚ) / 5000000000000000000)
              hi := ((2903923405132349 : ℚ) / 2500000000000000000) } }
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

def s084_t5_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((24426798245641567 : ℚ) / 10000000000000000000)
              hi := ((461733280238803 : ℚ) / 62500000000000000) }
      im := { lo := ((-324780073458659 : ℚ) / 5000000000000000)
              hi := ((-30030578141003777 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((2212619216399207 : ℚ) / 250000000000000000)
              hi := ((10369536043936577 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1919613400509323 : ℚ) / 250000000000000000)
              hi := ((-1540973533039699 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1210865703745819 : ℚ) / 1000000000000000000)
              hi := ((-22760331902001873 : ℚ) / 50000000000000000000) }
      im := { lo := ((2171231828162303 : ℚ) / 1000000000000000000)
              hi := ((2927194219781757 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-881178265098653 : ℚ) / 1000000000000000000)
              hi := ((3435315610425723 : ℚ) / 5000000000000000000) }
      im := { lo := ((-71716732304627 : ℚ) / 200000000000000000)
              hi := ((2903868083876691 : ℚ) / 2500000000000000000) } }
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

def s084_t5_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((12260419026503173 : ℚ) / 5000000000000000000)
              hi := ((1479409564173737 : ℚ) / 200000000000000000) }
      im := { lo := ((-1623483824476063 : ℚ) / 25000000000000000)
              hi := ((-6004463953538829 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((884120776948681 : ℚ) / 100000000000000000)
              hi := ((2072004207553197 : ℚ) / 200000000000000000) }
      im := { lo := ((-7691269129166633 : ℚ) / 1000000000000000000)
              hi := ((-6176983750582691 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6036177564755313 : ℚ) / 5000000000000000000)
              hi := ((-45161478831833783 : ℚ) / 100000000000000000000) }
      im := { lo := ((2172437804531103 : ℚ) / 1000000000000000000)
              hi := ((292836422474341 : ℚ) / 100000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4405293342476353 : ℚ) / 5000000000000000000)
              hi := ((214743428043399 : ℚ) / 312500000000000000) }
      im := { lo := ((-717111362465433 : ℚ) / 2000000000000000000)
              hi := ((2323052201048469 : ℚ) / 2000000000000000000) } }
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

def s084_t5_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((4923018528213633 : ℚ) / 2000000000000000000)
              hi := ((37031915653484393 : ℚ) / 5000000000000000000) }
      im := { lo := ((-1298454104915511 : ℚ) / 20000000000000000)
              hi := ((-7503517063412457 : ℚ) / 125000000000000000) } }
  D0Rect :=
    { re := { lo := ((1103990182205739 : ℚ) / 125000000000000000)
              hi := ((10350488334573337 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3852036015213987 : ℚ) / 500000000000000000)
              hi := ((-1238012098500231 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2407207186666109 : ℚ) / 2000000000000000000)
              hi := ((-448021287844613 : ℚ) / 1000000000000000000) }
      im := { lo := ((869455492357029 : ℚ) / 400000000000000000)
              hi := ((1171811623273809 : ℚ) / 400000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-68823335725791 : ℚ) / 78125000000000000)
              hi := ((6872943065455239 : ℚ) / 10000000000000000000) }
      im := { lo := ((-448159906496851 : ℚ) / 1250000000000000000)
              hi := ((2903763139936501 : ℚ) / 2500000000000000000) } }
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

def s084_t5_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((2470956108471941 : ℚ) / 1000000000000000000)
              hi := ((926967315022009 : ℚ) / 125000000000000000) }
      im := { lo := ((-1622651768050671 : ℚ) / 25000000000000000)
              hi := ((-2400465919245571 : ℚ) / 40000000000000000) } }
  D0Rect :=
    { re := { lo := ((2205654439722119 : ℚ) / 250000000000000000)
              hi := ((413637525256821 : ℚ) / 40000000000000000) }
      im := { lo := ((-7716862294013823 : ℚ) / 1000000000000000000)
              hi := ((-3101562170534343 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-187495311009769 : ℚ) / 156250000000000000)
              hi := ((-2222130507181061 : ℚ) / 5000000000000000000) }
      im := { lo := ((2174834553422661 : ℚ) / 1000000000000000000)
              hi := ((14653443856712607 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8808184539974917 : ℚ) / 10000000000000000000)
              hi := ((6874092901450959 : ℚ) / 10000000000000000000) }
      im := { lo := ((-8962494384352281 : ℚ) / 25000000000000000000)
              hi := ((1161484024344511 : ℚ) / 1000000000000000000) } }
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

def s084_t5_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((620105400674679 : ℚ) / 250000000000000000)
              hi := ((7425116552681903 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1622236284311757 : ℚ) / 25000000000000000)
              hi := ((-11999034440792411 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((1101662055558293 : ℚ) / 125000000000000000)
              hi := ((5165685345654701 : ℚ) / 500000000000000000) }
      im := { lo := ((-7729639722840227 : ℚ) / 1000000000000000000)
              hi := ((-6216175440162891 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-239266943332943 : ℚ) / 200000000000000000)
              hi := ((-881658463959419 : ℚ) / 2000000000000000000) }
      im := { lo := ((1360015772691773 : ℚ) / 625000000000000000)
              hi := ((3664804242608513 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-880699355466531 : ℚ) / 1000000000000000000)
              hi := ((3437626691760793 : ℚ) / 5000000000000000000) }
      im := { lo := ((-896180152739817 : ℚ) / 2500000000000000000)
              hi := ((11614632360715397 : ℚ) / 10000000000000000000) } }
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

def s084_t5_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((1244954013229459 : ℚ) / 500000000000000000)
              hi := ((3717257546464093 : ℚ) / 500000000000000000) }
      im := { lo := ((-1297456910892083 : ℚ) / 20000000000000000)
              hi := ((-11995742135020529 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((2200989416864909 : ℚ) / 250000000000000000)
              hi := ((516089295173417 : ℚ) / 50000000000000000) }
      im := { lo := ((-3871202183182079 : ℚ) / 500000000000000000)
              hi := ((-1557303425214389 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-11926977705416439 : ℚ) / 10000000000000000000)
              hi := ((-21861534785835477 : ℚ) / 50000000000000000000) }
      im := { lo := ((10886054003668667 : ℚ) / 5000000000000000000)
              hi := ((916560282137859 : ℚ) / 312500000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8805801951683693 : ℚ) / 10000000000000000000)
              hi := ((6876412436843249 : ℚ) / 10000000000000000000) }
      im := { lo := ((-716888207333763 : ℚ) / 2000000000000000000)
              hi := ((464576884540349 : ℚ) / 400000000000000000) } }
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

def s084_t5_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((12497073494314307 : ℚ) / 5000000000000000000)
              hi := ((7443934656007691 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6485625476384543 : ℚ) / 100000000000000000)
              hi := ((-11992452419570157 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((109932517969591 : ℚ) / 12500000000000000)
              hi := ((2062436758538301 : ℚ) / 200000000000000000) }
      im := { lo := ((-7755156486725003 : ℚ) / 1000000000000000000)
              hi := ((-3121119396034563 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-11890592463225007 : ℚ) / 10000000000000000000)
              hi := ((-4336304157527537 : ℚ) / 10000000000000000000) }
      im := { lo := ((21783911763554853 : ℚ) / 10000000000000000000)
              hi := ((586827471827901 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-352184422492049 : ℚ) / 400000000000000000)
              hi := ((687757090196861 : ℚ) / 1000000000000000000) }
      im := { lo := ((-17920832611165733 : ℚ) / 50000000000000000000)
              hi := ((5807108502219739 : ℚ) / 5000000000000000000) } }
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

def s084_t5_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((2508943137255537 : ℚ) / 1000000000000000000)
              hi := ((9316717241333257 : ℚ) / 1250000000000000000) }
      im := { lo := ((-3241983842475397 : ℚ) / 50000000000000000)
              hi := ((-5994582857434643 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8785228022430591 : ℚ) / 1000000000000000000)
              hi := ((10302564121387863 : ℚ) / 1000000000000000000) }
      im := { lo := ((-7767895661725759 : ℚ) / 1000000000000000000)
              hi := ((-1251050222126849 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-11854189792339471 : ℚ) / 10000000000000000000)
              hi := ((-21501428380907273 : ℚ) / 50000000000000000000) }
      im := { lo := ((21795665220203397 : ℚ) / 10000000000000000000)
              hi := ((234822128215963 : ℚ) / 80000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-14085464148481 : ℚ) / 16000000000000000)
              hi := ((1375744896116481 : ℚ) / 2000000000000000000) }
      im := { lo := ((-8959717593277829 : ℚ) / 25000000000000000000)
              hi := ((4536721483437 : ℚ) / 3906250000000000) } }
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

def s084_t5_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((12592465831122487 : ℚ) / 5000000000000000000)
              hi := ((3731416317734063 : ℚ) / 500000000000000000) }
      im := { lo := ((-3241155586793143 : ℚ) / 50000000000000000)
              hi := ((-14982352561929601 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((4387918511504757 : ℚ) / 500000000000000000)
              hi := ((2058585464857977 : ℚ) / 200000000000000000) }
      im := { lo := ((-778062152586229 : ℚ) / 100000000000000000)
              hi := ((-3134125481328483 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-29544424299739 : ℚ) / 25000000000000000)
              hi := ((-8528503298307359 : ℚ) / 20000000000000000000) }
      im := { lo := ((10903683942533487 : ℚ) / 5000000000000000000)
              hi := ((5872821351776471 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1100276874618419 : ℚ) / 1250000000000000000)
              hi := ((6879872628471791 : ℚ) / 10000000000000000000) }
      im := { lo := ((-8959007181373359 : ℚ) / 25000000000000000000)
              hi := ((2903448096481473 : ℚ) / 2500000000000000000) } }
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

def s084_t5_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((158004027189971 : ℚ) / 62500000000000000)
              hi := ((1868077866065589 : ℚ) / 250000000000000000) }
      im := { lo := ((-6480656070517271 : ℚ) / 100000000000000000)
              hi := ((-2995650295850373 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((8766429152045379 : ℚ) / 1000000000000000000)
              hi := ((2056654545266461 : ℚ) / 200000000000000000) }
      im := { lo := ((-62346674475313 : ℚ) / 8000000000000000)
              hi := ((-6281238086456667 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-11781331514195453 : ℚ) / 10000000000000000000)
              hi := ((-1057050734350007 : ℚ) / 2500000000000000000) }
      im := { lo := ((4363804237166557 : ℚ) / 2000000000000000000)
              hi := ((29375394343734143 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8801013197205621 : ℚ) / 10000000000000000000)
              hi := ((1376203654277727 : ℚ) / 2000000000000000000) }
      im := { lo := ((-716664361991169 : ℚ) / 2000000000000000000)
              hi := ((290339523885403 : ℚ) / 250000000000000000) } }
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

def s084_t5_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((1268828663179921 : ℚ) / 500000000000000000)
              hi := ((1870452460769957 : ℚ) / 250000000000000000) }
      im := { lo := ((-809875282952223 : ℚ) / 12500000000000000)
              hi := ((-11979323343872493 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((8757004274822129 : ℚ) / 1000000000000000000)
              hi := ((10273600494296363 : ℚ) / 1000000000000000000) }
      im := { lo := ((-7806033750678463 : ℚ) / 1000000000000000000)
              hi := ((-15735531700218769 : ℚ) / 2500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4697949971641 : ℚ) / 4000000000000000)
              hi := ((-8384279898582237 : ℚ) / 20000000000000000000) }
      im := { lo := ((10915312574972763 : ℚ) / 5000000000000000000)
              hi := ((7346657168198329 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1759961738842109 : ℚ) / 2000000000000000000)
              hi := ((275286416515047 : ℚ) / 400000000000000000) }
      im := { lo := ((-7166075025162303 : ℚ) / 20000000000000000000)
              hi := ((11613366367583073 : ℚ) / 10000000000000000000) } }
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

def s084_t5_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((25472697037530827 : ℚ) / 10000000000000000000)
              hi := ((936416259041943 : ℚ) / 125000000000000000) }
      im := { lo := ((-1295469978507549 : ℚ) / 20000000000000000)
              hi := ((-5988024132054117 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1749512381279559 : ℚ) / 200000000000000000)
              hi := ((5131955575403107 : ℚ) / 500000000000000000) }
      im := { lo := ((-781872110137229 : ℚ) / 100000000000000000)
              hi := ((-3153586728596293 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-11708404709266603 : ℚ) / 10000000000000000000)
              hi := ((-519507259095553 : ℚ) / 1250000000000000000) }
      im := { lo := ((2184217561205783 : ℚ) / 1000000000000000000)
              hi := ((5879562778098907 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1759722196345873 : ℚ) / 2000000000000000000)
              hi := ((1376661707170807 : ℚ) / 2000000000000000000) }
      im := { lo := ((-895686927201171 : ℚ) / 2500000000000000000)
              hi := ((1161314635309461 : ℚ) / 1000000000000000000) } }
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

def s084_t5_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((127845140381951 : ℚ) / 50000000000000000)
              hi := ((3750435351922849 : ℚ) / 500000000000000000) }
      im := { lo := ((-1618924759846549 : ℚ) / 25000000000000000)
              hi := ((-748298486724667 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((1092262792560639 : ℚ) / 125000000000000000)
              hi := ((10254204437170497 : ℚ) / 1000000000000000000) }
      im := { lo := ((-783139703256259 : ℚ) / 100000000000000000)
              hi := ((-6320119688129871 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-11671922328620593 : ℚ) / 10000000000000000000)
              hi := ((-2059977997114553 : ℚ) / 5000000000000000000) }
      im := { lo := ((2185367181569217 : ℚ) / 1000000000000000000)
              hi := ((7352237671182227 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1759481807729267 : ℚ) / 2000000000000000000)
              hi := ((6884451631205061 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1432983206303987 : ℚ) / 4000000000000000000)
              hi := ((11612926529388629 : ℚ) / 10000000000000000000) } }
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

def s084_t5_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((1283278417007919 : ℚ) / 500000000000000000)
              hi := ((3755215756377959 : ℚ) / 500000000000000000) }
      im := { lo := ((-20231404851379 : ℚ) / 312500000000000)
              hi := ((-748094139285973 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((2182156346992869 : ℚ) / 250000000000000000)
              hi := ((2561120143182551 : ℚ) / 250000000000000000) }
      im := { lo := ((-392202992105637 : ℚ) / 50000000000000000)
              hi := ((-395815815207013 : ℚ) / 62500000000000000) } }
  DrestRect :=
    { re := { lo := ((-2908855876814093 : ℚ) / 2500000000000000000)
              hi := ((-40838381108528917 : ℚ) / 100000000000000000000) }
      im := { lo := ((2186511679435337 : ℚ) / 1000000000000000000)
              hi := ((14710017998566297 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8796205310063693 : ℚ) / 10000000000000000000)
              hi := ((6885592145220421 : ℚ) / 10000000000000000000) }
      im := { lo := ((-55971347953191 : ℚ) / 156250000000000000)
              hi := ((1161270473425283 : ℚ) / 1000000000000000000) } }
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

def s084_t5_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((5152464690529479 : ℚ) / 2000000000000000000)
              hi := ((1880002996593699 : ℚ) / 250000000000000000) }
      im := { lo := ((-6472401402980973 : ℚ) / 100000000000000000)
              hi := ((-11966239655539 : ℚ) / 200000000000000) } }
  D0Rect :=
    { re := { lo := ((544945706864513 : ℚ) / 62500000000000000)
              hi := ((511736966924157 : ℚ) / 50000000000000000) }
      im := { lo := ((-7856709929673241 : ℚ) / 1000000000000000000)
              hi := ((-12691946104450947 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-579945452902893 : ℚ) / 500000000000000000)
              hi := ((-5059629749305443 : ℚ) / 12500000000000000000) }
      im := { lo := ((2734563781580043 : ℚ) / 1250000000000000000)
              hi := ((588621400830499 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8794997440905619 : ℚ) / 10000000000000000000)
              hi := ((688672771899851 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3581869276982897 : ℚ) / 10000000000000000000)
              hi := ((1161247777634883 : ℚ) / 1000000000000000000) } }
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

def s084_t5_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((646481841131811 : ℚ) / 250000000000000000)
              hi := ((7529614028835401 : ℚ) / 1000000000000000000) }
      im := { lo := ((-12941509268303 : ℚ) / 200000000000000)
              hi := ((-373842999495303 : ℚ) / 6250000000000000) } }
  D0Rect :=
    { re := { lo := ((2177404985900737 : ℚ) / 250000000000000000)
              hi := ((5112490464048297 : ℚ) / 500000000000000000) }
      im := { lo := ((-7869346877124381 : ℚ) / 1000000000000000000)
              hi := ((-3179440059984707 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-11562378243291649 : ℚ) / 10000000000000000000)
              hi := ((-40115538908932477 : ℚ) / 100000000000000000000) }
      im := { lo := ((4377570515066381 : ℚ) / 2000000000000000000)
              hi := ((368025655543009 : ℚ) / 125000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-70350386107719 : ℚ) / 80000000000000000)
              hi := ((3443935594298517 : ℚ) / 5000000000000000000) }
      im := { lo := ((-3581567702437117 : ℚ) / 10000000000000000000)
              hi := ((2322449263791877 : ℚ) / 2000000000000000000) } }
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

def s084_t5_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((259564334814867 : ℚ) / 100000000000000000)
              hi := ((3769618091126563 : ℚ) / 500000000000000000) }
      im := { lo := ((-6469109209370419 : ℚ) / 100000000000000000)
              hi := ((-2989928827935533 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((4350045870630719 : ℚ) / 500000000000000000)
              hi := ((10215204921919187 : ℚ) / 1000000000000000000) }
      im := { lo := ((-197049256240003 : ℚ) / 25000000000000000)
              hi := ((-3185887304647633 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-11525829081838357 : ℚ) / 10000000000000000000)
              hi := ((-3975390540726783 : ℚ) / 10000000000000000000) }
      im := { lo := ((5474786451872631 : ℚ) / 2500000000000000000)
              hi := ((5890596212242521 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-351704025112743 : ℚ) / 400000000000000000)
              hi := ((53820432841837 : ℚ) / 78125000000000000) }
      im := { lo := ((-3581264289327201 : ℚ) / 10000000000000000000)
              hi := ((11612013110549337 : ℚ) / 10000000000000000000) } }
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

def s084_t5_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((59839033983 : ℚ) / 1000000000000)
      ((-190642103 : ℚ) / 500000000000)
      ((115055353 : ℚ) / 25000000000) where
  MRect :=
    { re := { lo := ((651345267886361 : ℚ) / 250000000000000000)
              hi := ((7548877625681071 : ℚ) / 1000000000000000000) }
      im := { lo := ((-404216570556833 : ℚ) / 6250000000000000)
              hi := ((-5978228815878713 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((869054674239099 : ℚ) / 100000000000000000)
              hi := ((10205411330863437 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3947290230127037 : ℚ) / 500000000000000000)
              hi := ((-3192328032509899 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-11489262857865951 : ℚ) / 10000000000000000000)
              hi := ((-196960631573501 : ℚ) / 500000000000000000) }
      im := { lo := ((5477597262288509 : ℚ) / 2500000000000000000)
              hi := ((184149104859941 : ℚ) / 62500000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1758279649742367 : ℚ) / 2000000000000000000)
              hi := ((275606163224359 : ℚ) / 400000000000000000) }
      im := { lo := ((-3580958757304289 : ℚ) / 10000000000000000000)
              hi := ((2322355573404823 : ℚ) / 2000000000000000000) } }
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
    (hi : i ∈ positiveBoxSubboxesOf .s084_t5) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s084_t5).constants.mainLower)
      ((positiveBoxCombinedCert .s084_t5).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s084_t5).constants.restUpper) := by
  if h0 : i = .s084_t5_sb000 then
    exact s084_t5_sb000_certificateData
  else if h1 : i = .s084_t5_sb001 then
    exact s084_t5_sb001_certificateData
  else if h2 : i = .s084_t5_sb002 then
    exact s084_t5_sb002_certificateData
  else if h3 : i = .s084_t5_sb003 then
    exact s084_t5_sb003_certificateData
  else if h4 : i = .s084_t5_sb004 then
    exact s084_t5_sb004_certificateData
  else if h5 : i = .s084_t5_sb005 then
    exact s084_t5_sb005_certificateData
  else if h6 : i = .s084_t5_sb006 then
    exact s084_t5_sb006_certificateData
  else if h7 : i = .s084_t5_sb007 then
    exact s084_t5_sb007_certificateData
  else if h8 : i = .s084_t5_sb008 then
    exact s084_t5_sb008_certificateData
  else if h9 : i = .s084_t5_sb009 then
    exact s084_t5_sb009_certificateData
  else if h10 : i = .s084_t5_sb010 then
    exact s084_t5_sb010_certificateData
  else if h11 : i = .s084_t5_sb011 then
    exact s084_t5_sb011_certificateData
  else if h12 : i = .s084_t5_sb012 then
    exact s084_t5_sb012_certificateData
  else if h13 : i = .s084_t5_sb013 then
    exact s084_t5_sb013_certificateData
  else if h14 : i = .s084_t5_sb014 then
    exact s084_t5_sb014_certificateData
  else if h15 : i = .s084_t5_sb015 then
    exact s084_t5_sb015_certificateData
  else if h16 : i = .s084_t5_sb016 then
    exact s084_t5_sb016_certificateData
  else if h17 : i = .s084_t5_sb017 then
    exact s084_t5_sb017_certificateData
  else if h18 : i = .s084_t5_sb018 then
    exact s084_t5_sb018_certificateData
  else if h19 : i = .s084_t5_sb019 then
    exact s084_t5_sb019_certificateData
  else if h20 : i = .s084_t5_sb020 then
    exact s084_t5_sb020_certificateData
  else if h21 : i = .s084_t5_sb021 then
    exact s084_t5_sb021_certificateData
  else if h22 : i = .s084_t5_sb022 then
    exact s084_t5_sb022_certificateData
  else if h23 : i = .s084_t5_sb023 then
    exact s084_t5_sb023_certificateData
  else if h24 : i = .s084_t5_sb024 then
    exact s084_t5_sb024_certificateData
  else if h25 : i = .s084_t5_sb025 then
    exact s084_t5_sb025_certificateData
  else if h26 : i = .s084_t5_sb026 then
    exact s084_t5_sb026_certificateData
  else if h27 : i = .s084_t5_sb027 then
    exact s084_t5_sb027_certificateData
  else if h28 : i = .s084_t5_sb028 then
    exact s084_t5_sb028_certificateData
  else if h29 : i = .s084_t5_sb029 then
    exact s084_t5_sb029_certificateData
  else if h30 : i = .s084_t5_sb030 then
    exact s084_t5_sb030_certificateData
  else if h31 : i = .s084_t5_sb031 then
    exact s084_t5_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S084T5
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
