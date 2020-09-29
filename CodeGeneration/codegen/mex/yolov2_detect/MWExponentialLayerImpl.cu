#include "MWExponentialLayerImpl.hpp"
#include "MWTargetNetworkImpl.hpp"
#include "cnn_api.hpp"
#include "MWKernelHeaders.hpp"
#include <math.h>
#include <cassert>
 MWExponentialLayerImpl::MWExponentialLayerImpl(MWCNNLayer* layer, 
MWTargetNetworkImpl* ntwk_impl, int outbufIdx) : MWCNNLayerImpl(layer, 
ntwk_impl) { createExponentialLayer(outbufIdx); } 
MWExponentialLayerImpl::~MWExponentialLayerImpl() { } void 
MWExponentialLayerImpl::createExponentialLayer(int outbufIdx) { MWTensor* 
opTensor = getLayer()->getOutputTensor(0); if (outbufIdx < 0) { float* buffer = 
NULL; CUDA_CALL(cudaMalloc((void**)&buffer, sizeof(float) * 
opTensor->getBatchSize() * opTensor->getChannels() * opTensor->getHeight() * 
opTensor->getWidth())); opTensor->setData(buffer); } else { 
opTensor->setData(enPbWLzEmxYCBmzGJutZ->memBuffer[outbufIdx]); 
opTensor->setopBufIndex(outbufIdx); } 
CUDNN_CALL(cudnnCreateTensorDescriptor(getOutputDescriptor())); 
CUDNN_CALL(cudnnSetTensor4dDescriptor( *getOutputDescriptor(), 
CUDNN_TENSOR_NCHW, CUDNN_DATA_FLOAT, opTensor->getBatchSize(), 
opTensor->getChannels(), opTensor->getHeight(), opTensor->getWidth())); } void 
MWExponentialLayerImpl::predict() { assert(this->getData() != 
getLayer()->getInputTensor(0)->getData()); long int iPqBiFnIJMxelVhQBZex = 
getLayer()->getOutputTensor(0)->getHeight() * 
getLayer()->getOutputTensor(0)->getWidth() * 
getLayer()->getOutputTensor(0)->getChannels() * 
getLayer()->getOutputTensor(0)->getBatchSize(); long int rSmEWccbJFfPGddhPemm = 
((iPqBiFnIJMxelVhQBZex + 31) / 32) * 32; long int tnTPxeDjBsqLAPkJcPJX = 
(rSmEWccbJFfPGddhPemm < 1024) ? rSmEWccbJFfPGddhPemm : 1024; long int 
MNuwXDSoGEYeABeVTwOh = (iPqBiFnIJMxelVhQBZex + tnTPxeDjBsqLAPkJcPJX - 
1) / tnTPxeDjBsqLAPkJcPJX; exp_kernel<<<MNuwXDSoGEYeABeVTwOh, 
tnTPxeDjBsqLAPkJcPJX>>>( getLayer()->getInputTensor(0)->getData(), 
getLayer()->getOutputTensor(0)->getData(), iPqBiFnIJMxelVhQBZex); return; } 
void MWExponentialLayerImpl::cleanup() { 
CUDNN_CALL(cudnnDestroyTensorDescriptor(*getOutputDescriptor())); for (int idx 
= 0; idx < getLayer()->getNumOutputs(); idx++) { float* data = 
getLayer()->getOutputTensor(idx)->getData(); if (data) { if 
(getLayer()->getOutputTensor(idx)->getopBufIndex() == -1) { 
CUDA_FREE_CALL(data); } } } }