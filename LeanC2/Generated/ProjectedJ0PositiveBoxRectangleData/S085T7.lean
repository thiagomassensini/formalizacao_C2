import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.85_t7

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
namespace S085T7

open ProjectedJ0RectangleArithmetic

def s085_t7_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4471794297171567 : ℚ) / 1000000000000000000)
              hi := ((9059844445274013 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3225983312801259 : ℚ) / 50000000000000000)
              hi := ((-29991693143918887 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((3673190004776317 : ℚ) / 500000000000000000)
              hi := ((2182503693789927 : ℚ) / 250000000000000000) }
      im := { lo := ((-3820487111025287 : ℚ) / 500000000000000000)
              hi := ((-12525045404271743 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8709470798584313 : ℚ) / 10000000000000000000)
              hi := ((-1835851757497921 : ℚ) / 10000000000000000000) }
      im := { lo := ((398468148663617 : ℚ) / 200000000000000000)
              hi := ((2680082150951357 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1643328254562523 : ℚ) / 2000000000000000000)
              hi := ((804687146999251 : ℚ) / 1250000000000000000) }
      im := { lo := ((-31552291279862823 : ℚ) / 100000000000000000000)
              hi := ((11005044394487129 : ℚ) / 10000000000000000000) } }
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

def s085_t7_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4481366244356989 : ℚ) / 1000000000000000000)
              hi := ((9069296983446233 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6450547870785653 : ℚ) / 100000000000000000)
              hi := ((-29984675218668967 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((3668535726441699 : ℚ) / 500000000000000000)
              hi := ((4360235128582127 : ℚ) / 500000000000000000) }
      im := { lo := ((-7651674691547609 : ℚ) / 1000000000000000000)
              hi := ((-1254695996872111 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4338082509819139 : ℚ) / 5000000000000000000)
              hi := ((-3605907005150823 : ℚ) / 20000000000000000000) }
      im := { lo := ((996557280072277 : ℚ) / 500000000000000000)
              hi := ((670204319319023 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4107689247436731 : ℚ) / 5000000000000000000)
              hi := ((804818201103963 : ℚ) / 1250000000000000000) }
      im := { lo := ((-394366296284367 : ℚ) / 1250000000000000000)
              hi := ((5502438674514149 : ℚ) / 5000000000000000000) } }
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

def s085_t7_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((224547794768841 : ℚ) / 50000000000000000)
              hi := ((9078767923936483 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1289826097370693 : ℚ) / 20000000000000000)
              hi := ((-299776646923807 : ℚ) / 5000000000000000) } }
  D0Rect :=
    { re := { lo := ((3663874272382823 : ℚ) / 500000000000000000)
              hi := ((8710910918930673 : ℚ) / 1000000000000000000) }
      im := { lo := ((-7662362219807531 : ℚ) / 1000000000000000000)
              hi := ((-3142212321797103 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8642847318062621 : ℚ) / 10000000000000000000)
              hi := ((-1106278522513571 : ℚ) / 6250000000000000000) }
      im := { lo := ((19938838110426797 : ℚ) / 10000000000000000000)
              hi := ((3351934499647617 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8214121345563271 : ℚ) / 10000000000000000000)
              hi := ((3219799502405619 : ℚ) / 5000000000000000000) }
      im := { lo := ((-3943284729069807 : ℚ) / 12500000000000000000)
              hi := ((11004706538464467 : ℚ) / 10000000000000000000) } }
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

