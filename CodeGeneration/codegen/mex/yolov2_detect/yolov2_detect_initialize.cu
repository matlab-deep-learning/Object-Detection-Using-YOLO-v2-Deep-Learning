/*
 * yolov2_detect_initialize.cu
 *
 * Code generation for function 'yolov2_detect_initialize'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "yolov2_detect.h"
#include "yolov2_detect_initialize.h"
#include "createShapeInserter_cg.h"
#include "_coder_yolov2_detect_mex.h"
#include "yolov2_detect_data.h"

/* Function Declarations */
static void yolov2_detect_once();

/* Function Definitions */
static void yolov2_detect_once()
{
  yolov2_detect_init();
  createShapeInserter_cg_init();
}

void yolov2_detect_initialize()
{
  mexFunctionCreateRootTLS();
  emlrtClearAllocCountR2012b(emlrtRootTLSGlobal, false, 0U, 0);
  emlrtEnterRtStackR2012b(emlrtRootTLSGlobal);
  emlrtLicenseCheckR2012b(emlrtRootTLSGlobal, "Distrib_Computing_Toolbox", 2);
  emlrtLicenseCheckR2012b(emlrtRootTLSGlobal, "Neural_Network_Toolbox", 2);
  emlrtLicenseCheckR2012b(emlrtRootTLSGlobal, "Video_and_Image_Blockset", 2);
  if (emlrtFirstTimeR2012b(emlrtRootTLSGlobal)) {
    yolov2_detect_once();
  }
}

/* End of code generation (yolov2_detect_initialize.cu) */
