#include "MWAdditionLayer.hpp"
#include "MWAdditionLayerImpl.hpp"
#include <stdarg.h>
#include <cassert>
 MWAdditionLayerImpl::MWAdditionLayerImpl(MWCNNLayer* layer, 
MWTargetNetworkImpl* ntwk_impl, int outbufIdx)  : MWCNNLayerImpl(layer, 
ntwk_impl)  { createAdditionLayer(outbufIdx); } 
MWAdditionLayerImpl::~MWAdditionLayerImpl() { } void 
MWAdditionLayerImpl::createAdditionLayer(int outbufIdx) { MWAdditionLayer* 
AdditionLayer = static_cast<MWAdditionLayer*>(getLayer()); MWTensor* ipTensor = 
AdditionLayer->getInputTensor(0); MWTensor* opTensor = 
AdditionLayer->getOutputTensor(0); if (outbufIdx < 0) { 
CUDA_CALL(cudaMalloc((void**)&PtkeOkuClHzhOfpmBevf, 
sizeof(float)*ipTensor->getHeight()*ipTensor->getWidth()*ipTensor->getChannels()*ipTensor->getBatchSize())); 
} else { setData(enPbWLzEmxYCBmzGJutZ->memBuffer[outbufIdx]); 
opTensor->setopBufIndex(outbufIdx); } 
CUDNN_CALL(cudnnCreateTensorDescriptor(getOutputDescriptor(0))); 
CUDNN_CALL(cudnnSetTensor4dDescriptor(*getOutputDescriptor(0), 
CUDNN_TENSOR_NCHW, CUDNN_DATA_FLOAT, ipTensor->getBatchSize(), 
ipTensor->getChannels(), ipTensor->getHeight(), ipTensor->getWidth())); return 
; } void __global__ __launch_bounds__(1024) addImpl(float* in1, float* in2, 
float* out, size_t maxElems) { size_t i = blockDim.x * blockIdx.x + 
threadIdx.x; for (; i < maxElems; i += size_t(blockDim.x*gridDim.x)) { out[i] = 
in1[i] + in2[i]; } } void MWAdditionLayerImpl::predict() { MWAdditionLayer* 
AdditionLayer = static_cast<MWAdditionLayer*>(getLayer()); MWTensor* ipTensor = 
AdditionLayer->getInputTensor(0);  MWTensor* opTensor = 
AdditionLayer->getOutputTensor(0); int fSKMHAqIghbYYgyIpNDw = 
ipTensor->getHeight()*ipTensor->getWidth()*ipTensor->getChannels()*ipTensor->getBatchSize(); 
cudaMemcpy(opTensor->getData(), ipTensor->getData(), 
fSKMHAqIghbYYgyIpNDw*sizeof(float), cudaMemcpyDeviceToDevice); for (int k = 1; k 
< AdditionLayer->getNumInputs(); k++) { cudnnTensorDescriptor_t ipDesc = 
*getCuDNNDescriptor(AdditionLayer->getInputTensor(k)); 
cudnnAddTensor(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), getOnePtr(), ipDesc, 
AdditionLayer->getInputTensor(k)->getData(), getOnePtr(), 
*getOutputDescriptor(0), AdditionLayer->getOutputTensor(0)->getData() ); } } 
void MWAdditionLayerImpl::cleanup() { MWAdditionLayer* AdditionLayer = 
static_cast<MWAdditionLayer*>(getLayer()); 
CUDNN_CALL(cudnnDestroyTensorDescriptor(*getOutputDescriptor(0))); for(int idx 
= 0; idx < AdditionLayer->getNumOutputs(); idx++) {  MWTensor* op = 
AdditionLayer->getOutputTensor(idx); float* data = op->getData(); if (data) { 
if(getLayer()->getOutputTensor(idx)->getopBufIndex() < 0) CUDA_FREE_CALL(data); 
} }  }