def s085_t7_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4500563511500701 : ℚ) / 1000000000000000000)
              hi := ((4544128444004037 : ℚ) / 500000000000000000) }
      im := { lo := ((-10074553921719 : ℚ) / 156250000000000)
              hi := ((-5994132281054369 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((3659205611916509 : ℚ) / 500000000000000000)
              hi := ((8701336841583833 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1534607513777381 : ℚ) / 200000000000000000)
              hi := ((-6295355872936727 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8609520140241507 : ℚ) / 10000000000000000000)
              hi := ((-3474251647485651 : ℚ) / 20000000000000000000) }
      im := { lo := ((398929661280281 : ℚ) / 200000000000000000)
              hi := ((13411366509029003 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4106432786567757 : ℚ) / 5000000000000000000)
              hi := ((805081639888011 : ℚ) / 1250000000000000000) }
      im := { lo := ((-7885800933478911 : ℚ) / 25000000000000000000)
              hi := ((550226548508717 : ℚ) / 500000000000000000) } }
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

def s085_t7_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((140943415885179 : ℚ) / 31250000000000000)
              hi := ((9097763695277433 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1289259975357353 : ℚ) / 20000000000000000)
              hi := ((-5992733138565237 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((3654529771125053 : ℚ) / 500000000000000000)
              hi := ((8691748019367299 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3841849948133127 : ℚ) / 500000000000000000)
              hi := ((-24633884702941 : ℚ) / 3906250000000000) } }
  DrestRect :=
    { re := { lo := ((-4288090568244919 : ℚ) / 5000000000000000000)
              hi := ((-8520982793061357 : ℚ) / 50000000000000000000) }
      im := { lo := ((19954082298666693 : ℚ) / 10000000000000000000)
              hi := ((1341497099967641 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2052903029635259 : ℚ) / 2500000000000000000)
              hi := ((6441708889304821 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3154008228461593 : ℚ) / 10000000000000000000)
              hi := ((1100435073300403 : ℚ) / 1000000000000000000) } }
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

def s085_t7_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4519833853459493 : ℚ) / 1000000000000000000)
              hi := ((56920548024557 : ℚ) / 6250000000000000) }
      im := { lo := ((-3222443287245791 : ℚ) / 50000000000000000)
              hi := ((-29956677642035273 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((7299693275208453 : ℚ) / 1000000000000000000)
              hi := ((4341072352445001 : ℚ) / 500000000000000000) }
      im := { lo := ((-7694349193073257 : ℚ) / 1000000000000000000)
              hi := ((-6317180439040659 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4271415459079679 : ℚ) / 5000000000000000000)
              hi := ((-16712573588520483 : ℚ) / 100000000000000000000) }
      im := { lo := ((19961635076106107 : ℚ) / 10000000000000000000)
              hi := ((2683710362671131 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8210355473272827 : ℚ) / 10000000000000000000)
              hi := ((3221380406053861 : ℚ) / 5000000000000000000) }
      im := { lo := ((-1576845686976169 : ℚ) / 5000000000000000000)
              hi := ((11004165853265623 : ℚ) / 10000000000000000000) } }
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

def s085_t7_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4529495338722359 : ℚ) / 1000000000000000000)
              hi := ((9116830728927631 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6443474699471011 : ℚ) / 100000000000000000)
              hi := ((-5989939358596347 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((3645156473349503 : ℚ) / 500000000000000000)
              hi := ((867252640777263 : ℚ) / 100000000000000000) }
      im := { lo := ((-15409972029269933 : ℚ) / 2000000000000000000)
              hi := ((-1582018287280847 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-425473505321163 : ℚ) / 500000000000000000)
              hi := ((-3276615452360987 : ℚ) / 20000000000000000000) }
      im := { lo := ((399382832429643 : ℚ) / 200000000000000000)
              hi := ((1342210882627639 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-65672874706027 : ℚ) / 80000000000000000)
              hi := ((1610955645969043 : ℚ) / 2500000000000000000) }
      im := { lo := ((-3153369862781139 : ℚ) / 10000000000000000000)
              hi := ((2200795277074901 : ℚ) / 2000000000000000000) } }
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

def s085_t7_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((2269586771203561 : ℚ) / 500000000000000000)
              hi := ((9126392971186989 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6442064259171147 : ℚ) / 100000000000000000)
              hi := ((-11977089248346269 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((291236712406633 : ℚ) / 40000000000000000)
              hi := ((1732578785669861 : ℚ) / 200000000000000000) }
      im := { lo := ((-1928902559549049 : ℚ) / 250000000000000000)
              hi := ((-6338952698514031 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8476100128317707 : ℚ) / 10000000000000000000)
              hi := ((-16053463994394337 : ℚ) / 100000000000000000000) }
      im := { lo := ((998829997181403 : ℚ) / 500000000000000000)
              hi := ((2685128606522497 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2051967713349041 : ℚ) / 2500000000000000000)
              hi := ((805611418454059 : ℚ) / 1250000000000000000) }
      im := { lo := ((-15765218026407243 : ℚ) / 50000000000000000000)
              hi := ((2750945559880073 : ℚ) / 2500000000000000000) } }
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

