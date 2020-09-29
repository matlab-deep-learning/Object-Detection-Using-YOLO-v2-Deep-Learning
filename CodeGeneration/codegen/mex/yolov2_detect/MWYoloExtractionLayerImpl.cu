#include "MWYoloExtractionLayerImpl.hpp"
#include "MWTargetNetworkImpl.hpp"
#include "cnn_api.hpp"
#include "MWKernelHeaders.hpp"
#include <math.h>
#include <cassert>
 MWYoloExtractionLayerImpl::MWYoloExtractionLayerImpl(MWCNNLayer* layer, 
MWTargetNetworkImpl* ntwk_impl, int IbSWJNMuIiKbocfQKqXb, const 
std::vector<int>& MUmglsoWcEiRiAZsclur) : MWCNNLayerImpl(layer, ntwk_impl) , 
eybNKlJCSDUvsznWynwK(IbSWJNMuIiKbocfQKqXb) , fylVqSnTjNbHDtlPhzaj(3) { 
createYoloExtractionLayer(MUmglsoWcEiRiAZsclur); } 
MWYoloExtractionLayerImpl::~MWYoloExtractionLayerImpl() { } void 
MWYoloExtractionLayerImpl::createYoloExtractionLayer( const std::vector<int>& 
MUmglsoWcEiRiAZsclur) { assert(fylVqSnTjNbHDtlPhzaj == 3); for (int i = 0; i 
< fylVqSnTjNbHDtlPhzaj; i++) { MWTensor* opTensor = 
getLayer()->getOutputTensor(i); int outbufIdx = MUmglsoWcEiRiAZsclur[i]; if 
(outbufIdx < 0) { float* buffer = NULL; CUDA_CALL(cudaMalloc((void**)&buffer, 
sizeof(float) * opTensor->getBatchSize() * opTensor->getChannels() * 
opTensor->getHeight() * opTensor->getWidth())); opTensor->setData(buffer); } 
else { opTensor->setData(enPbWLzEmxYCBmzGJutZ->memBuffer[outbufIdx]); 
opTensor->setopBufIndex(outbufIdx); } 
CUDNN_CALL(cudnnCreateTensorDescriptor(getOutputDescriptor(i))); 
CUDNN_CALL(cudnnSetTensor4dDescriptor( *getOutputDescriptor(i), 
CUDNN_TENSOR_NCHW, CUDNN_DATA_FLOAT, opTensor->getBatchSize(), 
opTensor->getChannels(), opTensor->getHeight(), opTensor->getWidth())); } } 
void MWYoloExtractionLayerImpl::predict() { assert(this->getData() != 
getLayer()->getInputTensor(0)->getData()); if 
(getLayer()->getInputTensor(0)->getBatchSize() == 1) { float* 
XNZmftADYzuZnIYIpBaT = getLayer()->getInputTensor(0)->getData(); long int 
jscBrjkVJyVfMMDjFpgl = (getLayer()->getOutputTensor(0)->getHeight()) 
* (getLayer()->getOutputTensor(0)->getWidth()); long int 
jhFUWlztBndwjbXwYNaJ = 
getLayer()->getOutputTensor(0)->getChannels() * jscBrjkVJyVfMMDjFpgl; 
CUDA_CALL(cudaMemcpy(getLayer()->getOutputTensor(0)->getData(), 
XNZmftADYzuZnIYIpBaT, sizeof(float) * jhFUWlztBndwjbXwYNaJ, 
cudaMemcpyDeviceToDevice)); long int jmcFOAbZArjGDNhshSro = 
getLayer()->getOutputTensor(1)->getChannels() * jscBrjkVJyVfMMDjFpgl; 
CUDA_CALL(cudaMemcpy(getLayer()->getOutputTensor(1)->getData(), 
XNZmftADYzuZnIYIpBaT + jhFUWlztBndwjbXwYNaJ, sizeof(float) * 
jmcFOAbZArjGDNhshSro, cudaMemcpyDeviceToDevice)); long int 
jaqKGCwoANNDMHgAsehk = 
getLayer()->getOutputTensor(2)->getChannels() * jscBrjkVJyVfMMDjFpgl; 
CUDA_CALL(cudaMemcpy(getLayer()->getOutputTensor(2)->getData(), 
XNZmftADYzuZnIYIpBaT + jhFUWlztBndwjbXwYNaJ + 
jmcFOAbZArjGDNhshSro, sizeof(float) * 
jaqKGCwoANNDMHgAsehk, cudaMemcpyDeviceToDevice)); } else { int 
aFDPITUhkPdupMfPOBnd = getLayer()->getInputTensor(0)->getWidth(); long int 
ZinudJuZuGitiNTsJpBR = (getLayer()->getInputTensor(0)->getHeight()) * 
(getLayer()->getInputTensor(0)->getWidth()); long int 
ZUTPCvgISoRdtnhGqXzM = ZinudJuZuGitiNTsJpBR * 
(getLayer()->getInputTensor(0)->getChannels()); long int ZKjSVYDDjACizBkGbqBq = 
ZUTPCvgISoRdtnhGqXzM * getLayer()->getInputTensor(0)->getBatchSize(); 
long int jhFUWlztBndwjbXwYNaJ = ZinudJuZuGitiNTsJpBR * 
(getLayer()->getOutputTensor(0)->getChannels()); long int 
jmcFOAbZArjGDNhshSro = ZinudJuZuGitiNTsJpBR * 
(getLayer()->getOutputTensor(1)->getChannels()); long int 
jaqKGCwoANNDMHgAsehk = ZinudJuZuGitiNTsJpBR * 
(getLayer()->getOutputTensor(2)->getChannels()); long int rSmEWccbJFfPGddhPemm = 
((ZKjSVYDDjACizBkGbqBq + 31) / 32) * 32; long int tnTPxeDjBsqLAPkJcPJX = 
(rSmEWccbJFfPGddhPemm < 1024) ? rSmEWccbJFfPGddhPemm : 1024; long int 
MNuwXDSoGEYeABeVTwOh = (ZKjSVYDDjACizBkGbqBq + tnTPxeDjBsqLAPkJcPJX - 
1) / tnTPxeDjBsqLAPkJcPJX; YoloExtractionImpl<<<MNuwXDSoGEYeABeVTwOh, 
tnTPxeDjBsqLAPkJcPJX>>>( getLayer()->getInputTensor(0)->getData(), 
getLayer()->getOutputTensor(0)->getData(), 
getLayer()->getOutputTensor(1)->getData(), 
getLayer()->getOutputTensor(2)->getData(), eybNKlJCSDUvsznWynwK, 
aFDPITUhkPdupMfPOBnd, ZinudJuZuGitiNTsJpBR, 
ZUTPCvgISoRdtnhGqXzM, jhFUWlztBndwjbXwYNaJ, 
jmcFOAbZArjGDNhshSro, jaqKGCwoANNDMHgAsehk, 
ZKjSVYDDjACizBkGbqBq); } return; } void MWYoloExtractionLayerImpl::cleanup() { 
for (int idx = 0; idx < getLayer()->getNumOutputs(); idx++) { 
CUDNN_CALL(cudnnDestroyTensorDescriptor(*getOutputDescriptor(idx))); float* 
data = getLayer()->getOutputTensor(idx)->getData(); if (data) { if 
(getLayer()->getOutputTensor(idx)->getopBufIndex() == -1) { 
CUDA_FREE_CALL(data); } } } }