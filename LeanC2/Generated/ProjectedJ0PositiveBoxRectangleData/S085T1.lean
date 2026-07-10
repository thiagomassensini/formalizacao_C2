import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.85_t1

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
namespace S085T1

open ProjectedJ0RectangleArithmetic

def s085_t1_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1364741002437851 : ℚ) / 500000000000000000)
              hi := ((3668196154728067 : ℚ) / 500000000000000000) }
      im := { lo := ((-1365646860527081 : ℚ) / 20000000000000000)
              hi := ((-318587634266477 : ℚ) / 5000000000000000) } }
  D0Rect :=
    { re := { lo := ((4561729421788569 : ℚ) / 500000000000000000)
              hi := ((10560874214552447 : ℚ) / 1000000000000000000) }
      im := { lo := ((-9502188272822983 : ℚ) / 2000000000000000000)
              hi := ((-4141316348646907 : ℚ) / 1250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-649156194998829 : ℚ) / 400000000000000000)
              hi := ((-4640587672333553 : ℚ) / 5000000000000000000) }
      im := { lo := ((3354278857734187 : ℚ) / 2000000000000000000)
              hi := ((5929716927637361 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8512075063844203 : ℚ) / 10000000000000000000)
              hi := ((6157064171594417 : ℚ) / 10000000000000000000) }
      im := { lo := ((-16080929907476087 : ℚ) / 50000000000000000000)
              hi := ((5516891349138651 : ℚ) / 5000000000000000000) } }
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

def s085_t1_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((2734342821045973 : ℚ) / 1000000000000000000)
              hi := ((14682445592630971 : ℚ) / 2000000000000000000) }
      im := { lo := ((-6826539941777987 : ℚ) / 100000000000000000)
              hi := ((-6370067398521947 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((9118078896282253 : ℚ) / 1000000000000000000)
              hi := ((2111054924759127 : ℚ) / 200000000000000000) }
      im := { lo := ((-2382124754023029 : ℚ) / 500000000000000000)
              hi := ((-16632275980959473 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-162001123896101 : ℚ) / 100000000000000000)
              hi := ((-36143078450541 : ℚ) / 39062500000000000) }
      im := { lo := ((2098705568694589 : ℚ) / 1250000000000000000)
              hi := ((1186844226805041 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4255464383266717 : ℚ) / 5000000000000000000)
              hi := ((6158412007515941 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3215968160369321 : ℚ) / 10000000000000000000)
              hi := ((689607049088731 : ℚ) / 625000000000000000) } }
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

def s085_t1_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((5478449166072769 : ℚ) / 2000000000000000000)
              hi := ((7346073595008509 : ℚ) / 1000000000000000000) }
      im := { lo := ((-341242321373937 : ℚ) / 5000000000000000)
              hi := ((-25473532162661 : ℚ) / 400000000000000) } }
  D0Rect :=
    { re := { lo := ((4556340635700741 : ℚ) / 500000000000000000)
              hi := ((5274828433688027 : ℚ) / 500000000000000000) }
      im := { lo := ((-191095887209463 : ℚ) / 40000000000000000)
              hi := ((-8349625166780073 : ℚ) / 2500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-808564640385309 : ℚ) / 500000000000000000)
              hi := ((-4612028206182607 : ℚ) / 5000000000000000000) }
      im := { lo := ((2100981945069407 : ℚ) / 1250000000000000000)
              hi := ((2969357433942773 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8509782993556491 : ℚ) / 10000000000000000000)
              hi := ((3079879754170887 : ℚ) / 5000000000000000000) }
      im := { lo := ((-3215749515582391 : ℚ) / 10000000000000000000)
              hi := ((11033641845217203 : ℚ) / 10000000000000000000) } }
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

def s085_t1_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((2744126776917329 : ℚ) / 1000000000000000000)
              hi := ((7350945123996627 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3411576932676111 : ℚ) / 50000000000000000)
              hi := ((-1591674878062781 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((9107266180280581 : ℚ) / 1000000000000000000)
              hi := ((10544020772284527 : ℚ) / 1000000000000000000) }
      im := { lo := ((-9581077239342057 : ℚ) / 2000000000000000000)
              hi := ((-33532361735988197 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-807122486969197 : ℚ) / 500000000000000000)
              hi := ((-4597728435316289 : ℚ) / 5000000000000000000) }
      im := { lo := ((16826024556427111 : ℚ) / 10000000000000000000)
              hi := ((2377279522869749 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8508638593016271 : ℚ) / 10000000000000000000)
              hi := ((3080553763289257 : ℚ) / 5000000000000000000) }
      im := { lo := ((-3215528847174229 : ℚ) / 10000000000000000000)
              hi := ((11033568680058853 : ℚ) / 10000000000000000000) } }
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

