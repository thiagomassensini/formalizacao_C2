import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.86_t0

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
namespace S086T0

open ProjectedJ0RectangleArithmetic

def s086_t0_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((503577451225259 : ℚ) / 125000000000000000)
              hi := ((2078031774260193 : ℚ) / 250000000000000000) }
      im := { lo := ((-431881012818107 : ℚ) / 6250000000000000)
              hi := ((-6485617359811433 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((2088123021095803 : ℚ) / 250000000000000000)
              hi := ((4842343299234003 : ℚ) / 500000000000000000) }
      im := { lo := ((-19008307821327239 : ℚ) / 5000000000000000000)
              hi := ((-24674826594775273 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7781661681378327 : ℚ) / 5000000000000000000)
              hi := ((-1151322445896889 : ℚ) / 1250000000000000000) }
      im := { lo := ((889049687436473 : ℚ) / 625000000000000000)
              hi := ((20576758853413173 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1009556428768717 : ℚ) / 1250000000000000000)
              hi := ((5636261005676883 : ℚ) / 10000000000000000000) }
      im := { lo := ((-14280328755130557 : ℚ) / 50000000000000000000)
              hi := ((5233035685825719 : ℚ) / 5000000000000000000) } }
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

def s086_t0_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((100800818898839 : ℚ) / 25000000000000000)
              hi := ((4157758846822077 : ℚ) / 500000000000000000) }
      im := { lo := ((-863566009130653 : ℚ) / 12500000000000000)
              hi := ((-6484057555440813 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8348314468187849 : ℚ) / 1000000000000000000)
              hi := ((4840158444251487 : ℚ) / 500000000000000000) }
      im := { lo := ((-3813721229676713 : ℚ) / 1000000000000000000)
              hi := ((-123988145259633 : ℚ) / 50000000000000000) } }
  DrestRect :=
    { re := { lo := ((-971162361816941 : ℚ) / 625000000000000000)
              hi := ((-9186020939071711 : ℚ) / 10000000000000000000) }
      im := { lo := ((1424248004871549 : ℚ) / 1000000000000000000)
              hi := ((20594286248633233 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1009410006273869 : ℚ) / 1250000000000000000)
              hi := ((176174885816633 : ℚ) / 312500000000000000) }
      im := { lo := ((-7139487524375799 : ℚ) / 25000000000000000000)
              hi := ((10466024159974407 : ℚ) / 10000000000000000000) } }
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

def s086_t0_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((807093008150393 : ℚ) / 200000000000000000)
              hi := ((1663785444285111 : ℚ) / 200000000000000000) }
      im := { lo := ((-431685044378477 : ℚ) / 6250000000000000)
              hi := ((-810312309307161 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((8344120858654727 : ℚ) / 1000000000000000000)
              hi := ((967593031833439 : ℚ) / 100000000000000000) }
      im := { lo := ((-1912887398799029 : ℚ) / 500000000000000000)
              hi := ((-2492037597799719 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-77569226903331 : ℚ) / 50000000000000000)
              hi := ((-2290359787969511 : ℚ) / 2500000000000000000) }
      im := { lo := ((7130066049692923 : ℚ) / 5000000000000000000)
              hi := ((4122355380492053 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8074110314369939 : ℚ) / 10000000000000000000)
              hi := ((1127786509585519 : ℚ) / 2000000000000000000) }
      im := { lo := ((-2855528133307539 : ℚ) / 10000000000000000000)
              hi := ((5232990257309191 : ℚ) / 5000000000000000000) } }
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

def s086_t0_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((20194579520113687 : ℚ) / 5000000000000000000)
              hi := ((8322356210936499 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3452697048486999 : ℚ) / 50000000000000000)
              hi := ((-6480940142551743 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8339911186549063 : ℚ) / 1000000000000000000)
              hi := ((9671526990081671 : ℚ) / 1000000000000000000) }
      im := { lo := ((-38378229874876293 : ℚ) / 10000000000000000000)
              hi := ((-626076492824093 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-242016692386233 : ℚ) / 156250000000000000)
              hi := ((-2284208040582319 : ℚ) / 2500000000000000000) }
      im := { lo := ((1784718661353571 : ℚ) / 1250000000000000000)
              hi := ((64466351943959 : ℚ) / 31250000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8072945671036403 : ℚ) / 10000000000000000000)
              hi := ((2820136530046033 : ℚ) / 5000000000000000000) }
      im := { lo := ((-5710516480500619 : ℚ) / 20000000000000000000)
              hi := ((10465933556416153 : ℚ) / 10000000000000000000) } }
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

