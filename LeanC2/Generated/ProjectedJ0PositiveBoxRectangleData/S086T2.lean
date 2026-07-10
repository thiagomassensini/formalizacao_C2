import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.86_t2

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
namespace S086T2

open ProjectedJ0RectangleArithmetic

def s086_t2_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4361874405572387 : ℚ) / 1000000000000000000)
              hi := ((8642460394921761 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6787142017851351 : ℚ) / 100000000000000000)
              hi := ((-99428235806017 : ℚ) / 1562500000000000) } }
  D0Rect :=
    { re := { lo := ((248981414707037 : ℚ) / 31250000000000000)
              hi := ((9283589898125581 : ℚ) / 1000000000000000000) }
      im := { lo := ((-23730136679734827 : ℚ) / 5000000000000000000)
              hi := ((-4287351847525773 : ℚ) / 1250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13508629570071241 : ℚ) / 10000000000000000000)
              hi := ((-3586427875648883 : ℚ) / 5000000000000000000) }
      im := { lo := ((1941048212076627 : ℚ) / 1250000000000000000)
              hi := ((437284086892833 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1995654512798949 : ℚ) / 2500000000000000000)
              hi := ((717567099469477 : ℚ) / 1250000000000000000) }
      im := { lo := ((-14172503510709013 : ℚ) / 50000000000000000000)
              hi := ((1046153949888953 : ℚ) / 1000000000000000000) } }
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

def s086_t2_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((8733619047253019 : ℚ) / 2000000000000000000)
              hi := ((4323667238626201 : ℚ) / 500000000000000000) }
      im := { lo := ((-1696409907650141 : ℚ) / 25000000000000000)
              hi := ((-1590478630176321 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((3980972696042347 : ℚ) / 500000000000000000)
              hi := ((4638964881104893 : ℚ) / 500000000000000000) }
      im := { lo := ((-4757549009809021 : ℚ) / 1000000000000000000)
              hi := ((-688325864844023 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2696406609484281 : ℚ) / 2000000000000000000)
              hi := ((-3573244589208311 : ℚ) / 5000000000000000000) }
      im := { lo := ((310864098138569 : ℚ) / 200000000000000000)
              hi := ((5469701650150789 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7981376955117221 : ℚ) / 10000000000000000000)
              hi := ((2870870788475113 : ℚ) / 5000000000000000000) }
      im := { lo := ((-2834246608161343 : ℚ) / 10000000000000000000)
              hi := ((2615372163197167 : ℚ) / 2500000000000000000) } }
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

def s086_t2_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((2185881610558259 : ℚ) / 500000000000000000)
              hi := ((1081528368483583 : ℚ) / 125000000000000000) }
      im := { lo := ((-6784138106381767 : ℚ) / 100000000000000000)
              hi := ((-6360422920140081 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1989117426674813 : ℚ) / 250000000000000000)
              hi := ((4636127017630773 : ℚ) / 500000000000000000) }
      im := { lo := ((-4769063202296389 : ℚ) / 1000000000000000000)
              hi := ((-431671191997001 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13455415860246013 : ℚ) / 10000000000000000000)
              hi := ((-3560050725924741 : ℚ) / 5000000000000000000) }
      im := { lo := ((15557986354366303 : ℚ) / 10000000000000000000)
              hi := ((10946685836821031 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7980136115704319 : ℚ) / 10000000000000000000)
              hi := ((5742945880762659 : ℚ) / 10000000000000000000) }
      im := { lo := ((-5667976744030529 : ℚ) / 20000000000000000000)
              hi := ((10461433456147823 : ℚ) / 10000000000000000000) } }
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

def s086_t2_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((109418381590481 : ℚ) / 25000000000000000)
              hi := ((8657138116478849 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6782637441680907 : ℚ) / 100000000000000000)
              hi := ((-3179466149043879 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((795097867123753 : ℚ) / 100000000000000000)
              hi := ((115832028675837 : ℚ) / 12500000000000000) }
      im := { lo := ((-4780569724497271 : ℚ) / 1000000000000000000)
              hi := ((-693020448116047 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13428776719632007 : ℚ) / 10000000000000000000)
              hi := ((-177342350386627 : ℚ) / 250000000000000000) }
      im := { lo := ((7786365755059763 : ℚ) / 5000000000000000000)
              hi := ((273848725186973 : ℚ) / 125000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-398945007582099 : ℚ) / 500000000000000000)
              hi := ((1436038580244149 : ℚ) / 2500000000000000000) }
      im := { lo := ((-1416863078277807 : ℚ) / 5000000000000000000)
              hi := ((10461374071745067 : ℚ) / 10000000000000000000) } }
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

