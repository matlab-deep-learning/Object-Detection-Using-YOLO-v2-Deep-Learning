/*
 * DeepLearningNetwork.cu
 *
 * Code generation for function 'DeepLearningNetwork'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "yolov2_detect.h"
#include "DeepLearningNetwork.h"

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

/* Function Definitions */
void DeepLearningNetwork_setup(b_Yolov2UsingResNet50_ONNX_0 *obj)
{
  obj->setup();
  obj->batchSize = 1;
}

b_Yolov2UsingResNet50_ONNX_0::b_Yolov2UsingResNet50_ONNX_0()
{
  this->numLayers = 154;
  this->targetImpl = 0;
  this->layers[0] = new MWInputLayer;
  this->layers[1] = new MWConvLayer;
  this->layers[2] = new MWBatchNormalizationLayer;
  this->layers[3] = new MWReLULayer;
  this->layers[4] = new MWMaxPoolingLayer;
  this->layers[5] = new MWConvLayer;
  this->layers[6] = new MWBatchNormalizationLayer;
  this->layers[7] = new MWReLULayer;
  this->layers[8] = new MWConvLayer;
  this->layers[9] = new MWBatchNormalizationLayer;
  this->layers[10] = new MWReLULayer;
  this->layers[11] = new MWConvLayer;
  this->layers[12] = new MWBatchNormalizationLayer;
  this->layers[13] = new MWConvLayer;
  this->layers[14] = new MWBatchNormalizationLayer;
  this->layers[15] = new MWAdditionLayer;
  this->layers[16] = new MWReLULayer;
  this->layers[17] = new MWConvLayer;
  this->layers[18] = new MWBatchNormalizationLayer;
  this->layers[19] = new MWReLULayer;
  this->layers[20] = new MWConvLayer;
  this->layers[21] = new MWBatchNormalizationLayer;
  this->layers[22] = new MWReLULayer;
  this->layers[23] = new MWConvLayer;
  this->layers[24] = new MWBatchNormalizationLayer;
  this->layers[25] = new MWAdditionLayer;
  this->layers[26] = new MWReLULayer;
  this->layers[27] = new MWConvLayer;
  this->layers[28] = new MWBatchNormalizationLayer;
  this->layers[29] = new MWReLULayer;
  this->layers[30] = new MWConvLayer;
  this->layers[31] = new MWBatchNormalizationLayer;
  this->layers[32] = new MWReLULayer;
  this->layers[33] = new MWConvLayer;
  this->layers[34] = new MWBatchNormalizationLayer;
  this->layers[35] = new MWAdditionLayer;
  this->layers[36] = new MWReLULayer;
  this->layers[37] = new MWConvLayer;
  this->layers[38] = new MWBatchNormalizationLayer;
  this->layers[39] = new MWReLULayer;
  this->layers[40] = new MWConvLayer;
  this->layers[41] = new MWBatchNormalizationLayer;
  this->layers[42] = new MWReLULayer;
  this->layers[43] = new MWConvLayer;
  this->layers[44] = new MWBatchNormalizationLayer;
  this->layers[45] = new MWConvLayer;
  this->layers[46] = new MWBatchNormalizationLayer;
  this->layers[47] = new MWAdditionLayer;
  this->layers[48] = new MWReLULayer;
  this->layers[49] = new MWConvLayer;
  this->layers[50] = new MWBatchNormalizationLayer;
  this->layers[51] = new MWReLULayer;
  this->layers[52] = new MWConvLayer;
  this->layers[53] = new MWBatchNormalizationLayer;
  this->layers[54] = new MWReLULayer;
  this->layers[55] = new MWConvLayer;
  this->layers[56] = new MWBatchNormalizationLayer;
  this->layers[57] = new MWAdditionLayer;
  this->layers[58] = new MWReLULayer;
  this->layers[59] = new MWConvLayer;
  this->layers[60] = new MWBatchNormalizationLayer;
  this->layers[61] = new MWReLULayer;
  this->layers[62] = new MWConvLayer;
  this->layers[63] = new MWBatchNormalizationLayer;
  this->layers[64] = new MWReLULayer;
  this->layers[65] = new MWConvLayer;
  this->layers[66] = new MWBatchNormalizationLayer;
  this->layers[67] = new MWAdditionLayer;
  this->layers[68] = new MWReLULayer;
  this->layers[69] = new MWConvLayer;
  this->layers[70] = new MWBatchNormalizationLayer;
  this->layers[71] = new MWReLULayer;
  this->layers[72] = new MWConvLayer;
  this->layers[73] = new MWBatchNormalizationLayer;
  this->layers[74] = new MWReLULayer;
  this->layers[75] = new MWConvLayer;
  this->layers[76] = new MWBatchNormalizationLayer;
  this->layers[77] = new MWAdditionLayer;
  this->layers[78] = new MWReLULayer;
  this->layers[79] = new MWConvLayer;
  this->layers[80] = new MWBatchNormalizationLayer;
  this->layers[81] = new MWReLULayer;
  this->layers[82] = new MWConvLayer;
  this->layers[83] = new MWBatchNormalizationLayer;
  this->layers[84] = new MWReLULayer;
  this->layers[85] = new MWConvLayer;
  this->layers[86] = new MWBatchNormalizationLayer;
  this->layers[87] = new MWConvLayer;
  this->layers[88] = new MWBatchNormalizationLayer;
  this->layers[89] = new MWAdditionLayer;
  this->layers[90] = new MWReLULayer;
  this->layers[91] = new MWConvLayer;
  this->layers[92] = new MWBatchNormalizationLayer;
  this->layers[93] = new MWReLULayer;
  this->layers[94] = new MWConvLayer;
  this->layers[95] = new MWBatchNormalizationLayer;
  this->layers[96] = new MWReLULayer;
  this->layers[97] = new MWConvLayer;
  this->layers[98] = new MWBatchNormalizationLayer;
  this->layers[99] = new MWAdditionLayer;
  this->layers[100] = new MWReLULayer;
  this->layers[101] = new MWConvLayer;
  this->layers[102] = new MWBatchNormalizationLayer;
  this->layers[103] = new MWReLULayer;
  this->layers[104] = new MWConvLayer;
  this->layers[105] = new MWBatchNormalizationLayer;
  this->layers[106] = new MWReLULayer;
  this->layers[107] = new MWConvLayer;
  this->layers[108] = new MWBatchNormalizationLayer;
  this->layers[109] = new MWAdditionLayer;
  this->layers[110] = new MWReLULayer;
  this->layers[111] = new MWConvLayer;
  this->layers[112] = new MWBatchNormalizationLayer;
  this->layers[113] = new MWReLULayer;
  this->layers[114] = new MWConvLayer;
  this->layers[115] = new MWBatchNormalizationLayer;
  this->layers[116] = new MWReLULayer;
  this->layers[117] = new MWConvLayer;
  this->layers[118] = new MWBatchNormalizationLayer;
  this->layers[119] = new MWAdditionLayer;
  this->layers[120] = new MWReLULayer;
  this->layers[121] = new MWConvLayer;
  this->layers[122] = new MWBatchNormalizationLayer;
  this->layers[123] = new MWReLULayer;
  this->layers[124] = new MWConvLayer;
  this->layers[125] = new MWBatchNormalizationLayer;
  this->layers[126] = new MWReLULayer;
  this->layers[127] = new MWConvLayer;
  this->layers[128] = new MWBatchNormalizationLayer;
  this->layers[129] = new MWAdditionLayer;
  this->layers[130] = new MWReLULayer;
  this->layers[131] = new MWConvLayer;
  this->layers[132] = new MWBatchNormalizationLayer;
  this->layers[133] = new MWReLULayer;
  this->layers[134] = new MWConvLayer;
  this->layers[135] = new MWBatchNormalizationLayer;
  this->layers[136] = new MWReLULayer;
  this->layers[137] = new MWConvLayer;
  this->layers[138] = new MWBatchNormalizationLayer;
  this->layers[139] = new MWAdditionLayer;
  this->layers[140] = new MWReLULayer;
  this->layers[141] = new MWConvLayer;
  this->layers[142] = new MWBatchNormalizationLayer;
  this->layers[143] = new MWReLULayer;
  this->layers[144] = new MWConvLayer;
  this->layers[145] = new MWBatchNormalizationLayer;
  this->layers[146] = new MWReLULayer;
  this->layers[147] = new MWConvLayer;
  this->layers[148] = new MWYoloExtractionLayer;
  this->layers[149] = new MWSigmoidLayer;
  this->layers[150] = new MWExponentialLayer;
  this->layers[151] = new MWYoloSoftmaxLayer;
  this->layers[152] = new MWDepthConcatenationLayer;
  this->layers[153] = new MWOutputLayer;
}

