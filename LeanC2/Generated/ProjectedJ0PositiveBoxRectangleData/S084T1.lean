import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.84_t1

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
namespace S084T1

open ProjectedJ0RectangleArithmetic

def s084_t1_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((1133567574197783 : ℚ) / 1000000000000000000)
              hi := ((1218390848473143 : ℚ) / 200000000000000000) }
      im := { lo := ((-54433469373153 : ℚ) / 800000000000000)
              hi := ((-1262528438520869 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((2036769913487577 : ℚ) / 200000000000000000)
              hi := ((5872336313904933 : ℚ) / 500000000000000000) }
      im := { lo := ((-1055160426604001 : ℚ) / 200000000000000000)
              hi := ((-3714730953395739 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4524637559952717 : ℚ) / 2500000000000000000)
              hi := ((-2621914735602939 : ℚ) / 2500000000000000000) }
      im := { lo := ((1886702963264747 : ℚ) / 1000000000000000000)
              hi := ((26477844556618457 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-9027615013977681 : ℚ) / 10000000000000000000)
              hi := ((6663642711193669 : ℚ) / 10000000000000000000) }
      im := { lo := ((-18115959427120483 : ℚ) / 50000000000000000000)
              hi := ((291022915970957 : ℚ) / 250000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((11391632642917151 : ℚ) / 10000000000000000000)
              hi := ((6097516904133681 : ℚ) / 1000000000000000000) }
      im := { lo := ((-272092661283791 : ℚ) / 4000000000000000)
              hi := ((-6310784716250249 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((2035569674736551 : ℚ) / 200000000000000000)
              hi := ((2347686602044427 : ℚ) / 200000000000000000) }
      im := { lo := ((-10580922337249457 : ℚ) / 2000000000000000000)
              hi := ((-1864828680838583 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9033155817389103 : ℚ) / 5000000000000000000)
              hi := ((-2613922365482087 : ℚ) / 2500000000000000000) }
      im := { lo := ((4721868567302057 : ℚ) / 2500000000000000000)
              hi := ((26498033385986683 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-9026467091406251 : ℚ) / 10000000000000000000)
              hi := ((6665003710260809 : ℚ) / 10000000000000000000) }
      im := { lo := ((-113218868502927 : ℚ) / 312500000000000000)
              hi := ((11640803290607097 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((2861954765037859 : ℚ) / 2500000000000000000)
              hi := ((1525775459815057 : ℚ) / 250000000000000000) }
      im := { lo := ((-1700112574166449 : ℚ) / 25000000000000000)
              hi := ((-394308014500931 : ℚ) / 6250000000000000) } }
  D0Rect :=
    { re := { lo := ((5085913738659099 : ℚ) / 500000000000000000)
              hi := ((5866086582559117 : ℚ) / 500000000000000000) }
      im := { lo := ((-530511162262303 : ℚ) / 100000000000000000)
              hi := ((-7489151376870909 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9017021352083433 : ℚ) / 5000000000000000000)
              hi := ((-10423692611414759 : ℚ) / 10000000000000000000) }
      im := { lo := ((9453937465374397 : ℚ) / 5000000000000000000)
              hi := ((6629543835198863 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-9025319764225613 : ℚ) / 10000000000000000000)
              hi := ((1666591085506027 : ℚ) / 2500000000000000000) }
      im := { lo := ((-1811407414640773 : ℚ) / 5000000000000000000)
              hi := ((2328137785077177 : ℚ) / 2000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((575211476771013 : ℚ) / 500000000000000000)
              hi := ((1527177372942893 : ℚ) / 250000000000000000) }
      im := { lo := ((-1359717015546901 : ℚ) / 20000000000000000)
              hi := ((-3153536317125353 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((10165787116891457 : ℚ) / 1000000000000000000)
              hi := ((1465736612079779 : ℚ) / 125000000000000000) }
      im := { lo := ((-2659877532228983 : ℚ) / 500000000000000000)
              hi := ((-300758744663637 : ℚ) / 80000000000000000) } }
  DrestRect :=
    { re := { lo := ((-18001747330399877 : ℚ) / 10000000000000000000)
              hi := ((-2597916168824763 : ℚ) / 2500000000000000000) }
      im := { lo := ((18928228663412279 : ℚ) / 10000000000000000000)
              hi := ((106153093259953 : ℚ) / 40000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4512086984325617 : ℚ) / 5000000000000000000)
              hi := ((3333862773761591 : ℚ) / 5000000000000000000) }
      im := { lo := ((-7245247380014727 : ℚ) / 20000000000000000000)
              hi := ((2328114447745327 : ℚ) / 2000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((722554557604347 : ℚ) / 625000000000000000)
              hi := ((122286778652659 : ℚ) / 20000000000000000) }
      im := { lo := ((-6796720727593959 : ℚ) / 100000000000000000)
              hi := ((-197038064861247 : ℚ) / 3125000000000000) } }
  D0Rect :=
    { re := { lo := ((2031945277290911 : ℚ) / 200000000000000000)
              hi := ((585979656402993 : ℚ) / 50000000000000000) }
      im := { lo := ((-83349842326651 : ℚ) / 15625000000000000)
              hi := ((-3774384758717913 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1796942339932669 : ℚ) / 1000000000000000000)
              hi := ((-2071921575832897 : ℚ) / 2000000000000000000) }
      im := { lo := ((9474268204226863 : ℚ) / 5000000000000000000)
              hi := ((3319790786373437 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-360920917809253 : ℚ) / 400000000000000000)
              hi := ((1667270142482529 : ℚ) / 2500000000000000000) }
      im := { lo := ((-36224287894638923 : ℚ) / 100000000000000000000)
              hi := ((1455056455912997 : ℚ) / 1250000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((5808876017597759 : ℚ) / 5000000000000000000)
              hi := ((12239979754540527 : ℚ) / 2000000000000000000) }
      im := { lo := ((-1698714305614887 : ℚ) / 25000000000000000)
              hi := ((-3151682292855989 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((5076822889931931 : ℚ) / 500000000000000000)
              hi := ((11713273382043563 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1337254031408939 : ℚ) / 250000000000000000)
              hi := ((-303142159489443 : ℚ) / 80000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8968534969554621 : ℚ) / 5000000000000000000)
              hi := ((-258188083541171 : ℚ) / 250000000000000000) }
      im := { lo := ((1896879938215887 : ℚ) / 1000000000000000000)
              hi := ((531566658417223 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-9021867767887483 : ℚ) / 10000000000000000000)
              hi := ((6670430483689429 : ℚ) / 10000000000000000000) }
      im := { lo := ((-7074666347209 : ℚ) / 19531250000000000)
              hi := ((5820163096989143 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((11674868547534019 : ℚ) / 10000000000000000000)
              hi := ((12251324334511841 : ℚ) / 2000000000000000000) }
      im := { lo := ((-3396497266736849 : ℚ) / 50000000000000000)
              hi := ((-3150756098805739 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((5073772856528787 : ℚ) / 500000000000000000)
              hi := ((5853466635466603 : ℚ) / 500000000000000000) }
      im := { lo := ((-5363633459099699 : ℚ) / 1000000000000000000)
              hi := ((-3804161240018173 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-17904685474149091 : ℚ) / 10000000000000000000)
              hi := ((-10295412644099207 : ℚ) / 10000000000000000000) }
      im := { lo := ((9494509588261139 : ℚ) / 5000000000000000000)
              hi := ((265982915847753 : ℚ) / 100000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4510355134546027 : ℚ) / 5000000000000000000)
              hi := ((6671777120048503 : ℚ) / 10000000000000000000) }
      im := { lo := ((-36220245358283 : ℚ) / 100000000000000000)
              hi := ((727512224081727 : ℚ) / 625000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((11732218816859377 : ℚ) / 10000000000000000000)
              hi := ((6131356118971069 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3395566336017051 : ℚ) / 50000000000000000)
              hi := ((-6299660905402833 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((10141425554041609 : ℚ) / 1000000000000000000)
              hi := ((2340114688976657 : ℚ) / 200000000000000000) }
      im := { lo := ((-5378241841974857 : ℚ) / 1000000000000000000)
              hi := ((-23868984399097 : ℚ) / 6250000000000000) } }
  DrestRect :=
    { re := { lo := ((-1787227137669697 : ℚ) / 1000000000000000000)
              hi := ((-64145465901037 : ℚ) / 62500000000000000) }
      im := { lo := ((19009194103897797 : ℚ) / 10000000000000000000)
              hi := ((1330910193473487 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-9019549418339047 : ℚ) / 10000000000000000000)
              hi := ((667311945143867 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1131816996304117 : ℚ) / 3125000000000000000)
              hi := ((2328011864640819 : ℚ) / 2000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((2357960602485081 : ℚ) / 2000000000000000000)
              hi := ((6137071751172249 : ℚ) / 1000000000000000000) }
      im := { lo := ((-169731793476559 : ℚ) / 2500000000000000)
              hi := ((-3148905307928291 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((2533821454527083 : ℚ) / 250000000000000000)
              hi := ((5847096709117269 : ℚ) / 500000000000000000) }
      im := { lo := ((-10785682821035411 : ℚ) / 2000000000000000000)
              hi := ((-19169527906070733 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8919913541709371 : ℚ) / 5000000000000000000)
              hi := ((-409244390583757 : ℚ) / 400000000000000000) }
      im := { lo := ((19029325083109979 : ℚ) / 10000000000000000000)
              hi := ((26638068757854653 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1803677098112537 : ℚ) / 2000000000000000000)
              hi := ((6674457750152061 : ℚ) / 10000000000000000000) }
      im := { lo := ((-9054013615435889 : ℚ) / 25000000000000000000)
              hi := ((11639924128860261 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((11847610049292383 : ℚ) / 10000000000000000000)
              hi := ((1535702507512623 : ℚ) / 250000000000000000) }
      im := { lo := ((-6787411796784353 : ℚ) / 100000000000000000)
              hi := ((-196748789506513 : ℚ) / 3125000000000000) } }
  D0Rect :=
    { re := { lo := ((10129126669022949 : ℚ) / 1000000000000000000)
              hi := ((73048706537267 : ℚ) / 6250000000000000) }
      im := { lo := ((-2703716232833471 : ℚ) / 500000000000000000)
              hi := ((-1924382575176069 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1780735312908763 : ℚ) / 1000000000000000000)
              hi := ((-2039783569649959 : ℚ) / 2000000000000000000) }
      im := { lo := ((238117647912479 : ℚ) / 125000000000000000)
              hi := ((13328943252517017 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4508612627070519 : ℚ) / 5000000000000000000)
              hi := ((3337899396587063 : ℚ) / 5000000000000000000) }
      im := { lo := ((-362139852025263 : ℚ) / 1000000000000000000)
              hi := ((2909947702944821 : ℚ) / 2500000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((5952826159773539 : ℚ) / 5000000000000000000)
              hi := ((6148569820858539 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3392776372815081 : ℚ) / 50000000000000000)
              hi := ((-3147056481813243 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((50614739961441 : ℚ) / 5000000000000000)
              hi := ((11681372465058603 : ℚ) / 1000000000000000000) }
      im := { lo := ((-542201519251149 : ℚ) / 100000000000000000)
              hi := ((-19318079705486137 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8887425242555953 : ℚ) / 5000000000000000000)
              hi := ((-635418624546071 : ℚ) / 625000000000000000) }
      im := { lo := ((3813890689725269 : ℚ) / 2000000000000000000)
              hi := ((5335531575344707 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4508030752634597 : ℚ) / 5000000000000000000)
              hi := ((3338567685032779 : ℚ) / 5000000000000000000) }
      im := { lo := ((-905296786746429 : ℚ) / 2500000000000000000)
              hi := ((11639652912720459 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((299098340358459 : ℚ) / 250000000000000000)
              hi := ((1538587674237921 : ℚ) / 250000000000000000) }
      im := { lo := ((-3391847258747617 : ℚ) / 50000000000000000)
              hi := ((-6292265783714061 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((5058374932000907 : ℚ) / 500000000000000000)
              hi := ((11674931630558131 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1087317787013179 : ℚ) / 200000000000000000)
              hi := ((-38784585662059333 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-17742317382372407 : ℚ) / 10000000000000000000)
              hi := ((-1266806512223777 : ℚ) / 1250000000000000000) }
      im := { lo := ((9544725729531537 : ℚ) / 5000000000000000000)
              hi := ((5339476258641257 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-9014893705660693 : ℚ) / 10000000000000000000)
              hi := ((3339233472446663 : ℚ) / 5000000000000000000) }
      im := { lo := ((-36209705538478907 : ℚ) / 100000000000000000000)
              hi := ((11639509658787673 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((3005611509844401 : ℚ) / 2500000000000000000)
              hi := ((385009589156001 : ℚ) / 62500000000000000) }
      im := { lo := ((-169545929793031 : ℚ) / 2500000000000000)
              hi := ((-98287807068759 : ℚ) / 1562500000000000) } }
  D0Rect :=
    { re := { lo := ((10110531859549509 : ℚ) / 1000000000000000000)
              hi := ((5834235486036477 : ℚ) / 500000000000000000) }
      im := { lo := ((-170348568962673 : ℚ) / 31250000000000000)
              hi := ((-7786584926591407 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-177097562452773 : ℚ) / 100000000000000000)
              hi := ((-10102177828023617 : ℚ) / 10000000000000000000) }
      im := { lo := ((19109403491279339 : ℚ) / 10000000000000000000)
              hi := ((5343411806418427 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1802744633448549 : ℚ) / 2000000000000000000)
              hi := ((3339897415655013 : ℚ) / 5000000000000000000) }
      im := { lo := ((-36207493511176107 : ℚ) / 100000000000000000000)
              hi := ((11639361663354007 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((6040589331413333 : ℚ) / 5000000000000000000)
              hi := ((616597908634643 : ℚ) / 100000000000000000) }
      im := { lo := ((-1694995284828781 : ℚ) / 25000000000000000)
              hi := ((-3144287099101297 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((10104293816752631 : ℚ) / 1000000000000000000)
              hi := ((22777325574917 : ℚ) / 1953125000000000) }
      im := { lo := ((-2732855450056457 : ℚ) / 500000000000000000)
              hi := ((-1954058840965013 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1104822959416463 : ℚ) / 625000000000000000)
              hi := ((-5034937538672809 : ℚ) / 5000000000000000000) }
      im := { lo := ((4782327298344297 : ℚ) / 2500000000000000000)
              hi := ((1671043211402599 : ℚ) / 625000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1126568561746043 : ℚ) / 1250000000000000000)
              hi := ((835139704184531 : ℚ) / 1250000000000000000) }
      im := { lo := ((-452568600386863 : ℚ) / 1250000000000000000)
              hi := ((116392341881661 : ℚ) / 100000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((2428025929232489 : ℚ) / 2000000000000000000)
              hi := ((3085913921311591 : ℚ) / 500000000000000000) }
      im := { lo := ((-6778126265729723 : ℚ) / 100000000000000000)
              hi := ((-3143364764252759 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((2019606993367333 : ℚ) / 200000000000000000)
              hi := ((11655491582236091 : ℚ) / 1000000000000000000) }
      im := { lo := ((-10960517673261283 : ℚ) / 2000000000000000000)
              hi := ((-3922934346088557 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4411138013366119 : ℚ) / 2500000000000000000)
              hi := ((-5018771303917463 : ℚ) / 5000000000000000000) }
      im := { lo := ((19149166763937657 : ℚ) / 10000000000000000000)
              hi := ((13378140027617497 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-9011369327689519 : ℚ) / 10000000000000000000)
              hi := ((267297399759483 : ℚ) / 400000000000000000) }
      im := { lo := ((-226272572327911 : ℚ) / 625000000000000000)
              hi := ((5819559743319477 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((12199297337421567 : ℚ) / 10000000000000000000)
              hi := ((772212480820729 : ℚ) / 125000000000000000) }
      im := { lo := ((-3388136201242437 : ℚ) / 50000000000000000)
              hi := ((-3142442906508273 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((10091754237629707 : ℚ) / 1000000000000000000)
              hi := ((5824487365707059 : ℚ) / 500000000000000000) }
      im := { lo := ((-5494798002643967 : ℚ) / 1000000000000000000)
              hi := ((-1968871207480259 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-880595641496337 : ℚ) / 500000000000000000)
              hi := ((-5002589037030029 : ℚ) / 5000000000000000000) }
      im := { lo := ((1198060826068899 : ℚ) / 625000000000000000)
              hi := ((13387913977830283 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-9010184988812559 : ℚ) / 10000000000000000000)
              hi := ((3341873117008413 : ℚ) / 5000000000000000000) }
      im := { lo := ((-3620172521788351 : ℚ) / 10000000000000000000)
              hi := ((1454875458226463 : ℚ) / 1250000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((1532336469521253 : ℚ) / 1250000000000000000)
              hi := ((6183594070998691 : ℚ) / 1000000000000000000) }
      im := { lo := ((-270976781670009 : ℚ) / 4000000000000000)
              hi := ((-3141521532221239 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((5042726496097641 : ℚ) / 500000000000000000)
              hi := ((11642438810042961 : ℚ) / 1000000000000000000) }
      im := { lo := ((-440746267006073 : ℚ) / 80000000000000000)
              hi := ((-988135475382219 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-17579246695028149 : ℚ) / 10000000000000000000)
              hi := ((-9972784597522871 : ℚ) / 10000000000000000000) }
      im := { lo := ((1199295763786659 : ℚ) / 625000000000000000)
              hi := ((1339766567821961 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4504497671705881 : ℚ) / 5000000000000000000)
              hi := ((6685051220540027 : ℚ) / 10000000000000000000) }
      im := { lo := ((-452498227402509 : ℚ) / 1250000000000000000)
              hi := ((2327777929921707 : ℚ) / 2000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((384947354498891 : ℚ) / 312500000000000000)
              hi := ((6189510280150747 : ℚ) / 1000000000000000000) }
      im := { lo := ((-846570954705553 : ℚ) / 12500000000000000)
              hi := ((-251248053401033 : ℚ) / 4000000000000000) } }
  D0Rect :=
    { re := { lo := ((251978294460973 : ℚ) / 25000000000000000)
              hi := ((465435330854289 : ℚ) / 40000000000000000) }
      im := { lo := ((-2761925207183003 : ℚ) / 500000000000000000)
              hi := ((-1983666086241869 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8773277059676279 : ℚ) / 5000000000000000000)
              hi := ((-9940361804933531 : ℚ) / 10000000000000000000) }
      im := { lo := ((19208443861774343 : ℚ) / 10000000000000000000)
              hi := ((13407395023994353 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-9007802113284927 : ℚ) / 10000000000000000000)
              hi := ((3343175837851979 : ℚ) / 5000000000000000000) }
      im := { lo := ((-36197952510218993 : ℚ) / 100000000000000000000)
              hi := ((1163877164141693 : ℚ) / 1000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((6189084128530671 : ℚ) / 5000000000000000000)
              hi := ((12390896812404989 : ℚ) / 2000000000000000000) }
      im := { lo := ((-67707166146657 : ℚ) / 1000000000000000)
              hi := ((-6279360704459869 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1259098839634993 : ℚ) / 125000000000000000)
              hi := ((2325861608703201 : ℚ) / 200000000000000000) }
      im := { lo := ((-11076726768658611 : ℚ) / 2000000000000000000)
              hi := ((-3982114032507669 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-17513832751545723 : ℚ) / 10000000000000000000)
              hi := ((-4953956106111013 : ℚ) / 5000000000000000000) }
      im := { lo := ((3845622039260213 : ℚ) / 2000000000000000000)
              hi := ((5366840389233833 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-281456499745559 : ℚ) / 312500000000000000)
              hi := ((3343825147302191 : ℚ) / 5000000000000000000) }
      im := { lo := ((-18097998065706627 : ℚ) / 50000000000000000000)
              hi := ((5819324219101317 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((1243824235132931 : ℚ) / 1000000000000000000)
              hi := ((12402818549731071 : ℚ) / 2000000000000000000) }
      im := { lo := ((-1692216664727247 : ℚ) / 25000000000000000)
              hi := ((-3138760496458449 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((10066429372870767 : ℚ) / 1000000000000000000)
              hi := ((5811356787522883 : ℚ) / 500000000000000000) }
      im := { lo := ((-1110573707687337 : ℚ) / 200000000000000000)
              hi := ((-1998443062431057 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-437027179604081 : ℚ) / 250000000000000000)
              hi := ((-98754313528609 : ℚ) / 100000000000000000) }
      im := { lo := ((19247727076918677 : ℚ) / 10000000000000000000)
              hi := ((134267855413139 : ℚ) / 50000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-9005411374984493 : ℚ) / 10000000000000000000)
              hi := ((6688945472684879 : ℚ) / 10000000000000000000) }
      im := { lo := ((-361940320030233 : ℚ) / 1000000000000000000)
              hi := ((11638524336119469 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((12498549960708399 : ℚ) / 10000000000000000000)
              hi := ((1241478324434477 : ℚ) / 200000000000000000) }
      im := { lo := ((-1353403530631607 : ℚ) / 20000000000000000)
              hi := ((-6275682318988517 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((10060048330965469 : ℚ) / 1000000000000000000)
              hi := ((580804965265409 : ℚ) / 50000000000000000) }
      im := { lo := ((-2783682455692823 : ℚ) / 500000000000000000)
              hi := ((-4011649375092499 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8724156838442413 : ℚ) / 5000000000000000000)
              hi := ((-4921461540780387 : ℚ) / 5000000000000000000) }
      im := { lo := ((19267298089315939 : ℚ) / 10000000000000000000)
              hi := ((13436446909346881 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1125526195146581 : ℚ) / 1250000000000000000)
              hi := ((3345117255046683 : ℚ) / 5000000000000000000) }
      im := { lo := ((-3619205635978779 : ℚ) / 10000000000000000000)
              hi := ((5819199479162753 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((6279547613833763 : ℚ) / 5000000000000000000)
              hi := ((12426790032314821 : ℚ) / 2000000000000000000) }
      im := { lo := ((-676516957910443 : ℚ) / 10000000000000000)
              hi := ((-6273844715813523 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((2010729629860409 : ℚ) / 200000000000000000)
              hi := ((11609464705645159 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5581852226675411 : ℚ) / 1000000000000000000)
              hi := ((-2013201992857339 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4353877619753619 : ℚ) / 2500000000000000000)
              hi := ((-2452597329176039 : ℚ) / 2500000000000000000) }
      im := { lo := ((19286825166186883 : ℚ) / 10000000000000000000)
              hi := ((26892168111801967 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-9003003083599153 : ℚ) / 10000000000000000000)
              hi := ((669151794032919 : ℚ) / 1000000000000000000) }
      im := { lo := ((-226187982362341 : ℚ) / 625000000000000000)
              hi := ((1163827310853177 : ℚ) / 1000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((1261987607125399 : ℚ) / 1000000000000000000)
              hi := ((12438839324991 : ℚ) / 2000000000000000) }
      im := { lo := ((-6763322413630311 : ℚ) / 100000000000000000)
              hi := ((-31360041018407 : ℚ) / 500000000000000) } }
  D0Rect :=
    { re := { lo := ((5023614346587401 : ℚ) / 500000000000000000)
              hi := ((580140495968521 : ℚ) / 50000000000000000) }
      im := { lo := ((-139908264770041 : ℚ) / 25000000000000000)
              hi := ((-1010287456031857 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4345669562517211 : ℚ) / 2500000000000000000)
              hi := ((-9777829465041441 : ℚ) / 10000000000000000000) }
      im := { lo := ((193063076484269 : ℚ) / 100000000000000000)
              hi := ((26911394572530487 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-9001793137323739 : ℚ) / 10000000000000000000)
              hi := ((6692796959171151 : ℚ) / 10000000000000000000) }
      im := { lo := ((-113087706651077 : ℚ) / 312500000000000000)
              hi := ((11638143951739107 : ℚ) / 10000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((12680887396774583 : ℚ) / 10000000000000000000)
              hi := ((6225466029377421 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1352295243117409 : ℚ) / 20000000000000000)
              hi := ((-1567543181493011 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((5020394916909969 : ℚ) / 500000000000000000)
              hi := ((11596135111930887 : ℚ) / 1000000000000000000) }
      im := { lo := ((-14026999938352219 : ℚ) / 2500000000000000000)
              hi := ((-2027943425450783 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3469963482719181 : ℚ) / 2000000000000000000)
              hi := ((-4872621637985969 : ℚ) / 5000000000000000000) }
      im := { lo := ((19325745084529083 : ℚ) / 10000000000000000000)
              hi := ((26930573564033183 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-9000581233238039 : ℚ) / 10000000000000000000)
              hi := ((418379567466727 : ℚ) / 625000000000000000) }
      im := { lo := ((-1809302659791869 : ℚ) / 5000000000000000000)
              hi := ((5819007242627481 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((1274211662438979 : ℚ) / 1000000000000000000)
              hi := ((6231535395840347 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3379815536174391 : ℚ) / 50000000000000000)
              hi := ((-6268338208123883 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1003433090948883 : ℚ) / 100000000000000000)
              hi := ((11589440971678251 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1125052348761809 : ℚ) / 200000000000000000)
              hi := ((-2035306820944989 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-108230832977139 : ℚ) / 62500000000000000)
              hi := ((-2428156396638473 : ℚ) / 2500000000000000000) }
      im := { lo := ((19345132560245359 : ℚ) / 10000000000000000000)
              hi := ((1347485495611819 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1124921267731541 : ℚ) / 1250000000000000000)
              hi := ((6695349069680057 : ℚ) / 10000000000000000000) }
      im := { lo := ((-18091994849482433 : ℚ) / 50000000000000000000)
              hi := ((727367490397191 : ℚ) / 625000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((12803567778399603 : ℚ) / 10000000000000000000)
              hi := ((7797034123308373 : ℚ) / 1250000000000000000) }
      im := { lo := ((-6757786968659903 : ℚ) / 100000000000000000)
              hi := ((-39165654166667 : ℚ) / 625000000000000) } }
  D0Rect :=
    { re := { lo := ((5013926105341731 : ℚ) / 500000000000000000)
              hi := ((11582727228826499 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2819857899781123 : ℚ) / 500000000000000000)
              hi := ((-2042665127890677 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8642012535577243 : ℚ) / 5000000000000000000)
              hi := ((-4839988634188147 : ℚ) / 5000000000000000000) }
      im := { lo := ((9682235486841457 : ℚ) / 5000000000000000000)
              hi := ((26968802664463463 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4499079283270239 : ℚ) / 5000000000000000000)
              hi := ((418538977298627 : ℚ) / 625000000000000000) }
      im := { lo := ((-361818803215633 : ℚ) / 1000000000000000000)
              hi := ((1163774050339821 : ℚ) / 1000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((1608155988463541 : ℚ) / 1250000000000000000)
              hi := ((3121870518703551 : ℚ) / 500000000000000000) }
      im := { lo := ((-1688985961275841 : ℚ) / 25000000000000000)
              hi := ((-626467216932881 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((10021353898789331 : ℚ) / 1000000000000000000)
              hi := ((11575993746156891 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5654161034723973 : ℚ) / 1000000000000000000)
              hi := ((-8200075483367807 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-43127724087553 : ℚ) / 25000000000000000)
              hi := ((-9647301623325667 : ℚ) / 10000000000000000000) }
      im := { lo := ((1938376304466733 : ℚ) / 1000000000000000000)
              hi := ((26987849012990923 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8996944481164681 : ℚ) / 10000000000000000000)
              hi := ((3348947377019377 : ℚ) / 5000000000000000000) }
      im := { lo := ((-18089876193864247 : ℚ) / 50000000000000000000)
              hi := ((145469989894101 : ℚ) / 125000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((2585432058218799 : ℚ) / 2000000000000000000)
              hi := ((3124938136993881 : ℚ) / 500000000000000000) }
      im := { lo := ((-6754101733281397 : ℚ) / 100000000000000000)
              hi := ((-1565710170624481 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((1001483599784711 : ℚ) / 100000000000000000)
              hi := ((90384691495649 : ℚ) / 7812500000000000) }
      im := { lo := ((-5668596875332671 : ℚ) / 1000000000000000000)
              hi := ((-2057368308649497 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8609062756145101 : ℚ) / 5000000000000000000)
              hi := ((-961460021951407 : ℚ) / 1000000000000000000) }
      im := { lo := ((9701504983520967 : ℚ) / 5000000000000000000)
              hi := ((13503423832199367 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1799145046495273 : ℚ) / 2000000000000000000)
              hi := ((3349579884800873 : ℚ) / 5000000000000000000) }
      im := { lo := ((-1808883337212891 : ℚ) / 5000000000000000000)
              hi := ((2327492398464907 : ℚ) / 2000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((3247326939434281 : ℚ) / 2500000000000000000)
              hi := ((2502413079513989 : ℚ) / 400000000000000000) }
      im := { lo := ((-168806513442923 : ℚ) / 2500000000000000)
              hi := ((-3130505156964157 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((1000829861979971 : ℚ) / 100000000000000000)
              hi := ((5781233728776811 : ℚ) / 500000000000000000) }
      im := { lo := ((-5683023813021871 : ℚ) / 1000000000000000000)
              hi := ((-1032356584925039 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8592566992610801 : ℚ) / 5000000000000000000)
              hi := ((-9581871940593533 : ℚ) / 10000000000000000000) }
      im := { lo := ((19422210826823337 : ℚ) / 10000000000000000000)
              hi := ((1351289974265871 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8994500992819363 : ℚ) / 10000000000000000000)
              hi := ((3350209427864519 : ℚ) / 5000000000000000000) }
      im := { lo := ((-9043882083198229 : ℚ) / 25000000000000000000)
              hi := ((2909329851369097 : ℚ) / 2500000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((3262922912483497 : ℚ) / 2500000000000000000)
              hi := ((31311050789672823 : ℚ) / 5000000000000000000) }
      im := { lo := ((-843802534754147 : ℚ) / 12500000000000000)
              hi := ((-6259181044773761 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((10001742092466619 : ℚ) / 1000000000000000000)
              hi := ((11555674271943603 : ℚ) / 1000000000000000000) }
      im := { lo := ((-11394883124202523 : ℚ) / 2000000000000000000)
              hi := ((-414410713488693 : ℚ) / 100000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8576056862360209 : ℚ) / 5000000000000000000)
              hi := ((-298409944965969 : ℚ) / 312500000000000000) }
      im := { lo := ((243017087474017 : ℚ) / 125000000000000000)
              hi := ((169029393751587 : ℚ) / 62500000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8993272164085899 : ℚ) / 10000000000000000000)
              hi := ((6701672416005451 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3617337101357419 : ℚ) / 10000000000000000000)
              hi := ((5818587407735861 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((13114309180677609 : ℚ) / 10000000000000000000)
              hi := ((6268408936678093 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1349716207950477 : ℚ) / 20000000000000000)
              hi := ((-3128676399090821 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((1999033300883979 : ℚ) / 200000000000000000)
              hi := ((288721522307809 : ℚ) / 25000000000000000) }
      im := { lo := ((-713981263640883 : ℚ) / 125000000000000000)
              hi := ((-64980921610301 : ℚ) / 15625000000000000) } }
  DrestRect :=
    { re := { lo := ((-8559532314336083 : ℚ) / 5000000000000000000)
              hi := ((-9516339325024957 : ℚ) / 10000000000000000000) }
      im := { lo := ((15568382927289 : ℚ) / 8000000000000000)
              hi := ((1353177899605453 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4496019640123911 : ℚ) / 5000000000000000000)
              hi := ((1675730245808923 : ℚ) / 2500000000000000000) }
      im := { lo := ((-36171248140818473 : ℚ) / 100000000000000000000)
              hi := ((5818516780990257 : ℚ) / 5000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

def s084_t1_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((50055307 : ℚ) / 800000000)
      ((-49208351 : ℚ) / 200000000000)
      ((467853481 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((52708647949461 : ℚ) / 40000000000000000)
              hi := ((12549258057085141 : ℚ) / 2000000000000000000) }
      im := { lo := ((-843342838936891 : ℚ) / 12500000000000000)
              hi := ((-1251105131041047 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((1248571487969793 : ℚ) / 125000000000000000)
              hi := ((11542027304584307 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2863124660520511 : ℚ) / 500000000000000000)
              hi := ((-4173441950138147 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-17085986444161673 : ℚ) / 10000000000000000000)
              hi := ((-9483535619257249 : ℚ) / 10000000000000000000) }
      im := { lo := ((9739773034081429 : ℚ) / 5000000000000000000)
              hi := ((27082364112737257 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8990803468418401 : ℚ) / 10000000000000000000)
              hi := ((83802070953919 : ℚ) / 125000000000000000) }
      im := { lo := ((-1808454465273661 : ℚ) / 5000000000000000000)
              hi := ((2327377716462767 : ℚ) / 2000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
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
    (hi : i ∈ positiveBoxSubboxesOf .s084_t1) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s084_t1).constants.mainLower)
      ((positiveBoxCombinedCert .s084_t1).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s084_t1).constants.restUpper) := by
  if h0 : i = .s084_t1_sb000 then
    exact s084_t1_sb000_certificateData
  else if h1 : i = .s084_t1_sb001 then
    exact s084_t1_sb001_certificateData
  else if h2 : i = .s084_t1_sb002 then
    exact s084_t1_sb002_certificateData
  else if h3 : i = .s084_t1_sb003 then
    exact s084_t1_sb003_certificateData
  else if h4 : i = .s084_t1_sb004 then
    exact s084_t1_sb004_certificateData
  else if h5 : i = .s084_t1_sb005 then
    exact s084_t1_sb005_certificateData
  else if h6 : i = .s084_t1_sb006 then
    exact s084_t1_sb006_certificateData
  else if h7 : i = .s084_t1_sb007 then
    exact s084_t1_sb007_certificateData
  else if h8 : i = .s084_t1_sb008 then
    exact s084_t1_sb008_certificateData
  else if h9 : i = .s084_t1_sb009 then
    exact s084_t1_sb009_certificateData
  else if h10 : i = .s084_t1_sb010 then
    exact s084_t1_sb010_certificateData
  else if h11 : i = .s084_t1_sb011 then
    exact s084_t1_sb011_certificateData
  else if h12 : i = .s084_t1_sb012 then
    exact s084_t1_sb012_certificateData
  else if h13 : i = .s084_t1_sb013 then
    exact s084_t1_sb013_certificateData
  else if h14 : i = .s084_t1_sb014 then
    exact s084_t1_sb014_certificateData
  else if h15 : i = .s084_t1_sb015 then
    exact s084_t1_sb015_certificateData
  else if h16 : i = .s084_t1_sb016 then
    exact s084_t1_sb016_certificateData
  else if h17 : i = .s084_t1_sb017 then
    exact s084_t1_sb017_certificateData
  else if h18 : i = .s084_t1_sb018 then
    exact s084_t1_sb018_certificateData
  else if h19 : i = .s084_t1_sb019 then
    exact s084_t1_sb019_certificateData
  else if h20 : i = .s084_t1_sb020 then
    exact s084_t1_sb020_certificateData
  else if h21 : i = .s084_t1_sb021 then
    exact s084_t1_sb021_certificateData
  else if h22 : i = .s084_t1_sb022 then
    exact s084_t1_sb022_certificateData
  else if h23 : i = .s084_t1_sb023 then
    exact s084_t1_sb023_certificateData
  else if h24 : i = .s084_t1_sb024 then
    exact s084_t1_sb024_certificateData
  else if h25 : i = .s084_t1_sb025 then
    exact s084_t1_sb025_certificateData
  else if h26 : i = .s084_t1_sb026 then
    exact s084_t1_sb026_certificateData
  else if h27 : i = .s084_t1_sb027 then
    exact s084_t1_sb027_certificateData
  else if h28 : i = .s084_t1_sb028 then
    exact s084_t1_sb028_certificateData
  else if h29 : i = .s084_t1_sb029 then
    exact s084_t1_sb029_certificateData
  else if h30 : i = .s084_t1_sb030 then
    exact s084_t1_sb030_certificateData
  else if h31 : i = .s084_t1_sb031 then
    exact s084_t1_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S084T1
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