def s085_t1_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((3436312784089529 : ℚ) / 1250000000000000000)
              hi := ((7355836518271593 : ℚ) / 1000000000000000000) }
      im := { lo := ((-136429242342977 : ℚ) / 2000000000000000)
              hi := ((-3978135597481 : ℚ) / 62500000000000) } }
  D0Rect :=
    { re := { lo := ((4550916395948277 : ℚ) / 500000000000000000)
              hi := ((10538367185091867 : ℚ) / 1000000000000000000) }
      im := { lo := ((-9607344686350083 : ℚ) / 2000000000000000000)
              hi := ((-84165373928241 : ℚ) / 25000000000000000) } }
  DrestRect :=
    { re := { lo := ((-322271623768427 : ℚ) / 200000000000000000)
              hi := ((-9166831553985511 : ℚ) / 10000000000000000000) }
      im := { lo := ((16844152463537873 : ℚ) / 10000000000000000000)
              hi := ((23790690813032403 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8507489333779749 : ℚ) / 10000000000000000000)
              hi := ((3081224916748743 : ℚ) / 5000000000000000000) }
      im := { lo := ((-32153047008201037 : ℚ) / 100000000000000000000)
              hi := ((1103349183692477 : ℚ) / 1000000000000000000) } }
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

def s085_t1_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((688498799599437 : ℚ) / 250000000000000000)
              hi := ((36803737553117127 : ℚ) / 5000000000000000000) }
      im := { lo := ((-136395423213109 : ℚ) / 2000000000000000)
              hi := ((-636333539944069 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((4548190781700731 : ℚ) / 500000000000000000)
              hi := ((10532695663390027 : ℚ) / 1000000000000000000) }
      im := { lo := ((-4816798320289411 : ℚ) / 1000000000000000000)
              hi := ((-42249829739207 : ℚ) / 12500000000000000) } }
  DrestRect :=
    { re := { lo := ((-16084686250615217 : ℚ) / 10000000000000000000)
              hi := ((-9138181497693437 : ℚ) / 10000000000000000000) }
      im := { lo := ((8431120203237491 : ℚ) / 5000000000000000000)
              hi := ((23808544982262697 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1063292024118563 : ℚ) / 1250000000000000000)
              hi := ((6163787406679561 : ℚ) / 10000000000000000000) }
      im := { lo := ((-6430152407700297 : ℚ) / 20000000000000000000)
              hi := ((220668208876693 : ℚ) / 200000000000000000) } }
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

def s085_t1_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((2758961842257247 : ℚ) / 1000000000000000000)
              hi := ((7365677956973507 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6818080969717609 : ℚ) / 100000000000000000)
              hi := ((-6361654872500219 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((9090912875254079 : ℚ) / 1000000000000000000)
              hi := ((42108023408509 : ℚ) / 4000000000000000) }
      im := { lo := ((-4829916320254461 : ℚ) / 1000000000000000000)
              hi := ((-21208441530133 : ℚ) / 6250000000000000) } }
  DrestRect :=
    { re := { lo := ((-1003485224616749 : ℚ) / 625000000000000000)
              hi := ((-9109508128300177 : ℚ) / 10000000000000000000) }
      im := { lo := ((675211592924337 : ℚ) / 400000000000000000)
              hi := ((2978294534221767 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-212629521155973 : ℚ) / 250000000000000000)
              hi := ((3082560960385281 : ℚ) / 5000000000000000000) }
      im := { lo := ((-1607421544981363 : ℚ) / 5000000000000000000)
              hi := ((5516662117995931 : ℚ) / 5000000000000000000) } }
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

def s085_t1_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((13819749152544777 : ℚ) / 5000000000000000000)
              hi := ((1842657035430601 : ℚ) / 250000000000000000) }
      im := { lo := ((-3408195777209199 : ℚ) / 50000000000000000)
              hi := ((-6359975370085631 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((9085426156692703 : ℚ) / 1000000000000000000)
              hi := ((10521298338383403 : ℚ) / 1000000000000000000) }
      im := { lo := ((-968605256428297 : ℚ) / 200000000000000000)
              hi := ((-1703353880009223 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-16026814446905777 : ℚ) / 10000000000000000000)
              hi := ((-9080810333164567 : ℚ) / 10000000000000000000) }
      im := { lo := ((8449149602580157 : ℚ) / 5000000000000000000)
              hi := ((238441261058027 : ℚ) / 100000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2126005588573191 : ℚ) / 2500000000000000000)
              hi := ((616645243903087 : ℚ) / 1000000000000000000) }
      im := { lo := ((-16073024509327 : ℚ) / 50000000000000000)
              hi := ((441329310294859 : ℚ) / 400000000000000000) } }
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

