import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.84_t7

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
namespace S084T7

open ProjectedJ0RectangleArithmetic

def s084_t7_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((7769189031691491 : ℚ) / 2500000000000000000)
              hi := ((1609168243643223 : ℚ) / 200000000000000000) }
      im := { lo := ((-798588171097109 : ℚ) / 12500000000000000)
              hi := ((-2950099319570863 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((4101138407751977 : ℚ) / 500000000000000000)
              hi := ((9704715351765867 : ℚ) / 1000000000000000000) }
      im := { lo := ((-8495905517368523 : ℚ) / 1000000000000000000)
              hi := ((-1399877051804719 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-967895958934281 : ℚ) / 1000000000000000000)
              hi := ((-107466501998323 : ℚ) / 500000000000000000) }
      im := { lo := ((111992785553337 : ℚ) / 50000000000000000)
              hi := ((46769659472677 : ℚ) / 15625000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8731189471107623 : ℚ) / 10000000000000000000)
              hi := ((3471852162256849 : ℚ) / 5000000000000000000) }
      im := { lo := ((-445960052609247 : ℚ) / 1250000000000000000)
              hi := ((181282391480029 : ℚ) / 156250000000000000) } }
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

def s084_t7_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((1559218303718039 : ℚ) / 500000000000000000)
              hi := ((2014118697744613 : ℚ) / 250000000000000000) }
      im := { lo := ((-6237436506787 : ℚ) / 97656250000000)
              hi := ((-1474661086639109 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((4095949527552519 : ℚ) / 500000000000000000)
              hi := ((9694081508033253 : ℚ) / 1000000000000000000) }
      im := { lo := ((-850782850923849 : ℚ) / 100000000000000000)
              hi := ((-701158628749367 : ℚ) / 100000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9641666671320861 : ℚ) / 10000000000000000000)
              hi := ((-10562415976966003 : ℚ) / 50000000000000000000) }
      im := { lo := ((4481445883999467 : ℚ) / 2000000000000000000)
              hi := ((5988166150192163 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8729923959020719 : ℚ) / 10000000000000000000)
              hi := ((1388948282053953 : ℚ) / 2000000000000000000) }
      im := { lo := ((-1783698975426319 : ℚ) / 5000000000000000000)
              hi := ((5800933310265077 : ℚ) / 5000000000000000000) } }
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

def s084_t7_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((1564608520679043 : ℚ) / 500000000000000000)
              hi := ((4033564269834893 : ℚ) / 500000000000000000) }
      im := { lo := ((-6385566080049747 : ℚ) / 100000000000000000)
              hi := ((-1474272913538801 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((1636301060322077 : ℚ) / 200000000000000000)
              hi := ((1936686232716197 : ℚ) / 200000000000000000) }
      im := { lo := ((-8519737084763177 : ℚ) / 1000000000000000000)
              hi := ((-35118866205417127 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2401090106185587 : ℚ) / 2500000000000000000)
              hi := ((-2075625538736807 : ℚ) / 10000000000000000000) }
      im := { lo := ((560396264232417 : ℚ) / 250000000000000000)
              hi := ((29949025683488283 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2182166120730181 : ℚ) / 2500000000000000000)
              hi := ((347289189246733 : ℚ) / 500000000000000000) }
      im := { lo := ((-891777831128471 : ℚ) / 2500000000000000000)
              hi := ((5800828086210939 : ℚ) / 5000000000000000000) } }
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

def s084_t7_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((3140017185861687 : ℚ) / 1000000000000000000)
              hi := ((1009725258361301 : ℚ) / 125000000000000000) }
      im := { lo := ((-3191999349680387 : ℚ) / 50000000000000000)
              hi := ((-5895540527225157 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8171095486839277 : ℚ) / 1000000000000000000)
              hi := ((4836382204341413 : ℚ) / 500000000000000000) }
      im := { lo := ((-4265816034275573 : ℚ) / 500000000000000000)
              hi := ((-7035945245236509 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9567043530110357 : ℚ) / 10000000000000000000)
              hi := ((-20387545153119927 : ℚ) / 100000000000000000000) }
      im := { lo := ((1121220924081357 : ℚ) / 500000000000000000)
              hi := ((374464610862513 : ℚ) / 125000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8727406502605709 : ℚ) / 10000000000000000000)
              hi := ((6946826915941509 : ℚ) / 10000000000000000000) }
      im := { lo := ((-7133638925773451 : ℚ) / 20000000000000000000)
              hi := ((5800720316203697 : ℚ) / 5000000000000000000) } }
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

