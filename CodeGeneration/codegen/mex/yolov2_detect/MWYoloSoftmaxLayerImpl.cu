#include "MWYoloSoftmaxLayer.hpp"
#include "MWYoloSoftmaxLayerImpl.hpp"
#include "MWTargetNetworkImpl.hpp"
 MWYoloSoftmaxLayerImpl::MWYoloSoftmaxLayerImpl(MWCNNLayer* layer, 
MWTargetNetworkImpl* ntwk_impl, int IbSWJNMuIiKbocfQKqXb, int outbufIdx) : 
MWCNNLayerImpl(layer, ntwk_impl) , 
eybNKlJCSDUvsznWynwK(IbSWJNMuIiKbocfQKqXb) { 
createYoloSoftmaxLayer(outbufIdx); } 
MWYoloSoftmaxLayerImpl::~MWYoloSoftmaxLayerImpl() { } void 
MWYoloSoftmaxLayerImpl::createYoloSoftmaxLayer(int outbufIdx) { MWTensor* 
ipTensor = getLayer()->getInputTensor(0); MWTensor* opTensor = 
getLayer()->getOutputTensor(0); if (outbufIdx < 0) { float* buffer = NULL; 
CUDA_CALL(cudaMalloc((void**)&buffer, sizeof(float) * opTensor->getHeight() * 
opTensor->getWidth() * opTensor->getChannels() * opTensor->getBatchSize())); 
opTensor->setData(buffer); } else { 
opTensor->setData(enPbWLzEmxYCBmzGJutZ->memBuffer[outbufIdx]); 
opTensor->setopBufIndex(outbufIdx); } 
CUDNN_CALL(cudnnCreateTensorDescriptor(getOutputDescriptor(0))); 
CUDNN_CALL(cudnnSetTensor4dDescriptor(*getOutputDescriptor(0), 
CUDNN_TENSOR_NCHW, CUDNN_DATA_FLOAT, opTensor->getBatchSize(),  
opTensor->getChannels(),  opTensor->getHeight(),  opTensor->getWidth()));  int 
fOpFYwKNwIfWjnPzNuob = ipTensor->getChannels() / eybNKlJCSDUvsznWynwK; 
tGsvtyAVkrDznETdweDC = new cudnnTensorDescriptor_t; 
CUDNN_CALL(cudnnCreateTensorDescriptor(tGsvtyAVkrDznETdweDC)); 
CUDNN_CALL(cudnnSetTensor4dDescriptor(*tGsvtyAVkrDznETdweDC, 
CUDNN_TENSOR_NCHW, CUDNN_DATA_FLOAT, opTensor->getBatchSize(), 
fOpFYwKNwIfWjnPzNuob, eybNKlJCSDUvsznWynwK, opTensor->getWidth() * 
opTensor->getHeight())); } void MWYoloSoftmaxLayerImpl::predict() { MWTensor* 
ipTensor = getLayer()->getInputTensor(0); MWTensor* opTensor = 
getLayer()->getOutputTensor(0); CUDNN_CALL(cudnnSoftmaxForward( 
*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), CUDNN_SOFTMAX_ACCURATE, 
CUDNN_SOFTMAX_MODE_CHANNEL, getOnePtr(), *tGsvtyAVkrDznETdweDC, 
ipTensor->getData(), getZeroPtr(), *tGsvtyAVkrDznETdweDC, 
opTensor->getData())); } void MWYoloSoftmaxLayerImpl::cleanup() { 
CUDNN_CALL(cudnnDestroyTensorDescriptor(*getOutputDescriptor())); 
CUDNN_CALL(cudnnDestroyTensorDescriptor(*tGsvtyAVkrDznETdweDC)); 
for (int idx = 0; idx < getLayer()->getNumOutputs(); idx++) { float* data = 
getLayer()->getOutputTensor(idx)->getData(); if (data) { if 
(getLayer()->getOutputTensor(idx)->getopBufIndex() < 0) { CUDA_FREE_CALL(data); 
} } } }