b_Yolov2UsingResNet50_ONNX_0::~b_Yolov2UsingResNet50_ONNX_0()
{
  int32_T idx;
  this->cleanup();
  for (idx = 0; idx < 154; idx++) {
    delete this->layers[idx];
  }

  if (this->targetImpl) {
    delete this->targetImpl;
  }
}

void b_Yolov2UsingResNet50_ONNX_0::activations(int32_T layerIdx)
{
  int32_T idx;
  for (idx = 0; idx <= layerIdx; idx++) {
    this->layers[idx]->predict();
  }
}

void b_Yolov2UsingResNet50_ONNX_0::cleanup()
{
  int32_T idx;
  for (idx = 0; idx < 154; idx++) {
    this->layers[idx]->cleanup();
  }

  if (this->targetImpl) {
    this->targetImpl->cleanup();
  }
}

real32_T *b_Yolov2UsingResNet50_ONNX_0::getLayerOutput(int32_T layerIndex,
  int32_T portIndex)
{
  return this->layers[layerIndex]->getData(portIndex);
}

void b_Yolov2UsingResNet50_ONNX_0::postsetup()
{
  int32_T idx;
  this->targetImpl->postSetup(this->layers, this->numLayers);
  for (idx = 0; idx < 154; idx++) {
    this->layers[idx]->allocate();
  }
}

void b_Yolov2UsingResNet50_ONNX_0::predict()
{
  int32_T idx;
  for (idx = 0; idx < 154; idx++) {
    this->layers[idx]->predict();
  }
}

void b_Yolov2UsingResNet50_ONNX_0::presetup()
{
  this->targetImpl->preSetup(802816, 4);
  this->targetImpl->setAutoTune(true);
}