def s084_t7_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((3150837275491239 : ℚ) / 1000000000000000000)
              hi := ((505530948463733 : ℚ) / 62500000000000000) }
      im := { lo := ((-31912163861497 : ℚ) / 500000000000000)
              hi := ((-14734977596789071 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((8160669670371993 : ℚ) / 1000000000000000000)
              hi := ((966208123545271 : ℚ) / 100000000000000000) }
      im := { lo := ((-2135878135672977 : ℚ) / 250000000000000000)
              hi := ((-1409620636672467 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4764856700444727 : ℚ) / 5000000000000000000)
              hi := ((-2001872871963907 : ℚ) / 10000000000000000000) }
      im := { lo := ((5608233794809561 : ℚ) / 2500000000000000000)
              hi := ((29965258285621363 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8726151060922833 : ℚ) / 10000000000000000000)
              hi := ((6947871842375727 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3566522463481851 : ℚ) / 10000000000000000000)
              hi := ((2900305024796379 : ℚ) / 2500000000000000000) } }
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

def s084_t7_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((158083895893587 : ℚ) / 50000000000000000)
              hi := ((8099207155502873 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3190434142637913 : ℚ) / 50000000000000000)
              hi := ((-5892443207051693 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8150227606946127 : ℚ) / 1000000000000000000)
              hi := ((1930276384033227 : ℚ) / 200000000000000000) }
      im := { lo := ((-534711156309891 : ℚ) / 62500000000000000)
              hi := ((-3530123504971817 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9492370722901641 : ℚ) / 10000000000000000000)
              hi := ((-982490033966993 : ℚ) / 5000000000000000000) }
      im := { lo := ((561034995976819 : ℚ) / 250000000000000000)
              hi := ((5994658939503181 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-872489221633609 : ℚ) / 1000000000000000000)
              hi := ((868614078559799 : ℚ) / 1250000000000000000) }
      im := { lo := ((-3566220355911179 : ℚ) / 10000000000000000000)
              hi := ((1450124325407849 : ℚ) / 1250000000000000000) } }
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

def s084_t7_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((49570893197493 : ℚ) / 15625000000000000)
              hi := ((8109940026939641 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6379305342822761 : ℚ) / 100000000000000000)
              hi := ((-1178179386526379 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((8139769871163723 : ℚ) / 1000000000000000000)
              hi := ((9640665925667 : ℚ) / 1000000000000000) }
      im := { lo := ((-428361527372147 : ℚ) / 50000000000000000)
              hi := ((-14144752166558883 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1891003234799171 : ℚ) / 2000000000000000000)
              hi := ((-19280755629641673 : ℚ) / 100000000000000000000) }
      im := { lo := ((22449812721319997 : ℚ) / 10000000000000000000)
              hi := ((2998127781931861 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2180911189514857 : ℚ) / 2500000000000000000)
              hi := ((6949964058438643 : ℚ) / 10000000000000000000) }
      im := { lo := ((-891478299799467 : ℚ) / 2500000000000000000)
              hi := ((5800382102641819 : ℚ) / 5000000000000000000) } }
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

def s084_t7_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((15917073768500617 : ℚ) / 5000000000000000000)
              hi := ((8120693964529673 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3188871976960063 : ℚ) / 50000000000000000)
              hi := ((-5889352209238163 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((406464781976557 : ℚ) / 50000000000000000)
              hi := ((1203741766913653 : ℚ) / 125000000000000000) }
      im := { lo := ((-8579068547674167 : ℚ) / 1000000000000000000)
              hi := ((-7084490495011501 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4708825672364529 : ℚ) / 5000000000000000000)
              hi := ((-18911579521287331 : ℚ) / 100000000000000000000) }
      im := { lo := ((11229085802409247 : ℚ) / 5000000000000000000)
              hi := ((2998920986887937 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4361202828673333 : ℚ) / 5000000000000000000)
              hi := ((6951023106906913 : ℚ) / 10000000000000000000) }
      im := { lo := ((-7131201788486771 : ℚ) / 20000000000000000000)
              hi := ((11600528805950409 : ℚ) / 10000000000000000000) } }
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

def s084_t7_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((6388626119591811 : ℚ) / 2000000000000000000)
              hi := ((4065733272577497 : ℚ) / 500000000000000000) }
      im := { lo := ((-3188092026428877 : ℚ) / 50000000000000000)
              hi := ((-147195227825417 : ℚ) / 2500000000000000) } }
  D0Rect :=
    { re := { lo := ((4059402691862511 : ℚ) / 500000000000000000)
              hi := ((384767443860657 : ℚ) / 40000000000000000) }
      im := { lo := ((-1718178383861389 : ℚ) / 200000000000000000)
              hi := ((-7096590778702603 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-93802736985537 : ℚ) / 100000000000000000)
              hi := ((-9271149459870131 : ℚ) / 50000000000000000000) }
      im := { lo := ((561661974479071 : ℚ) / 250000000000000000)
              hi := ((29997088286842187 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1090145212654397 : ℚ) / 1250000000000000000)
              hi := ((6952076563985991 : ℚ) / 10000000000000000000) }
      im := { lo := ((-891321807046987 : ℚ) / 2500000000000000000)
              hi := ((464011687874007 : ℚ) / 400000000000000000) } }
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