def s085_t1_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((2768959172388311 : ℚ) / 1000000000000000000)
              hi := ((921949761062997 : ℚ) / 125000000000000000) }
      im := { lo := ((-6814703007970403 : ℚ) / 100000000000000000)
              hi := ((-3179148402974509 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((11349902341403 : ℚ) / 1250000000000000)
              hi := ((328611646352989 : ℚ) / 31250000000000000) }
      im := { lo := ((-2428064164922479 : ℚ) / 500000000000000000)
              hi := ((-106876798124967 : ℚ) / 31250000000000000) } }
  DrestRect :=
    { re := { lo := ((-1999729788187057 : ℚ) / 1250000000000000000)
              hi := ((-9052088758958921 : ℚ) / 10000000000000000000) }
      im := { lo := ((1691626937253149 : ℚ) / 1000000000000000000)
              hi := ((596546339261971 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8502860983516657 : ℚ) / 10000000000000000000)
              hi := ((1541944806368329 : ℚ) / 2500000000000000000) }
      im := { lo := ((-6428735662321653 : ℚ) / 20000000000000000000)
              hi := ((11033142201262577 : ℚ) / 10000000000000000000) } }
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

def s085_t1_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((693497211493183 : ℚ) / 250000000000000000)
              hi := ((738058868788007 : ℚ) / 100000000000000000) }
      im := { lo := ((-3406507693464001 : ℚ) / 50000000000000000)
              hi := ((-635661912122087 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((4537200086121837 : ℚ) / 500000000000000000)
              hi := ((262745718899559 : ℚ) / 25000000000000000) }
      im := { lo := ((-9738445471443053 : ℚ) / 2000000000000000000)
              hi := ((-107293740433193 : ℚ) / 31250000000000000) } }
  DrestRect :=
    { re := { lo := ((-7984417824349521 : ℚ) / 5000000000000000000)
              hi := ((-1127917874476803 : ℚ) / 1250000000000000000) }
      im := { lo := ((16934200071365491 : ℚ) / 10000000000000000000)
              hi := ((2984942362327159 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-212542574568957 : ℚ) / 250000000000000000)
              hi := ((30845542683277 : ℚ) / 50000000000000000) }
      im := { lo := ((-32141325957518057 : ℚ) / 100000000000000000000)
              hi := ((11033053284827121 : ℚ) / 10000000000000000000) } }
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

def s085_t1_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((6947599986845209 : ℚ) / 2500000000000000000)
              hi := ((7385598892708967 : ℚ) / 1000000000000000000) }
      im := { lo := ((-851416074971219 : ℚ) / 12500000000000000)
              hi := ((-6354942419765891 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((566803809327721 : ℚ) / 62500000000000000)
              hi := ((5252033340716637 : ℚ) / 500000000000000000) }
      im := { lo := ((-122057741799491 : ℚ) / 25000000000000000)
              hi := ((-34467339729739393 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7969903680736433 : ℚ) / 5000000000000000000)
              hi := ((-4497286154908231 : ℚ) / 5000000000000000000) }
      im := { lo := ((8476045238734613 : ℚ) / 5000000000000000000)
              hi := ((1194859139501411 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4250270847329363 : ℚ) / 5000000000000000000)
              hi := ((6170433709295123 : ℚ) / 10000000000000000000) }
      im := { lo := ((-502170821203631 : ℚ) / 1562500000000000000)
              hi := ((2758240017960017 : ℚ) / 2500000000000000000) } }
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

def s085_t1_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((556822592655471 : ℚ) / 200000000000000000)
              hi := ((147812566290029 : ℚ) / 20000000000000000) }
      im := { lo := ((-6809642584394911 : ℚ) / 100000000000000000)
              hi := ((-635326676503287 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((4531652136178283 : ℚ) / 500000000000000000)
              hi := ((83986291354817 : ℚ) / 8000000000000000) }
      im := { lo := ((-305961783832511 : ℚ) / 62500000000000000)
              hi := ((-865015233951897 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-15910751849014747 : ℚ) / 10000000000000000000)
              hi := ((-2241444603116861 : ℚ) / 2500000000000000000) }
      im := { lo := ((1696994197052789 : ℚ) / 1000000000000000000)
              hi := ((4782956763953951 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8499376621463559 : ℚ) / 10000000000000000000)
              hi := ((6171754247783383 : ℚ) / 10000000000000000000) }
      im := { lo := ((-16068245535847157 : ℚ) / 50000000000000000000)
              hi := ((344776933067333 : ℚ) / 312500000000000000) } }
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

def s085_t1_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((13946035175061383 : ℚ) / 5000000000000000000)
              hi := ((739567765007071 : ℚ) / 100000000000000000) }
      im := { lo := ((-6807957413224221 : ℚ) / 100000000000000000)
              hi := ((-6351592091253419 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4528864879084637 : ℚ) / 500000000000000000)
              hi := ((209849767152067 : ℚ) / 20000000000000000) }
      im := { lo := ((-9816919626607969 : ℚ) / 2000000000000000000)
              hi := ((-3473380068939107 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7940835647980639 : ℚ) / 5000000000000000000)
              hi := ((-8936959198579673 : ℚ) / 10000000000000000000) }
      im := { lo := ((16987752414221223 : ℚ) / 10000000000000000000)
              hi := ((11966172019493087 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2124552238423079 : ℚ) / 2500000000000000000)
              hi := ((6173071344157773 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3213400718115721 : ℚ) / 10000000000000000000)
              hi := ((1103275921457359 : ℚ) / 1000000000000000000) } }
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