def s086_t0_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((4042385927653447 : ℚ) / 1000000000000000000)
              hi := ((1665160819401211 : ℚ) / 200000000000000000) }
      im := { lo := ((-1380765632562909 : ℚ) / 20000000000000000)
              hi := ((-6479382631569301 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4167842648542747 : ℚ) / 500000000000000000)
              hi := ((4833553527535987 : ℚ) / 500000000000000000) }
      im := { lo := ((-7699730166346539 : ℚ) / 2000000000000000000)
              hi := ((-2516568697936191 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-773213257612403 : ℚ) / 500000000000000000)
              hi := ((-2278050366665281 : ℚ) / 2500000000000000000) }
      im := { lo := ((893458292973103 : ℚ) / 625000000000000000)
              hi := ((10323326124065397 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4035891638856737 : ℚ) / 5000000000000000000)
              hi := ((282080752011031 : ℚ) / 500000000000000000) }
      im := { lo := ((-7137462224151329 : ℚ) / 25000000000000000000)
              hi := ((10465882843629683 : ℚ) / 10000000000000000000) } }
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

def s086_t0_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((1011468744303311 : ℚ) / 250000000000000000)
              hi := ((8329271011856107 : ℚ) / 1000000000000000000) }
      im := { lo := ((-4313914327071 : ℚ) / 62500000000000)
              hi := ((-6477825933108473 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8331442978870243 : ℚ) / 1000000000000000000)
              hi := ((1932534151145203 : ℚ) / 200000000000000000) }
      im := { lo := ((-1930950401801577 : ℚ) / 500000000000000000)
              hi := ((-25288260136781047 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3859858946293259 : ℚ) / 2500000000000000000)
              hi := ((-9087547306312037 : ℚ) / 10000000000000000000) }
      im := { lo := ((14312882236871007 : ℚ) / 10000000000000000000)
              hi := ((645751118158971 : ℚ) / 312500000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1614124573608049 : ℚ) / 2000000000000000000)
              hi := ((5642958221107817 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1427354921882371 : ℚ) / 5000000000000000000)
              hi := ((654114383816097 : ℚ) / 625000000000000000) } }
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

def s086_t0_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((202469191642177 : ℚ) / 50000000000000000)
              hi := ((416637807903731 : ℚ) / 50000000000000000) }
      im := { lo := ((-6900698328907097 : ℚ) / 100000000000000000)
              hi := ((-3238135049596033 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((83271842177547 : ℚ) / 10000000000000000)
              hi := ((965821811612899 : ℚ) / 100000000000000000) }
      im := { lo := ((-7747860678508917 : ℚ) / 2000000000000000000)
              hi := ((-25410776811652367 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-15414580851762561 : ℚ) / 10000000000000000000)
              hi := ((-1132858641494861 : ℚ) / 1250000000000000000) }
      im := { lo := ((14330397382784621 : ℚ) / 10000000000000000000)
              hi := ((20681383693719247 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4034729741189139 : ℚ) / 5000000000000000000)
              hi := ((2822148822195297 : ℚ) / 5000000000000000000) }
      im := { lo := ((-5708859971556311 : ℚ) / 20000000000000000000)
              hi := ((10465772331984633 : ℚ) / 10000000000000000000) } }
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

def s086_t0_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((506614000689797 : ℚ) / 125000000000000000)
              hi := ((208406499165187 : ℚ) / 25000000000000000) }
      im := { lo := ((-6899134428564437 : ℚ) / 100000000000000000)
              hi := ((-3237357542873869 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((2080727358208951 : ℚ) / 250000000000000000)
              hi := ((4826874363081167 : ℚ) / 500000000000000000) }
      im := { lo := ((-19429767921645721 : ℚ) / 5000000000000000000)
              hi := ((-638330942447167 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1538969926233843 : ℚ) / 1000000000000000000)
              hi := ((-9038168109232743 : ℚ) / 10000000000000000000) }
      im := { lo := ((2869575871496461 : ℚ) / 2000000000000000000)
              hi := ((32341710450523 : ℚ) / 15625000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8068297730974943 : ℚ) / 10000000000000000000)
              hi := ((1129127584746971 : ℚ) / 2000000000000000000) }
      im := { lo := ((-3567685657784693 : ℚ) / 12500000000000000000)
              hi := ((16352675983133 : ℚ) / 15625000000000000) } }
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

