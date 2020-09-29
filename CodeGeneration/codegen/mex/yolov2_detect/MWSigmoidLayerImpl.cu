#include "MWSigmoidLayer.hpp"
#include "MWSigmoidLayerImpl.hpp"
#include "MWTargetNetworkImpl.hpp"
#include <stdarg.h>
#include <cassert>
 MWSigmoidLayerImpl::MWSigmoidLayerImpl(MWCNNLayer* layer, MWTargetNetworkImpl* 
ntwk_impl, int outbufIdx) : MWCNNLayerImpl(layer, ntwk_impl)  { 
createSigmoidLayer(outbufIdx); } MWSigmoidLayerImpl::~MWSigmoidLayerImpl() { } 
void MWSigmoidLayerImpl::createSigmoidLayer(int outbufIdx) { MWSigmoidLayer* 
SigmoidLayer = static_cast<MWSigmoidLayer*>(getLayer()); MWTensor* ipTensor = 
SigmoidLayer->getInputTensor(0); MWTensor* opTensor = 
SigmoidLayer->getOutputTensor(0); if (outbufIdx < 0) { 
CUDA_CALL(cudaMalloc((void**)&PtkeOkuClHzhOfpmBevf, 
sizeof(float)*opTensor->getHeight()*opTensor->getWidth()*opTensor->getChannels()*opTensor->getBatchSize())); 
} else { setData(enPbWLzEmxYCBmzGJutZ->memBuffer[outbufIdx]); 
opTensor->setopBufIndex(outbufIdx); } 
CUDNN_CALL(cudnnCreateTensorDescriptor(getOutputDescriptor(0))); 
CUDNN_CALL(cudnnSetTensor4dDescriptor(*getOutputDescriptor(0), 
CUDNN_TENSOR_NCHW,  CUDNN_DATA_FLOAT, ipTensor->getBatchSize(),  
ipTensor->getChannels(),  ipTensor->getHeight(),  ipTensor->getWidth()));  
CUDNN_CALL(cudnnCreateActivationDescriptor(&pckLLTEdVPoCZLRwyDnM)); 
CUDNN_CALL(cudnnSetActivationDescriptor(pckLLTEdVPoCZLRwyDnM, 
CUDNN_ACTIVATION_SIGMOID,  CUDNN_NOT_PROPAGATE_NAN, 0));  } void 
MWSigmoidLayerImpl::predict() { MWSigmoidLayer* SigmoidLayer = 
static_cast<MWSigmoidLayer*>(getLayer()); MWTensor* ipTensor = 
SigmoidLayer->getInputTensor(0);  MWTensor* opTensor = 
SigmoidLayer->getOutputTensor(0); cudnnTensorDescriptor_t ipDesc = 
*getCuDNNDescriptor(ipTensor); 
CUDNN_CALL(cudnnActivationForward(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), 
pckLLTEdVPoCZLRwyDnM,  getOnePtr(), ipDesc, ipTensor->getData(), 
getZeroPtr(), *getOutputDescriptor(), opTensor->getData())); } void 
MWSigmoidLayerImpl::cleanup() { MWSigmoidLayer* SigmoidLayer = 
static_cast<MWSigmoidLayer*>(getLayer()); 
CUDNN_CALL(cudnnDestroyActivationDescriptor(pckLLTEdVPoCZLRwyDnM)); 
CUDNN_CALL(cudnnDestroyTensorDescriptor(*getOutputDescriptor(0))); MWTensor* op 
= SigmoidLayer->getOutputTensor(); float* data = op->getData(); if (data) { 
if(getLayer()->getOutputTensor()->getopBufIndex() < 0) CUDA_FREE_CALL(data); } }