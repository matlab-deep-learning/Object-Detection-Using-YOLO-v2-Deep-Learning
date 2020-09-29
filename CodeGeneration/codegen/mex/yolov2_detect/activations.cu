/*
 * activations.cu
 *
 * Code generation for function 'activations'
 *
 */

/* Include files */
#include "MWCudaDimUtility.h"
#include "rt_nonfinite.h"
#include "yolov2_detect.h"
#include "activations.h"
#include "DeepLearningNetwork.h"

/* Function Declarations */
static __global__ void b_DeepLearningNetwork_activatio(const real32_T inputdata
  [150528], real32_T inputT[150528]);
static __global__ void c_DeepLearningNetwork_activatio(real32_T out[4704],
  real32_T outT[4704]);

/* Function Definitions */
static __global__ __launch_bounds__(512, 1) void b_DeepLearningNetwork_activatio
  (const real32_T inputdata[150528], real32_T inputT[150528])
{
  uint32_T threadId;
  int32_T i4;
  int32_T i5;
  int32_T p;
  uint32_T tmpIndex;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  i4 = static_cast<int32_T>((threadId % 224U));
  tmpIndex = (threadId - static_cast<uint32_T>(i4)) / 224U;
  i5 = static_cast<int32_T>((tmpIndex % 224U));
  tmpIndex = (tmpIndex - static_cast<uint32_T>(i5)) / 224U;
  p = static_cast<int32_T>(tmpIndex);
  if (p < 3) {
    inputT[(i4 + 224 * i5) + 50176 * p] = inputdata[(i5 + 224 * i4) + 50176 * p];
  }
}

static __global__ __launch_bounds__(512, 1) void c_DeepLearningNetwork_activatio
  (real32_T out[4704], real32_T outT[4704])
{
  uint32_T threadId;
  int32_T i4;
  int32_T i5;
  int32_T p;
  uint32_T tmpIndex;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  i4 = static_cast<int32_T>((threadId % 14U));
  tmpIndex = (threadId - static_cast<uint32_T>(i4)) / 14U;
  i5 = static_cast<int32_T>((tmpIndex % 14U));
  tmpIndex = (tmpIndex - static_cast<uint32_T>(i5)) / 14U;
  p = static_cast<int32_T>(tmpIndex);
  if (p < 24) {
    outT[(i4 + 14 * i5) + 196 * p] = out[(i5 + 14 * i4) + 196 * p];
  }
}

void DeepLearningNetwork_activations(b_Yolov2UsingResNet50_ONNX_0 *obj, const
  real32_T inputdata[150528], real32_T outT[4704])
{
  real32_T (*gpu_inputT)[150528];
  real32_T (*gpu_out)[4704];
  real32_T (*gpu_inputdata)[150528];
  real32_T (*gpu_outT)[4704];
  cudaMalloc(&gpu_outT, 18816ULL);
  cudaMalloc(&gpu_out, 18816ULL);
  cudaMalloc(&gpu_inputT, 602112ULL);
  cudaMalloc(&gpu_inputdata, 602112ULL);
  cudaMemcpy(gpu_inputdata, (void *)&inputdata[0], 602112ULL,
             cudaMemcpyHostToDevice);
  b_DeepLearningNetwork_activatio<<<dim3(294U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_inputdata, *gpu_inputT);
  cudaMemcpy(obj->inputData, *gpu_inputT, 150528U * sizeof(real32_T),
             cudaMemcpyDeviceToDevice);
  obj->activations(153);
  cudaMemcpy(*gpu_out, obj->getLayerOutput(153, 0), 4704U * sizeof(real32_T),
             cudaMemcpyDeviceToDevice);
  c_DeepLearningNetwork_activatio<<<dim3(10U, 1U, 1U), dim3(512U, 1U, 1U)>>>
    (*gpu_out, *gpu_outT);
  cudaMemcpy(&outT[0], gpu_outT, 18816ULL, cudaMemcpyDeviceToHost);
  cudaFree(*gpu_inputdata);
  cudaFree(*gpu_inputT);
  cudaFree(*gpu_out);
  cudaFree(*gpu_outT);
}

/* End of code generation (activations.cu) */