def s086_t0_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((4056459841853027 : ℚ) / 1000000000000000000)
              hi := ((2084945531657233 : ℚ) / 250000000000000000) }
      im := { lo := ((-1724392817130669 : ℚ) / 25000000000000000)
              hi := ((-3236580425100351 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((4159309154471199 : ℚ) / 500000000000000000)
              hi := ((9649262936394313 : ℚ) / 1000000000000000000) }
      im := { lo := ((-19489854569626449 : ℚ) / 5000000000000000000)
              hi := ((-25655638581438107 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-15364792839986973 : ℚ) / 10000000000000000000)
              hi := ((-901344255151031 : ℚ) / 1000000000000000000) }
      im := { lo := ((3591331602362297 : ℚ) / 2500000000000000000)
              hi := ((20715970467553193 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2016783022650547 : ℚ) / 2500000000000000000)
              hi := ((5646973532876001 : ℚ) / 10000000000000000000) }
      im := { lo := ((-71346677455243 : ℚ) / 250000000000000000)
              hi := ((10465652665982827 : ℚ) / 10000000000000000000) } }
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

def s086_t0_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((2030013438364339 : ℚ) / 500000000000000000)
              hi := ((333732923289857 : ℚ) / 40000000000000000) }
      im := { lo := ((-6896008856997661 : ℚ) / 100000000000000000)
              hi := ((-808950923722361 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((4157155334603653 : ℚ) / 500000000000000000)
              hi := ((964476091928127 : ℚ) / 100000000000000000) }
      im := { lo := ((-7819965026567401 : ℚ) / 2000000000000000000)
              hi := ((-128889885112613 : ℚ) / 50000000000000000) } }
  DrestRect :=
    { re := { lo := ((-15339862560868759 : ℚ) / 10000000000000000000)
              hi := ((-4494345781408823 : ℚ) / 5000000000000000000) }
      im := { lo := ((14382737558284603 : ℚ) / 10000000000000000000)
              hi := ((20733211888568997 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4032982343541097 : ℚ) / 5000000000000000000)
              hi := ((5648306599766547 : ℚ) / 10000000000000000000) }
      im := { lo := ((-178348987427399 : ℚ) / 625000000000000000)
              hi := ((5232795270449569 : ℚ) / 5000000000000000000) } }
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

def s086_t0_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((4063613564783407 : ℚ) / 1000000000000000000)
              hi := ((1043360295399503 : ℚ) / 125000000000000000) }
      im := { lo := ((-344722357409129 : ℚ) / 5000000000000000)
              hi := ((-6470054754653333 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8309986981299623 : ℚ) / 1000000000000000000)
              hi := ((9640242231966769 : ℚ) / 1000000000000000000) }
      im := { lo := ((-784397637478711 : ℚ) / 200000000000000000)
              hi := ((-12950127367185253 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7657453503345723 : ℚ) / 5000000000000000000)
              hi := ((-8963916649909743 : ℚ) / 10000000000000000000) }
      im := { lo := ((14400114372131723 : ℚ) / 10000000000000000000)
              hi := ((2075041736150041 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8064795750542327 : ℚ) / 10000000000000000000)
              hi := ((5649637354698639 : ℚ) / 10000000000000000000) }
      im := { lo := ((-14266487410695807 : ℚ) / 50000000000000000000)
              hi := ((5232762555004261 : ℚ) / 5000000000000000000) } }
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

def s086_t0_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((4067219802941199 : ℚ) / 1000000000000000000)
              hi := ((4175230033574709 : ℚ) / 500000000000000000) }
      im := { lo := ((-861610769374073 : ℚ) / 12500000000000000)
              hi := ((-1293700587022229 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((1038205907269467 : ℚ) / 125000000000000000)
              hi := ((2408926720604707 : ℚ) / 250000000000000000) }
      im := { lo := ((-3933987532404967 : ℚ) / 1000000000000000000)
              hi := ((-2602247525755797 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3057985049217519 : ℚ) / 2000000000000000000)
              hi := ((-4469559429696013 : ℚ) / 5000000000000000000) }
      im := { lo := ((2883491528660919 : ℚ) / 2000000000000000000)
              hi := ((830703440801997 : ℚ) / 400000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4031813050949211 : ℚ) / 5000000000000000000)
              hi := ((5650966618725811 : ℚ) / 10000000000000000000) }
      im := { lo := ((-570602152412249 : ℚ) / 2000000000000000000)
              hi := ((5232729493705343 : ℚ) / 5000000000000000000) } }
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

