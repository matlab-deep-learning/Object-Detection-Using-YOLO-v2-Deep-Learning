#include "MWDepthConcatenationLayerImpl.hpp"
#include "MWDepthConcatenationLayer.hpp"
#include "MWTargetNetworkImpl.hpp"
#include <stdarg.h>
#include <cassert>
 MWDepthConcatenationLayerImpl::MWDepthConcatenationLayerImpl(MWCNNLayer* 
layer, MWTargetNetworkImpl* ntwk_impl, int outbufIdx) : MWCNNLayerImpl(layer, 
ntwk_impl) { createDepthConcatenationLayer(outbufIdx); } 
MWDepthConcatenationLayerImpl::~MWDepthConcatenationLayerImpl() {  } void 
MWDepthConcatenationLayerImpl::createDepthConcatenationLayer(int outbufIdx) {  
MWTensor* opTensor = getLayer()->getOutputTensor(0);  if (outbufIdx < 0) { 
CUDA_CALL(cudaMalloc((void**)&PtkeOkuClHzhOfpmBevf, 
sizeof(float)*opTensor->getHeight()*opTensor->getWidth()*opTensor->getChannels()*opTensor->getBatchSize())); 
} else { setData(enPbWLzEmxYCBmzGJutZ->memBuffer[outbufIdx]); 
opTensor->setopBufIndex(outbufIdx); } 
CUDNN_CALL(cudnnCreateTensorDescriptor(getOutputDescriptor(0))); 
CUDNN_CALL(cudnnSetTensor4dDescriptor(*getOutputDescriptor(0), 
CUDNN_TENSOR_NCHW, CUDNN_DATA_FLOAT, opTensor->getBatchSize(), 
opTensor->getChannels(), opTensor->getHeight(), opTensor->getWidth())); } void 
__global__ __launch_bounds__(1024) concatImpl(float* in, float* out, size_t 
numElems,  size_t batchSize,  size_t outStride,  size_t startOffset)  { size_t 
i = blockDim.x * blockIdx.x + threadIdx.x; size_t maxElems = 
numElems*batchSize; for (; i < maxElems; i += size_t(blockDim.x*gridDim.x)) { 
size_t batchOffset = i/numElems; size_t elemOffset = i - 
(batchOffset*numElems);  int outOffset = startOffset + batchOffset*outStride; 
out[elemOffset + outOffset] = in[i];  } } void 
MWDepthConcatenationLayerImpl::predict() { int outputOffset = 0; MWTensor* 
opTensor = getLayer()->getOutputTensor(0); int outputStridePerBatch = 
opTensor->getHeight()*opTensor->getWidth()*opTensor->getChannels(); for (int k 
= 0; k < getLayer()->getNumInputs(); k++) { MWTensor* ipTensor = 
getLayer()->getInputTensor(k); int fSKMHAqIghbYYgyIpNDw = 
ipTensor->getBatchSize()* ipTensor->getHeight()* ipTensor->getWidth()* 
ipTensor->getChannels();  int tnTPxeDjBsqLAPkJcPJX = 
std::ceil(static_cast<float>(fSKMHAqIghbYYgyIpNDw)/static_cast<float>(32))*32; 
tnTPxeDjBsqLAPkJcPJX = (tnTPxeDjBsqLAPkJcPJX < 1024) ? 
tnTPxeDjBsqLAPkJcPJX : 1024; int MNuwXDSoGEYeABeVTwOh = 
(fSKMHAqIghbYYgyIpNDw + tnTPxeDjBsqLAPkJcPJX - 
1)/tnTPxeDjBsqLAPkJcPJX; int numElemsPerBatch = 
ipTensor->getHeight()*ipTensor->getWidth()*ipTensor->getChannels(); 
concatImpl<<<MNuwXDSoGEYeABeVTwOh, 
tnTPxeDjBsqLAPkJcPJX>>>(ipTensor->getData(), getData(), numElemsPerBatch, 
ipTensor->getBatchSize(), outputStridePerBatch, outputOffset); outputOffset += 
numElemsPerBatch; } } void MWDepthConcatenationLayerImpl::cleanup() { 
CUDNN_CALL(cudnnDestroyTensorDescriptor(*getOutputDescriptor(0))); 
if(PtkeOkuClHzhOfpmBevf) { if(getLayer()->getOutputTensor(0)->getopBufIndex() < 0) 
CUDA_FREE_CALL(PtkeOkuClHzhOfpmBevf); } }