def s085_t1_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1397160591726331 : ℚ) / 500000000000000000)
              hi := ((9250934888702237 : ℚ) / 1250000000000000000) }
      im := { lo := ((-1701568358851127 : ℚ) / 25000000000000000)
              hi := ((-3174959024324027 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((90521372573509 : ℚ) / 10000000000000000)
              hi := ((5243336341867729 : ℚ) / 500000000000000000) }
      im := { lo := ((-2460761696191521 : ℚ) / 500000000000000000)
              hi := ((-3486691415788039 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3170513192092059 : ℚ) / 2000000000000000000)
              hi := ((-8908114562544433 : ℚ) / 10000000000000000000) }
      im := { lo := ((8502760741820523 : ℚ) / 5000000000000000000)
              hi := ((2394986371648747 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8497037419360787 : ℚ) / 10000000000000000000)
              hi := ((3087191863255303 : ℚ) / 5000000000000000000) }
      im := { lo := ((-32131718400599013 : ℚ) / 100000000000000000000)
              hi := ((2206535178085979 : ℚ) / 2000000000000000000) } }
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

def s085_t1_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((174965952102261 : ℚ) / 62500000000000000)
              hi := ((370291962784307 : ℚ) / 50000000000000000) }
      im := { lo := ((-6804590561221627 : ℚ) / 100000000000000000)
              hi := ((-1587061184698503 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((9046526046890869 : ℚ) / 1000000000000000000)
              hi := ((1310105016894341 : ℚ) / 125000000000000000) }
      im := { lo := ((-2467289555233999 : ℚ) / 500000000000000000)
              hi := ((-34999950956025303 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-247241204695413 : ℚ) / 156250000000000000)
              hi := ((-554952709433889 : ℚ) / 625000000000000000) }
      im := { lo := ((42558118769043 : ℚ) / 25000000000000000)
              hi := ((2396734444266037 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-530991355850781 : ℚ) / 625000000000000000)
              hi := ((6175691070683391 : ℚ) / 10000000000000000000) }
      im := { lo := ((-32129551492874773 : ℚ) / 100000000000000000000)
              hi := ((11032604567396591 : ℚ) / 10000000000000000000) } }
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

def s085_t1_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1402304515595269 : ℚ) / 500000000000000000)
              hi := ((926368978206589 : ℚ) / 125000000000000000) }
      im := { lo := ((-6802908631688173 : ℚ) / 100000000000000000)
              hi := ((-158664308042183 : ℚ) / 2500000000000000) } }
  D0Rect :=
    { re := { lo := ((4520447563922019 : ℚ) / 500000000000000000)
              hi := ((5237495865963211 : ℚ) / 500000000000000000) }
      im := { lo := ((-4947626957316209 : ℚ) / 1000000000000000000)
              hi := ((-7026582139352487 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3948571751621621 : ℚ) / 2500000000000000000)
              hi := ((-8850343390253523 : ℚ) / 10000000000000000000) }
      im := { lo := ((4260231932502379 : ℚ) / 2500000000000000000)
              hi := ((23984788901644863 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8494681157786187 : ℚ) / 10000000000000000000)
              hi := ((6176992758773803 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3212737569467071 : ℚ) / 10000000000000000000)
              hi := ((5516266084015193 : ℚ) / 5000000000000000000) } }
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

def s085_t1_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((3512229386228891 : ℚ) / 1250000000000000000)
              hi := ((7416084664882783 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6801227639717017 : ℚ) / 100000000000000000)
              hi := ((-3172450404414223 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((4517622883760521 : ℚ) / 500000000000000000)
              hi := ((1046912623473831 : ℚ) / 100000000000000000) }
      im := { lo := ((-620083360284683 : ℚ) / 125000000000000000)
              hi := ((-35265793460011103 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-15765112934755243 : ℚ) / 10000000000000000000)
              hi := ((-352856701836973 : ℚ) / 400000000000000000) }
      im := { lo := ((3411713103893147 : ℚ) / 2000000000000000000)
              hi := ((12001096835843577 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1698699138132089 : ℚ) / 2000000000000000000)
              hi := ((6178288670366093 : ℚ) / 10000000000000000000) }
      im := { lo := ((-6425043593371679 : ℚ) / 20000000000000000000)
              hi := ((2206492277945143 : ℚ) / 2000000000000000000) } }
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