def s086_t0_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((4070845357550123 : ℚ) / 1000000000000000000)
              hi := ((4177028182941649 : ℚ) / 500000000000000000) }
      im := { lo := ((-53838484239489 : ℚ) / 781250000000000)
              hi := ((-3233475914984757 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((4150645662210327 : ℚ) / 500000000000000000)
              hi := ((9631155055003213 : ℚ) / 1000000000000000000) }
      im := { lo := ((-394598054863039 : ℚ) / 100000000000000000)
              hi := ((-26144638065957763 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-954057361601869 : ℚ) / 625000000000000000)
              hi := ((-8914297781195623 : ℚ) / 10000000000000000000) }
      im := { lo := ((721738340038293 : ℚ) / 500000000000000000)
              hi := ((4156943668262289 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4031226966847007 : ℚ) / 5000000000000000000)
              hi := ((353268286762867 : ℚ) / 625000000000000000) }
      im := { lo := ((-2852730508043899 : ℚ) / 10000000000000000000)
              hi := ((1046539904359071 : ℚ) / 1000000000000000000) } }
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

def s086_t0_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((2037244440034313 : ℚ) / 500000000000000000)
              hi := ((4178836381295887 : ℚ) / 500000000000000000) }
      im := { lo := ((-3444883318188903 : ℚ) / 50000000000000000)
              hi := ((-1616350359925619 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((414845969471797 : ℚ) / 50000000000000000)
              hi := ((1504154149343 : ℚ) / 156250000000000) }
      im := { lo := ((-3957967651039437 : ℚ) / 1000000000000000000)
              hi := ((-2626673862823271 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-15239885360255501 : ℚ) / 10000000000000000000)
              hi := ((-1777890554009641 : ℚ) / 2000000000000000000) }
      im := { lo := ((14452041397193763 : ℚ) / 10000000000000000000)
              hi := ((325028354880639 : ℚ) / 156250000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8061290421083043 : ℚ) / 10000000000000000000)
              hi := ((5653626429302047 : ℚ) / 10000000000000000000) }
      im := { lo := ((-7131128882442131 : ℚ) / 25000000000000000000)
              hi := ((5232670056372567 : ℚ) / 5000000000000000000) } }
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

def s086_t0_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((509768607680821 : ℚ) / 125000000000000000)
              hi := ((8361310531339467 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6888208129512817 : ℚ) / 100000000000000000)
              hi := ((-64638517542861 : ℚ) / 1000000000000000) } }
  D0Rect :=
    { re := { lo := ((4146265702907441 : ℚ) / 500000000000000000)
              hi := ((9622001462353591 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1984974752639703 : ℚ) / 500000000000000000)
              hi := ((-26388769863289327 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-950926872041913 : ℚ) / 625000000000000000)
              hi := ((-8864581965158777 : ℚ) / 10000000000000000000) }
      im := { lo := ((7234639878710441 : ℚ) / 5000000000000000000)
              hi := ((2081887675956743 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8060144654775331 : ℚ) / 10000000000000000000)
              hi := ((113099544908149 : ℚ) / 200000000000000000) }
      im := { lo := ((-14260839660763813 : ℚ) / 50000000000000000000)
              hi := ((2093055246416947 : ℚ) / 2000000000000000000) } }
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

def s086_t0_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((8163651908819269 : ℚ) / 2000000000000000000)
              hi := ((8364969116099243 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3443325200221077 : ℚ) / 50000000000000000)
              hi := ((-3231151420384793 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((3315250992319 : ℚ) / 400000000000000)
              hi := ((9617399668688433 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1990962607305021 : ℚ) / 500000000000000000)
              hi := ((-662768506259501 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1898718638138323 : ℚ) / 1250000000000000000)
              hi := ((-552480493930709 : ℚ) / 625000000000000000) }
      im := { lo := ((7243242001274641 : ℚ) / 5000000000000000000)
              hi := ((20835902264295103 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8059014932606807 : ℚ) / 10000000000000000000)
              hi := ((353521458092161 : ℚ) / 625000000000000000) }
      im := { lo := ((-7129702398935791 : ℚ) / 25000000000000000000)
              hi := ((10465208716637553 : ℚ) / 10000000000000000000) } }
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

def s086_t0_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((255345150909311 : ℚ) / 62500000000000000)
              hi := ((1673729250958399 : ℚ) / 200000000000000000) }
      im := { lo := ((-1377018668391537 : ℚ) / 20000000000000000)
              hi := ((-6460754809640983 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1035463427105953 : ℚ) / 125000000000000000)
              hi := ((4806390699914279 : ℚ) / 500000000000000000) }
      im := { lo := ((-499236793147253 : ℚ) / 125000000000000000)
              hi := ((-13316326860646629 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-379116056447967 : ℚ) / 250000000000000000)
              hi := ((-4407385629192077 : ℚ) / 5000000000000000000) }
      im := { lo := ((1812956807007649 : ℚ) / 1250000000000000000)
              hi := ((208528908545297 : ℚ) / 100000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8057886270124731 : ℚ) / 10000000000000000000)
              hi := ((44200857006061 : ℚ) / 78125000000000000) }
      im := { lo := ((-2851589704831963 : ℚ) / 10000000000000000000)
              hi := ((10465136636408521 : ℚ) / 10000000000000000000) } }
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