def s084_t7_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((320523166767081 : ℚ) / 100000000000000000)
              hi := ((4071129085021629 : ℚ) / 500000000000000000) }
      im := { lo := ((-3187312881632099 : ℚ) / 50000000000000000)
              hi := ((-5886267513550947 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1621659835249313 : ℚ) / 200000000000000000)
              hi := ((4804210884440171 : ℚ) / 500000000000000000) }
      im := { lo := ((-172054009631941 : ℚ) / 20000000000000000)
              hi := ((-1421735414682251 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9342882719695563 : ℚ) / 10000000000000000000)
              hi := ((-908646016021297 : ℚ) / 5000000000000000000) }
      im := { lo := ((449494706584843 : ℚ) / 200000000000000000)
              hi := ((1200196501967107 : ℚ) / 400000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8719913368769673 : ℚ) / 10000000000000000000)
              hi := ((6953124909214471 : ℚ) / 10000000000000000000) }
      im := { lo := ((-17824908011950907 : ℚ) / 50000000000000000000)
              hi := ((1450007971701399 : ℚ) / 1250000000000000000) } }
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

def s084_t7_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((32161704760666873 : ℚ) / 10000000000000000000)
              hi := ((4076534480447803 : ℚ) / 500000000000000000) }
      im := { lo := ((-1274613791545259 : ℚ) / 20000000000000000)
              hi := ((-1176945510725921 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((1619555428971703 : ℚ) / 200000000000000000)
              hi := ((2399410270382333 : ℚ) / 250000000000000000) }
      im := { lo := ((-1076811768379317 : ℚ) / 125000000000000000)
              hi := ((-7120749419547617 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9305478103686153 : ℚ) / 10000000000000000000)
              hi := ((-8901724315096943 : ℚ) / 50000000000000000000) }
      im := { lo := ((449658821413541 : ℚ) / 200000000000000000)
              hi := ((7503170556148887 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4359332637542853 : ℚ) / 5000000000000000000)
              hi := ((6954172754722301 : ℚ) / 10000000000000000000) }
      im := { lo := ((-17823370618367767 : ℚ) / 50000000000000000000)
              hi := ((11599833650357961 : ℚ) / 10000000000000000000) } }
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

def s084_t7_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((32271291468623617 : ℚ) / 10000000000000000000)
              hi := ((1632779822446171 : ℚ) / 200000000000000000) }
      im := { lo := ((-3185756855633009 : ℚ) / 50000000000000000)
              hi := ((-2353275662622053 : ℚ) / 40000000000000000) } }
  D0Rect :=
    { re := { lo := ((1617447928124591 : ℚ) / 200000000000000000)
              hi := ((9586843713758451 : ℚ) / 1000000000000000000) }
      im := { lo := ((-4313136496772889 : ℚ) / 500000000000000000)
              hi := ((-3566403852698401 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2317014866609017 : ℚ) / 2500000000000000000)
              hi := ((-8716944444439701 : ℚ) / 50000000000000000000) }
      im := { lo := ((22491096957967063 : ℚ) / 10000000000000000000)
              hi := ((7505099132829959 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4358709661106003 : ℚ) / 5000000000000000000)
              hi := ((434701375677471 : ℚ) / 625000000000000000) }
      im := { lo := ((-3564369599515183 : ℚ) / 10000000000000000000)
              hi := ((1449950829057117 : ℚ) / 1250000000000000000) } }
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