def s085_t1_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((21992022715599 : ℚ) / 7812500000000000)
              hi := ((18553093850026169 : ℚ) / 2500000000000000000) }
      im := { lo := ((-1699886885500381 : ℚ) / 25000000000000000)
              hi := ((-6343230249311163 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4514789243276953 : ℚ) / 500000000000000000)
              hi := ((5231621561968221 : ℚ) / 500000000000000000) }
      im := { lo := ((-2486849707650641 : ℚ) / 500000000000000000)
              hi := ((-17699296701780907 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7867957640459107 : ℚ) / 5000000000000000000)
              hi := ((-274764547166579 : ℚ) / 312500000000000000) }
      im := { lo := ((17076160993638467 : ℚ) / 10000000000000000000)
              hi := ((2401955852579899 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-265384589640061 : ℚ) / 312500000000000000)
              hi := ((1544895095511467 : ℚ) / 2500000000000000000) }
      im := { lo := ((-3212302451113709 : ℚ) / 10000000000000000000)
              hi := ((1103238685438167 : ℚ) / 1000000000000000000) } }
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

def s085_t1_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((14100976202526007 : ℚ) / 5000000000000000000)
              hi := ((14852820779967751 : ℚ) / 2000000000000000000) }
      im := { lo := ((-3398934134412393 : ℚ) / 50000000000000000)
              hi := ((-6341560716636889 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((9023893391616633 : ℚ) / 1000000000000000000)
              hi := ((2614335584184677 : ℚ) / 250000000000000000) }
      im := { lo := ((-9973447545706067 : ℚ) / 2000000000000000000)
              hi := ((-3553131796868889 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7853345950266261 : ℚ) / 5000000000000000000)
              hi := ((-8763489571833433 : ℚ) / 10000000000000000000) }
      im := { lo := ((1709371602576937 : ℚ) / 1000000000000000000)
              hi := ((2403688156551403 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2122779288239693 : ℚ) / 2500000000000000000)
              hi := ((3090435178520651 : ℚ) / 5000000000000000000) }
      im := { lo := ((-3212078433141333 : ℚ) / 10000000000000000000)
              hi := ((275807686582577 : ℚ) / 250000000000000000) } }
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

def s085_t1_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1412715879237209 : ℚ) / 500000000000000000)
              hi := ((3715801987025371 : ℚ) / 500000000000000000) }
      im := { lo := ((-212380937239169 : ℚ) / 3125000000000000)
              hi := ((-158497301125473 : ℚ) / 2500000000000000) } }
  D0Rect :=
    { re := { lo := ((9018190081007639 : ℚ) / 1000000000000000000)
              hi := ((5225712143367439 : ℚ) / 500000000000000000) }
      im := { lo := ((-31248382160057 : ℚ) / 6250000000000000)
              hi := ((-1783197732871153 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7838723493397803 : ℚ) / 5000000000000000000)
              hi := ((-873448565288477 : ℚ) / 1000000000000000000) }
      im := { lo := ((85556134127257 : ℚ) / 50000000000000000)
              hi := ((2405416647784567 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8489925070397893 : ℚ) / 10000000000000000000)
              hi := ((1545539280311309 : ℚ) / 2500000000000000000) }
      im := { lo := ((-3211853689398101 : ℚ) / 10000000000000000000)
              hi := ((551611358224549 : ℚ) / 500000000000000000) } }
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

def s085_t1_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((28306895919308953 : ℚ) / 10000000000000000000)
              hi := ((1487363426734181 : ℚ) / 200000000000000000) }
      im := { lo := ((-339725630135581 : ℚ) / 5000000000000000)
              hi := ((-6338224343460117 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4506234545670079 : ℚ) / 500000000000000000)
              hi := ((10445488459333333 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5012750643761297 : ℚ) / 1000000000000000000)
              hi := ((-3579651201173393 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1564817712613247 : ℚ) / 1000000000000000000)
              hi := ((-1088182158525029 : ℚ) / 1250000000000000000) }
      im := { lo := ((2141087083069 : ℚ) / 1250000000000000)
              hi := ((2407140994378381 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8488728155939699 : ℚ) / 10000000000000000000)
              hi := ((3091719105650423 : ℚ) / 5000000000000000000) }
      im := { lo := ((-100363371231907 : ℚ) / 312500000000000000)
              hi := ((11032145617209297 : ℚ) / 10000000000000000000) } }
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

def s085_t1_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((28359691207162567 : ℚ) / 10000000000000000000)
              hi := ((14884098945415123 : ℚ) / 2000000000000000000) }
      im := { lo := ((-3396418042307483 : ℚ) / 50000000000000000)
              hi := ((-6336557642837301 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1801346186040477 : ℚ) / 200000000000000000)
              hi := ((10439534373170627 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1005150402098919 : ℚ) / 200000000000000000)
              hi := ((-35928991934755057 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-15618880723079123 : ℚ) / 10000000000000000000)
              hi := ((-8676406163071167 : ℚ) / 10000000000000000000) }
      im := { lo := ((171461272983823 : ℚ) / 100000000000000000)
              hi := ((3011076263713639 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2121881724628379 : ℚ) / 2500000000000000000)
              hi := ((6184714116440203 : ℚ) / 10000000000000000000) }
      im := { lo := ((-32114017089883407 : ℚ) / 100000000000000000000)
              hi := ((5516031766336259 : ℚ) / 5000000000000000000) } }
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

