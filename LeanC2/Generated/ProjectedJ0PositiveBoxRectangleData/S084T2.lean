import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.84_t2

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
namespace S084T2

open ProjectedJ0RectangleArithmetic

def s084_t2_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((13753102669693327 : ℚ) / 10000000000000000000)
              hi := ((3165794854317711 : ℚ) / 500000000000000000) }
      im := { lo := ((-1346048424532923 : ℚ) / 20000000000000000)
              hi := ((-779891250981677 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((620521132379813 : ℚ) / 62500000000000000)
              hi := ((18367433596857 : ℚ) / 1600000000000000) }
      im := { lo := ((-1171084036496303 : ℚ) / 200000000000000000)
              hi := ((-2152501143464923 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8393526494987251 : ℚ) / 5000000000000000000)
              hi := ((-2296782020292117 : ℚ) / 2500000000000000000) }
      im := { lo := ((9824536197086027 : ℚ) / 5000000000000000000)
              hi := ((13624747895967543 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8979576978284983 : ℚ) / 10000000000000000000)
              hi := ((6715221741052109 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3614903649570951 : ℚ) / 10000000000000000000)
              hi := ((5817758393129083 : ℚ) / 5000000000000000000) } }
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

def s084_t2_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((13818210348633619 : ℚ) / 10000000000000000000)
              hi := ((6338029815254087 : ℚ) / 1000000000000000000) }
      im := { lo := ((-841051775435827 : ℚ) / 12500000000000000)
              hi := ((-12474626434303121 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((9921546502495167 : ℚ) / 1000000000000000000)
              hi := ((1147261848332477 : ℚ) / 100000000000000000) }
      im := { lo := ((-11739452039261817 : ℚ) / 2000000000000000000)
              hi := ((-4319573569778579 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-16753707726039403 : ℚ) / 10000000000000000000)
              hi := ((-2288514923497917 : ℚ) / 2500000000000000000) }
      im := { lo := ((4916917921670631 : ℚ) / 2500000000000000000)
              hi := ((5453566900339983 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-561144850551261 : ℚ) / 625000000000000000)
              hi := ((6716433561031819 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3614699806190899 : ℚ) / 10000000000000000000)
              hi := ((11635382836817907 : ℚ) / 10000000000000000000) } }
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

def s084_t2_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1735442624686109 : ℚ) / 1250000000000000000)
              hi := ((1268898408117619 : ℚ) / 200000000000000000) }
      im := { lo := ((-6726587275703909 : ℚ) / 100000000000000000)
              hi := ((-3897185961204161 : ℚ) / 62500000000000000) } }
  D0Rect :=
    { re := { lo := ((991473527092137 : ℚ) / 100000000000000000)
              hi := ((11465571619847393 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5884022570473817 : ℚ) / 1000000000000000000)
              hi := ((-2167067677016307 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-334406731448447 : ℚ) / 200000000000000000)
              hi := ((-2280241179137723 : ℚ) / 2500000000000000000) }
      im := { lo := ((19686223601332537 : ℚ) / 10000000000000000000)
              hi := ((2728612663076307 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1795411728237989 : ℚ) / 2000000000000000000)
              hi := ((839705607267411 : ℚ) / 1250000000000000000) }
      im := { lo := ((-18072455439110613 : ℚ) / 50000000000000000000)
              hi := ((5817621959223133 : ℚ) / 5000000000000000000) } }
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

def s084_t2_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((6974546052026761 : ℚ) / 5000000000000000000)
              hi := ((1587744180962871 : ℚ) / 250000000000000000) }
      im := { lo := ((-6724761333980257 : ℚ) / 100000000000000000)
              hi := ((-6233682981331949 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((2476976244028299 : ℚ) / 250000000000000000)
              hi := ((11458504896572347 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2949154802586033 : ℚ) / 500000000000000000)
              hi := ((-271792987072963 : ℚ) / 62500000000000000) } }
  DrestRect :=
    { re := { lo := ((-16686937944913251 : ℚ) / 10000000000000000000)
              hi := ((-908784492724389 : ℚ) / 1000000000000000000) }
      im := { lo := ((3940945990086743 : ℚ) / 2000000000000000000)
              hi := ((27304370269672757 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1795161087222697 : ℚ) / 2000000000000000000)
              hi := ((839857623374067 : ℚ) / 1250000000000000000) }
      im := { lo := ((-7228555348848673 : ℚ) / 20000000000000000000)
              hi := ((1163510021097083 : ℚ) / 1000000000000000000) } }
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

def s084_t2_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1401487246222573 : ℚ) / 1000000000000000000)
              hi := ((6357482817515931 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3361468203483269 : ℚ) / 50000000000000000)
              hi := ((-6231869527647969 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((495052787472827 : ℚ) / 50000000000000000)
              hi := ((5725709102172393 : ℚ) / 500000000000000000) }
      im := { lo := ((-184768334420387 : ℚ) / 31250000000000000)
              hi := ((-4363231278411383 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8326755263403779 : ℚ) / 5000000000000000000)
              hi := ((-4527350870725577 : ℚ) / 5000000000000000000) }
      im := { lo := ((19723191929967607 : ℚ) / 10000000000000000000)
              hi := ((2732256418333499 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8974551277582407 : ℚ) / 10000000000000000000)
              hi := ((6720075241124781 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2258791146220379 : ℚ) / 6250000000000000000)
              hi := ((2326991597537461 : ℚ) / 2000000000000000000) } }
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

