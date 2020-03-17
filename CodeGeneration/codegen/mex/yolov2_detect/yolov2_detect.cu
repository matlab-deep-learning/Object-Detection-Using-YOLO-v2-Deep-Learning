/*
 * yolov2_detect.cu
 *
 * Code generation for function 'yolov2_detect'
 *
 */

/* Include files */
#include "MWCudaDimUtility.h"
#include "MWLaunchParametersUtilities.h"
#include "rt_nonfinite.h"
#include "yolov2_detect.h"
#include "DeepLearningNetwork.h"
#include "activations.h"
#include "sort1.h"
#include "yolov2_detect_data.h"

/* Type Definitions */
typedef struct {
  char_T f1[7];
} cell_wrap_0;

typedef struct {
  b_Yolov2UsingResNet50_ONNX_0 *net;
} coder_YOLOv2Network;

/* Variable Definitions */
static b_Yolov2UsingResNet50_ONNX_0 gobj_0;
static coder_YOLOv2Network yolov2Obj;
static boolean_T yolov2Obj_not_empty;

/* Function Declarations */
static __inline__ __device__ real_T atomicOpreal_T(real_T *address, real_T value);
static int32_T div_s32_floor(int32_T numerator, int32_T denominator);
static __device__ real_T rt_roundd_snf(real_T u);
static __inline__ __device__ int32_T shflDown38(int32_T in1, uint32_T offset);
static __inline__ __device__ real_T shflDown98(real_T in1, uint32_T offset);
static __device__ int32_T threadGroupReduction38(int32_T val);
static __device__ real_T threadGroupReduction98(real_T val);
static __device__ int32_T workGroupReduction38(int32_T val, int32_T init);
static __device__ real_T workGroupReduction98(real_T val, real_T init);
static __global__ void yolov2_detect_kernel1(int32_T *nx, uint8_T tmp11, const
  uint8_T in[150528], real32_T b_in[150528]);
static __global__ void yolov2_detect_kernel10(real_T bboxesX1Y1X2Y2_data[3136],
  int32_T bboxesX1Y1X2Y2_size[2], int32_T i0, real_T y1_data[784]);
static __global__ void yolov2_detect_kernel100(boolean_T x[7], real_T
  *numMissingGlyph);
static __global__ void yolov2_detect_kernel101(const uint8_T uv2[10664], int32_T
  i1, int32_T nrowx, uint8_T tmp_data[10664]);
static __global__ void yolov2_detect_kernel102(int8_T num_idx_1, int8_T
  num_idx_0, int8_T num[2]);
static __global__ void yolov2_detect_kernel103(uint8_T tmp_data[10664], int32_T
  tmp_size[2], int8_T num[2], uint8_T b_tmp_data[144]);
static __global__ void yolov2_detect_kernel104(uint8_T tmp_data[144], int8_T
  num[2], uint8_T thisGlyphBitmap_data[144]);
static __global__ void yolov2_detect_kernel11(real_T bboxesX1Y1X2Y2_data[3136],
  int32_T bboxesX1Y1X2Y2_size[2], int32_T i0, real_T x2_data[784]);
static __global__ void yolov2_detect_kernel12(real_T bboxesX1Y1X2Y2_data[3136],
  int32_T bboxesX1Y1X2Y2_size[2], int32_T i0, real_T y2_data[784]);
static __global__ void yolov2_detect_kernel13(int32_T *nx, real_T x1_data[784]);
static __global__ void yolov2_detect_kernel14(int32_T *nx, real_T y1_data[784]);
static __global__ void yolov2_detect_kernel15(int32_T *nx, real_T x2_data[784]);
static __global__ void yolov2_detect_kernel16(int32_T *nx, real_T y2_data[784]);
static __global__ void yolov2_detect_kernel17(int32_T x1_size[1], int32_T
  bboxesX1Y1X2Y2_size[2]);
static __global__ void yolov2_detect_kernel18(real_T x1_data[784], int32_T *nx,
  real_T bboxesX1Y1X2Y2_data[3136]);
static __global__ void yolov2_detect_kernel19(real_T y1_data[784], int32_T
  bboxesX1Y1X2Y2_size[2], int32_T *nx, real_T bboxesX1Y1X2Y2_data[3136]);
static __global__ void yolov2_detect_kernel2(const int8_T iv1[8], real_T
  anchors[8]);
static __global__ void yolov2_detect_kernel20(real_T x2_data[784], int32_T
  bboxesX1Y1X2Y2_size[2], int32_T *nx, real_T bboxesX1Y1X2Y2_data[3136]);
static __global__ void yolov2_detect_kernel21(real_T y2_data[784], int32_T
  bboxesX1Y1X2Y2_size[2], int32_T *nx, real_T bboxesX1Y1X2Y2_data[3136]);
static __global__ void yolov2_detect_kernel22(int32_T bboxesX1Y1X2Y2_size[2],
  int32_T bboxPred_size[2]);
static __global__ void yolov2_detect_kernel23(real_T bboxesX1Y1X2Y2_data[3136],
  int32_T *nx, real_T bboxPred_data[3136]);
static __global__ void yolov2_detect_kernel24(real_T bboxesX1Y1X2Y2_data[3136],
  int32_T bboxesX1Y1X2Y2_size[2], int32_T bboxPred_size[2], int32_T *nx, real_T
  bboxPred_data[3136]);
static __global__ void yolov2_detect_kernel25(real_T bboxesX1Y1X2Y2_data[3136],
  int32_T bboxesX1Y1X2Y2_size[2], int32_T bboxPred_size[2], int32_T *nx, real_T
  bboxPred_data[3136]);
static __global__ void yolov2_detect_kernel26(real_T bboxesX1Y1X2Y2_data[3136],
  int32_T bboxesX1Y1X2Y2_size[2], int32_T bboxPred_size[2], int32_T *nx, real_T
  bboxPred_data[3136]);
static __global__ void yolov2_detect_kernel27(int32_T *nx, real_T bboxPred_data
  [3136]);
static __global__ void yolov2_detect_kernel28(real_T bboxPred_data[3136],
  int32_T bboxPred_size[2], int32_T i0, real_T y2_data[784]);
static __global__ void yolov2_detect_kernel29(real_T y2_data[784], int32_T
  bboxPred_size[2], int32_T b_bboxPred_size[1], real_T bboxPred_data[3136]);
static __global__ void yolov2_detect_kernel3(real_T anchors[8], real32_T
  tmpFeatureMap[4704], int32_T *ibcol, real32_T boxOut[4704]);
static __global__ void yolov2_detect_kernel30(real_T bboxPred_data[3136],
  int32_T bboxPred_size[2], int32_T i0, real_T y2_data[784]);
static __global__ void yolov2_detect_kernel31(real_T y2_data[784], int32_T
  bboxPred_size[2], int32_T b_bboxPred_size[1], real_T bboxPred_data[3136]);
static __global__ void yolov2_detect_kernel32(real_T bboxPred_data[3136],
  int32_T bboxPred_size[2], int32_T i, int32_T b_bboxPred_size[2], int32_T nrowx,
  real_T bboxesX1Y1X2Y2_data[3136]);
static __global__ void yolov2_detect_kernel33(real32_T
  thresholdedPrediction_data[4704], int32_T thresholdedPrediction_size[2],
  int32_T i, int32_T count, real32_T classPred_data[784], real32_T
  scorePred_data[784]);
static __global__ void yolov2_detect_kernel34(int32_T bboxPred_size[2], int32_T
  count, int32_T idx_size[2], int16_T *i3, int16_T *i2);
static __global__ void yolov2_detect_kernel35(int16_T *i2, int16_T *i3, int16_T
  idx_data[784]);
static __global__ void yolov2_detect_kernel36(int32_T bboxPred_size[2],
  boolean_T b_data[784]);
static __global__ void yolov2_detect_kernel37(int16_T idx_data[784], int32_T i0,
  boolean_T b_data[784]);
static __global__ void yolov2_detect_kernel38(boolean_T b_data[784], int32_T i0,
  int32_T *nx);
static __global__ void yolov2_detect_kernel39(real_T bboxesX1Y1X2Y2_data[3136],
  int32_T bboxPred_size[2], int32_T b_bboxPred_size[2], int32_T i0, real_T
  bboxPred_data[3136]);
static __global__ void yolov2_detect_kernel4(real32_T boxOut[4704], boolean_T
  bv0[784]);
static __global__ void yolov2_detect_kernel40(int32_T bboxPred_size[2], int32_T
  b_bboxPred_size[2]);
static __global__ void yolov2_detect_kernel41(real_T bboxPred_data[3136],
  int32_T bboxPred_size[2], real_T bboxesX1Y1X2Y2_data[3136]);
static __global__ void yolov2_detect_kernel42(int32_T scorePred_size[1], int32_T
  count, int32_T idx_size[2], int16_T *i3, int16_T *i2);
static __global__ void yolov2_detect_kernel43(int16_T *i2, int16_T *i3, int16_T
  idx_data[784]);
static __global__ void yolov2_detect_kernel44(int32_T scorePred_size[1],
  boolean_T b_data[784]);
static __global__ void yolov2_detect_kernel45(int16_T idx_data[784], int32_T i0,
  boolean_T b_data[784]);
static __global__ void yolov2_detect_kernel46(boolean_T b_data[784], int32_T i0,
  int32_T *nx);
static __global__ void yolov2_detect_kernel47(int32_T classPred_size[1], int32_T
  count, int32_T idx_size[2], int16_T *i3, int16_T *i2);
static __global__ void yolov2_detect_kernel48(int16_T *i2, int16_T *i3, int16_T
  idx_data[784]);
static __global__ void yolov2_detect_kernel49(int32_T classPred_size[1],
  boolean_T b_data[784]);
static __global__ void yolov2_detect_kernel5(int32_T *nx, int32_T
  thresholdedPrediction_size[2]);
static __global__ void yolov2_detect_kernel50(int16_T idx_data[784], int32_T i0,
  boolean_T b_data[784]);
static __global__ void yolov2_detect_kernel51(boolean_T b_data[784], int32_T i0,
  int32_T *nx);
static __global__ void yolov2_detect_kernel52(real32_T scorePred_data[784],
  int32_T scorePred_size[1], real32_T x_data[784]);
static __global__ void yolov2_detect_kernel53(int32_T iidx_size[1], int32_T
  inputBbox_size[2]);
static __global__ void yolov2_detect_kernel54(real_T bboxesX1Y1X2Y2_data[3136],
  int32_T bboxPred_size[2], int32_T iidx_data[784], int32_T inputBbox_size[2],
  int32_T iidx_size[1], real_T inputBbox_data[3136]);
static __global__ void yolov2_detect_kernel55(real32_T classPred_data[784],
  int32_T iidx_data[784], int32_T iidx_size[1], real_T inputLabel_data[784]);
static __global__ void yolov2_detect_kernel56(int32_T iidx_size[1], boolean_T
  isKept_data[784]);
static __global__ void yolov2_detect_kernel57(real_T inputBbox_data[3136],
  int32_T inputBbox_size[2], int32_T i0, real_T area_data[784]);
static __global__ void yolov2_detect_kernel58(int32_T inputBbox_size[2], real_T
  inputBbox_data[3136], int32_T i0, real_T x2_data[784]);
static __global__ void yolov2_detect_kernel59(real_T inputBbox_data[3136],
  int32_T inputBbox_size[2], int32_T i0, real_T y2_data[784]);
static __global__ void yolov2_detect_kernel6(real32_T boxOut[4704], int16_T
  ii_data[784], int32_T thresholdedPrediction_size[2], int32_T tmp_size[1],
  real32_T thresholdedPrediction_data[4704]);
static __global__ void yolov2_detect_kernel60(int32_T iidx_data[784], int16_T
  ii_data[784], int32_T ii_size[1], real_T index_data[784]);
static __global__ void yolov2_detect_kernel61(int32_T bboxes_size[2], real_T
  index_data[784], int32_T index_size[1]);
static __global__ void yolov2_detect_kernel62(real_T bboxesX1Y1X2Y2_data[3136],
  int32_T bboxPred_size[2], real_T index_data[784], int32_T bboxes_size[2],
  int32_T index_size[1], real_T bboxes_data[3136]);
static __global__ void yolov2_detect_kernel63(const char_T cv0[7], int32_T i0,
  cell_wrap_0 labels_data[784]);
static __global__ void yolov2_detect_kernel64(int32_T bboxes_size[2], int32_T
  positionOut_size[2]);
static __global__ void yolov2_detect_kernel65(real_T bboxes_data[3136], int32_T
  bboxes_size[2], int32_T positionOut_data[3136]);
static __global__ void yolov2_detect_kernel66(const uint8_T uv0[3], int32_T *nx,
  uint8_T colorRGB_data[2352]);
static __global__ void yolov2_detect_kernel67(int32_T positionOut_size[2],
  int32_T colorRGB_size[2]);
static __global__ void yolov2_detect_kernel68(int32_T *nx, int8_T colorRGB_data
  [2352]);
static __global__ void yolov2_detect_kernel69(const uint8_T in[150528], uint8_T
  outImg[150528]);
static __global__ void yolov2_detect_kernel7(int32_T tmp_size[1], int32_T
  bboxesX1Y1X2Y2_size[2]);
static __global__ void yolov2_detect_kernel70(uint8_T colorRGB_data[2352],
  int32_T colorRGB_size[2], uint8_T color_data[2352]);
static __global__ void yolov2_detect_kernel71(int32_T positionOut_size[2],
  int32_T color_size[2]);
static __global__ void yolov2_detect_kernel72(uint8_T colorRGB_data[2352],
  int32_T *nx, uint8_T color_data[2352]);
static __global__ void yolov2_detect_kernel73(int32_T endR_im, int32_T penY,
  int32_T ii, int32_T firstRow, int32_T line[4]);
static __global__ void yolov2_detect_kernel74(int32_T line[4], int32_T b_line[4]);
static __global__ void yolov2_detect_kernel75(int32_T yy, int32_T ii, int32_T
  penY, int32_T firstRow, int32_T line[4]);
static __global__ void yolov2_detect_kernel76(int32_T line[4], int32_T b_line[4]);
static __global__ void yolov2_detect_kernel77(int32_T endR_im, int32_T penY,
  int32_T ii, int32_T yy, int32_T line[4]);
static __global__ void yolov2_detect_kernel78(int32_T line[4], int32_T b_line[4]);
static __global__ void yolov2_detect_kernel79(int32_T yy, int32_T ii, int32_T
  endR_im, int32_T firstRow, int32_T line[4]);
static __global__ void yolov2_detect_kernel8(real32_T
  thresholdedPrediction_data[4704], int32_T thresholdedPrediction_size[2],
  int32_T bboxesX1Y1X2Y2_size[2], int32_T i0, real_T bboxesX1Y1X2Y2_data[3136]);
static __global__ void yolov2_detect_kernel80(int32_T line[4], int32_T b_line[4]);
static __global__ void yolov2_detect_kernel81(int32_T positionOut_size[2],
  int32_T textLocAndWidth_size[2]);
static __global__ void yolov2_detect_kernel82(int32_T positionOut_data[3136],
  int32_T positionOut_size[2], int32_T textLocAndWidth_size[2], int32_T i0,
  int32_T textLocAndWidth_data[3136]);
static __global__ void yolov2_detect_kernel83(int32_T textLocAndWidth_size[2],
  int32_T positionOut_data[3136], int32_T positionOut_size[2], int32_T i0,
  int32_T textLocAndWidth_data[3136]);
static __global__ void yolov2_detect_kernel84(int32_T textLocAndWidth_size[2],
  int32_T textPosition_size[2]);
static __global__ void yolov2_detect_kernel85(int32_T textLocAndWidth_data[3136],
  int32_T textLocAndWidth_size[2], int32_T textPosition_size[2], int32_T i0,
  int32_T textPosition_data[1568]);
static __global__ void yolov2_detect_kernel86(uint8_T colorRGB_data[2352],
  uint8_T a_data[3]);
static __global__ void yolov2_detect_kernel87(int32_T textLocAndWidth_size[2],
  int32_T colorRGB_size[2]);
static __global__ void yolov2_detect_kernel88(uint8_T a_data[3], int32_T *nx,
  uint8_T colorRGB_data[2352]);
static __global__ void yolov2_detect_kernel89(int32_T textLocAndWidth_data[3136],
  int32_T textLocAndWidth_size[2], int32_T i0, int32_T iidx_data[784]);
static __global__ void yolov2_detect_kernel9(real_T bboxesX1Y1X2Y2_data[3136],
  int32_T i0, real_T x1_data[784]);
static __global__ void yolov2_detect_kernel90(int32_T iidx_data[784], int32_T
  thresholdedPrediction_size[2], int32_T shapeWidth_data[614656]);
static __global__ void yolov2_detect_kernel91(int32_T textLocAndWidth_data[3136],
  int32_T shapeWidth_data[614656]);
static __global__ void yolov2_detect_kernel92(int32_T textLocAndWidth_data[3136],
  int32_T textLocAndWidth_size[2], int32_T i0, int32_T iidx_data[784]);
static __global__ void yolov2_detect_kernel93(int32_T iidx_data[784], int32_T
  thresholdedPrediction_size[2], int32_T shapeHeight_data[614656]);
static __global__ void yolov2_detect_kernel94(int32_T textLocAndWidth_data[3136],
  int32_T shapeHeight_data[614656]);
static __global__ void yolov2_detect_kernel95(int32_T *textIdx);
static __global__ void yolov2_detect_kernel96(cell_wrap_0 labels_data[784],
  int32_T *textIdx, int8_T thisTextU16[7]);
static __global__ void yolov2_detect_kernel97(int8_T thisTextU16[7], int8_T
  thisCharcodes_1b[7]);
static __global__ void yolov2_detect_kernel98(int8_T thisCharcodes_1b[7], const
  uint16_T uv1[256], const int8_T iv2[261], real_T *height);
static __global__ void yolov2_detect_kernel99(const uint16_T uv1[256], int8_T
  thisCharcodes_1b[7], boolean_T x[7]);

/* Function Definitions */
static __inline__ __device__ real_T atomicOpreal_T(real_T *address, real_T value)
{
  unsigned long long int *address_as_up;
  unsigned long long int old;
  unsigned long long int assumed;
  address_as_up = (unsigned long long int *)address;
  old = *address_as_up;
  do {
    assumed = old;
    old = atomicCAS(address_as_up, old, __double_as_longlong(value +
      __longlong_as_double(old)));
  } while (assumed != old);

  return __longlong_as_double(old);
}

static int32_T div_s32_floor(int32_T numerator, int32_T denominator)
{
  int32_T quotient;
  uint32_T absNumerator;
  uint32_T absDenominator;
  boolean_T quotientNeedsNegation;
  uint32_T tempAbsQuotient;
  if (denominator == 0) {
    emlrtDivisionByZeroErrorR2012b(NULL, emlrtRootTLSGlobal);
  } else {
    if (numerator < 0) {
      absNumerator = ~static_cast<uint32_T>(numerator) + 1U;
    } else {
      absNumerator = static_cast<uint32_T>(numerator);
    }

    if (denominator < 0) {
      absDenominator = ~static_cast<uint32_T>(denominator) + 1U;
    } else {
      absDenominator = static_cast<uint32_T>(denominator);
    }

    quotientNeedsNegation = ((numerator < 0) != (denominator < 0));
    tempAbsQuotient = absNumerator / absDenominator;
    if (quotientNeedsNegation) {
      absNumerator %= absDenominator;
      if (absNumerator > 0U) {
        tempAbsQuotient++;
      }

      quotient = -static_cast<int32_T>(tempAbsQuotient);
    } else {
      quotient = static_cast<int32_T>(tempAbsQuotient);
    }
  }

  return quotient;
}

static __device__ real_T rt_roundd_snf(real_T u)
{
  real_T y;
  if (fabs(u) < 4.503599627370496E+15) {
    if (u >= 0.5) {
      y = floor(u + 0.5);
    } else if (u > -0.5) {
      y = u * 0.0;
    } else {
      y = ceil(u - 0.5);
    }
  } else {
    y = u;
  }

  return y;
}

static __inline__ __device__ int32_T shflDown38(int32_T in1, uint32_T offset)
{
  in1 = __shfl_down(in1, offset);
  return in1;
}

static __inline__ __device__ real_T shflDown98(real_T in1, uint32_T offset)
{
  int2 tmp;
  tmp = *(int2 *)&in1;
  tmp.x = __shfl_down(tmp.x, offset);
  tmp.y = __shfl_down(tmp.y, offset);
  return *(real_T *)&tmp;
}

static __device__ int32_T threadGroupReduction38(int32_T val)
{
  uint32_T offset;
  offset = warpSize / 2U;
  while (offset > 0U) {
    val += shflDown38(val, offset);
    offset /= 2U;
  }

  return val;
}

static __device__ real_T threadGroupReduction98(real_T val)
{
  uint32_T offset;
  offset = warpSize / 2U;
  while (offset > 0U) {
    val += shflDown98(val, offset);
    offset /= 2U;
  }

  return val;
}

static __device__ int32_T workGroupReduction38(int32_T val, int32_T init)
{
  __shared__ int32_T shared[32];
  uint32_T lane;
  uint32_T widx;
  uint32_T blockStride;
  uint32_T thBlkId;
  thBlkId = static_cast<uint32_T>(mwGetThreadIndexWithinBlock());
  blockStride = static_cast<uint32_T>(mwGetThreadsPerBlock());
  lane = thBlkId % warpSize;
  widx = thBlkId / warpSize;
  val = threadGroupReduction38(val);
  if (lane == 0U) {
    shared[widx] = val;
  }

  __syncthreads();
  if (thBlkId < blockStride / warpSize) {
    val = shared[lane];
  } else {
    val = init;
  }

  if (widx == 0U) {
    val = threadGroupReduction38(val);
  }

  return val;
}

static __device__ real_T workGroupReduction98(real_T val, real_T init)
{
  __shared__ real_T shared[32];
  uint32_T lane;
  uint32_T widx;
  uint32_T blockStride;
  uint32_T thBlkId;
  thBlkId = static_cast<uint32_T>(mwGetThreadIndexWithinBlock());
  blockStride = static_cast<uint32_T>(mwGetThreadsPerBlock());
  lane = thBlkId % warpSize;
  widx = thBlkId / warpSize;
  val = threadGroupReduction98(val);
  if (lane == 0U) {
    shared[widx] = val;
  }

  __syncthreads();
  if (thBlkId < blockStride / warpSize) {
    val = shared[lane];
  } else {
    val = init;
  }

  if (widx == 0U) {
    val = threadGroupReduction98(val);
  }

  return val;
}

static __global__ __launch_bounds__(512, 1) void yolov2_detect_kernel1(int32_T
  *nx, uint8_T tmp11, const uint8_T in[150528], real32_T b_in[150528])
{
  uint32_T threadId;
  int32_T ibmat;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  ibmat = static_cast<int32_T>(threadId);
  if (ibmat < 150528) {
    b_in[ibmat] = static_cast<real32_T>((static_cast<int32_T>(in[ibmat]) -
      static_cast<int32_T>(tmp11))) / static_cast<real32_T>(*nx);
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel10(real_T
  bboxesX1Y1X2Y2_data[3136], int32_T bboxesX1Y1X2Y2_size[2], int32_T i0, real_T
  y1_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(i0);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    y1_data[ibmat] = bboxesX1Y1X2Y2_data[ibmat + bboxesX1Y1X2Y2_size[0]];
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel100
  (boolean_T x[7], real_T *numMissingGlyph)
{
  uint32_T idx;
  real_T tmpRed;
  uint32_T threadStride;
  uint32_T threadId;
  uint32_T thBlkId;
  tmpRed = 0.0;
  thBlkId = static_cast<uint32_T>(mwGetThreadIndexWithinBlock());
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  for (idx = threadId; idx <= 5U; idx += threadStride) {
    tmpRed += static_cast<real_T>(x[static_cast<int32_T>(idx) + 1]);
  }

  tmpRed = workGroupReduction98(tmpRed, 0.0);
  if (thBlkId == 0U) {
    atomicOpreal_T(numMissingGlyph, tmpRed);
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel101(const
  uint8_T uv2[10664], int32_T i1, int32_T nrowx, uint8_T tmp_data[10664])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((nrowx - i1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    tmp_data[ibmat] = uv2[i1 + ibmat];
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel102(int8_T
  num_idx_1, int8_T num_idx_0, int8_T num[2])
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    num[0] = num_idx_0;
    num[1] = num_idx_1;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel103
  (uint8_T tmp_data[10664], int32_T tmp_size[2], int8_T num[2], uint8_T
   b_tmp_data[144])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibcol;
  int32_T ibmat;
  int64_T loopEnd;
  uint32_T tmpIndex;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = (1LL + static_cast<int64_T>((static_cast<int32_T>(num[1]) - 1))) *
    (1LL + static_cast<int64_T>((static_cast<int32_T>(num[0]) - 1))) - 1LL;
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibcol = static_cast<int32_T>((idx % static_cast<uint32_T>(static_cast<
      int32_T>(num[1]))));
    tmpIndex = (idx - static_cast<uint32_T>(ibcol)) / static_cast<uint32_T>
      (static_cast<int32_T>(num[1]));
    ibmat = static_cast<int32_T>(tmpIndex);
    b_tmp_data[ibcol + tmp_size[0] * ibmat] = tmp_data[ibmat + static_cast<
      int32_T>(num[0]) * ibcol];
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel104
  (uint8_T tmp_data[144], int8_T num[2], uint8_T thisGlyphBitmap_data[144])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((static_cast<int32_T>(num[0]) * static_cast<
    int32_T>(num[1]) - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    thisGlyphBitmap_data[ibmat] = tmp_data[ibmat];
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel11(real_T
  bboxesX1Y1X2Y2_data[3136], int32_T bboxesX1Y1X2Y2_size[2], int32_T i0, real_T
  x2_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(i0);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    x2_data[ibmat] = bboxesX1Y1X2Y2_data[ibmat + (bboxesX1Y1X2Y2_size[0] << 1)];
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel12(real_T
  bboxesX1Y1X2Y2_data[3136], int32_T bboxesX1Y1X2Y2_size[2], int32_T i0, real_T
  y2_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(i0);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    y2_data[ibmat] = bboxesX1Y1X2Y2_data[ibmat + bboxesX1Y1X2Y2_size[0] * 3];
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel13(int32_T
  *nx, real_T x1_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibcol;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(*nx);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibcol = static_cast<int32_T>(idx);
    if (x1_data[ibcol] < 1.0) {
      x1_data[ibcol] = 1.0;
    }
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel14(int32_T
  *nx, real_T y1_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibcol;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(*nx);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibcol = static_cast<int32_T>(idx);
    if (y1_data[ibcol] < 1.0) {
      y1_data[ibcol] = 1.0;
    }
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel15(int32_T
  *nx, real_T x2_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibcol;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(*nx);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibcol = static_cast<int32_T>(idx);
    if (x2_data[ibcol] > 224.0) {
      x2_data[ibcol] = 224.0;
    }
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel16(int32_T
  *nx, real_T y2_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibcol;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(*nx);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibcol = static_cast<int32_T>(idx);
    if (y2_data[ibcol] > 224.0) {
      y2_data[ibcol] = 224.0;
    }
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel17(int32_T
  x1_size[1], int32_T bboxesX1Y1X2Y2_size[2])
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    bboxesX1Y1X2Y2_size[0] = x1_size[0];
    bboxesX1Y1X2Y2_size[1] = 4;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel18(real_T
  x1_data[784], int32_T *nx, real_T bboxesX1Y1X2Y2_data[3136])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(*nx);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    bboxesX1Y1X2Y2_data[ibmat] = x1_data[ibmat];
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel19(real_T
  y1_data[784], int32_T bboxesX1Y1X2Y2_size[2], int32_T *nx, real_T
  bboxesX1Y1X2Y2_data[3136])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(*nx);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    bboxesX1Y1X2Y2_data[ibmat + bboxesX1Y1X2Y2_size[0]] = y1_data[ibmat];
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel2(const
  int8_T iv1[8], real_T anchors[8])
{
  uint32_T threadId;
  int32_T ibmat;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  ibmat = static_cast<int32_T>(threadId);
  if (ibmat < 8) {
    anchors[ibmat] = static_cast<real_T>(iv1[ibmat]);
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel20(real_T
  x2_data[784], int32_T bboxesX1Y1X2Y2_size[2], int32_T *nx, real_T
  bboxesX1Y1X2Y2_data[3136])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(*nx);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    bboxesX1Y1X2Y2_data[ibmat + (bboxesX1Y1X2Y2_size[0] << 1)] = x2_data[ibmat];
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel21(real_T
  y2_data[784], int32_T bboxesX1Y1X2Y2_size[2], int32_T *nx, real_T
  bboxesX1Y1X2Y2_data[3136])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(*nx);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    bboxesX1Y1X2Y2_data[ibmat + bboxesX1Y1X2Y2_size[0] * 3] = y2_data[ibmat];
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel22(int32_T
  bboxesX1Y1X2Y2_size[2], int32_T bboxPred_size[2])
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    bboxPred_size[0] = bboxesX1Y1X2Y2_size[0];
    bboxPred_size[1] = 4;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel23(real_T
  bboxesX1Y1X2Y2_data[3136], int32_T *nx, real_T bboxPred_data[3136])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(*nx);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    bboxPred_data[ibmat] = (bboxesX1Y1X2Y2_data[ibmat] - 0.5) + 0.5;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel24(real_T
  bboxesX1Y1X2Y2_data[3136], int32_T bboxesX1Y1X2Y2_size[2], int32_T
  bboxPred_size[2], int32_T *nx, real_T bboxPred_data[3136])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(*nx);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    bboxPred_data[ibmat + bboxPred_size[0]] = (bboxesX1Y1X2Y2_data[ibmat +
      bboxesX1Y1X2Y2_size[0]] - 0.5) + 0.5;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel25(real_T
  bboxesX1Y1X2Y2_data[3136], int32_T bboxesX1Y1X2Y2_size[2], int32_T
  bboxPred_size[2], int32_T *nx, real_T bboxPred_data[3136])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(*nx);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    bboxPred_data[ibmat + (bboxPred_size[0] << 1)] = (bboxesX1Y1X2Y2_data[ibmat
      + (bboxesX1Y1X2Y2_size[0] << 1)] + 0.5) - 0.5;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel26(real_T
  bboxesX1Y1X2Y2_data[3136], int32_T bboxesX1Y1X2Y2_size[2], int32_T
  bboxPred_size[2], int32_T *nx, real_T bboxPred_data[3136])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(*nx);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    bboxPred_data[ibmat + bboxPred_size[0] * 3] = (bboxesX1Y1X2Y2_data[ibmat +
      bboxesX1Y1X2Y2_size[0] * 3] + 0.5) - 0.5;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel27(int32_T
  *nx, real_T bboxPred_data[3136])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T k;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((*nx - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    k = static_cast<int32_T>(idx);
    bboxPred_data[k] = floor(bboxPred_data[k]);
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel28(real_T
  bboxPred_data[3136], int32_T bboxPred_size[2], int32_T i0, real_T y2_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(i0);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    y2_data[ibmat] = (bboxPred_data[ibmat + (bboxPred_size[0] << 1)] -
                      bboxPred_data[ibmat]) + 1.0;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel29(real_T
  y2_data[784], int32_T bboxPred_size[2], int32_T b_bboxPred_size[1], real_T
  bboxPred_data[3136])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((b_bboxPred_size[0] - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    bboxPred_data[ibmat + (bboxPred_size[0] << 1)] = y2_data[ibmat];
  }
}

static __global__ __launch_bounds__(224, 1) void yolov2_detect_kernel3(real_T
  anchors[8], real32_T tmpFeatureMap[4704], int32_T *ibcol, real32_T boxOut[4704])
{
  uint32_T threadId;
  int32_T ibmat;
  int32_T jcol;
  int32_T jtilecol;
  real32_T cx;
  real32_T cy;
  real32_T bw;
  real32_T bh;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  jcol = static_cast<int32_T>((threadId % 14U));
  jtilecol = static_cast<int32_T>(((threadId - static_cast<uint32_T>(jcol)) /
    14U));
  if (jtilecol < 14) {
    ibmat = ((((jcol * 14) << 2) + (jtilecol << 2)) + *ibcol) + 1;
    cx = (tmpFeatureMap[784 + ((jcol + 14 * jtilecol) + 196 * *ibcol)] +
          static_cast<real32_T>(jtilecol)) * 16.0F;
    cy = (tmpFeatureMap[1568 + ((jcol + 14 * jtilecol) + 196 * *ibcol)] +
          static_cast<real32_T>(jcol)) * 16.0F;
    bw = tmpFeatureMap[2352 + ((jcol + 14 * jtilecol) + 196 * *ibcol)] *
      static_cast<real32_T>(anchors[*ibcol]) * 16.0F;
    bh = tmpFeatureMap[3136 + ((jcol + 14 * jtilecol) + 196 * *ibcol)] *
      static_cast<real32_T>(anchors[4 + *ibcol]) * 16.0F;
    boxOut[ibmat - 1] = cx - bw / 2.0F;
    boxOut[ibmat + 783] = cy - bh / 2.0F;
    boxOut[ibmat + 1567] = cx + bw / 2.0F;
    boxOut[ibmat + 2351] = cy + bh / 2.0F;
    boxOut[ibmat + 3135] = tmpFeatureMap[(jcol + 14 * jtilecol) + 196 * *ibcol] *
      tmpFeatureMap[3920 + ((jcol + 14 * jtilecol) + 196 * *ibcol)];
    boxOut[ibmat + 3919] = 1.0F;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel30(real_T
  bboxPred_data[3136], int32_T bboxPred_size[2], int32_T i0, real_T y2_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(i0);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    y2_data[ibmat] = (bboxPred_data[ibmat + bboxPred_size[0] * 3] -
                      bboxPred_data[ibmat + bboxPred_size[0]]) + 1.0;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel31(real_T
  y2_data[784], int32_T bboxPred_size[2], int32_T b_bboxPred_size[1], real_T
  bboxPred_data[3136])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((b_bboxPred_size[0] - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    bboxPred_data[ibmat + bboxPred_size[0] * 3] = y2_data[ibmat];
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel32(real_T
  bboxPred_data[3136], int32_T bboxPred_size[2], int32_T i, int32_T
  b_bboxPred_size[2], int32_T nrowx, real_T bboxesX1Y1X2Y2_data[3136])
{
  uint32_T threadId;
  int32_T ibmat;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  ibmat = static_cast<int32_T>(threadId);
  if (ibmat < 4) {
    bboxesX1Y1X2Y2_data[nrowx + b_bboxPred_size[0] * ibmat] = bboxPred_data[i +
      bboxPred_size[0] * ibmat];
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel33(real32_T
  thresholdedPrediction_data[4704], int32_T thresholdedPrediction_size[2],
  int32_T i, int32_T count, real32_T classPred_data[784], real32_T
  scorePred_data[784])
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    scorePred_data[count - 1] = thresholdedPrediction_data[i +
      (thresholdedPrediction_size[0] << 2)];
    classPred_data[count - 1] = thresholdedPrediction_data[i +
      thresholdedPrediction_size[0] * 5];
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel34(int32_T
  bboxPred_size[2], int32_T count, int32_T idx_size[2], int16_T *i3, int16_T *i2)
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    *i2 = static_cast<int16_T>((count + 1));
    *i3 = static_cast<int16_T>(bboxPred_size[0]);
    idx_size[0] = 1;
    idx_size[1] = (static_cast<int32_T>(static_cast<int16_T>(bboxPred_size[0]))
                   - static_cast<int32_T>(static_cast<int16_T>((count + 1)))) +
      1;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel35(int16_T
  *i2, int16_T *i3, int16_T idx_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((static_cast<int32_T>(*i3) - static_cast<
    int32_T>(*i2)));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    idx_data[ibmat] = static_cast<int16_T>((static_cast<int32_T>(*i2) +
      static_cast<int32_T>(static_cast<int16_T>(ibmat))));
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel36(int32_T
  bboxPred_size[2], boolean_T b_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((bboxPred_size[0] - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    b_data[ibmat] = false;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel37(int16_T
  idx_data[784], int32_T i0, boolean_T b_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T k;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((i0 - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    k = static_cast<int32_T>(idx);
    b_data[static_cast<int32_T>(idx_data[k]) - 1] = true;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel38
  (boolean_T b_data[784], int32_T i0, int32_T *nx)
{
  uint32_T idx;
  int32_T tmpRed;
  uint32_T threadStride;
  uint32_T threadId;
  uint32_T thBlkId;
  int64_T loopEnd;
  tmpRed = 0;
  thBlkId = static_cast<uint32_T>(mwGetThreadIndexWithinBlock());
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((i0 - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    tmpRed += static_cast<int32_T>(b_data[idx]);
  }

  tmpRed = workGroupReduction38(tmpRed, 0);
  if (thBlkId == 0U) {
    atomicAdd(nx, tmpRed);
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel39(real_T
  bboxesX1Y1X2Y2_data[3136], int32_T bboxPred_size[2], int32_T b_bboxPred_size[2],
  int32_T i0, real_T bboxPred_data[3136])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibcol;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = (1LL + static_cast<int64_T>(i0)) * 4LL - 1LL;
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibcol = static_cast<int32_T>((idx % (1U + static_cast<uint32_T>(i0))));
    ibmat = static_cast<int32_T>(((idx - static_cast<uint32_T>(ibcol)) / (1U +
      static_cast<uint32_T>(i0))));
    bboxPred_data[ibcol + b_bboxPred_size[0] * ibmat] =
      bboxesX1Y1X2Y2_data[ibcol + bboxPred_size[0] * ibmat];
  }
}

static __global__ __launch_bounds__(512, 1) void yolov2_detect_kernel4(real32_T
  boxOut[4704], boolean_T bv0[784])
{
  uint32_T threadId;
  int32_T ibmat;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  ibmat = static_cast<int32_T>(threadId);
  if (ibmat < 784) {
    bv0[ibmat] = (boxOut[3136 + ibmat] >= 0.5F);
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel40(int32_T
  bboxPred_size[2], int32_T b_bboxPred_size[2])
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    b_bboxPred_size[0] = bboxPred_size[0];
    b_bboxPred_size[1] = 4;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel41(real_T
  bboxPred_data[3136], int32_T bboxPred_size[2], real_T bboxesX1Y1X2Y2_data[3136])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((bboxPred_size[0] * 4 - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    bboxesX1Y1X2Y2_data[ibmat] = bboxPred_data[ibmat];
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel42(int32_T
  scorePred_size[1], int32_T count, int32_T idx_size[2], int16_T *i3, int16_T
  *i2)
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    *i2 = static_cast<int16_T>((count + 1));
    *i3 = static_cast<int16_T>(scorePred_size[0]);
    idx_size[0] = 1;
    idx_size[1] = (static_cast<int32_T>(static_cast<int16_T>(scorePred_size[0]))
                   - static_cast<int32_T>(static_cast<int16_T>((count + 1)))) +
      1;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel43(int16_T
  *i2, int16_T *i3, int16_T idx_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((static_cast<int32_T>(*i3) - static_cast<
    int32_T>(*i2)));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    idx_data[ibmat] = static_cast<int16_T>((static_cast<int32_T>(*i2) +
      static_cast<int32_T>(static_cast<int16_T>(ibmat))));
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel44(int32_T
  scorePred_size[1], boolean_T b_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((scorePred_size[0] - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    b_data[ibmat] = false;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel45(int16_T
  idx_data[784], int32_T i0, boolean_T b_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T k;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((i0 - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    k = static_cast<int32_T>(idx);
    b_data[static_cast<int32_T>(idx_data[k]) - 1] = true;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel46
  (boolean_T b_data[784], int32_T i0, int32_T *nx)
{
  uint32_T idx;
  int32_T tmpRed;
  uint32_T threadStride;
  uint32_T threadId;
  uint32_T thBlkId;
  int64_T loopEnd;
  tmpRed = 0;
  thBlkId = static_cast<uint32_T>(mwGetThreadIndexWithinBlock());
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((i0 - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    tmpRed += static_cast<int32_T>(b_data[idx]);
  }

  tmpRed = workGroupReduction38(tmpRed, 0);
  if (thBlkId == 0U) {
    atomicAdd(nx, tmpRed);
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel47(int32_T
  classPred_size[1], int32_T count, int32_T idx_size[2], int16_T *i3, int16_T
  *i2)
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    *i2 = static_cast<int16_T>((count + 1));
    *i3 = static_cast<int16_T>(classPred_size[0]);
    idx_size[0] = 1;
    idx_size[1] = (static_cast<int32_T>(static_cast<int16_T>(classPred_size[0]))
                   - static_cast<int32_T>(static_cast<int16_T>((count + 1)))) +
      1;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel48(int16_T
  *i2, int16_T *i3, int16_T idx_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((static_cast<int32_T>(*i3) - static_cast<
    int32_T>(*i2)));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    idx_data[ibmat] = static_cast<int16_T>((static_cast<int32_T>(*i2) +
      static_cast<int32_T>(static_cast<int16_T>(ibmat))));
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel49(int32_T
  classPred_size[1], boolean_T b_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((classPred_size[0] - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    b_data[ibmat] = false;
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel5(int32_T
  *nx, int32_T thresholdedPrediction_size[2])
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    thresholdedPrediction_size[0] = *nx;
    thresholdedPrediction_size[1] = 6;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel50(int16_T
  idx_data[784], int32_T i0, boolean_T b_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T k;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((i0 - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    k = static_cast<int32_T>(idx);
    b_data[static_cast<int32_T>(idx_data[k]) - 1] = true;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel51
  (boolean_T b_data[784], int32_T i0, int32_T *nx)
{
  uint32_T idx;
  int32_T tmpRed;
  uint32_T threadStride;
  uint32_T threadId;
  uint32_T thBlkId;
  int64_T loopEnd;
  tmpRed = 0;
  thBlkId = static_cast<uint32_T>(mwGetThreadIndexWithinBlock());
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((i0 - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    tmpRed += static_cast<int32_T>(b_data[idx]);
  }

  tmpRed = workGroupReduction38(tmpRed, 0);
  if (thBlkId == 0U) {
    atomicAdd(nx, tmpRed);
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel52
  (real32_T scorePred_data[784], int32_T scorePred_size[1], real32_T x_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((scorePred_size[0] - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    x_data[ibmat] = scorePred_data[ibmat];
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel53(int32_T
  iidx_size[1], int32_T inputBbox_size[2])
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    inputBbox_size[0] = iidx_size[0];
    inputBbox_size[1] = 4;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel54(real_T
  bboxesX1Y1X2Y2_data[3136], int32_T bboxPred_size[2], int32_T iidx_data[784],
  int32_T inputBbox_size[2], int32_T iidx_size[1], real_T inputBbox_data[3136])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibcol;
  int32_T ibmat;
  int64_T loopEnd;
  uint32_T tmpIndex;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = (1LL + static_cast<int64_T>((iidx_size[0] - 1))) * 4LL - 1LL;
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibcol = static_cast<int32_T>((idx % static_cast<uint32_T>(iidx_size[0])));
    tmpIndex = (idx - static_cast<uint32_T>(ibcol)) / static_cast<uint32_T>
      (iidx_size[0]);
    ibmat = static_cast<int32_T>(tmpIndex);
    inputBbox_data[ibcol + inputBbox_size[0] * ibmat] = bboxesX1Y1X2Y2_data
      [(iidx_data[ibcol] + bboxPred_size[0] * ibmat) - 1];
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel55
  (real32_T classPred_data[784], int32_T iidx_data[784], int32_T iidx_size[1],
   real_T inputLabel_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((iidx_size[0] - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    inputLabel_data[ibmat] = static_cast<real_T>(classPred_data[iidx_data[ibmat]
      - 1]);
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel56(int32_T
  iidx_size[1], boolean_T isKept_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((iidx_size[0] - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    isKept_data[ibmat] = true;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel57(real_T
  inputBbox_data[3136], int32_T inputBbox_size[2], int32_T i0, real_T area_data
  [784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(i0);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    area_data[ibmat] = inputBbox_data[ibmat + (inputBbox_size[0] << 1)] *
      inputBbox_data[ibmat + inputBbox_size[0] * 3];
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel58(int32_T
  inputBbox_size[2], real_T inputBbox_data[3136], int32_T i0, real_T x2_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(i0);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    x2_data[ibmat] = inputBbox_data[ibmat] + inputBbox_data[ibmat +
      (inputBbox_size[0] << 1)];
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel59(real_T
  inputBbox_data[3136], int32_T inputBbox_size[2], int32_T i0, real_T y2_data
  [784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(i0);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    y2_data[ibmat] = inputBbox_data[ibmat + inputBbox_size[0]] +
      inputBbox_data[ibmat + inputBbox_size[0] * 3];
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel6(real32_T
  boxOut[4704], int16_T ii_data[784], int32_T thresholdedPrediction_size[2],
  int32_T tmp_size[1], real32_T thresholdedPrediction_data[4704])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibcol;
  int32_T ibmat;
  int64_T loopEnd;
  uint32_T tmpIndex;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = (1LL + static_cast<int64_T>((tmp_size[0] - 1))) * 6LL - 1LL;
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibcol = static_cast<int32_T>((idx % static_cast<uint32_T>(tmp_size[0])));
    tmpIndex = (idx - static_cast<uint32_T>(ibcol)) / static_cast<uint32_T>
      (tmp_size[0]);
    ibmat = static_cast<int32_T>(tmpIndex);
    thresholdedPrediction_data[ibcol + thresholdedPrediction_size[0] * ibmat] =
      boxOut[(static_cast<int32_T>(ii_data[ibcol]) + 784 * ibmat) - 1];
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel60(int32_T
  iidx_data[784], int16_T ii_data[784], int32_T ii_size[1], real_T index_data
  [784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((ii_size[0] - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    index_data[ibmat] = static_cast<real_T>(iidx_data[static_cast<int32_T>
      (ii_data[ibmat]) - 1]);
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel61(int32_T
  bboxes_size[2], real_T index_data[784], int32_T index_size[1])
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    b_sort(index_data, index_size);
    bboxes_size[0] = index_size[0];
    bboxes_size[1] = 4;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel62(real_T
  bboxesX1Y1X2Y2_data[3136], int32_T bboxPred_size[2], real_T index_data[784],
  int32_T bboxes_size[2], int32_T index_size[1], real_T bboxes_data[3136])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibcol;
  int32_T ibmat;
  int64_T loopEnd;
  uint32_T tmpIndex;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = (1LL + static_cast<int64_T>((index_size[0] - 1))) * 4LL - 1LL;
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibcol = static_cast<int32_T>((idx % static_cast<uint32_T>(index_size[0])));
    tmpIndex = (idx - static_cast<uint32_T>(ibcol)) / static_cast<uint32_T>
      (index_size[0]);
    ibmat = static_cast<int32_T>(tmpIndex);
    bboxes_data[ibcol + bboxes_size[0] * ibmat] = bboxesX1Y1X2Y2_data
      [(static_cast<int32_T>(index_data[ibcol]) + bboxPred_size[0] * ibmat) - 1];
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel63(const
  char_T cv0[7], int32_T i0, cell_wrap_0 labels_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibcol;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = 7LL * (1LL + static_cast<int64_T>(i0)) - 1LL;
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>((idx % 7U));
    ibcol = static_cast<int32_T>(((idx - static_cast<uint32_T>(ibmat)) / 7U));
    labels_data[ibcol].f1[ibmat] = cv0[ibmat];
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel64(int32_T
  bboxes_size[2], int32_T positionOut_size[2])
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    /*  convert categorical labels to cell array of charactor vectors for MATLAB */
    /*  execution */
    /*  Annotate detections in the image. */
    positionOut_size[0] = bboxes_size[0];
    positionOut_size[1] = 4;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel65(real_T
  bboxes_data[3136], int32_T bboxes_size[2], int32_T positionOut_data[3136])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  real_T d0;
  int32_T ibmat;
  int32_T ibcol;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((bboxes_size[0] * 4 - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    d0 = rt_roundd_snf(bboxes_data[ibmat]);
    if (d0 < 2.147483648E+9) {
      if (d0 >= -2.147483648E+9) {
        ibcol = static_cast<int32_T>(d0);
      } else {
        ibcol = MIN_int32_T;
      }
    } else if (d0 >= 2.147483648E+9) {
      ibcol = MAX_int32_T;
    } else {
      ibcol = 0;
    }

    positionOut_data[ibmat] = ibcol;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel66(const
  uint8_T uv0[3], int32_T *nx, uint8_T colorRGB_data[2352])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int32_T jcol;
  int32_T itilerow;
  int64_T loopEnd;
  uint32_T tmpIndex;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = (1LL + static_cast<int64_T>((*nx - 1))) * 3LL - 1LL;
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    itilerow = static_cast<int32_T>((idx % static_cast<uint32_T>(*nx)));
    tmpIndex = (idx - static_cast<uint32_T>(itilerow)) / static_cast<uint32_T>
      (*nx);
    jcol = static_cast<int32_T>((tmpIndex % 3U));
    ibmat = jcol * *nx;
    colorRGB_data[ibmat + itilerow] = uv0[jcol];
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel67(int32_T
  positionOut_size[2], int32_T colorRGB_size[2])
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    colorRGB_size[0] = static_cast<int32_T>(static_cast<int16_T>
      (positionOut_size[0]));
    colorRGB_size[1] = 3;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel68(int32_T
  *nx, int8_T colorRGB_data[2352])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int32_T itilerow;
  int64_T loopEnd;
  uint32_T tmpIndex;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = (1LL + static_cast<int64_T>((*nx - 1))) * 3LL - 1LL;
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    itilerow = static_cast<int32_T>((idx % static_cast<uint32_T>(*nx)));
    tmpIndex = (idx - static_cast<uint32_T>(itilerow)) / static_cast<uint32_T>
      (*nx);
    ibmat = static_cast<int32_T>((tmpIndex % 3U)) * *nx;
    colorRGB_data[ibmat + itilerow] = static_cast<int8_T>(0);
  }
}

static __global__ __launch_bounds__(512, 1) void yolov2_detect_kernel69(const
  uint8_T in[150528], uint8_T outImg[150528])
{
  uint32_T threadId;
  int32_T ibmat;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  ibmat = static_cast<int32_T>(threadId);
  if (ibmat < 150528) {
    outImg[ibmat] = in[ibmat];
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel7(int32_T
  tmp_size[1], int32_T bboxesX1Y1X2Y2_size[2])
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    bboxesX1Y1X2Y2_size[0] = tmp_size[0];
    bboxesX1Y1X2Y2_size[1] = 4;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel70(uint8_T
  colorRGB_data[2352], int32_T colorRGB_size[2], uint8_T color_data[2352])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((colorRGB_size[0] * 3 - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    color_data[ibmat] = colorRGB_data[ibmat];
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel71(int32_T
  positionOut_size[2], int32_T color_size[2])
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    color_size[0] = static_cast<int32_T>(static_cast<int16_T>(positionOut_size[0]));
    color_size[1] = 3;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel72(uint8_T
  colorRGB_data[2352], int32_T *nx, uint8_T color_data[2352])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int32_T jcol;
  int32_T itilerow;
  int64_T loopEnd;
  uint32_T tmpIndex;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = (1LL + static_cast<int64_T>((*nx - 1))) * 3LL - 1LL;
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    itilerow = static_cast<int32_T>((idx % static_cast<uint32_T>(*nx)));
    tmpIndex = (idx - static_cast<uint32_T>(itilerow)) / static_cast<uint32_T>
      (*nx);
    jcol = static_cast<int32_T>((tmpIndex % 3U));
    ibmat = jcol * *nx;
    color_data[ibmat + itilerow] = colorRGB_data[jcol];
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel73(int32_T
  endR_im, int32_T penY, int32_T ii, int32_T firstRow, int32_T line[4])
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    line[0U] = firstRow + ii;
    line[1U] = penY;
    line[2U] = firstRow + ii;
    line[3U] = endR_im;
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel74(int32_T
  line[4], int32_T b_line[4])
{
  uint32_T threadId;
  int32_T ibcol;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  ibcol = static_cast<int32_T>(threadId);
  if (ibcol < 4) {
    b_line[ibcol] = line[ibcol];
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel75(int32_T
  yy, int32_T ii, int32_T penY, int32_T firstRow, int32_T line[4])
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    line[0U] = firstRow;
    line[1U] = penY + ii;
    line[2U] = yy;
    line[3U] = penY + ii;
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel76(int32_T
  line[4], int32_T b_line[4])
{
  uint32_T threadId;
  int32_T ibcol;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  ibcol = static_cast<int32_T>(threadId);
  if (ibcol < 4) {
    b_line[ibcol] = line[ibcol];
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel77(int32_T
  endR_im, int32_T penY, int32_T ii, int32_T yy, int32_T line[4])
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    line[0U] = yy - ii;
    line[1U] = penY;
    line[2U] = yy - ii;
    line[3U] = endR_im;
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel78(int32_T
  line[4], int32_T b_line[4])
{
  uint32_T threadId;
  int32_T ibcol;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  ibcol = static_cast<int32_T>(threadId);
  if (ibcol < 4) {
    b_line[ibcol] = line[ibcol];
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel79(int32_T
  yy, int32_T ii, int32_T endR_im, int32_T firstRow, int32_T line[4])
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    line[0U] = firstRow;
    line[1U] = endR_im - ii;
    line[2U] = yy;
    line[3U] = endR_im - ii;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel8(real32_T
  thresholdedPrediction_data[4704], int32_T thresholdedPrediction_size[2],
  int32_T bboxesX1Y1X2Y2_size[2], int32_T i0, real_T bboxesX1Y1X2Y2_data[3136])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibcol;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = (1LL + static_cast<int64_T>(i0)) * 4LL - 1LL;
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibcol = static_cast<int32_T>((idx % (1U + static_cast<uint32_T>(i0))));
    ibmat = static_cast<int32_T>(((idx - static_cast<uint32_T>(ibcol)) / (1U +
      static_cast<uint32_T>(i0))));
    bboxesX1Y1X2Y2_data[ibcol + bboxesX1Y1X2Y2_size[0] * ibmat] = static_cast<
      real_T>(thresholdedPrediction_data[ibcol + thresholdedPrediction_size[0] *
              ibmat]);
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel80(int32_T
  line[4], int32_T b_line[4])
{
  uint32_T threadId;
  int32_T ibcol;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  ibcol = static_cast<int32_T>(threadId);
  if (ibcol < 4) {
    b_line[ibcol] = line[ibcol];
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel81(int32_T
  positionOut_size[2], int32_T textLocAndWidth_size[2])
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    textLocAndWidth_size[0] = positionOut_size[0];
    textLocAndWidth_size[1] = 4;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel82(int32_T
  positionOut_data[3136], int32_T positionOut_size[2], int32_T
  textLocAndWidth_size[2], int32_T i0, int32_T textLocAndWidth_data[3136])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibcol;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = (1LL + static_cast<int64_T>(i0)) * 4LL - 1LL;
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibcol = static_cast<int32_T>((idx % (1U + static_cast<uint32_T>(i0))));
    ibmat = static_cast<int32_T>(((idx - static_cast<uint32_T>(ibcol)) / (1U +
      static_cast<uint32_T>(i0))));
    textLocAndWidth_data[ibcol + textLocAndWidth_size[0] * ibmat] =
      positionOut_data[ibcol + positionOut_size[0] * ibmat];
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel83(int32_T
  textLocAndWidth_size[2], int32_T positionOut_data[3136], int32_T
  positionOut_size[2], int32_T i0, int32_T textLocAndWidth_data[3136])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibcol;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(i0);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    ibcol = positionOut_data[ibmat + positionOut_size[0]];
    if (ibcol >= -2147483647) {
      ibcol--;
    }

    textLocAndWidth_data[ibmat + textLocAndWidth_size[0]] = ibcol;
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel84(int32_T
  textLocAndWidth_size[2], int32_T textPosition_size[2])
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    textPosition_size[0] = textLocAndWidth_size[0];
    textPosition_size[1] = 2;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel85(int32_T
  textLocAndWidth_data[3136], int32_T textLocAndWidth_size[2], int32_T
  textPosition_size[2], int32_T i0, int32_T textPosition_data[1568])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibcol;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = (1LL + static_cast<int64_T>(i0)) * 2LL - 1LL;
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibcol = static_cast<int32_T>((idx % (1U + static_cast<uint32_T>(i0))));
    ibmat = static_cast<int32_T>(((idx - static_cast<uint32_T>(ibcol)) / (1U +
      static_cast<uint32_T>(i0))));
    textPosition_data[ibcol + textPosition_size[0] * ibmat] =
      textLocAndWidth_data[ibcol + textLocAndWidth_size[0] * ibmat];
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel86(uint8_T
  colorRGB_data[2352], uint8_T a_data[3])
{
  uint32_T threadId;
  int32_T ibmat;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  ibmat = static_cast<int32_T>(threadId);
  if (ibmat < 3) {
    a_data[ibmat] = colorRGB_data[ibmat];
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel87(int32_T
  textLocAndWidth_size[2], int32_T colorRGB_size[2])
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    colorRGB_size[0] = static_cast<int32_T>(static_cast<int16_T>
      (textLocAndWidth_size[0]));
    colorRGB_size[1] = 3;
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel88(uint8_T
  a_data[3], int32_T *nx, uint8_T colorRGB_data[2352])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int32_T jcol;
  int32_T itilerow;
  int64_T loopEnd;
  uint32_T tmpIndex;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = (1LL + static_cast<int64_T>((*nx - 1))) * 3LL - 1LL;
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    itilerow = static_cast<int32_T>((idx % static_cast<uint32_T>(*nx)));
    tmpIndex = (idx - static_cast<uint32_T>(itilerow)) / static_cast<uint32_T>
      (*nx);
    jcol = static_cast<int32_T>((tmpIndex % 3U));
    ibmat = jcol * *nx;
    colorRGB_data[ibmat + itilerow] = a_data[jcol];
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel89(int32_T
  textLocAndWidth_data[3136], int32_T textLocAndWidth_size[2], int32_T i0,
  int32_T iidx_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(i0);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    iidx_data[ibmat] = textLocAndWidth_data[ibmat + (textLocAndWidth_size[0] <<
      1)];
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel9(real_T
  bboxesX1Y1X2Y2_data[3136], int32_T i0, real_T x1_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(i0);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    x1_data[ibmat] = bboxesX1Y1X2Y2_data[ibmat];
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel90(int32_T
  iidx_data[784], int32_T thresholdedPrediction_size[2], int32_T
  shapeWidth_data[614656])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((thresholdedPrediction_size[0] - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    shapeWidth_data[ibmat] = iidx_data[ibmat];
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel91(int32_T
  textLocAndWidth_data[3136], int32_T shapeWidth_data[614656])
{
  uint32_T threadId;
  int32_T jtilecol;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  jtilecol = static_cast<int32_T>(threadId);
  if (jtilecol < 1) {
    shapeWidth_data[0] = textLocAndWidth_data[2];
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel92(int32_T
  textLocAndWidth_data[3136], int32_T textLocAndWidth_size[2], int32_T i0,
  int32_T iidx_data[784])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(i0);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    iidx_data[ibmat] = textLocAndWidth_data[ibmat + textLocAndWidth_size[0] * 3];
  }
}

static __global__ __launch_bounds__(1024, 1) void yolov2_detect_kernel93(int32_T
  iidx_data[784], int32_T thresholdedPrediction_size[2], int32_T
  shapeHeight_data[614656])
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((thresholdedPrediction_size[0] - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>(idx);
    shapeHeight_data[ibmat] = iidx_data[ibmat];
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel94(int32_T
  textLocAndWidth_data[3136], int32_T shapeHeight_data[614656])
{
  uint32_T threadId;
  int32_T jtilecol;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  jtilecol = static_cast<int32_T>(threadId);
  if (jtilecol < 1) {
    shapeHeight_data[0] = textLocAndWidth_data[3];
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel95(int32_T
  *textIdx)
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    *textIdx = 0;
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel96
  (cell_wrap_0 labels_data[784], int32_T *textIdx, int8_T thisTextU16[7])
{
  uint32_T threadId;
  int32_T ibmat;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  ibmat = static_cast<int32_T>(threadId);
  if (ibmat < 7) {
    thisTextU16[ibmat] = static_cast<int8_T>(labels_data[*textIdx].f1[ibmat]);
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel97(int8_T
  thisTextU16[7], int8_T thisCharcodes_1b[7])
{
  uint32_T threadId;
  int32_T ibmat;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  ibmat = static_cast<int32_T>(threadId);
  if (ibmat < 7) {
    thisCharcodes_1b[ibmat] = static_cast<int8_T>((static_cast<int32_T>
      (thisTextU16[ibmat]) + 1));
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel98(int8_T
  thisCharcodes_1b[7], const uint16_T uv1[256], const int8_T iv2[261], real_T
  *height)
{
  uint32_T idx;
  real_T tmpRed;
  uint32_T threadStride;
  uint32_T threadId;
  uint32_T thBlkId;
  tmpRed = 0.0;
  thBlkId = static_cast<uint32_T>(mwGetThreadIndexWithinBlock());
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  for (idx = threadId; idx <= 5U; idx += threadStride) {
    tmpRed += static_cast<real_T>(iv2[uv1[static_cast<int32_T>
      (thisCharcodes_1b[static_cast<int32_T>(idx) + 1]) - 1]]);
  }

  tmpRed = workGroupReduction98(tmpRed, 0.0);
  if (thBlkId == 0U) {
    atomicOpreal_T(height, tmpRed);
  }
}

static __global__ __launch_bounds__(32, 1) void yolov2_detect_kernel99(const
  uint16_T uv1[256], int8_T thisCharcodes_1b[7], boolean_T x[7])
{
  uint32_T threadId;
  int32_T ibmat;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  ibmat = static_cast<int32_T>(threadId);
  if (ibmat < 7) {
    x[ibmat] = (static_cast<int32_T>(uv1[static_cast<int32_T>
      (thisCharcodes_1b[ibmat]) - 1]) == 0);
  }
}

void yolov2_detect(yolov2_detectStackData *SD, const uint8_T in[150528], uint8_T
                   outImg[150528])
{
  uint8_T tmp11;
  uint8_T tmp22;
  int32_T i;
  int32_T nx;
  real32_T tmpFeatureMap[4704];
  real_T anchors[8];
  static const int8_T iv1[8] = { 43, 18, 23, 84, 59, 22, 29, 109 };

  int32_T ibcol;
  boolean_T bv0[784];
  int32_T tmp_size[1];
  int32_T nrowx;
  int32_T thresholdedPrediction_size[2];
  static const real_T dv0[4] = { 2.6875, 1.125, 1.4375, 5.25 };

  int16_T ii_data[784];
  int32_T bboxes_size[2];
  int32_T i0;
  int32_T bboxesX1Y1X2Y2_size[2];
  int32_T labels_size[1];
  int32_T x1_size[1];
  int32_T positionOut_size[2];
  real_T bboxesX1Y1X2Y2_data[3136];
  int32_T y1_size[1];
  boolean_T isEmpty;
  uint8_T colorRGB_data[2352];
  int32_T positionOut_data[3136];
  int32_T colorRGB_size[2];
  int32_T x2_size[1];
  int32_T y2_size[1];
  static const uint8_T uv0[3] = { MAX_uint8_T, MAX_uint8_T, 0U };

  int32_T b_colorRGB_size[2];
  int32_T color_size[2];
  uint8_T color_data[2352];
  visioncodegen_ShapeInserter *obj;
  vision_ShapeInserter_0 *b_obj;
  int32_T endC_im;
  int32_T numFillColor;
  int32_T i1;
  int32_T textLocAndWidth_size[2];
  int32_T idxFillColor;
  int32_T bboxPred_size[2];
  int32_T idxROI;
  int32_T firstRow;
  int32_T penY;
  real_T bboxPred_data[3136];
  int32_T textPosition_size[2];
  int32_T yy;
  int32_T endR_im;
  int32_T textPosition_data[1568];
  int32_T ii;
  int32_T iidx_data[784];
  int32_T line[4];
  int32_T shapeWidth_size[2];
  int32_T b_textLocAndWidth_size[1];
  int32_T b_bboxPred_size[1];
  boolean_T visited1;
  boolean_T visited2;
  boolean_T done;
  int32_T shapeHeight_size[2];
  int32_T b_line[4];
  int32_T c_textLocAndWidth_size[1];
  int32_T nrows;
  int32_T c_bboxPred_size[1];
  int32_T nxin;
  int32_T textIdx;
  int32_T count;
  int32_T d_bboxPred_size[2];
  int32_T endR;
  real32_T scorePred_data[784];
  int8_T thisTextU16[7];
  int32_T endC_gl;
  int32_T scorePred_size[1];
  real32_T classPred_data[784];
  int8_T thisCharcodes_1b[7];
  int32_T classPred_size[1];
  real_T height;
  static const int8_T iv2[261] = { 9, 0, 0, 4, 4, 4, 8, 8, 8, 8, 3, 4, 4, 6, 10,
    4, 7, 4, 6, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 4, 4, 10, 10, 10, 5, 10, 8, 7, 8,
    9, 7, 6, 9, 9, 3, 4, 8, 6, 10, 9, 9, 7, 9, 8, 6, 8, 8, 8, 10, 8, 7, 7, 4, 6,
    4, 8, 6, 7, 7, 8, 6, 8, 7, 4, 7, 7, 3, 4, 7, 3, 11, 7, 7, 8, 8, 5, 6, 4, 7,
    6, 9, 7, 6, 7, 4, 4, 4, 8, 8, 8, 8, 7, 9, 9, 8, 7, 7, 7, 7, 7, 7, 6, 7, 7, 7,
    7, 3, 3, 3, 3, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 0, 5, 8, 8, 8, 0, 8, 7, 8, 10,
    0, 7, 7, 0, 11, 9, 0, 10, 0, 0, 8, 8, 0, 0, 0, 0, 0, 6, 6, 0, 10, 7, 5, 4,
    10, 0, 0, 0, 0, 6, 6, 0, 4, 8, 8, 9, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 6, 0, 0,
    8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 7, 8, 7, 7, 3, 3, 3, 3, 9, 9, 0, 9, 8, 8, 8,
    0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 9, 7, 7, 6, 7, 8, 0,
    10, 5, 5, 5, 10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 6, 4 };

  static const uint16_T uv1[256] = { 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 3U, 4U, 5U, 6U, 7U, 8U, 9U, 10U, 11U, 12U, 13U, 14U, 15U, 16U, 17U,
    18U, 19U, 20U, 21U, 22U, 23U, 24U, 25U, 26U, 27U, 28U, 29U, 30U, 31U, 32U,
    33U, 34U, 35U, 36U, 37U, 38U, 39U, 40U, 41U, 42U, 43U, 44U, 45U, 46U, 47U,
    48U, 49U, 50U, 51U, 52U, 53U, 54U, 55U, 56U, 57U, 58U, 59U, 60U, 61U, 62U,
    63U, 64U, 65U, 66U, 67U, 68U, 69U, 70U, 71U, 72U, 73U, 74U, 75U, 76U, 77U,
    78U, 79U, 80U, 81U, 82U, 83U, 84U, 85U, 86U, 87U, 88U, 89U, 90U, 91U, 92U,
    93U, 94U, 95U, 96U, 97U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 172U, 163U, 132U, 133U, 189U, 150U, 232U, 134U, 142U, 139U, 157U, 169U,
    164U, 258U, 138U, 259U, 131U, 147U, 242U, 243U, 141U, 151U, 136U, 260U, 222U,
    241U, 158U, 170U, 245U, 244U, 246U, 162U, 173U, 201U, 199U, 174U, 98U, 99U,
    144U, 100U, 203U, 101U, 200U, 202U, 207U, 204U, 205U, 206U, 233U, 102U, 211U,
    208U, 209U, 175U, 103U, 240U, 145U, 214U, 212U, 213U, 104U, 235U, 237U, 137U,
    106U, 105U, 107U, 109U, 108U, 110U, 160U, 111U, 113U, 112U, 114U, 115U, 117U,
    116U, 118U, 119U, 234U, 120U, 122U, 121U, 123U, 125U, 124U, 184U, 161U, 127U,
    126U, 128U, 129U, 236U, 238U, 186U };

  int16_T i2;
  boolean_T x[7];
  int16_T i3;
  int32_T idx_size[2];
  real_T numMissingGlyph;
  int16_T idx_data[784];
  int32_T b_size[2];
  boolean_T b_data[784];
  int32_T e_bboxPred_size[2];
  int32_T b_idx_size[2];
  int32_T b_b_size[2];
  boolean_T b_b_data[784];
  int32_T c_idx_size[2];
  int32_T penX;
  int32_T c_b_size[2];
  boolean_T c_b_data[784];
  static const int8_T iv3[261] = { 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1,
    1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1,
    1, 0, 1, 1, -2, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0,
    0, 2, 0, 1, 0, 0, 0, 0, 0, 1, 1, -1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0,
    0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    -1, -1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 2,
    2, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, -1, 0, -1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0,
    0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, -1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 };

  static const int8_T iv4[261] = { 8, 0, 0, 0, 9, 9, 9, 10, 9, 9, 9, 9, 9, 9, 7,
    1, 4, 1, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 7, 7, 7, 5, 7, 9, 9, 9, 9, 9, 9, 9,
    9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 0,
    10, 7, 9, 7, 9, 7, 9, 7, 9, 9, 9, 9, 9, 7, 7, 7, 7, 7, 7, 7, 8, 7, 7, 7, 7,
    7, 7, 9, 9, 9, 5, 11, 12, 9, 12, 12, 11, 11, 10, 10, 10, 9, 10, 11, 7, 10,
    10, 10, 9, 10, 10, 10, 9, 10, 10, 10, 10, 9, 10, 10, 10, 10, 9, 0, 9, 9, 9,
    9, 0, 9, 9, 9, 9, 0, 10, 9, 0, 9, 9, 0, 7, 0, 0, 9, 7, 0, 0, 0, 0, 0, 9, 9,
    0, 7, 7, 7, 7, 5, 0, 0, 0, 0, 6, 6, 0, 0, 12, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0,
    7, 0, 9, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 12, 12, 11, 12, 12, 12, 11,
    12, 12, 12, 0, 12, 12, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 9, 9, 10, 12, 10, 9, 9, 0, 7, 9, 9, 9, 9, 9, 9, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 4, 10, 4 };

  static const int8_T iv5[261] = { 8, 0, 0, 0, 9, 3, 9, 11, 9, 9, 3, 11, 11, 4,
    7, 3, 1, 1, 11, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 7, 9, 7, 3, 7, 9, 9, 9, 9, 9,
    9, 9, 9, 9, 9, 9, 11, 9, 9, 9, 9, 9, 9, 11, 9, 9, 9, 9, 9, 9, 9, 9, 9, 11,
    11, 11, 6, 1, 2, 7, 9, 7, 9, 7, 9, 9, 9, 9, 11, 9, 9, 7, 7, 7, 9, 9, 7, 7, 8,
    7, 7, 7, 7, 9, 7, 11, 11, 11, 2, 11, 12, 12, 12, 12, 11, 11, 10, 10, 10, 9,
    10, 11, 10, 10, 10, 10, 9, 10, 10, 10, 9, 10, 10, 10, 10, 9, 10, 10, 10, 10,
    9, 0, 3, 9, 9, 11, 0, 11, 9, 5, 9, 0, 2, 1, 0, 9, 9, 0, 7, 0, 0, 9, 9, 0, 0,
    0, 0, 0, 4, 4, 0, 7, 7, 9, 9, 3, 0, 0, 0, 0, 5, 5, 0, 0, 12, 12, 12, 0, 0, 0,
    0, 0, 0, 0, 0, 7, 0, 11, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 12, 12, 11,
    12, 12, 12, 11, 12, 12, 12, 0, 12, 12, 12, 12, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 11, 9, 10, 12, 12, 9, 11, 0, 7, 6, 6, 6, 9, 9, 9, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 };

  int32_T x_size[1];
  static const int8_T iv6[261] = { 7, 0, 0, 0, 2, 4, 8, 6, 8, 8, 3, 4, 4, 6, 8,
    2, 7, 2, 5, 7, 6, 6, 6, 7, 6, 7, 6, 6, 7, 2, 2, 8, 8, 8, 5, 10, 9, 6, 8, 8,
    6, 5, 8, 7, 2, 5, 7, 6, 9, 7, 9, 6, 10, 7, 6, 8, 7, 8, 11, 8, 8, 7, 3, 5, 3,
    7, 6, 4, 7, 6, 6, 7, 6, 5, 7, 6, 2, 4, 6, 2, 10, 6, 7, 6, 7, 4, 6, 5, 6, 7,
    10, 7, 7, 7, 4, 2, 4, 7, 9, 9, 8, 6, 7, 9, 7, 7, 7, 7, 7, 7, 7, 6, 6, 6, 6,
    6, 4, 4, 5, 4, 6, 7, 7, 7, 7, 7, 6, 6, 6, 6, 0, 5, 6, 6, 6, 0, 6, 6, 6, 10,
    0, 4, 4, 0, 11, 9, 0, 8, 0, 0, 8, 6, 0, 0, 0, 0, 0, 4, 5, 0, 10, 7, 5, 2, 8,
    0, 0, 0, 0, 6, 6, 0, 0, 9, 9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 7, 0, 0, 8, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 9, 6, 9, 6, 6, 4, 5, 4, 4, 9, 9, 0, 9, 7, 7, 7, 0, 0,
    0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 10, 7, 8, 7, 6, 6, 0, 8, 4,
    5, 5, 10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 6, 2 };

  int32_T iidx_size[1];
  real32_T x_data[784];
  int32_T inputBbox_size[2];
  int32_T inputLabel_size[1];
  static const char_T cv0[7] = { 'v', 'e', 'h', 'i', 'c', 'l', 'e' };

  real_T inputBbox_data[3136];
  int32_T isKept_size[1];
  real_T inputLabel_data[784];
  boolean_T isKept_data[784];
  int32_T area_size[1];
  static const int16_T iv7[261] = { 0, 0, 0, 56, 56, 74, 86, 158, 224, 296, 368,
    377, 421, 465, 489, 545, 551, 558, 560, 615, 678, 732, 786, 840, 903, 957,
    1020, 1074, 1128, 1191, 1205, 1223, 1279, 1303, 1359, 1404, 1494, 1575, 1629,
    1701, 1773, 1827, 1872, 1944, 2007, 2025, 2080, 2143, 2197, 2278, 2341, 2422,
    2476, 2586, 2649, 2703, 2775, 2838, 2910, 3009, 3081, 3153, 3216, 3249, 3304,
    3337, 3379, 3385, 3393, 3442, 3496, 3538, 3601, 3643, 3688, 3751, 3805, 3823,
    3867, 3921, 3939, 4009, 4051, 4100, 4154, 4217, 4245, 4287, 4327, 4369, 4418,
    4488, 4537, 4600, 4649, 4693, 4715, 4759, 6416, 6515, 6722, 6890, 7390, 7906,
    8394, 8745, 8675, 8815, 8955, 8885, 9018, 9165, 9285, 9225, 9345, 9405, 9499,
    9459, 9539, 9589, 9695, 9825, 9755, 9895, 10035, 9965, 10263, 10203, 10323,
    10383, 0, 5322, 4791, 4845, 5049, 0, 5515, 8621, 5286, 5119, 0, 5453, 5115,
    0, 6623, 8061, 0, 5337, 0, 0, 4955, 5461, 0, 0, 0, 0, 0, 5209, 5619, 0, 9095,
    10154, 5939, 4773, 5255, 0, 0, 0, 0, 5225, 5639, 0, 4773, 5984, 6308, 7798,
    0, 0, 0, 0, 0, 0, 0, 0, 10098, 0, 10587, 0, 0, 4899, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 6200, 6962, 6092, 7034, 6818, 7148, 7196, 7256, 7100, 7582, 7690, 0, 7474,
    8226, 8310, 8142, 0, 0, 0, 0, 0, 0, 0, 5583, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5027,
    7300, 9625, 8471, 10437, 8567, 10521, 0, 8005, 5595, 5393, 5423, 5759, 5669,
    5849, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5279, 5316, 5581 };

  int32_T b_x2_size[1];
  real_T area_data[784];
  int32_T b_y2_size[1];
  int8_T num_idx_0;
  real_T x2_data[784];
  int8_T num_idx_1;
  real_T y2_data[784];
  int8_T num[2];
  static const uint8_T uv2[10664] = { 60U, 96U, 96U, 96U, 96U, 96U, 60U, 96U, 0U,
    0U, 0U, 0U, 0U, 96U, 96U, 0U, 0U, 0U, 0U, 0U, 96U, 96U, 0U, 0U, 0U, 0U, 0U,
    96U, 96U, 0U, 0U, 0U, 0U, 0U, 96U, 96U, 0U, 0U, 0U, 0U, 0U, 96U, 96U, 0U, 0U,
    0U, 0U, 0U, 96U, 108U, 96U, 96U, 96U, 96U, 96U, 108U, 176U, 120U, 176U, 119U,
    172U, 115U, 165U, 108U, 158U, 101U, 151U, 94U, 144U, 87U, 0U, 0U, 176U, 120U,
    83U, 201U, 79U, 205U, 71U, 189U, 67U, 193U, 58U, 177U, 54U, 181U, 0U, 0U, 0U,
    185U, 6U, 117U, 75U, 0U, 0U, 0U, 3U, 187U, 0U, 172U, 20U, 0U, 0U, 0U, 48U,
    143U, 0U, 192U, 0U, 0U, 74U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 109U, 0U, 0U, 172U, 19U, 110U, 79U,
    0U, 0U, 214U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 225U, 0U, 0U, 69U, 123U, 3U, 187U, 0U, 0U, 0U, 0U, 125U, 67U,
    49U, 143U, 0U, 0U, 0U, 0U, 178U, 13U, 104U, 87U, 0U, 0U, 0U, 0U, 0U, 108U,
    40U, 0U, 0U, 3U, 155U, 245U, 230U, 104U, 0U, 89U, 202U, 130U, 73U, 164U, 7U,
    109U, 164U, 108U, 40U, 0U, 0U, 26U, 231U, 195U, 40U, 0U, 0U, 0U, 38U, 207U,
    190U, 29U, 0U, 0U, 0U, 108U, 163U, 223U, 7U, 0U, 0U, 108U, 40U, 230U, 38U,
    145U, 76U, 117U, 107U, 230U, 7U, 42U, 181U, 246U, 221U, 67U, 0U, 0U, 0U,
    108U, 40U, 0U, 0U, 80U, 234U, 221U, 50U, 0U, 0U, 106U, 126U, 211U, 40U, 81U,
    171U, 0U, 50U, 179U, 2U, 212U, 39U, 90U, 170U, 15U, 194U, 21U, 0U, 83U, 235U,
    222U, 52U, 170U, 60U, 0U, 0U, 0U, 0U, 0U, 114U, 117U, 0U, 0U, 0U, 0U, 0U,
    57U, 173U, 48U, 219U, 236U, 86U, 0U, 19U, 194U, 17U, 166U, 89U, 38U, 218U,
    1U, 176U, 53U, 0U, 167U, 92U, 45U, 220U, 123U, 109U, 0U, 0U, 49U, 221U, 236U,
    88U, 0U, 0U, 83U, 227U, 235U, 93U, 0U, 0U, 0U, 1U, 240U, 84U, 72U, 238U, 0U,
    0U, 0U, 0U, 230U, 69U, 73U, 208U, 0U, 0U, 0U, 3U, 171U, 218U, 208U, 42U, 0U,
    0U, 12U, 199U, 146U, 230U, 87U, 0U, 91U, 198U, 107U, 179U, 0U, 86U, 229U,
    17U, 111U, 162U, 129U, 183U, 0U, 0U, 172U, 181U, 177U, 80U, 55U, 252U, 110U,
    13U, 41U, 240U, 215U, 1U, 0U, 81U, 209U, 247U, 228U, 160U, 247U, 101U, 77U,
    MAX_uint8_T, 10U, 53U, 241U, 0U, 28U, 216U, 0U, 0U, 0U, 48U, 94U, 0U, 19U,
    216U, 35U, 0U, 150U, 115U, 0U, 6U, 239U, 26U, 0U, 43U, 240U, 0U, 0U, 65U,
    228U, 0U, 0U, 43U, 240U, 0U, 0U, 6U, 239U, 25U, 0U, 0U, 150U, 113U, 0U, 0U,
    19U, 216U, 35U, 0U, 0U, 48U, 94U, 107U, 34U, 0U, 0U, 51U, 209U, 8U, 0U, 0U,
    142U, 122U, 0U, 0U, 53U, 219U, 0U, 0U, 9U, MAX_uint8_T, 17U, 0U, 0U, 252U,
    40U, 0U, 9U, MAX_uint8_T, 17U, 0U, 52U, 219U, 0U, 0U, 140U, 122U, 0U, 50U,
    209U, 8U, 0U, 107U, 34U, 0U, 0U, 0U, 0U, 124U, 69U, 0U, 0U, 58U, 208U, 141U,
    142U, 217U, 9U, 0U, 19U, 131U, 142U, 2U, 0U, 0U, 123U, 57U, 109U, 70U, 0U,
    0U, 0U, 0U, 168U, 52U, 0U, 0U, 0U, 0U, 0U, 0U, 168U, 52U, 0U, 0U, 0U, 0U, 0U,
    0U, 168U, 52U, 0U, 0U, 0U, 180U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 60U, 0U, 0U, 0U, 168U, 52U, 0U, 0U,
    0U, 0U, 0U, 0U, 168U, 52U, 0U, 0U, 0U, 0U, 0U, 0U, 168U, 52U, 0U, 0U, 0U,
    212U, 160U, 105U, 147U, 186U, 51U, 32U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 20U, 212U, 160U, 0U, 0U, 0U, 220U,
    10U, 0U, 0U, 45U, 186U, 0U, 0U, 0U, 118U, 113U, 0U, 0U, 0U, 191U, 41U, 0U,
    0U, 13U, 218U, 0U, 0U, 0U, 80U, 151U, 0U, 0U, 0U, 153U, 78U, 0U, 0U, 0U,
    219U, 12U, 0U, 0U, 42U, 189U, 0U, 0U, 0U, 115U, 116U, 0U, 0U, 0U, 188U, 44U,
    0U, 0U, 0U, 0U, 6U, 155U, 244U, 222U, 79U, 0U, 0U, 130U, 192U, 23U, 68U,
    239U, 29U, 4U, 235U, 65U, 0U, 0U, 165U, 134U, 31U, MAX_uint8_T, 18U, 0U, 0U,
    119U, 182U, 53U, MAX_uint8_T, 4U, 0U, 0U, 105U, 204U, 31U, MAX_uint8_T, 18U,
    0U, 0U, 120U, 181U, 3U, 234U, 64U, 0U, 0U, 168U, 133U, 0U, 128U, 190U, 23U,
    70U, 240U, 29U, 0U, 6U, 156U, 245U, 223U, 79U, 0U, 1U, 60U, 149U, 157U, 0U,
    0U, 40U, 178U, 186U, 180U, 0U, 0U, 0U, 0U, 116U, 180U, 0U, 0U, 0U, 0U, 116U,
    180U, 0U, 0U, 0U, 0U, 116U, 180U, 0U, 0U, 0U, 0U, 116U, 180U, 0U, 0U, 0U, 0U,
    116U, 180U, 0U, 0U, 0U, 0U, 116U, 180U, 0U, 0U, 48U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 112U, 200U, MAX_uint8_T, 251U, 208U,
    65U, 0U, 0U, 0U, 8U, 120U, 240U, 10U, 0U, 0U, 0U, 18U, MAX_uint8_T, 42U, 0U,
    0U, 0U, 81U, 237U, 9U, 0U, 0U, 35U, 224U, 76U, 0U, 0U, 43U, 220U, 73U, 0U,
    0U, 30U, 226U, 64U, 0U, 0U, 0U, 187U, 148U, 0U, 0U, 0U, 0U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 40U, 168U, MAX_uint8_T,
    249U, 209U, 67U, 0U, 0U, 0U, 8U, 133U, 221U, 0U, 0U, 0U, 0U, 59U, 234U, 0U,
    0U, 4U, 38U, 183U, 111U, 0U, 0U, 252U, MAX_uint8_T, 183U, 26U, 0U, 0U, 3U,
    28U, 139U, 231U, 14U, 0U, 0U, 0U, 5U, 253U, 60U, 0U, 0U, 11U, 122U, 244U,
    20U, 200U, MAX_uint8_T, 246U, 202U, 67U, 0U, 0U, 0U, 0U, 9U, 211U, 156U, 0U,
    0U, 0U, 0U, 158U, 188U, 156U, 0U, 0U, 0U, 96U, 153U, 104U, 156U, 0U, 0U, 44U,
    200U, 9U, 104U, 156U, 0U, 12U, 205U, 41U, 0U, 104U, 156U, 0U, 97U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 196U, 0U,
    0U, 0U, 0U, 124U, 156U, 0U, 0U, 0U, 0U, 0U, 124U, 156U, 0U, 0U, 0U, 0U, 0U,
    124U, 156U, 0U, 100U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 0U,
    100U, 160U, 0U, 0U, 0U, 0U, 100U, 160U, 0U, 0U, 0U, 0U, 100U, 253U, 224U,
    147U, 16U, 0U, 0U, 8U, 49U, 194U, 180U, 0U, 0U, 0U, 0U, 43U, MAX_uint8_T,
    16U, 0U, 0U, 0U, 35U, MAX_uint8_T, 25U, 0U, 0U, 18U, 167U, 204U, 0U, 140U,
    MAX_uint8_T, 236U, 173U, 30U, 0U, 0U, 0U, 117U, 225U, 254U, MAX_uint8_T, 72U,
    0U, 100U, 215U, 48U, 2U, 0U, 0U, 0U, 219U, 80U, 0U, 0U, 0U, 0U, 17U,
    MAX_uint8_T, 117U, 226U, 237U, 144U, 3U, 43U, MAX_uint8_T, 169U, 20U, 45U,
    229U, 107U, 29U, MAX_uint8_T, 40U, 0U, 0U, 133U, 173U, 3U, 241U, 63U, 0U, 0U,
    129U, 158U, 0U, 140U, 195U, 27U, 39U, 224U, 69U, 0U, 10U, 162U, 244U, 224U,
    102U, 0U, 180U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 224U, 0U,
    0U, 0U, 0U, 136U, 145U, 0U, 0U, 0U, 36U, 225U, 15U, 0U, 0U, 0U, 180U, 94U,
    0U, 0U, 0U, 74U, 213U, 2U, 0U, 0U, 4U, 216U, 85U, 0U, 0U, 0U, 101U, 228U, 3U,
    0U, 0U, 0U, 208U, 134U, 0U, 0U, 0U, 21U, MAX_uint8_T, 67U, 0U, 0U, 0U, 1U,
    137U, 233U, 241U, 163U, 8U, 89U, 197U, 22U, 27U, 206U, 105U, 114U, 176U, 0U,
    0U, 171U, 86U, 18U, 216U, 174U, 121U, 159U, 2U, 12U, 179U, 191U, 252U, 125U,
    1U, 161U, 128U, 0U, 58U, 227U, 127U, 236U, 62U, 0U, 0U, 103U, 203U, 194U,
    171U, 20U, 26U, 187U, 149U, 32U, 180U, 242U, 234U, 154U, 12U, 0U, 13U, 160U,
    239U, 226U, 94U, 0U, 0U, 159U, 154U, 14U, 71U, 245U, 45U, 2U, 246U, 31U, 0U,
    0U, 160U, 148U, 7U, 252U, 37U, 0U, 0U, 137U, 187U, 0U, 185U, 162U, 15U, 53U,
    229U, 196U, 0U, 26U, 184U, 245U, 188U, 164U, 165U, 0U, 0U, 0U, 0U, 0U, 196U,
    101U, 0U, 0U, 0U, 15U, 121U, 221U, 6U, 0U, 164U, MAX_uint8_T, 246U, 181U,
    34U, 0U, 176U, 120U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 176U, 120U,
    176U, 120U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 176U, 119U, 96U, 104U,
    145U, 26U, 0U, 0U, 0U, 0U, 0U, 36U, 160U, 56U, 0U, 0U, 0U, 34U, 158U, 210U,
    87U, 1U, 0U, 32U, 156U, 212U, 91U, 2U, 0U, 0U, 63U, 245U, 180U, 6U, 0U, 0U,
    0U, 0U, 0U, 32U, 157U, 212U, 91U, 2U, 0U, 0U, 0U, 0U, 0U, 34U, 159U, 211U,
    90U, 2U, 0U, 0U, 0U, 0U, 0U, 36U, 161U, 56U, 180U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 180U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 60U, 144U, 102U, 5U, 0U, 0U, 0U, 0U, 0U, 25U, 146U,
    215U, 99U, 4U, 0U, 0U, 0U, 0U, 0U, 27U, 149U, 215U, 97U, 4U, 0U, 0U, 0U, 0U,
    0U, 59U, 243U, 185U, 8U, 0U, 0U, 28U, 149U, 215U, 98U, 4U, 0U, 27U, 148U,
    216U, 100U, 4U, 0U, 0U, 0U, 145U, 103U, 5U, 0U, 0U, 0U, 0U, 0U, 200U,
    MAX_uint8_T, 245U, 188U, 34U, 0U, 0U, 16U, 174U, 179U, 0U, 0U, 0U, 128U,
    193U, 0U, 0U, 21U, 232U, 83U, 0U, 0U, 179U, 107U, 0U, 0U, 67U, 201U, 0U, 0U,
    0U, 125U, 162U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 136U, 160U, 0U, 0U, 0U, 0U,
    0U, 77U, 186U, 240U, 244U, 185U, 50U, 0U, 0U, 2U, 155U, 178U, 61U, 10U, 22U,
    89U, 217U, 48U, 0U, 125U, 124U, 3U, 143U, 240U, MAX_uint8_T, 111U, 43U, 173U,
    19U, 171U, 0U, 131U, 117U, 13U, 165U, 55U, 0U, 175U, 87U, 81U, 10U, 197U, 0U,
    43U, 238U, 6U, 9U, 167U, 110U, 65U, 54U, 189U, 44U, 185U, 201U, 20U, 164U,
    75U, 73U, 143U, 22U, 230U, 208U, 51U, 233U, 220U, 97U, 0U, 2U, 197U, 138U,
    35U, 3U, 0U, 0U, 0U, 0U, 0U, 0U, 12U, 138U, 221U, 253U, MAX_uint8_T, 77U, 0U,
    0U, 0U, 0U, 0U, 0U, 166U, 236U, 6U, 0U, 0U, 0U, 0U, 0U, 16U, 243U, 246U, 83U,
    0U, 0U, 0U, 0U, 0U, 106U, 187U, 171U, 179U, 0U, 0U, 0U, 0U, 0U, 204U, 101U,
    85U, 251U, 23U, 0U, 0U, 0U, 46U, 251U, 20U, 10U, 244U, 115U, 0U, 0U, 0U,
    145U, 186U, 0U, 0U, 167U, 211U, 0U, 0U, 6U, 236U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 51U, 0U, 85U, 235U, 10U, 0U, 0U, 4U,
    224U, 147U, 0U, 183U, 124U, 0U, 0U, 0U, 0U, 108U, 236U, 6U, 224U,
    MAX_uint8_T, 250U, 211U, 74U, 0U, 224U, 88U, 21U, 154U, 239U, 1U, 224U, 88U,
    0U, 66U, 249U, 4U, 224U, 89U, 32U, 184U, 137U, 0U, 224U, MAX_uint8_T,
    MAX_uint8_T, 192U, 16U, 0U, 224U, 89U, 32U, 157U, 220U, 14U, 224U, 88U, 0U,
    2U, 244U, 88U, 224U, 88U, 9U, 81U, MAX_uint8_T, 65U, 224U, MAX_uint8_T, 254U,
    229U, 128U, 0U, 0U, 0U, 98U, 207U, 248U, MAX_uint8_T, MAX_uint8_T, 160U, 0U,
    125U, 240U, 93U, 18U, 0U, 0U, 0U, 19U, 248U, 99U, 0U, 0U, 0U, 0U, 0U, 77U,
    MAX_uint8_T, 13U, 0U, 0U, 0U, 0U, 0U, 96U, 244U, 0U, 0U, 0U, 0U, 0U, 0U, 78U,
    MAX_uint8_T, 15U, 0U, 0U, 0U, 0U, 0U, 21U, 250U, 108U, 0U, 0U, 0U, 0U, 0U,
    0U, 135U, 244U, 104U, 23U, 0U, 0U, 0U, 0U, 1U, 107U, 211U, 249U, MAX_uint8_T,
    MAX_uint8_T, 164U, 224U, MAX_uint8_T, MAX_uint8_T, 247U, 215U, 119U, 2U, 0U,
    224U, 88U, 2U, 19U, 87U, 239U, 135U, 0U, 224U, 88U, 0U, 0U, 0U, 98U, 247U,
    21U, 224U, 88U, 0U, 0U, 0U, 11U, MAX_uint8_T, 68U, 224U, 88U, 0U, 0U, 0U, 0U,
    244U, 89U, 224U, 88U, 0U, 0U, 0U, 15U, MAX_uint8_T, 65U, 224U, 88U, 0U, 0U,
    0U, 102U, 240U, 10U, 224U, 88U, 0U, 23U, 94U, 240U, 106U, 0U, 224U,
    MAX_uint8_T, MAX_uint8_T, 246U, 201U, 86U, 0U, 0U, 224U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 248U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U,
    0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 96U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U,
    224U, 88U, 0U, 0U, 0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 56U, 224U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 248U, 224U,
    88U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 224U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 100U, 224U, 88U, 0U, 0U, 0U, 224U,
    88U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 0U, 100U,
    208U, 248U, MAX_uint8_T, MAX_uint8_T, 160U, 0U, 128U, 240U, 93U, 18U, 0U, 0U,
    0U, 19U, 248U, 99U, 0U, 0U, 0U, 0U, 0U, 77U, MAX_uint8_T, 13U, 0U, 0U, 0U,
    0U, 0U, 96U, 244U, 0U, 0U, 0U, 0U, 0U, 0U, 78U, MAX_uint8_T, 15U, 0U, 0U, 0U,
    152U, 164U, 21U, 250U, 106U, 0U, 0U, 0U, 152U, 164U, 0U, 138U, 243U, 104U,
    24U, 17U, 171U, 164U, 0U, 1U, 108U, 210U, 248U, 242U, 206U, 101U, 224U, 88U,
    0U, 0U, 0U, 136U, 180U, 224U, 88U, 0U, 0U, 0U, 136U, 180U, 224U, 88U, 0U, 0U,
    0U, 136U, 180U, 224U, 88U, 0U, 0U, 0U, 136U, 180U, 224U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 180U, 224U, 88U, 0U, 0U,
    0U, 136U, 180U, 224U, 88U, 0U, 0U, 0U, 136U, 180U, 224U, 88U, 0U, 0U, 0U,
    136U, 180U, 224U, 88U, 0U, 0U, 0U, 136U, 180U, 228U, 88U, 228U, 88U, 228U,
    88U, 228U, 88U, 228U, 88U, 228U, 88U, 228U, 88U, 228U, 88U, 228U, 88U, 0U,
    0U, 0U, 148U, 168U, 0U, 0U, 0U, 148U, 168U, 0U, 0U, 0U, 148U, 168U, 0U, 0U,
    0U, 148U, 168U, 0U, 0U, 0U, 148U, 168U, 0U, 0U, 0U, 148U, 168U, 0U, 0U, 0U,
    148U, 168U, 0U, 0U, 0U, 148U, 168U, 0U, 0U, 0U, 156U, 151U, 0U, 0U, 20U,
    218U, 94U, 20U, MAX_uint8_T, 236U, 147U, 3U, 224U, 72U, 0U, 0U, 157U, 158U,
    0U, 224U, 72U, 0U, 104U, 204U, 8U, 0U, 224U, 72U, 56U, 229U, 30U, 0U, 0U,
    224U, 95U, 225U, 67U, 0U, 0U, 0U, 224U, 204U, 215U, 7U, 0U, 0U, 0U, 224U,
    82U, 205U, 165U, 0U, 0U, 0U, 224U, 72U, 27U, 230U, 127U, 0U, 0U, 224U, 72U,
    0U, 54U, 246U, 90U, 0U, 224U, 72U, 0U, 0U, 91U, 247U, 58U, 224U, 88U, 0U, 0U,
    0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U,
    0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U,
    0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 64U, 224U, 245U, 12U, 0U, 0U, 0U, 124U,
    MAX_uint8_T, 56U, 224U, 247U, 94U, 0U, 0U, 0U, 216U, 249U, 56U, 224U, 171U,
    187U, 0U, 0U, 58U, 189U, 236U, 56U, 224U, 78U, 252U, 27U, 0U, 153U, 93U,
    236U, 56U, 224U, 44U, 197U, 117U, 8U, 227U, 11U, 236U, 56U, 224U, 44U, 104U,
    209U, 88U, 158U, 0U, 236U, 56U, 224U, 44U, 18U, 249U, 217U, 63U, 0U, 236U,
    56U, 224U, 44U, 0U, 174U, 222U, 1U, 0U, 236U, 56U, 224U, 44U, 0U, 0U, 0U, 0U,
    0U, 236U, 56U, 224U, 163U, 0U, 0U, 0U, 80U, 192U, 224U, MAX_uint8_T, 68U, 0U,
    0U, 80U, 192U, 224U, 183U, 220U, 8U, 0U, 80U, 192U, 224U, 54U, 223U, 133U,
    0U, 80U, 192U, 224U, 44U, 73U, 250U, 43U, 80U, 192U, 224U, 44U, 0U, 168U,
    196U, 81U, 192U, 224U, 44U, 0U, 23U, 239U, 183U, 192U, 224U, 44U, 0U, 0U,
    102U, MAX_uint8_T, 192U, 224U, 44U, 0U, 0U, 1U, 195U, 192U, 0U, 0U, 101U,
    213U, 249U, 231U, 148U, 14U, 0U, 0U, 122U, 235U, 80U, 14U, 45U, 195U, 200U,
    5U, 17U, 247U, 91U, 0U, 0U, 0U, 21U, 244U, 92U, 76U, MAX_uint8_T, 11U, 0U,
    0U, 0U, 0U, 183U, 159U, 96U, 243U, 0U, 0U, 0U, 0U, 0U, 160U, 179U, 76U,
    MAX_uint8_T, 12U, 0U, 0U, 0U, 0U, 184U, 159U, 17U, 246U, 94U, 0U, 0U, 0U,
    21U, 245U, 91U, 0U, 122U, 236U, 78U, 13U, 46U, 196U, 200U, 5U, 0U, 0U, 103U,
    215U, 250U, 230U, 148U, 14U, 0U, 224U, MAX_uint8_T, 252U, 229U, 141U, 1U,
    224U, 88U, 8U, 73U, 253U, 75U, 224U, 88U, 0U, 0U, 239U, 89U, 224U, 88U, 20U,
    129U, 239U, 26U, 224U, MAX_uint8_T, 236U, 184U, 52U, 0U, 224U, 88U, 0U, 0U,
    0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U,
    0U, 0U, 0U, 0U, 0U, 101U, 213U, 249U, 231U, 148U, 14U, 0U, 0U, 0U, 122U,
    235U, 80U, 14U, 45U, 195U, 197U, 4U, 0U, 17U, 247U, 91U, 0U, 0U, 0U, 21U,
    244U, 90U, 0U, 76U, MAX_uint8_T, 11U, 0U, 0U, 0U, 0U, 183U, 158U, 0U, 96U,
    243U, 0U, 0U, 0U, 0U, 0U, 160U, 178U, 0U, 76U, MAX_uint8_T, 12U, 0U, 0U, 0U,
    0U, 184U, 157U, 0U, 16U, 245U, 94U, 0U, 0U, 0U, 21U, 244U, 89U, 0U, 0U, 118U,
    236U, 78U, 13U, 46U, 196U, 197U, 5U, 0U, 0U, 0U, 103U, 217U, 250U, 250U,
    215U, 15U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 25U, 187U, 212U, 98U, 15U, 0U, 0U, 0U,
    0U, 0U, 0U, 1U, 87U, 208U, 57U, 224U, MAX_uint8_T, 254U, 231U, 123U, 0U, 0U,
    224U, 88U, 9U, 91U, MAX_uint8_T, 49U, 0U, 224U, 88U, 0U, 4U, 251U, 70U, 0U,
    224U, 88U, 22U, 138U, 225U, 10U, 0U, 224U, MAX_uint8_T, MAX_uint8_T, 214U,
    29U, 0U, 0U, 224U, 88U, 55U, 248U, 47U, 0U, 0U, 224U, 88U, 0U, 152U, 205U,
    4U, 0U, 224U, 88U, 0U, 16U, 232U, 122U, 0U, 224U, 88U, 0U, 0U, 91U, 248U,
    42U, 0U, 101U, 225U, MAX_uint8_T, MAX_uint8_T, 84U, 45U, 242U, 53U, 1U, 0U,
    0U, 78U, 233U, 9U, 0U, 0U, 0U, 11U, 216U, 206U, 55U, 0U, 0U, 0U, 18U, 161U,
    253U, 148U, 5U, 0U, 0U, 0U, 62U, 233U, 143U, 0U, 0U, 0U, 0U, 116U, 208U, 0U,
    0U, 0U, 22U, 187U, 151U, 104U, MAX_uint8_T, MAX_uint8_T, 232U, 153U, 12U,
    228U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 124U, 0U, 0U, 0U, 208U, 104U, 0U, 0U, 0U, 0U, 0U, 0U, 208U,
    104U, 0U, 0U, 0U, 0U, 0U, 0U, 208U, 104U, 0U, 0U, 0U, 0U, 0U, 0U, 208U, 104U,
    0U, 0U, 0U, 0U, 0U, 0U, 208U, 104U, 0U, 0U, 0U, 0U, 0U, 0U, 208U, 104U, 0U,
    0U, 0U, 0U, 0U, 0U, 208U, 104U, 0U, 0U, 0U, 0U, 0U, 0U, 208U, 104U, 0U, 0U,
    0U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U,
    72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U,
    0U, 0U, 208U, 68U, 240U, 75U, 0U, 0U, 0U, 210U, 64U, 214U, 105U, 0U, 0U, 1U,
    235U, 39U, 137U, 216U, 43U, 11U, 110U, 221U, 4U, 12U, 150U, 229U, 243U, 197U,
    51U, 0U, 154U, 157U, 0U, 0U, 0U, 0U, 117U, 158U, 61U, 241U, 9U, 0U, 0U, 0U,
    206U, 69U, 1U, 223U, 87U, 0U, 0U, 40U, 231U, 3U, 0U, 131U, 180U, 0U, 0U,
    129U, 145U, 0U, 0U, 38U, 250U, 21U, 0U, 218U, 55U, 0U, 0U, 0U, 201U, 109U,
    52U, 221U, 0U, 0U, 0U, 0U, 108U, 202U, 142U, 132U, 0U, 0U, 0U, 0U, 20U, 250U,
    240U, 42U, 0U, 0U, 0U, 0U, 0U, 178U, 208U, 0U, 0U, 0U, 221U, 83U, 0U, 0U,
    130U, 231U, 0U, 0U, 0U, 226U, 29U, 157U, 146U, 0U, 0U, 188U, MAX_uint8_T,
    31U, 0U, 39U, 215U, 0U, 93U, 209U, 0U, 3U, 227U, 213U, 87U, 0U, 108U, 146U,
    0U, 30U, 254U, 18U, 49U, 183U, 156U, 143U, 0U, 177U, 76U, 0U, 0U, 222U, 79U,
    108U, 125U, 100U, 199U, 4U, 236U, 12U, 0U, 0U, 159U, 142U, 166U, 67U, 44U,
    248U, 66U, 194U, 0U, 0U, 0U, 95U, 205U, 221U, 12U, 2U, 241U, 183U, 124U, 0U,
    0U, 0U, 31U, 254U, 206U, 0U, 0U, 188U, MAX_uint8_T, 55U, 0U, 0U, 0U, 0U,
    224U, 149U, 0U, 0U, 132U, 239U, 3U, 0U, 0U, 118U, 235U, 19U, 0U, 0U, 91U,
    203U, 3U, 5U, 212U, 157U, 0U, 20U, 230U, 48U, 0U, 0U, 62U, 253U, 60U, 165U,
    136U, 0U, 0U, 0U, 0U, 162U, 231U, 220U, 9U, 0U, 0U, 0U, 0U, 48U, MAX_uint8_T,
    135U, 0U, 0U, 0U, 0U, 0U, 174U, 204U, 243U, 28U, 0U, 0U, 0U, 80U, 214U, 9U,
    201U, 172U, 0U, 0U, 14U, 227U, 59U, 0U, 49U, 252U, 73U, 0U, 151U, 149U, 0U,
    0U, 0U, 143U, 220U, 8U, 159U, 199U, 1U, 0U, 0U, 39U, 231U, 22U, 24U, 242U,
    92U, 0U, 0U, 190U, 102U, 0U, 0U, 120U, 228U, 11U, 96U, 198U, 1U, 0U, 0U, 7U,
    221U, 150U, 231U, 46U, 0U, 0U, 0U, 0U, 81U, MAX_uint8_T, 139U, 0U, 0U, 0U,
    0U, 0U, 0U, MAX_uint8_T, 56U, 0U, 0U, 0U, 0U, 0U, 0U, MAX_uint8_T, 56U, 0U,
    0U, 0U, 0U, 0U, 0U, MAX_uint8_T, 56U, 0U, 0U, 0U, 0U, 0U, 0U, MAX_uint8_T,
    56U, 0U, 0U, 0U, 40U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 176U, 0U, 0U, 0U, 0U, 38U, 246U, 90U, 0U, 0U, 0U, 2U, 197U,
    176U, 0U, 0U, 0U, 0U, 114U, 237U, 24U, 0U, 0U, 0U, 37U, 246U, 91U, 0U, 0U,
    0U, 2U, 196U, 177U, 0U, 0U, 0U, 0U, 113U, 238U, 25U, 0U, 0U, 0U, 36U, 246U,
    93U, 0U, 0U, 0U, 0U, 112U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 176U, 216U, MAX_uint8_T, 120U, 216U, 44U, 0U, 216U,
    44U, 0U, 216U, 44U, 0U, 216U, 44U, 0U, 216U, 44U, 0U, 216U, 44U, 0U, 216U,
    44U, 0U, 216U, 44U, 0U, 216U, 44U, 0U, 216U, MAX_uint8_T, 120U, 184U, 47U,
    0U, 0U, 0U, 111U, 120U, 0U, 0U, 0U, 38U, 193U, 0U, 0U, 0U, 0U, 217U, 14U, 0U,
    0U, 0U, 149U, 82U, 0U, 0U, 0U, 76U, 155U, 0U, 0U, 0U, 10U, 220U, 0U, 0U, 0U,
    0U, 186U, 44U, 0U, 0U, 0U, 114U, 117U, 0U, 0U, 0U, 41U, 190U, 0U, 0U, 0U, 0U,
    218U, 13U, 143U, MAX_uint8_T, 191U, 0U, 67U, 191U, 0U, 67U, 191U, 0U, 67U,
    191U, 0U, 67U, 191U, 0U, 67U, 191U, 0U, 67U, 191U, 0U, 67U, 191U, 0U, 67U,
    191U, 0U, 67U, 191U, 143U, MAX_uint8_T, 191U, 0U, 0U, 0U, 110U, 25U, 0U, 0U,
    0U, 0U, 17U, 235U, 151U, 0U, 0U, 0U, 0U, 137U, 115U, 208U, 36U, 0U, 0U, 26U,
    215U, 7U, 81U, 167U, 0U, 0U, 153U, 96U, 0U, 0U, 198U, 48U, 36U, 208U, 2U, 0U,
    0U, 64U, 183U, 128U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    124U, 64U, 225U, 23U, 0U, 0U, 77U, 175U, 0U, 0U, 60U, 200U, 244U, 183U, 9U,
    0U, 0U, 149U, 44U, 23U, 229U, 87U, 0U, 0U, 0U, 0U, 0U, 188U, 107U, 0U, 0U,
    91U, 205U, 242U, MAX_uint8_T, 108U, 0U, 52U, 242U, 73U, 6U, 188U, 108U, 0U,
    84U, 226U, 27U, 47U, 221U, 137U, 0U, 8U, 182U, 241U, 166U, 92U, 235U, 60U,
    216U, 80U, 0U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 0U, 0U, 216U, 113U, 200U, 243U,
    173U, 14U, 216U, 196U, 45U, 21U, 204U, 137U, 216U, 80U, 0U, 0U, 107U, 207U,
    216U, 80U, 0U, 0U, 90U, 222U, 216U, 125U, 0U, 0U, 119U, 191U, 216U, 246U,
    62U, 34U, 220U, 98U, 216U, 115U, 211U, 244U, 147U, 2U, 0U, 33U, 180U, 240U,
    MAX_uint8_T, 128U, 3U, 212U, 180U, 23U, 0U, 0U, 53U, MAX_uint8_T, 32U, 0U,
    0U, 0U, 78U, 251U, 0U, 0U, 0U, 0U, 46U, MAX_uint8_T, 33U, 0U, 0U, 0U, 0U,
    198U, 183U, 26U, 0U, 0U, 0U, 25U, 178U, 245U, MAX_uint8_T, 148U, 0U, 0U, 0U,
    0U, 0U, 196U, 104U, 0U, 0U, 0U, 0U, 0U, 196U, 104U, 0U, 47U, 208U, 241U,
    154U, 202U, 104U, 1U, 212U, 130U, 15U, 82U, 239U, 104U, 49U, 249U, 8U, 0U,
    0U, 196U, 104U, 79U, 229U, 0U, 0U, 0U, 196U, 104U, 64U, 243U, 2U, 0U, 0U,
    196U, 104U, 12U, 238U, 105U, 11U, 107U, 242U, 104U, 0U, 73U, 221U, 241U,
    130U, 196U, 104U, 0U, 35U, 194U, 241U, 167U, 9U, 2U, 211U, 108U, 15U, 183U,
    115U, 52U, 244U, 2U, 0U, 93U, 186U, 78U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 211U, 47U, 241U, 4U, 0U, 0U, 0U, 0U, 196U, 152U,
    21U, 0U, 0U, 0U, 22U, 170U, 239U, MAX_uint8_T, 208U, 0U, 57U, 218U, 253U,
    196U, 0U, 153U, 160U, 2U, 0U, 136U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    32U, 0U, 160U, 136U, 0U, 0U, 0U, 160U, 136U, 0U, 0U, 0U, 160U, 136U, 0U, 0U,
    0U, 160U, 136U, 0U, 0U, 0U, 160U, 136U, 0U, 0U, 0U, 160U, 136U, 0U, 0U, 0U,
    42U, 204U, 241U, 154U, 202U, 104U, 1U, 208U, 147U, 16U, 76U, 238U, 104U, 49U,
    251U, 14U, 0U, 0U, 196U, 104U, 79U, 230U, 0U, 0U, 0U, 196U, 104U, 61U, 243U,
    2U, 0U, 0U, 196U, 103U, 9U, 234U, 104U, 11U, 105U, 242U, 97U, 0U, 66U, 219U,
    242U, 136U, 203U, 79U, 0U, 0U, 0U, 7U, 77U, 242U, 22U, 0U, 194U, MAX_uint8_T,
    247U, 206U, 71U, 0U, 216U, 80U, 0U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 0U, 0U,
    216U, 103U, 184U, 245U, 171U, 2U, 216U, 222U, 66U, 21U, 239U, 67U, 216U, 95U,
    0U, 0U, 206U, 91U, 216U, 80U, 0U, 0U, 204U, 92U, 216U, 80U, 0U, 0U, 204U,
    92U, 216U, 80U, 0U, 0U, 204U, 92U, 216U, 80U, 0U, 0U, 204U, 92U, 216U, 80U,
    0U, 0U, 216U, 80U, 216U, 80U, 216U, 80U, 216U, 80U, 216U, 80U, 216U, 80U,
    216U, 80U, 0U, 0U, 168U, 128U, 0U, 0U, 0U, 0U, 0U, 0U, 168U, 128U, 0U, 0U,
    168U, 128U, 0U, 0U, 168U, 128U, 0U, 0U, 168U, 128U, 0U, 0U, 168U, 128U, 0U,
    0U, 168U, 128U, 0U, 0U, 170U, 124U, 0U, 10U, 211U, 88U, 232U, 248U, 176U, 7U,
    216U, 80U, 0U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 0U, 0U, 216U, 80U, 0U, 98U,
    208U, 10U, 216U, 80U, 53U, 230U, 34U, 0U, 216U, 102U, 225U, 72U, 0U, 0U,
    216U, 203U, 224U, 12U, 0U, 0U, 216U, 85U, 192U, 176U, 1U, 0U, 216U, 80U, 19U,
    221U, 135U, 0U, 216U, 80U, 0U, 42U, 240U, 93U, 216U, 80U, 216U, 80U, 216U,
    80U, 216U, 80U, 216U, 80U, 216U, 80U, 216U, 80U, 216U, 80U, 216U, 80U, 216U,
    117U, 198U, 245U, 128U, 14U, 184U, 243U, 133U, 0U, 216U, 245U, 80U, 36U,
    251U, 163U, 62U, 61U, 254U, 13U, 216U, 124U, 0U, 0U, 240U, 100U, 0U, 12U,
    MAX_uint8_T, 31U, 216U, 80U, 0U, 0U, 240U, 56U, 0U, 12U, MAX_uint8_T, 32U,
    216U, 80U, 0U, 0U, 240U, 56U, 0U, 12U, MAX_uint8_T, 32U, 216U, 80U, 0U, 0U,
    240U, 56U, 0U, 12U, MAX_uint8_T, 32U, 216U, 80U, 0U, 0U, 240U, 56U, 0U, 12U,
    MAX_uint8_T, 32U, 216U, 103U, 184U, 245U, 171U, 2U, 216U, 222U, 66U, 21U,
    239U, 67U, 216U, 95U, 0U, 0U, 206U, 91U, 216U, 80U, 0U, 0U, 204U, 92U, 216U,
    80U, 0U, 0U, 204U, 92U, 216U, 80U, 0U, 0U, 204U, 92U, 216U, 80U, 0U, 0U,
    204U, 92U, 0U, 35U, 186U, 242U, 216U, 91U, 0U, 3U, 211U, 136U, 14U, 62U,
    242U, 55U, 52U, 249U, 8U, 0U, 0U, 161U, 148U, 79U, 230U, 0U, 0U, 0U, 135U,
    174U, 51U, 248U, 7U, 0U, 0U, 163U, 146U, 2U, 210U, 134U, 13U, 64U, 243U, 53U,
    0U, 33U, 187U, 243U, 215U, 88U, 0U, 216U, 113U, 200U, 243U, 173U, 14U, 216U,
    196U, 45U, 21U, 204U, 137U, 216U, 80U, 0U, 0U, 107U, 207U, 216U, 80U, 0U, 0U,
    90U, 222U, 216U, 104U, 0U, 0U, 119U, 191U, 216U, 209U, 53U, 34U, 220U, 98U,
    216U, 99U, 198U, 244U, 147U, 2U, 216U, 80U, 0U, 0U, 0U, 0U, 216U, 80U, 0U,
    0U, 0U, 0U, 0U, 47U, 208U, 241U, 154U, 202U, 104U, 1U, 212U, 130U, 15U, 82U,
    239U, 104U, 49U, 249U, 8U, 0U, 0U, 196U, 104U, 79U, 229U, 0U, 0U, 0U, 196U,
    104U, 64U, 243U, 2U, 0U, 0U, 196U, 104U, 12U, 238U, 105U, 11U, 107U, 242U,
    104U, 0U, 73U, 221U, 241U, 130U, 196U, 104U, 0U, 0U, 0U, 0U, 0U, 196U, 104U,
    0U, 0U, 0U, 0U, 0U, 196U, 104U, 216U, 115U, 206U, 170U, 216U, 209U, 43U, 0U,
    216U, 87U, 0U, 0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U, 0U,
    216U, 80U, 0U, 0U, 0U, 98U, 230U, MAX_uint8_T, 184U, 0U, 2U, 246U, 59U, 0U,
    0U, 0U, 0U, 226U, 157U, 20U, 0U, 0U, 0U, 46U, 198U, 244U, 107U, 0U, 0U, 0U,
    0U, 88U, 254U, 28U, 0U, 0U, 0U, 56U, 251U, 23U, 20U, MAX_uint8_T,
    MAX_uint8_T, 228U, 98U, 0U, 0U, 191U, 90U, 0U, 0U, 152U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 4U, 0U, 204U, 92U, 0U, 0U, 0U, 204U, 92U, 0U, 0U,
    0U, 204U, 92U, 0U, 0U, 0U, 203U, 93U, 0U, 0U, 0U, 183U, 154U, 4U, 0U, 0U,
    61U, 226U, 251U, 0U, 236U, 60U, 0U, 0U, 220U, 72U, 236U, 60U, 0U, 0U, 220U,
    72U, 236U, 60U, 0U, 0U, 220U, 72U, 236U, 60U, 0U, 0U, 220U, 72U, 235U, 61U,
    0U, 4U, 230U, 72U, 212U, 112U, 21U, 162U, 246U, 72U, 80U, 234U, 227U, 88U,
    220U, 72U, 185U, 109U, 0U, 0U, 30U, 237U, 6U, 99U, 194U, 0U, 0U, 118U, 153U,
    0U, 18U, 248U, 25U, 0U, 208U, 61U, 0U, 0U, 182U, 107U, 40U, 224U, 1U, 0U, 0U,
    96U, 191U, 130U, 133U, 0U, 0U, 0U, 16U, 246U, 228U, 41U, 0U, 0U, 0U, 0U,
    179U, 205U, 0U, 0U, 0U, 203U, 83U, 0U, 12U, 250U, 94U, 0U, 5U, 236U, 12U,
    137U, 147U, 0U, 77U, 234U, 155U, 0U, 66U, 185U, 0U, 71U, 211U, 0U, 147U,
    115U, 216U, 0U, 140U, 109U, 0U, 10U, 248U, 20U, 210U, 11U, 233U, 22U, 213U,
    33U, 0U, 0U, 194U, 113U, 189U, 0U, 173U, 112U, 212U, 0U, 0U, 0U, 128U, 234U,
    120U, 0U, 110U, 234U, 137U, 0U, 0U, 0U, 61U, MAX_uint8_T, 50U, 0U, 47U,
    MAX_uint8_T, 61U, 0U, 0U, 30U, 240U, 76U, 0U, 3U, 205U, 79U, 0U, 95U, 232U,
    20U, 113U, 177U, 0U, 0U, 0U, 173U, 188U, 232U, 29U, 0U, 0U, 0U, 61U,
    MAX_uint8_T, 149U, 0U, 0U, 0U, 3U, 202U, 154U, 242U, 33U, 0U, 0U, 123U, 171U,
    0U, 155U, 195U, 2U, 44U, 228U, 22U, 0U, 12U, 220U, 119U, 187U, 131U, 0U, 0U,
    23U, 240U, 13U, 97U, 220U, 0U, 0U, 114U, 158U, 0U, 14U, 247U, 53U, 0U, 208U,
    59U, 0U, 0U, 172U, 142U, 45U, 216U, 0U, 0U, 0U, 82U, 229U, 142U, 117U, 0U,
    0U, 0U, 7U, 240U, 244U, 23U, 0U, 0U, 0U, 0U, 157U, 175U, 0U, 0U, 0U, 0U, 0U,
    179U, 76U, 0U, 0U, 0U, 0U, 54U, 229U, 3U, 0U, 0U, 0U, 24U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 20U, 0U, 0U, 0U, 2U,
    186U, 174U, 0U, 0U, 0U, 0U, 135U, 215U, 13U, 0U, 0U, 0U, 80U, 241U, 41U, 0U,
    0U, 0U, 39U, 241U, 83U, 0U, 0U, 0U, 12U, 214U, 136U, 0U, 0U, 0U, 0U, 72U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 40U, 0U,
    84U, 223U, 27U, 0U, 235U, 47U, 0U, 0U, 230U, 35U, 0U, 0U, 189U, 61U, 0U, 14U,
    205U, 23U, 0U, 220U, 155U, 0U, 0U, 14U, 204U, 23U, 0U, 0U, 190U, 61U, 0U, 0U,
    230U, 35U, 0U, 0U, 235U, 47U, 0U, 0U, 86U, 224U, 27U, 48U, 172U, 48U, 172U,
    48U, 172U, 48U, 172U, 48U, 172U, 48U, 172U, 48U, 172U, 48U, 172U, 48U, 172U,
    48U, 172U, 48U, 172U, 50U, 216U, 66U, 0U, 0U, 72U, 210U, 0U, 0U, 59U, 205U,
    0U, 0U, 85U, 164U, 0U, 0U, 43U, 190U, 9U, 0U, 0U, 179U, 195U, 0U, 42U, 189U,
    9U, 0U, 85U, 165U, 0U, 0U, 59U, 205U, 0U, 0U, 71U, 210U, 0U, 51U, 217U, 68U,
    0U, 6U, 189U, 242U, 170U, 66U, 27U, 222U, 79U, 168U, 21U, 111U, 206U, 244U,
    110U, 176U, 120U, 0U, 0U, 144U, 87U, 151U, 94U, 158U, 101U, 165U, 108U, 172U,
    115U, 176U, 119U, 176U, 120U, 0U, 0U, 28U, 120U, 0U, 0U, 0U, 102U, 223U,
    MAX_uint8_T, MAX_uint8_T, 32U, 75U, 236U, 80U, 120U, 0U, 0U, 170U, 150U, 28U,
    120U, 0U, 0U, 195U, 125U, 28U, 120U, 0U, 0U, 165U, 158U, 28U, 120U, 0U, 0U,
    65U, 246U, 102U, 120U, 0U, 0U, 0U, 97U, 224U, MAX_uint8_T, MAX_uint8_T, 32U,
    0U, 0U, 28U, 120U, 0U, 0U, 0U, 0U, 114U, 234U, MAX_uint8_T, 80U, 0U, 33U,
    243U, 34U, 0U, 0U, 0U, 76U, 213U, 0U, 0U, 0U, 0U, 84U, 212U, 0U, 0U, 0U, 96U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 24U, 0U, 0U, 84U, 211U, 0U, 0U, 0U,
    0U, 93U, 190U, 0U, 0U, 0U, 18U, 192U, 76U, 0U, 0U, 0U, 140U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 104U, 52U, 117U, 0U, 0U, 0U, 11U,
    160U, 0U, 0U, 165U, 174U, 242U, 220U, 191U, 67U, 0U, 0U, 139U, 147U, 14U,
    44U, 216U, 37U, 0U, 0U, 197U, 29U, 0U, 0U, 134U, 89U, 0U, 0U, 139U, 147U,
    14U, 42U, 215U, 37U, 0U, 0U, 165U, 174U, 242U, 221U, 191U, 67U, 0U, 52U,
    117U, 0U, 0U, 0U, 11U, 160U, 0U, 53U, 246U, 47U, 0U, 0U, 45U, 209U, 12U, 0U,
    132U, 208U, 5U, 10U, 207U, 49U, 0U, 0U, 5U, 207U, 131U, 155U, 111U, 0U, 0U,
    0U, 0U, 46U, 246U, 180U, 0U, 0U, 0U, 0U, 140U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 20U, 0U, 0U, 0U, 0U, 208U, 88U, 0U, 0U, 0U, 0U,
    140U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 20U, 0U, 0U, 0U,
    0U, 208U, 88U, 0U, 0U, 0U, 0U, 0U, 0U, 208U, 88U, 0U, 0U, 0U, 48U, 172U, 48U,
    172U, 48U, 172U, 48U, 172U, 0U, 0U, 0U, 0U, 0U, 0U, 48U, 172U, 48U, 172U,
    48U, 172U, 48U, 172U, 9U, 156U, 235U, MAX_uint8_T, MAX_uint8_T, 32U, 125U,
    179U, 23U, 0U, 0U, 0U, 135U, 171U, 6U, 0U, 0U, 0U, 18U, 237U, 227U, 109U, 6U,
    0U, 115U, 119U, 42U, 163U, 206U, 12U, 156U, 117U, 0U, 0U, 187U, 82U, 43U,
    226U, 128U, 17U, 198U, 36U, 0U, 18U, 135U, 232U, 184U, 0U, 0U, 0U, 0U, 20U,
    212U, 76U, 0U, 0U, 1U, 32U, 209U, 84U, 180U, MAX_uint8_T, 253U, 226U, 130U,
    1U, 252U, 8U, 168U, 88U, 0U, 0U, 45U, 174U, 239U, 246U, 199U, 79U, 0U, 0U,
    0U, 65U, 213U, 86U, 16U, 8U, 61U, 189U, 120U, 0U, 9U, 199U, 22U, 73U, 216U,
    253U, 204U, 2U, 176U, 50U, 75U, 106U, 12U, 227U, 60U, 2U, 0U, 0U, 38U, 141U,
    102U, 66U, 45U, 180U, 0U, 0U, 0U, 0U, 3U, 167U, 74U, 106U, 12U, 224U, 59U,
    3U, 0U, 0U, 48U, 141U, 8U, 199U, 22U, 71U, 216U, 254U, 204U, 3U, 186U, 51U,
    0U, 65U, 213U, 84U, 14U, 9U, 59U, 187U, 124U, 0U, 0U, 0U, 46U, 177U, 241U,
    246U, 198U, 81U, 0U, 0U, 156U, MAX_uint8_T, 233U, 56U, 0U, 2U, 159U, 111U,
    145U, 239U, MAX_uint8_T, 121U, 183U, 237U, 165U, 227U, 0U, 0U, 126U, 72U,
    57U, 141U, 0U, 107U, 164U, 45U, 206U, 21U, 32U, 241U, 16U, 204U, 85U, 0U, 0U,
    107U, 164U, 45U, 206U, 21U, 0U, 0U, 126U, 73U, 57U, 142U, 180U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 60U, 0U, 0U,
    0U, 0U, 0U, 0U, 160U, 60U, 0U, 0U, 0U, 0U, 0U, 0U, 160U, 60U, 32U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 20U, 8U,
    154U, 239U, 221U, 84U, 0U, 132U, 109U, 12U, 35U, 180U, 39U, 152U, 64U, 254U,
    167U, 61U, 91U, 133U, 170U, MAX_uint8_T, 184U, 178U, 39U, 9U, 157U, 240U,
    221U, 86U, 0U, 128U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    124U, 0U, 149U, 244U, 186U, 11U, 18U, 201U, 27U, 160U, 73U, 0U, 149U, 245U,
    186U, 11U, 0U, 0U, 0U, 168U, 52U, 0U, 0U, 0U, 0U, 0U, 0U, 168U, 52U, 0U, 0U,
    0U, 180U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 60U, 0U, 0U, 0U, 168U, 52U, 0U, 0U, 0U, 0U, 0U, 0U, 168U, 52U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 180U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 60U, 0U, MAX_uint8_T,
    250U, 167U, 2U, 0U, 0U, 16U, 221U, 36U, 0U, 0U, 23U, 212U, 5U, 0U, 9U, 188U,
    60U, 0U, 2U, 173U, 82U, 0U, 0U, 32U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    40U, 0U, MAX_uint8_T, 249U, 160U, 0U, 0U, 0U, 44U, 215U, 0U, 0U, 152U, 253U,
    94U, 0U, 0U, 1U, 38U, 225U, 12U, 0U, 0U, 29U, 227U, 19U, 20U, MAX_uint8_T,
    244U, 131U, 0U, 0U, 163U, 151U, 0U, 85U, 166U, 2U, 0U, 216U, 80U, 0U, 0U,
    204U, 92U, 216U, 80U, 0U, 0U, 204U, 92U, 216U, 80U, 0U, 0U, 204U, 92U, 216U,
    80U, 0U, 0U, 204U, 92U, 216U, 81U, 0U, 0U, 216U, 92U, 216U, 144U, 13U, 139U,
    245U, 92U, 216U, 231U, 244U, 122U, 204U, 92U, 216U, 80U, 0U, 0U, 0U, 0U,
    216U, 80U, 0U, 0U, 0U, 0U, 62U, 214U, 249U, MAX_uint8_T, MAX_uint8_T, 8U,
    174U, MAX_uint8_T, MAX_uint8_T, 116U, 176U, 8U, 145U, MAX_uint8_T,
    MAX_uint8_T, 116U, 176U, 8U, 18U, 169U, 243U, 116U, 176U, 8U, 0U, 0U, 72U,
    116U, 176U, 8U, 0U, 0U, 72U, 116U, 176U, 8U, 0U, 0U, 72U, 116U, 176U, 8U, 0U,
    0U, 72U, 116U, 176U, 8U, 0U, 0U, 72U, 116U, 176U, 8U, 0U, 0U, 72U, 116U,
    176U, 8U, 0U, 0U, 72U, 116U, 176U, 8U, 212U, 160U, 0U, 156U, 162U, 0U, 0U,
    18U, 226U, 0U, 4U, MAX_uint8_T, 161U, 0U, 45U, 170U, 42U, 0U, 192U, 235U,
    44U, 0U, 0U, 176U, 44U, 0U, 0U, 176U, 44U, 0U, 0U, 176U, 44U, 0U, 216U,
    MAX_uint8_T, MAX_uint8_T, 88U, 0U, 141U, 241U, 222U, 66U, 48U, 222U, 26U,
    76U, 208U, 48U, 221U, 17U, 76U, 208U, 0U, 144U, 243U, 222U, 68U, 81U, 117U,
    17U, 173U, 7U, 0U, 1U, 171U, 99U, 94U, 174U, 3U, 0U, 21U, 242U, 27U, 189U,
    100U, 1U, 171U, 100U, 94U, 174U, 3U, 81U, 117U, 17U, 174U, 7U, 0U, 19U, 133U,
    106U, 0U, 0U, 0U, 38U, 165U, 0U, 0U, 133U, 222U, 120U, 0U, 0U, 5U, 178U, 20U,
    0U, 0U, 0U, 104U, 120U, 0U, 0U, 132U, 71U, 0U, 0U, 0U, 0U, 104U, 120U, 0U,
    61U, 141U, 1U, 201U, 80U, 0U, 0U, 104U, 120U, 15U, 180U, 8U, 97U, 210U, 80U,
    0U, 0U, 104U, 120U, 157U, 46U, 14U, 171U, 124U, 80U, 0U, 0U, 0U, 90U, 112U,
    0U, 138U, 49U, 124U, 80U, 0U, 0U, 31U, 171U, 1U, 0U, 219U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 8U, 2U, 175U, 26U, 0U, 0U, 0U, 0U, 124U, 80U, 0U,
    19U, 133U, 106U, 0U, 0U, 0U, 103U, 100U, 0U, 0U, 133U, 222U, 120U, 0U, 0U,
    38U, 165U, 0U, 0U, 0U, 0U, 104U, 120U, 0U, 5U, 178U, 20U, 0U, 0U, 0U, 0U,
    104U, 120U, 0U, 134U, 106U, MAX_uint8_T, 246U, 134U, 0U, 0U, 104U, 120U, 62U,
    140U, 0U, 0U, 28U, 243U, 1U, 0U, 104U, 136U, 180U, 7U, 0U, 0U, 60U, 184U, 0U,
    0U, 0U, 158U, 44U, 0U, 0U, 24U, 205U, 28U, 0U, 0U, 92U, 111U, 0U, 0U, 9U,
    191U, 59U, 0U, 0U, 32U, 170U, 1U, 0U, 0U, 68U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 4U, 88U, MAX_uint8_T, 237U, 84U, 0U, 0U, 0U, 134U, 70U, 0U, 0U,
    3U, 124U, 131U, 0U, 0U, 62U, 140U, 0U, 0U, 0U, 240U, 229U, 30U, 0U, 16U,
    180U, 7U, 0U, 0U, 0U, 5U, 101U, 171U, 0U, 158U, 46U, 201U, 80U, 0U, 0U, 1U,
    88U, 186U, 92U, 111U, 97U, 210U, 80U, 0U, 108U, MAX_uint8_T, 226U, 95U, 170U,
    15U, 171U, 124U, 80U, 0U, 0U, 0U, 3U, 175U, 25U, 138U, 49U, 124U, 80U, 0U,
    0U, 0U, 124U, 80U, 0U, 219U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 8U, 0U,
    53U, 149U, 0U, 0U, 0U, 0U, 124U, 80U, 0U, 0U, 0U, 140U, 156U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 142U, 145U, 0U, 0U, 0U, 181U, 87U, 0U, 0U, 90U, 195U, 1U, 0U,
    67U, 236U, 29U, 0U, 0U, 177U, 144U, 0U, 0U, 0U, 164U, 185U, 18U, 0U, 0U, 28U,
    184U, 244U, MAX_uint8_T, 220U, 0U, 0U, 74U, 222U, 17U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 87U, 166U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 166U, 236U, 6U, 0U, 0U, 0U, 0U, 0U, 16U, 243U, 246U, 83U, 0U, 0U, 0U,
    0U, 0U, 106U, 187U, 171U, 179U, 0U, 0U, 0U, 0U, 0U, 204U, 101U, 85U, 251U,
    23U, 0U, 0U, 0U, 46U, 251U, 20U, 10U, 244U, 115U, 0U, 0U, 0U, 145U, 186U, 0U,
    0U, 167U, 211U, 0U, 0U, 6U, 236U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 51U, 0U, 85U, 235U, 10U, 0U, 0U, 4U, 224U, 147U,
    0U, 183U, 124U, 0U, 0U, 0U, 0U, 108U, 236U, 6U, 0U, 0U, 0U, 0U, 170U, 143U,
    0U, 0U, 0U, 0U, 0U, 0U, 94U, 158U, 1U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 166U, 236U, 6U, 0U, 0U, 0U, 0U, 0U, 16U, 243U, 246U,
    83U, 0U, 0U, 0U, 0U, 0U, 106U, 187U, 171U, 179U, 0U, 0U, 0U, 0U, 0U, 204U,
    101U, 85U, 251U, 23U, 0U, 0U, 0U, 46U, 251U, 20U, 10U, 244U, 115U, 0U, 0U,
    0U, 145U, 186U, 0U, 0U, 167U, 211U, 0U, 0U, 6U, 236U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 51U, 0U, 85U, 235U, 10U,
    0U, 0U, 4U, 224U, 147U, 0U, 183U, 124U, 0U, 0U, 0U, 0U, 108U, 236U, 6U, 0U,
    0U, 6U, 206U, 229U, 45U, 0U, 0U, 0U, 0U, 0U, 138U, 109U, 45U, 193U, 7U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 166U, 236U, 6U, 0U, 0U,
    0U, 0U, 0U, 16U, 243U, 246U, 83U, 0U, 0U, 0U, 0U, 0U, 106U, 187U, 171U, 179U,
    0U, 0U, 0U, 0U, 0U, 204U, 101U, 85U, 251U, 23U, 0U, 0U, 0U, 46U, 251U, 20U,
    10U, 244U, 115U, 0U, 0U, 0U, 145U, 186U, 0U, 0U, 167U, 211U, 0U, 0U, 6U,
    236U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 51U,
    0U, 85U, 235U, 10U, 0U, 0U, 4U, 224U, 147U, 0U, 183U, 124U, 0U, 0U, 0U, 0U,
    108U, 236U, 6U, 0U, 0U, 114U, 232U, 70U, 194U, 6U, 0U, 0U, 0U, 0U, 190U, 44U,
    206U, 173U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 166U,
    236U, 6U, 0U, 0U, 0U, 0U, 0U, 16U, 243U, 246U, 83U, 0U, 0U, 0U, 0U, 0U, 106U,
    187U, 171U, 179U, 0U, 0U, 0U, 0U, 0U, 204U, 101U, 85U, 251U, 23U, 0U, 0U, 0U,
    46U, 251U, 20U, 10U, 244U, 115U, 0U, 0U, 0U, 145U, 186U, 0U, 0U, 167U, 211U,
    0U, 0U, 6U, 236U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 51U, 0U, 85U, 235U, 10U, 0U, 0U, 4U, 224U, 147U, 0U, 183U, 124U,
    0U, 0U, 0U, 0U, 108U, 236U, 6U, 0U, 0U, 140U, 120U, 56U, 200U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 166U, 236U, 6U, 0U, 0U, 0U,
    0U, 0U, 16U, 243U, 246U, 83U, 0U, 0U, 0U, 0U, 0U, 106U, 187U, 171U, 179U, 0U,
    0U, 0U, 0U, 0U, 204U, 101U, 85U, 251U, 23U, 0U, 0U, 0U, 46U, 251U, 20U, 10U,
    244U, 115U, 0U, 0U, 0U, 145U, 186U, 0U, 0U, 167U, 211U, 0U, 0U, 6U, 236U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 51U, 0U,
    85U, 235U, 10U, 0U, 0U, 4U, 224U, 147U, 0U, 183U, 124U, 0U, 0U, 0U, 0U, 108U,
    236U, 6U, 0U, 0U, 3U, 187U, 227U, 38U, 0U, 0U, 0U, 0U, 0U, 34U, 143U, 69U,
    113U, 0U, 0U, 0U, 0U, 0U, 3U, 187U, 228U, 39U, 0U, 0U, 0U, 0U, 0U, 0U, 166U,
    236U, 6U, 0U, 0U, 0U, 0U, 0U, 16U, 243U, 246U, 83U, 0U, 0U, 0U, 0U, 0U, 106U,
    187U, 171U, 179U, 0U, 0U, 0U, 0U, 0U, 204U, 101U, 85U, 251U, 23U, 0U, 0U, 0U,
    46U, 251U, 20U, 10U, 244U, 115U, 0U, 0U, 0U, 145U, 186U, 0U, 0U, 167U, 211U,
    0U, 0U, 6U, 236U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 51U, 0U, 85U, 235U, 10U, 0U, 0U, 4U, 224U, 147U, 0U, 183U, 124U,
    0U, 0U, 0U, 0U, 108U, 236U, 6U, 0U, 0U, 0U, 0U, 37U, 250U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 84U, 0U, 0U, 0U, 0U, 176U, 233U, 180U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 63U, 228U, 143U, 180U, 0U, 0U, 0U, 0U, 0U, 0U,
    1U, 204U, 107U, 136U, 180U, 0U, 0U, 0U, 0U, 0U, 0U, 94U, 228U, 7U, 136U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 188U, 0U, 0U, 10U, 227U, 107U, 0U,
    136U, 180U, 0U, 0U, 0U, 0U, 0U, 125U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 180U, 0U, 0U, 0U, 0U, 24U, 243U, 74U, 0U, 0U, 136U, 180U, 0U,
    0U, 0U, 0U, 156U, 149U, 0U, 0U, 0U, 136U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 152U, 0U, 0U, 98U, 207U, 248U, MAX_uint8_T,
    MAX_uint8_T, 160U, 0U, 125U, 240U, 93U, 18U, 0U, 0U, 0U, 19U, 248U, 99U, 0U,
    0U, 0U, 0U, 0U, 77U, MAX_uint8_T, 13U, 0U, 0U, 0U, 0U, 0U, 96U, 244U, 0U, 0U,
    0U, 0U, 0U, 0U, 78U, MAX_uint8_T, 15U, 0U, 0U, 0U, 0U, 0U, 21U, 250U, 108U,
    0U, 0U, 0U, 0U, 0U, 0U, 135U, 244U, 104U, 23U, 0U, 0U, 0U, 0U, 1U, 107U,
    211U, 249U, MAX_uint8_T, MAX_uint8_T, 164U, 0U, 0U, 0U, 0U, 193U, 124U, 0U,
    0U, 0U, 0U, 0U, 0U, 36U, 208U, 0U, 0U, 0U, 0U, 0U, 44U, 253U, 123U, 0U, 0U,
    9U, 194U, 109U, 0U, 0U, 0U, 0U, 14U, 196U, 42U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 224U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 248U, 0U, 224U, 88U, 0U, 0U,
    0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 96U, 0U, 224U, 88U, 0U, 0U, 0U, 0U,
    224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 56U, 0U, 0U, 71U, 218U, 24U, 0U, 0U,
    19U, 202U, 31U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 224U, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, 248U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U,
    0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 96U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U,
    224U, 88U, 0U, 0U, 0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 56U, 0U, 99U, 235U, 153U, 0U, 0U, 34U, 196U, 18U, 167U, 78U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 248U,
    0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U,
    0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 96U, 0U, 224U, 88U, 0U,
    0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 56U, 0U, MAX_uint8_T, 4U,
    172U, 84U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 248U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U,
    224U, 88U, 0U, 0U, 0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 96U,
    0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U,
    0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 56U, 3U,
    173U, 137U, 0U, 0U, 6U, 183U, 64U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, 88U, 0U, 0U,
    228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U,
    228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 35U,
    228U, 50U, 3U, 189U, 61U, 0U, 0U, 0U, 0U, 0U, 0U, 228U, 88U, 0U, 0U, 228U,
    88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U,
    88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 67U,
    233U, 184U, 1U, 17U, 199U, 29U, 137U, 109U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 228U,
    88U, 0U, 0U, 0U, 228U, 88U, 0U, 0U, 0U, 228U, 88U, 0U, 0U, 0U, 228U, 88U, 0U,
    0U, 0U, 228U, 88U, 0U, 0U, 0U, 228U, 88U, 0U, 0U, 0U, 228U, 88U, 0U, 0U, 0U,
    228U, 88U, 0U, 0U, 0U, 228U, 88U, 0U, 240U, 20U, 156U, 100U, 0U, 0U, 0U, 0U,
    0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U,
    0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U, 0U, 228U, 88U, 0U,
    0U, 228U, 88U, 0U, 0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T, 247U, 215U, 119U,
    2U, 0U, 0U, 0U, 224U, 88U, 2U, 19U, 87U, 239U, 135U, 0U, 0U, 0U, 224U, 88U,
    0U, 0U, 0U, 98U, 247U, 21U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 11U, MAX_uint8_T,
    68U, 48U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 76U, 0U, 0U,
    244U, 89U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 15U, MAX_uint8_T, 65U, 0U, 0U,
    224U, 88U, 0U, 0U, 0U, 102U, 240U, 10U, 0U, 0U, 224U, 88U, 0U, 23U, 93U,
    240U, 106U, 0U, 0U, 0U, 224U, MAX_uint8_T, MAX_uint8_T, 246U, 201U, 86U, 0U,
    0U, 0U, 21U, 228U, 158U, 88U, 121U, 0U, 0U, 82U, 122U, 125U, 238U, 46U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 224U, 163U, 0U, 0U, 0U, 80U, 192U, 224U,
    MAX_uint8_T, 68U, 0U, 0U, 80U, 192U, 224U, 183U, 220U, 8U, 0U, 80U, 192U,
    224U, 54U, 223U, 133U, 0U, 80U, 192U, 224U, 44U, 73U, 250U, 43U, 80U, 192U,
    224U, 44U, 0U, 168U, 196U, 81U, 192U, 224U, 44U, 0U, 23U, 239U, 183U, 192U,
    224U, 44U, 0U, 0U, 102U, MAX_uint8_T, 192U, 224U, 44U, 0U, 0U, 1U, 195U,
    192U, 0U, 0U, 6U, 185U, 121U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 10U, 191U, 51U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 101U, 213U, 249U, 231U,
    148U, 14U, 0U, 0U, 122U, 235U, 80U, 14U, 45U, 195U, 200U, 5U, 17U, 247U, 91U,
    0U, 0U, 0U, 21U, 244U, 92U, 76U, MAX_uint8_T, 11U, 0U, 0U, 0U, 0U, 183U,
    159U, 96U, 243U, 0U, 0U, 0U, 0U, 0U, 160U, 179U, 76U, MAX_uint8_T, 12U, 0U,
    0U, 0U, 0U, 184U, 159U, 17U, 246U, 94U, 0U, 0U, 0U, 21U, 245U, 91U, 0U, 122U,
    236U, 78U, 13U, 46U, 196U, 200U, 5U, 0U, 0U, 103U, 215U, 250U, 230U, 148U,
    14U, 0U, 0U, 0U, 0U, 0U, 45U, 227U, 40U, 0U, 0U, 0U, 0U, 0U, 7U, 196U, 50U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 101U, 213U, 249U,
    231U, 148U, 14U, 0U, 0U, 122U, 235U, 80U, 14U, 45U, 195U, 200U, 5U, 17U,
    247U, 91U, 0U, 0U, 0U, 21U, 244U, 92U, 76U, MAX_uint8_T, 11U, 0U, 0U, 0U, 0U,
    183U, 159U, 96U, 243U, 0U, 0U, 0U, 0U, 0U, 160U, 179U, 76U, MAX_uint8_T, 12U,
    0U, 0U, 0U, 0U, 184U, 159U, 17U, 246U, 94U, 0U, 0U, 0U, 21U, 245U, 91U, 0U,
    122U, 236U, 78U, 13U, 46U, 196U, 200U, 5U, 0U, 0U, 103U, 215U, 250U, 230U,
    148U, 14U, 0U, 0U, 0U, 0U, 82U, 235U, 169U, 0U, 0U, 0U, 0U, 0U, 25U, 199U,
    22U, 152U, 93U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 101U,
    213U, 249U, 231U, 148U, 14U, 0U, 0U, 122U, 235U, 80U, 14U, 45U, 195U, 200U,
    5U, 17U, 247U, 91U, 0U, 0U, 0U, 21U, 244U, 92U, 76U, MAX_uint8_T, 11U, 0U,
    0U, 0U, 0U, 183U, 159U, 96U, 243U, 0U, 0U, 0U, 0U, 0U, 160U, 179U, 76U,
    MAX_uint8_T, 12U, 0U, 0U, 0U, 0U, 184U, 159U, 17U, 246U, 94U, 0U, 0U, 0U,
    21U, 245U, 91U, 0U, 122U, 236U, 78U, 13U, 46U, 196U, 200U, 5U, 0U, 0U, 103U,
    215U, 250U, 230U, 148U, 14U, 0U, 0U, 0U, 8U, 218U, 175U, 69U, 145U, 0U, 0U,
    0U, 0U, 58U, 144U, 106U, 239U, 65U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 101U, 213U, 249U, 231U, 148U, 14U, 0U, 0U, 122U, 235U, 80U, 14U,
    45U, 195U, 200U, 5U, 17U, 247U, 91U, 0U, 0U, 0U, 21U, 244U, 92U, 76U,
    MAX_uint8_T, 11U, 0U, 0U, 0U, 0U, 183U, 159U, 96U, 243U, 0U, 0U, 0U, 0U, 0U,
    160U, 179U, 76U, MAX_uint8_T, 12U, 0U, 0U, 0U, 0U, 184U, 159U, 17U, 246U,
    94U, 0U, 0U, 0U, 21U, 245U, 91U, 0U, 122U, 236U, 78U, 13U, 46U, 196U, 200U,
    5U, 0U, 0U, 103U, 215U, 250U, 230U, 148U, 14U, 0U, 0U, 0U, 0U, MAX_uint8_T,
    4U, 172U, 84U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 101U,
    213U, 249U, 231U, 148U, 14U, 0U, 0U, 122U, 235U, 80U, 14U, 45U, 195U, 200U,
    5U, 17U, 247U, 91U, 0U, 0U, 0U, 21U, 244U, 92U, 76U, MAX_uint8_T, 11U, 0U,
    0U, 0U, 0U, 183U, 159U, 96U, 243U, 0U, 0U, 0U, 0U, 0U, 160U, 179U, 76U,
    MAX_uint8_T, 12U, 0U, 0U, 0U, 0U, 184U, 159U, 17U, 246U, 94U, 0U, 0U, 0U,
    21U, 245U, 91U, 0U, 122U, 236U, 78U, 13U, 46U, 196U, 200U, 5U, 0U, 0U, 103U,
    215U, 250U, 230U, 148U, 14U, 0U, 109U, 107U, 0U, 0U, 0U, 17U, 183U, 13U, 7U,
    184U, 106U, 0U, 17U, 201U, 78U, 0U, 0U, 10U, 193U, 118U, 203U, 88U, 0U, 0U,
    0U, 0U, 28U, 249U, 160U, 0U, 0U, 0U, 0U, 10U, 193U, 118U, 204U, 88U, 0U, 0U,
    6U, 184U, 106U, 0U, 18U, 201U, 77U, 0U, 108U, 107U, 0U, 0U, 0U, 18U, 183U,
    13U, 0U, 0U, 102U, 213U, 248U, 225U, 140U, 187U, 71U, 0U, 122U, 235U, 79U,
    13U, 43U, 216U, 219U, 4U, 17U, 247U, 91U, 0U, 0U, 69U, 188U, 244U, 91U, 76U,
    MAX_uint8_T, 11U, 0U, 32U, 206U, 20U, 180U, 158U, 95U, 242U, 0U, 9U, 198U,
    51U, 0U, 159U, 179U, 75U, MAX_uint8_T, 10U, 163U, 96U, 0U, 0U, 184U, 159U,
    16U, 246U, 183U, 149U, 0U, 0U, 21U, 245U, 91U, 0U, 137U, 253U, 82U, 12U, 45U,
    195U, 200U, 5U, 17U, 206U, 114U, 208U, 246U, 233U, 150U, 15U, 0U, 0U, 56U,
    227U, 29U, 0U, 0U, 0U, 0U, 0U, 68U, 183U, 2U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U,
    72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U,
    0U, 0U, 208U, 68U, 240U, 75U, 0U, 0U, 0U, 210U, 64U, 214U, 105U, 0U, 0U, 1U,
    235U, 39U, 137U, 216U, 43U, 11U, 110U, 221U, 4U, 12U, 150U, 229U, 243U, 197U,
    51U, 0U, 0U, 0U, 0U, 147U, 165U, 2U, 0U, 0U, 0U, 70U, 178U, 4U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U, 0U,
    0U, 208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U,
    68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 240U, 75U, 0U, 0U, 0U, 210U, 64U,
    214U, 105U, 0U, 0U, 1U, 235U, 39U, 137U, 216U, 43U, 11U, 110U, 221U, 4U, 12U,
    150U, 229U, 243U, 197U, 51U, 0U, 0U, 2U, 191U, 232U, 60U, 0U, 0U, 0U, 118U,
    129U, 34U, 198U, 14U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, 72U, 0U, 0U, 0U,
    208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U,
    68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U,
    240U, 75U, 0U, 0U, 0U, 210U, 64U, 214U, 105U, 0U, 0U, 1U, 235U, 39U, 137U,
    216U, 43U, 11U, 110U, 221U, 4U, 12U, 150U, 229U, 243U, 197U, 51U, 0U, 0U,
    132U, 128U, 48U, 208U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, 72U, 0U, 0U,
    0U, 208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U,
    68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U, 244U, 72U, 0U, 0U, 0U, 208U, 68U,
    240U, 75U, 0U, 0U, 0U, 210U, 64U, 214U, 105U, 0U, 0U, 1U, 235U, 39U, 137U,
    216U, 43U, 11U, 110U, 221U, 4U, 12U, 150U, 229U, 243U, 197U, 51U, 0U, 0U, 0U,
    0U, 30U, 227U, 55U, 0U, 0U, 0U, 0U, 2U, 184U, 67U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 159U, 199U, 1U, 0U, 0U, 39U, 231U, 22U, 24U, 242U, 92U,
    0U, 0U, 190U, 102U, 0U, 0U, 120U, 228U, 11U, 96U, 198U, 1U, 0U, 0U, 7U, 221U,
    150U, 231U, 46U, 0U, 0U, 0U, 0U, 81U, MAX_uint8_T, 139U, 0U, 0U, 0U, 0U, 0U,
    0U, MAX_uint8_T, 56U, 0U, 0U, 0U, 0U, 0U, 0U, MAX_uint8_T, 56U, 0U, 0U, 0U,
    0U, 0U, 0U, MAX_uint8_T, 56U, 0U, 0U, 0U, 0U, 0U, 0U, MAX_uint8_T, 56U, 0U,
    0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U,
    MAX_uint8_T, 252U, 229U, 141U, 1U, 224U, 88U, 8U, 73U, 253U, 75U, 224U, 88U,
    0U, 0U, 238U, 89U, 224U, 88U, 16U, 126U, 239U, 26U, 224U, MAX_uint8_T, 236U,
    184U, 52U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 224U, 88U, 0U, 0U, 0U, 0U, 60U,
    219U, 246U, 185U, 17U, 0U, 182U, 133U, 20U, 218U, 96U, 0U, 212U, 80U, 12U,
    229U, 39U, 0U, 216U, 80U, 136U, 140U, 0U, 0U, 216U, 80U, 172U, 105U, 0U, 0U,
    216U, 80U, 20U, 165U, 142U, 11U, 216U, 80U, 0U, 0U, 122U, 164U, 216U, 80U,
    0U, 1U, 121U, 193U, 216U, 80U, 224U, MAX_uint8_T, 220U, 62U, 0U, 36U, 226U,
    50U, 0U, 0U, 0U, 0U, 0U, 45U, 197U, 9U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 60U, 200U, 244U, 183U, 9U, 0U, 0U, 149U, 44U, 23U, 229U, 87U, 0U, 0U, 0U,
    0U, 0U, 188U, 107U, 0U, 0U, 91U, 205U, 242U, MAX_uint8_T, 108U, 0U, 52U,
    242U, 73U, 6U, 188U, 108U, 0U, 84U, 226U, 27U, 47U, 221U, 137U, 0U, 8U, 182U,
    241U, 166U, 92U, 235U, 60U, 0U, 0U, 0U, 115U, 191U, 8U, 0U, 0U, 0U, 45U,
    195U, 13U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 60U, 200U, 244U, 183U, 9U,
    0U, 0U, 149U, 44U, 23U, 229U, 87U, 0U, 0U, 0U, 0U, 0U, 188U, 107U, 0U, 0U,
    91U, 205U, 242U, MAX_uint8_T, 108U, 0U, 52U, 242U, 73U, 6U, 188U, 108U, 0U,
    84U, 226U, 27U, 47U, 221U, 137U, 0U, 8U, 182U, 241U, 166U, 92U, 235U, 60U,
    0U, 0U, 166U, 235U, 85U, 0U, 0U, 0U, 89U, 156U, 21U, 198U, 27U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 60U, 200U, 244U, 183U, 9U, 0U, 0U, 149U, 44U, 23U,
    229U, 87U, 0U, 0U, 0U, 0U, 0U, 188U, 107U, 0U, 0U, 91U, 205U, 242U,
    MAX_uint8_T, 108U, 0U, 52U, 242U, 73U, 6U, 188U, 108U, 0U, 84U, 226U, 27U,
    47U, 221U, 137U, 0U, 8U, 182U, 241U, 166U, 92U, 235U, 60U, 0U, 67U, 239U,
    107U, 145U, 57U, 0U, 0U, 146U, 69U, 174U, 217U, 7U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 60U, 200U, 244U, 183U, 9U, 0U, 0U, 149U, 44U, 23U, 229U, 87U, 0U,
    0U, 0U, 0U, 0U, 188U, 107U, 0U, 0U, 91U, 205U, 242U, MAX_uint8_T, 108U, 0U,
    52U, 242U, 73U, 6U, 188U, 108U, 0U, 84U, 226U, 27U, 47U, 221U, 137U, 0U, 8U,
    182U, 241U, 166U, 92U, 235U, 60U, 0U, 88U, 172U, 4U, 252U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 60U, 200U, 244U, 183U, 9U, 0U, 0U, 149U, 44U, 23U,
    229U, 87U, 0U, 0U, 0U, 0U, 0U, 188U, 107U, 0U, 0U, 91U, 205U, 242U,
    MAX_uint8_T, 108U, 0U, 52U, 242U, 73U, 6U, 188U, 108U, 0U, 84U, 226U, 27U,
    47U, 221U, 137U, 0U, 8U, 182U, 241U, 166U, 92U, 235U, 60U, 0U, 0U, 148U,
    238U, 69U, 0U, 0U, 0U, 0U, 172U, 39U, 148U, 0U, 0U, 0U, 0U, 148U, 239U, 71U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 60U, 200U, 244U, 183U, 9U, 0U, 0U,
    149U, 44U, 23U, 229U, 87U, 0U, 0U, 0U, 0U, 0U, 188U, 107U, 0U, 0U, 91U, 205U,
    242U, MAX_uint8_T, 108U, 0U, 52U, 242U, 73U, 6U, 188U, 108U, 0U, 84U, 226U,
    27U, 47U, 221U, 137U, 0U, 8U, 182U, 241U, 166U, 92U, 235U, 60U, 0U, 60U,
    200U, 240U, 163U, 116U, 232U, 220U, 70U, 0U, 0U, 149U, 44U, 23U, 229U, 226U,
    31U, 71U, 233U, 4U, 0U, 0U, 0U, 0U, 188U, 141U, 0U, 0U, 232U, 56U, 0U, 91U,
    205U, 242U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    80U, 52U, 242U, 73U, 6U, 188U, 136U, 0U, 0U, 0U, 0U, 84U, 226U, 27U, 54U,
    201U, 238U, 64U, 5U, 0U, 0U, 8U, 182U, 246U, 176U, 21U, 115U, 229U,
    MAX_uint8_T, MAX_uint8_T, 92U, 0U, 33U, 180U, 240U, MAX_uint8_T, 128U, 3U,
    212U, 180U, 23U, 0U, 0U, 53U, MAX_uint8_T, 32U, 0U, 0U, 0U, 78U, 251U, 0U,
    0U, 0U, 0U, 46U, MAX_uint8_T, 33U, 0U, 0U, 0U, 0U, 198U, 183U, 26U, 0U, 0U,
    0U, 25U, 178U, 245U, MAX_uint8_T, 148U, 0U, 0U, 1U, 199U, 117U, 0U, 0U, 0U,
    0U, 43U, 202U, 0U, 0U, 0U, 52U, 252U, 115U, 0U, 0U, 41U, 227U, 45U, 0U, 0U,
    0U, 0U, 51U, 195U, 7U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 35U, 194U, 241U, 167U,
    9U, 2U, 211U, 108U, 15U, 183U, 115U, 52U, 244U, 2U, 0U, 93U, 186U, 78U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 211U, 47U, 241U, 4U, 0U,
    0U, 0U, 0U, 196U, 152U, 21U, 0U, 0U, 0U, 22U, 170U, 239U, MAX_uint8_T, 208U,
    0U, 0U, 0U, 123U, 185U, 6U, 0U, 0U, 51U, 191U, 10U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 35U, 194U, 241U, 167U, 9U, 2U, 211U, 108U, 15U, 183U, 115U, 52U,
    244U, 2U, 0U, 93U, 186U, 78U, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, 211U, 47U, 241U, 4U, 0U, 0U, 0U, 0U, 196U, 152U, 21U, 0U, 0U,
    0U, 22U, 170U, 239U, MAX_uint8_T, 208U, 0U, 0U, 147U, 235U, 105U, 0U, 0U,
    70U, 173U, 16U, 193U, 39U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 35U, 194U, 241U, 167U,
    9U, 2U, 211U, 108U, 15U, 183U, 115U, 52U, 244U, 2U, 0U, 93U, 186U, 78U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 211U, 47U, 241U, 4U, 0U,
    0U, 0U, 0U, 196U, 152U, 21U, 0U, 0U, 0U, 22U, 170U, 239U, MAX_uint8_T, 208U,
    0U, 52U, 208U, 0U, 224U, 32U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 35U, 194U, 241U,
    167U, 9U, 2U, 211U, 108U, 15U, 183U, 115U, 52U, 244U, 2U, 0U, 93U, 186U, 78U,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 211U, 47U, 241U, 4U, 0U,
    0U, 0U, 0U, 196U, 152U, 21U, 0U, 0U, 0U, 22U, 170U, 239U, MAX_uint8_T, 208U,
    3U, 173U, 137U, 0U, 0U, 6U, 183U, 64U, 0U, 0U, 0U, 0U, 0U, 0U, 216U, 80U, 0U,
    0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U,
    0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U, 35U, 228U, 50U, 3U, 189U, 61U, 0U, 0U,
    0U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U, 0U,
    216U, 80U, 0U, 0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U, 0U,
    67U, 233U, 184U, 1U, 17U, 199U, 29U, 137U, 109U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    216U, 80U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 0U, 216U,
    80U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 0U, 216U, 80U, 0U,
    240U, 20U, 156U, 100U, 0U, 0U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U,
    0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U, 0U, 216U, 80U, 0U,
    0U, 216U, 80U, 0U, 0U, 1U, 5U, 139U, 56U, 0U, 0U, 90U, 227U, 251U, 226U, 21U,
    0U, 0U, 0U, 86U, 114U, 105U, 219U, 25U, 0U, 0U, 36U, 190U, 243U, 248U, 190U,
    0U, 3U, 214U, 144U, 15U, 70U, 250U, 54U, 57U, 250U, 10U, 0U, 0U, 181U, 117U,
    83U, 231U, 0U, 0U, 0U, 159U, 139U, 54U, 251U, 12U, 0U, 0U, 194U, 109U, 2U,
    210U, 147U, 15U, 89U, 243U, 24U, 0U, 33U, 187U, 242U, 208U, 63U, 0U, 0U,
    168U, 211U, 45U, 192U, 0U, 2U, 198U, 64U, 229U, 119U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 216U, 103U, 184U, 245U, 171U, 2U, 216U, 222U, 66U, 21U, 239U, 67U, 216U,
    95U, 0U, 0U, 206U, 91U, 216U, 80U, 0U, 0U, 204U, 92U, 216U, 80U, 0U, 0U,
    204U, 92U, 216U, 80U, 0U, 0U, 204U, 92U, 216U, 80U, 0U, 0U, 204U, 92U, 0U,
    5U, 182U, 125U, 0U, 0U, 0U, 0U, 0U, 9U, 189U, 54U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 35U, 186U, 242U, 216U, 91U, 0U, 3U, 211U, 136U, 14U, 62U,
    242U, 55U, 52U, 249U, 8U, 0U, 0U, 161U, 148U, 79U, 230U, 0U, 0U, 0U, 135U,
    174U, 51U, 248U, 7U, 0U, 0U, 163U, 146U, 2U, 210U, 134U, 13U, 64U, 243U, 53U,
    0U, 33U, 187U, 243U, 215U, 88U, 0U, 0U, 0U, 0U, 42U, 228U, 43U, 0U, 0U, 0U,
    6U, 194U, 53U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 35U, 186U, 242U, 216U,
    91U, 0U, 3U, 211U, 136U, 14U, 62U, 242U, 55U, 52U, 249U, 8U, 0U, 0U, 161U,
    148U, 79U, 230U, 0U, 0U, 0U, 135U, 174U, 51U, 248U, 7U, 0U, 0U, 163U, 146U,
    2U, 210U, 134U, 13U, 64U, 243U, 53U, 0U, 33U, 187U, 243U, 215U, 88U, 0U, 0U,
    0U, 78U, 234U, 173U, 0U, 0U, 0U, 23U, 199U, 24U, 149U, 97U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 35U, 186U, 242U, 216U, 91U, 0U, 3U, 211U, 136U, 14U, 62U,
    242U, 55U, 52U, 249U, 8U, 0U, 0U, 161U, 148U, 79U, 230U, 0U, 0U, 0U, 135U,
    174U, 51U, 248U, 7U, 0U, 0U, 163U, 146U, 2U, 210U, 134U, 13U, 64U, 243U, 53U,
    0U, 33U, 187U, 243U, 215U, 88U, 0U, 0U, 7U, 216U, 178U, 66U, 149U, 0U, 0U,
    54U, 148U, 103U, 239U, 68U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 35U, 186U,
    242U, 216U, 91U, 0U, 3U, 211U, 136U, 14U, 62U, 242U, 55U, 52U, 249U, 8U, 0U,
    0U, 161U, 148U, 79U, 230U, 0U, 0U, 0U, 135U, 174U, 51U, 248U, 7U, 0U, 0U,
    163U, 146U, 2U, 210U, 134U, 13U, 64U, 243U, 53U, 0U, 33U, 187U, 243U, 215U,
    88U, 0U, 0U, 0U, 252U, 8U, 168U, 88U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    35U, 186U, 242U, 216U, 91U, 0U, 3U, 211U, 136U, 14U, 62U, 242U, 55U, 52U,
    249U, 8U, 0U, 0U, 161U, 148U, 79U, 230U, 0U, 0U, 0U, 135U, 174U, 51U, 248U,
    7U, 0U, 0U, 163U, 146U, 2U, 210U, 134U, 13U, 64U, 243U, 53U, 0U, 33U, 187U,
    243U, 215U, 88U, 0U, 0U, 0U, 0U, 244U, 128U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 180U, MAX_uint8_T, MAX_uint8_T,
    MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, MAX_uint8_T, 60U, 0U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 244U, 128U, 0U, 0U,
    0U, 0U, 33U, 185U, 242U, 221U, 179U, 89U, 2U, 210U, 135U, 14U, 114U,
    MAX_uint8_T, 53U, 51U, 248U, 7U, 21U, 188U, 185U, 147U, 79U, 229U, 2U, 176U,
    43U, 137U, 175U, 54U, 249U, 141U, 90U, 0U, 161U, 147U, 2U, 213U, 201U, 12U,
    62U, 242U, 55U, 20U, 191U, 190U, 245U, 217U, 91U, 0U, 5U, 182U, 125U, 0U, 0U,
    0U, 0U, 9U, 189U, 54U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 236U, 60U, 0U, 0U,
    220U, 72U, 236U, 60U, 0U, 0U, 220U, 72U, 236U, 60U, 0U, 0U, 220U, 72U, 236U,
    60U, 0U, 0U, 220U, 72U, 235U, 61U, 0U, 4U, 230U, 72U, 212U, 112U, 21U, 162U,
    246U, 72U, 80U, 234U, 227U, 88U, 220U, 72U, 0U, 0U, 42U, 228U, 43U, 0U, 0U,
    6U, 194U, 53U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 236U, 60U, 0U, 0U, 220U, 72U,
    236U, 60U, 0U, 0U, 220U, 72U, 236U, 60U, 0U, 0U, 220U, 72U, 236U, 60U, 0U,
    0U, 220U, 72U, 235U, 61U, 0U, 4U, 230U, 72U, 212U, 112U, 21U, 162U, 246U,
    72U, 80U, 234U, 227U, 88U, 220U, 72U, 0U, 78U, 234U, 173U, 0U, 0U, 23U, 199U,
    24U, 149U, 97U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 236U, 60U, 0U, 0U, 220U, 72U,
    236U, 60U, 0U, 0U, 220U, 72U, 236U, 60U, 0U, 0U, 220U, 72U, 236U, 60U, 0U,
    0U, 220U, 72U, 235U, 61U, 0U, 4U, 230U, 72U, 212U, 112U, 21U, 162U, 246U,
    72U, 80U, 234U, 227U, 88U, 220U, 72U, 0U, 252U, 8U, 168U, 88U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 236U, 60U, 0U, 0U, 220U, 72U, 236U, 60U, 0U, 0U, 220U, 72U,
    236U, 60U, 0U, 0U, 220U, 72U, 236U, 60U, 0U, 0U, 220U, 72U, 235U, 61U, 0U,
    4U, 230U, 72U, 212U, 112U, 21U, 162U, 246U, 72U, 80U, 234U, 227U, 88U, 220U,
    72U, 0U, 0U, 0U, 166U, 147U, 0U, 0U, 0U, 0U, 89U, 162U, 1U, 0U, 0U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 187U, 131U, 0U, 0U, 23U, 240U, 13U, 97U, 220U, 0U, 0U,
    114U, 158U, 0U, 14U, 247U, 53U, 0U, 208U, 59U, 0U, 0U, 172U, 142U, 45U, 216U,
    0U, 0U, 0U, 82U, 229U, 142U, 117U, 0U, 0U, 0U, 7U, 240U, 244U, 23U, 0U, 0U,
    0U, 0U, 157U, 175U, 0U, 0U, 0U, 0U, 0U, 179U, 76U, 0U, 0U, 0U, 0U, 54U, 229U,
    3U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 0U, 0U, 216U,
    90U, 179U, 242U, 173U, 14U, 216U, 196U, 66U, 22U, 206U, 137U, 216U, 105U, 0U,
    0U, 108U, 207U, 216U, 80U, 0U, 0U, 90U, 222U, 216U, 104U, 0U, 0U, 120U, 191U,
    216U, 209U, 53U, 34U, 220U, 98U, 216U, 99U, 198U, 244U, 147U, 2U, 216U, 80U,
    0U, 0U, 0U, 0U, 216U, 80U, 0U, 0U, 0U, 0U, 0U, 116U, 144U, 32U, 224U, 0U, 0U,
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 187U, 131U, 0U, 0U, 23U, 240U, 13U, 97U, 220U,
    0U, 0U, 114U, 158U, 0U, 14U, 247U, 53U, 0U, 208U, 59U, 0U, 0U, 172U, 142U,
    45U, 216U, 0U, 0U, 0U, 82U, 229U, 142U, 117U, 0U, 0U, 0U, 7U, 240U, 244U,
    23U, 0U, 0U, 0U, 0U, 157U, 175U, 0U, 0U, 0U, 0U, 0U, 179U, 76U, 0U, 0U, 0U,
    0U, 54U, 229U, 3U, 0U, 0U, 0U };

  int32_T ii_size[1];
  int32_T b_tmp_size[2];
  int32_T index_size[1];
  real_T width;
  uint8_T thisGlyphBitmap_data[144];
  uint16_T tmp1;
  uint16_T tmp3;
  int32_T *gpu_nx;
  uint8_T (*gpu_in)[150528];
  real32_T (*b_gpu_in)[150528];
  int8_T (*gpu_iv1)[8];
  real_T (*gpu_anchors)[8];
  real32_T (*gpu_tmpFeatureMap)[4704];
  int32_T *gpu_ibcol;
  real32_T (*gpu_boxOut)[4704];
  boolean_T (*gpu_bv0)[784];
  int32_T (*gpu_thresholdedPrediction_size)[2];
  int16_T (*gpu_ii_data)[784];
  int32_T (*gpu_tmp_size)[1];
  dim3 grid;
  dim3 block;
  boolean_T validLaunchParams;
  real32_T (*gpu_thresholdedPrediction_data)[4704];
  int32_T (*gpu_bboxesX1Y1X2Y2_size)[2];
  dim3 b_grid;
  dim3 b_block;
  boolean_T b_validLaunchParams;
  real_T (*gpu_bboxesX1Y1X2Y2_data)[3136];
  dim3 c_grid;
  dim3 c_block;
  boolean_T c_validLaunchParams;
  real_T (*gpu_x1_data)[784];
  dim3 d_grid;
  dim3 d_block;
  boolean_T d_validLaunchParams;
  real_T (*gpu_y1_data)[784];
  dim3 e_grid;
  dim3 e_block;
  boolean_T e_validLaunchParams;
  real_T (*gpu_x2_data)[784];
  dim3 f_grid;
  dim3 f_block;
  boolean_T f_validLaunchParams;
  real_T (*gpu_y2_data)[784];
  dim3 g_grid;
  dim3 g_block;
  boolean_T g_validLaunchParams;
  dim3 h_grid;
  dim3 h_block;
  boolean_T h_validLaunchParams;
  dim3 i_grid;
  dim3 i_block;
  boolean_T i_validLaunchParams;
  dim3 j_grid;
  dim3 j_block;
  boolean_T j_validLaunchParams;
  int32_T (*gpu_x1_size)[1];
  dim3 k_grid;
  dim3 k_block;
  boolean_T k_validLaunchParams;
  dim3 l_grid;
  dim3 l_block;
  boolean_T l_validLaunchParams;
  dim3 m_grid;
  dim3 m_block;
  boolean_T m_validLaunchParams;
  dim3 n_grid;
  dim3 n_block;
  boolean_T n_validLaunchParams;
  int32_T (*gpu_bboxPred_size)[2];
  dim3 o_grid;
  dim3 o_block;
  boolean_T o_validLaunchParams;
  real_T (*gpu_bboxPred_data)[3136];
  dim3 p_grid;
  dim3 p_block;
  boolean_T p_validLaunchParams;
  dim3 q_grid;
  dim3 q_block;
  boolean_T q_validLaunchParams;
  dim3 r_grid;
  dim3 r_block;
  boolean_T r_validLaunchParams;
  dim3 s_grid;
  dim3 s_block;
  boolean_T s_validLaunchParams;
  dim3 t_grid;
  dim3 t_block;
  boolean_T t_validLaunchParams;
  int32_T (*b_gpu_bboxPred_size)[1];
  dim3 u_grid;
  dim3 u_block;
  boolean_T u_validLaunchParams;
  dim3 v_grid;
  dim3 v_block;
  boolean_T v_validLaunchParams;
  int32_T (*c_gpu_bboxPred_size)[1];
  dim3 w_grid;
  dim3 w_block;
  boolean_T w_validLaunchParams;
  int32_T (*d_gpu_bboxPred_size)[2];
  real32_T (*gpu_classPred_data)[784];
  real32_T (*gpu_scorePred_data)[784];
  int32_T (*gpu_idx_size)[2];
  int16_T *gpu_i3;
  int16_T *gpu_i2;
  dim3 x_grid;
  dim3 x_block;
  boolean_T x_validLaunchParams;
  int16_T (*gpu_idx_data)[784];
  dim3 y_grid;
  dim3 y_block;
  boolean_T y_validLaunchParams;
  boolean_T (*gpu_b_data)[784];
  dim3 ab_grid;
  dim3 ab_block;
  boolean_T ab_validLaunchParams;
  int32_T (*gpu_b_size)[2];
  dim3 bb_grid;
  dim3 bb_block;
  boolean_T bb_validLaunchParams;
  int32_T (*e_gpu_bboxPred_size)[2];
  dim3 cb_grid;
  dim3 cb_block;
  boolean_T cb_validLaunchParams;
  dim3 db_grid;
  dim3 db_block;
  boolean_T db_validLaunchParams;
  int32_T (*gpu_scorePred_size)[1];
  int32_T (*b_gpu_idx_size)[2];
  dim3 eb_grid;
  dim3 eb_block;
  boolean_T eb_validLaunchParams;
  int16_T (*b_gpu_idx_data)[784];
  dim3 fb_grid;
  dim3 fb_block;
  boolean_T fb_validLaunchParams;
  boolean_T (*b_gpu_b_data)[784];
  dim3 gb_grid;
  dim3 gb_block;
  boolean_T gb_validLaunchParams;
  int32_T (*b_gpu_b_size)[2];
  dim3 hb_grid;
  dim3 hb_block;
  boolean_T hb_validLaunchParams;
  int32_T (*gpu_classPred_size)[1];
  int32_T (*c_gpu_idx_size)[2];
  dim3 ib_grid;
  dim3 ib_block;
  boolean_T ib_validLaunchParams;
  int16_T (*c_gpu_idx_data)[784];
  dim3 jb_grid;
  dim3 jb_block;
  boolean_T jb_validLaunchParams;
  boolean_T (*c_gpu_b_data)[784];
  dim3 kb_grid;
  dim3 kb_block;
  boolean_T kb_validLaunchParams;
  int32_T (*c_gpu_b_size)[2];
  dim3 lb_grid;
  dim3 lb_block;
  boolean_T lb_validLaunchParams;
  dim3 mb_grid;
  dim3 mb_block;
  boolean_T mb_validLaunchParams;
  real32_T (*gpu_x_data)[784];
  int32_T (*gpu_iidx_size)[1];
  int32_T (*gpu_inputBbox_size)[2];
  int32_T (*gpu_iidx_data)[784];
  dim3 nb_grid;
  dim3 nb_block;
  boolean_T nb_validLaunchParams;
  real_T (*gpu_inputBbox_data)[3136];
  dim3 ob_grid;
  dim3 ob_block;
  boolean_T ob_validLaunchParams;
  real_T (*gpu_inputLabel_data)[784];
  dim3 pb_grid;
  dim3 pb_block;
  boolean_T pb_validLaunchParams;
  boolean_T (*gpu_isKept_data)[784];
  dim3 qb_grid;
  dim3 qb_block;
  boolean_T qb_validLaunchParams;
  real_T (*gpu_area_data)[784];
  dim3 rb_grid;
  dim3 rb_block;
  boolean_T rb_validLaunchParams;
  real_T (*b_gpu_x2_data)[784];
  dim3 sb_grid;
  dim3 sb_block;
  boolean_T sb_validLaunchParams;
  real_T (*b_gpu_y2_data)[784];
  int32_T (*gpu_ii_size)[1];
  dim3 tb_grid;
  dim3 tb_block;
  boolean_T tb_validLaunchParams;
  real_T (*gpu_index_data)[784];
  int32_T (*gpu_bboxes_size)[2];
  int32_T (*gpu_index_size)[1];
  dim3 ub_grid;
  dim3 ub_block;
  boolean_T ub_validLaunchParams;
  real_T (*gpu_bboxes_data)[3136];
  char_T (*gpu_cv0)[7];
  dim3 vb_grid;
  dim3 vb_block;
  boolean_T vb_validLaunchParams;
  cell_wrap_0 (*gpu_labels_data)[784];
  int32_T (*gpu_positionOut_size)[2];
  dim3 wb_grid;
  dim3 wb_block;
  boolean_T wb_validLaunchParams;
  int32_T (*gpu_positionOut_data)[3136];
  uint8_T (*gpu_uv0)[3];
  dim3 xb_grid;
  dim3 xb_block;
  boolean_T xb_validLaunchParams;
  uint8_T (*gpu_colorRGB_data)[2352];
  int32_T (*gpu_colorRGB_size)[2];
  dim3 yb_grid;
  dim3 yb_block;
  boolean_T yb_validLaunchParams;
  int8_T (*b_gpu_colorRGB_data)[2352];
  uint8_T (*gpu_outImg)[150528];
  int32_T (*b_gpu_colorRGB_size)[2];
  dim3 ac_grid;
  dim3 ac_block;
  boolean_T ac_validLaunchParams;
  uint8_T (*gpu_color_data)[2352];
  int32_T (*gpu_color_size)[2];
  dim3 bc_grid;
  dim3 bc_block;
  boolean_T bc_validLaunchParams;
  int32_T (*gpu_line)[4];
  int32_T (*b_gpu_line)[4];
  int32_T (*gpu_textLocAndWidth_size)[2];
  dim3 cc_grid;
  dim3 cc_block;
  boolean_T cc_validLaunchParams;
  int32_T (*gpu_textLocAndWidth_data)[3136];
  dim3 dc_grid;
  dim3 dc_block;
  boolean_T dc_validLaunchParams;
  int32_T (*gpu_textPosition_size)[2];
  dim3 ec_grid;
  dim3 ec_block;
  boolean_T ec_validLaunchParams;
  int32_T (*gpu_textPosition_data)[1568];
  uint8_T (*gpu_a_data)[3];
  dim3 fc_grid;
  dim3 fc_block;
  boolean_T fc_validLaunchParams;
  dim3 gc_grid;
  dim3 gc_block;
  boolean_T gc_validLaunchParams;
  dim3 hc_grid;
  dim3 hc_block;
  boolean_T hc_validLaunchParams;
  int32_T (*gpu_shapeWidth_data)[614656];
  dim3 ic_grid;
  dim3 ic_block;
  boolean_T ic_validLaunchParams;
  dim3 jc_grid;
  dim3 jc_block;
  boolean_T jc_validLaunchParams;
  int32_T (*gpu_shapeHeight_data)[614656];
  int32_T *gpu_textIdx;
  int8_T (*gpu_thisTextU16)[7];
  int8_T (*gpu_thisCharcodes_1b)[7];
  uint16_T (*gpu_uv1)[256];
  int8_T (*gpu_iv2)[261];
  real_T *gpu_height;
  boolean_T (*gpu_x)[7];
  real_T *gpu_numMissingGlyph;
  uint8_T (*gpu_uv2)[10664];
  dim3 kc_grid;
  dim3 kc_block;
  boolean_T kc_validLaunchParams;
  uint8_T (*gpu_tmp_data)[10664];
  int8_T (*gpu_num)[2];
  int32_T (*b_gpu_tmp_size)[2];
  dim3 lc_grid;
  dim3 lc_block;
  boolean_T lc_validLaunchParams;
  uint8_T (*b_gpu_tmp_data)[144];
  dim3 mc_grid;
  dim3 mc_block;
  boolean_T mc_validLaunchParams;
  uint8_T (*gpu_thisGlyphBitmap_data)[144];
  boolean_T thisGlyphBitmap_data_dirtyOnGpu;
  boolean_T thisTextU16_dirtyOnGpu;
  boolean_T shapeHeight_data_dirtyOnGpu;
  boolean_T c_thresholdedPrediction_size_di;
  boolean_T shapeWidth_data_dirtyOnGpu;
  boolean_T colorRGB_data_dirtyOnGpu;
  boolean_T nx_dirtyOnGpu;
  boolean_T colorRGB_size_dirtyOnGpu;
  boolean_T textPosition_data_dirtyOnGpu;
  boolean_T textPosition_size_dirtyOnGpu;
  boolean_T positionOut_data_dirtyOnGpu;
  boolean_T line_dirtyOnGpu;
  boolean_T b_line_dirtyOnGpu;
  boolean_T color_data_dirtyOnGpu;
  boolean_T color_size_dirtyOnGpu;
  boolean_T outImg_dirtyOnGpu;
  boolean_T bboxes_size_dirtyOnGpu;
  boolean_T bboxesX1Y1X2Y2_data_dirtyOnGpu;
  boolean_T y2_data_dirtyOnGpu;
  boolean_T inputBbox_data_dirtyOnGpu;
  boolean_T x2_data_dirtyOnGpu;
  boolean_T area_data_dirtyOnGpu;
  boolean_T isKept_data_dirtyOnGpu;
  boolean_T inputLabel_data_dirtyOnGpu;
  boolean_T classPred_data_dirtyOnGpu;
  boolean_T x_data_dirtyOnGpu;
  boolean_T scorePred_data_dirtyOnGpu;
  boolean_T b_data_dirtyOnGpu;
  boolean_T b_b_data_dirtyOnGpu;
  boolean_T bboxPred_data_dirtyOnGpu;
  boolean_T c_b_data_dirtyOnGpu;
  boolean_T idx_data_dirtyOnGpu;
  boolean_T idx_size_dirtyOnGpu;
  boolean_T bv0_dirtyOnGpu;
  boolean_T anchors_dirtyOnGpu;
  boolean_T num_dirtyOnCpu;
  boolean_T uv2_dirtyOnCpu;
  boolean_T uv1_dirtyOnCpu;
  boolean_T iv2_dirtyOnCpu;
  boolean_T textIdx_dirtyOnCpu;
  boolean_T iidx_data_dirtyOnCpu;
  boolean_T colorRGB_size_dirtyOnCpu;
  boolean_T line_dirtyOnCpu;
  boolean_T bboxes_size_dirtyOnCpu;
  boolean_T bboxPred_size_dirtyOnCpu;
  boolean_T bboxesX1Y1X2Y2_data_dirtyOnCpu;
  boolean_T ii_data_dirtyOnCpu;
  boolean_T classPred_data_dirtyOnCpu;
  boolean_T scorePred_data_dirtyOnCpu;
  boolean_T b_bboxPred_size_dirtyOnCpu;
  boolean_T tmp_size_dirtyOnCpu;
  boolean_T tmpFeatureMap_dirtyOnCpu;
  boolean_T guard1 = false;
  boolean_T exitg1;
  cudaMalloc(&b_gpu_colorRGB_data, 2352ULL);
  cudaMalloc(&gpu_thisGlyphBitmap_data, 144U * sizeof(uint8_T));
  cudaMalloc(&b_gpu_tmp_data, 144U * sizeof(uint8_T));
  cudaMalloc(&b_gpu_tmp_size, 8ULL);
  cudaMalloc(&gpu_num, 2ULL);
  cudaMalloc(&gpu_uv2, 10664ULL);
  cudaMalloc(&gpu_tmp_data, 10664U * sizeof(uint8_T));
  cudaMalloc(&gpu_shapeHeight_data, 614656U * sizeof(int32_T));
  cudaMalloc(&gpu_textPosition_data, 1568U * sizeof(int32_T));
  cudaMalloc(&gpu_shapeWidth_data, 614656U * sizeof(int32_T));
  cudaMalloc(&gpu_x, 7ULL);
  cudaMalloc(&gpu_iv2, 261ULL);
  cudaMalloc(&gpu_uv1, 512ULL);
  cudaMalloc(&gpu_thisCharcodes_1b, 7ULL);
  cudaMalloc(&gpu_labels_data, 784U * sizeof(cell_wrap_0));
  cudaMalloc(&gpu_textIdx, 4ULL);
  cudaMalloc(&gpu_thisTextU16, 7ULL);
  cudaMalloc(&gpu_a_data, 3U * sizeof(uint8_T));
  cudaMalloc(&gpu_textPosition_size, 8ULL);
  cudaMalloc(&gpu_textLocAndWidth_data, 3136U * sizeof(int32_T));
  cudaMalloc(&gpu_textLocAndWidth_size, 8ULL);
  cudaMalloc(&gpu_outImg, 150528ULL);
  cudaMalloc(&gpu_color_data, 2352U * sizeof(uint8_T));
  cudaMalloc(&b_gpu_line, 16ULL);
  cudaMalloc(&gpu_line, 16ULL);
  cudaMalloc(&gpu_positionOut_data, 3136U * sizeof(int32_T));
  cudaMalloc(&gpu_colorRGB_data, 2352U * sizeof(uint8_T));
  cudaMalloc(&gpu_color_size, 8ULL);
  cudaMalloc(&gpu_colorRGB_size, 8ULL);
  cudaMalloc(&gpu_uv0, 3ULL);
  cudaMalloc(&b_gpu_colorRGB_size, 8ULL);
  cudaMalloc(&gpu_bboxes_data, 3136U * sizeof(real_T));
  cudaMalloc(&gpu_positionOut_size, 8ULL);
  cudaMalloc(&gpu_cv0, 7ULL);
  cudaMalloc(&gpu_index_data, 784U * sizeof(real_T));
  cudaMalloc(&gpu_index_size, 4ULL);
  cudaMalloc(&gpu_ii_size, 4ULL);
  cudaMalloc(&gpu_area_data, 784U * sizeof(real_T));
  cudaMalloc(&b_gpu_y2_data, 784U * sizeof(real_T));
  cudaMalloc(&gpu_height, 8ULL);
  cudaMalloc(&gpu_numMissingGlyph, 8ULL);
  cudaMalloc(&b_gpu_x2_data, 784U * sizeof(real_T));
  cudaMalloc(&gpu_inputLabel_data, 784U * sizeof(real_T));
  cudaMalloc(&gpu_isKept_data, 784U * sizeof(boolean_T));
  cudaMalloc(&gpu_inputBbox_data, 3136U * sizeof(real_T));
  cudaMalloc(&gpu_iidx_data, 784U * sizeof(int32_T));
  cudaMalloc(&gpu_inputBbox_size, 8ULL);
  cudaMalloc(&gpu_iidx_size, 4ULL);
  cudaMalloc(&gpu_x_data, 784U * sizeof(real32_T));
  cudaMalloc(&c_gpu_idx_data, 784U * sizeof(int16_T));
  cudaMalloc(&c_gpu_b_data, 784U * sizeof(boolean_T));
  cudaMalloc(&c_gpu_b_size, 8ULL);
  cudaMalloc(&c_gpu_idx_size, 8ULL);
  cudaMalloc(&b_gpu_idx_data, 784U * sizeof(int16_T));
  cudaMalloc(&b_gpu_b_data, 784U * sizeof(boolean_T));
  cudaMalloc(&b_gpu_b_size, 8ULL);
  cudaMalloc(&b_gpu_idx_size, 8ULL);
  cudaMalloc(&e_gpu_bboxPred_size, 8ULL);
  cudaMalloc(&gpu_idx_data, 784U * sizeof(int16_T));
  cudaMalloc(&gpu_b_data, 784U * sizeof(boolean_T));
  cudaMalloc(&gpu_b_size, 8ULL);
  cudaMalloc(&gpu_i2, 2ULL);
  cudaMalloc(&gpu_i3, 2ULL);
  cudaMalloc(&gpu_idx_size, 8ULL);
  cudaMalloc(&gpu_scorePred_data, 784U * sizeof(real32_T));
  cudaMalloc(&gpu_classPred_data, 784U * sizeof(real32_T));
  cudaMalloc(&gpu_classPred_size, 4ULL);
  cudaMalloc(&gpu_scorePred_size, 4ULL);
  cudaMalloc(&d_gpu_bboxPred_size, 8ULL);
  cudaMalloc(&c_gpu_bboxPred_size, 4ULL);
  cudaMalloc(&b_gpu_bboxPred_size, 4ULL);
  cudaMalloc(&gpu_bboxPred_data, 3136U * sizeof(real_T));
  cudaMalloc(&gpu_bboxPred_size, 8ULL);
  cudaMalloc(&gpu_y2_data, 784U * sizeof(real_T));
  cudaMalloc(&gpu_x2_data, 784U * sizeof(real_T));
  cudaMalloc(&gpu_y1_data, 784U * sizeof(real_T));
  cudaMalloc(&gpu_x1_data, 784U * sizeof(real_T));
  cudaMalloc(&gpu_bboxesX1Y1X2Y2_data, 3136U * sizeof(real_T));
  cudaMalloc(&gpu_x1_size, 4ULL);
  cudaMalloc(&gpu_thresholdedPrediction_data, 4704U * sizeof(real32_T));
  cudaMalloc(&gpu_bboxesX1Y1X2Y2_size, 8ULL);
  cudaMalloc(&gpu_bboxes_size, 8ULL);
  cudaMalloc(&gpu_thresholdedPrediction_size, 8ULL);
  cudaMalloc(&gpu_ii_data, 784U * sizeof(int16_T));
  cudaMalloc(&gpu_tmp_size, 4ULL);
  cudaMalloc(&gpu_bv0, 784ULL);
  cudaMalloc(&gpu_tmpFeatureMap, 18816ULL);
  cudaMalloc(&gpu_boxOut, 18816ULL);
  cudaMalloc(&gpu_anchors, 64ULL);
  cudaMalloc(&gpu_ibcol, 4ULL);
  cudaMalloc(&gpu_iv1, 8ULL);
  cudaMalloc(&b_gpu_in, 602112ULL);
  cudaMalloc(&gpu_nx, 4ULL);
  cudaMalloc(&gpu_in, 150528ULL);
  scorePred_data_dirtyOnCpu = false;
  classPred_data_dirtyOnCpu = false;
  ii_data_dirtyOnCpu = false;
  bboxesX1Y1X2Y2_data_dirtyOnCpu = false;
  line_dirtyOnCpu = false;
  iidx_data_dirtyOnCpu = false;
  num_dirtyOnCpu = false;
  idx_data_dirtyOnGpu = false;
  c_b_data_dirtyOnGpu = false;
  bboxPred_data_dirtyOnGpu = false;
  b_b_data_dirtyOnGpu = false;
  b_data_dirtyOnGpu = false;
  scorePred_data_dirtyOnGpu = false;
  x_data_dirtyOnGpu = false;
  classPred_data_dirtyOnGpu = false;
  inputLabel_data_dirtyOnGpu = false;
  isKept_data_dirtyOnGpu = false;
  area_data_dirtyOnGpu = false;
  x2_data_dirtyOnGpu = false;
  inputBbox_data_dirtyOnGpu = false;
  y2_data_dirtyOnGpu = false;
  bboxesX1Y1X2Y2_data_dirtyOnGpu = false;
  color_data_dirtyOnGpu = false;
  positionOut_data_dirtyOnGpu = false;
  textPosition_data_dirtyOnGpu = false;
  colorRGB_data_dirtyOnGpu = false;
  shapeWidth_data_dirtyOnGpu = false;
  shapeHeight_data_dirtyOnGpu = false;
  thisGlyphBitmap_data_dirtyOnGpu = false;
  iv2_dirtyOnCpu = true;
  uv1_dirtyOnCpu = true;
  uv2_dirtyOnCpu = true;

  /*    Copyright 2018-2019 The MathWorks, Inc. */
  if (!yolov2Obj_not_empty) {
    DeepLearningNetwork_setup(&gobj_0);
    yolov2Obj.net = &gobj_0;
    yolov2Obj_not_empty = true;
  }

  /*  pass in input */
  tmp11 = in[0];
  tmp22 = in[0];
  for (i = 0; i < 150527; i++) {
    if (tmp11 > in[i + 1]) {
      tmp11 = in[i + 1];
    }

    if (tmp22 < in[i + 1]) {
      tmp22 = in[i + 1];
    }
  }

  nx = tmp22 - tmp11;
  cudaMemcpy(gpu_nx, &nx, 4ULL, cudaMemcpyHostToDevice);
  cudaMemcpy(gpu_in, (void *)&in[0], 150528ULL, cudaMemcpyHostToDevice);
  yolov2_detect_kernel1<<<dim3(294U, 1U, 1U), dim3(512U, 1U, 1U)>>>(gpu_nx,
    tmp11, *gpu_in, *b_gpu_in);
  cudaMemcpy(&SD->f0.in[0], b_gpu_in, 602112ULL, cudaMemcpyDeviceToHost);
  DeepLearningNetwork_activations(yolov2Obj.net, SD->f0.in, tmpFeatureMap);
  tmpFeatureMap_dirtyOnCpu = true;
  cudaMemcpy(gpu_iv1, (void *)&iv1[0], 8ULL, cudaMemcpyHostToDevice);
  yolov2_detect_kernel2<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(*gpu_iv1,
    *gpu_anchors);
  anchors_dirtyOnGpu = true;
  for (ibcol = 0; ibcol < 4; ibcol++) {
    if (anchors_dirtyOnGpu) {
      cudaMemcpy(&anchors[0], gpu_anchors, 64ULL, cudaMemcpyDeviceToHost);
      anchors_dirtyOnGpu = false;
    }

    anchors[ibcol] = dv0[ibcol];
    anchors[4 + ibcol] /= 16.0;
    cudaMemcpy(gpu_ibcol, &ibcol, 4ULL, cudaMemcpyHostToDevice);
    if (tmpFeatureMap_dirtyOnCpu) {
      cudaMemcpy(gpu_tmpFeatureMap, &tmpFeatureMap[0], 18816ULL,
                 cudaMemcpyHostToDevice);
      tmpFeatureMap_dirtyOnCpu = false;
    }

    cudaMemcpy(gpu_anchors, &anchors[0], 64ULL, cudaMemcpyHostToDevice);
    yolov2_detect_kernel3<<<dim3(1U, 1U, 1U), dim3(224U, 1U, 1U)>>>(*gpu_anchors,
      *gpu_tmpFeatureMap, gpu_ibcol, *gpu_boxOut);
  }

  yolov2_detect_kernel4<<<dim3(2U, 1U, 1U), dim3(512U, 1U, 1U)>>>(*gpu_boxOut,
    *gpu_bv0);
  bv0_dirtyOnGpu = true;
  nx = 0;
  nx_dirtyOnGpu = false;
  for (i = 0; i < 784; i++) {
    if (bv0_dirtyOnGpu) {
      cudaMemcpy(&bv0[0], gpu_bv0, 784ULL, cudaMemcpyDeviceToHost);
      bv0_dirtyOnGpu = false;
    }

    if (bv0[i]) {
      nx++;
    }
  }

  tmp_size[0] = nx;
  tmp_size_dirtyOnCpu = true;
  nrowx = 0;
  for (i = 0; i < 784; i++) {
    if (bv0_dirtyOnGpu) {
      cudaMemcpy(&bv0[0], gpu_bv0, 784ULL, cudaMemcpyDeviceToHost);
      bv0_dirtyOnGpu = false;
    }

    if (bv0[i]) {
      ii_data[nrowx] = static_cast<int16_T>((i + 1));
      ii_data_dirtyOnCpu = true;
      nrowx++;
    }
  }

  cudaMemcpy(gpu_nx, &nx, 4ULL, cudaMemcpyHostToDevice);
  yolov2_detect_kernel5<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(gpu_nx,
    *gpu_thresholdedPrediction_size);
  cudaMemcpy(&thresholdedPrediction_size[0], gpu_thresholdedPrediction_size,
             8ULL, cudaMemcpyDeviceToHost);
  c_thresholdedPrediction_size_di = false;
  validLaunchParams = mwGetLaunchParameters((real_T)((1LL + (tmp_size[0] - 1)) *
    6LL), &grid, &block, 1024U, 65535U);
  if (validLaunchParams) {
    if (ii_data_dirtyOnCpu) {
      cudaMemcpy(gpu_ii_data, &ii_data[0], tmp_size[0] * sizeof(int16_T),
                 cudaMemcpyHostToDevice);
      ii_data_dirtyOnCpu = false;
    }

    cudaMemcpy(gpu_tmp_size, &tmp_size[0], 4ULL, cudaMemcpyHostToDevice);
    tmp_size_dirtyOnCpu = false;
    yolov2_detect_kernel6<<<grid, block>>>(*gpu_boxOut, *gpu_ii_data,
      *gpu_thresholdedPrediction_size, *gpu_tmp_size,
      *gpu_thresholdedPrediction_data);
  }

  if (tmp_size[0] != 0) {
    i0 = tmp_size[0] - 1;
    if (tmp_size_dirtyOnCpu) {
      cudaMemcpy(gpu_tmp_size, &tmp_size[0], 4ULL, cudaMemcpyHostToDevice);
    }

    yolov2_detect_kernel7<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(*gpu_tmp_size,
      *gpu_bboxesX1Y1X2Y2_size);
    cudaMemcpy(&bboxesX1Y1X2Y2_size[0], gpu_bboxesX1Y1X2Y2_size, 8ULL,
               cudaMemcpyDeviceToHost);
    b_validLaunchParams = mwGetLaunchParameters((real_T)((1LL + i0) * 4LL),
      &b_grid, &b_block, 1024U, 65535U);
    if (b_validLaunchParams) {
      yolov2_detect_kernel8<<<b_grid, b_block>>>(*gpu_thresholdedPrediction_data,
        *gpu_thresholdedPrediction_size, *gpu_bboxesX1Y1X2Y2_size, i0,
        *gpu_bboxesX1Y1X2Y2_data);
      bboxesX1Y1X2Y2_data_dirtyOnGpu = true;
    }

    i0 = bboxesX1Y1X2Y2_size[0] - 1;
    x1_size[0] = bboxesX1Y1X2Y2_size[0];
    c_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + i0), &c_grid,
      &c_block, 1024U, 65535U);
    if (c_validLaunchParams) {
      yolov2_detect_kernel9<<<c_grid, c_block>>>(*gpu_bboxesX1Y1X2Y2_data, i0,
        *gpu_x1_data);
    }

    i0 = bboxesX1Y1X2Y2_size[0] - 1;
    y1_size[0] = bboxesX1Y1X2Y2_size[0];
    d_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + i0), &d_grid,
      &d_block, 1024U, 65535U);
    if (d_validLaunchParams) {
      yolov2_detect_kernel10<<<d_grid, d_block>>>(*gpu_bboxesX1Y1X2Y2_data,
        *gpu_bboxesX1Y1X2Y2_size, i0, *gpu_y1_data);
    }

    i0 = bboxesX1Y1X2Y2_size[0] - 1;
    x2_size[0] = bboxesX1Y1X2Y2_size[0];
    e_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + i0), &e_grid,
      &e_block, 1024U, 65535U);
    if (e_validLaunchParams) {
      yolov2_detect_kernel11<<<e_grid, e_block>>>(*gpu_bboxesX1Y1X2Y2_data,
        *gpu_bboxesX1Y1X2Y2_size, i0, *gpu_x2_data);
    }

    i0 = bboxesX1Y1X2Y2_size[0] - 1;
    y2_size[0] = bboxesX1Y1X2Y2_size[0];
    f_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + i0), &f_grid,
      &f_block, 1024U, 65535U);
    if (f_validLaunchParams) {
      yolov2_detect_kernel12<<<f_grid, f_block>>>(*gpu_bboxesX1Y1X2Y2_data,
        *gpu_bboxesX1Y1X2Y2_size, i0, *gpu_y2_data);
    }

    nx = bboxesX1Y1X2Y2_size[0] - 1;
    g_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + nx), &g_grid,
      &g_block, 1024U, 65535U);
    if (g_validLaunchParams) {
      cudaMemcpy(gpu_nx, &nx, 4ULL, cudaMemcpyHostToDevice);
      yolov2_detect_kernel13<<<g_grid, g_block>>>(gpu_nx, *gpu_x1_data);
    }

    nx = bboxesX1Y1X2Y2_size[0] - 1;
    h_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + nx), &h_grid,
      &h_block, 1024U, 65535U);
    if (h_validLaunchParams) {
      cudaMemcpy(gpu_nx, &nx, 4ULL, cudaMemcpyHostToDevice);
      yolov2_detect_kernel14<<<h_grid, h_block>>>(gpu_nx, *gpu_y1_data);
    }

    nx = bboxesX1Y1X2Y2_size[0] - 1;
    i_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + nx), &i_grid,
      &i_block, 1024U, 65535U);
    if (i_validLaunchParams) {
      cudaMemcpy(gpu_nx, &nx, 4ULL, cudaMemcpyHostToDevice);
      yolov2_detect_kernel15<<<i_grid, i_block>>>(gpu_nx, *gpu_x2_data);
    }

    nx = bboxesX1Y1X2Y2_size[0] - 1;
    j_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + nx), &j_grid,
      &j_block, 1024U, 65535U);
    if (j_validLaunchParams) {
      cudaMemcpy(gpu_nx, &nx, 4ULL, cudaMemcpyHostToDevice);
      yolov2_detect_kernel16<<<j_grid, j_block>>>(gpu_nx, *gpu_y2_data);
    }

    cudaMemcpy(gpu_x1_size, &x1_size[0], 4ULL, cudaMemcpyHostToDevice);
    yolov2_detect_kernel17<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(*gpu_x1_size,
      *gpu_bboxesX1Y1X2Y2_size);
    nx = x1_size[0] - 1;
    cudaMemcpy(&bboxesX1Y1X2Y2_size[0], gpu_bboxesX1Y1X2Y2_size, 8ULL,
               cudaMemcpyDeviceToHost);
    k_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + nx), &k_grid,
      &k_block, 1024U, 65535U);
    if (k_validLaunchParams) {
      cudaMemcpy(gpu_nx, &nx, 4ULL, cudaMemcpyHostToDevice);
      yolov2_detect_kernel18<<<k_grid, k_block>>>(*gpu_x1_data, gpu_nx,
        *gpu_bboxesX1Y1X2Y2_data);
      bboxesX1Y1X2Y2_data_dirtyOnGpu = true;
    }

    nx = y1_size[0] - 1;
    l_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + nx), &l_grid,
      &l_block, 1024U, 65535U);
    if (l_validLaunchParams) {
      cudaMemcpy(gpu_nx, &nx, 4ULL, cudaMemcpyHostToDevice);
      yolov2_detect_kernel19<<<l_grid, l_block>>>(*gpu_y1_data,
        *gpu_bboxesX1Y1X2Y2_size, gpu_nx, *gpu_bboxesX1Y1X2Y2_data);
      bboxesX1Y1X2Y2_data_dirtyOnGpu = true;
    }

    nx = x2_size[0] - 1;
    m_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + nx), &m_grid,
      &m_block, 1024U, 65535U);
    if (m_validLaunchParams) {
      cudaMemcpy(gpu_nx, &nx, 4ULL, cudaMemcpyHostToDevice);
      yolov2_detect_kernel20<<<m_grid, m_block>>>(*gpu_x2_data,
        *gpu_bboxesX1Y1X2Y2_size, gpu_nx, *gpu_bboxesX1Y1X2Y2_data);
      bboxesX1Y1X2Y2_data_dirtyOnGpu = true;
    }

    nx = y2_size[0] - 1;
    n_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + nx), &n_grid,
      &n_block, 1024U, 65535U);
    if (n_validLaunchParams) {
      cudaMemcpy(gpu_nx, &nx, 4ULL, cudaMemcpyHostToDevice);
      yolov2_detect_kernel21<<<n_grid, n_block>>>(*gpu_y2_data,
        *gpu_bboxesX1Y1X2Y2_size, gpu_nx, *gpu_bboxesX1Y1X2Y2_data);
      bboxesX1Y1X2Y2_data_dirtyOnGpu = true;
    }

    i0 = bboxesX1Y1X2Y2_size[0];
    i1 = bboxesX1Y1X2Y2_size[0];
    nrowx = bboxesX1Y1X2Y2_size[0];
    yolov2_detect_kernel22<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (*gpu_bboxesX1Y1X2Y2_size, *gpu_bboxPred_size);
    nx = bboxesX1Y1X2Y2_size[0] - 1;
    cudaMemcpy(&bboxPred_size[0], gpu_bboxPred_size, 8ULL,
               cudaMemcpyDeviceToHost);
    o_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + nx), &o_grid,
      &o_block, 1024U, 65535U);
    if (o_validLaunchParams) {
      cudaMemcpy(gpu_nx, &nx, 4ULL, cudaMemcpyHostToDevice);
      yolov2_detect_kernel23<<<o_grid, o_block>>>(*gpu_bboxesX1Y1X2Y2_data,
        gpu_nx, *gpu_bboxPred_data);
      bboxPred_data_dirtyOnGpu = true;
    }

    nx = i0 - 1;
    p_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + nx), &p_grid,
      &p_block, 1024U, 65535U);
    if (p_validLaunchParams) {
      cudaMemcpy(gpu_nx, &nx, 4ULL, cudaMemcpyHostToDevice);
      yolov2_detect_kernel24<<<p_grid, p_block>>>(*gpu_bboxesX1Y1X2Y2_data,
        *gpu_bboxesX1Y1X2Y2_size, *gpu_bboxPred_size, gpu_nx, *gpu_bboxPred_data);
      bboxPred_data_dirtyOnGpu = true;
    }

    nx = i1 - 1;
    q_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + nx), &q_grid,
      &q_block, 1024U, 65535U);
    if (q_validLaunchParams) {
      cudaMemcpy(gpu_nx, &nx, 4ULL, cudaMemcpyHostToDevice);
      yolov2_detect_kernel25<<<q_grid, q_block>>>(*gpu_bboxesX1Y1X2Y2_data,
        *gpu_bboxesX1Y1X2Y2_size, *gpu_bboxPred_size, gpu_nx, *gpu_bboxPred_data);
      bboxPred_data_dirtyOnGpu = true;
    }

    nx = nrowx - 1;
    r_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + nx), &r_grid,
      &r_block, 1024U, 65535U);
    if (r_validLaunchParams) {
      cudaMemcpy(gpu_nx, &nx, 4ULL, cudaMemcpyHostToDevice);
      yolov2_detect_kernel26<<<r_grid, r_block>>>(*gpu_bboxesX1Y1X2Y2_data,
        *gpu_bboxesX1Y1X2Y2_size, *gpu_bboxPred_size, gpu_nx, *gpu_bboxPred_data);
      bboxPred_data_dirtyOnGpu = true;
    }

    nx = bboxPred_size[0] << 2;
    s_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + (nx - 1)),
      &s_grid, &s_block, 1024U, 65535U);
    if (s_validLaunchParams) {
      cudaMemcpy(gpu_nx, &nx, 4ULL, cudaMemcpyHostToDevice);
      yolov2_detect_kernel27<<<s_grid, s_block>>>(gpu_nx, *gpu_bboxPred_data);
      bboxPred_data_dirtyOnGpu = true;
    }

    i0 = bboxPred_size[0] - 1;
    b_bboxPred_size[0] = bboxPred_size[0];
    t_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + i0), &t_grid,
      &t_block, 1024U, 65535U);
    if (t_validLaunchParams) {
      yolov2_detect_kernel28<<<t_grid, t_block>>>(*gpu_bboxPred_data,
        *gpu_bboxPred_size, i0, *gpu_y2_data);
    }

    u_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + (b_bboxPred_size
      [0] - 1)), &u_grid, &u_block, 1024U, 65535U);
    if (u_validLaunchParams) {
      cudaMemcpy(b_gpu_bboxPred_size, &b_bboxPred_size[0], 4ULL,
                 cudaMemcpyHostToDevice);
      yolov2_detect_kernel29<<<u_grid, u_block>>>(*gpu_y2_data,
        *gpu_bboxPred_size, *b_gpu_bboxPred_size, *gpu_bboxPred_data);
      bboxPred_data_dirtyOnGpu = true;
    }

    i0 = bboxPred_size[0] - 1;
    c_bboxPred_size[0] = bboxPred_size[0];
    v_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + i0), &v_grid,
      &v_block, 1024U, 65535U);
    if (v_validLaunchParams) {
      yolov2_detect_kernel30<<<v_grid, v_block>>>(*gpu_bboxPred_data,
        *gpu_bboxPred_size, i0, *gpu_y2_data);
    }

    w_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + (c_bboxPred_size
      [0] - 1)), &w_grid, &w_block, 1024U, 65535U);
    if (w_validLaunchParams) {
      cudaMemcpy(c_gpu_bboxPred_size, &c_bboxPred_size[0], 4ULL,
                 cudaMemcpyHostToDevice);
      yolov2_detect_kernel31<<<w_grid, w_block>>>(*gpu_y2_data,
        *gpu_bboxPred_size, *c_gpu_bboxPred_size, *gpu_bboxPred_data);
      bboxPred_data_dirtyOnGpu = true;
    }

    count = 0;
    d_bboxPred_size[0] = bboxPred_size[0];
    d_bboxPred_size[1] = 4;
    bboxPred_size_dirtyOnCpu = true;
    scorePred_size[0] = bboxPred_size[0];
    classPred_size[0] = bboxPred_size[0];
    i0 = bboxPred_size[0];
    for (i = 0; i < i0; i++) {
      if (bboxPred_data_dirtyOnGpu) {
        cudaMemcpy(&bboxPred_data[0], gpu_bboxPred_data, bboxPred_size[0] *
                   bboxPred_size[1] * sizeof(real_T), cudaMemcpyDeviceToHost);
        bboxPred_data_dirtyOnGpu = false;
      }

      if ((bboxPred_data[i + bboxPred_size[0] * 3] >= 1.0) && (bboxPred_data[i +
           (bboxPred_size[0] << 1)] >= 1.0) && (bboxPred_data[i + bboxPred_size
           [0] * 3] <= 224.0) && (bboxPred_data[i + (bboxPred_size[0] << 1)] <=
           224.0)) {
        count++;
        if (bboxPred_size_dirtyOnCpu) {
          cudaMemcpy(d_gpu_bboxPred_size, &d_bboxPred_size[0], 8ULL,
                     cudaMemcpyHostToDevice);
          bboxPred_size_dirtyOnCpu = false;
        }

        yolov2_detect_kernel32<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
          (*gpu_bboxPred_data, *gpu_bboxPred_size, i, *d_gpu_bboxPred_size,
           count - 1, *gpu_bboxesX1Y1X2Y2_data);
        bboxesX1Y1X2Y2_data_dirtyOnGpu = true;
        yolov2_detect_kernel33<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
          (*gpu_thresholdedPrediction_data, *gpu_thresholdedPrediction_size, i,
           count, *gpu_classPred_data, *gpu_scorePred_data);
        scorePred_data_dirtyOnGpu = true;
        classPred_data_dirtyOnGpu = true;
      }
    }

    if (bboxPred_size_dirtyOnCpu) {
      cudaMemcpy(d_gpu_bboxPred_size, &d_bboxPred_size[0], 8ULL,
                 cudaMemcpyHostToDevice);
    }

    yolov2_detect_kernel34<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (*d_gpu_bboxPred_size, count, *gpu_idx_size, gpu_i3, gpu_i2);
    cudaMemcpy(&idx_size[0], gpu_idx_size, 8ULL, cudaMemcpyDeviceToHost);
    idx_size_dirtyOnGpu = false;
    cudaMemcpy(&i3, gpu_i3, 2ULL, cudaMemcpyDeviceToHost);
    cudaMemcpy(&i2, gpu_i2, 2ULL, cudaMemcpyDeviceToHost);
    x_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + (i3 - i2)),
      &x_grid, &x_block, 1024U, 65535U);
    if (x_validLaunchParams) {
      yolov2_detect_kernel35<<<x_grid, x_block>>>(gpu_i2, gpu_i3, *gpu_idx_data);
      idx_data_dirtyOnGpu = true;
    }

    nrowx = d_bboxPred_size[0];
    if (static_cast<int16_T>((d_bboxPred_size[0] - count)) == 1) {
      nrows = d_bboxPred_size[0] - 1;
      if (idx_data_dirtyOnGpu) {
        cudaMemcpy(&idx_data[0], gpu_idx_data, idx_size[0] * idx_size[1] *
                   sizeof(int16_T), cudaMemcpyDeviceToHost);
      }

      i0 = idx_data[0];
      for (nxin = 0; nxin < 4; nxin++) {
        if (idx_size_dirtyOnGpu) {
          cudaMemcpy(&idx_size[0], gpu_idx_size, 8ULL, cudaMemcpyDeviceToHost);
          idx_size_dirtyOnGpu = false;
        }

        for (i = 0; i <= nrows - i0; i++) {
          nx = i0 + i;
          if (bboxesX1Y1X2Y2_data_dirtyOnGpu) {
            cudaMemcpy(&bboxesX1Y1X2Y2_data[0], gpu_bboxesX1Y1X2Y2_data,
                       d_bboxPred_size[0] * d_bboxPred_size[1] * sizeof(real_T),
                       cudaMemcpyDeviceToHost);
            bboxesX1Y1X2Y2_data_dirtyOnGpu = false;
          }

          bboxesX1Y1X2Y2_data[(nx + d_bboxPred_size[0] * nxin) - 1] =
            bboxesX1Y1X2Y2_data[nx + d_bboxPred_size[0] * nxin];
          bboxesX1Y1X2Y2_data_dirtyOnCpu = true;
        }
      }
    } else {
      b_size[0] = 1;
      b_size[1] = d_bboxPred_size[0];
      y_validLaunchParams = mwGetLaunchParameters((real_T)(1LL +
        (d_bboxPred_size[0] - 1)), &y_grid, &y_block, 1024U, 65535U);
      if (y_validLaunchParams) {
        yolov2_detect_kernel36<<<y_grid, y_block>>>(*d_gpu_bboxPred_size,
          *gpu_b_data);
        c_b_data_dirtyOnGpu = true;
      }

      i0 = static_cast<int16_T>((d_bboxPred_size[0] - count));
      ab_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + (i0 - 1)),
        &ab_grid, &ab_block, 1024U, 65535U);
      if (ab_validLaunchParams) {
        yolov2_detect_kernel37<<<ab_grid, ab_block>>>(*gpu_idx_data, i0,
          *gpu_b_data);
        c_b_data_dirtyOnGpu = true;
      }

      nx = 0;
      i0 = b_size[1];
      bb_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + (i0 - 1)),
        &bb_grid, &bb_block, 1024U, 65535U);
      if (bb_validLaunchParams) {
        cudaMemcpy(gpu_nx, &nx, 4ULL, cudaMemcpyHostToDevice);
        cudaMemcpy(gpu_b_size, &b_size[0], 8ULL, cudaMemcpyHostToDevice);
        yolov2_detect_kernel38<<<bb_grid, bb_block>>>(*gpu_b_data, i0, gpu_nx);
        nx_dirtyOnGpu = true;
      }

      if (nx_dirtyOnGpu) {
        cudaMemcpy(&nx, gpu_nx, 4ULL, cudaMemcpyDeviceToHost);
        nx_dirtyOnGpu = false;
      }

      nrows = d_bboxPred_size[0] - nx;
      i = 0;
      for (endR = 0; endR < nrowx; endR++) {
        guard1 = false;
        if (1 + endR > b_size[1]) {
          guard1 = true;
        } else {
          if (c_b_data_dirtyOnGpu) {
            cudaMemcpy(&b_data[0], gpu_b_data, b_size[0] * b_size[1] * sizeof
                       (boolean_T), cudaMemcpyDeviceToHost);
            c_b_data_dirtyOnGpu = false;
          }

          if (!b_data[endR]) {
            guard1 = true;
          }
        }

        if (guard1) {
          for (nxin = 0; nxin < 4; nxin++) {
            if (bboxesX1Y1X2Y2_data_dirtyOnGpu) {
              cudaMemcpy(&bboxesX1Y1X2Y2_data[0], gpu_bboxesX1Y1X2Y2_data,
                         d_bboxPred_size[0] * d_bboxPred_size[1] * sizeof(real_T),
                         cudaMemcpyDeviceToHost);
              bboxesX1Y1X2Y2_data_dirtyOnGpu = false;
            }

            bboxesX1Y1X2Y2_data[i + d_bboxPred_size[0] * nxin] =
              bboxesX1Y1X2Y2_data[endR + d_bboxPred_size[0] * nxin];
            bboxesX1Y1X2Y2_data_dirtyOnCpu = true;
          }

          i++;
        }
      }
    }

    if (1 > nrows) {
      i0 = -1;
    } else {
      i0 = nrows - 1;
    }

    e_bboxPred_size[0] = i0 + 1;
    e_bboxPred_size[1] = 4;
    b_bboxPred_size_dirtyOnCpu = true;
    cb_validLaunchParams = mwGetLaunchParameters((real_T)((1LL + i0) * 4LL),
      &cb_grid, &cb_block, 1024U, 65535U);
    if (cb_validLaunchParams) {
      if (bboxesX1Y1X2Y2_data_dirtyOnCpu) {
        cudaMemcpy(gpu_bboxesX1Y1X2Y2_data, &bboxesX1Y1X2Y2_data[0],
                   d_bboxPred_size[0] * d_bboxPred_size[1] * sizeof(real_T),
                   cudaMemcpyHostToDevice);
        bboxesX1Y1X2Y2_data_dirtyOnCpu = false;
      }

      cudaMemcpy(e_gpu_bboxPred_size, &e_bboxPred_size[0], 8ULL,
                 cudaMemcpyHostToDevice);
      b_bboxPred_size_dirtyOnCpu = false;
      yolov2_detect_kernel39<<<cb_grid, cb_block>>>(*gpu_bboxesX1Y1X2Y2_data,
        *d_gpu_bboxPred_size, *e_gpu_bboxPred_size, i0, *gpu_bboxPred_data);
    }

    if (b_bboxPred_size_dirtyOnCpu) {
      cudaMemcpy(e_gpu_bboxPred_size, &e_bboxPred_size[0], 8ULL,
                 cudaMemcpyHostToDevice);
    }

    yolov2_detect_kernel40<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (*e_gpu_bboxPred_size, *d_gpu_bboxPred_size);
    cudaMemcpy(&d_bboxPred_size[0], d_gpu_bboxPred_size, 8ULL,
               cudaMemcpyDeviceToHost);
    db_validLaunchParams = mwGetLaunchParameters((real_T)(1LL +
      (e_bboxPred_size[0] * 4 - 1)), &db_grid, &db_block, 1024U, 65535U);
    if (db_validLaunchParams) {
      if (bboxesX1Y1X2Y2_data_dirtyOnCpu) {
        cudaMemcpy(gpu_bboxesX1Y1X2Y2_data, &bboxesX1Y1X2Y2_data[0],
                   d_bboxPred_size[0] * d_bboxPred_size[1] * sizeof(real_T),
                   cudaMemcpyHostToDevice);
        bboxesX1Y1X2Y2_data_dirtyOnCpu = false;
      }

      yolov2_detect_kernel41<<<db_grid, db_block>>>(*gpu_bboxPred_data,
        *e_gpu_bboxPred_size, *gpu_bboxesX1Y1X2Y2_data);
    }

    cudaMemcpy(gpu_scorePred_size, &scorePred_size[0], 4ULL,
               cudaMemcpyHostToDevice);
    yolov2_detect_kernel42<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (*gpu_scorePred_size, count, *b_gpu_idx_size, gpu_i3, gpu_i2);
    cudaMemcpy(&b_idx_size[0], b_gpu_idx_size, 8ULL, cudaMemcpyDeviceToHost);
    cudaMemcpy(&i3, gpu_i3, 2ULL, cudaMemcpyDeviceToHost);
    cudaMemcpy(&i2, gpu_i2, 2ULL, cudaMemcpyDeviceToHost);
    eb_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + (i3 - i2)),
      &eb_grid, &eb_block, 1024U, 65535U);
    if (eb_validLaunchParams) {
      yolov2_detect_kernel43<<<eb_grid, eb_block>>>(gpu_i2, gpu_i3,
        *b_gpu_idx_data);
    }

    nxin = scorePred_size[0];
    b_b_size[0] = 1;
    b_b_size[1] = scorePred_size[0];
    fb_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + (scorePred_size
      [0] - 1)), &fb_grid, &fb_block, 1024U, 65535U);
    if (fb_validLaunchParams) {
      yolov2_detect_kernel44<<<fb_grid, fb_block>>>(*gpu_scorePred_size,
        *b_gpu_b_data);
      b_b_data_dirtyOnGpu = true;
    }

    i0 = static_cast<int16_T>((scorePred_size[0] - count));
    gb_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + (i0 - 1)),
      &gb_grid, &gb_block, 1024U, 65535U);
    if (gb_validLaunchParams) {
      yolov2_detect_kernel45<<<gb_grid, gb_block>>>(*b_gpu_idx_data, i0,
        *b_gpu_b_data);
      b_b_data_dirtyOnGpu = true;
    }

    nx = 0;
    i0 = b_b_size[1];
    hb_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + (i0 - 1)),
      &hb_grid, &hb_block, 1024U, 65535U);
    if (hb_validLaunchParams) {
      cudaMemcpy(gpu_nx, &nx, 4ULL, cudaMemcpyHostToDevice);
      cudaMemcpy(b_gpu_b_size, &b_b_size[0], 8ULL, cudaMemcpyHostToDevice);
      yolov2_detect_kernel46<<<hb_grid, hb_block>>>(*b_gpu_b_data, i0, gpu_nx);
      nx_dirtyOnGpu = true;
    }

    if (nx_dirtyOnGpu) {
      cudaMemcpy(&nx, gpu_nx, 4ULL, cudaMemcpyDeviceToHost);
      nx_dirtyOnGpu = false;
    }

    nrowx = scorePred_size[0] - nx;
    nx = -1;
    for (endR = 0; endR < nxin; endR++) {
      guard1 = false;
      if (1 + endR > b_b_size[1]) {
        guard1 = true;
      } else {
        if (b_b_data_dirtyOnGpu) {
          cudaMemcpy(&b_b_data[0], b_gpu_b_data, b_b_size[0] * b_b_size[1] *
                     sizeof(boolean_T), cudaMemcpyDeviceToHost);
          b_b_data_dirtyOnGpu = false;
        }

        if (!b_b_data[endR]) {
          guard1 = true;
        }
      }

      if (guard1) {
        nx++;
        if (scorePred_data_dirtyOnGpu) {
          cudaMemcpy(&scorePred_data[0], gpu_scorePred_data, scorePred_size[0] *
                     sizeof(real32_T), cudaMemcpyDeviceToHost);
          scorePred_data_dirtyOnGpu = false;
        }

        scorePred_data[nx] = scorePred_data[endR];
        scorePred_data_dirtyOnCpu = true;
      }
    }

    if (1 > nrowx) {
      scorePred_size[0] = 0;
    } else {
      scorePred_size[0] = nrowx;
    }

    cudaMemcpy(gpu_classPred_size, &classPred_size[0], 4ULL,
               cudaMemcpyHostToDevice);
    yolov2_detect_kernel47<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (*gpu_classPred_size, count, *c_gpu_idx_size, gpu_i3, gpu_i2);
    cudaMemcpy(&c_idx_size[0], c_gpu_idx_size, 8ULL, cudaMemcpyDeviceToHost);
    cudaMemcpy(&i3, gpu_i3, 2ULL, cudaMemcpyDeviceToHost);
    cudaMemcpy(&i2, gpu_i2, 2ULL, cudaMemcpyDeviceToHost);
    ib_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + (i3 - i2)),
      &ib_grid, &ib_block, 1024U, 65535U);
    if (ib_validLaunchParams) {
      yolov2_detect_kernel48<<<ib_grid, ib_block>>>(gpu_i2, gpu_i3,
        *c_gpu_idx_data);
    }

    nxin = classPred_size[0];
    c_b_size[0] = 1;
    c_b_size[1] = classPred_size[0];
    jb_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + (classPred_size
      [0] - 1)), &jb_grid, &jb_block, 1024U, 65535U);
    if (jb_validLaunchParams) {
      yolov2_detect_kernel49<<<jb_grid, jb_block>>>(*gpu_classPred_size,
        *c_gpu_b_data);
      b_data_dirtyOnGpu = true;
    }

    i0 = static_cast<int16_T>((classPred_size[0] - count));
    kb_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + (i0 - 1)),
      &kb_grid, &kb_block, 1024U, 65535U);
    if (kb_validLaunchParams) {
      yolov2_detect_kernel50<<<kb_grid, kb_block>>>(*c_gpu_idx_data, i0,
        *c_gpu_b_data);
      b_data_dirtyOnGpu = true;
    }

    nx = 0;
    i0 = c_b_size[1];
    lb_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + (i0 - 1)),
      &lb_grid, &lb_block, 1024U, 65535U);
    if (lb_validLaunchParams) {
      cudaMemcpy(gpu_nx, &nx, 4ULL, cudaMemcpyHostToDevice);
      cudaMemcpy(c_gpu_b_size, &c_b_size[0], 8ULL, cudaMemcpyHostToDevice);
      yolov2_detect_kernel51<<<lb_grid, lb_block>>>(*c_gpu_b_data, i0, gpu_nx);
      nx_dirtyOnGpu = true;
    }

    if (nx_dirtyOnGpu) {
      cudaMemcpy(&nx, gpu_nx, 4ULL, cudaMemcpyDeviceToHost);
    }

    nrowx = classPred_size[0] - nx;
    nx = -1;
    for (endR = 0; endR < nxin; endR++) {
      guard1 = false;
      if (1 + endR > c_b_size[1]) {
        guard1 = true;
      } else {
        if (b_data_dirtyOnGpu) {
          cudaMemcpy(&c_b_data[0], c_gpu_b_data, c_b_size[0] * c_b_size[1] *
                     sizeof(boolean_T), cudaMemcpyDeviceToHost);
          b_data_dirtyOnGpu = false;
        }

        if (!c_b_data[endR]) {
          guard1 = true;
        }
      }

      if (guard1) {
        nx++;
        if (classPred_data_dirtyOnGpu) {
          cudaMemcpy(&classPred_data[0], gpu_classPred_data, classPred_size[0] *
                     sizeof(real32_T), cudaMemcpyDeviceToHost);
          classPred_data_dirtyOnGpu = false;
        }

        classPred_data[nx] = classPred_data[endR];
        classPred_data_dirtyOnCpu = true;
      }
    }

    if (1 > nrowx) {
      classPred_size[0] = 0;
    } else {
      classPred_size[0] = nrowx;
    }

    if (d_bboxPred_size[0] == 0) {
      bboxes_size[0] = 0;
      bboxes_size[1] = 4;
      bboxes_size_dirtyOnGpu = false;
      bboxes_size_dirtyOnCpu = true;
    } else {
      x_size[0] = scorePred_size[0];
      mb_validLaunchParams = mwGetLaunchParameters((real_T)(1LL +
        (scorePred_size[0] - 1)), &mb_grid, &mb_block, 1024U, 65535U);
      if (mb_validLaunchParams) {
        cudaMemcpy(gpu_scorePred_size, &scorePred_size[0], 4ULL,
                   cudaMemcpyHostToDevice);
        if (scorePred_data_dirtyOnCpu) {
          cudaMemcpy(gpu_scorePred_data, &scorePred_data[0], scorePred_size[0] *
                     sizeof(real32_T), cudaMemcpyHostToDevice);
        }

        yolov2_detect_kernel52<<<mb_grid, mb_block>>>(*gpu_scorePred_data,
          *gpu_scorePred_size, *gpu_x_data);
        x_data_dirtyOnGpu = true;
      }

      if (x_data_dirtyOnGpu) {
        cudaMemcpy(&x_data[0], gpu_x_data, x_size[0] * sizeof(real32_T),
                   cudaMemcpyDeviceToHost);
      }

      sort(x_data, x_size, iidx_data, iidx_size);
      iidx_data_dirtyOnCpu = true;
      cudaMemcpy(gpu_iidx_size, &iidx_size[0], 4ULL, cudaMemcpyHostToDevice);
      yolov2_detect_kernel53<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
        (*gpu_iidx_size, *gpu_inputBbox_size);
      cudaMemcpy(&inputBbox_size[0], gpu_inputBbox_size, 8ULL,
                 cudaMemcpyDeviceToHost);
      nb_validLaunchParams = mwGetLaunchParameters((real_T)((1LL + (iidx_size[0]
        - 1)) * 4LL), &nb_grid, &nb_block, 1024U, 65535U);
      if (nb_validLaunchParams) {
        cudaMemcpy(gpu_iidx_data, &iidx_data[0], iidx_size[0] * sizeof(int32_T),
                   cudaMemcpyHostToDevice);
        iidx_data_dirtyOnCpu = false;
        if (bboxesX1Y1X2Y2_data_dirtyOnCpu) {
          cudaMemcpy(gpu_bboxesX1Y1X2Y2_data, &bboxesX1Y1X2Y2_data[0],
                     d_bboxPred_size[0] * d_bboxPred_size[1] * sizeof(real_T),
                     cudaMemcpyHostToDevice);
          bboxesX1Y1X2Y2_data_dirtyOnCpu = false;
        }

        yolov2_detect_kernel54<<<nb_grid, nb_block>>>(*gpu_bboxesX1Y1X2Y2_data, *
          d_gpu_bboxPred_size, *gpu_iidx_data, *gpu_inputBbox_size,
          *gpu_iidx_size, *gpu_inputBbox_data);
        inputBbox_data_dirtyOnGpu = true;
      }

      inputLabel_size[0] = iidx_size[0];
      ob_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + (iidx_size[0]
        - 1)), &ob_grid, &ob_block, 1024U, 65535U);
      if (ob_validLaunchParams) {
        if (iidx_data_dirtyOnCpu) {
          cudaMemcpy(gpu_iidx_data, &iidx_data[0], iidx_size[0] * sizeof(int32_T),
                     cudaMemcpyHostToDevice);
          iidx_data_dirtyOnCpu = false;
        }

        if (classPred_data_dirtyOnCpu) {
          cudaMemcpy(gpu_classPred_data, &classPred_data[0], classPred_size[0] *
                     sizeof(real32_T), cudaMemcpyHostToDevice);
        }

        yolov2_detect_kernel55<<<ob_grid, ob_block>>>(*gpu_classPred_data,
          *gpu_iidx_data, *gpu_iidx_size, *gpu_inputLabel_data);
        inputLabel_data_dirtyOnGpu = true;
      }

      isKept_size[0] = iidx_size[0];
      pb_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + (iidx_size[0]
        - 1)), &pb_grid, &pb_block, 1024U, 65535U);
      if (pb_validLaunchParams) {
        yolov2_detect_kernel56<<<pb_grid, pb_block>>>(*gpu_iidx_size,
          *gpu_isKept_data);
        isKept_data_dirtyOnGpu = true;
      }

      i0 = iidx_size[0] - 1;
      area_size[0] = iidx_size[0];
      qb_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + i0), &qb_grid,
        &qb_block, 1024U, 65535U);
      if (qb_validLaunchParams) {
        yolov2_detect_kernel57<<<qb_grid, qb_block>>>(*gpu_inputBbox_data,
          *gpu_inputBbox_size, i0, *gpu_area_data);
        area_data_dirtyOnGpu = true;
      }

      i0 = iidx_size[0] - 1;
      b_x2_size[0] = iidx_size[0];
      rb_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + i0), &rb_grid,
        &rb_block, 1024U, 65535U);
      if (rb_validLaunchParams) {
        yolov2_detect_kernel58<<<rb_grid, rb_block>>>(*gpu_inputBbox_size,
          *gpu_inputBbox_data, i0, *b_gpu_x2_data);
        x2_data_dirtyOnGpu = true;
      }

      i0 = iidx_size[0] - 1;
      b_y2_size[0] = iidx_size[0];
      sb_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + i0), &sb_grid,
        &sb_block, 1024U, 65535U);
      if (sb_validLaunchParams) {
        yolov2_detect_kernel59<<<sb_grid, sb_block>>>(*gpu_inputBbox_data,
          *gpu_inputBbox_size, i0, *b_gpu_y2_data);
        y2_data_dirtyOnGpu = true;
      }

      i0 = iidx_size[0];
      for (i = 0; i < i0; i++) {
        if (isKept_data_dirtyOnGpu) {
          cudaMemcpy(&isKept_data[0], gpu_isKept_data, isKept_size[0] * sizeof
                     (boolean_T), cudaMemcpyDeviceToHost);
          isKept_data_dirtyOnGpu = false;
        }

        if (isKept_data[i]) {
          i1 = (iidx_size[0] - i) - 2;
          for (nxin = 0; nxin <= i1; nxin++) {
            nx = (i + nxin) + 1;
            if (isKept_data[nx]) {
              if (inputLabel_data_dirtyOnGpu) {
                cudaMemcpy(&inputLabel_data[0], gpu_inputLabel_data,
                           inputLabel_size[0] * sizeof(real_T),
                           cudaMemcpyDeviceToHost);
                inputLabel_data_dirtyOnGpu = false;
              }

              if (!(inputLabel_data[nx] != inputLabel_data[i])) {
                if (x2_data_dirtyOnGpu) {
                  cudaMemcpy(&x2_data[0], b_gpu_x2_data, b_x2_size[0] * sizeof
                             (real_T), cudaMemcpyDeviceToHost);
                  x2_data_dirtyOnGpu = false;
                }

                if ((x2_data[i] < x2_data[nx]) || rtIsNaN(x2_data[nx])) {
                  height = x2_data[i];
                } else {
                  height = x2_data[nx];
                }

                if (inputBbox_data_dirtyOnGpu) {
                  cudaMemcpy(&inputBbox_data[0], gpu_inputBbox_data,
                             inputBbox_size[0] * inputBbox_size[1] * sizeof
                             (real_T), cudaMemcpyDeviceToHost);
                  inputBbox_data_dirtyOnGpu = false;
                }

                if ((inputBbox_data[i] > inputBbox_data[nx]) || rtIsNaN
                    (inputBbox_data[nx])) {
                  numMissingGlyph = inputBbox_data[i];
                } else {
                  numMissingGlyph = inputBbox_data[nx];
                }

                width = height - numMissingGlyph;
                if (!(width <= 0.0)) {
                  if (y2_data_dirtyOnGpu) {
                    cudaMemcpy(&y2_data[0], b_gpu_y2_data, b_y2_size[0] * sizeof
                               (real_T), cudaMemcpyDeviceToHost);
                    y2_data_dirtyOnGpu = false;
                  }

                  if ((y2_data[i] < y2_data[nx]) || rtIsNaN(y2_data[nx])) {
                    height = y2_data[i];
                  } else {
                    height = y2_data[nx];
                  }

                  if ((inputBbox_data[i + inputBbox_size[0]] > inputBbox_data[nx
                       + inputBbox_size[0]]) || rtIsNaN(inputBbox_data[nx +
                       inputBbox_size[0]])) {
                    numMissingGlyph = inputBbox_data[i + inputBbox_size[0]];
                  } else {
                    numMissingGlyph = inputBbox_data[nx + inputBbox_size[0]];
                  }

                  height -= numMissingGlyph;
                  if (!(height <= 0.0)) {
                    height *= width;
                    if (area_data_dirtyOnGpu) {
                      cudaMemcpy(&area_data[0], gpu_area_data, area_size[0] *
                                 sizeof(real_T), cudaMemcpyDeviceToHost);
                      area_data_dirtyOnGpu = false;
                    }

                    if (height / ((area_data[i] + area_data[nx]) - height) > 0.5)
                    {
                      isKept_data[nx] = false;
                    }
                  }
                }
              }
            }
          }
        }
      }

      nx = isKept_size[0];
      nxin = 0;
      ii_size[0] = isKept_size[0];
      ii = 1;
      exitg1 = false;
      while ((!exitg1) && (ii <= nx)) {
        if (isKept_data_dirtyOnGpu) {
          cudaMemcpy(&isKept_data[0], gpu_isKept_data, isKept_size[0] * sizeof
                     (boolean_T), cudaMemcpyDeviceToHost);
          isKept_data_dirtyOnGpu = false;
        }

        if (isKept_data[ii - 1]) {
          nxin++;
          ii_data[nxin - 1] = static_cast<int16_T>(ii);
          ii_data_dirtyOnCpu = true;
          if (nxin >= nx) {
            exitg1 = true;
          } else {
            ii++;
          }
        } else {
          ii++;
        }
      }

      if (isKept_size[0] == 1) {
        if (nxin == 0) {
          ii_size[0] = 0;
        }
      } else if (1 > nxin) {
        ii_size[0] = 0;
      } else {
        ii_size[0] = nxin;
      }

      index_size[0] = ii_size[0];
      tb_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + (ii_size[0] -
        1)), &tb_grid, &tb_block, 1024U, 65535U);
      if (tb_validLaunchParams) {
        if (iidx_data_dirtyOnCpu) {
          cudaMemcpy(gpu_iidx_data, &iidx_data[0], iidx_size[0] * sizeof(int32_T),
                     cudaMemcpyHostToDevice);
          iidx_data_dirtyOnCpu = false;
        }

        cudaMemcpy(gpu_ii_size, &ii_size[0], 4ULL, cudaMemcpyHostToDevice);
        if (ii_data_dirtyOnCpu) {
          cudaMemcpy(gpu_ii_data, &ii_data[0], ii_size[0] * sizeof(int16_T),
                     cudaMemcpyHostToDevice);
        }

        yolov2_detect_kernel60<<<tb_grid, tb_block>>>(*gpu_iidx_data,
          *gpu_ii_data, *gpu_ii_size, *gpu_index_data);
      }

      cudaMemcpy(gpu_index_size, &index_size[0], 4ULL, cudaMemcpyHostToDevice);
      yolov2_detect_kernel61<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
        (*gpu_bboxes_size, *gpu_index_data, *gpu_index_size);
      bboxes_size_dirtyOnCpu = false;
      cudaMemcpy(&bboxes_size[0], gpu_bboxes_size, 8ULL, cudaMemcpyDeviceToHost);
      bboxes_size_dirtyOnGpu = false;
      cudaMemcpy(&index_size[0], gpu_index_size, 4ULL, cudaMemcpyDeviceToHost);
      ub_validLaunchParams = mwGetLaunchParameters((real_T)((1LL + (index_size[0]
        - 1)) * 4LL), &ub_grid, &ub_block, 1024U, 65535U);
      if (ub_validLaunchParams) {
        if (bboxesX1Y1X2Y2_data_dirtyOnCpu) {
          cudaMemcpy(gpu_bboxesX1Y1X2Y2_data, &bboxesX1Y1X2Y2_data[0],
                     d_bboxPred_size[0] * d_bboxPred_size[1] * sizeof(real_T),
                     cudaMemcpyHostToDevice);
        }

        yolov2_detect_kernel62<<<ub_grid, ub_block>>>(*gpu_bboxesX1Y1X2Y2_data, *
          d_gpu_bboxPred_size, *gpu_index_data, *gpu_bboxes_size,
          *gpu_index_size, *gpu_bboxes_data);
      }
    }

    if (bboxes_size_dirtyOnGpu) {
      cudaMemcpy(&bboxes_size[0], gpu_bboxes_size, 8ULL, cudaMemcpyDeviceToHost);
    }

    labels_size[0] = bboxes_size[0];
    i0 = bboxes_size[0] - 1;
    vb_validLaunchParams = mwGetLaunchParameters((real_T)(7LL * (1LL + i0)),
      &vb_grid, &vb_block, 1024U, 65535U);
    if (vb_validLaunchParams) {
      cudaMemcpy(gpu_cv0, (void *)&cv0[0], 7ULL, cudaMemcpyHostToDevice);
      yolov2_detect_kernel63<<<vb_grid, vb_block>>>(*gpu_cv0, i0,
        *gpu_labels_data);
    }
  } else {
    bboxes_size[0] = 0;
    bboxes_size[1] = 4;
    bboxes_size_dirtyOnCpu = true;
    labels_size[0] = 0;
  }

  /*  convert categorical labels to cell array of charactor vectors for MATLAB */
  /*  execution */
  /*  Annotate detections in the image. */
  if (bboxes_size_dirtyOnCpu) {
    cudaMemcpy(gpu_bboxes_size, &bboxes_size[0], 8ULL, cudaMemcpyHostToDevice);
  }

  yolov2_detect_kernel64<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*gpu_bboxes_size, *gpu_positionOut_size);
  cudaMemcpy(&positionOut_size[0], gpu_positionOut_size, 8ULL,
             cudaMemcpyDeviceToHost);
  wb_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + (bboxes_size[0] *
    4 - 1)), &wb_grid, &wb_block, 1024U, 65535U);
  if (wb_validLaunchParams) {
    yolov2_detect_kernel65<<<wb_grid, wb_block>>>(*gpu_bboxes_data,
      *gpu_bboxes_size, *gpu_positionOut_data);
    positionOut_data_dirtyOnGpu = true;
  }

  isEmpty = (positionOut_size[0] == 0);
  colorRGB_size[0] = static_cast<int16_T>(positionOut_size[0]);
  colorRGB_size[1] = 3;
  colorRGB_size_dirtyOnGpu = false;
  colorRGB_size_dirtyOnCpu = true;
  nx = static_cast<int16_T>(positionOut_size[0]);
  xb_validLaunchParams = mwGetLaunchParameters((real_T)((1LL + (nx - 1)) * 3LL),
    &xb_grid, &xb_block, 1024U, 65535U);
  if (xb_validLaunchParams) {
    cudaMemcpy(gpu_nx, &nx, 4ULL, cudaMemcpyHostToDevice);
    cudaMemcpy(gpu_uv0, (void *)&uv0[0], 3ULL, cudaMemcpyHostToDevice);
    yolov2_detect_kernel66<<<xb_grid, xb_block>>>(*gpu_uv0, gpu_nx,
      *gpu_colorRGB_data);
    colorRGB_data_dirtyOnGpu = true;
  }

  yolov2_detect_kernel67<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*gpu_positionOut_size, *gpu_colorRGB_size);
  nx = static_cast<int16_T>(positionOut_size[0]);
  cudaMemcpy(&b_colorRGB_size[0], gpu_colorRGB_size, 8ULL,
             cudaMemcpyDeviceToHost);
  yb_validLaunchParams = mwGetLaunchParameters((real_T)((1LL + (nx - 1)) * 3LL),
    &yb_grid, &yb_block, 1024U, 65535U);
  if (yb_validLaunchParams) {
    cudaMemcpy(gpu_nx, &nx, 4ULL, cudaMemcpyHostToDevice);
    yolov2_detect_kernel68<<<yb_grid, yb_block>>>(gpu_nx, *b_gpu_colorRGB_data);
  }

  yolov2_detect_kernel69<<<dim3(294U, 1U, 1U), dim3(512U, 1U, 1U)>>>(*gpu_in,
    *gpu_outImg);
  outImg_dirtyOnGpu = true;
  if (!isEmpty) {
    if (colorRGB_size[0] == 1) {
      yolov2_detect_kernel71<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
        (*gpu_positionOut_size, *gpu_color_size);
      nx = static_cast<int16_T>(positionOut_size[0]);
      cudaMemcpy(&color_size[0], gpu_color_size, 8ULL, cudaMemcpyDeviceToHost);
      color_size_dirtyOnGpu = false;
      bc_validLaunchParams = mwGetLaunchParameters((real_T)((1LL + (nx - 1)) *
        3LL), &bc_grid, &bc_block, 1024U, 65535U);
      if (bc_validLaunchParams) {
        cudaMemcpy(gpu_nx, &nx, 4ULL, cudaMemcpyHostToDevice);
        yolov2_detect_kernel72<<<bc_grid, bc_block>>>(*gpu_colorRGB_data, gpu_nx,
          *gpu_color_data);
        color_data_dirtyOnGpu = true;
      }
    } else {
      color_size[0] = colorRGB_size[0];
      color_size[1] = 3;
      color_size_dirtyOnGpu = false;
      ac_validLaunchParams = mwGetLaunchParameters((real_T)(1LL +
        (colorRGB_size[0] * 3 - 1)), &ac_grid, &ac_block, 1024U, 65535U);
      if (ac_validLaunchParams) {
        cudaMemcpy(b_gpu_colorRGB_size, &colorRGB_size[0], 8ULL,
                   cudaMemcpyHostToDevice);
        colorRGB_size_dirtyOnCpu = false;
        yolov2_detect_kernel70<<<ac_grid, ac_block>>>(*gpu_colorRGB_data,
          *b_gpu_colorRGB_size, *gpu_color_data);
        color_data_dirtyOnGpu = true;
      }
    }

    if (!h3111_not_empty) {
      obj = &h3111;
      h3111.isInitialized = 0;
      h3111.c_NoTuningBeforeLockingCodeGenE = true;

      /* System object Constructor function: vision.ShapeInserter */
      obj->cSFunObject.P0_RTP_LINEWIDTH = 1;
      h3111.LineWidth = 1.0;
      h3111.c_NoTuningBeforeLockingCodeGenE = false;
      h3111.matlabCodegenIsDeleted = false;
      h3111_not_empty = true;
      h3111.isSetupComplete = false;
      h3111.isInitialized = 1;
      h3111.c_NoTuningBeforeLockingCodeGenE = true;
      h3111.isSetupComplete = true;
    }

    if (1.0 != h3111.LineWidth) {
      h3111.cSFunObject.P0_RTP_LINEWIDTH = 1;
      h3111.LineWidth = 1.0;
    }

    if (h3111.isInitialized != 1) {
      h3111.isSetupComplete = false;
      h3111.isInitialized = 1;
      h3111.c_NoTuningBeforeLockingCodeGenE = true;
      h3111.isSetupComplete = true;
    }

    b_obj = &h3111.cSFunObject;

    /* System object Outputs function: vision.ShapeInserter */
    endC_im = positionOut_size[0];
    if (color_size_dirtyOnGpu) {
      cudaMemcpy(&color_size[0], gpu_color_size, 8ULL, cudaMemcpyDeviceToHost);
    }

    numFillColor = color_size[0];

    /* Copy the image from input to output. */
    if (((positionOut_size[0] == 1) || (color_size[0] == 1) ||
         (positionOut_size[0] == color_size[0])) && (positionOut_size[0] > 0) &&
        (color_size[0] > 0)) {
      /* Update view port. */
      /* Draw all rectangles. */
      idxFillColor = 0;
      for (idxROI = 0; idxROI < 784; idxROI++) {
        if (idxROI < endC_im) {
          if (positionOut_data_dirtyOnGpu) {
            cudaMemcpy(&positionOut_data[0], gpu_positionOut_data,
                       positionOut_size[0] * positionOut_size[1] * sizeof
                       (int32_T), cudaMemcpyDeviceToHost);
            positionOut_data_dirtyOnGpu = false;
          }

          firstRow = positionOut_data[idxROI + endC_im] - 1;
          penY = positionOut_data[idxROI] - 1;
          yy = (firstRow + positionOut_data[idxROI + 3 * endC_im]) - 1;
          endR_im = (positionOut_data[idxROI] + positionOut_data[idxROI +
                     (endC_im << 1)]) - 2;
          if (b_obj->P0_RTP_LINEWIDTH > 1) {
            nx = b_obj->P0_RTP_LINEWIDTH >> 1;
            firstRow -= nx;
            yy += nx;
            penY = (positionOut_data[idxROI] - nx) - 1;
            endR_im += nx;
          }

          if ((firstRow <= yy) && (penY <= endR_im)) {
            for (ii = 0; ii < b_obj->P0_RTP_LINEWIDTH; ii++) {
              yolov2_detect_kernel73<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
                (endR_im, penY, ii, firstRow, *gpu_line);
              b_line_dirtyOnGpu = true;
              isEmpty = false;
              visited1 = false;
              visited2 = false;
              done = false;
              if (line_dirtyOnCpu) {
                cudaMemcpy(b_gpu_line, &b_line[0], 16ULL, cudaMemcpyHostToDevice);
                line_dirtyOnCpu = false;
              }

              yolov2_detect_kernel74<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
                (*gpu_line, *b_gpu_line);
              line_dirtyOnGpu = true;
              while (!done) {
                nx = 0;
                nxin = 0;

                /* Determine viewport violations. */
                if (line_dirtyOnGpu) {
                  cudaMemcpy(&b_line[0], b_gpu_line, 16ULL,
                             cudaMemcpyDeviceToHost);
                  line_dirtyOnGpu = false;
                }

                if (b_line[0U] < 0) {
                  nx = 4;
                } else {
                  if (b_line[0U] > 223) {
                    nx = 8;
                  }
                }

                if (b_line[2U] < 0) {
                  nxin = 4;
                } else {
                  if (b_line[2U] > 223) {
                    nxin = 8;
                  }
                }

                if (b_line[1U] < 0) {
                  nx = static_cast<int32_T>((nx | 1U));
                } else {
                  if (b_line[1U] > 223) {
                    nx = static_cast<int32_T>((nx | 2U));
                  }
                }

                if (b_line[3U] < 0) {
                  nxin = static_cast<int32_T>((nxin | 1U));
                } else {
                  if (b_line[3U] > 223) {
                    nxin = static_cast<int32_T>((nxin | 2U));
                  }
                }

                if ((static_cast<uint32_T>(nx) | nxin) == 0U) {
                  /* Line falls completely within bounds. */
                  done = true;
                  isEmpty = true;
                } else if ((static_cast<uint32_T>(nx) & nxin) != 0U) {
                  /* Line falls completely out of bounds. */
                  done = true;
                  isEmpty = false;
                } else if (static_cast<uint32_T>(nx) != 0U) {
                  /* Clip 1st point; if it's in-bounds, clip 2nd point. */
                  if (visited1) {
                    if (b_line_dirtyOnGpu) {
                      cudaMemcpy(&line[0], gpu_line, 16ULL,
                                 cudaMemcpyDeviceToHost);
                      b_line_dirtyOnGpu = false;
                    }

                    b_line[0U] = line[0U];
                    b_line[1U] = penY;
                    line_dirtyOnCpu = true;
                  }

                  nrowx = b_line[2U] - b_line[0U];
                  nrows = b_line[3U] - b_line[1U];
                  if ((nrowx > 1073741824) || (nrowx < -1073741824) || ((nrows >
                        1073741824) || (nrows < -1073741824))) {
                    /* Possible Inf or Nan. */
                    done = true;
                    isEmpty = false;
                    visited1 = true;
                  } else if ((nx & 4U) != 0U) {
                    /* Violated RMin. */
                    nx = -b_line[0U] * nrows;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrowx >= 0)) || ((nx < 0) &&
                                (nrowx < 0))) {
                      b_line[1U] += (div_s32_floor(nx << 1, nrowx) + 1) >> 1;
                    } else {
                      b_line[1U] -= (div_s32_floor(-nx << 1, nrowx) + 1) >> 1;
                    }

                    b_line[0U] = 0;
                    line_dirtyOnCpu = true;
                    visited1 = true;
                  } else if ((nx & 8U) != 0U) {
                    /* Violated RMax. */
                    nx = (223 - b_line[0U]) * nrows;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrowx >= 0)) || ((nx < 0) &&
                                (nrowx < 0))) {
                      b_line[1U] += (div_s32_floor(nx << 1, nrowx) + 1) >> 1;
                    } else {
                      b_line[1U] -= (div_s32_floor(-nx << 1, nrowx) + 1) >> 1;
                    }

                    b_line[0U] = 223;
                    line_dirtyOnCpu = true;
                    visited1 = true;
                  } else if ((nx & 1U) != 0U) {
                    /* Violated CMin. */
                    nx = -b_line[1U] * nrowx;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrows >= 0)) || ((nx < 0) &&
                                (nrows < 0))) {
                      b_line[0U] += (div_s32_floor(nx << 1, nrows) + 1) >> 1;
                    } else {
                      b_line[0U] -= (div_s32_floor(-nx << 1, nrows) + 1) >> 1;
                    }

                    b_line[1U] = 0;
                    line_dirtyOnCpu = true;
                    visited1 = true;
                  } else {
                    /* Violated CMax. */
                    nx = (223 - b_line[1U]) * nrowx;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrows >= 0)) || ((nx < 0) &&
                                (nrows < 0))) {
                      b_line[0U] += (div_s32_floor(nx << 1, nrows) + 1) >> 1;
                    } else {
                      b_line[0U] -= (div_s32_floor(-nx << 1, nrows) + 1) >> 1;
                    }

                    b_line[1U] = 223;
                    line_dirtyOnCpu = true;
                    visited1 = true;
                  }
                } else {
                  /* Clip the 2nd point. */
                  if (visited2) {
                    if (b_line_dirtyOnGpu) {
                      cudaMemcpy(&line[0], gpu_line, 16ULL,
                                 cudaMemcpyDeviceToHost);
                      b_line_dirtyOnGpu = false;
                    }

                    b_line[2U] = line[2U];
                    b_line[3U] = endR_im;
                    line_dirtyOnCpu = true;
                  }

                  nrowx = b_line[2U] - b_line[0U];
                  nrows = b_line[3U] - b_line[1U];
                  if ((nrowx > 1073741824) || (nrowx < -1073741824) || ((nrows >
                        1073741824) || (nrows < -1073741824))) {
                    /* Possible Inf or Nan. */
                    done = true;
                    isEmpty = false;
                    visited2 = true;
                  } else if ((nxin & 4U) != 0U) {
                    /* Violated RMin. */
                    nx = -b_line[2U] * nrows;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrowx >= 0)) || ((nx < 0) &&
                                (nrowx < 0))) {
                      b_line[3U] += (div_s32_floor(nx << 1, nrowx) + 1) >> 1;
                    } else {
                      b_line[3U] -= (div_s32_floor(-nx << 1, nrowx) + 1) >> 1;
                    }

                    b_line[2U] = 0;
                    line_dirtyOnCpu = true;
                    visited2 = true;
                  } else if ((nxin & 8U) != 0U) {
                    /* Violated RMax. */
                    nx = (223 - b_line[2U]) * nrows;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrowx >= 0)) || ((nx < 0) &&
                                (nrowx < 0))) {
                      b_line[3U] += (div_s32_floor(nx << 1, nrowx) + 1) >> 1;
                    } else {
                      b_line[3U] -= (div_s32_floor(-nx << 1, nrowx) + 1) >> 1;
                    }

                    b_line[2U] = 223;
                    line_dirtyOnCpu = true;
                    visited2 = true;
                  } else if ((nxin & 1U) != 0U) {
                    /* Violated CMin. */
                    nx = -b_line[3U] * nrowx;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrows >= 0)) || ((nx < 0) &&
                                (nrows < 0))) {
                      b_line[2U] += (div_s32_floor(nx << 1, nrows) + 1) >> 1;
                    } else {
                      b_line[2U] -= (div_s32_floor(-nx << 1, nrows) + 1) >> 1;
                    }

                    b_line[3U] = 0;
                    line_dirtyOnCpu = true;
                    visited2 = true;
                  } else {
                    /* Violated CMax. */
                    nx = (223 - b_line[3U]) * nrowx;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrows >= 0)) || ((nx < 0) &&
                                (nrows < 0))) {
                      b_line[2U] += (div_s32_floor(nx << 1, nrows) + 1) >> 1;
                    } else {
                      b_line[2U] -= (div_s32_floor(-nx << 1, nrows) + 1) >> 1;
                    }

                    b_line[3U] = 223;
                    line_dirtyOnCpu = true;
                    visited2 = true;
                  }
                }
              }

              if (isEmpty) {
                if (line_dirtyOnGpu) {
                  cudaMemcpy(&b_line[0], b_gpu_line, 16ULL,
                             cudaMemcpyDeviceToHost);
                }

                nx = b_line[1U] * 224 + b_line[0U];
                nxin = b_line[1U];
                nrowx = b_line[3U];
                for (nrows = 0; nrows <= nrowx - nxin; nrows++) {
                  endR = idxFillColor;
                  for (endC_gl = 0; endC_gl < 3; endC_gl++) {
                    if (color_data_dirtyOnGpu) {
                      cudaMemcpy(&color_data[0], gpu_color_data, color_size[0] *
                                 color_size[1] * sizeof(uint8_T),
                                 cudaMemcpyDeviceToHost);
                      color_data_dirtyOnGpu = false;
                    }

                    if (outImg_dirtyOnGpu) {
                      cudaMemcpy(&outImg[0], gpu_outImg, 150528ULL,
                                 cudaMemcpyDeviceToHost);
                      outImg_dirtyOnGpu = false;
                    }

                    outImg[nx + endC_gl * 50176] = color_data[endR];
                    endR += numFillColor;
                  }

                  nx += 224;
                }
              }

              yolov2_detect_kernel75<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(yy,
                ii, penY, firstRow, *gpu_line);
              b_line_dirtyOnGpu = true;
              isEmpty = false;
              visited1 = false;
              visited2 = false;
              done = false;
              if (line_dirtyOnCpu) {
                cudaMemcpy(b_gpu_line, &b_line[0], 16ULL, cudaMemcpyHostToDevice);
                line_dirtyOnCpu = false;
              }

              yolov2_detect_kernel76<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
                (*gpu_line, *b_gpu_line);
              line_dirtyOnGpu = true;
              while (!done) {
                nx = 0;
                nxin = 0;

                /* Determine viewport violations. */
                if (line_dirtyOnGpu) {
                  cudaMemcpy(&b_line[0], b_gpu_line, 16ULL,
                             cudaMemcpyDeviceToHost);
                  line_dirtyOnGpu = false;
                }

                if (b_line[0U] < 0) {
                  nx = 4;
                } else {
                  if (b_line[0U] > 223) {
                    nx = 8;
                  }
                }

                if (b_line[2U] < 0) {
                  nxin = 4;
                } else {
                  if (b_line[2U] > 223) {
                    nxin = 8;
                  }
                }

                if (b_line[1U] < 0) {
                  nx = static_cast<int32_T>((nx | 1U));
                } else {
                  if (b_line[1U] > 223) {
                    nx = static_cast<int32_T>((nx | 2U));
                  }
                }

                if (b_line[3U] < 0) {
                  nxin = static_cast<int32_T>((nxin | 1U));
                } else {
                  if (b_line[3U] > 223) {
                    nxin = static_cast<int32_T>((nxin | 2U));
                  }
                }

                if ((static_cast<uint32_T>(nx) | nxin) == 0U) {
                  /* Line falls completely within bounds. */
                  done = true;
                  isEmpty = true;
                } else if ((static_cast<uint32_T>(nx) & nxin) != 0U) {
                  /* Line falls completely out of bounds. */
                  done = true;
                  isEmpty = false;
                } else if (static_cast<uint32_T>(nx) != 0U) {
                  /* Clip 1st point; if it's in-bounds, clip 2nd point. */
                  if (visited1) {
                    b_line[0U] = firstRow;
                    if (b_line_dirtyOnGpu) {
                      cudaMemcpy(&line[0], gpu_line, 16ULL,
                                 cudaMemcpyDeviceToHost);
                      b_line_dirtyOnGpu = false;
                    }

                    b_line[1U] = line[1U];
                    line_dirtyOnCpu = true;
                  }

                  nrowx = b_line[2U] - b_line[0U];
                  nrows = b_line[3U] - b_line[1U];
                  if ((nrowx > 1073741824) || (nrowx < -1073741824) || ((nrows >
                        1073741824) || (nrows < -1073741824))) {
                    /* Possible Inf or Nan. */
                    done = true;
                    isEmpty = false;
                    visited1 = true;
                  } else if ((nx & 4U) != 0U) {
                    /* Violated RMin. */
                    nx = -b_line[0U] * nrows;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrowx >= 0)) || ((nx < 0) &&
                                (nrowx < 0))) {
                      b_line[1U] += (div_s32_floor(nx << 1, nrowx) + 1) >> 1;
                    } else {
                      b_line[1U] -= (div_s32_floor(-nx << 1, nrowx) + 1) >> 1;
                    }

                    b_line[0U] = 0;
                    line_dirtyOnCpu = true;
                    visited1 = true;
                  } else if ((nx & 8U) != 0U) {
                    /* Violated RMax. */
                    nx = (223 - b_line[0U]) * nrows;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrowx >= 0)) || ((nx < 0) &&
                                (nrowx < 0))) {
                      b_line[1U] += (div_s32_floor(nx << 1, nrowx) + 1) >> 1;
                    } else {
                      b_line[1U] -= (div_s32_floor(-nx << 1, nrowx) + 1) >> 1;
                    }

                    b_line[0U] = 223;
                    line_dirtyOnCpu = true;
                    visited1 = true;
                  } else if ((nx & 1U) != 0U) {
                    /* Violated CMin. */
                    nx = -b_line[1U] * nrowx;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrows >= 0)) || ((nx < 0) &&
                                (nrows < 0))) {
                      b_line[0U] += (div_s32_floor(nx << 1, nrows) + 1) >> 1;
                    } else {
                      b_line[0U] -= (div_s32_floor(-nx << 1, nrows) + 1) >> 1;
                    }

                    b_line[1U] = 0;
                    line_dirtyOnCpu = true;
                    visited1 = true;
                  } else {
                    /* Violated CMax. */
                    nx = (223 - b_line[1U]) * nrowx;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrows >= 0)) || ((nx < 0) &&
                                (nrows < 0))) {
                      b_line[0U] += (div_s32_floor(nx << 1, nrows) + 1) >> 1;
                    } else {
                      b_line[0U] -= (div_s32_floor(-nx << 1, nrows) + 1) >> 1;
                    }

                    b_line[1U] = 223;
                    line_dirtyOnCpu = true;
                    visited1 = true;
                  }
                } else {
                  /* Clip the 2nd point. */
                  if (visited2) {
                    b_line[2U] = yy;
                    if (b_line_dirtyOnGpu) {
                      cudaMemcpy(&line[0], gpu_line, 16ULL,
                                 cudaMemcpyDeviceToHost);
                      b_line_dirtyOnGpu = false;
                    }

                    b_line[3U] = line[3U];
                    line_dirtyOnCpu = true;
                  }

                  nrowx = b_line[2U] - b_line[0U];
                  nrows = b_line[3U] - b_line[1U];
                  if ((nrowx > 1073741824) || (nrowx < -1073741824) || ((nrows >
                        1073741824) || (nrows < -1073741824))) {
                    /* Possible Inf or Nan. */
                    done = true;
                    isEmpty = false;
                    visited2 = true;
                  } else if ((nxin & 4U) != 0U) {
                    /* Violated RMin. */
                    nx = -b_line[2U] * nrows;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrowx >= 0)) || ((nx < 0) &&
                                (nrowx < 0))) {
                      b_line[3U] += (div_s32_floor(nx << 1, nrowx) + 1) >> 1;
                    } else {
                      b_line[3U] -= (div_s32_floor(-nx << 1, nrowx) + 1) >> 1;
                    }

                    b_line[2U] = 0;
                    line_dirtyOnCpu = true;
                    visited2 = true;
                  } else if ((nxin & 8U) != 0U) {
                    /* Violated RMax. */
                    nx = (223 - b_line[2U]) * nrows;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrowx >= 0)) || ((nx < 0) &&
                                (nrowx < 0))) {
                      b_line[3U] += (div_s32_floor(nx << 1, nrowx) + 1) >> 1;
                    } else {
                      b_line[3U] -= (div_s32_floor(-nx << 1, nrowx) + 1) >> 1;
                    }

                    b_line[2U] = 223;
                    line_dirtyOnCpu = true;
                    visited2 = true;
                  } else if ((nxin & 1U) != 0U) {
                    /* Violated CMin. */
                    nx = -b_line[3U] * nrowx;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrows >= 0)) || ((nx < 0) &&
                                (nrows < 0))) {
                      b_line[2U] += (div_s32_floor(nx << 1, nrows) + 1) >> 1;
                    } else {
                      b_line[2U] -= (div_s32_floor(-nx << 1, nrows) + 1) >> 1;
                    }

                    b_line[3U] = 0;
                    line_dirtyOnCpu = true;
                    visited2 = true;
                  } else {
                    /* Violated CMax. */
                    nx = (223 - b_line[3U]) * nrowx;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrows >= 0)) || ((nx < 0) &&
                                (nrows < 0))) {
                      b_line[2U] += (div_s32_floor(nx << 1, nrows) + 1) >> 1;
                    } else {
                      b_line[2U] -= (div_s32_floor(-nx << 1, nrows) + 1) >> 1;
                    }

                    b_line[3U] = 223;
                    line_dirtyOnCpu = true;
                    visited2 = true;
                  }
                }
              }

              if (isEmpty) {
                if (line_dirtyOnGpu) {
                  cudaMemcpy(&b_line[0], b_gpu_line, 16ULL,
                             cudaMemcpyDeviceToHost);
                }

                nx = b_line[1U] * 224 + b_line[0U];
                nxin = b_line[0U];
                nrowx = b_line[2U];
                for (nrows = 0; nrows <= nrowx - nxin; nrows++) {
                  endR = idxFillColor;
                  for (endC_gl = 0; endC_gl < 3; endC_gl++) {
                    if (color_data_dirtyOnGpu) {
                      cudaMemcpy(&color_data[0], gpu_color_data, color_size[0] *
                                 color_size[1] * sizeof(uint8_T),
                                 cudaMemcpyDeviceToHost);
                      color_data_dirtyOnGpu = false;
                    }

                    if (outImg_dirtyOnGpu) {
                      cudaMemcpy(&outImg[0], gpu_outImg, 150528ULL,
                                 cudaMemcpyDeviceToHost);
                      outImg_dirtyOnGpu = false;
                    }

                    outImg[nx + endC_gl * 50176] = color_data[endR];
                    endR += numFillColor;
                  }

                  nx++;
                }
              }

              yolov2_detect_kernel77<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
                (endR_im, penY, ii, yy, *gpu_line);
              b_line_dirtyOnGpu = true;
              isEmpty = false;
              visited1 = false;
              visited2 = false;
              done = false;
              if (line_dirtyOnCpu) {
                cudaMemcpy(b_gpu_line, &b_line[0], 16ULL, cudaMemcpyHostToDevice);
                line_dirtyOnCpu = false;
              }

              yolov2_detect_kernel78<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
                (*gpu_line, *b_gpu_line);
              line_dirtyOnGpu = true;
              while (!done) {
                nx = 0;
                nxin = 0;

                /* Determine viewport violations. */
                if (line_dirtyOnGpu) {
                  cudaMemcpy(&b_line[0], b_gpu_line, 16ULL,
                             cudaMemcpyDeviceToHost);
                  line_dirtyOnGpu = false;
                }

                if (b_line[0U] < 0) {
                  nx = 4;
                } else {
                  if (b_line[0U] > 223) {
                    nx = 8;
                  }
                }

                if (b_line[2U] < 0) {
                  nxin = 4;
                } else {
                  if (b_line[2U] > 223) {
                    nxin = 8;
                  }
                }

                if (b_line[1U] < 0) {
                  nx = static_cast<int32_T>((nx | 1U));
                } else {
                  if (b_line[1U] > 223) {
                    nx = static_cast<int32_T>((nx | 2U));
                  }
                }

                if (b_line[3U] < 0) {
                  nxin = static_cast<int32_T>((nxin | 1U));
                } else {
                  if (b_line[3U] > 223) {
                    nxin = static_cast<int32_T>((nxin | 2U));
                  }
                }

                if ((static_cast<uint32_T>(nx) | nxin) == 0U) {
                  /* Line falls completely within bounds. */
                  done = true;
                  isEmpty = true;
                } else if ((static_cast<uint32_T>(nx) & nxin) != 0U) {
                  /* Line falls completely out of bounds. */
                  done = true;
                  isEmpty = false;
                } else if (static_cast<uint32_T>(nx) != 0U) {
                  /* Clip 1st point; if it's in-bounds, clip 2nd point. */
                  if (visited1) {
                    if (b_line_dirtyOnGpu) {
                      cudaMemcpy(&line[0], gpu_line, 16ULL,
                                 cudaMemcpyDeviceToHost);
                      b_line_dirtyOnGpu = false;
                    }

                    b_line[0U] = line[0U];
                    b_line[1U] = penY;
                    line_dirtyOnCpu = true;
                  }

                  nrowx = b_line[2U] - b_line[0U];
                  nrows = b_line[3U] - b_line[1U];
                  if ((nrowx > 1073741824) || (nrowx < -1073741824) || ((nrows >
                        1073741824) || (nrows < -1073741824))) {
                    /* Possible Inf or Nan. */
                    done = true;
                    isEmpty = false;
                    visited1 = true;
                  } else if ((nx & 4U) != 0U) {
                    /* Violated RMin. */
                    nx = -b_line[0U] * nrows;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrowx >= 0)) || ((nx < 0) &&
                                (nrowx < 0))) {
                      b_line[1U] += (div_s32_floor(nx << 1, nrowx) + 1) >> 1;
                    } else {
                      b_line[1U] -= (div_s32_floor(-nx << 1, nrowx) + 1) >> 1;
                    }

                    b_line[0U] = 0;
                    line_dirtyOnCpu = true;
                    visited1 = true;
                  } else if ((nx & 8U) != 0U) {
                    /* Violated RMax. */
                    nx = (223 - b_line[0U]) * nrows;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrowx >= 0)) || ((nx < 0) &&
                                (nrowx < 0))) {
                      b_line[1U] += (div_s32_floor(nx << 1, nrowx) + 1) >> 1;
                    } else {
                      b_line[1U] -= (div_s32_floor(-nx << 1, nrowx) + 1) >> 1;
                    }

                    b_line[0U] = 223;
                    line_dirtyOnCpu = true;
                    visited1 = true;
                  } else if ((nx & 1U) != 0U) {
                    /* Violated CMin. */
                    nx = -b_line[1U] * nrowx;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrows >= 0)) || ((nx < 0) &&
                                (nrows < 0))) {
                      b_line[0U] += (div_s32_floor(nx << 1, nrows) + 1) >> 1;
                    } else {
                      b_line[0U] -= (div_s32_floor(-nx << 1, nrows) + 1) >> 1;
                    }

                    b_line[1U] = 0;
                    line_dirtyOnCpu = true;
                    visited1 = true;
                  } else {
                    /* Violated CMax. */
                    nx = (223 - b_line[1U]) * nrowx;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrows >= 0)) || ((nx < 0) &&
                                (nrows < 0))) {
                      b_line[0U] += (div_s32_floor(nx << 1, nrows) + 1) >> 1;
                    } else {
                      b_line[0U] -= (div_s32_floor(-nx << 1, nrows) + 1) >> 1;
                    }

                    b_line[1U] = 223;
                    line_dirtyOnCpu = true;
                    visited1 = true;
                  }
                } else {
                  /* Clip the 2nd point. */
                  if (visited2) {
                    if (b_line_dirtyOnGpu) {
                      cudaMemcpy(&line[0], gpu_line, 16ULL,
                                 cudaMemcpyDeviceToHost);
                      b_line_dirtyOnGpu = false;
                    }

                    b_line[2U] = line[2U];
                    b_line[3U] = endR_im;
                    line_dirtyOnCpu = true;
                  }

                  nrowx = b_line[2U] - b_line[0U];
                  nrows = b_line[3U] - b_line[1U];
                  if ((nrowx > 1073741824) || (nrowx < -1073741824) || ((nrows >
                        1073741824) || (nrows < -1073741824))) {
                    /* Possible Inf or Nan. */
                    done = true;
                    isEmpty = false;
                    visited2 = true;
                  } else if ((nxin & 4U) != 0U) {
                    /* Violated RMin. */
                    nx = -b_line[2U] * nrows;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrowx >= 0)) || ((nx < 0) &&
                                (nrowx < 0))) {
                      b_line[3U] += (div_s32_floor(nx << 1, nrowx) + 1) >> 1;
                    } else {
                      b_line[3U] -= (div_s32_floor(-nx << 1, nrowx) + 1) >> 1;
                    }

                    b_line[2U] = 0;
                    line_dirtyOnCpu = true;
                    visited2 = true;
                  } else if ((nxin & 8U) != 0U) {
                    /* Violated RMax. */
                    nx = (223 - b_line[2U]) * nrows;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrowx >= 0)) || ((nx < 0) &&
                                (nrowx < 0))) {
                      b_line[3U] += (div_s32_floor(nx << 1, nrowx) + 1) >> 1;
                    } else {
                      b_line[3U] -= (div_s32_floor(-nx << 1, nrowx) + 1) >> 1;
                    }

                    b_line[2U] = 223;
                    line_dirtyOnCpu = true;
                    visited2 = true;
                  } else if ((nxin & 1U) != 0U) {
                    /* Violated CMin. */
                    nx = -b_line[3U] * nrowx;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrows >= 0)) || ((nx < 0) &&
                                (nrows < 0))) {
                      b_line[2U] += (div_s32_floor(nx << 1, nrows) + 1) >> 1;
                    } else {
                      b_line[2U] -= (div_s32_floor(-nx << 1, nrows) + 1) >> 1;
                    }

                    b_line[3U] = 0;
                    line_dirtyOnCpu = true;
                    visited2 = true;
                  } else {
                    /* Violated CMax. */
                    nx = (223 - b_line[3U]) * nrowx;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrows >= 0)) || ((nx < 0) &&
                                (nrows < 0))) {
                      b_line[2U] += (div_s32_floor(nx << 1, nrows) + 1) >> 1;
                    } else {
                      b_line[2U] -= (div_s32_floor(-nx << 1, nrows) + 1) >> 1;
                    }

                    b_line[3U] = 223;
                    line_dirtyOnCpu = true;
                    visited2 = true;
                  }
                }
              }

              if (isEmpty) {
                if (line_dirtyOnGpu) {
                  cudaMemcpy(&b_line[0], b_gpu_line, 16ULL,
                             cudaMemcpyDeviceToHost);
                }

                nx = b_line[1U] * 224 + b_line[0U];
                nxin = b_line[1U];
                nrowx = b_line[3U];
                for (nrows = 0; nrows <= nrowx - nxin; nrows++) {
                  endR = idxFillColor;
                  for (endC_gl = 0; endC_gl < 3; endC_gl++) {
                    if (color_data_dirtyOnGpu) {
                      cudaMemcpy(&color_data[0], gpu_color_data, color_size[0] *
                                 color_size[1] * sizeof(uint8_T),
                                 cudaMemcpyDeviceToHost);
                      color_data_dirtyOnGpu = false;
                    }

                    if (outImg_dirtyOnGpu) {
                      cudaMemcpy(&outImg[0], gpu_outImg, 150528ULL,
                                 cudaMemcpyDeviceToHost);
                      outImg_dirtyOnGpu = false;
                    }

                    outImg[nx + endC_gl * 50176] = color_data[endR];
                    endR += numFillColor;
                  }

                  nx += 224;
                }
              }

              yolov2_detect_kernel79<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(yy,
                ii, endR_im, firstRow, *gpu_line);
              b_line_dirtyOnGpu = true;
              isEmpty = false;
              visited1 = false;
              visited2 = false;
              done = false;
              if (line_dirtyOnCpu) {
                cudaMemcpy(b_gpu_line, &b_line[0], 16ULL, cudaMemcpyHostToDevice);
                line_dirtyOnCpu = false;
              }

              yolov2_detect_kernel80<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
                (*gpu_line, *b_gpu_line);
              line_dirtyOnGpu = true;
              while (!done) {
                nx = 0;
                nxin = 0;

                /* Determine viewport violations. */
                if (line_dirtyOnGpu) {
                  cudaMemcpy(&b_line[0], b_gpu_line, 16ULL,
                             cudaMemcpyDeviceToHost);
                  line_dirtyOnGpu = false;
                }

                if (b_line[0U] < 0) {
                  nx = 4;
                } else {
                  if (b_line[0U] > 223) {
                    nx = 8;
                  }
                }

                if (b_line[2U] < 0) {
                  nxin = 4;
                } else {
                  if (b_line[2U] > 223) {
                    nxin = 8;
                  }
                }

                if (b_line[1U] < 0) {
                  nx = static_cast<int32_T>((nx | 1U));
                } else {
                  if (b_line[1U] > 223) {
                    nx = static_cast<int32_T>((nx | 2U));
                  }
                }

                if (b_line[3U] < 0) {
                  nxin = static_cast<int32_T>((nxin | 1U));
                } else {
                  if (b_line[3U] > 223) {
                    nxin = static_cast<int32_T>((nxin | 2U));
                  }
                }

                if ((static_cast<uint32_T>(nx) | nxin) == 0U) {
                  /* Line falls completely within bounds. */
                  done = true;
                  isEmpty = true;
                } else if ((static_cast<uint32_T>(nx) & nxin) != 0U) {
                  /* Line falls completely out of bounds. */
                  done = true;
                  isEmpty = false;
                } else if (static_cast<uint32_T>(nx) != 0U) {
                  /* Clip 1st point; if it's in-bounds, clip 2nd point. */
                  if (visited1) {
                    b_line[0U] = firstRow;
                    if (b_line_dirtyOnGpu) {
                      cudaMemcpy(&line[0], gpu_line, 16ULL,
                                 cudaMemcpyDeviceToHost);
                      b_line_dirtyOnGpu = false;
                    }

                    b_line[1U] = line[1U];
                    line_dirtyOnCpu = true;
                  }

                  nrowx = b_line[2U] - b_line[0U];
                  nrows = b_line[3U] - b_line[1U];
                  if ((nrowx > 1073741824) || (nrowx < -1073741824) || ((nrows >
                        1073741824) || (nrows < -1073741824))) {
                    /* Possible Inf or Nan. */
                    done = true;
                    isEmpty = false;
                    visited1 = true;
                  } else if ((nx & 4U) != 0U) {
                    /* Violated RMin. */
                    nx = -b_line[0U] * nrows;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrowx >= 0)) || ((nx < 0) &&
                                (nrowx < 0))) {
                      b_line[1U] += (div_s32_floor(nx << 1, nrowx) + 1) >> 1;
                    } else {
                      b_line[1U] -= (div_s32_floor(-nx << 1, nrowx) + 1) >> 1;
                    }

                    b_line[0U] = 0;
                    line_dirtyOnCpu = true;
                    visited1 = true;
                  } else if ((nx & 8U) != 0U) {
                    /* Violated RMax. */
                    nx = (223 - b_line[0U]) * nrows;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrowx >= 0)) || ((nx < 0) &&
                                (nrowx < 0))) {
                      b_line[1U] += (div_s32_floor(nx << 1, nrowx) + 1) >> 1;
                    } else {
                      b_line[1U] -= (div_s32_floor(-nx << 1, nrowx) + 1) >> 1;
                    }

                    b_line[0U] = 223;
                    line_dirtyOnCpu = true;
                    visited1 = true;
                  } else if ((nx & 1U) != 0U) {
                    /* Violated CMin. */
                    nx = -b_line[1U] * nrowx;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrows >= 0)) || ((nx < 0) &&
                                (nrows < 0))) {
                      b_line[0U] += (div_s32_floor(nx << 1, nrows) + 1) >> 1;
                    } else {
                      b_line[0U] -= (div_s32_floor(-nx << 1, nrows) + 1) >> 1;
                    }

                    b_line[1U] = 0;
                    line_dirtyOnCpu = true;
                    visited1 = true;
                  } else {
                    /* Violated CMax. */
                    nx = (223 - b_line[1U]) * nrowx;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrows >= 0)) || ((nx < 0) &&
                                (nrows < 0))) {
                      b_line[0U] += (div_s32_floor(nx << 1, nrows) + 1) >> 1;
                    } else {
                      b_line[0U] -= (div_s32_floor(-nx << 1, nrows) + 1) >> 1;
                    }

                    b_line[1U] = 223;
                    line_dirtyOnCpu = true;
                    visited1 = true;
                  }
                } else {
                  /* Clip the 2nd point. */
                  if (visited2) {
                    b_line[2U] = yy;
                    if (b_line_dirtyOnGpu) {
                      cudaMemcpy(&line[0], gpu_line, 16ULL,
                                 cudaMemcpyDeviceToHost);
                      b_line_dirtyOnGpu = false;
                    }

                    b_line[3U] = line[3U];
                    line_dirtyOnCpu = true;
                  }

                  nrowx = b_line[2U] - b_line[0U];
                  nrows = b_line[3U] - b_line[1U];
                  if ((nrowx > 1073741824) || (nrowx < -1073741824) || ((nrows >
                        1073741824) || (nrows < -1073741824))) {
                    /* Possible Inf or Nan. */
                    done = true;
                    isEmpty = false;
                    visited2 = true;
                  } else if ((nxin & 4U) != 0U) {
                    /* Violated RMin. */
                    nx = -b_line[2U] * nrows;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrowx >= 0)) || ((nx < 0) &&
                                (nrowx < 0))) {
                      b_line[3U] += (div_s32_floor(nx << 1, nrowx) + 1) >> 1;
                    } else {
                      b_line[3U] -= (div_s32_floor(-nx << 1, nrowx) + 1) >> 1;
                    }

                    b_line[2U] = 0;
                    line_dirtyOnCpu = true;
                    visited2 = true;
                  } else if ((nxin & 8U) != 0U) {
                    /* Violated RMax. */
                    nx = (223 - b_line[2U]) * nrows;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrowx >= 0)) || ((nx < 0) &&
                                (nrowx < 0))) {
                      b_line[3U] += (div_s32_floor(nx << 1, nrowx) + 1) >> 1;
                    } else {
                      b_line[3U] -= (div_s32_floor(-nx << 1, nrowx) + 1) >> 1;
                    }

                    b_line[2U] = 223;
                    line_dirtyOnCpu = true;
                    visited2 = true;
                  } else if ((nxin & 1U) != 0U) {
                    /* Violated CMin. */
                    nx = -b_line[3U] * nrowx;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrows >= 0)) || ((nx < 0) &&
                                (nrows < 0))) {
                      b_line[2U] += (div_s32_floor(nx << 1, nrows) + 1) >> 1;
                    } else {
                      b_line[2U] -= (div_s32_floor(-nx << 1, nrows) + 1) >> 1;
                    }

                    b_line[3U] = 0;
                    line_dirtyOnCpu = true;
                    visited2 = true;
                  } else {
                    /* Violated CMax. */
                    nx = (223 - b_line[3U]) * nrowx;
                    if ((nx > 1073741824) || (nx < -1073741824)) {
                      /* Check for Inf or Nan. */
                      done = true;
                      isEmpty = false;
                    } else if (((nx >= 0) && (nrows >= 0)) || ((nx < 0) &&
                                (nrows < 0))) {
                      b_line[2U] += (div_s32_floor(nx << 1, nrows) + 1) >> 1;
                    } else {
                      b_line[2U] -= (div_s32_floor(-nx << 1, nrows) + 1) >> 1;
                    }

                    b_line[3U] = 223;
                    line_dirtyOnCpu = true;
                    visited2 = true;
                  }
                }
              }

              if (isEmpty) {
                if (line_dirtyOnGpu) {
                  cudaMemcpy(&b_line[0], b_gpu_line, 16ULL,
                             cudaMemcpyDeviceToHost);
                }

                nx = b_line[1U] * 224 + b_line[0U];
                nxin = b_line[0U];
                nrowx = b_line[2U];
                for (nrows = 0; nrows <= nrowx - nxin; nrows++) {
                  endR = idxFillColor;
                  for (endC_gl = 0; endC_gl < 3; endC_gl++) {
                    if (color_data_dirtyOnGpu) {
                      cudaMemcpy(&color_data[0], gpu_color_data, color_size[0] *
                                 color_size[1] * sizeof(uint8_T),
                                 cudaMemcpyDeviceToHost);
                      color_data_dirtyOnGpu = false;
                    }

                    if (outImg_dirtyOnGpu) {
                      cudaMemcpy(&outImg[0], gpu_outImg, 150528ULL,
                                 cudaMemcpyDeviceToHost);
                      outImg_dirtyOnGpu = false;
                    }

                    outImg[nx + endC_gl * 50176] = color_data[endR];
                    endR += numFillColor;
                  }

                  nx++;
                }
              }
            }
          }

          if (idxFillColor < 3 * (numFillColor - 1)) {
            idxFillColor++;
          } else {
            idxFillColor = 0;
          }
        }
      }
    }

    i0 = positionOut_size[0] - 1;
    yolov2_detect_kernel81<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (*gpu_positionOut_size, *gpu_textLocAndWidth_size);
    cudaMemcpy(&textLocAndWidth_size[0], gpu_textLocAndWidth_size, 8ULL,
               cudaMemcpyDeviceToHost);
    cc_validLaunchParams = mwGetLaunchParameters((real_T)((1LL + i0) * 4LL),
      &cc_grid, &cc_block, 1024U, 65535U);
    if (cc_validLaunchParams) {
      yolov2_detect_kernel82<<<cc_grid, cc_block>>>(*gpu_positionOut_data,
        *gpu_positionOut_size, *gpu_textLocAndWidth_size, i0,
        *gpu_textLocAndWidth_data);
    }

    i0 = positionOut_size[0] - 1;
    dc_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + i0), &dc_grid,
      &dc_block, 1024U, 65535U);
    if (dc_validLaunchParams) {
      yolov2_detect_kernel83<<<dc_grid, dc_block>>>(*gpu_textLocAndWidth_size,
        *gpu_positionOut_data, *gpu_positionOut_size, i0,
        *gpu_textLocAndWidth_data);
    }

    i0 = textLocAndWidth_size[0] - 1;
    yolov2_detect_kernel84<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (*gpu_textLocAndWidth_size, *gpu_textPosition_size);
    cudaMemcpy(&textPosition_size[0], gpu_textPosition_size, 8ULL,
               cudaMemcpyDeviceToHost);
    textPosition_size_dirtyOnGpu = false;
    ec_validLaunchParams = mwGetLaunchParameters((real_T)((1LL + i0) * 2LL),
      &ec_grid, &ec_block, 1024U, 65535U);
    if (ec_validLaunchParams) {
      yolov2_detect_kernel85<<<ec_grid, ec_block>>>(*gpu_textLocAndWidth_data,
        *gpu_textLocAndWidth_size, *gpu_textPosition_size, i0,
        *gpu_textPosition_data);
      textPosition_data_dirtyOnGpu = true;
    }

    isEmpty = (textLocAndWidth_size[0] == 0);
    if (colorRGB_size[0] == 1) {
      yolov2_detect_kernel86<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
        (*gpu_colorRGB_data, *gpu_a_data);
      if (colorRGB_size_dirtyOnCpu) {
        cudaMemcpy(b_gpu_colorRGB_size, &colorRGB_size[0], 8ULL,
                   cudaMemcpyHostToDevice);
      }

      yolov2_detect_kernel87<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
        (*gpu_textLocAndWidth_size, *b_gpu_colorRGB_size);
      nx = static_cast<int16_T>(textLocAndWidth_size[0]);
      cudaMemcpy(&colorRGB_size[0], b_gpu_colorRGB_size, 8ULL,
                 cudaMemcpyDeviceToHost);
      colorRGB_size_dirtyOnGpu = false;
      fc_validLaunchParams = mwGetLaunchParameters((real_T)((1LL + (nx - 1)) *
        3LL), &fc_grid, &fc_block, 1024U, 65535U);
      if (fc_validLaunchParams) {
        cudaMemcpy(gpu_nx, &nx, 4ULL, cudaMemcpyHostToDevice);
        yolov2_detect_kernel88<<<fc_grid, fc_block>>>(*gpu_a_data, gpu_nx,
          *gpu_colorRGB_data);
        colorRGB_data_dirtyOnGpu = true;
      }
    }

    if (textLocAndWidth_size[0] == 1) {
      shapeWidth_size[0] = 1;
      yolov2_detect_kernel91<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
        (*gpu_textLocAndWidth_data, *gpu_shapeWidth_data);
      shapeWidth_data_dirtyOnGpu = true;
    } else {
      i0 = textLocAndWidth_size[0] - 1;
      b_textLocAndWidth_size[0] = textLocAndWidth_size[0];
      gc_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + i0), &gc_grid,
        &gc_block, 1024U, 65535U);
      if (gc_validLaunchParams) {
        if (iidx_data_dirtyOnCpu) {
          cudaMemcpy(gpu_iidx_data, &iidx_data[0], b_textLocAndWidth_size[0] *
                     sizeof(int32_T), cudaMemcpyHostToDevice);
        }

        yolov2_detect_kernel89<<<gc_grid, gc_block>>>(*gpu_textLocAndWidth_data,
          *gpu_textLocAndWidth_size, i0, *gpu_iidx_data);
        iidx_data_dirtyOnCpu = false;
      }

      thresholdedPrediction_size[0] = textLocAndWidth_size[0];
      c_thresholdedPrediction_size_di = false;
      shapeWidth_size[0] = textLocAndWidth_size[0];
      hc_validLaunchParams = mwGetLaunchParameters((real_T)(1LL +
        (thresholdedPrediction_size[0] - 1)), &hc_grid, &hc_block, 1024U, 65535U);
      if (hc_validLaunchParams) {
        cudaMemcpy(gpu_thresholdedPrediction_size, &thresholdedPrediction_size[0],
                   8ULL, cudaMemcpyHostToDevice);
        if (iidx_data_dirtyOnCpu) {
          cudaMemcpy(gpu_iidx_data, &iidx_data[0], b_textLocAndWidth_size[0] *
                     sizeof(int32_T), cudaMemcpyHostToDevice);
          iidx_data_dirtyOnCpu = false;
        }

        yolov2_detect_kernel90<<<hc_grid, hc_block>>>(*gpu_iidx_data,
          *gpu_thresholdedPrediction_size, *gpu_shapeWidth_data);
        shapeWidth_data_dirtyOnGpu = true;
      }
    }

    if (textLocAndWidth_size[0] == 1) {
      shapeHeight_size[0] = 1;
      yolov2_detect_kernel94<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
        (*gpu_textLocAndWidth_data, *gpu_shapeHeight_data);
      shapeHeight_data_dirtyOnGpu = true;
    } else {
      i0 = textLocAndWidth_size[0] - 1;
      c_textLocAndWidth_size[0] = textLocAndWidth_size[0];
      ic_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + i0), &ic_grid,
        &ic_block, 1024U, 65535U);
      if (ic_validLaunchParams) {
        if (iidx_data_dirtyOnCpu) {
          cudaMemcpy(gpu_iidx_data, &iidx_data[0], c_textLocAndWidth_size[0] *
                     sizeof(int32_T), cudaMemcpyHostToDevice);
          iidx_data_dirtyOnCpu = false;
        }

        yolov2_detect_kernel92<<<ic_grid, ic_block>>>(*gpu_textLocAndWidth_data,
          *gpu_textLocAndWidth_size, i0, *gpu_iidx_data);
      }

      if (c_thresholdedPrediction_size_di) {
        cudaMemcpy(&thresholdedPrediction_size[0],
                   gpu_thresholdedPrediction_size, 8ULL, cudaMemcpyDeviceToHost);
      }

      thresholdedPrediction_size[0] = textLocAndWidth_size[0];
      shapeHeight_size[0] = textLocAndWidth_size[0];
      jc_validLaunchParams = mwGetLaunchParameters((real_T)(1LL +
        (thresholdedPrediction_size[0] - 1)), &jc_grid, &jc_block, 1024U, 65535U);
      if (jc_validLaunchParams) {
        cudaMemcpy(gpu_thresholdedPrediction_size, &thresholdedPrediction_size[0],
                   8ULL, cudaMemcpyHostToDevice);
        if (iidx_data_dirtyOnCpu) {
          cudaMemcpy(gpu_iidx_data, &iidx_data[0], c_textLocAndWidth_size[0] *
                     sizeof(int32_T), cudaMemcpyHostToDevice);
        }

        yolov2_detect_kernel93<<<jc_grid, jc_block>>>(*gpu_iidx_data,
          *gpu_thresholdedPrediction_size, *gpu_shapeHeight_data);
        shapeHeight_data_dirtyOnGpu = true;
      }
    }

    visited1 = (labels_size[0] == 1);
    if (!isEmpty) {
      yolov2_detect_kernel95<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
        (gpu_textIdx);
      textIdx_dirtyOnCpu = false;
      i0 = textLocAndWidth_size[0];
      for (ii = 0; ii < i0; ii++) {
        if (!visited1) {
          textIdx = ii;
          textIdx_dirtyOnCpu = true;
        }

        if (textIdx_dirtyOnCpu) {
          cudaMemcpy(gpu_textIdx, &textIdx, 4ULL, cudaMemcpyHostToDevice);
          textIdx_dirtyOnCpu = false;
        }

        yolov2_detect_kernel96<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
          (*gpu_labels_data, gpu_textIdx, *gpu_thisTextU16);
        thisTextU16_dirtyOnGpu = true;
        yolov2_detect_kernel97<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
          (*gpu_thisTextU16, *gpu_thisCharcodes_1b);
        cudaMemcpy(&thisCharcodes_1b[0], gpu_thisCharcodes_1b, 7ULL,
                   cudaMemcpyDeviceToHost);
        height = iv2[uv1[thisCharcodes_1b[0] - 1]];
        if (uv1_dirtyOnCpu) {
          cudaMemcpy(gpu_uv1, (void *)&uv1[0], 512ULL, cudaMemcpyHostToDevice);
          uv1_dirtyOnCpu = false;
        }

        cudaMemcpy(gpu_height, &height, 8ULL, cudaMemcpyHostToDevice);
        if (iv2_dirtyOnCpu) {
          cudaMemcpy(gpu_iv2, (void *)&iv2[0], 261ULL, cudaMemcpyHostToDevice);
          iv2_dirtyOnCpu = false;
        }

        yolov2_detect_kernel98<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
          (*gpu_thisCharcodes_1b, *gpu_uv1, *gpu_iv2, gpu_height);
        yolov2_detect_kernel99<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(*gpu_uv1,
          *gpu_thisCharcodes_1b, *gpu_x);
        cudaMemcpy(&x[0], gpu_x, 7ULL, cudaMemcpyDeviceToHost);
        numMissingGlyph = x[0];
        cudaMemcpy(gpu_numMissingGlyph, &numMissingGlyph, 8ULL,
                   cudaMemcpyHostToDevice);
        yolov2_detect_kernel100<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(*gpu_x,
          gpu_numMissingGlyph);
        cudaMemcpy(&height, gpu_height, 8ULL, cudaMemcpyDeviceToHost);
        if (height < 2.147483648E+9) {
          nrowx = static_cast<int32_T>(height);
        } else {
          nrowx = MAX_int32_T;
        }

        cudaMemcpy(&numMissingGlyph, gpu_numMissingGlyph, 8ULL,
                   cudaMemcpyDeviceToHost);
        height = numMissingGlyph * 4.0;
        if (height < 2.147483648E+9) {
          nx = static_cast<int32_T>(height);
        } else {
          nx = MAX_int32_T;
        }

        if ((nrowx > 0) && (nx > MAX_int32_T - nrowx)) {
          nxin = MAX_int32_T;
        } else {
          nxin = nrowx + nx;
        }

        if (shapeWidth_data_dirtyOnGpu) {
          cudaMemcpy(&SD->f0.shapeWidth_data[0], gpu_shapeWidth_data,
                     shapeWidth_size[0] * sizeof(int32_T),
                     cudaMemcpyDeviceToHost);
          shapeWidth_data_dirtyOnGpu = false;
        }

        if (nxin <= SD->f0.shapeWidth_data[ii]) {
          nxin = SD->f0.shapeWidth_data[ii];
        }

        if (nxin > SD->f0.shapeWidth_data[ii]) {
          if (nxin > 2147483639) {
            nxin = MAX_int32_T;
          } else {
            nxin += 8;
          }
        }

        if (textPosition_size_dirtyOnGpu) {
          cudaMemcpy(&textPosition_size[0], gpu_textPosition_size, 8ULL,
                     cudaMemcpyDeviceToHost);
          textPosition_size_dirtyOnGpu = false;
        }

        if (textPosition_data_dirtyOnGpu) {
          cudaMemcpy(&textPosition_data[0], gpu_textPosition_data,
                     textPosition_size[0] * textPosition_size[1] * sizeof
                     (int32_T), cudaMemcpyDeviceToHost);
          textPosition_data_dirtyOnGpu = false;
        }

        nrowx = textPosition_data[ii + textPosition_size[0]];
        if (nrowx < -2147483625) {
          nrowx = MIN_int32_T;
        } else {
          nrowx -= 23;
        }

        endC_im = nrowx + 1;
        endC_gl = textPosition_data[ii];
        if (SD->f0.shapeWidth_data[ii] > 0) {
          if (shapeHeight_data_dirtyOnGpu) {
            cudaMemcpy(&SD->f0.shapeHeight_data[0], gpu_shapeHeight_data,
                       shapeHeight_size[0] * sizeof(int32_T),
                       cudaMemcpyDeviceToHost);
            shapeHeight_data_dirtyOnGpu = false;
          }

          if (SD->f0.shapeHeight_data[ii] > 0) {
            if (endC_im > 2147483624) {
              nrowx = MAX_int32_T;
            } else {
              nrowx = endC_im + 23;
            }

            guard1 = false;
            if (textPosition_data[ii] <= 224) {
              if ((textPosition_data[ii] < 0) && (SD->f0.shapeWidth_data[ii] <
                   MIN_int32_T - textPosition_data[ii])) {
                nx = MIN_int32_T;
              } else if ((textPosition_data[ii] > 0) && (SD->
                          f0.shapeWidth_data[ii] > MAX_int32_T
                          - textPosition_data[ii])) {
                nx = MAX_int32_T;
              } else {
                nx = textPosition_data[ii] + SD->f0.shapeWidth_data[ii];
              }

              if (nx >= -2147483647) {
                nx--;
              }

              if ((nx >= 1) && (nrowx <= 224)) {
                if ((nrowx < 0) && (SD->f0.shapeHeight_data[ii] < MIN_int32_T
                                    - nrowx)) {
                  nrowx = MIN_int32_T;
                } else if ((nrowx > 0) && (SD->f0.shapeHeight_data[ii] >
                            MAX_int32_T - nrowx)) {
                  nrowx = MAX_int32_T;
                } else {
                  nrowx += SD->f0.shapeHeight_data[ii];
                }

                if (nrowx >= -2147483647) {
                  nrowx--;
                }

                if (nrowx >= 1) {
                  if (endC_im < 1) {
                    nrowx = endC_im + 23;
                    if ((nrowx < 0) && (SD->f0.shapeHeight_data[ii] <
                                        MIN_int32_T - nrowx)) {
                      nrowx = MIN_int32_T;
                    } else if ((nrowx > 0) && (SD->f0.shapeHeight_data[ii] >
                                MAX_int32_T - nrowx)) {
                      nrowx = MAX_int32_T;
                    } else {
                      nrowx += SD->f0.shapeHeight_data[ii];
                    }

                    if (nrowx >= 1) {
                      nrowx = textPosition_data[ii + textPosition_size[0]];
                      if ((nrowx < 0) && (SD->f0.shapeHeight_data[ii] <
                                          MIN_int32_T - nrowx)) {
                        nrowx = MIN_int32_T;
                      } else if ((nrowx > 0) && (SD->f0.shapeHeight_data[ii] >
                                  MAX_int32_T - nrowx)) {
                        nrowx = MAX_int32_T;
                      } else {
                        nrowx += SD->f0.shapeHeight_data[ii];
                      }

                      if (nrowx > 2147483646) {
                        endC_im = MAX_int32_T;
                      } else {
                        endC_im = nrowx + 1;
                      }
                    }
                  }

                  if ((textPosition_data[ii] < 0) && (nxin < MIN_int32_T
                       - textPosition_data[ii])) {
                    nrowx = MIN_int32_T;
                  } else if ((textPosition_data[ii] > 0) && (nxin > MAX_int32_T
                              - textPosition_data[ii])) {
                    nrowx = MAX_int32_T;
                  } else {
                    nrowx = textPosition_data[ii] + nxin;
                  }

                  if (static_cast<real_T>(nrowx) - 224.0 >= -2.147483648E+9) {
                    nx = nrowx - 224;
                  } else {
                    nx = MIN_int32_T;
                  }

                  if ((nx > 0) && (textPosition_data[ii] <= 224)) {
                    if ((textPosition_data[ii] >= 0) && (nx <
                         textPosition_data[ii] - MAX_int32_T)) {
                      nrowx = MAX_int32_T;
                    } else if ((textPosition_data[ii] < 0) && (nx >
                                textPosition_data[ii] - MIN_int32_T)) {
                      nrowx = MIN_int32_T;
                    } else {
                      nrowx = textPosition_data[ii] - nx;
                    }

                    endC_gl = nrowx + 1;
                  }

                  if (endC_gl < 1) {
                    if ((textPosition_data[ii] < 0) && (SD->
                         f0.shapeWidth_data[ii] < MIN_int32_T
                         - textPosition_data[ii])) {
                      nrowx = MIN_int32_T;
                    } else if ((textPosition_data[ii] > 0) &&
                               (SD->f0.shapeWidth_data[ii] > MAX_int32_T
                                - textPosition_data[ii])) {
                      nrowx = MAX_int32_T;
                    } else {
                      nrowx = textPosition_data[ii] + SD->f0.shapeWidth_data[ii];
                    }

                    if (nrowx >= 1) {
                      endC_gl = 1;
                    }
                  }
                } else {
                  guard1 = true;
                }
              } else {
                guard1 = true;
              }
            } else {
              guard1 = true;
            }

            if (guard1) {
              endC_im = -32767;
              endC_gl = -32767;
            }
          }
        }

        nrows = endC_im;
        if (endC_im > 2147483624) {
          nrowx = MAX_int32_T;
        } else {
          nrowx = endC_im + 23;
        }

        endR = nrowx - 1;
        count = endC_gl;
        if ((endC_gl < 0) && (nxin < MIN_int32_T - endC_gl)) {
          nrowx = MIN_int32_T;
        } else if ((endC_gl > 0) && (nxin > MAX_int32_T - endC_gl)) {
          nrowx = MAX_int32_T;
        } else {
          nrowx = endC_gl + nxin;
        }

        if (nrowx < -2147483647) {
          nx = MIN_int32_T;
        } else {
          nx = nrowx - 1;
        }

        if ((endC_im > 224) || (endR < 1) || (endC_gl > 224) || (nx < 1)) {
        } else {
          if (endC_im < 1) {
            nrows = 1;
          }

          if (endR > 224) {
            endR = 224;
          }

          if (endC_gl < 1) {
            count = 1;
          }

          if (nx > 224) {
            nx = 224;
          }

          for (i = 0; i < 3; i++) {
            for (numFillColor = 0; numFillColor <= nx - count; numFillColor++) {
              idxFillColor = (count + numFillColor) - 1;
              for (idxROI = 0; idxROI <= endR - nrows; idxROI++) {
                firstRow = (nrows + idxROI) - 1;
                if (colorRGB_size_dirtyOnGpu) {
                  cudaMemcpy(&colorRGB_size[0], b_gpu_colorRGB_size, 8ULL,
                             cudaMemcpyDeviceToHost);
                  colorRGB_size_dirtyOnGpu = false;
                }

                if (colorRGB_data_dirtyOnGpu) {
                  cudaMemcpy(&colorRGB_data[0], gpu_colorRGB_data,
                             colorRGB_size[0] * colorRGB_size[1] * sizeof
                             (uint8_T), cudaMemcpyDeviceToHost);
                  colorRGB_data_dirtyOnGpu = false;
                }

                tmp11 = (uint8_T)(0.6 * static_cast<real_T>(colorRGB_data[ii +
                  colorRGB_size[0] * i]) + 0.5);
                if (outImg_dirtyOnGpu) {
                  cudaMemcpy(&outImg[0], gpu_outImg, 150528ULL,
                             cudaMemcpyDeviceToHost);
                  outImg_dirtyOnGpu = false;
                }

                tmp22 = (uint8_T)(0.4 * static_cast<real_T>(outImg[(firstRow +
                  224 * idxFillColor) + 50176 * i]) + 0.5);
                i1 = static_cast<int32_T>((static_cast<uint32_T>(tmp11) + tmp22));
                if (static_cast<uint32_T>(i1) > 255U) {
                  i1 = 255;
                }

                outImg[(firstRow + 224 * idxFillColor) + 50176 * i] =
                  static_cast<uint8_T>(i1);
              }
            }
          }
        }

        if (endC_gl > 2147483643) {
          penX = MAX_int32_T;
        } else {
          penX = endC_gl + 4;
        }

        if (endC_im > 2147483643) {
          nrowx = MAX_int32_T;
        } else {
          nrowx = endC_im + 4;
        }

        if (nrowx > 2147483635) {
          penY = MAX_int32_T;
        } else {
          penY = nrowx + 12;
        }

        for (i = 0; i < 7; i++) {
          if (thisTextU16_dirtyOnGpu) {
            cudaMemcpy(&thisTextU16[0], gpu_thisTextU16, 7ULL,
                       cudaMemcpyDeviceToHost);
            thisTextU16_dirtyOnGpu = false;
          }

          if (uv1[thisTextU16[i]] == 0) {
            if (penX > 2147483643) {
              penX = MAX_int32_T;
            } else {
              penX += 4;
            }
          } else {
            if ((penX < 0) && (iv3[uv1[thisTextU16[i]]] < MIN_int32_T - penX)) {
              endR = MIN_int32_T;
            } else if ((penX > 0) && (iv3[uv1[thisTextU16[i]]] > MAX_int32_T
                        - penX)) {
              endR = MAX_int32_T;
            } else {
              endR = penX + iv3[uv1[thisTextU16[i]]];
            }

            yy = penY - iv4[uv1[thisTextU16[i]]];
            if ((yy < 0) && (iv5[uv1[thisTextU16[i]]] < MIN_int32_T - yy)) {
              nrowx = MIN_int32_T;
            } else if ((yy > 0) && (iv5[uv1[thisTextU16[i]]] > MAX_int32_T - yy))
            {
              nrowx = MAX_int32_T;
            } else {
              nrowx = yy + iv5[uv1[thisTextU16[i]]];
            }

            endR_im = nrowx - 1;
            if ((endR < 0) && (iv6[uv1[thisTextU16[i]]] < MIN_int32_T - endR)) {
              nrowx = MIN_int32_T;
            } else if ((endR > 0) && (iv6[uv1[thisTextU16[i]]] > MAX_int32_T
                        - endR)) {
              nrowx = MAX_int32_T;
            } else {
              nrowx = endR + iv6[uv1[thisTextU16[i]]];
            }

            endC_im = nrowx - 1;
            if ((yy > 224) || (endR_im < 1) || (endR > 224) || (endC_im < 1)) {
            } else {
              nrows = 1;
              nxin = 1;
              count = iv5[uv1[thisTextU16[i]]];
              endC_gl = iv6[uv1[thisTextU16[i]]];
              if (yy < 1) {
                nrows = 2 - yy;
                yy = 1;
              }

              if (endR_im > 224) {
                count = (iv5[uv1[thisTextU16[i]]] - endR_im) + 224;
                endR_im = 224;
              }

              if (endR < 1) {
                nrowx = -endR;
                if (nrowx > 2147483645) {
                  nxin = MAX_int32_T;
                } else {
                  nxin = nrowx + 2;
                }

                endR = 1;
              }

              if (endC_im > 224) {
                endC_gl = (iv6[uv1[thisTextU16[i]]] - endC_im) + 224;
                endC_im = 224;
              }

              nx = static_cast<int32_T>((static_cast<uint32_T>
                (iv7[uv1[thisTextU16[i]]]) + iv6[uv1[thisTextU16[i]]] *
                iv5[uv1[thisTextU16[i]]]));
              if (iv7[uv1[thisTextU16[i]]] + 1U > static_cast<uint32_T>(nx)) {
                i1 = 0;
                nrowx = -1;
              } else {
                i1 = iv7[uv1[thisTextU16[i]]];
                nrowx = nx - 1;
              }

              num_idx_0 = iv6[uv1[thisTextU16[i]]];
              num_idx_1 = iv5[uv1[thisTextU16[i]]];
              kc_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + (nrowx
                - i1)), &kc_grid, &kc_block, 1024U, 65535U);
              if (kc_validLaunchParams) {
                if (uv2_dirtyOnCpu) {
                  cudaMemcpy(gpu_uv2, (void *)&uv2[0], 10664ULL,
                             cudaMemcpyHostToDevice);
                  uv2_dirtyOnCpu = false;
                }

                yolov2_detect_kernel101<<<kc_grid, kc_block>>>(*gpu_uv2, i1,
                  nrowx, *gpu_tmp_data);
              }

              if (num_dirtyOnCpu) {
                cudaMemcpy(gpu_num, &num[0], 2ULL, cudaMemcpyHostToDevice);
              }

              yolov2_detect_kernel102<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
                (num_idx_1, num_idx_0, *gpu_num);
              b_tmp_size[0] = num_idx_1;
              b_tmp_size[1] = num_idx_0;
              cudaMemcpy(&num[0], gpu_num, 2ULL, cudaMemcpyDeviceToHost);
              lc_validLaunchParams = mwGetLaunchParameters((real_T)((1LL + (num
                [1] - 1)) * (1LL + (num[0] - 1))), &lc_grid, &lc_block, 1024U,
                65535U);
              if (lc_validLaunchParams) {
                cudaMemcpy(b_gpu_tmp_size, &b_tmp_size[0], 8ULL,
                           cudaMemcpyHostToDevice);
                yolov2_detect_kernel103<<<lc_grid, lc_block>>>(*gpu_tmp_data,
                  *b_gpu_tmp_size, *gpu_num, *b_gpu_tmp_data);
              }

              num[0] = num_idx_1;
              num[1] = num_idx_0;
              num_dirtyOnCpu = true;
              mc_validLaunchParams = mwGetLaunchParameters((real_T)(1LL + (num[0]
                * num[1] - 1)), &mc_grid, &mc_block, 1024U, 65535U);
              if (mc_validLaunchParams) {
                cudaMemcpy(gpu_num, &num[0], 2ULL, cudaMemcpyHostToDevice);
                num_dirtyOnCpu = false;
                yolov2_detect_kernel104<<<mc_grid, mc_block>>>(*b_gpu_tmp_data, *
                  gpu_num, *gpu_thisGlyphBitmap_data);
                thisGlyphBitmap_data_dirtyOnGpu = true;
              }

              if (nrows > count) {
                i1 = 1;
              } else {
                i1 = nrows;
              }

              if (nxin > endC_gl) {
                nrowx = -1;
              } else {
                nrowx = nxin - 2;
              }

              for (nxin = 0; nxin < 3; nxin++) {
                height = 1.0;
                for (numFillColor = 0; numFillColor <= endC_im - endR;
                     numFillColor++) {
                  idxFillColor = (endR + numFillColor) - 1;
                  nx = 0;
                  for (idxROI = 0; idxROI <= endR_im - yy; idxROI++) {
                    firstRow = (yy + idxROI) - 1;
                    if (thisGlyphBitmap_data_dirtyOnGpu) {
                      cudaMemcpy(&thisGlyphBitmap_data[0],
                                 gpu_thisGlyphBitmap_data, num_idx_1 * num_idx_0
                                 * sizeof(uint8_T), cudaMemcpyDeviceToHost);
                      thisGlyphBitmap_data_dirtyOnGpu = false;
                    }

                    tmp11 = thisGlyphBitmap_data[((i1 + nx) + num_idx_1 * (nrowx
                      + static_cast<int32_T>(height))) - 1];
                    if (tmp11 == 255) {
                      if (outImg_dirtyOnGpu) {
                        cudaMemcpy(&outImg[0], gpu_outImg, 150528ULL,
                                   cudaMemcpyDeviceToHost);
                        outImg_dirtyOnGpu = false;
                      }

                      outImg[(firstRow + 224 * idxFillColor) + 50176 * nxin] =
                        0U;
                    } else {
                      if (tmp11 != 0) {
                        if (outImg_dirtyOnGpu) {
                          cudaMemcpy(&outImg[0], gpu_outImg, 150528ULL,
                                     cudaMemcpyDeviceToHost);
                          outImg_dirtyOnGpu = false;
                        }

                        tmp1 = static_cast<uint16_T>((outImg[(firstRow + 224 *
                          idxFillColor) + 50176 * nxin] * (255 - tmp11)));
                        tmp3 = static_cast<uint16_T>((tmp1 / 255U));
                        tmp1 = static_cast<uint16_T>((static_cast<uint32_T>(tmp1)
                          - tmp3 * 255));
                        if ((tmp1 > 0) && (tmp1 >= 128)) {
                          tmp3 = static_cast<uint16_T>((tmp3 + 1));
                        }

                        outImg[(firstRow + 224 * idxFillColor) + 50176 * nxin] =
                          static_cast<uint8_T>(tmp3);
                      }
                    }

                    nx++;
                  }

                  height++;
                }
              }
            }

            if ((penX < 0) && (iv2[uv1[thisTextU16[i]]] < MIN_int32_T - penX)) {
              penX = MIN_int32_T;
            } else if ((penX > 0) && (iv2[uv1[thisTextU16[i]]] > MAX_int32_T
                        - penX)) {
              penX = MAX_int32_T;
            } else {
              penX += iv2[uv1[thisTextU16[i]]];
            }
          }
        }
      }
    }
  }

  if (outImg_dirtyOnGpu) {
    cudaMemcpy(&outImg[0], gpu_outImg, 150528ULL, cudaMemcpyDeviceToHost);
  }

  cudaFree(*gpu_in);
  cudaFree(gpu_nx);
  cudaFree(*b_gpu_in);
  cudaFree(*gpu_iv1);
  cudaFree(gpu_ibcol);
  cudaFree(*gpu_anchors);
  cudaFree(*gpu_boxOut);
  cudaFree(*gpu_tmpFeatureMap);
  cudaFree(*gpu_bv0);
  cudaFree(*gpu_tmp_size);
  cudaFree(*gpu_ii_data);
  cudaFree(*gpu_thresholdedPrediction_size);
  cudaFree(*gpu_bboxes_size);
  cudaFree(*gpu_bboxesX1Y1X2Y2_size);
  cudaFree(*gpu_thresholdedPrediction_data);
  cudaFree(*gpu_x1_size);
  cudaFree(*gpu_bboxesX1Y1X2Y2_data);
  cudaFree(*gpu_x1_data);
  cudaFree(*gpu_y1_data);
  cudaFree(*gpu_x2_data);
  cudaFree(*gpu_y2_data);
  cudaFree(*gpu_bboxPred_size);
  cudaFree(*gpu_bboxPred_data);
  cudaFree(*b_gpu_bboxPred_size);
  cudaFree(*c_gpu_bboxPred_size);
  cudaFree(*d_gpu_bboxPred_size);
  cudaFree(*gpu_scorePred_size);
  cudaFree(*gpu_classPred_size);
  cudaFree(*gpu_classPred_data);
  cudaFree(*gpu_scorePred_data);
  cudaFree(*gpu_idx_size);
  cudaFree(gpu_i3);
  cudaFree(gpu_i2);
  cudaFree(*gpu_b_size);
  cudaFree(*gpu_b_data);
  cudaFree(*gpu_idx_data);
  cudaFree(*e_gpu_bboxPred_size);
  cudaFree(*b_gpu_idx_size);
  cudaFree(*b_gpu_b_size);
  cudaFree(*b_gpu_b_data);
  cudaFree(*b_gpu_idx_data);
  cudaFree(*c_gpu_idx_size);
  cudaFree(*c_gpu_b_size);
  cudaFree(*c_gpu_b_data);
  cudaFree(*c_gpu_idx_data);
  cudaFree(*gpu_x_data);
  cudaFree(*gpu_iidx_size);
  cudaFree(*gpu_inputBbox_size);
  cudaFree(*gpu_iidx_data);
  cudaFree(*gpu_inputBbox_data);
  cudaFree(*gpu_isKept_data);
  cudaFree(*gpu_inputLabel_data);
  cudaFree(*b_gpu_x2_data);
  cudaFree(gpu_numMissingGlyph);
  cudaFree(gpu_height);
  cudaFree(*b_gpu_y2_data);
  cudaFree(*gpu_area_data);
  cudaFree(*gpu_ii_size);
  cudaFree(*gpu_index_size);
  cudaFree(*gpu_index_data);
  cudaFree(*gpu_cv0);
  cudaFree(*gpu_positionOut_size);
  cudaFree(*gpu_bboxes_data);
  cudaFree(*b_gpu_colorRGB_size);
  cudaFree(*gpu_uv0);
  cudaFree(*gpu_colorRGB_size);
  cudaFree(*gpu_color_size);
  cudaFree(*gpu_colorRGB_data);
  cudaFree(*gpu_positionOut_data);
  cudaFree(*gpu_line);
  cudaFree(*b_gpu_line);
  cudaFree(*gpu_color_data);
  cudaFree(*gpu_outImg);
  cudaFree(*gpu_textLocAndWidth_size);
  cudaFree(*gpu_textLocAndWidth_data);
  cudaFree(*gpu_textPosition_size);
  cudaFree(*gpu_a_data);
  cudaFree(*gpu_thisTextU16);
  cudaFree(gpu_textIdx);
  cudaFree(*gpu_labels_data);
  cudaFree(*gpu_thisCharcodes_1b);
  cudaFree(*gpu_uv1);
  cudaFree(*gpu_iv2);
  cudaFree(*gpu_x);
  cudaFree(*gpu_shapeWidth_data);
  cudaFree(*gpu_textPosition_data);
  cudaFree(*gpu_shapeHeight_data);
  cudaFree(*gpu_tmp_data);
  cudaFree(*gpu_uv2);
  cudaFree(*gpu_num);
  cudaFree(*b_gpu_tmp_size);
  cudaFree(*b_gpu_tmp_data);
  cudaFree(*gpu_thisGlyphBitmap_data);
  cudaFree(*b_gpu_colorRGB_data);
}

void yolov2_detect_init()
{
  yolov2Obj_not_empty = false;
}

/* End of code generation (yolov2_detect.cu) */