def s086_t0_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((163569508743607 : ℚ) / 40000000000000000)
              hi := ((8372342447106907 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3441768499336347 : ℚ) / 50000000000000000)
              hi := ((-50462559533739 : ℚ) / 781250000000000) } }
  D0Rect :=
    { re := { lo := ((8279271094262351 : ℚ) / 1000000000000000000)
              hi := ((1921629355692461 : ℚ) / 200000000000000000) }
      im := { lo := ((-801171453847977 : ℚ) / 200000000000000000)
              hi := ((-26754506132413477 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7569755366166681 : ℚ) / 5000000000000000000)
              hi := ((-2197457695639587 : ℚ) / 2500000000000000000) }
      im := { lo := ((1452078990854121 : ℚ) / 1000000000000000000)
              hi := ((104349218282321 : ℚ) / 50000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4028380253498307 : ℚ) / 5000000000000000000)
              hi := ((707384773598559 : ℚ) / 1250000000000000000) }
      im := { lo := ((-2851293975074507 : ℚ) / 10000000000000000000)
              hi := ((654066237494503 : ℚ) / 625000000000000000) } }
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

def s086_t0_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((2046486347415691 : ℚ) / 500000000000000000)
              hi := ((837605684526149 : ℚ) / 100000000000000000) }
      im := { lo := ((-344099068170257 : ℚ) / 5000000000000000)
              hi := ((-3228830642913997 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((8274818421289527 : ℚ) / 1000000000000000000)
              hi := ((9603495935770453 : ℚ) / 1000000000000000000) }
      im := { lo := ((-8035628067733171 : ℚ) / 2000000000000000000)
              hi := ((-5375259294657291 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-377858875994041 : ℚ) / 250000000000000000)
              hi := ((-8764866118221773 : ℚ) / 10000000000000000000) }
      im := { lo := ((90861811754149 : ℚ) / 62500000000000000)
              hi := ((20886761091971563 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8055631031888247 : ℚ) / 10000000000000000000)
              hi := ((2830221097054091 : ℚ) / 5000000000000000000) }
      im := { lo := ((-7127486075045951 : ℚ) / 25000000000000000000)
              hi := ((1046497886816783 : ℚ) / 1000000000000000000) } }
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

def s086_t0_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((8193454854734163 : ℚ) / 2000000000000000000)
              hi := ((104747366923251 : ℚ) / 12500000000000000) }
      im := { lo := ((-1720106604325581 : ℚ) / 25000000000000000)
              hi := ((-645611582728753 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((1654069858960061 : ℚ) / 200000000000000000)
              hi := ((2399707240597597 : ℚ) / 250000000000000000) }
      im := { lo := ((-4029764288697367 : ℚ) / 1000000000000000000)
              hi := ((-1349901397561107 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-15089174530609993 : ℚ) / 10000000000000000000)
              hi := ((-34959511773113 : ℚ) / 40000000000000000) }
      im := { lo := ((7277477403460187 : ℚ) / 5000000000000000000)
              hi := ((20903642646229177 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8054497405689 : ℚ) / 10000000000000000)
              hi := ((5661801275440099 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2850691488504117 : ℚ) / 10000000000000000000)
              hi := ((81756986413911 : ℚ) / 78125000000000000) } }
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

def s086_t0_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((2050251055260963 : ℚ) / 500000000000000000)
              hi := ((838353979830461 : ℚ) / 100000000000000000) }
      im := { lo := ((-3439436072305911 : ℚ) / 50000000000000000)
              hi := ((-6454571268341851 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((82658643052037 : ℚ) / 10000000000000000)
              hi := ((4797072652635171 : ℚ) / 500000000000000000) }
      im := { lo := ((-404170794204199 : ℚ) / 100000000000000000)
              hi := ((-847490653955667 : ℚ) / 312500000000000000) } }
  DrestRect :=
    { re := { lo := ((-1506396787531861 : ℚ) / 1000000000000000000)
              hi := ((-8714867740198067 : ℚ) / 10000000000000000000) }
      im := { lo := ((1457198628242141 : ℚ) / 1000000000000000000)
              hi := ((2092048666051287 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8053361790526809 : ℚ) / 10000000000000000000)
              hi := ((2831578796343259 : ℚ) / 5000000000000000000) }
      im := { lo := ((-1425192467800079 : ℚ) / 5000000000000000000)
              hi := ((5232402882826741 : ℚ) / 5000000000000000000) } }
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

def s086_t0_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((8208593427706929 : ℚ) / 2000000000000000000)
              hi := ((4193654073787613 : ℚ) / 500000000000000000) }
      im := { lo := ((-6877318611838407 : ℚ) / 100000000000000000)
              hi := ((-6453027540415421 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8261363396405631 : ℚ) / 1000000000000000000)
              hi := ((9589445038156699 : ℚ) / 1000000000000000000) }
      im := { lo := ((-101341126825089 : ℚ) / 25000000000000000)
              hi := ((-136206571213367 : ℚ) / 50000000000000000) } }
  DrestRect :=
    { re := { lo := ((-15038735513666507 : ℚ) / 10000000000000000000)
              hi := ((-8689835161187073 : ℚ) / 10000000000000000000) }
      im := { lo := ((1458898390080289 : ℚ) / 1000000000000000000)
              hi := ((20937293487230013 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8052222231172089 : ℚ) / 10000000000000000000)
              hi := ((5664509194195677 : ℚ) / 10000000000000000000) }
      im := { lo := ((-28500791908039587 : ℚ) / 100000000000000000000)
              hi := ((1308089724980407 : ℚ) / 1250000000000000000) } }
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