def s084_t2_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((352022206424649 : ℚ) / 250000000000000000)
              hi := ((795501226000227 : ℚ) / 125000000000000000) }
      im := { lo := ((-3360556192700607 : ℚ) / 50000000000000000)
              hi := ((-15575143216209739 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((989418742842927 : ℚ) / 100000000000000000)
              hi := ((2288862343220563 : ℚ) / 200000000000000000) }
      im := { lo := ((-5926853830721121 : ℚ) / 1000000000000000000)
              hi := ((-1094441443341677 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-16620054754797723 : ℚ) / 10000000000000000000)
              hi := ((-4510767421922083 : ℚ) / 5000000000000000000) }
      im := { lo := ((1974160901866263 : ℚ) / 1000000000000000000)
              hi := ((13670354388014667 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8973293607529383 : ℚ) / 10000000000000000000)
              hi := ((6721285056914901 : ℚ) / 10000000000000000000) }
      im := { lo := ((-180692429894313 : ℚ) / 500000000000000000)
              hi := ((1163481027743747 : ℚ) / 1000000000000000000) } }
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

def s084_t2_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((3536784730849349 : ℚ) / 2500000000000000000)
              hi := ((796319706997287 : ℚ) / 125000000000000000) }
      im := { lo := ((-6719289308515843 : ℚ) / 100000000000000000)
              hi := ((-194632694531829 : ℚ) / 3125000000000000) } }
  D0Rect :=
    { re := { lo := ((4943649945479963 : ℚ) / 500000000000000000)
              hi := ((357412050472251 : ℚ) / 31250000000000000) }
      im := { lo := ((-1485277818437547 : ℚ) / 250000000000000000)
              hi := ((-1098072738645101 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-16586571873992407 : ℚ) / 10000000000000000000)
              hi := ((-8988343174429593 : ℚ) / 10000000000000000000) }
      im := { lo := ((987999006919671 : ℚ) / 500000000000000000)
              hi := ((13679402558396357 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1794406117870567 : ℚ) / 2000000000000000000)
              hi := ((6722488601289683 : ℚ) / 10000000000000000000) }
      im := { lo := ((-9034067215965101 : ℚ) / 25000000000000000000)
              hi := ((11634658002879503 : ℚ) / 10000000000000000000) } }
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

def s084_t2_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((710681091408113 : ℚ) / 500000000000000000)
              hi := ((6377126651793023 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3358733594413287 : ℚ) / 50000000000000000)
              hi := ((-15566090841509941 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((154381137583951 : ℚ) / 15625000000000000)
              hi := ((71437751364503 : ℚ) / 6250000000000000) }
      im := { lo := ((-5955358901614561 : ℚ) / 1000000000000000000)
              hi := ((-881361378203903 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3310612471540019 : ℚ) / 2000000000000000000)
              hi := ((-4477563164240221 : ℚ) / 5000000000000000000) }
      im := { lo := ((197783045544537 : ℚ) / 100000000000000000)
              hi := ((219014830397153 : ℚ) / 80000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4485381211870663 : ℚ) / 5000000000000000000)
              hi := ((420230379687651 : ℚ) / 625000000000000000) }
      im := { lo := ((-90335025368769 : ℚ) / 250000000000000000)
              hi := ((11634501480930091 : ℚ) / 10000000000000000000) } }
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