def s086_t2_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4381726400171673 : ℚ) / 1000000000000000000)
              hi := ((4331033545291083 : ℚ) / 500000000000000000) }
      im := { lo := ((-1695284415504053 : ℚ) / 25000000000000000)
              hi := ((-79468032957527 : ℚ) / 1250000000000000) } }
  D0Rect :=
    { re := { lo := ((7945472397366427 : ℚ) / 1000000000000000000)
              hi := ((144700850701231 : ℚ) / 15625000000000000) }
      im := { lo := ((-958413646361731 : ℚ) / 200000000000000000)
              hi := ((-17384138788354487 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13402114560545591 : ℚ) / 10000000000000000000)
              hi := ((-7067268013012687 : ℚ) / 10000000000000000000) }
      im := { lo := ((194843016833743 : ℚ) / 125000000000000000)
              hi := ((2192238462095799 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3988831662915907 : ℚ) / 5000000000000000000)
              hi := ((5745361168187989 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1416732643172809 : ℚ) / 5000000000000000000)
              hi := ((10461315828541587 : ℚ) / 10000000000000000000) } }
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

def s086_t2_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((10966842911456329 : ℚ) / 2500000000000000000)
              hi := ((8667013425178477 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6779638674183647 : ℚ) / 100000000000000000)
              hi := ((-6355954028945557 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((3969975376039883 : ℚ) / 500000000000000000)
              hi := ((1851026125781819 : ℚ) / 200000000000000000) }
      im := { lo := ((-4803558700825917 : ℚ) / 1000000000000000000)
              hi := ((-1744273029126629 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1671928716596473 : ℚ) / 1250000000000000000)
              hi := ((-3520411595666059 : ℚ) / 5000000000000000000) }
      im := { lo := ((3900528861796159 : ℚ) / 2500000000000000000)
              hi := ((21936831815023393 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3988211707657131 : ℚ) / 5000000000000000000)
              hi := ((5746564195003273 : ℚ) / 10000000000000000000) }
      im := { lo := ((-28331998521772227 : ℚ) / 100000000000000000000)
              hi := ((653828300949601 : ℚ) / 625000000000000000) } }
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

def s086_t2_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((878353502425023 : ℚ) / 200000000000000000)
              hi := ((1693745524393 : ℚ) / 195312500000000) }
      im := { lo := ((-27112562043741 : ℚ) / 400000000000000)
              hi := ((-6354466447703279 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((7934413634847193 : ℚ) / 1000000000000000000)
              hi := ((4624695498127363 : ℚ) / 500000000000000000) }
      im := { lo := ((-9630082734775211 : ℚ) / 2000000000000000000)
              hi := ((-1750128436063101 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-667436162627737 : ℚ) / 500000000000000000)
              hi := ((-3507179341127577 : ℚ) / 5000000000000000000) }
      im := { lo := ((7808376465574141 : ℚ) / 5000000000000000000)
              hi := ((4390248094161873 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7975178887203703 : ℚ) / 10000000000000000000)
              hi := ((5747761871349891 : ℚ) / 10000000000000000000) }
      im := { lo := ((-5665861233747657 : ℚ) / 20000000000000000000)
              hi := ((10461185796613389 : ℚ) / 10000000000000000000) } }
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

def s086_t2_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((439681722221169 : ℚ) / 100000000000000000)
              hi := ((8676958311782597 : ℚ) / 1000000000000000000) }
      im := { lo := ((-13235631215987 : ℚ) / 195312500000000)
              hi := ((-99265310740423 : ℚ) / 1562500000000000) } }
  D0Rect :=
    { re := { lo := ((991107596130243 : ℚ) / 125000000000000000)
              hi := ((2310908952851957 : ℚ) / 250000000000000000) }
      im := { lo := ((-2413258062902647 : ℚ) / 500000000000000000)
              hi := ((-3511960256638669 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13321995511211473 : ℚ) / 10000000000000000000)
              hi := ((-3493937074440561 : ℚ) / 5000000000000000000) }
      im := { lo := ((12505082557771 : ℚ) / 8000000000000000)
              hi := ((1098280553856081 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1993482476355079 : ℚ) / 2500000000000000000)
              hi := ((5748954361218973 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1416328919579317 : ℚ) / 5000000000000000000)
              hi := ((2092223006573979 : ℚ) / 2000000000000000000) } }
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