def s085_t7_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4548870644040167 : ℚ) / 1000000000000000000)
              hi := ((456798609346937 : ℚ) / 50000000000000000) }
      im := { lo := ((-805081899245481 : ℚ) / 12500000000000000)
              hi := ((-11974302788593999 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((7271508291209183 : ℚ) / 1000000000000000000)
              hi := ((4326623429042907 : ℚ) / 500000000000000000) }
      im := { lo := ((-7726221330836107 : ℚ) / 1000000000000000000)
              hi := ((-3174909788160109 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4221359346767331 : ℚ) / 5000000000000000000)
              hi := ((-24568371500983 : ℚ) / 156250000000000000) }
      im := { lo := ((3996802457115459 : ℚ) / 2000000000000000000)
              hi := ((3357288319910791 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2051656962564007 : ℚ) / 2500000000000000000)
              hi := ((805744367209489 : ℚ) / 1250000000000000000) }
      im := { lo := ((-31527160928307717 : ℚ) / 100000000000000000000)
              hi := ((11003586911075079 : ℚ) / 10000000000000000000) } }
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

def s085_t7_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4558586263211613 : ℚ) / 1000000000000000000)
              hi := ((2286392185950533 : ℚ) / 250000000000000000) }
      im := { lo := ((-6439247617760181 : ℚ) / 100000000000000000)
              hi := ((-598575954873237 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((14524168912222633 : ℚ) / 2000000000000000000)
              hi := ((2160896289866579 : ℚ) / 250000000000000000) }
      im := { lo := ((-7736819127663867 : ℚ) / 1000000000000000000)
              hi := ((-6360673909999159 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1681865066685467 : ℚ) / 2000000000000000000)
              hi := ((-7696982220769993 : ℚ) / 50000000000000000000) }
      im := { lo := ((2498922385992933 : ℚ) / 1250000000000000000)
              hi := ((167907991619569 : ℚ) / 62500000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4102690383142983 : ℚ) / 5000000000000000000)
              hi := ((805876723984041 : ℚ) / 1250000000000000000) }
      im := { lo := ((-3940494980891387 : ℚ) / 12500000000000000000)
              hi := ((11003399054247151 : ℚ) / 10000000000000000000) } }
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

def s085_t7_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((913664061085409 : ℚ) / 200000000000000000)
              hi := ((1144397844462791 : ℚ) / 125000000000000000) }
      im := { lo := ((-1287568282584029 : ℚ) / 20000000000000000)
              hi := ((-5984369219209429 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((7252646420774549 : ℚ) / 1000000000000000000)
              hi := ((863390876772071 : ℚ) / 100000000000000000) }
      im := { lo := ((-19368508872574439 : ℚ) / 2500000000000000000)
              hi := ((-3185757868462759 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2093979942936817 : ℚ) / 2500000000000000000)
              hi := ((-15064088464008109 : ℚ) / 100000000000000000000) }
      im := { lo := ((9999350363116247 : ℚ) / 5000000000000000000)
              hi := ((26872201975420853 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4102066921701647 : ℚ) / 5000000000000000000)
              hi := ((6448072149497503 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3152074157364879 : ℚ) / 10000000000000000000)
              hi := ((2750802388000491 : ℚ) / 2500000000000000000) } }
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

def s085_t7_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((9156144891379437 : ℚ) / 2000000000000000000)
              hi := ((9164814414718859 : ℚ) / 1000000000000000000) }
      im := { lo := ((-643643664877577 : ℚ) / 10000000000000000)
              hi := ((-14957450836993031 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((1810798625896031 : ℚ) / 250000000000000000)
              hi := ((4312108695823153 : ℚ) / 500000000000000000) }
      im := { lo := ((-1551594932946599 : ℚ) / 200000000000000000)
              hi := ((-25529379827993 : ℚ) / 4000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8342501658678543 : ℚ) / 10000000000000000000)
              hi := ((-14734134395750793 : ℚ) / 100000000000000000000) }
      im := { lo := ((500149447017773 : ℚ) / 250000000000000000)
              hi := ((537581516070507 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4101444457513731 : ℚ) / 5000000000000000000)
              hi := ((3224565925721947 : ℚ) / 5000000000000000000) }
      im := { lo := ((-15758775154333117 : ℚ) / 50000000000000000000)
              hi := ((11003022822573423 : ℚ) / 10000000000000000000) } }
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

def s085_t7_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4587842853136721 : ℚ) / 1000000000000000000)
              hi := ((917446359024127 : ℚ) / 100000000000000000) }
      im := { lo := ((-6435033382710537 : ℚ) / 100000000000000000)
              hi := ((-5981592847608973 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1808432151748799 : ℚ) / 250000000000000000)
              hi := ((8614511168533729 : ℚ) / 1000000000000000000) }
      im := { lo := ((-7768532722135793 : ℚ) / 1000000000000000000)
              hi := ((-6393161281144419 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4154536041226301 : ℚ) / 5000000000000000000)
              hi := ((-7202046401115413 : ℚ) / 50000000000000000000) }
      im := { lo := ((1000660481723051 : ℚ) / 500000000000000000)
              hi := ((1680368814526567 : ℚ) / 625000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8201642765453707 : ℚ) / 10000000000000000000)
              hi := ((6450189678768919 : ℚ) / 10000000000000000000) }
      im := { lo := ((-393930165741437 : ℚ) / 1250000000000000000)
              hi := ((11002841590594709 : ℚ) / 10000000000000000000) } }
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

