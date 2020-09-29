/*
 * DeepLearningNetwork.h
 *
 * Code generation for function 'DeepLearningNetwork'
 *
 */

#ifndef DEEPLEARNINGNETWORK_H
#define DEEPLEARNINGNETWORK_H

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

/* Type Definitions */
#include "MWAdditionLayer.hpp"
#include "MWBatchNormalizationLayer.hpp"
#include "MWConvLayer.hpp"
#include "MWDepthConcatenationLayer.hpp"
#include "MWExponentialLayer.hpp"
#include "cnn_api.hpp"
#include "MWSigmoidLayer.hpp"
#include "MWYoloExtractionLayer.hpp"
#include "MWYoloSoftmaxLayer.hpp"
#include "MWTargetNetworkImpl.hpp"

/* Function Declarations */
extern void DeepLearningNetwork_setup(b_Yolov2UsingResNet50_ONNX_0 *obj);

#endif

/* End of code generation (DeepLearningNetwork.h) */