def s086_t2_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((137558934943557 : ℚ) / 31250000000000000)
              hi := ((1736391493556667 : ℚ) / 200000000000000000) }
      im := { lo := ((-3387573371349623 : ℚ) / 50000000000000000)
              hi := ((-3175747148913033 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((7923292449690663 : ℚ) / 1000000000000000000)
              hi := ((4618932407614111 : ℚ) / 500000000000000000) }
      im := { lo := ((-2418991575201357 : ℚ) / 500000000000000000)
              hi := ((-7047311997979787 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13295246492752541 : ℚ) / 10000000000000000000)
              hi := ((-6961369735954791 : ℚ) / 10000000000000000000) }
      im := { lo := ((7822958275502357 : ℚ) / 5000000000000000000)
              hi := ((10989971647993003 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7972679325279241 : ℚ) / 10000000000000000000)
              hi := ((5750144519809923 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1416191861168793 : ℚ) / 5000000000000000000)
              hi := ((5230521363974259 : ℚ) / 5000000000000000000) } }
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

def s086_t2_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((275435756526871 : ℚ) / 62500000000000000)
              hi := ((1085871998822083 : ℚ) / 125000000000000000) }
      im := { lo := ((-423353205688359 : ℚ) / 6250000000000000)
              hi := ((-127000191688983 : ℚ) / 2000000000000000) } }
  D0Rect :=
    { re := { lo := ((123714193542091 : ℚ) / 15625000000000000)
              hi := ((577004895300391 : ℚ) / 62500000000000000) }
      im := { lo := ((-4849443120703717 : ℚ) / 1000000000000000000)
              hi := ((-17676716889278017 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6634239387209883 : ℚ) / 5000000000000000000)
              hi := ((-55478743861499 : ℚ) / 80000000000000000) }
      im := { lo := ((3915110163516119 : ℚ) / 2500000000000000000)
              hi := ((549855985403681 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1594286713144489 : ℚ) / 2000000000000000000)
              hi := ((2875669384374217 : ℚ) / 5000000000000000000) }
      im := { lo := ((-283210812838999 : ℚ) / 1000000000000000000)
              hi := ((1046096874570483 : ℚ) / 1000000000000000000) } }
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

def s086_t2_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4412077144988507 : ℚ) / 1000000000000000000)
              hi := ((434600627549847 : ℚ) / 50000000000000000) }
      im := { lo := ((-3386078367364429 : ℚ) / 50000000000000000)
              hi := ((-1269705168702421 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((791210895300257 : ℚ) / 100000000000000000)
              hi := ((4613137988960023 : ℚ) / 500000000000000000) }
      im := { lo := ((-9721791170713293 : ℚ) / 2000000000000000000)
              hi := ((-35470227905537023 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13241690488861849 : ℚ) / 10000000000000000000)
              hi := ((-3454147930144321 : ℚ) / 5000000000000000000) }
      im := { lo := ((1567492735143003 : ℚ) / 1000000000000000000)
              hi := ((22008497499233933 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3985093569443599 : ℚ) / 5000000000000000000)
              hi := ((2876265809291813 : ℚ) / 5000000000000000000) }
      im := { lo := ((-353978712879247 : ℚ) / 1250000000000000000)
              hi := ((10460891731780813 : ℚ) / 10000000000000000000) } }
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

def s086_t2_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4417201140775547 : ℚ) / 1000000000000000000)
              hi := ((8697066971905741 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6770663054707629 : ℚ) / 100000000000000000)
              hi := ((-6347043098738821 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((790649421006823 : ℚ) / 100000000000000000)
              hi := ((2305114436169287 : ℚ) / 250000000000000000) }
      im := { lo := ((-4872340233930933 : ℚ) / 1000000000000000000)
              hi := ((-3558694524749603 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6607440395829453 : ℚ) / 5000000000000000000)
              hi := ((-1720432328466613 : ℚ) / 2500000000000000000) }
      im := { lo := ((15689377403509397 : ℚ) / 10000000000000000000)
              hi := ((22022716775772513 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3984470001129639 : ℚ) / 5000000000000000000)
              hi := ((1438430757547997 : ℚ) / 2500000000000000000) }
      im := { lo := ((-707887201179983 : ℚ) / 2500000000000000000)
              hi := ((2615203011737293 : ℚ) / 2500000000000000000) } }
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

def s086_t2_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4422344646760867 : ℚ) / 1000000000000000000)
              hi := ((4351069373243573 : ℚ) / 500000000000000000) }
      im := { lo := ((-6769170226619829 : ℚ) / 100000000000000000)
              hi := ((-3172780689114179 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((493804011900381 : ℚ) / 62500000000000000)
              hi := ((575913974660197 : ℚ) / 62500000000000000) }
      im := { lo := ((-4883777002588533 : ℚ) / 1000000000000000000)
              hi := ((-35703585902965083 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1318804956072743 : ℚ) / 1000000000000000000)
              hi := ((-1713785888280787 : ℚ) / 2500000000000000000) }
      im := { lo := ((392594773048441 : ℚ) / 250000000000000000)
              hi := ((4304081451103 : ℚ) / 1953125000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7967689027854157 : ℚ) / 10000000000000000000)
              hi := ((5754909873597837 : ℚ) / 10000000000000000000) }
      im := { lo := ((-5662529855704479 : ℚ) / 20000000000000000000)
              hi := ((83685833486469 : ℚ) / 80000000000000000) } }
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