def s086_t0_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((410811109601039 : ℚ) / 100000000000000000)
              hi := ((52444341023309 : ℚ) / 6250000000000000) }
      im := { lo := ((-6875765866978921 : ℚ) / 100000000000000000)
              hi := ((-806435575599929 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((4128423293904039 : ℚ) / 500000000000000000)
              hi := ((9584728145248609 : ℚ) / 1000000000000000000) }
      im := { lo := ((-813115182019969 : ℚ) / 200000000000000000)
              hi := ((-2736286512355939 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1876684763499773 : ℚ) / 1250000000000000000)
              hi := ((-4332389813223997 : ℚ) / 5000000000000000000) }
      im := { lo := ((7302973556457187 : ℚ) / 5000000000000000000)
              hi := ((2095406358044881 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8051078746937499 : ℚ) / 10000000000000000000)
              hi := ((5665856098324813 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2849775788253663 : ℚ) / 10000000000000000000)
              hi := ((10464631901443023 : ℚ) / 10000000000000000000) } }
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

def s086_t0_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((1644777822676919 : ℚ) / 400000000000000000)
              hi := ((8394899714775203 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3437107003348671 : ℚ) / 50000000000000000)
              hi := ((-1289988473683977 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((4126156823460349 : ℚ) / 500000000000000000)
              hi := ((9579994887009993 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2038750405693953 : ℚ) / 500000000000000000)
              hi := ((-1374217479784021 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7494098617175537 : ℚ) / 5000000000000000000)
              hi := ((-269990614815043 : ℚ) / 312500000000000000) }
      im := { lo := ((14622874436201123 : ℚ) / 10000000000000000000)
              hi := ((2097079837727963 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4024966310215791 : ℚ) / 5000000000000000000)
              hi := ((5667199588822799 : ℚ) / 10000000000000000000) }
      im := { lo := ((-5698955960533439 : ℚ) / 20000000000000000000)
              hi := ((1046455132376317 : ℚ) / 1000000000000000000) } }
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

def s086_t0_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((8231595023439611 : ℚ) / 2000000000000000000)
              hi := ((839872318753799 : ℚ) / 100000000000000000) }
      im := { lo := ((-6872662878187227 : ℚ) / 100000000000000000)
              hi := ((-644840098760643 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((8247764725174139 : ℚ) / 1000000000000000000)
              hi := ((4787622558616333 : ℚ) / 500000000000000000) }
      im := { lo := ((-4089419145834533 : ℚ) / 1000000000000000000)
              hi := ((-1380288675809383 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3740722756327243 : ℚ) / 2500000000000000000)
              hi := ((-8614597252803633 : ℚ) / 10000000000000000000) }
      im := { lo := ((14639767533933857 : ℚ) / 10000000000000000000)
              hi := ((419749922570471 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4024392794021543 : ℚ) / 5000000000000000000)
              hi := ((354283837654989 : ℚ) / 625000000000000000) }
      im := { lo := ((-71229465848463 : ℚ) / 250000000000000000)
              hi := ((1308058616812399 : ℚ) / 1250000000000000000) } }
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

def s086_t0_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((4119670162358223 : ℚ) / 1000000000000000000)
              hi := ((525160296990629 : ℚ) / 62500000000000000) }
      im := { lo := ((-3435556215428401 : ℚ) / 50000000000000000)
              hi := ((-6446860517182207 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8243199799363507 : ℚ) / 1000000000000000000)
              hi := ((957047890162819 : ℚ) / 100000000000000000) }
      im := { lo := ((-10253326950884999 : ℚ) / 2500000000000000000)
              hi := ((-2772713780968193 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7468779676929133 : ℚ) / 5000000000000000000)
              hi := ((-13743156211829 : ℚ) / 16000000000000000) }
      im := { lo := ((7328313260146119 : ℚ) / 5000000000000000000)
              hi := ((21004156691058267 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1609527421882721 : ℚ) / 2000000000000000000)
              hi := ((5669880999259711 : ℚ) / 10000000000000000000) }
      im := { lo := ((-14244374516734663 : ℚ) / 50000000000000000000)
              hi := ((130804773609261 : ℚ) / 125000000000000000) } }
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