def s084_t7_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((10119087015739 : ℚ) / 3125000000000000)
              hi := ((510921781218593 : ℚ) / 62500000000000000) }
      im := { lo := ((-254798403481173 : ℚ) / 4000000000000000)
              hi := ((-29408261347885243 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((8076686555949713 : ℚ) / 1000000000000000000)
              hi := ((2394007454360417 : ℚ) / 250000000000000000) }
      im := { lo := ((-107975466164263 : ℚ) / 12500000000000000)
              hi := ((-3572425806264611 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9230628018401267 : ℚ) / 10000000000000000000)
              hi := ((-8532115306063569 : ℚ) / 50000000000000000000) }
      im := { lo := ((2249920197169311 : ℚ) / 1000000000000000000)
              hi := ((6005611291502743 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1743234421529697 : ℚ) / 2000000000000000000)
              hi := ((1739067317882109 : ℚ) / 2500000000000000000) }
      im := { lo := ((-445508873469953 : ℚ) / 1250000000000000000)
              hi := ((579969284103871 : ℚ) / 500000000000000000) } }
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

def s084_t7_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((16245531237372363 : ℚ) / 5000000000000000000)
              hi := ((4092808710685787 : ℚ) / 500000000000000000) }
      im := { lo := ((-199012750589989 : ℚ) / 3125000000000000)
              hi := ((-588011695839979 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((8066116957175599 : ℚ) / 1000000000000000000)
              hi := ((2391300089965747 : ℚ) / 250000000000000000) }
      im := { lo := ((-4324893762870643 : ℚ) / 500000000000000000)
              hi := ((-3578440304291197 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-919318732631747 : ℚ) / 1000000000000000000)
              hi := ((-834721981794391 : ℚ) / 5000000000000000000) }
      im := { lo := ((45014504515139 : ℚ) / 20000000000000000)
              hi := ((15017832900719797 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4357460980866593 : ℚ) / 5000000000000000000)
              hi := ((434832054253307 : ℚ) / 625000000000000000) }
      im := { lo := ((-1781884546902907 : ℚ) / 5000000000000000000)
              hi := ((289979040056463 : ℚ) / 250000000000000000) } }
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

def s084_t7_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((8150311715855663 : ℚ) / 2500000000000000000)
              hi := ((8196505498780109 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3183428722893897 : ℚ) / 50000000000000000)
              hi := ((-1469645822544383 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((4027765548870233 : ℚ) / 500000000000000000)
              hi := ((4777177564800967 : ℚ) / 500000000000000000) }
      im := { lo := ((-1082690423059409 : ℚ) / 125000000000000000)
              hi := ((-7168894971490343 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1831147223410711 : ℚ) / 2000000000000000000)
              hi := ((-16324530040482673 : ℚ) / 100000000000000000000) }
      im := { lo := ((4503049821877209 : ℚ) / 2000000000000000000)
              hi := ((30043223266847437 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4356834628252539 : ℚ) / 5000000000000000000)
              hi := ((217448536693533 : ℚ) / 312500000000000000) }
      im := { lo := ((-7126923517332467 : ℚ) / 20000000000000000000)
              hi := ((11598932236716701 : ℚ) / 10000000000000000000) } }
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

def s084_t7_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((3271163493903563 : ℚ) / 1000000000000000000)
              hi := ((820741237883571 : ℚ) / 100000000000000000) }
      im := { lo := ((-1591327079428789 : ℚ) / 25000000000000000)
              hi := ((-11754102639167 : ℚ) / 200000000000000) } }
  D0Rect :=
    { re := { lo := ((804492884832421 : ℚ) / 100000000000000000)
              hi := ((4771747145095643 : ℚ) / 500000000000000000) }
      im := { lo := ((-8673244210703321 : ℚ) / 1000000000000000000)
              hi := ((-1436179061272183 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2279568238226843 : ℚ) / 2500000000000000000)
              hi := ((-15954517742151967 : ℚ) / 100000000000000000000) }
      im := { lo := ((56307983556803 : ℚ) / 25000000000000000)
              hi := ((1502536395037793 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8712412453042377 : ℚ) / 10000000000000000000)
              hi := ((217480895368259 : ℚ) / 312500000000000000) }
      im := { lo := ((-7126298307383261 : ℚ) / 20000000000000000000)
              hi := ((5799348878693561 : ℚ) / 5000000000000000000) } }
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

def s084_t7_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((32822231516167837 : ℚ) / 10000000000000000000)
              hi := ((2054584381947769 : ℚ) / 250000000000000000) }
      im := { lo := ((-3181880321573471 : ℚ) / 50000000000000000)
              hi := ((-470041683394957 : ℚ) / 8000000000000000) } }
  D0Rect :=
    { re := { lo := ((4017155388603807 : ℚ) / 500000000000000000)
              hi := ((9532617323383423 : ℚ) / 1000000000000000000) }
      im := { lo := ((-4342475120667293 : ℚ) / 500000000000000000)
              hi := ((-899110167548221 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4540398744942617 : ℚ) / 5000000000000000000)
              hi := ((-974025485423393 : ℚ) / 6250000000000000000) }
      im := { lo := ((22531086221661083 : ℚ) / 10000000000000000000)
              hi := ((3005817867441429 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4355575155016409 : ℚ) / 5000000000000000000)
              hi := ((6960418061264203 : ℚ) / 10000000000000000000) }
      im := { lo := ((-35628320647579007 : ℚ) / 100000000000000000000)
              hi := ((1449807368918237 : ℚ) / 1250000000000000000) } }
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