def s086_t2_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4427507379609907 : ℚ) / 1000000000000000000)
              hi := ((217680702715863 : ℚ) / 25000000000000000) }
      im := { lo := ((-422979890334163 : ℚ) / 6250000000000000)
              hi := ((-6344080691735449 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((7895218699886769 : ℚ) / 1000000000000000000)
              hi := ((4604386880974063 : ℚ) / 500000000000000000) }
      im := { lo := ((-4895205621367513 : ℚ) / 1000000000000000000)
              hi := ((-3582015216834707 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6580598329641379 : ℚ) / 5000000000000000000)
              hi := ((-3414269427096751 : ℚ) / 5000000000000000000) }
      im := { lo := ((15718167857471513 : ℚ) / 10000000000000000000)
              hi := ((441020765614171 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1991608843274223 : ℚ) / 2500000000000000000)
              hi := ((5756093307875759 : ℚ) / 10000000000000000000) }
      im := { lo := ((-707744519148601 : ℚ) / 2500000000000000000)
              hi := ((5230321576924369 : ℚ) / 5000000000000000000) } }
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

def s086_t2_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4432689184349431 : ℚ) / 1000000000000000000)
              hi := ((8712335206888357 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6766187127844611 : ℚ) / 100000000000000000)
              hi := ((-3171300513378023 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((7889557888532397 : ℚ) / 1000000000000000000)
              hi := ((1150363514162123 : ℚ) / 125000000000000000) }
      im := { lo := ((-9813252251899593 : ℚ) / 2000000000000000000)
              hi := ((-449208040719267 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13134321984373943 : ℚ) / 10000000000000000000)
              hi := ((-1360383083901539 : ℚ) / 2000000000000000000) }
      im := { lo := ((1966563554134761 : ℚ) / 1250000000000000000)
              hi := ((8826056096193 : ℚ) / 4000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-497823783072551 : ℚ) / 625000000000000000)
              hi := ((2878637412258781 : ℚ) / 5000000000000000000) }
      im := { lo := ((-7076722030182589 : ℚ) / 25000000000000000000)
              hi := ((26151386283537 : ℚ) / 25000000000000000) } }
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

def s086_t2_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((2218944576363209 : ℚ) / 500000000000000000)
              hi := ((1743492185574367 : ℚ) / 200000000000000000) }
      im := { lo := ((-1691174239504403 : ℚ) / 25000000000000000)
              hi := ((-1585280575632939 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((7883880659185289 : ℚ) / 1000000000000000000)
              hi := ((2299256939880063 : ℚ) / 250000000000000000) }
      im := { lo := ((-9836078943279987 : ℚ) / 2000000000000000000)
              hi := ((-4506631157255173 : ℚ) / 1250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3276857636738797 : ℚ) / 2500000000000000000)
              hi := ((-1355053664514947 : ℚ) / 2000000000000000000) }
      im := { lo := ((15746807583605187 : ℚ) / 10000000000000000000)
              hi := ((55198019795959 : ℚ) / 25000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7963922556919139 : ℚ) / 10000000000000000000)
              hi := ((5758452485569151 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2830395060703641 : ℚ) / 10000000000000000000)
              hi := ((1046046119183833 : ℚ) / 1000000000000000000) } }
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