def s085_t7_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4597631231129763 : ℚ) / 1000000000000000000)
              hi := ((1836826111200843 : ℚ) / 200000000000000000) }
      im := { lo := ((-1608407888352939 : ℚ) / 25000000000000000)
              hi := ((-1196041363697431 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((225757746024163 : ℚ) / 31250000000000000)
              hi := ((1075598873350407 : ℚ) / 125000000000000000) }
      im := { lo := ((-19447695395203 : ℚ) / 2500000000000000)
              hi := ((-1600991056357289 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8275634277560937 : ℚ) / 10000000000000000000)
              hi := ((-3518483170479059 : ℚ) / 25000000000000000000) }
      im := { lo := ((10010196244225403 : ℚ) / 5000000000000000000)
              hi := ((13446340555583853 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8200393854605719 : ℚ) / 10000000000000000000)
              hi := ((6451244092290887 : ℚ) / 10000000000000000000) }
      im := { lo := ((-31511245918546183 : ℚ) / 100000000000000000000)
              hi := ((687666087703121 : ℚ) / 625000000000000000) } }
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

def s085_t7_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((287964867969999 : ℚ) / 62500000000000000)
              hi := ((1838762992274243 : ℚ) / 200000000000000000) }
      im := { lo := ((-643223110486589 : ℚ) / 10000000000000000)
              hi := ((-14947055772558721 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((7214752537702629 : ℚ) / 1000000000000000000)
              hi := ((4297528323674791 : ℚ) / 500000000000000000) }
      im := { lo := ((-7789610694342577 : ℚ) / 1000000000000000000)
              hi := ((-3207377021079427 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4121093541912597 : ℚ) / 5000000000000000000)
              hi := ((-1717958355024539 : ℚ) / 12500000000000000000) }
      im := { lo := ((625860238327507 : ℚ) / 312500000000000000)
              hi := ((26899414853836473 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-128111601864863 : ℚ) / 156250000000000000)
              hi := ((6452295430466373 : ℚ) / 10000000000000000000) }
      im := { lo := ((-78770071128349 : ℚ) / 250000000000000000)
              hi := ((2200493655891313 : ℚ) / 2000000000000000000) } }
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

def s085_t7_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4617263124336781 : ℚ) / 1000000000000000000)
              hi := ((1150439560669889 : ℚ) / 125000000000000000) }
      im := { lo := ((-1607707997912369 : ℚ) / 25000000000000000)
              hi := ((-1867949802759387 : ℚ) / 31250000000000000) } }
  D0Rect :=
    { re := { lo := ((3602621242520253 : ℚ) / 500000000000000000)
              hi := ((85853082976141 : ℚ) / 10000000000000000) }
      im := { lo := ((-1560025946712789 : ℚ) / 200000000000000000)
              hi := ((-6425531280581003 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4104364603824053 : ℚ) / 5000000000000000000)
              hi := ((-6706654794381967 : ℚ) / 50000000000000000000) }
      im := { lo := ((20034615857664317 : ℚ) / 10000000000000000000)
              hi := ((26906101399993563 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4098943677563479 : ℚ) / 5000000000000000000)
              hi := ((1290668457888333 : ℚ) / 2000000000000000000) }
      im := { lo := ((-1575238123952817 : ℚ) / 5000000000000000000)
              hi := ((1375284297735517 : ℚ) / 1250000000000000000) } }
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

def s085_t7_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((462710738254273 : ℚ) / 100000000000000000)
              hi := ((1842646927862547 : ℚ) / 200000000000000000) }
      im := { lo := ((-1285886844279737 : ℚ) / 20000000000000000)
              hi := ((-5976057994182393 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((7195718232976961 : ℚ) / 1000000000000000000)
              hi := ((8575545464323537 : ℚ) / 1000000000000000000) }
      im := { lo := ((-15621270980891869 : ℚ) / 2000000000000000000)
              hi := ((-6436295693766711 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-81752603305791 : ℚ) / 100000000000000000)
              hi := ((-654143276441663 : ℚ) / 5000000000000000000) }
      im := { lo := ((2004165811057187 : ℚ) / 1000000000000000000)
              hi := ((1345636990847663 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8196627231788417 : ℚ) / 10000000000000000000)
              hi := ((6454383540645937 : ℚ) / 10000000000000000000) }
      im := { lo := ((-31501455114847437 : ℚ) / 100000000000000000000)
              hi := ((343814888217361 : ℚ) / 312500000000000000) } }
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

def s085_t7_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((2318484519070477 : ℚ) / 500000000000000000)
              hi := ((2305742760775207 : ℚ) / 250000000000000000) }
      im := { lo := ((-6428037879342283 : ℚ) / 100000000000000000)
              hi := ((-2987339051689737 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((7186179824107081 : ℚ) / 1000000000000000000)
              hi := ((4282884065265667 : ℚ) / 500000000000000000) }
      im := { lo := ((-1955282022958959 : ℚ) / 250000000000000000)
              hi := ((-32235235515857613 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4070890446612077 : ℚ) / 5000000000000000000)
              hi := ((-12752331582226547 : ℚ) / 100000000000000000000) }
      im := { lo := ((20048654115087093 : ℚ) / 10000000000000000000)
              hi := ((538386606199857 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1024421534174381 : ℚ) / 1250000000000000000)
              hi := ((1613857327071269 : ℚ) / 2500000000000000000) }
      im := { lo := ((-31498122347030263 : ℚ) / 100000000000000000000)
              hi := ((220037520032477 : ℚ) / 200000000000000000) } }
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

def s085_t7_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4646848357817037 : ℚ) / 1000000000000000000)
              hi := ((9232725381746467 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3213321463828031 : ℚ) / 50000000000000000)
              hi := ((-2986649869946137 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((17941568518497191 : ℚ) / 2500000000000000000)
              hi := ((8555976191811789 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3915803753345789 : ℚ) / 500000000000000000)
              hi := ((-2583114205980689 : ℚ) / 400000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1013536329966809 : ℚ) / 1250000000000000000)
              hi := ((-6210855809949759 : ℚ) / 50000000000000000000) }
      im := { lo := ((20055604278667177 : ℚ) / 10000000000000000000)
              hi := ((336573406009153 : ℚ) / 125000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1638824394046101 : ℚ) / 2000000000000000000)
              hi := ((3228239542101219 : ℚ) / 5000000000000000000) }
      im := { lo := ((-196842143049859 : ℚ) / 625000000000000000)
              hi := ((5500835495790327 : ℚ) / 5000000000000000000) } }
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