def s084_t2_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((3570083131597153 : ℚ) / 2500000000000000000)
              hi := ((15959293054892611 : ℚ) / 2500000000000000000) }
      im := { lo := ((-1343129217919771 : ℚ) / 20000000000000000)
              hi := ((-3112313781062191 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((4936733264213387 : ℚ) / 500000000000000000)
              hi := ((1142287521351093 : ℚ) / 100000000000000000) }
      im := { lo := ((-2984798462141729 : ℚ) / 500000000000000000)
              hi := ((-2210656662473647 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4129881547742893 : ℚ) / 2500000000000000000)
              hi := ((-4460942241179581 : ℚ) / 5000000000000000000) }
      im := { lo := ((791863305763949 : ℚ) / 400000000000000000)
              hi := ((13697427203326583 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8969492495507757 : ℚ) / 10000000000000000000)
              hi := ((1344976172546161 : ℚ) / 2000000000000000000) }
      im := { lo := ((-90329339121299 : ℚ) / 250000000000000000)
              hi := ((232686865884189 : ℚ) / 200000000000000000) } }
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

def s084_t2_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((7173626673280529 : ℚ) / 5000000000000000000)
              hi := ((639033106527957 : ℚ) / 100000000000000000) }
      im := { lo := ((-671382612837473 : ℚ) / 10000000000000000)
              hi := ((-2489127916122367 : ℚ) / 40000000000000000) } }
  D0Rect :=
    { re := { lo := ((2466630178324521 : ℚ) / 250000000000000000)
              hi := ((1141569098080067 : ℚ) / 100000000000000000) }
      im := { lo := ((-2393530451846217 : ℚ) / 400000000000000000)
              hi := ((-2217904708307311 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-16485966451436503 : ℚ) / 10000000000000000000)
              hi := ((-2222153676010381 : ℚ) / 2500000000000000000) }
      im := { lo := ((1981481161254483 : ℚ) / 1000000000000000000)
              hi := ((27412809669889403 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4484114191646987 : ℚ) / 5000000000000000000)
              hi := ((6726080546483867 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3612944396146393 : ℚ) / 10000000000000000000)
              hi := ((2326836660882103 : ℚ) / 2000000000000000000) } }
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

def s084_t2_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((450450012176139 : ℚ) / 312500000000000000)
              hi := ((1279393322542531 : ℚ) / 200000000000000000) }
      im := { lo := ((-3356003598541067 : ℚ) / 50000000000000000)
              hi := ((-6221013133478189 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((9859555808996877 : ℚ) / 1000000000000000000)
              hi := ((2852121771194139 : ℚ) / 250000000000000000) }
      im := { lo := ((-93719468818797 : ℚ) / 15625000000000000)
              hi := ((-4450295612180629 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-658095237493097 : ℚ) / 400000000000000000)
              hi := ((-8855319325830253 : ℚ) / 10000000000000000000) }
      im := { lo := ((1983299365046271 : ℚ) / 1000000000000000000)
              hi := ((2743071728195223 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4483481801222969 : ℚ) / 5000000000000000000)
              hi := ((1345455727923771 : ℚ) / 2000000000000000000) }
      im := { lo := ((-1806355963986883 : ℚ) / 5000000000000000000)
              hi := ((2908504982683563 : ℚ) / 2500000000000000000) } }
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

def s084_t2_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((7240887447108053 : ℚ) / 5000000000000000000)
              hi := ((12807247301797501 : ℚ) / 2000000000000000000) }
      im := { lo := ((-6710189273065163 : ℚ) / 100000000000000000)
              hi := ((-1243841523964347 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((492628594334609 : ℚ) / 50000000000000000)
              hi := ((1140126349336257 : ℚ) / 100000000000000000) }
      im := { lo := ((-751532022521043 : ℚ) / 125000000000000000)
              hi := ((-4464772251942199 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-513086519886577 : ℚ) / 312500000000000000)
              hi := ((-8821999485961597 : ℚ) / 10000000000000000000) }
      im := { lo := ((992556483338339 : ℚ) / 500000000000000000)
              hi := ((13724288161277103 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2241424516784003 : ℚ) / 2500000000000000000)
              hi := ((53827800483633 : ℚ) / 80000000000000000) }
      im := { lo := ((-7224953168374729 : ℚ) / 20000000000000000000)
              hi := ((11633853599891727 : ℚ) / 10000000000000000000) } }
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

def s084_t2_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1454938340977091 : ℚ) / 1000000000000000000)
              hi := ((6410301582048447 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6708372327291663 : ℚ) / 100000000000000000)
              hi := ((-1243480656598139 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((1969113797469707 : ℚ) / 200000000000000000)
              hi := ((2848505042049331 : ℚ) / 250000000000000000) }
      im := { lo := ((-6026456579647437 : ℚ) / 1000000000000000000)
              hi := ((-895847869212891 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8192564699130979 : ℚ) / 5000000000000000000)
              hi := ((-439432772238417 : ℚ) / 500000000000000000) }
      im := { lo := ((9934609899983377 : ℚ) / 5000000000000000000)
              hi := ((13733193261039327 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2241107026785001 : ℚ) / 2500000000000000000)
              hi := ((6729666136308377 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1444895101398421 : ℚ) / 4000000000000000000)
              hi := ((11633683700753173 : ℚ) / 10000000000000000000) } }
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

