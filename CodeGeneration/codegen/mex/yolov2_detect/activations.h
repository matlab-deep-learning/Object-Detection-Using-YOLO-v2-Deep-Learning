/*
 * activations.h
 *
 * Code generation for function 'activations'
 *
 */

#ifndef ACTIVATIONS_H
#define ACTIVATIONS_H

/* Include files */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include "rtwtypes.h"
#include "yolov2_detect_types.h"

/* Function Declarations */
extern void DeepLearningNetwork_activations(b_Yolov2UsingResNet50_ONNX_0 *obj,
  const real32_T inputdata[150528], real32_T outT[4704]);

#endif

/* End of code generation (activations.h) */