def s085_t1_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1136508062369263 : ℚ) / 400000000000000000)
              hi := ((1861825294372321 : ℚ) / 250000000000000000) }
      im := { lo := ((-848895052009167 : ℚ) / 12500000000000000)
              hi := ((-3167445980925559 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((1125121934492393 : ℚ) / 125000000000000000)
              hi := ((1043356215763151 : ℚ) / 100000000000000000) }
      im := { lo := ((-5038745342474939 : ℚ) / 1000000000000000000)
              hi := ((-36061393226460127 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-77947791844173 : ℚ) / 50000000000000000)
              hi := ((-2161832951350831 : ℚ) / 2500000000000000000) }
      im := { lo := ((17163518136424623 : ℚ) / 10000000000000000000)
              hi := ((2410576752297787 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2121580596631041 : ℚ) / 2500000000000000000)
              hi := ((6185985925730277 : ℚ) / 10000000000000000000) }
      im := { lo := ((-642234518145047 : ℚ) / 2000000000000000000)
              hi := ((5515989160849937 : ℚ) / 5000000000000000000) } }
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

def s085_t1_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((569318445975773 : ℚ) / 200000000000000000)
              hi := ((116446448092681 : ℚ) / 15625000000000000) }
      im := { lo := ((-3394742825616833 : ℚ) / 50000000000000000)
              hi := ((-316661362415963 : ℚ) / 5000000000000000) } }
  D0Rect :=
    { re := { lo := ((2248800652641253 : ℚ) / 250000000000000000)
              hi := ((10427571963593039 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5051730616856227 : ℚ) / 1000000000000000000)
              hi := ((-452421443815839 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3890052613319261 : ℚ) / 2500000000000000000)
              hi := ((-8618233959874597 : ℚ) / 10000000000000000000) }
      im := { lo := ((859043438239961 : ℚ) / 500000000000000000)
              hi := ((964915300735829 : ℚ) / 400000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4242558003581343 : ℚ) / 5000000000000000000)
              hi := ((6187255028092333 : ℚ) / 10000000000000000000) }
      im := { lo := ((-16054716390735357 : ℚ) / 50000000000000000000)
              hi := ((5515946368399511 : ℚ) / 5000000000000000000) } }
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

def s085_t1_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((570386837128591 : ℚ) / 200000000000000000)
              hi := ((14915730300280353 : ℚ) / 2000000000000000000) }
      im := { lo := ((-1696952967653129 : ℚ) / 25000000000000000)
              hi := ((-6331563433396627 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4494705862569873 : ℚ) / 500000000000000000)
              hi := ((5210782211948467 : ℚ) / 500000000000000000) }
      im := { lo := ((-2532354544393877 : ℚ) / 500000000000000000)
              hi := ((-4540743209555287 : ℚ) / 1250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-776542090602191 : ℚ) / 500000000000000000)
              hi := ((-8589107919210347 : ℚ) / 10000000000000000000) }
      im := { lo := ((8599087351190963 : ℚ) / 5000000000000000000)
              hi := ((2413995949847141 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8483910300926389 : ℚ) / 10000000000000000000)
              hi := ((3094262086692851 : ℚ) / 5000000000000000000) }
      im := { lo := ((-3210709527852259 : ℚ) / 10000000000000000000)
              hi := ((2206360464058069 : ℚ) / 2000000000000000000) } }
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

def s085_t1_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((5714592784494603 : ℚ) / 2000000000000000000)
              hi := ((74631781692131 : ℚ) / 10000000000000000) }
      im := { lo := ((-271445562421143 : ℚ) / 4000000000000000)
              hi := ((-3164950265952029 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((898360308817097 : ℚ) / 100000000000000000)
              hi := ((5207769644309907 : ℚ) / 500000000000000000) }
      im := { lo := ((-5077680674079931 : ℚ) / 1000000000000000000)
              hi := ((-3645808424054853 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-15501451752602511 : ℚ) / 10000000000000000000)
              hi := ((-4279977234656667 : ℚ) / 5000000000000000000) }
      im := { lo := ((17215436762685313 : ℚ) / 10000000000000000000)
              hi := ((301962470010457 : ℚ) / 125000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-132542251304271 : ℚ) / 156250000000000000)
              hi := ((3094896187230199 : ℚ) / 5000000000000000000) }
      im := { lo := ((-4013089962712047 : ℚ) / 12500000000000000000)
              hi := ((2757926875300139 : ℚ) / 2500000000000000000) } }
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