def s084_t2_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((913576412839 : ℚ) / 625000000000000)
              hi := ((641700068032267 : ℚ) / 100000000000000000) }
      im := { lo := ((-268262254118651 : ℚ) / 4000000000000000)
              hi := ((-12431200270852373 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((2459636720889211 : ℚ) / 250000000000000000)
              hi := ((2277351477309189 : ℚ) / 200000000000000000) }
      im := { lo := ((-1510161717857367 : ℚ) / 250000000000000000)
              hi := ((-2246848587987861 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1635146302701883 : ℚ) / 1000000000000000000)
              hi := ((-8755287572670641 : ℚ) / 10000000000000000000) }
      im := { lo := ((1988726401432709 : ℚ) / 1000000000000000000)
              hi := ((1374207393964273 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8963155123759333 : ℚ) / 10000000000000000000)
              hi := ((1682713317627969 : ℚ) / 2500000000000000000) }
      im := { lo := ((-36119954260174287 : ℚ) / 100000000000000000000)
              hi := ((1163351022503539 : ℚ) / 1000000000000000000) } }
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

def s084_t2_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((14685290584562321 : ℚ) / 10000000000000000000)
              hi := ((1605930282070841 : ℚ) / 250000000000000000) }
      im := { lo := ((-3352370685356279 : ℚ) / 50000000000000000)
              hi := ((-31068990809618207 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((4915752876558593 : ℚ) / 500000000000000000)
              hi := ((5689737495563261 : ℚ) / 500000000000000000) }
      im := { lo := ((-605482709742607 : ℚ) / 100000000000000000)
              hi := ((-4508145646499609 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-16317769405140897 : ℚ) / 10000000000000000000)
              hi := ((-2180474027966919 : ℚ) / 2500000000000000000) }
      im := { lo := ((99526312876287 : ℚ) / 50000000000000000)
              hi := ((5500372009331689 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-448094045565131 : ℚ) / 500000000000000000)
              hi := ((1683009564438047 : ℚ) / 2500000000000000000) }
      im := { lo := ((-36117502816505973 : ℚ) / 100000000000000000000)
              hi := ((5816666927041291 : ℚ) / 5000000000000000000) } }
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

def s084_t2_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((3688394150857037 : ℚ) / 2500000000000000000)
              hi := ((6430463974712253 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1340585495979427 : ℚ) / 20000000000000000)
              hi := ((-6211997266949789 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1964888858190333 : ℚ) / 200000000000000000)
              hi := ((1137217430426493 : ℚ) / 100000000000000000) }
      im := { lo := ((-6068998388504573 : ℚ) / 1000000000000000000)
              hi := ((-4522583582067577 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4071013647542871 : ℚ) / 2500000000000000000)
              hi := ((-4344237555544729 : ℚ) / 5000000000000000000) }
      im := { lo := ((19923209356301477 : ℚ) / 10000000000000000000)
              hi := ((27519529080757147 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1792120627743477 : ℚ) / 2000000000000000000)
              hi := ((6733218768477849 : ℚ) / 10000000000000000000) }
      im := { lo := ((-36114998538386327 : ℚ) / 100000000000000000000)
              hi := ((1163315212237619 : ℚ) / 1000000000000000000) } }
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

def s084_t2_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((14822076006777269 : ℚ) / 10000000000000000000)
              hi := ((1287445933968003 : ℚ) / 200000000000000000) }
      im := { lo := ((-3350557489691453 : ℚ) / 50000000000000000)
              hi := ((-31050985813258103 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((4908681804763857 : ℚ) / 500000000000000000)
              hi := ((5682427126716843 : ℚ) / 500000000000000000) }
      im := { lo := ((-3041580591421663 : ℚ) / 500000000000000000)
              hi := ((-9074020973456427 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4062579389048073 : ℚ) / 2500000000000000000)
              hi := ((-8655025762579137 : ℚ) / 10000000000000000000) }
      im := { lo := ((19941106279484527 : ℚ) / 10000000000000000000)
              hi := ((220297223952459 : ℚ) / 80000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8959323803261329 : ℚ) / 10000000000000000000)
              hi := ((1683599199927839 : ℚ) / 2500000000000000000) }
      im := { lo := ((-36112633005623947 : ℚ) / 100000000000000000000)
              hi := ((1454123024047573 : ℚ) / 1250000000000000000) } }
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

def s084_t2_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((14890791471675303 : ℚ) / 10000000000000000000)
              hi := ((6444017924769477 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6699303936271657 : ℚ) / 100000000000000000)
              hi := ((-6208397772826649 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((245256597811081 : ℚ) / 25000000000000000)
              hi := ((2271502929322021 : ℚ) / 200000000000000000) }
      im := { lo := ((-6097314967925207 : ℚ) / 1000000000000000000)
              hi := ((-2275713406430829 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-405413915495379 : ℚ) / 250000000000000000)
              hi := ((-43107749337629 : ℚ) / 50000000000000000) }
      im := { lo := ((997947744184609 : ℚ) / 500000000000000000)
              hi := ((27554730141364707 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8958040646062519 : ℚ) / 10000000000000000000)
              hi := ((6735570095013707 : ℚ) / 10000000000000000000) }
      im := { lo := ((-7222098611667947 : ℚ) / 20000000000000000000)
              hi := ((11632838740568933 : ℚ) / 10000000000000000000) } }
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