def s084_t7_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((16466509467528581 : ℚ) / 5000000000000000000)
              hi := ((1645856541413029 : ℚ) / 200000000000000000) }
      im := { lo := ((-3181107257749389 : ℚ) / 50000000000000000)
              hi := ((-5873992369248489 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4011838466068441 : ℚ) / 500000000000000000)
              hi := ((9521724210062681 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1087080202272981 : ℚ) / 125000000000000000)
              hi := ((-288194114965397 : ℚ) / 40000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9043310224292369 : ℚ) / 10000000000000000000)
              hi := ((-1901774579854837 : ℚ) / 12500000000000000000) }
      im := { lo := ((22538927202796297 : ℚ) / 10000000000000000000)
              hi := ((3006557581859561 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2177473455926067 : ℚ) / 2500000000000000000)
              hi := ((6961452399038093 : ℚ) / 10000000000000000000) }
      im := { lo := ((-17812561207219347 : ℚ) / 50000000000000000000)
              hi := ((11598217568251443 : ℚ) / 10000000000000000000) } }
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

def s084_t7_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((16522000044636449 : ℚ) / 5000000000000000000)
              hi := ((8240247574520049 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1272133978638329 : ℚ) / 20000000000000000)
              hi := ((-5872465347794307 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((801302747516473 : ℚ) / 100000000000000000)
              hi := ((47554074188807 : ℚ) / 5000000000000000) }
      im := { lo := ((-1088539787954449 : ℚ) / 125000000000000000)
              hi := ((-7216809917555249 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-450290543394729 : ℚ) / 500000000000000000)
              hi := ((-2968777741744513 : ℚ) / 20000000000000000000) }
      im := { lo := ((22546716819583207 : ℚ) / 10000000000000000000)
              hi := ((3759114861251507 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8708642457835729 : ℚ) / 10000000000000000000)
              hi := ((6962491130590707 : ℚ) / 10000000000000000000) }
      im := { lo := ((-7124374703431079 : ℚ) / 20000000000000000000)
              hi := ((11597971278810137 : ℚ) / 10000000000000000000) } }
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

def s084_t7_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((33155181708454293 : ℚ) / 10000000000000000000)
              hi := ((82512314395073 : ℚ) / 10000000000000000) }
      im := { lo := ((-3179563368548647 : ℚ) / 50000000000000000)
              hi := ((-5870940020435173 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((2000590481479813 : ℚ) / 250000000000000000)
              hi := ((94998897161663 : ℚ) / 10000000000000000) }
      im := { lo := ((-8719979990927003 : ℚ) / 1000000000000000000)
              hi := ((-7228752730549347 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8968299724133437 : ℚ) / 10000000000000000000)
              hi := ((-144734822992273 : ℚ) / 1000000000000000000) }
      im := { lo := ((22554454218059357 : ℚ) / 10000000000000000000)
              hi := ((1504010434553881 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1741477939220171 : ℚ) / 2000000000000000000)
              hi := ((3481763870159103 : ℚ) / 5000000000000000000) }
      im := { lo := ((-356185705803059 : ℚ) / 1000000000000000000)
              hi := ((11597719745566953 : ℚ) / 10000000000000000000) } }
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

def s084_t7_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((415832037273097 : ℚ) / 125000000000000000)
              hi := ((103277929197293 : ℚ) / 12500000000000000) }
      im := { lo := ((-1271517011618337 : ℚ) / 20000000000000000)
              hi := ((-5869416382050863 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((3995839880912967 : ℚ) / 500000000000000000)
              hi := ((9488949417030079 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2182906649289047 : ℚ) / 250000000000000000)
              hi := ((-7240681356046491 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4465388928997959 : ℚ) / 5000000000000000000)
              hi := ((-7051484192680053 : ℚ) / 50000000000000000000) }
      im := { lo := ((2256213794097909 : ℚ) / 1000000000000000000)
              hi := ((3008744666679959 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-544133306059203 : ℚ) / 625000000000000000)
              hi := ((6964559588159757 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1780760836606831 : ℚ) / 5000000000000000000)
              hi := ((724841455197159 : ℚ) / 625000000000000000) } }
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

def s084_t7_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((6675630643696361 : ℚ) / 2000000000000000000)
              hi := ((51707845704501 : ℚ) / 6250000000000000) }
      im := { lo := ((-3178022416311893 : ℚ) / 50000000000000000)
              hi := ((-2933947229272159 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((798098198146269 : ℚ) / 100000000000000000)
              hi := ((9477992974329023 : ℚ) / 1000000000000000000) }
      im := { lo := ((-8743258100547553 : ℚ) / 1000000000000000000)
              hi := ((-3626297878841669 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-555827704554051 : ℚ) / 625000000000000000)
              hi := ((-6866184251827731 : ℚ) / 50000000000000000000) }
      im := { lo := ((22569770781850217 : ℚ) / 10000000000000000000)
              hi := ((376182874435939 : ℚ) / 125000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-870487090373213 : ℚ) / 1000000000000000000)
              hi := ((1741396379583509 : ℚ) / 2500000000000000000) }
      im := { lo := ((-35611824137499567 : ℚ) / 100000000000000000000)
              hi := ((2899300776779231 : ℚ) / 2500000000000000000) } }
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