void b_Yolov2UsingResNet50_ONNX_0::setup()
{
  this->targetImpl = new MWTargetNetworkImpl;
  this->presetup();
  (dynamic_cast<MWInputLayer *>(this->layers[0]))->createInputLayer
    (this->targetImpl, 1, 224, 224, 3, 2,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_avg", 0);
  (dynamic_cast<MWConvLayer *>(this->layers[1]))->createConvLayer
    (this->targetImpl, this->layers[0]->getOutputTensor(0), 7, 7, 3, 64, 2, 2, 3,
     3, 3, 3, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_conv1_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_conv1_b", 1);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[2]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[1]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn_conv1_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn_conv1_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn_conv1_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn_conv1_trainedVariance", 1, 1);
  (dynamic_cast<MWReLULayer *>(this->layers[3]))->createReLULayer
    (this->targetImpl, this->layers[2]->getOutputTensor(0), 1, 1);
  (dynamic_cast<MWMaxPoolingLayer *>(this->layers[4]))->createMaxPoolingLayer
    (this->targetImpl, this->layers[3]->getOutputTensor(0), 3, 3, 2, 2, 0, 0, 0,
     0, 0, 1, 0);
  (dynamic_cast<MWConvLayer *>(this->layers[5]))->createConvLayer
    (this->targetImpl, this->layers[4]->getOutputTensor(0), 1, 1, 64, 64, 1, 1,
     0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res2a_branch2a_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res2a_branch2a_b", 1);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[6]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[5]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2a_branch2a_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2a_branch2a_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2a_branch2a_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2a_branch2a_trainedVariance", 1, 1);
  (dynamic_cast<MWReLULayer *>(this->layers[7]))->createReLULayer
    (this->targetImpl, this->layers[6]->getOutputTensor(0), 1, 1);
  (dynamic_cast<MWConvLayer *>(this->layers[8]))->createConvLayer
    (this->targetImpl, this->layers[7]->getOutputTensor(0), 3, 3, 64, 64, 1, 1,
     1, 1, 1, 1, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res2a_branch2b_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res2a_branch2b_b", 2);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[9]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[8]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2a_branch2b_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2a_branch2b_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2a_branch2b_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2a_branch2b_trainedVariance", 1, 2);
  (dynamic_cast<MWReLULayer *>(this->layers[10]))->createReLULayer
    (this->targetImpl, this->layers[9]->getOutputTensor(0), 1, 2);
  (dynamic_cast<MWConvLayer *>(this->layers[11]))->createConvLayer
    (this->targetImpl, this->layers[10]->getOutputTensor(0), 1, 1, 64, 256, 1, 1,
     0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res2a_branch2c_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res2a_branch2c_b", 1);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[12]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[11]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2a_branch2c_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2a_branch2c_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2a_branch2c_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2a_branch2c_trainedVariance", 1, 1);
  (dynamic_cast<MWConvLayer *>(this->layers[13]))->createConvLayer
    (this->targetImpl, this->layers[4]->getOutputTensor(0), 1, 1, 64, 256, 1, 1,
     0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res2a_branch1_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res2a_branch1_b", 2);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[14]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[13]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2a_branch1_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2a_branch1_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2a_branch1_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2a_branch1_trainedVariance", 1, 2);
  (dynamic_cast<MWAdditionLayer *>(this->layers[15]))->createAdditionLayer
    (this->targetImpl, 2, this->layers[12]->getOutputTensor(0), this->layers[14
     ]->getOutputTensor(0), 0);
  (dynamic_cast<MWReLULayer *>(this->layers[16]))->createReLULayer
    (this->targetImpl, this->layers[15]->getOutputTensor(0), 1, 0);
  (dynamic_cast<MWConvLayer *>(this->layers[17]))->createConvLayer
    (this->targetImpl, this->layers[16]->getOutputTensor(0), 1, 1, 256, 64, 1, 1,
     0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res2b_branch2a_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res2b_branch2a_b", 1);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[18]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[17]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2b_branch2a_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2b_branch2a_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2b_branch2a_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2b_branch2a_trainedVariance", 1, 1);
  (dynamic_cast<MWReLULayer *>(this->layers[19]))->createReLULayer
    (this->targetImpl, this->layers[18]->getOutputTensor(0), 1, 1);
  (dynamic_cast<MWConvLayer *>(this->layers[20]))->createConvLayer
    (this->targetImpl, this->layers[19]->getOutputTensor(0), 3, 3, 64, 64, 1, 1,
     1, 1, 1, 1, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res2b_branch2b_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res2b_branch2b_b", 2);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[21]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[20]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2b_branch2b_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2b_branch2b_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2b_branch2b_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2b_branch2b_trainedVariance", 1, 2);
  (dynamic_cast<MWReLULayer *>(this->layers[22]))->createReLULayer
    (this->targetImpl, this->layers[21]->getOutputTensor(0), 1, 2);
  (dynamic_cast<MWConvLayer *>(this->layers[23]))->createConvLayer
    (this->targetImpl, this->layers[22]->getOutputTensor(0), 1, 1, 64, 256, 1, 1,
     0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res2b_branch2c_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res2b_branch2c_b", 1);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[24]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[23]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2b_branch2c_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2b_branch2c_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2b_branch2c_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2b_branch2c_trainedVariance", 1, 1);
  (dynamic_cast<MWAdditionLayer *>(this->layers[25]))->createAdditionLayer
    (this->targetImpl, 2, this->layers[24]->getOutputTensor(0), this->layers[16
     ]->getOutputTensor(0), 2);
  (dynamic_cast<MWReLULayer *>(this->layers[26]))->createReLULayer
    (this->targetImpl, this->layers[25]->getOutputTensor(0), 1, 2);
  (dynamic_cast<MWConvLayer *>(this->layers[27]))->createConvLayer
    (this->targetImpl, this->layers[26]->getOutputTensor(0), 1, 1, 256, 64, 1, 1,
     0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res2c_branch2a_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res2c_branch2a_b", 0);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[28]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[27]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2c_branch2a_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2c_branch2a_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2c_branch2a_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2c_branch2a_trainedVariance", 1, 0);
  (dynamic_cast<MWReLULayer *>(this->layers[29]))->createReLULayer
    (this->targetImpl, this->layers[28]->getOutputTensor(0), 1, 0);
  (dynamic_cast<MWConvLayer *>(this->layers[30]))->createConvLayer
    (this->targetImpl, this->layers[29]->getOutputTensor(0), 3, 3, 64, 64, 1, 1,
     1, 1, 1, 1, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res2c_branch2b_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res2c_branch2b_b", 1);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[31]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[30]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2c_branch2b_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2c_branch2b_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2c_branch2b_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2c_branch2b_trainedVariance", 1, 1);
  (dynamic_cast<MWReLULayer *>(this->layers[32]))->createReLULayer
    (this->targetImpl, this->layers[31]->getOutputTensor(0), 1, 1);
  (dynamic_cast<MWConvLayer *>(this->layers[33]))->createConvLayer
    (this->targetImpl, this->layers[32]->getOutputTensor(0), 1, 1, 64, 256, 1, 1,
     0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res2c_branch2c_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res2c_branch2c_b", 0);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[34]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[33]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2c_branch2c_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2c_branch2c_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2c_branch2c_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn2c_branch2c_trainedVariance", 1, 0);
  (dynamic_cast<MWAdditionLayer *>(this->layers[35]))->createAdditionLayer
    (this->targetImpl, 2, this->layers[34]->getOutputTensor(0), this->layers[26
     ]->getOutputTensor(0), 1);
  (dynamic_cast<MWReLULayer *>(this->layers[36]))->createReLULayer
    (this->targetImpl, this->layers[35]->getOutputTensor(0), 1, 1);
  (dynamic_cast<MWConvLayer *>(this->layers[37]))->createConvLayer
    (this->targetImpl, this->layers[36]->getOutputTensor(0), 1, 1, 256, 128, 2,
     2, 0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3a_branch2a_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3a_branch2a_b", 0);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[38]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[37]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3a_branch2a_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3a_branch2a_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3a_branch2a_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3a_branch2a_trainedVariance", 1, 0);
  (dynamic_cast<MWReLULayer *>(this->layers[39]))->createReLULayer
    (this->targetImpl, this->layers[38]->getOutputTensor(0), 1, 0);
  (dynamic_cast<MWConvLayer *>(this->layers[40]))->createConvLayer
    (this->targetImpl, this->layers[39]->getOutputTensor(0), 3, 3, 128, 128, 1,
     1, 1, 1, 1, 1, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3a_branch2b_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3a_branch2b_b", 2);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[41]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[40]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3a_branch2b_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3a_branch2b_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3a_branch2b_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3a_branch2b_trainedVariance", 1, 2);
  (dynamic_cast<MWReLULayer *>(this->layers[42]))->createReLULayer
    (this->targetImpl, this->layers[41]->getOutputTensor(0), 1, 2);
  (dynamic_cast<MWConvLayer *>(this->layers[43]))->createConvLayer
    (this->targetImpl, this->layers[42]->getOutputTensor(0), 1, 1, 128, 512, 1,
     1, 0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3a_branch2c_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3a_branch2c_b", 0);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[44]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[43]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3a_branch2c_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3a_branch2c_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3a_branch2c_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3a_branch2c_trainedVariance", 1, 0);
  (dynamic_cast<MWConvLayer *>(this->layers[45]))->createConvLayer
    (this->targetImpl, this->layers[36]->getOutputTensor(0), 1, 1, 256, 512, 2,
     2, 0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3a_branch1_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3a_branch1_b", 2);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[46]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[45]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3a_branch1_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3a_branch1_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3a_branch1_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3a_branch1_trainedVariance", 1, 2);
  (dynamic_cast<MWAdditionLayer *>(this->layers[47]))->createAdditionLayer
    (this->targetImpl, 2, this->layers[44]->getOutputTensor(0), this->layers[46
     ]->getOutputTensor(0), 1);
  (dynamic_cast<MWReLULayer *>(this->layers[48]))->createReLULayer
    (this->targetImpl, this->layers[47]->getOutputTensor(0), 1, 1);
  (dynamic_cast<MWConvLayer *>(this->layers[49]))->createConvLayer
    (this->targetImpl, this->layers[48]->getOutputTensor(0), 1, 1, 512, 128, 1,
     1, 0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3b_branch2a_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3b_branch2a_b", 0);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[50]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[49]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3b_branch2a_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3b_branch2a_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3b_branch2a_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3b_branch2a_trainedVariance", 1, 0);
  (dynamic_cast<MWReLULayer *>(this->layers[51]))->createReLULayer
    (this->targetImpl, this->layers[50]->getOutputTensor(0), 1, 0);
  (dynamic_cast<MWConvLayer *>(this->layers[52]))->createConvLayer
    (this->targetImpl, this->layers[51]->getOutputTensor(0), 3, 3, 128, 128, 1,
     1, 1, 1, 1, 1, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3b_branch2b_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3b_branch2b_b", 2);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[53]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[52]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3b_branch2b_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3b_branch2b_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3b_branch2b_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3b_branch2b_trainedVariance", 1, 2);
  (dynamic_cast<MWReLULayer *>(this->layers[54]))->createReLULayer
    (this->targetImpl, this->layers[53]->getOutputTensor(0), 1, 2);
  (dynamic_cast<MWConvLayer *>(this->layers[55]))->createConvLayer
    (this->targetImpl, this->layers[54]->getOutputTensor(0), 1, 1, 128, 512, 1,
     1, 0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3b_branch2c_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3b_branch2c_b", 0);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[56]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[55]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3b_branch2c_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3b_branch2c_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3b_branch2c_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3b_branch2c_trainedVariance", 1, 0);
  (dynamic_cast<MWAdditionLayer *>(this->layers[57]))->createAdditionLayer
    (this->targetImpl, 2, this->layers[56]->getOutputTensor(0), this->layers[48
     ]->getOutputTensor(0), 2);
  (dynamic_cast<MWReLULayer *>(this->layers[58]))->createReLULayer
    (this->targetImpl, this->layers[57]->getOutputTensor(0), 1, 2);
  (dynamic_cast<MWConvLayer *>(this->layers[59]))->createConvLayer
    (this->targetImpl, this->layers[58]->getOutputTensor(0), 1, 1, 512, 128, 1,
     1, 0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3c_branch2a_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3c_branch2a_b", 0);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[60]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[59]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3c_branch2a_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3c_branch2a_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3c_branch2a_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3c_branch2a_trainedVariance", 1, 0);
  (dynamic_cast<MWReLULayer *>(this->layers[61]))->createReLULayer
    (this->targetImpl, this->layers[60]->getOutputTensor(0), 1, 0);
  (dynamic_cast<MWConvLayer *>(this->layers[62]))->createConvLayer
    (this->targetImpl, this->layers[61]->getOutputTensor(0), 3, 3, 128, 128, 1,
     1, 1, 1, 1, 1, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3c_branch2b_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3c_branch2b_b", 1);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[63]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[62]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3c_branch2b_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3c_branch2b_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3c_branch2b_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3c_branch2b_trainedVariance", 1, 1);
  (dynamic_cast<MWReLULayer *>(this->layers[64]))->createReLULayer
    (this->targetImpl, this->layers[63]->getOutputTensor(0), 1, 1);
  (dynamic_cast<MWConvLayer *>(this->layers[65]))->createConvLayer
    (this->targetImpl, this->layers[64]->getOutputTensor(0), 1, 1, 128, 512, 1,
     1, 0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3c_branch2c_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3c_branch2c_b", 0);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[66]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[65]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3c_branch2c_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3c_branch2c_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3c_branch2c_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3c_branch2c_trainedVariance", 1, 0);
  (dynamic_cast<MWAdditionLayer *>(this->layers[67]))->createAdditionLayer
    (this->targetImpl, 2, this->layers[66]->getOutputTensor(0), this->layers[58
     ]->getOutputTensor(0), 1);
  (dynamic_cast<MWReLULayer *>(this->layers[68]))->createReLULayer
    (this->targetImpl, this->layers[67]->getOutputTensor(0), 1, 1);
  (dynamic_cast<MWConvLayer *>(this->layers[69]))->createConvLayer
    (this->targetImpl, this->layers[68]->getOutputTensor(0), 1, 1, 512, 128, 1,
     1, 0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3d_branch2a_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3d_branch2a_b", 0);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[70]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[69]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3d_branch2a_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3d_branch2a_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3d_branch2a_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3d_branch2a_trainedVariance", 1, 0);
  (dynamic_cast<MWReLULayer *>(this->layers[71]))->createReLULayer
    (this->targetImpl, this->layers[70]->getOutputTensor(0), 1, 0);
  (dynamic_cast<MWConvLayer *>(this->layers[72]))->createConvLayer
    (this->targetImpl, this->layers[71]->getOutputTensor(0), 3, 3, 128, 128, 1,
     1, 1, 1, 1, 1, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3d_branch2b_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3d_branch2b_b", 2);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[73]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[72]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3d_branch2b_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3d_branch2b_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3d_branch2b_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3d_branch2b_trainedVariance", 1, 2);
  (dynamic_cast<MWReLULayer *>(this->layers[74]))->createReLULayer
    (this->targetImpl, this->layers[73]->getOutputTensor(0), 1, 2);
  (dynamic_cast<MWConvLayer *>(this->layers[75]))->createConvLayer
    (this->targetImpl, this->layers[74]->getOutputTensor(0), 1, 1, 128, 512, 1,
     1, 0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3d_branch2c_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res3d_branch2c_b", 0);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[76]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[75]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3d_branch2c_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3d_branch2c_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3d_branch2c_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn3d_branch2c_trainedVariance", 1, 0);
  (dynamic_cast<MWAdditionLayer *>(this->layers[77]))->createAdditionLayer
    (this->targetImpl, 2, this->layers[76]->getOutputTensor(0), this->layers[68
     ]->getOutputTensor(0), 2);
  (dynamic_cast<MWReLULayer *>(this->layers[78]))->createReLULayer
    (this->targetImpl, this->layers[77]->getOutputTensor(0), 1, 2);
  (dynamic_cast<MWConvLayer *>(this->layers[79]))->createConvLayer
    (this->targetImpl, this->layers[78]->getOutputTensor(0), 1, 1, 512, 256, 2,
     2, 0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4a_branch2a_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4a_branch2a_b", 0);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[80]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[79]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4a_branch2a_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4a_branch2a_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4a_branch2a_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4a_branch2a_trainedVariance", 1, 0);
  (dynamic_cast<MWReLULayer *>(this->layers[81]))->createReLULayer
    (this->targetImpl, this->layers[80]->getOutputTensor(0), 1, 0);
  (dynamic_cast<MWConvLayer *>(this->layers[82]))->createConvLayer
    (this->targetImpl, this->layers[81]->getOutputTensor(0), 3, 3, 256, 256, 1,
     1, 1, 1, 1, 1, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4a_branch2b_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4a_branch2b_b", 1);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[83]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[82]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4a_branch2b_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4a_branch2b_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4a_branch2b_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4a_branch2b_trainedVariance", 1, 1);
  (dynamic_cast<MWReLULayer *>(this->layers[84]))->createReLULayer
    (this->targetImpl, this->layers[83]->getOutputTensor(0), 1, 1);
  (dynamic_cast<MWConvLayer *>(this->layers[85]))->createConvLayer
    (this->targetImpl, this->layers[84]->getOutputTensor(0), 1, 1, 256, 1024, 1,
     1, 0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4a_branch2c_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4a_branch2c_b", 0);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[86]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[85]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4a_branch2c_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4a_branch2c_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4a_branch2c_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4a_branch2c_trainedVariance", 1, 0);
  (dynamic_cast<MWConvLayer *>(this->layers[87]))->createConvLayer
    (this->targetImpl, this->layers[78]->getOutputTensor(0), 1, 1, 512, 1024, 2,
     2, 0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4a_branch1_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4a_branch1_b", 1);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[88]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[87]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4a_branch1_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4a_branch1_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4a_branch1_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4a_branch1_trainedVariance", 1, 1);
  (dynamic_cast<MWAdditionLayer *>(this->layers[89]))->createAdditionLayer
    (this->targetImpl, 2, this->layers[86]->getOutputTensor(0), this->layers[88
     ]->getOutputTensor(0), 2);
  (dynamic_cast<MWReLULayer *>(this->layers[90]))->createReLULayer
    (this->targetImpl, this->layers[89]->getOutputTensor(0), 1, 2);
  (dynamic_cast<MWConvLayer *>(this->layers[91]))->createConvLayer
    (this->targetImpl, this->layers[90]->getOutputTensor(0), 1, 1, 1024, 256, 1,
     1, 0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4b_branch2a_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4b_branch2a_b", 0);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[92]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[91]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4b_branch2a_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4b_branch2a_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4b_branch2a_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4b_branch2a_trainedVariance", 1, 0);
  (dynamic_cast<MWReLULayer *>(this->layers[93]))->createReLULayer
    (this->targetImpl, this->layers[92]->getOutputTensor(0), 1, 0);
  (dynamic_cast<MWConvLayer *>(this->layers[94]))->createConvLayer
    (this->targetImpl, this->layers[93]->getOutputTensor(0), 3, 3, 256, 256, 1,
     1, 1, 1, 1, 1, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4b_branch2b_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4b_branch2b_b", 1);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[95]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[94]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4b_branch2b_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4b_branch2b_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4b_branch2b_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4b_branch2b_trainedVariance", 1, 1);
  (dynamic_cast<MWReLULayer *>(this->layers[96]))->createReLULayer
    (this->targetImpl, this->layers[95]->getOutputTensor(0), 1, 1);
  (dynamic_cast<MWConvLayer *>(this->layers[97]))->createConvLayer
    (this->targetImpl, this->layers[96]->getOutputTensor(0), 1, 1, 256, 1024, 1,
     1, 0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4b_branch2c_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4b_branch2c_b", 0);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[98]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[97]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4b_branch2c_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4b_branch2c_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4b_branch2c_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4b_branch2c_trainedVariance", 1, 0);
  (dynamic_cast<MWAdditionLayer *>(this->layers[99]))->createAdditionLayer
    (this->targetImpl, 2, this->layers[98]->getOutputTensor(0), this->layers[90
     ]->getOutputTensor(0), 1);
  (dynamic_cast<MWReLULayer *>(this->layers[100]))->createReLULayer
    (this->targetImpl, this->layers[99]->getOutputTensor(0), 1, 1);
  (dynamic_cast<MWConvLayer *>(this->layers[101]))->createConvLayer
    (this->targetImpl, this->layers[100]->getOutputTensor(0), 1, 1, 1024, 256, 1,
     1, 0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4c_branch2a_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4c_branch2a_b", 0);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[102]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[101]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4c_branch2a_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4c_branch2a_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4c_branch2a_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4c_branch2a_trainedVariance", 1, 0);
  (dynamic_cast<MWReLULayer *>(this->layers[103]))->createReLULayer
    (this->targetImpl, this->layers[102]->getOutputTensor(0), 1, 0);
  (dynamic_cast<MWConvLayer *>(this->layers[104]))->createConvLayer
    (this->targetImpl, this->layers[103]->getOutputTensor(0), 3, 3, 256, 256, 1,
     1, 1, 1, 1, 1, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4c_branch2b_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4c_branch2b_b", 2);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[105]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[104]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4c_branch2b_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4c_branch2b_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4c_branch2b_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4c_branch2b_trainedVariance", 1, 2);
  (dynamic_cast<MWReLULayer *>(this->layers[106]))->createReLULayer
    (this->targetImpl, this->layers[105]->getOutputTensor(0), 1, 2);
  (dynamic_cast<MWConvLayer *>(this->layers[107]))->createConvLayer
    (this->targetImpl, this->layers[106]->getOutputTensor(0), 1, 1, 256, 1024, 1,
     1, 0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4c_branch2c_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4c_branch2c_b", 0);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[108]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[107]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4c_branch2c_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4c_branch2c_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4c_branch2c_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4c_branch2c_trainedVariance", 1, 0);
  (dynamic_cast<MWAdditionLayer *>(this->layers[109]))->createAdditionLayer
    (this->targetImpl, 2, this->layers[108]->getOutputTensor(0), this->layers
     [100]->getOutputTensor(0), 2);
  (dynamic_cast<MWReLULayer *>(this->layers[110]))->createReLULayer
    (this->targetImpl, this->layers[109]->getOutputTensor(0), 1, 2);
  (dynamic_cast<MWConvLayer *>(this->layers[111]))->createConvLayer
    (this->targetImpl, this->layers[110]->getOutputTensor(0), 1, 1, 1024, 256, 1,
     1, 0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4d_branch2a_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4d_branch2a_b", 0);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[112]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[111]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4d_branch2a_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4d_branch2a_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4d_branch2a_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4d_branch2a_trainedVariance", 1, 0);
  (dynamic_cast<MWReLULayer *>(this->layers[113]))->createReLULayer
    (this->targetImpl, this->layers[112]->getOutputTensor(0), 1, 0);
  (dynamic_cast<MWConvLayer *>(this->layers[114]))->createConvLayer
    (this->targetImpl, this->layers[113]->getOutputTensor(0), 3, 3, 256, 256, 1,
     1, 1, 1, 1, 1, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4d_branch2b_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4d_branch2b_b", 1);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[115]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[114]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4d_branch2b_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4d_branch2b_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4d_branch2b_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4d_branch2b_trainedVariance", 1, 1);
  (dynamic_cast<MWReLULayer *>(this->layers[116]))->createReLULayer
    (this->targetImpl, this->layers[115]->getOutputTensor(0), 1, 1);
  (dynamic_cast<MWConvLayer *>(this->layers[117]))->createConvLayer
    (this->targetImpl, this->layers[116]->getOutputTensor(0), 1, 1, 256, 1024, 1,
     1, 0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4d_branch2c_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4d_branch2c_b", 0);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[118]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[117]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4d_branch2c_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4d_branch2c_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4d_branch2c_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4d_branch2c_trainedVariance", 1, 0);
  (dynamic_cast<MWAdditionLayer *>(this->layers[119]))->createAdditionLayer
    (this->targetImpl, 2, this->layers[118]->getOutputTensor(0), this->layers
     [110]->getOutputTensor(0), 1);
  (dynamic_cast<MWReLULayer *>(this->layers[120]))->createReLULayer
    (this->targetImpl, this->layers[119]->getOutputTensor(0), 1, 1);
  (dynamic_cast<MWConvLayer *>(this->layers[121]))->createConvLayer
    (this->targetImpl, this->layers[120]->getOutputTensor(0), 1, 1, 1024, 256, 1,
     1, 0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4e_branch2a_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4e_branch2a_b", 0);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[122]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[121]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4e_branch2a_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4e_branch2a_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4e_branch2a_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4e_branch2a_trainedVariance", 1, 0);
  (dynamic_cast<MWReLULayer *>(this->layers[123]))->createReLULayer
    (this->targetImpl, this->layers[122]->getOutputTensor(0), 1, 0);
  (dynamic_cast<MWConvLayer *>(this->layers[124]))->createConvLayer
    (this->targetImpl, this->layers[123]->getOutputTensor(0), 3, 3, 256, 256, 1,
     1, 1, 1, 1, 1, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4e_branch2b_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4e_branch2b_b", 2);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[125]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[124]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4e_branch2b_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4e_branch2b_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4e_branch2b_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4e_branch2b_trainedVariance", 1, 2);
  (dynamic_cast<MWReLULayer *>(this->layers[126]))->createReLULayer
    (this->targetImpl, this->layers[125]->getOutputTensor(0), 1, 2);
  (dynamic_cast<MWConvLayer *>(this->layers[127]))->createConvLayer
    (this->targetImpl, this->layers[126]->getOutputTensor(0), 1, 1, 256, 1024, 1,
     1, 0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4e_branch2c_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4e_branch2c_b", 0);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[128]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[127]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4e_branch2c_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4e_branch2c_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4e_branch2c_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4e_branch2c_trainedVariance", 1, 0);
  (dynamic_cast<MWAdditionLayer *>(this->layers[129]))->createAdditionLayer
    (this->targetImpl, 2, this->layers[128]->getOutputTensor(0), this->layers
     [120]->getOutputTensor(0), 2);
  (dynamic_cast<MWReLULayer *>(this->layers[130]))->createReLULayer
    (this->targetImpl, this->layers[129]->getOutputTensor(0), 1, 2);
  (dynamic_cast<MWConvLayer *>(this->layers[131]))->createConvLayer
    (this->targetImpl, this->layers[130]->getOutputTensor(0), 1, 1, 1024, 256, 1,
     1, 0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4f_branch2a_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4f_branch2a_b", 0);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[132]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[131]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4f_branch2a_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4f_branch2a_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4f_branch2a_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4f_branch2a_trainedVariance", 1, 0);
  (dynamic_cast<MWReLULayer *>(this->layers[133]))->createReLULayer
    (this->targetImpl, this->layers[132]->getOutputTensor(0), 1, 0);
  (dynamic_cast<MWConvLayer *>(this->layers[134]))->createConvLayer
    (this->targetImpl, this->layers[133]->getOutputTensor(0), 3, 3, 256, 256, 1,
     1, 1, 1, 1, 1, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4f_branch2b_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4f_branch2b_b", 1);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[135]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[134]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4f_branch2b_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4f_branch2b_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4f_branch2b_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4f_branch2b_trainedVariance", 1, 1);
  (dynamic_cast<MWReLULayer *>(this->layers[136]))->createReLULayer
    (this->targetImpl, this->layers[135]->getOutputTensor(0), 1, 1);
  (dynamic_cast<MWConvLayer *>(this->layers[137]))->createConvLayer
    (this->targetImpl, this->layers[136]->getOutputTensor(0), 1, 1, 256, 1024, 1,
     1, 0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4f_branch2c_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_res4f_branch2c_b", 0);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[138]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[137]
    ->getOutputTensor(0), 0.001,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4f_branch2c_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4f_branch2c_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4f_branch2c_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_bn4f_branch2c_trainedVariance", 1, 0);
  (dynamic_cast<MWAdditionLayer *>(this->layers[139]))->createAdditionLayer
    (this->targetImpl, 2, this->layers[138]->getOutputTensor(0), this->layers
     [130]->getOutputTensor(0), 1);
  (dynamic_cast<MWReLULayer *>(this->layers[140]))->createReLULayer
    (this->targetImpl, this->layers[139]->getOutputTensor(0), 1, 1);
  (dynamic_cast<MWConvLayer *>(this->layers[141]))->createConvLayer
    (this->targetImpl, this->layers[140]->getOutputTensor(0), 3, 3, 1024, 1024,
     1, 1, 1, 1, 1, 1, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_yolov2Conv1_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_yolov2Conv1_b", 0);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[142]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[141]
    ->getOutputTensor(0), 1.0E-5,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_yolov2Batch1_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_yolov2Batch1_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_yolov2Batch1_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_yolov2Batch1_trainedVariance", 1, 0);
  (dynamic_cast<MWReLULayer *>(this->layers[143]))->createReLULayer
    (this->targetImpl, this->layers[142]->getOutputTensor(0), 1, 0);
  (dynamic_cast<MWConvLayer *>(this->layers[144]))->createConvLayer
    (this->targetImpl, this->layers[143]->getOutputTensor(0), 3, 3, 1024, 1024,
     1, 1, 1, 1, 1, 1, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_yolov2Conv2_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_yolov2Conv2_b", 1);
  (dynamic_cast<MWBatchNormalizationLayer *>(this->layers[145]))
    ->createBatchNormalizationLayer(this->targetImpl, this->layers[144]
    ->getOutputTensor(0), 1.0E-5,
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_yolov2Batch2_offset",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_yolov2Batch2_scale",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_yolov2Batch2_trainedMean",
    "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
    "singResNet50_ONNX_yolov2Batch2_trainedVariance", 1, 1);
  (dynamic_cast<MWReLULayer *>(this->layers[146]))->createReLULayer
    (this->targetImpl, this->layers[145]->getOutputTensor(0), 1, 1);
  (dynamic_cast<MWConvLayer *>(this->layers[147]))->createConvLayer
    (this->targetImpl, this->layers[146]->getOutputTensor(0), 1, 1, 1024, 24, 1,
     1, 0, 0, 0, 0, 1, 1, 1,
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_yolov2ClassConv_w",
     "C:\\Users\\shmitra\\Work\\Deep_Learning\\Seminar\\19b\\ResNetImportYolov2\\HelperFilesAndFunctions\\codegen\\mex\\yolov2_detect\\cnn_Yolov2U"
     "singResNet50_ONNX_yolov2ClassConv_b", 0);
  (dynamic_cast<MWYoloExtractionLayer *>(this->layers[148]))
    ->createYoloExtractionLayer(this->targetImpl, this->layers[147]
    ->getOutputTensor(0), 4, 1, 2, 3);
  (dynamic_cast<MWSigmoidLayer *>(this->layers[149]))->createSigmoidLayer
    (this->targetImpl, this->layers[148]->getOutputTensor(0), 0);
  (dynamic_cast<MWExponentialLayer *>(this->layers[150]))
    ->createExponentialLayer(this->targetImpl, this->layers[148]
    ->getOutputTensor(1), 1);
  (dynamic_cast<MWYoloSoftmaxLayer *>(this->layers[151]))
    ->createYoloSoftmaxLayer(this->targetImpl, this->layers[148]
    ->getOutputTensor(2), 4, 2);
  (dynamic_cast<MWDepthConcatenationLayer *>(this->layers[152]))
    ->createDepthConcatenationLayer(this->targetImpl, 3, this->layers[149]
    ->getOutputTensor(0), this->layers[150]->getOutputTensor(0), this->layers
    [151]->getOutputTensor(0), 3);
  (dynamic_cast<MWOutputLayer *>(this->layers[153]))->createOutputLayer
    (this->targetImpl, this->layers[152]->getOutputTensor(0), 3);
  this->postsetup();
  this->inputData = this->layers[0]->getData(0);
  this->outputData = this->layers[153]->getData(0);
}

/* End of code generation (DeepLearningNetwork.cu) */