def s086_t2_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((555388357259879 : ℚ) / 125000000000000000)
              hi := ((436130284262331 : ℚ) / 50000000000000000) }
      im := { lo := ((-3381604001343881 : ℚ) / 50000000000000000)
              hi := ((-6339644261431117 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((3939093974014431 : ℚ) / 500000000000000000)
              hi := ((459556589836471 : ℚ) / 50000000000000000) }
      im := { lo := ((-4929446043269097 : ℚ) / 1000000000000000000)
              hi := ((-3616936585477327 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-408766297807147 : ℚ) / 312500000000000000)
              hi := ((-3374299256830067 : ℚ) / 5000000000000000000) }
      im := { lo := ((3152213372484179 : ℚ) / 2000000000000000000)
              hi := ((11046619854391923 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1990665780458303 : ℚ) / 2500000000000000000)
              hi := ((575962795623399 : ℚ) / 1000000000000000000) }
      im := { lo := ((-707528468417429 : ℚ) / 2500000000000000000)
              hi := ((10460380244060403 : ℚ) / 10000000000000000000) } }
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

def s086_t2_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((8896685058467451 : ℚ) / 2000000000000000000)
              hi := ((4363884616012387 : ℚ) / 500000000000000000) }
      im := { lo := ((-845215039810497 : ℚ) / 12500000000000000)
              hi := ((-792270854866769 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((7872479928837413 : ℚ) / 1000000000000000000)
              hi := ((1837044012078401 : ℚ) / 200000000000000000) }
      im := { lo := ((-988169078037893 : ℚ) / 200000000000000000)
              hi := ((-36285597070713407 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13053593480189317 : ℚ) / 10000000000000000000)
              hi := ((-53775260315013 : ℚ) / 80000000000000000) }
      im := { lo := ((631011503822763 : ℚ) / 400000000000000000)
              hi := ((2210723420099603 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7961400343736481 : ℚ) / 10000000000000000000)
              hi := ((5760799358261567 : ℚ) / 10000000000000000000) }
      im := { lo := ((-282985268709899 : ℚ) / 1000000000000000000)
              hi := ((1046031910023013 : ℚ) / 1000000000000000000) } }
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

def s086_t2_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((2226798494464223 : ℚ) / 500000000000000000)
              hi := ((8732950737576257 : ℚ) / 1000000000000000000) }
      im := { lo := ((-84502918951759 : ℚ) / 1250000000000000)
              hi := ((-1267338087802869 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((7866756590291353 : ℚ) / 1000000000000000000)
              hi := ((458964629548953 : ℚ) / 50000000000000000) }
      im := { lo := ((-619029604265163 : ℚ) / 125000000000000000)
              hi := ((-18200874692054917 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13026644736686857 : ℚ) / 10000000000000000000)
              hi := ((-6695197167779299 : ℚ) / 10000000000000000000) }
      im := { lo := ((1578947112507129 : ℚ) / 1000000000000000000)
              hi := ((2765148753392413 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-796013758354597 : ℚ) / 1000000000000000000)
              hi := ((5761970051962049 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2829587551078399 : ℚ) / 10000000000000000000)
              hi := ((10460253817739077 : ℚ) / 10000000000000000000) } }
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

def s086_t2_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4458869974124037 : ℚ) / 1000000000000000000)
              hi := ((8738150433749231 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6758747607069857 : ℚ) / 100000000000000000)
              hi := ((-6335215054579497 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1965254371362583 : ℚ) / 250000000000000000)
              hi := ((1146668732616637 : ℚ) / 125000000000000000) }
      im := { lo := ((-62045250481593 : ℚ) / 12500000000000000)
              hi := ((-1141182052212787 : ℚ) / 312500000000000000) } }
  DrestRect :=
    { re := { lo := ((-12999675513644061 : ℚ) / 10000000000000000000)
              hi := ((-6668467308484393 : ℚ) / 10000000000000000000) }
      im := { lo := ((25285786976101 : ℚ) / 16000000000000000)
              hi := ((11067553857041091 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7958874284513441 : ℚ) / 10000000000000000000)
              hi := ((1440784870493287 : ℚ) / 2500000000000000000) }
      im := { lo := ((-2829319849727937 : ℚ) / 10000000000000000000)
              hi := ((2092037156302783 : ℚ) / 2000000000000000000) } }
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

def s086_t2_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((2232080443893987 : ℚ) / 500000000000000000)
              hi := ((4371684464113873 : ℚ) / 500000000000000000) }
      im := { lo := ((-6757262664716797 : ℚ) / 100000000000000000)
              hi := ((-633374061080971 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((785526296515127 : ℚ) / 100000000000000000)
              hi := ((183347830625627 : ℚ) / 20000000000000000) }
      im := { lo := ((-310937238992967 : ℚ) / 62500000000000000)
              hi := ((-457922716695079 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-12972687359390073 : ℚ) / 10000000000000000000)
              hi := ((-3320858249377843 : ℚ) / 5000000000000000000) }
      im := { lo := ((3954430971815563 : ℚ) / 2500000000000000000)
              hi := ((11074494055191503 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1989403581098573 : ℚ) / 2500000000000000000)
              hi := ((5764311525784941 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2829049523939471 : ℚ) / 10000000000000000000)
              hi := ((10460114930586973 : ℚ) / 10000000000000000000) } }
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

def s086_t2_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((279341815857051 : ℚ) / 62500000000000000)
              hi := ((4374303401085279 : ℚ) / 500000000000000000) }
      im := { lo := ((-6755778747766499 : ℚ) / 100000000000000000)
              hi := ((-3166133528203561 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((1962373142842433 : ℚ) / 250000000000000000)
              hi := ((9161418094560083 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2493182480474847 : ℚ) / 500000000000000000)
              hi := ((-18374858147985787 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6472841734805431 : ℚ) / 5000000000000000000)
              hi := ((-3307470833742849 : ℚ) / 5000000000000000000) }
      im := { lo := ((633271569039679 : ℚ) / 400000000000000000)
              hi := ((11081417082525757 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7956357893805307 : ℚ) / 10000000000000000000)
              hi := ((180171449322169 : ℚ) / 312500000000000000) }
      im := { lo := ((-1414387300356683 : ℚ) / 5000000000000000000)
              hi := ((1307504911914289 : ℚ) / 1250000000000000000) } }
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

def s086_t2_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((111869889203863 : ℚ) / 25000000000000000)
              hi := ((4376931515354637 : ℚ) / 500000000000000000) }
      im := { lo := ((-422143489065919 : ℚ) / 6250000000000000)
              hi := ((-79134930386137 : ℚ) / 1250000000000000) } }
  D0Rect :=
    { re := { lo := ((1568741398299359 : ℚ) / 200000000000000000)
              hi := ((572214304395381 : ℚ) / 62500000000000000) }
      im := { lo := ((-4997726219096133 : ℚ) / 1000000000000000000)
              hi := ((-9216383579626593 : ℚ) / 2500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6459329603949943 : ℚ) / 5000000000000000000)
              hi := ((-1647036887203857 : ℚ) / 2500000000000000000) }
      im := { lo := ((1980727154968759 : ℚ) / 1250000000000000000)
              hi := ((4435328283345307 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7955102622212967 : ℚ) / 10000000000000000000)
              hi := ((2883330832683567 : ℚ) / 5000000000000000000) }
      im := { lo := ((-2828501866675543 : ℚ) / 10000000000000000000)
              hi := ((20919931329851 : ℚ) / 20000000000000000) } }
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