def s085_t1_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((89458734259427 : ℚ) / 31250000000000000)
              hi := ((7468511092519261 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3392233583326433 : ℚ) / 50000000000000000)
              hi := ((-395514912858889 : ℚ) / 6250000000000000) } }
  D0Rect :=
    { re := { lo := ((8977776851438093 : ℚ) / 1000000000000000000)
              hi := ((10409496427614861 : ℚ) / 1000000000000000000) }
      im := { lo := ((-10181288717117749 : ℚ) / 2000000000000000000)
              hi := ((-36590140811963087 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-618881495814647 : ℚ) / 400000000000000000)
              hi := ((-2132694153432089 : ℚ) / 2500000000000000000) }
      im := { lo := ((8616328714300233 : ℚ) / 5000000000000000000)
              hi := ((3021749283010943 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2120373876514819 : ℚ) / 2500000000000000000)
              hi := ((1547764344081007 : ℚ) / 2500000000000000000) }
      im := { lo := ((-642046541125297 : ℚ) / 2000000000000000000)
              hi := ((5515805401794313 : ℚ) / 5000000000000000000) } }
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

def s085_t1_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((5736167600914467 : ℚ) / 2000000000000000000)
              hi := ((3736931803851017 : ℚ) / 500000000000000000) }
      im := { lo := ((-423924763612019 : ℚ) / 6250000000000000)
              hi := ((-6326577624156163 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((448596651755953 : ℚ) / 50000000000000000)
              hi := ((10403435831298291 : ℚ) / 1000000000000000000) }
      im := { lo := ((-10207199213766999 : ℚ) / 2000000000000000000)
              hi := ((-229513251492681 : ℚ) / 62500000000000000) } }
  DrestRect :=
    { re := { lo := ((-15442597395904933 : ℚ) / 10000000000000000000)
              hi := ((-425078789870441 : ℚ) / 500000000000000000) }
      im := { lo := ((3449967560627763 : ℚ) / 2000000000000000000)
              hi := ((12095474148128263 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1060035265904953 : ℚ) / 1250000000000000000)
              hi := ((247692669551157 : ℚ) / 400000000000000000) }
      im := { lo := ((-16049986781296847 : ℚ) / 50000000000000000000)
              hi := ((551575892336563 : ℚ) / 500000000000000000) } }
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

def s085_t1_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((14367547825080067 : ℚ) / 5000000000000000000)
              hi := ((1495847086024247 : ℚ) / 200000000000000000) }
      im := { lo := ((-3390563062660737 : ℚ) / 50000000000000000)
              hi := ((-3162458843508479 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((8966071740004137 : ℚ) / 1000000000000000000)
              hi := ((1039735743914569 : ℚ) / 100000000000000000) }
      im := { lo := ((-1023309373265411 : ℚ) / 200000000000000000)
              hi := ((-7370803517652103 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3082626581870097 : ℚ) / 2000000000000000000)
              hi := ((-4236175506727429 : ℚ) / 5000000000000000000) }
      im := { lo := ((2158372132468471 : ℚ) / 1250000000000000000)
              hi := ((3025982560219467 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2119766027582659 : ℚ) / 2500000000000000000)
              hi := ((6193570625074329 : ℚ) / 10000000000000000000) }
      im := { lo := ((-32097571481937083 : ℚ) / 100000000000000000000)
              hi := ((5515709930873743 : ℚ) / 5000000000000000000) } }
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

def s085_t1_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((28789569131330733 : ℚ) / 10000000000000000000)
              hi := ((7484626418442987 : ℚ) / 1000000000000000000) }
      im := { lo := ((-338972845360341 : ℚ) / 5000000000000000)
              hi := ((-6323258776987549 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8960193264526899 : ℚ) / 1000000000000000000)
              hi := ((2078252193272979 : ℚ) / 200000000000000000) }
      im := { lo := ((-2564742938410273 : ℚ) / 500000000000000000)
              hi := ((-36985834924837383 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-15383642734526567 : ℚ) / 10000000000000000000)
              hi := ((-8443103573090501 : ℚ) / 10000000000000000000) }
      im := { lo := ((691363057579551 : ℚ) / 400000000000000000)
              hi := ((24224729488688027 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4238920908270197 : ℚ) / 5000000000000000000)
              hi := ((61948193979333 : ℚ) / 100000000000000000) }
      im := { lo := ((-1604757588259081 : ℚ) / 5000000000000000000)
              hi := ((1378914992797443 : ℚ) / 1250000000000000000) } }
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

def s085_t1_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((14422127968887757 : ℚ) / 5000000000000000000)
              hi := ((7490036807831719 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6777788641926831 : ℚ) / 100000000000000000)
              hi := ((-6321600826398541 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4477148844241487 : ℚ) / 500000000000000000)
              hi := ((2596286589185027 : ℚ) / 250000000000000000) }
      im := { lo := ((-5142416626202687 : ℚ) / 1000000000000000000)
              hi := ((-37117572072166223 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3838531694912591 : ℚ) / 2500000000000000000)
              hi := ((-4206916832460873 : ℚ) / 5000000000000000000) }
      im := { lo := ((135165125799043 : ℚ) / 78125000000000000)
              hi := ((4848311024599347 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8476615731229159 : ℚ) / 10000000000000000000)
              hi := ((6196063542817089 : ℚ) / 10000000000000000000) }
      im := { lo := ((-802319083720147 : ℚ) / 2500000000000000000)
              hi := ((11031222987907539 : ℚ) / 10000000000000000000) } }
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

