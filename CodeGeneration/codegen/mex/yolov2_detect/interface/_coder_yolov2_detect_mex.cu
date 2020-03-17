/*
 * _coder_yolov2_detect_mex.cu
 *
 * Code generation for function '_coder_yolov2_detect_mex'
 *
 */

/* Include files */
#include "yolov2_detect.h"
#include "_coder_yolov2_detect_mex.h"
#include "yolov2_detect_terminate.h"
#include "_coder_yolov2_detect_api.h"
#include "yolov2_detect_initialize.h"
#include "yolov2_detect_data.h"

/* Function Declarations */
static void yolov2_detect_mexFunction(yolov2_detectStackData *SD, int32_T nlhs,
  mxArray *plhs[1], int32_T nrhs, const mxArray *prhs[1]);

/* Function Definitions */
static void yolov2_detect_mexFunction(yolov2_detectStackData *SD, int32_T nlhs,
  mxArray *plhs[1], int32_T nrhs, const mxArray *prhs[1])
{
  const mxArray *outputs[1];

  /* Check for proper number of arguments. */
  if (nrhs != 1) {
    emlrtErrMsgIdAndTxt(emlrtRootTLSGlobal, "EMLRT:runTime:WrongNumberOfInputs",
                        5, 12, 1, 4, 13, "yolov2_detect");
  }

  if (nlhs > 1) {
    emlrtErrMsgIdAndTxt(emlrtRootTLSGlobal,
                        "EMLRT:runTime:TooManyOutputArguments", 3, 4, 13,
                        "yolov2_detect");
  }

  /* Call the function. */
  yolov2_detect_api(SD, prhs, nlhs, outputs);

  /* Copy over outputs to the caller. */
  emlrtReturnArrays(1, plhs, outputs);
}

void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs, const mxArray
                 *prhs[])
{
  yolov2_detectStackData *yolov2_detectStackDataGlobal = NULL;
  yolov2_detectStackDataGlobal = (yolov2_detectStackData *)emlrtMxCalloc(1,
    (size_t)1U * sizeof(yolov2_detectStackData));
  mexAtExit(yolov2_detect_atexit);

  /* Module initialization. */
  yolov2_detect_initialize();

  /* Dispatch the entry-point. */
  yolov2_detect_mexFunction(yolov2_detectStackDataGlobal, nlhs, plhs, nrhs, prhs);

  /* Module termination. */
  yolov2_detect_terminate();
  emlrtMxFree(yolov2_detectStackDataGlobal);
}

emlrtCTX mexFunctionCreateRootTLS()
{
  emlrtCreateRootTLS(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1);
  return emlrtRootTLSGlobal;
}

/* End of code generation (_coder_yolov2_detect_mex.cu) */