def s086_t2_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((448013950228781 : ℚ) / 100000000000000000)
              hi := ((54744615793079 : ℚ) / 6250000000000000) }
      im := { lo := ((-6752814099220983 : ℚ) / 100000000000000000)
              hi := ((-6329322521740913 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((783790568534411 : ℚ) / 100000000000000000)
              hi := ((9149424421701911 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1001815838779269 : ℚ) / 200000000000000000)
              hi := ((-4622659391690533 : ℚ) / 1250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-322290369141261 : ℚ) / 250000000000000000)
              hi := ((-1640333511938591 : ℚ) / 2500000000000000000) }
      im := { lo := ((158598072687167 : ℚ) / 100000000000000000)
              hi := ((4438082097988033 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1988461995964533 : ℚ) / 2500000000000000000)
              hi := ((5767836862180527 : ℚ) / 10000000000000000000) }
      im := { lo := ((-7070615427408569 : ℚ) / 25000000000000000000)
              hi := ((418396355283889 : ℚ) / 400000000000000000) } }
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

def s086_t2_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((2242750966849559 : ℚ) / 500000000000000000)
              hi := ((8764432151741887 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6751333461167217 : ℚ) / 100000000000000000)
              hi := ((-6327851459615687 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1958022224823957 : ℚ) / 250000000000000000)
              hi := ((9143404528491703 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2510212068429741 : ℚ) / 500000000000000000)
              hi := ((-3709693577024573 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6432275218239491 : ℚ) / 5000000000000000000)
              hi := ((-3267250495637887 : ℚ) / 5000000000000000000) }
      im := { lo := ((15873759319696861 : ℚ) / 10000000000000000000)
              hi := ((27755176650489 : ℚ) / 12500000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7952589519555563 : ℚ) / 10000000000000000000)
              hi := ((721125938985939 : ℚ) / 1250000000000000000) }
      im := { lo := ((-2827999913019913 : ℚ) / 10000000000000000000)
              hi := ((10459861357201817 : ℚ) / 10000000000000000000) } }
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

def s086_t2_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((561360397368473 : ℚ) / 125000000000000000)
              hi := ((8769743524341641 : ℚ) / 1000000000000000000) }
      im := { lo := ((-674985380357017 : ℚ) / 10000000000000000)
              hi := ((-253055253635879 : ℚ) / 4000000000000000) } }
  D0Rect :=
    { re := { lo := ((12228526471491 : ℚ) / 1562500000000000)
              hi := ((91373689124009 : ℚ) / 10000000000000000) }
      im := { lo := ((-1257940160312313 : ℚ) / 250000000000000000)
              hi := ((-744250397820957 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3209366154191447 : ℚ) / 2500000000000000000)
              hi := ((-3253825052282057 : ℚ) / 5000000000000000000) }
      im := { lo := ((1588767498576753 : ℚ) / 1000000000000000000)
              hi := ((11108916136009783 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3975664431380203 : ℚ) / 5000000000000000000)
              hi := ((180317976613539 : ℚ) / 312500000000000000) }
      im := { lo := ((-14138793327408023 : ℚ) / 50000000000000000000)
              hi := ((10459818655428159 : ℚ) / 10000000000000000000) } }
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