def s084_t2_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((299194647479823 : ℚ) / 200000000000000000)
              hi := ((6450827792844419 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6697493906964469 : ℚ) / 100000000000000000)
              hi := ((-1241319911702329 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((1960629038375707 : ℚ) / 200000000000000000)
              hi := ((283753888196241 : ℚ) / 25000000000000000) }
      im := { lo := ((-1222291787313871 : ℚ) / 200000000000000000)
              hi := ((-142682291560037 : ℚ) / 31250000000000000) } }
  DrestRect :=
    { re := { lo := ((-8091384879197189 : ℚ) / 5000000000000000000)
              hi := ((-429402479114703 : ℚ) / 500000000000000000) }
      im := { lo := ((9988378401056797 : ℚ) / 5000000000000000000)
              hi := ((13786129428599379 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4478378837747943 : ℚ) / 5000000000000000000)
              hi := ((6736742661771937 : ℚ) / 10000000000000000000) }
      im := { lo := ((-361083065866773 : ℚ) / 1000000000000000000)
              hi := ((2908172141289591 : ℚ) / 2500000000000000000) } }
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

def s084_t2_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((15028895542394303 : ℚ) / 10000000000000000000)
              hi := ((807207444217683 : ℚ) / 125000000000000000) }
      im := { lo := ((-1673921226401583 : ℚ) / 25000000000000000)
              hi := ((-775600313864683 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((9796006902442487 : ℚ) / 1000000000000000000)
              hi := ((11342777474130683 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6125592684624979 : ℚ) / 1000000000000000000)
              hi := ((-572528797663127 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-252327457096543 : ℚ) / 156250000000000000)
              hi := ((-8554524779798661 : ℚ) / 10000000000000000000) }
      im := { lo := ((4998627820024757 : ℚ) / 2500000000000000000)
              hi := ((27589739815772727 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-139929284213903 : ℚ) / 156250000000000000)
              hi := ((3368956899935089 : ℚ) / 5000000000000000000) }
      im := { lo := ((-451326126758291 : ℚ) / 1250000000000000000)
              hi := ((581626766106659 : ℚ) / 500000000000000000) } }
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

def s084_t2_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1509827418232273 : ℚ) / 1000000000000000000)
              hi := ((64645138998773 : ℚ) / 10000000000000000) }
      im := { lo := ((-104591828370059 : ℚ) / 1562500000000000)
              hi := ((-1240601308996029 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((9788849474989163 : ℚ) / 1000000000000000000)
              hi := ((566769003471909 : ℚ) / 50000000000000000) }
      im := { lo := ((-6139717147844469 : ℚ) / 1000000000000000000)
              hi := ((-2297308491391389 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8057560427326293 : ℚ) / 5000000000000000000)
              hi := ((-4260486910025639 : ℚ) / 5000000000000000000) }
      im := { lo := ((4002443467620593 : ℚ) / 2000000000000000000)
              hi := ((3450896739443067 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8954194740685939 : ℚ) / 10000000000000000000)
              hi := ((105298250953863 : ℚ) / 156250000000000000) }
      im := { lo := ((-36103843180376017 : ℚ) / 100000000000000000000)
              hi := ((290809473875433 : ℚ) / 250000000000000000) } }
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

def s084_t2_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((7583930358739403 : ℚ) / 5000000000000000000)
              hi := ((258855659073903 : ℚ) / 40000000000000000) }
      im := { lo := ((-133841406055697 : ℚ) / 2000000000000000)
              hi := ((-3100605802023419 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((4890836196681239 : ℚ) / 500000000000000000)
              hi := ((2831990968184879 : ℚ) / 250000000000000000) }
      im := { lo := ((-6153833211998777 : ℚ) / 1000000000000000000)
              hi := ((-460899220202917 : ℚ) / 100000000000000000) } }
  DrestRect :=
    { re := { lo := ((-643250571638367 : ℚ) / 400000000000000000)
              hi := ((-4243696564039369 : ℚ) / 5000000000000000000) }
      im := { lo := ((200298715091903 : ℚ) / 100000000000000000)
              hi := ((13812282291791537 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2238229870780969 : ℚ) / 2500000000000000000)
              hi := ((6740265605263093 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1805077099365593 : ℚ) / 5000000000000000000)
              hi := ((5816108548047081 : ℚ) / 5000000000000000000) } }
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

def s084_t2_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((761883384357599 : ℚ) / 500000000000000000)
              hi := ((25913164462377 : ℚ) / 4000000000000000) }
      im := { lo := ((-6690264731999537 : ℚ) / 100000000000000000)
              hi := ((-12398835465758741 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((977447645058711 : ℚ) / 100000000000000000)
              hi := ((1132052809968919 : ℚ) / 100000000000000000) }
      im := { lo := ((-6167939489928887 : ℚ) / 1000000000000000000)
              hi := ((-4514997421173 : ℚ) / 976562500000000) } }
  DrestRect :=
    { re := { lo := ((-16047382215218613 : ℚ) / 10000000000000000000)
              hi := ((-4226894087038283 : ℚ) / 5000000000000000000) }
      im := { lo := ((1002373941710653 : ℚ) / 500000000000000000)
              hi := ((27641906656410203 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2237911425671131 : ℚ) / 2500000000000000000)
              hi := ((6741443713648071 : ℚ) / 10000000000000000000) }
      im := { lo := ((-721985270144471 : ℚ) / 2000000000000000000)
              hi := ((5816028721503699 : ℚ) / 5000000000000000000) } }
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

def s084_t2_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((7653842167470177 : ℚ) / 5000000000000000000)
              hi := ((6485213871900791 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1337692106952357 : ℚ) / 20000000000000000)
              hi := ((-6197624689104351 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((9767260997648863 : ℚ) / 1000000000000000000)
              hi := ((2828268356980699 : ℚ) / 250000000000000000) }
      im := { lo := ((-1236407098500991 : ℚ) / 200000000000000000)
              hi := ((-927542580934717 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1601347485214143 : ℚ) / 1000000000000000000)
              hi := ((-8420158854441429 : ℚ) / 10000000000000000000) }
      im := { lo := ((5016259626199317 : ℚ) / 2500000000000000000)
              hi := ((6914800224561789 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-895037271500521 : ℚ) / 1000000000000000000)
              hi := ((3371310851589217 : ℚ) / 5000000000000000000) }
      im := { lo := ((-3609717795084681 : ℚ) / 10000000000000000000)
              hi := ((581595850449047 : ℚ) / 500000000000000000) } }
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

def s084_t2_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((7688961500521283 : ℚ) / 5000000000000000000)
              hi := ((12984316881193659 : ℚ) / 2000000000000000000) }
      im := { lo := ((-1337331518600663 : ℚ) / 20000000000000000)
              hi := ((-12391665231451461 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((488001316512943 : ℚ) / 50000000000000000)
              hi := ((452223983765149 : ℚ) / 40000000000000000) }
      im := { lo := ((-1549030379310301 : ℚ) / 250000000000000000)
              hi := ((-1163014621051851 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1997442819573289 : ℚ) / 1250000000000000000)
              hi := ((-8386504965145873 : ℚ) / 10000000000000000000) }
      im := { lo := ((2008255053721821 : ℚ) / 1000000000000000000)
              hi := ((1383822361031309 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8949095320360159 : ℚ) / 10000000000000000000)
              hi := ((6743794376913563 : ℚ) / 10000000000000000000) }
      im := { lo := ((-7219040596224463 : ℚ) / 20000000000000000000)
              hi := ((11631787573502753 : ℚ) / 10000000000000000000) } }
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

def s084_t2_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1544838746822917 : ℚ) / 1000000000000000000)
              hi := ((8123905459728113 : ℚ) / 1250000000000000000) }
      im := { lo := ((-6684855780709487 : ℚ) / 100000000000000000)
              hi := ((-6194041626244803 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1950554564081677 : ℚ) / 200000000000000000)
              hi := ((11298106263666717 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6210197075164191 : ℚ) / 1000000000000000000)
              hi := ((-583299317067291 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-797279168410951 : ℚ) / 500000000000000000)
              hi := ((-4176414309452213 : ℚ) / 5000000000000000000) }
      im := { lo := ((1005000843988111 : ℚ) / 500000000000000000)
              hi := ((27693643621156563 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-559238467002693 : ℚ) / 625000000000000000)
              hi := ((1686240923161589 : ℚ) / 2500000000000000000) }
      im := { lo := ((-1443731483773699 : ℚ) / 4000000000000000000)
              hi := ((5815831988514289 : ℚ) / 5000000000000000000) } }
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