def s084_t7_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((1674497212554741 : ℚ) / 500000000000000000)
              hi := ((8284295218624041 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3177253066922351 : ℚ) / 50000000000000000)
              hi := ((-11732748368266313 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((398513412524359 : ℚ) / 50000000000000000)
              hi := ((946702077052889 : ℚ) / 100000000000000000) }
      im := { lo := ((-8754875224389233 : ℚ) / 1000000000000000000)
              hi := ((-1452899037664081 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8855698931682081 : ℚ) / 10000000000000000000)
              hi := ((-6680827204147977 : ℚ) / 50000000000000000000) }
      im := { lo := ((11288675071247677 : ℚ) / 5000000000000000000)
              hi := ((30101761168919673 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8703605700095057 : ℚ) / 10000000000000000000)
              hi := ((6966607511120807 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2225523886597811 : ℚ) / 6250000000000000000)
              hi := ((11596938160002997 : ℚ) / 10000000000000000000) } }
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

def s084_t7_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((16800961259001103 : ℚ) / 5000000000000000000)
              hi := ((8295355199331651 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6352969007957361 : ℚ) / 100000000000000000)
              hi := ((-183276734837217 : ℚ) / 3125000000000000) } }
  D0Rect :=
    { re := { lo := ((3979769223885477 : ℚ) / 500000000000000000)
              hi := ((4728016472644923 : ℚ) / 500000000000000000) }
      im := { lo := ((-547904884423923 : ℚ) / 62500000000000000)
              hi := ((-3638189708374999 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8818145771610599 : ℚ) / 10000000000000000000)
              hi := ((-1299081791665731 : ℚ) / 10000000000000000000) }
      im := { lo := ((2258487516907293 : ℚ) / 1000000000000000000)
              hi := ((15054420546174337 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8702344644237983 : ℚ) / 10000000000000000000)
              hi := ((435477058609023 : ℚ) / 625000000000000000) }
      im := { lo := ((-35604882596765617 : ℚ) / 100000000000000000000)
              hi := ((11596667613431241 : ℚ) / 10000000000000000000) } }
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

def s084_t7_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((16857051499624507 : ℚ) / 5000000000000000000)
              hi := ((2076608477149921 : ℚ) / 250000000000000000) }
      im := { lo := ((-3175716695573639 : ℚ) / 50000000000000000)
              hi := ((-14658346294002039 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((7948793001483323 : ℚ) / 1000000000000000000)
              hi := ((9445029141452057 : ℚ) / 1000000000000000000) }
      im := { lo := ((-4389033193229771 : ℚ) / 500000000000000000)
              hi := ((-1822062222002369 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-548786356467153 : ℚ) / 625000000000000000)
              hi := ((-6309941030114893 : ℚ) / 50000000000000000000) }
      im := { lo := ((1129617400038903 : ℚ) / 500000000000000000)
              hi := ((1505793379384149 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1087635153017909 : ℚ) / 1250000000000000000)
              hi := ((6968655274646879 : ℚ) / 10000000000000000000) }
      im := { lo := ((-17800669480015933 : ℚ) / 50000000000000000000)
              hi := ((1449549103243293 : ℚ) / 1250000000000000000) } }
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

def s084_t7_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((33826474466237973 : ℚ) / 10000000000000000000)
              hi := ((1039691540485847 : ℚ) / 125000000000000000) }
      im := { lo := ((-6349899418544121 : ℚ) / 100000000000000000)
              hi := ((-1465455767380149 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((992254021665463 : ℚ) / 125000000000000000)
              hi := ((575806220443 : ℚ) / 61035156250000) }
      im := { lo := ((-4394820032154121 : ℚ) / 500000000000000000)
              hi := ((-1140641161455469 : ℚ) / 156250000000000000) } }
  DrestRect :=
    { re := { lo := ((-8743006677282639 : ℚ) / 10000000000000000000)
              hi := ((-12248848349633989 : ℚ) / 100000000000000000000) }
      im := { lo := ((4519953805074149 : ℚ) / 2000000000000000000)
              hi := ((15061420110236783 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8699821419198999 : ℚ) / 10000000000000000000)
              hi := ((6969680510231709 : ℚ) / 10000000000000000000) }
      im := { lo := ((-111243176978129 : ℚ) / 312500000000000000)
              hi := ((463844813579313 : ℚ) / 400000000000000000) } }
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

def s084_t7_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((16969522401144661 : ℚ) / 5000000000000000000)
              hi := ((166572994113379 : ℚ) / 20000000000000000) }
      im := { lo := ((-634836704353001 : ℚ) / 10000000000000000)
              hi := ((-5860309213375491 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((495453492013519 : ℚ) / 62500000000000000)
              hi := ((9422973005843759 : ℚ) / 1000000000000000000) }
      im := { lo := ((-4400599854231283 : ℚ) / 500000000000000000)
              hi := ((-1827985621181629 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8705422603000903 : ℚ) / 10000000000000000000)
              hi := ((-5938849656298077 : ℚ) / 50000000000000000000) }
      im := { lo := ((11303568368415827 : ℚ) / 5000000000000000000)
              hi := ((30129760473811443 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8698559505474699 : ℚ) / 10000000000000000000)
              hi := ((871337864547591 : ℚ) / 1250000000000000000) }
      im := { lo := ((-177971350591657 : ℚ) / 500000000000000000)
              hi := ((1159584560019529 : ℚ) / 1000000000000000000) } }
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

def s084_t7_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((3405180290974259 : ℚ) / 1000000000000000000)
              hi := ((4169893543084469 : ℚ) / 500000000000000000) }
      im := { lo := ((-6346836379643887 : ℚ) / 100000000000000000)
              hi := ((-5858796840988517 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1979115740319891 : ℚ) / 250000000000000000)
              hi := ((9411921992405137 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1101593195872021 : ℚ) / 125000000000000000)
              hi := ((-7323765744916371 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1083479103239033 : ℚ) / 1250000000000000000)
              hi := ((-11506403144349621 : ℚ) / 100000000000000000000) }
      im := { lo := ((1130722358740447 : ℚ) / 500000000000000000)
              hi := ((30136632272149367 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1087161796186227 : ℚ) / 1250000000000000000)
              hi := ((6971721383294431 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3559073169843631 : ℚ) / 10000000000000000000)
              hi := ((11595571837461289 : ℚ) / 10000000000000000000) } }
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