def s086_t0_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((4123562851980991 : ℚ) / 1000000000000000000)
              hi := ((8406424062553193 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1717390673446489 : ℚ) / 25000000000000000)
              hi := ((-644532093421927 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((164772378463917 : ℚ) / 20000000000000000)
              hi := ((47828480929567 : ℚ) / 5000000000000000) }
      im := { lo := ((-4113236071431137 : ℚ) / 1000000000000000000)
              hi := ((-13924219161528999 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1491220315337129 : ℚ) / 1000000000000000000)
              hi := ((-428216248353523 : ℚ) / 500000000000000000) }
      im := { lo := ((1467345064185909 : ℚ) / 1000000000000000000)
              hi := ((10510390350026901 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8046484012264019 : ℚ) / 10000000000000000000)
              hi := ((2835607603844571 : ℚ) / 5000000000000000000) }
      im := { lo := ((-222544335268053 : ℚ) / 781250000000000000)
              hi := ((10464290891118043 : ℚ) / 10000000000000000000) } }
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

def s086_t0_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((20637376042816503 : ℚ) / 5000000000000000000)
              hi := ((8410301485662927 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3434006860545427 : ℚ) / 50000000000000000)
              hi := ((-805472773320689 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((51462636369027 : ℚ) / 6250000000000000)
              hi := ((2390224313634139 : ℚ) / 250000000000000000) }
      im := { lo := ((-515641874732843 : ℚ) / 125000000000000000)
              hi := ((-13984837467475957 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-14886823054808967 : ℚ) / 10000000000000000000)
              hi := ((-8539153694068781 : ℚ) / 10000000000000000000) }
      im := { lo := ((1469023914445979 : ℚ) / 1000000000000000000)
              hi := ((420747376957147 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8045326337433611 : ℚ) / 10000000000000000000)
              hi := ((226901762770663 : ℚ) / 400000000000000000) }
      im := { lo := ((-2848259273154087 : ℚ) / 10000000000000000000)
              hi := ((654012426061617 : ℚ) / 625000000000000000) } }
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

def s086_t0_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((4131407163080199 : ℚ) / 1000000000000000000)
              hi := ((2103549266385443 : ℚ) / 250000000000000000) }
      im := { lo := ((-3433232738288221 : ℚ) / 50000000000000000)
              hi := ((-6442244314620331 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1645881675362739 : ℚ) / 200000000000000000)
              hi := ((9556082254983153 : ℚ) / 1000000000000000000) }
      im := { lo := ((-517128406232953 : ℚ) / 125000000000000000)
              hi := ((-2809085039555831 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3715354659073987 : ℚ) / 2500000000000000000)
              hi := ((-8513959361251891 : ℚ) / 10000000000000000000) }
      im := { lo := ((1470699231222259 : ℚ) / 1000000000000000000)
              hi := ((1052696041280881 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1608832987353429 : ℚ) / 2000000000000000000)
              hi := ((5673868436096801 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2847948729303003 : ℚ) / 10000000000000000000)
              hi := ((5232052074211717 : ℚ) / 5000000000000000000) } }
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

def s086_t0_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((2067679292573987 : ℚ) / 500000000000000000)
              hi := ((8418110928728167 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3432458998398217 : ℚ) / 50000000000000000)
              hi := ((-1610176822033729 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((8224778424126163 : ℚ) / 1000000000000000000)
              hi := ((76410010893811 : ℚ) / 8000000000000000) }
      im := { lo := ((-4148912635509513 : ℚ) / 1000000000000000000)
              hi := ((-881623939994959 : ℚ) / 312500000000000000) } }
  DrestRect :=
    { re := { lo := ((-7417994942795111 : ℚ) / 5000000000000000000)
              hi := ((-848874206801043 : ℚ) / 1000000000000000000) }
      im := { lo := ((294474199894263 : ℚ) / 200000000000000000)
              hi := ((21070436677393793 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4021499612887483 : ℚ) / 5000000000000000000)
              hi := ((5675187724465001 : ℚ) / 10000000000000000000) }
      im := { lo := ((-14238193798687173 : ℚ) / 50000000000000000000)
              hi := ((10464009787214473 : ℚ) / 10000000000000000000) } }
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

def s086_t0_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((2069664568378477 : ℚ) / 500000000000000000)
              hi := ((1684408677505711 : ℚ) / 200000000000000000) }
      im := { lo := ((-6863371439982163 : ℚ) / 100000000000000000)
              hi := ((-6439170949395569 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4110066166990659 : ℚ) / 500000000000000000)
              hi := ((954640423068173 : ℚ) / 100000000000000000) }
      im := { lo := ((-4160791173075119 : ℚ) / 1000000000000000000)
              hi := ((-3541627676876483 : ℚ) / 1250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7405268091077457 : ℚ) / 5000000000000000000)
              hi := ((-2115875637711211 : ℚ) / 2500000000000000000) }
      im := { lo := ((368509825603733 : ℚ) / 250000000000000000)
              hi := ((10543457763554911 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8041829896807817 : ℚ) / 10000000000000000000)
              hi := ((227060105105471 : ℚ) / 400000000000000000) }
      im := { lo := ((-28473404021618837 : ℚ) / 100000000000000000000)
              hi := ((1307990846285743 : ℚ) / 1250000000000000000) } }
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