def s086_t2_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((112407053095029 : ℚ) / 25000000000000000)
              hi := ((438753695244897 : ℚ) / 50000000000000000) }
      im := { lo := ((-1687093771576139 : ℚ) / 25000000000000000)
              hi := ((-6324912222359419 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((488775627783239 : ℚ) / 62500000000000000)
              hi := ((4565658678832317 : ℚ) / 500000000000000000) }
      im := { lo := ((-10086177237258893 : ℚ) / 2000000000000000000)
              hi := ((-1866401395875179 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-640517835129979 : ℚ) / 500000000000000000)
              hi := ((-1296156418980487 : ℚ) / 2000000000000000000) }
      im := { lo := ((7950777485526291 : ℚ) / 5000000000000000000)
              hi := ((2223148256879853 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7950077151847903 : ℚ) / 10000000000000000000)
              hi := ((2885675605524047 : ℚ) / 5000000000000000000) }
      im := { lo := ((-28275166699382533 : ℚ) / 100000000000000000000)
              hi := ((209195500515273 : ℚ) / 200000000000000000) } }
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

def s086_t2_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4501699905603113 : ℚ) / 1000000000000000000)
              hi := ((2195105494115703 : ℚ) / 250000000000000000) }
      im := { lo := ((-6746897288520567 : ℚ) / 100000000000000000)
              hi := ((-6323444121055839 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((390727400766543 : ℚ) / 50000000000000000)
              hi := ((456262503220397 : ℚ) / 50000000000000000) }
      im := { lo := ((-5054408444789097 : ℚ) / 1000000000000000000)
              hi := ((-7488691159576481 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-12783228193553931 : ℚ) / 10000000000000000000)
              hi := ((-6453895528639373 : ℚ) / 10000000000000000000) }
      im := { lo := ((7957698943710231 : ℚ) / 5000000000000000000)
              hi := ((4449018709413259 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7948824359830791 : ℚ) / 10000000000000000000)
              hi := ((1154505074776309 : ℚ) / 2000000000000000000) }
      im := { lo := ((-1413636541659491 : ℚ) / 5000000000000000000)
              hi := ((2091945924605319 : ℚ) / 2000000000000000000) } }
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

def s086_t2_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((563391651559741 : ℚ) / 125000000000000000)
              hi := ((4392895569352931 : ℚ) / 500000000000000000) }
      im := { lo := ((-6745420635411647 : ℚ) / 100000000000000000)
              hi := ((-6321976812414301 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((7808670608604759 : ℚ) / 1000000000000000000)
              hi := ((4559583661759707 : ℚ) / 500000000000000000) }
      im := { lo := ((-633215033704721 : ℚ) / 125000000000000000)
              hi := ((-3755880145493233 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-12756080229910079 : ℚ) / 10000000000000000000)
              hi := ((-321349471845729 : ℚ) / 500000000000000000) }
      im := { lo := ((15929202605950473 : ℚ) / 10000000000000000000)
              hi := ((1112933314079143 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1589517719812769 : ℚ) / 2000000000000000000)
              hi := ((577371584644399 : ℚ) / 1000000000000000000) }
      im := { lo := ((-28270356980983347 : ℚ) / 100000000000000000000)
              hi := ((5229845118729711 : ℚ) / 5000000000000000000) } }
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

def s086_t2_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4512582693506521 : ℚ) / 1000000000000000000)
              hi := ((1098897581331979 : ℚ) / 125000000000000000) }
      im := { lo := ((-674394526160197 : ℚ) / 10000000000000000)
              hi := ((-3160255094084447 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((312111101026149 : ℚ) / 40000000000000000)
              hi := ((4556534719018873 : ℚ) / 500000000000000000) }
      im := { lo := ((-1015404771059137 : ℚ) / 200000000000000000)
              hi := ((-3767406697869649 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3182228221822389 : ℚ) / 2500000000000000000)
              hi := ((-6400063803465523 : ℚ) / 10000000000000000000) }
      im := { lo := ((3188593754232233 : ℚ) / 2000000000000000000)
              hi := ((69600628352157 : ℚ) / 31250000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-794636054325941 : ℚ) / 1000000000000000000)
              hi := ((1154982661416979 : ℚ) / 2000000000000000000) }
      im := { lo := ((-2826816007013433 : ℚ) / 10000000000000000000)
              hi := ((10459668376611693 : ℚ) / 10000000000000000000) } }
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