def s084_t7_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((2135296817164277 : ℚ) / 625000000000000000)
              hi := ((8350944392579489 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6345307461712793 : ℚ) / 100000000000000000)
              hi := ((-1171457183974943 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((1976413377961867 : ℚ) / 250000000000000000)
              hi := ((9400856029758741 : ℚ) / 1000000000000000000) }
      im := { lo := ((-8824276420933037 : ℚ) / 1000000000000000000)
              hi := ((-7335574403356173 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2157558445335587 : ℚ) / 2500000000000000000)
              hi := ((-11134996556840661 : ℚ) / 100000000000000000000) }
      im := { lo := ((22621703061450013 : ℚ) / 10000000000000000000)
              hi := ((30143452868771027 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1087003276512957 : ℚ) / 1250000000000000000)
              hi := ((6972736114338867 : ℚ) / 10000000000000000000) }
      im := { lo := ((-17793646387038217 : ℚ) / 50000000000000000000)
              hi := ((11595308191752593 : ℚ) / 10000000000000000000) } }
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

def s084_t7_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((3427786218754117 : ℚ) / 1000000000000000000)
              hi := ((2090530955241777 : ℚ) / 250000000000000000) }
      im := { lo := ((-317189019317891 : ℚ) / 5000000000000000)
              hi := ((-5855776377604979 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((315793129568101 : ℚ) / 40000000000000000)
              hi := ((9389774460484617 : ℚ) / 1000000000000000000) }
      im := { lo := ((-8835792344364487 : ℚ) / 1000000000000000000)
              hi := ((-3673684165437687 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8592624400392343 : ℚ) / 10000000000000000000)
              hi := ((-538174611480453 : ℚ) / 5000000000000000000) }
      im := { lo := ((22628906156500327 : ℚ) / 10000000000000000000)
              hi := ((15075110237587337 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8694772663767657 : ℚ) / 10000000000000000000)
              hi := ((1394752946656461 : ℚ) / 2000000000000000000) }
      im := { lo := ((-3558396580726549 : ℚ) / 10000000000000000000)
              hi := ((579752796075769 : ℚ) / 500000000000000000) } }
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

def s084_t7_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((34391134835180417 : ℚ) / 10000000000000000000)
              hi := ((4186662952201741 : ℚ) / 500000000000000000) }
      im := { lo := ((-634225501074633 : ℚ) / 10000000000000000)
              hi := ((-2927134168325927 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((98549837545131 : ℚ) / 12500000000000000)
              hi := ((1875735490730247 : ℚ) / 200000000000000000) }
      im := { lo := ((-4423646636585991 : ℚ) / 500000000000000000)
              hi := ((-36795737794495763 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-855500493140479 : ℚ) / 1000000000000000000)
              hi := ((-10391888846149741 : ℚ) / 100000000000000000000) }
      im := { lo := ((2263605610012693 : ℚ) / 1000000000000000000)
              hi := ((3015693542558089 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-869354082168633 : ℚ) / 1000000000000000000)
              hi := ((6974814349528769 : ℚ) / 10000000000000000000) }
      im := { lo := ((-35580638147460317 : ℚ) / 100000000000000000000)
              hi := ((1159480374836719 : ℚ) / 1000000000000000000) } }
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

def s084_t7_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((58629239793 : ℚ) / 1000000000000)
      ((-438467649 : ℚ) / 1000000000000)
      ((567899249 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((862614800224429 : ℚ) / 250000000000000000)
              hi := ((8384548164689929 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6340731328778147 : ℚ) / 100000000000000000)
              hi := ((-731595227273459 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((1968282556601459 : ℚ) / 250000000000000000)
              hi := ((936756463427033 : ℚ) / 100000000000000000) }
      im := { lo := ((-8858778926512599 : ℚ) / 1000000000000000000)
              hi := ((-3685456160329283 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8517373863050191 : ℚ) / 10000000000000000000)
              hi := ((-10020203201020491 : ℚ) / 100000000000000000000) }
      im := { lo := ((22643154580694147 : ℚ) / 10000000000000000000)
              hi := ((754089900035851 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8692314840524661 : ℚ) / 10000000000000000000)
              hi := ((871983639411421 : ℚ) / 1250000000000000000) }
      im := { lo := ((-889434397788711 : ℚ) / 2500000000000000000)
              hi := ((11594558291006239 : ℚ) / 10000000000000000000) } }
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
    (hi : i ∈ positiveBoxSubboxesOf .s084_t7) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s084_t7).constants.mainLower)
      ((positiveBoxCombinedCert .s084_t7).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s084_t7).constants.restUpper) := by
  if h0 : i = .s084_t7_sb000 then
    exact s084_t7_sb000_certificateData
  else if h1 : i = .s084_t7_sb001 then
    exact s084_t7_sb001_certificateData
  else if h2 : i = .s084_t7_sb002 then
    exact s084_t7_sb002_certificateData
  else if h3 : i = .s084_t7_sb003 then
    exact s084_t7_sb003_certificateData
  else if h4 : i = .s084_t7_sb004 then
    exact s084_t7_sb004_certificateData
  else if h5 : i = .s084_t7_sb005 then
    exact s084_t7_sb005_certificateData
  else if h6 : i = .s084_t7_sb006 then
    exact s084_t7_sb006_certificateData
  else if h7 : i = .s084_t7_sb007 then
    exact s084_t7_sb007_certificateData
  else if h8 : i = .s084_t7_sb008 then
    exact s084_t7_sb008_certificateData
  else if h9 : i = .s084_t7_sb009 then
    exact s084_t7_sb009_certificateData
  else if h10 : i = .s084_t7_sb010 then
    exact s084_t7_sb010_certificateData
  else if h11 : i = .s084_t7_sb011 then
    exact s084_t7_sb011_certificateData
  else if h12 : i = .s084_t7_sb012 then
    exact s084_t7_sb012_certificateData
  else if h13 : i = .s084_t7_sb013 then
    exact s084_t7_sb013_certificateData
  else if h14 : i = .s084_t7_sb014 then
    exact s084_t7_sb014_certificateData
  else if h15 : i = .s084_t7_sb015 then
    exact s084_t7_sb015_certificateData
  else if h16 : i = .s084_t7_sb016 then
    exact s084_t7_sb016_certificateData
  else if h17 : i = .s084_t7_sb017 then
    exact s084_t7_sb017_certificateData
  else if h18 : i = .s084_t7_sb018 then
    exact s084_t7_sb018_certificateData
  else if h19 : i = .s084_t7_sb019 then
    exact s084_t7_sb019_certificateData
  else if h20 : i = .s084_t7_sb020 then
    exact s084_t7_sb020_certificateData
  else if h21 : i = .s084_t7_sb021 then
    exact s084_t7_sb021_certificateData
  else if h22 : i = .s084_t7_sb022 then
    exact s084_t7_sb022_certificateData
  else if h23 : i = .s084_t7_sb023 then
    exact s084_t7_sb023_certificateData
  else if h24 : i = .s084_t7_sb024 then
    exact s084_t7_sb024_certificateData
  else if h25 : i = .s084_t7_sb025 then
    exact s084_t7_sb025_certificateData
  else if h26 : i = .s084_t7_sb026 then
    exact s084_t7_sb026_certificateData
  else if h27 : i = .s084_t7_sb027 then
    exact s084_t7_sb027_certificateData
  else if h28 : i = .s084_t7_sb028 then
    exact s084_t7_sb028_certificateData
  else if h29 : i = .s084_t7_sb029 then
    exact s084_t7_sb029_certificateData
  else if h30 : i = .s084_t7_sb030 then
    exact s084_t7_sb030_certificateData
  else if h31 : i = .s084_t7_sb031 then
    exact s084_t7_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S084T7
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