def s085_t7_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((186269838513907 : ℚ) / 40000000000000000)
              hi := ((9242497017747571 : ℚ) / 1000000000000000000) }
      im := { lo := ((-12549315098663 : ℚ) / 195312500000000)
              hi := ((-373245183903687 : ℚ) / 6250000000000000) } }
  D0Rect :=
    { re := { lo := ((1433412108883881 : ℚ) / 200000000000000000)
              hi := ((8546170112867837 : ℚ) / 1000000000000000000) }
      im := { lo := ((-392103672852921 : ℚ) / 50000000000000000)
              hi := ((-3234255582520119 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4037394924702609 : ℚ) / 5000000000000000000)
              hi := ((-3022751015043097 : ℚ) / 25000000000000000000) }
      im := { lo := ((2006250782770479 : ℚ) / 1000000000000000000)
              hi := ((26932367056813713 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-327714812770301 : ℚ) / 400000000000000000)
              hi := ((6457526866031883 : ℚ) / 10000000000000000000) }
      im := { lo := ((-6298262729366429 : ℚ) / 20000000000000000000)
              hi := ((11001461083838013 : ℚ) / 10000000000000000000) } }
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

def s085_t7_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((466666177608353 : ℚ) / 100000000000000000)
              hi := ((1850457197037313 : ℚ) / 200000000000000000) }
      im := { lo := ((-6423857097982377 : ℚ) / 100000000000000000)
              hi := ((-2985273853118879 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((715747875149483 : ℚ) / 100000000000000000)
              hi := ((8536350421499007 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1963131466887787 : ℚ) / 250000000000000000)
              hi := ((-161980602323381 : ℚ) / 25000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8041279499194237 : ℚ) / 10000000000000000000)
              hi := ((-5880100292296443 : ℚ) / 50000000000000000000) }
      im := { lo := ((1254335214182743 : ℚ) / 625000000000000000)
              hi := ((673470384065373 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1023951861457637 : ℚ) / 1250000000000000000)
              hi := ((3229285113148923 : ℚ) / 5000000000000000000) }
      im := { lo := ((-3148783748587337 : ℚ) / 10000000000000000000)
              hi := ((11001246566265757 : ℚ) / 10000000000000000000) } }
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