def s084_t2_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((775953258606009 : ℚ) / 500000000000000000)
              hi := ((6506113078762967 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6683055050176653 : ℚ) / 100000000000000000)
              hi := ((-6192251788285449 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((389820029986803 : ℚ) / 40000000000000000)
              hi := ((2822648293761363 : ℚ) / 250000000000000000) }
      im := { lo := ((-1244852411997263 : ℚ) / 200000000000000000)
              hi := ((-9361442221169627 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-636463861898861 : ℚ) / 400000000000000000)
              hi := ((-8319130684980663 : ℚ) / 10000000000000000000) }
      im := { lo := ((20117438398865057 : ℚ) / 10000000000000000000)
              hi := ((27710789143506023 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4473272979099983 : ℚ) / 5000000000000000000)
              hi := ((843267803473137 : ℚ) / 1250000000000000000) }
      im := { lo := ((-1804568146782079 : ℚ) / 5000000000000000000)
              hi := ((11631539493341173 : ℚ) / 10000000000000000000) } }
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

def s084_t2_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((389749226228433 : ℚ) / 250000000000000000)
              hi := ((3256561536660311 : ℚ) / 500000000000000000) }
      im := { lo := ((-334062768935067 : ℚ) / 5000000000000000)
              hi := ((-3095231560048303 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((389528395220401 : ℚ) / 40000000000000000)
              hi := ((11283060575524317 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3119158466098589 : ℚ) / 500000000000000000)
              hi := ((-4695037709208339 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7938791985701839 : ℚ) / 5000000000000000000)
              hi := ((-4142704684554511 : ℚ) / 5000000000000000000) }
      im := { lo := ((20134813357648427 : ℚ) / 10000000000000000000)
              hi := ((13863942729634457 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8945275190106271 : ℚ) / 10000000000000000000)
              hi := ((6747319006700979 : ℚ) / 10000000000000000000) }
      im := { lo := ((-902235504680021 : ℚ) / 2500000000000000000)
              hi := ((5815706543945237 : ℚ) / 5000000000000000000) } }
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

def s084_t2_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1957632580175843 : ℚ) / 1250000000000000000)
              hi := ((3260079147980109 : ℚ) / 500000000000000000) }
      im := { lo := ((-1669864257386491 : ℚ) / 25000000000000000)
              hi := ((-3094337679751229 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((9730899926581379 : ℚ) / 1000000000000000000)
              hi := ((1127550880766599 : ℚ) / 100000000000000000) }
      im := { lo := ((-6252361872275277 : ℚ) / 1000000000000000000)
              hi := ((-2354672040243017 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-792177351161311 : ℚ) / 500000000000000000)
              hi := ((-8251663502436787 : ℚ) / 10000000000000000000) }
      im := { lo := ((125950877453813 : ℚ) / 62500000000000000)
              hi := ((1387246693217259 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8944024126155837 : ℚ) / 10000000000000000000)
              hi := ((6748514380550141 : ℚ) / 10000000000000000000) }
      im := { lo := ((-721750988008217 : ℚ) / 2000000000000000000)
              hi := ((5815646906484693 : ℚ) / 5000000000000000000) } }
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

def s084_t2_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((15732347373207593 : ℚ) / 10000000000000000000)
              hi := ((6527217898865981 : ℚ) / 1000000000000000000) }
      im := { lo := ((-208676879916961 : ℚ) / 3125000000000000)
              hi := ((-2474755353072991 : ℚ) / 40000000000000000) } }
  D0Rect :=
    { re := { lo := ((4861785272803001 : ℚ) / 500000000000000000)
              hi := ((11267938219283093 : ℚ) / 1000000000000000000) }
      im := { lo := ((-25065586336969 : ℚ) / 4000000000000000)
              hi := ((-4723640484280897 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7904742866068407 : ℚ) / 5000000000000000000)
              hi := ((-8217893130708369 : ℚ) / 10000000000000000000) }
      im := { lo := ((20169419130716157 : ℚ) / 10000000000000000000)
              hi := ((138809673311433 : ℚ) / 50000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4471391028310327 : ℚ) / 5000000000000000000)
              hi := ((6749717845309093 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3608588386028711 : ℚ) / 10000000000000000000)
              hi := ((581559750758879 : ℚ) / 500000000000000000) } }
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

