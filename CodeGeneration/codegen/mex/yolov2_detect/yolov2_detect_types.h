/*
 * yolov2_detect_types.h
 *
 * Code generation for function 'yolov2_detect'
 *
 */

#ifndef YOLOV2_DETECT_TYPES_H
#define YOLOV2_DETECT_TYPES_H

/* Include files */
#include "rtwtypes.h"

/* Type Definitions */
#include "cnn_api.hpp"
#include "MWTargetNetworkImpl.hpp"

class b_Yolov2UsingResNet50_ONNX_0
{
 public:
  int32_T batchSize;
  int32_T numLayers;
  real32_T *inputData;
  real32_T *outputData;
  MWCNNLayer *layers[154];
 private:
  MWTargetNetworkImpl *targetImpl;
 public:
  b_Yolov2UsingResNet50_ONNX_0();
  void presetup();
  void postsetup();
  void setup();
  void predict();
  void activations(int32_T layerIdx);
  void cleanup();
  real32_T *getLayerOutput(int32_T layerIndex, int32_T portIndex);
  ~b_Yolov2UsingResNet50_ONNX_0();
};

struct vision_ShapeInserter_0
{
  int32_T S0_isInitialized;
  int32_T P0_RTP_LINEWIDTH;
};

typedef struct {
  boolean_T matlabCodegenIsDeleted;
  int32_T isInitialized;
  boolean_T isSetupComplete;
  vision_ShapeInserter_0 cSFunObject;
  real_T LineWidth;
  boolean_T c_NoTuningBeforeLockingCodeGenE;
} visioncodegen_ShapeInserter;

typedef struct {
  struct {
    int32_T shapeWidth_data[614656];
    int32_T shapeHeight_data[614656];
    real32_T in[150528];
  } f0;
} yolov2_detectStackData;

#endif

/* End of code generation (yolov2_detect_types.h) */