def s085_t7_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4676596652194033 : ℚ) / 1000000000000000000)
              hi := ((9262091411209369 : ℚ) / 1000000000000000000) }
      im := { lo := ((-802808276054629 : ℚ) / 12500000000000000)
              hi := ((-5969174054960329 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((357394147234681 : ℚ) / 50000000000000000)
              hi := ((8526516230867089 : ℚ) / 1000000000000000000) }
      im := { lo := ((-7862964717555763 : ℚ) / 1000000000000000000)
              hi := ((-6489924266980051 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-250242430206579 : ℚ) / 312500000000000000)
              hi := ((-11429320822364159 : ℚ) / 100000000000000000000) }
      im := { lo := ((20076173618556767 : ℚ) / 10000000000000000000)
              hi := ((3368151849297323 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-819035463655747 : ℚ) / 1000000000000000000)
              hi := ((1614902028727099 : ℚ) / 2500000000000000000) }
      im := { lo := ((-1259373020331593 : ℚ) / 4000000000000000000)
              hi := ((11001028548377563 : ℚ) / 10000000000000000000) } }
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

def s085_t7_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((2343274921940019 : ℚ) / 500000000000000000)
              hi := ((1854382814521973 : ℚ) / 200000000000000000) }
      im := { lo := ((-6421076728529751 : ℚ) / 100000000000000000)
              hi := ((-14919504821677249 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((35691364070545833 : ℚ) / 5000000000000000000)
              hi := ((1703333578809631 : ℚ) / 200000000000000000) }
      im := { lo := ((-1968347666283063 : ℚ) / 250000000000000000)
              hi := ((-20314409399463 : ℚ) / 3125000000000000) } }
  DrestRect :=
    { re := { lo := ((-1993556833276077 : ℚ) / 2500000000000000000)
              hi := ((-11098339192570901 : ℚ) / 100000000000000000000) }
      im := { lo := ((2008293604385883 : ℚ) / 1000000000000000000)
              hi := ((2695156772486951 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8189091363611369 : ℚ) / 10000000000000000000)
              hi := ((6460642338513309 : ℚ) / 10000000000000000000) }
      im := { lo := ((-49188699996323 : ℚ) / 156250000000000000)
              hi := ((550040303090017 : ℚ) / 500000000000000000) } }
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

def s085_t7_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((9393040204522701 : ℚ) / 2000000000000000000)
              hi := ((4640877512133157 : ℚ) / 500000000000000000) }
      im := { lo := ((-6419688700653857 : ℚ) / 100000000000000000)
              hi := ((-29832156434727253 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((7128648254577001 : ℚ) / 1000000000000000000)
              hi := ((2126701383202857 : ℚ) / 250000000000000000) }
      im := { lo := ((-7883803878419741 : ℚ) / 1000000000000000000)
              hi := ((-6511284103151239 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3970344519328029 : ℚ) / 5000000000000000000)
              hi := ((-1076724835883919 : ℚ) / 10000000000000000000) }
      im := { lo := ((1004482497152493 : ℚ) / 500000000000000000)
              hi := ((5391574970155297 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1023478985206527 : ℚ) / 1250000000000000000)
              hi := ((6461679717622761 : ℚ) / 10000000000000000000) }
      im := { lo := ((-15738578709319033 : ℚ) / 50000000000000000000)
              hi := ((44002313410707 : ℚ) / 40000000000000000) } }
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

def s085_t7_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((2353254402993237 : ℚ) / 500000000000000000)
              hi := ((9291613028271537 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6418302066373713 : ℚ) / 100000000000000000)
              hi := ((-14912655477840351 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((1779752414210969 : ℚ) / 250000000000000000)
              hi := ((849692882018359 : ℚ) / 100000000000000000) }
      im := { lo := ((-1973550976838069 : ℚ) / 250000000000000000)
              hi := ((-6521943959748209 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7907140990500539 : ℚ) / 10000000000000000000)
              hi := ((-2087213832021927 : ℚ) / 20000000000000000000) }
      im := { lo := ((4019263450691167 : ℚ) / 2000000000000000000)
              hi := ((84262919488991 : ℚ) / 31250000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8186570181925069 : ℚ) / 10000000000000000000)
              hi := ((6462714233155591 : ℚ) / 10000000000000000000) }
      im := { lo := ((-6294701239556033 : ℚ) / 20000000000000000000)
              hi := ((11000346663350643 : ℚ) / 10000000000000000000) } }
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

def s085_t7_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((2358257460453771 : ℚ) / 500000000000000000)
              hi := ((4650744492358321 : ℚ) / 500000000000000000) }
      im := { lo := ((-3208458475028333 : ℚ) / 50000000000000000)
              hi := ((-7454618159921573 : ℚ) / 125000000000000000) } }
  D0Rect :=
    { re := { lo := ((7109357256302853 : ℚ) / 1000000000000000000)
              hi := ((1060879692156259 : ℚ) / 125000000000000000) }
      im := { lo := ((-7904590878708253 : ℚ) / 1000000000000000000)
              hi := ((-204143450582311 : ℚ) / 31250000000000000) } }
  DrestRect :=
    { re := { lo := ((-3936791582003781 : ℚ) / 5000000000000000000)
              hi := ((-505240137229383 : ℚ) / 5000000000000000000) }
      im := { lo := ((2010293830493431 : ℚ) / 1000000000000000000)
              hi := ((1078813820415833 : ℚ) / 400000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2046327937869663 : ℚ) / 2500000000000000000)
              hi := ((1292750276042543 : ℚ) / 2000000000000000000) }
      im := { lo := ((-6293974849397191 : ℚ) / 20000000000000000000)
              hi := ((2200023398119541 : ℚ) / 2000000000000000000) } }
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

