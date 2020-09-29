/*
 * _coder_yolov2_detect_api.cu
 *
 * Code generation for function '_coder_yolov2_detect_api'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "yolov2_detect.h"
#include "_coder_yolov2_detect_api.h"
#include "yolov2_detect_data.h"

/* Variable Definitions */
static const int32_T iv0[3] = { 224, 224, 3 };

/* Function Declarations */
static uint8_T (*b_emlrt_marshallIn(const mxArray *u, const emlrtMsgIdentifier
  *parentId))[150528];
static uint8_T (*c_emlrt_marshallIn(const mxArray *src, const emlrtMsgIdentifier
  *msgId))[150528];
static uint8_T (*emlrt_marshallIn(const mxArray *in, const char_T *identifier))
  [150528];
static const mxArray *emlrt_marshallOut(const uint8_T u[150528]);

/* Function Definitions */
static uint8_T (*b_emlrt_marshallIn(const mxArray *u, const emlrtMsgIdentifier
  *parentId))[150528]
{
  uint8_T (*y)[150528];
  y = c_emlrt_marshallIn(emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}
  static uint8_T (*c_emlrt_marshallIn(const mxArray *src, const
  emlrtMsgIdentifier *msgId))[150528]
{
  uint8_T (*ret)[150528];
  emlrtCheckBuiltInR2012b(emlrtRootTLSGlobal, (const emlrtMsgIdentifier *)msgId,
    src, "uint8", false, 3U, *(int32_T (*)[3])&iv0[0]);
  ret = (uint8_T (*)[150528])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static uint8_T (*emlrt_marshallIn(const mxArray *in, const char_T *identifier))
  [150528]
{
  uint8_T (*y)[150528];
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = const_cast<const char *>(identifier);
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = b_emlrt_marshallIn(emlrtAlias(in), &thisId);
  emlrtDestroyArray(&in);
  return y;
}
  static const mxArray *emlrt_marshallOut(const uint8_T u[150528])
{
  const mxArray *y;
  const mxArray *m0;
  static const int32_T iv9[3] = { 0, 0, 0 };

  y = NULL;
  m0 = emlrtCreateNumericArray(3, iv9, mxUINT8_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m0, (void *)&u[0]);
  emlrtSetDimensions((mxArray *)m0, *(int32_T (*)[3])&iv0[0], 3);
  emlrtAssign(&y, m0);
  return y;
}

void yolov2_detect_api(yolov2_detectStackData *SD, const mxArray * const prhs[1],
  int32_T, const mxArray *plhs[1])
{
  uint8_T (*outImg)[150528];
  uint8_T (*in)[150528];
  outImg = (uint8_T (*)[150528])mxMalloc(sizeof(uint8_T [150528]));

  /* Marshall function inputs */
  in = emlrt_marshallIn(emlrtAlias(prhs[0]), "in");

  /* Invoke the target function */
  yolov2_detect(SD, *in, *outImg);

  /* Marshall function outputs */
  plhs[0] = emlrt_marshallOut(*outImg);
}

/* End of code generation (_coder_yolov2_detect_api.cu) */