def s086_t0_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((64509546961 : ℚ) / 1000000000000)
      ((-193680497 : ℚ) / 1000000000000)
      ((975479453 : ℚ) / 250000000000) where
  MRect :=
    { re := { lo := ((414331661092063 : ℚ) / 100000000000000000)
              hi := ((4212998326036557 : ℚ) / 500000000000000000) }
      im := { lo := ((-6861826016817159 : ℚ) / 100000000000000000)
              hi := ((-6437635106663299 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((821546971532971 : ℚ) / 100000000000000000)
              hi := ((2385385316467753 : ℚ) / 250000000000000000) }
      im := { lo := ((-208633141859971 : ℚ) / 50000000000000000)
              hi := ((-2845401619668049 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-14785058426538657 : ℚ) / 10000000000000000000)
              hi := ((-8438240004835667 : ℚ) / 10000000000000000000) }
      im := { lo := ((3689260082023089 : ℚ) / 2500000000000000000)
              hi := ((2637919796354841 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-80406666072997 : ℚ) / 100000000000000000)
              hi := ((1135564560421763 : ℚ) / 2000000000000000000) }
      im := { lo := ((-14235315960479093 : ℚ) / 50000000000000000000)
              hi := ((10463864642614863 : ℚ) / 10000000000000000000) } }
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
    (hi : i ∈ positiveBoxSubboxesOf .s086_t0) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s086_t0).constants.mainLower)
      ((positiveBoxCombinedCert .s086_t0).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s086_t0).constants.restUpper) := by
  if h0 : i = .s086_t0_sb000 then
    exact s086_t0_sb000_certificateData
  else if h1 : i = .s086_t0_sb001 then
    exact s086_t0_sb001_certificateData
  else if h2 : i = .s086_t0_sb002 then
    exact s086_t0_sb002_certificateData
  else if h3 : i = .s086_t0_sb003 then
    exact s086_t0_sb003_certificateData
  else if h4 : i = .s086_t0_sb004 then
    exact s086_t0_sb004_certificateData
  else if h5 : i = .s086_t0_sb005 then
    exact s086_t0_sb005_certificateData
  else if h6 : i = .s086_t0_sb006 then
    exact s086_t0_sb006_certificateData
  else if h7 : i = .s086_t0_sb007 then
    exact s086_t0_sb007_certificateData
  else if h8 : i = .s086_t0_sb008 then
    exact s086_t0_sb008_certificateData
  else if h9 : i = .s086_t0_sb009 then
    exact s086_t0_sb009_certificateData
  else if h10 : i = .s086_t0_sb010 then
    exact s086_t0_sb010_certificateData
  else if h11 : i = .s086_t0_sb011 then
    exact s086_t0_sb011_certificateData
  else if h12 : i = .s086_t0_sb012 then
    exact s086_t0_sb012_certificateData
  else if h13 : i = .s086_t0_sb013 then
    exact s086_t0_sb013_certificateData
  else if h14 : i = .s086_t0_sb014 then
    exact s086_t0_sb014_certificateData
  else if h15 : i = .s086_t0_sb015 then
    exact s086_t0_sb015_certificateData
  else if h16 : i = .s086_t0_sb016 then
    exact s086_t0_sb016_certificateData
  else if h17 : i = .s086_t0_sb017 then
    exact s086_t0_sb017_certificateData
  else if h18 : i = .s086_t0_sb018 then
    exact s086_t0_sb018_certificateData
  else if h19 : i = .s086_t0_sb019 then
    exact s086_t0_sb019_certificateData
  else if h20 : i = .s086_t0_sb020 then
    exact s086_t0_sb020_certificateData
  else if h21 : i = .s086_t0_sb021 then
    exact s086_t0_sb021_certificateData
  else if h22 : i = .s086_t0_sb022 then
    exact s086_t0_sb022_certificateData
  else if h23 : i = .s086_t0_sb023 then
    exact s086_t0_sb023_certificateData
  else if h24 : i = .s086_t0_sb024 then
    exact s086_t0_sb024_certificateData
  else if h25 : i = .s086_t0_sb025 then
    exact s086_t0_sb025_certificateData
  else if h26 : i = .s086_t0_sb026 then
    exact s086_t0_sb026_certificateData
  else if h27 : i = .s086_t0_sb027 then
    exact s086_t0_sb027_certificateData
  else if h28 : i = .s086_t0_sb028 then
    exact s086_t0_sb028_certificateData
  else if h29 : i = .s086_t0_sb029 then
    exact s086_t0_sb029_certificateData
  else if h30 : i = .s086_t0_sb030 then
    exact s086_t0_sb030_certificateData
  else if h31 : i = .s086_t0_sb031 then
    exact s086_t0_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S086T0
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