def s086_t2_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((70594548140071 : ℚ) / 15625000000000000)
              hi := ((4398293898245847 : ℚ) / 500000000000000000) }
      im := { lo := ((-1348494158705407 : ℚ) / 20000000000000000)
              hi := ((-3159522300900009 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((15593737425681823 : ℚ) / 2000000000000000000)
              hi := ((9106956496255527 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2544159591448329 : ℚ) / 500000000000000000)
              hi := ((-1889462604586469 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2540345279604957 : ℚ) / 2000000000000000000)
              hi := ((-6373118533502001 : ℚ) / 10000000000000000000) }
      im := { lo := ((7978348079203339 : ℚ) / 5000000000000000000)
              hi := ((4457139619437469 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1986281990514027 : ℚ) / 2500000000000000000)
              hi := ((5776105524702957 : ℚ) / 10000000000000000000) }
      im := { lo := ((-7066483155257399 : ℚ) / 25000000000000000000)
              hi := ((1045964327904077 : ℚ) / 1000000000000000000) } }
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

def s086_t2_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63337541827 : ℚ) / 1000000000000)
      ((-126505071 : ℚ) / 500000000000)
      ((1940893763 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((282721162718427 : ℚ) / 62500000000000000)
              hi := ((8802012350644971 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1348199445148027 : ℚ) / 20000000000000000)
              hi := ((-1263516015460897 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((15581889153680667 : ℚ) / 2000000000000000000)
              hi := ((4550414051758759 : ℚ) / 500000000000000000) }
      im := { lo := ((-2549803131200889 : ℚ) / 500000000000000000)
              hi := ((-37904356226338043 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2534904008190631 : ℚ) / 2000000000000000000)
              hi := ((-1269230888998827 : ℚ) / 2000000000000000000) }
      im := { lo := ((3194077146297541 : ℚ) / 2000000000000000000)
              hi := ((89196625252387 : ℚ) / 40000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7943891614115629 : ℚ) / 10000000000000000000)
              hi := ((1444323314360119 : ℚ) / 2500000000000000000) }
      im := { lo := ((-5652734109880197 : ℚ) / 20000000000000000000)
              hi := ((2614903636350861 : ℚ) / 2500000000000000000) } }
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
    (hi : i ∈ positiveBoxSubboxesOf .s086_t2) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s086_t2).constants.mainLower)
      ((positiveBoxCombinedCert .s086_t2).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s086_t2).constants.restUpper) := by
  if h0 : i = .s086_t2_sb000 then
    exact s086_t2_sb000_certificateData
  else if h1 : i = .s086_t2_sb001 then
    exact s086_t2_sb001_certificateData
  else if h2 : i = .s086_t2_sb002 then
    exact s086_t2_sb002_certificateData
  else if h3 : i = .s086_t2_sb003 then
    exact s086_t2_sb003_certificateData
  else if h4 : i = .s086_t2_sb004 then
    exact s086_t2_sb004_certificateData
  else if h5 : i = .s086_t2_sb005 then
    exact s086_t2_sb005_certificateData
  else if h6 : i = .s086_t2_sb006 then
    exact s086_t2_sb006_certificateData
  else if h7 : i = .s086_t2_sb007 then
    exact s086_t2_sb007_certificateData
  else if h8 : i = .s086_t2_sb008 then
    exact s086_t2_sb008_certificateData
  else if h9 : i = .s086_t2_sb009 then
    exact s086_t2_sb009_certificateData
  else if h10 : i = .s086_t2_sb010 then
    exact s086_t2_sb010_certificateData
  else if h11 : i = .s086_t2_sb011 then
    exact s086_t2_sb011_certificateData
  else if h12 : i = .s086_t2_sb012 then
    exact s086_t2_sb012_certificateData
  else if h13 : i = .s086_t2_sb013 then
    exact s086_t2_sb013_certificateData
  else if h14 : i = .s086_t2_sb014 then
    exact s086_t2_sb014_certificateData
  else if h15 : i = .s086_t2_sb015 then
    exact s086_t2_sb015_certificateData
  else if h16 : i = .s086_t2_sb016 then
    exact s086_t2_sb016_certificateData
  else if h17 : i = .s086_t2_sb017 then
    exact s086_t2_sb017_certificateData
  else if h18 : i = .s086_t2_sb018 then
    exact s086_t2_sb018_certificateData
  else if h19 : i = .s086_t2_sb019 then
    exact s086_t2_sb019_certificateData
  else if h20 : i = .s086_t2_sb020 then
    exact s086_t2_sb020_certificateData
  else if h21 : i = .s086_t2_sb021 then
    exact s086_t2_sb021_certificateData
  else if h22 : i = .s086_t2_sb022 then
    exact s086_t2_sb022_certificateData
  else if h23 : i = .s086_t2_sb023 then
    exact s086_t2_sb023_certificateData
  else if h24 : i = .s086_t2_sb024 then
    exact s086_t2_sb024_certificateData
  else if h25 : i = .s086_t2_sb025 then
    exact s086_t2_sb025_certificateData
  else if h26 : i = .s086_t2_sb026 then
    exact s086_t2_sb026_certificateData
  else if h27 : i = .s086_t2_sb027 then
    exact s086_t2_sb027_certificateData
  else if h28 : i = .s086_t2_sb028 then
    exact s086_t2_sb028_certificateData
  else if h29 : i = .s086_t2_sb029 then
    exact s086_t2_sb029_certificateData
  else if h30 : i = .s086_t2_sb030 then
    exact s086_t2_sb030_certificateData
  else if h31 : i = .s086_t2_sb031 then
    exact s086_t2_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S086T2
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