def s085_t1_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((7908184789 : ℚ) / 125000000000)
      ((-47200373 : ℚ) / 200000000000)
      ((4265984997 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((361239473539409 : ℚ) / 125000000000000000)
              hi := ((7495466374084027 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6776121227661797 : ℚ) / 100000000000000000)
              hi := ((-631994393395891 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((8948385055090931 : ℚ) / 1000000000000000000)
              hi := ((10379013597602857 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5155338995670347 : ℚ) / 1000000000000000000)
              hi := ((-18624614807770637 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1915573102723639 : ℚ) / 1250000000000000000)
              hi := ((-167690833229237 : ℚ) / 200000000000000000) }
      im := { lo := ((67649047953889 : ℚ) / 39062500000000000)
              hi := ((4851667415187757 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8475386870948963 : ℚ) / 10000000000000000000)
              hi := ((3098652039341419 : ℚ) / 5000000000000000000) }
      im := { lo := ((-16045170816867573 : ℚ) / 50000000000000000000)
              hi := ((2757780633621613 : ℚ) / 2500000000000000000) } }
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
    (hi : i ∈ positiveBoxSubboxesOf .s085_t1) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s085_t1).constants.mainLower)
      ((positiveBoxCombinedCert .s085_t1).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s085_t1).constants.restUpper) := by
  if h0 : i = .s085_t1_sb000 then
    exact s085_t1_sb000_certificateData
  else if h1 : i = .s085_t1_sb001 then
    exact s085_t1_sb001_certificateData
  else if h2 : i = .s085_t1_sb002 then
    exact s085_t1_sb002_certificateData
  else if h3 : i = .s085_t1_sb003 then
    exact s085_t1_sb003_certificateData
  else if h4 : i = .s085_t1_sb004 then
    exact s085_t1_sb004_certificateData
  else if h5 : i = .s085_t1_sb005 then
    exact s085_t1_sb005_certificateData
  else if h6 : i = .s085_t1_sb006 then
    exact s085_t1_sb006_certificateData
  else if h7 : i = .s085_t1_sb007 then
    exact s085_t1_sb007_certificateData
  else if h8 : i = .s085_t1_sb008 then
    exact s085_t1_sb008_certificateData
  else if h9 : i = .s085_t1_sb009 then
    exact s085_t1_sb009_certificateData
  else if h10 : i = .s085_t1_sb010 then
    exact s085_t1_sb010_certificateData
  else if h11 : i = .s085_t1_sb011 then
    exact s085_t1_sb011_certificateData
  else if h12 : i = .s085_t1_sb012 then
    exact s085_t1_sb012_certificateData
  else if h13 : i = .s085_t1_sb013 then
    exact s085_t1_sb013_certificateData
  else if h14 : i = .s085_t1_sb014 then
    exact s085_t1_sb014_certificateData
  else if h15 : i = .s085_t1_sb015 then
    exact s085_t1_sb015_certificateData
  else if h16 : i = .s085_t1_sb016 then
    exact s085_t1_sb016_certificateData
  else if h17 : i = .s085_t1_sb017 then
    exact s085_t1_sb017_certificateData
  else if h18 : i = .s085_t1_sb018 then
    exact s085_t1_sb018_certificateData
  else if h19 : i = .s085_t1_sb019 then
    exact s085_t1_sb019_certificateData
  else if h20 : i = .s085_t1_sb020 then
    exact s085_t1_sb020_certificateData
  else if h21 : i = .s085_t1_sb021 then
    exact s085_t1_sb021_certificateData
  else if h22 : i = .s085_t1_sb022 then
    exact s085_t1_sb022_certificateData
  else if h23 : i = .s085_t1_sb023 then
    exact s085_t1_sb023_certificateData
  else if h24 : i = .s085_t1_sb024 then
    exact s085_t1_sb024_certificateData
  else if h25 : i = .s085_t1_sb025 then
    exact s085_t1_sb025_certificateData
  else if h26 : i = .s085_t1_sb026 then
    exact s085_t1_sb026_certificateData
  else if h27 : i = .s085_t1_sb027 then
    exact s085_t1_sb027_certificateData
  else if h28 : i = .s085_t1_sb028 then
    exact s085_t1_sb028_certificateData
  else if h29 : i = .s085_t1_sb029 then
    exact s085_t1_sb029_certificateData
  else if h30 : i = .s085_t1_sb030 then
    exact s085_t1_sb030_certificateData
  else if h31 : i = .s085_t1_sb031 then
    exact s085_t1_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S085T1
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
