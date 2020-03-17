/*
 * yolov2_detect_terminate.cu
 *
 * Code generation for function 'yolov2_detect_terminate'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "yolov2_detect.h"
#include "yolov2_detect_terminate.h"
#include "createShapeInserter_cg.h"
#include "_coder_yolov2_detect_mex.h"
#include "yolov2_detect_data.h"

/* Function Definitions */
void yolov2_detect_atexit()
{
  mexFunctionCreateRootTLS();
  emlrtEnterRtStackR2012b(emlrtRootTLSGlobal);
  createShapeInserter_cg_free();
  emlrtLeaveRtStackR2012b(emlrtRootTLSGlobal);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
  emlrtExitTimeCleanup(&emlrtContextGlobal);
}

void yolov2_detect_terminate()
{
  emlrtLeaveRtStackR2012b(emlrtRootTLSGlobal);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

/* End of code generation (yolov2_detect_terminate.cu) */