def s084_t2_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((7901930486152763 : ℚ) / 5000000000000000000)
              hi := ((13068597455565439 : ℚ) / 2000000000000000000) }
      im := { lo := ((-1335172865626309 : ℚ) / 20000000000000000)
              hi := ((-3092551300253649 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((9716221657941733 : ℚ) / 1000000000000000000)
              hi := ((2252069786591357 : ℚ) / 200000000000000000) }
      im := { lo := ((-785052630748991 : ℚ) / 125000000000000000)
              hi := ((-9475853769998389 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-394385010555869 : ℚ) / 250000000000000000)
              hi := ((-2046024525467769 : ℚ) / 2500000000000000000) }
      im := { lo := ((2523331156222173 : ℚ) / 1250000000000000000)
              hi := ((2777888811535439 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8941534753103609 : ℚ) / 10000000000000000000)
              hi := ((6750915171509817 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3608418235637221 : ℚ) / 10000000000000000000)
              hi := ((116310925569993 : ℚ) / 100000000000000000) } }
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

def s084_t2_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((15463389323 : ℚ) / 250000000000)
      ((-141124617 : ℚ) / 500000000000)
      ((4664722311 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((3175120836900659 : ℚ) / 2000000000000000000)
              hi := ((6541400512232493 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3337034767004339 : ℚ) / 50000000000000000)
              hi := ((-6183318042655243 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((9708853745021579 : ℚ) / 1000000000000000000)
              hi := ((11252740482384347 : ℚ) / 1000000000000000000) }
      im := { lo := ((-251777410137909 : ℚ) / 40000000000000000)
              hi := ((-2376101614310769 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7870645095251457 : ℚ) / 5000000000000000000)
              hi := ((-4075139720293967 : ℚ) / 5000000000000000000) }
      im := { lo := ((31568487409567 : ℚ) / 15625000000000000)
              hi := ((694894823335371 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8940283119365379 : ℚ) / 10000000000000000000)
              hi := ((675210726225487 : ℚ) / 1000000000000000000) }
      im := { lo := ((-902060999512459 : ℚ) / 2500000000000000000)
              hi := ((2326197191740933 : ℚ) / 2000000000000000000) } }
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
    (hi : i ∈ positiveBoxSubboxesOf .s084_t2) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s084_t2).constants.mainLower)
      ((positiveBoxCombinedCert .s084_t2).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s084_t2).constants.restUpper) := by
  if h0 : i = .s084_t2_sb000 then
    exact s084_t2_sb000_certificateData
  else if h1 : i = .s084_t2_sb001 then
    exact s084_t2_sb001_certificateData
  else if h2 : i = .s084_t2_sb002 then
    exact s084_t2_sb002_certificateData
  else if h3 : i = .s084_t2_sb003 then
    exact s084_t2_sb003_certificateData
  else if h4 : i = .s084_t2_sb004 then
    exact s084_t2_sb004_certificateData
  else if h5 : i = .s084_t2_sb005 then
    exact s084_t2_sb005_certificateData
  else if h6 : i = .s084_t2_sb006 then
    exact s084_t2_sb006_certificateData
  else if h7 : i = .s084_t2_sb007 then
    exact s084_t2_sb007_certificateData
  else if h8 : i = .s084_t2_sb008 then
    exact s084_t2_sb008_certificateData
  else if h9 : i = .s084_t2_sb009 then
    exact s084_t2_sb009_certificateData
  else if h10 : i = .s084_t2_sb010 then
    exact s084_t2_sb010_certificateData
  else if h11 : i = .s084_t2_sb011 then
    exact s084_t2_sb011_certificateData
  else if h12 : i = .s084_t2_sb012 then
    exact s084_t2_sb012_certificateData
  else if h13 : i = .s084_t2_sb013 then
    exact s084_t2_sb013_certificateData
  else if h14 : i = .s084_t2_sb014 then
    exact s084_t2_sb014_certificateData
  else if h15 : i = .s084_t2_sb015 then
    exact s084_t2_sb015_certificateData
  else if h16 : i = .s084_t2_sb016 then
    exact s084_t2_sb016_certificateData
  else if h17 : i = .s084_t2_sb017 then
    exact s084_t2_sb017_certificateData
  else if h18 : i = .s084_t2_sb018 then
    exact s084_t2_sb018_certificateData
  else if h19 : i = .s084_t2_sb019 then
    exact s084_t2_sb019_certificateData
  else if h20 : i = .s084_t2_sb020 then
    exact s084_t2_sb020_certificateData
  else if h21 : i = .s084_t2_sb021 then
    exact s084_t2_sb021_certificateData
  else if h22 : i = .s084_t2_sb022 then
    exact s084_t2_sb022_certificateData
  else if h23 : i = .s084_t2_sb023 then
    exact s084_t2_sb023_certificateData
  else if h24 : i = .s084_t2_sb024 then
    exact s084_t2_sb024_certificateData
  else if h25 : i = .s084_t2_sb025 then
    exact s084_t2_sb025_certificateData
  else if h26 : i = .s084_t2_sb026 then
    exact s084_t2_sb026_certificateData
  else if h27 : i = .s084_t2_sb027 then
    exact s084_t2_sb027_certificateData
  else if h28 : i = .s084_t2_sb028 then
    exact s084_t2_sb028_certificateData
  else if h29 : i = .s084_t2_sb029 then
    exact s084_t2_sb029_certificateData
  else if h30 : i = .s084_t2_sb030 then
    exact s084_t2_sb030_certificateData
  else if h31 : i = .s084_t2_sb031 then
    exact s084_t2_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S084T2
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