def s085_t7_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((11816347933655141 : ℚ) / 2500000000000000000)
              hi := ((1163922776536247 : ℚ) / 125000000000000000) }
      im := { lo := ((-641553330896571 : ℚ) / 10000000000000000)
              hi := ((-2981164168272727 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((887461371057829 : ℚ) / 125000000000000000)
              hi := ((8477131810355311 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3957482636741323 : ℚ) / 500000000000000000)
              hi := ((-3271611479728943 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1568003458831819 : ℚ) / 2000000000000000000)
              hi := ((-2443358304152621 : ℚ) / 25000000000000000000) }
      im := { lo := ((80438046906499 : ℚ) / 40000000000000000)
              hi := ((3372063752865623 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8184051313932693 : ℚ) / 10000000000000000000)
              hi := ((6464785878697423 : ℚ) / 10000000000000000000) }
      im := { lo := ((-7866554960516019 : ℚ) / 25000000000000000000)
              hi := ((5499942579170479 : ℚ) / 5000000000000000000) } }
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

def s085_t7_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((9473161032815881 : ℚ) / 2000000000000000000)
              hi := ((186425873744239 : ℚ) / 20000000000000000) }
      im := { lo := ((-801768906183087 : ℚ) / 12500000000000000)
              hi := ((-1490240878863539 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((7090009721907633 : ℚ) / 1000000000000000000)
              hi := ((529200796886647 : ℚ) / 62500000000000000) }
      im := { lo := ((-1981331832431923 : ℚ) / 250000000000000000)
              hi := ((-3276920649971351 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7806446511090847 : ℚ) / 10000000000000000000)
              hi := ((-1888386149341301 : ℚ) / 20000000000000000000) }
      im := { lo := ((10058016908795781 : ℚ) / 5000000000000000000)
              hi := ((2698263144303943 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8182787850527583 : ℚ) / 10000000000000000000)
              hi := ((10345306740991 : ℚ) / 16000000000000000) }
      im := { lo := ((-3932821607285303 : ℚ) / 12500000000000000000)
              hi := ((10999654155182117 : ℚ) / 10000000000000000000) } }
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

def s085_t7_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4746638997082677 : ℚ) / 1000000000000000000)
              hi := ((4665611660723889 : ℚ) / 500000000000000000) }
      im := { lo := ((-1282554160381961 : ℚ) / 20000000000000000)
              hi := ((-2979800018165731 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((35401568009134953 : ℚ) / 5000000000000000000)
              hi := ((4228640147281219 : ℚ) / 500000000000000000) }
      im := { lo := ((-3967837958378349 : ℚ) / 500000000000000000)
              hi := ((-1312889308866123 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7772867495641507 : ℚ) / 10000000000000000000)
              hi := ((-2277582369523813 : ℚ) / 25000000000000000000) }
      im := { lo := ((1257656696235531 : ℚ) / 625000000000000000)
              hi := ((6747176796703041 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8181521544732103 : ℚ) / 10000000000000000000)
              hi := ((6466844069198201 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1572950871426181 : ℚ) / 5000000000000000000)
              hi := ((2749858098686063 : ℚ) / 2500000000000000000) } }
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

def s085_t7_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((4756712630404873 : ℚ) / 1000000000000000000)
              hi := ((1868234635768707 : ℚ) / 200000000000000000) }
      im := { lo := ((-6411392057627169 : ℚ) / 100000000000000000)
              hi := ((-5958237830259621 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((7070603271742613 : ℚ) / 1000000000000000000)
              hi := ((422366691595261 : ℚ) / 50000000000000000) }
      im := { lo := ((-1986502775619897 : ℚ) / 250000000000000000)
              hi := ((-1315007715043617 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1547855850910307 : ℚ) / 2000000000000000000)
              hi := ((-8778641121421793 : ℚ) / 100000000000000000000) }
      im := { lo := ((2012893331602261 : ℚ) / 1000000000000000000)
              hi := ((539894712115387 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4090134457566961 : ℚ) / 5000000000000000000)
              hi := ((6467884459535413 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3145556605342907 : ℚ) / 10000000000000000000)
              hi := ((2199844227649097 : ℚ) / 2000000000000000000) } }
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

def s085_t7_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((11917001810264939 : ℚ) / 2500000000000000000)
              hi := ((2337785940122477 : ℚ) / 250000000000000000) }
      im := { lo := ((-1602503721027673 : ℚ) / 25000000000000000)
              hi := ((-5956877010723357 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((7060878600322497 : ℚ) / 1000000000000000000)
              hi := ((1687474703968207 : ℚ) / 200000000000000000) }
      im := { lo := ((-7956332828005083 : ℚ) / 1000000000000000000)
              hi := ((-1646404355542961 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3852841008916051 : ℚ) / 5000000000000000000)
              hi := ((-8446864418411831 : ℚ) / 100000000000000000000) }
      im := { lo := ((503382800310947 : ℚ) / 250000000000000000)
              hi := ((5400143402190397 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8179036552698337 : ℚ) / 10000000000000000000)
              hi := ((6468944486062923 : ℚ) / 10000000000000000000) }
      im := { lo := ((-31452114349641403 : ℚ) / 100000000000000000000)
              hi := ((2199801987048279 : ℚ) / 2000000000000000000) } }
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

def s085_t7_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((14936611507 : ℚ) / 250000000000)
      ((-204249409 : ℚ) / 500000000000)
      ((2071096791 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((955381125490859 : ℚ) / 200000000000000000)
              hi := ((1872226547185309 : ℚ) / 200000000000000000) }
      im := { lo := ((-1281727855053707 : ℚ) / 20000000000000000)
              hi := ((-1488879399429541 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((881392497676647 : ℚ) / 125000000000000000)
              hi := ((8427399006116491 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1991660209491483 : ℚ) / 250000000000000000)
              hi := ((-6596183297802293 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3836037199194219 : ℚ) / 5000000000000000000)
              hi := ((-253594210686873 : ℚ) / 3125000000000000000) }
      im := { lo := ((20141644782797567 : ℚ) / 10000000000000000000)
              hi := ((27006649821622163 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-817780957407789 : ℚ) / 1000000000000000000)
              hi := ((1617502315821179 : ℚ) / 2500000000000000000) }
      im := { lo := ((-3144872354911003 : ℚ) / 10000000000000000000)
              hi := ((2749701228825529 : ℚ) / 2500000000000000000) } }
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
    (hi : i ∈ positiveBoxSubboxesOf .s085_t7) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s085_t7).constants.mainLower)
      ((positiveBoxCombinedCert .s085_t7).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s085_t7).constants.restUpper) := by
  if h0 : i = .s085_t7_sb000 then
    exact s085_t7_sb000_certificateData
  else if h1 : i = .s085_t7_sb001 then
    exact s085_t7_sb001_certificateData
  else if h2 : i = .s085_t7_sb002 then
    exact s085_t7_sb002_certificateData
  else if h3 : i = .s085_t7_sb003 then
    exact s085_t7_sb003_certificateData
  else if h4 : i = .s085_t7_sb004 then
    exact s085_t7_sb004_certificateData
  else if h5 : i = .s085_t7_sb005 then
    exact s085_t7_sb005_certificateData
  else if h6 : i = .s085_t7_sb006 then
    exact s085_t7_sb006_certificateData
  else if h7 : i = .s085_t7_sb007 then
    exact s085_t7_sb007_certificateData
  else if h8 : i = .s085_t7_sb008 then
    exact s085_t7_sb008_certificateData
  else if h9 : i = .s085_t7_sb009 then
    exact s085_t7_sb009_certificateData
  else if h10 : i = .s085_t7_sb010 then
    exact s085_t7_sb010_certificateData
  else if h11 : i = .s085_t7_sb011 then
    exact s085_t7_sb011_certificateData
  else if h12 : i = .s085_t7_sb012 then
    exact s085_t7_sb012_certificateData
  else if h13 : i = .s085_t7_sb013 then
    exact s085_t7_sb013_certificateData
  else if h14 : i = .s085_t7_sb014 then
    exact s085_t7_sb014_certificateData
  else if h15 : i = .s085_t7_sb015 then
    exact s085_t7_sb015_certificateData
  else if h16 : i = .s085_t7_sb016 then
    exact s085_t7_sb016_certificateData
  else if h17 : i = .s085_t7_sb017 then
    exact s085_t7_sb017_certificateData
  else if h18 : i = .s085_t7_sb018 then
    exact s085_t7_sb018_certificateData
  else if h19 : i = .s085_t7_sb019 then
    exact s085_t7_sb019_certificateData
  else if h20 : i = .s085_t7_sb020 then
    exact s085_t7_sb020_certificateData
  else if h21 : i = .s085_t7_sb021 then
    exact s085_t7_sb021_certificateData
  else if h22 : i = .s085_t7_sb022 then
    exact s085_t7_sb022_certificateData
  else if h23 : i = .s085_t7_sb023 then
    exact s085_t7_sb023_certificateData
  else if h24 : i = .s085_t7_sb024 then
    exact s085_t7_sb024_certificateData
  else if h25 : i = .s085_t7_sb025 then
    exact s085_t7_sb025_certificateData
  else if h26 : i = .s085_t7_sb026 then
    exact s085_t7_sb026_certificateData
  else if h27 : i = .s085_t7_sb027 then
    exact s085_t7_sb027_certificateData
  else if h28 : i = .s085_t7_sb028 then
    exact s085_t7_sb028_certificateData
  else if h29 : i = .s085_t7_sb029 then
    exact s085_t7_sb029_certificateData
  else if h30 : i = .s085_t7_sb030 then
    exact s085_t7_sb030_certificateData
  else if h31 : i = .s085_t7_sb031 then
    exact s085_t7_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S085T7
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
