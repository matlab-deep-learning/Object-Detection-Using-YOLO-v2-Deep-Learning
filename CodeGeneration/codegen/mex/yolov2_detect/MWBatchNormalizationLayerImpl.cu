#include "MWBatchNormalizationLayer.hpp"
#include "MWBatchNormalizationLayerImpl.hpp"
#include "MWTargetNetworkImpl.hpp"
#include "cnn_api.hpp"
#include "MWCNNLayerImpl.hpp"
#include <stdio.h>
#include <cassert> 
 MWBatchNormalizationLayerImpl::MWBatchNormalizationLayerImpl(MWCNNLayer* 
layer, MWTargetNetworkImpl* ntwk_impl, double const GsZlHFuhbvjLtRMDjXnW, 
const char* IwKnaBoXVubIRYcxEJLH, const char* JgLfgHrHMEMmMYTettJF, const 
char* JsZenQeBPMhwsyEhVHiD, const char* 
JwxFdqOKggeawILBfGgg, int inPlace, int outbufIdx) : 
MWCNNLayerImpl(layer, ntwk_impl)  , oJUVMnJggjhEdQLWzIUC(NULL) , 
gsJtSpgIkTNvahoTFqow(NULL) , ugnnrhsgTeWucrMPCJUc(NULL) , 
ujSEtllBwMdSJhSkFCia(NULL) , UdmcwaUkepxfZrpdpcAN(inPlace) { 
CUDNN_CALL(cudnnCreateTensorDescriptor(&MRnAxrRZGjgErnCjJcbo)); 
CUDNN_CALL(cudnnCreateTensorDescriptor(getOutputDescriptor())); 
createBatchNormalizationLayer(GsZlHFuhbvjLtRMDjXnW, IwKnaBoXVubIRYcxEJLH, 
JgLfgHrHMEMmMYTettJF, JsZenQeBPMhwsyEhVHiD, 
JwxFdqOKggeawILBfGgg, outbufIdx); } 
MWBatchNormalizationLayerImpl::~MWBatchNormalizationLayerImpl() { } void 
MWBatchNormalizationLayerImpl::createBatchNormalizationLayer(double const 
GsZlHFuhbvjLtRMDjXnW, const char* IwKnaBoXVubIRYcxEJLH, const char* 
JgLfgHrHMEMmMYTettJF, const char* JsZenQeBPMhwsyEhVHiD, const char* 
JwxFdqOKggeawILBfGgg, int outbufIdx) { MWBatchNormalizationLayer* 
BNLayer = static_cast<MWBatchNormalizationLayer*>(getLayer()); MWTensor* 
ipTensor = BNLayer->getInputTensor(); MWTensor* opTensor = 
BNLayer->getOutputTensor(); REXdEoRjxuQJkqgIDihy = GsZlHFuhbvjLtRMDjXnW; 
CUDNN_CALL(cudnnSetTensor4dDescriptor(*getOutputDescriptor(), 
CUDNN_TENSOR_NCHW, CUDNN_DATA_FLOAT, opTensor->getBatchSize(), 
opTensor->getChannels(), opTensor->getHeight(), opTensor->getWidth())); const 
size_t numBytes = sizeof(float)*ipTensor->getChannels(); 
CUDA_CALL(cudaMalloc((void**)&oJUVMnJggjhEdQLWzIUC, numBytes)); 
CUDA_CALL(cudaMalloc((void**)&gsJtSpgIkTNvahoTFqow, numBytes)); 
CUDA_CALL(cudaMalloc((void**)&ugnnrhsgTeWucrMPCJUc, numBytes)); 
CUDA_CALL(cudaMalloc((void**)&ujSEtllBwMdSJhSkFCia, numBytes)); 
eFaDPmxDdzHlRYSAoMmX = CUDNN_BATCHNORM_SPATIAL; 
CUDNN_CALL(cudnnDeriveBNTensorDescriptor(MRnAxrRZGjgErnCjJcbo, 
*getOutputDescriptor(), eFaDPmxDdzHlRYSAoMmX));  loadScale(JgLfgHrHMEMmMYTettJF); 
loadOffset(IwKnaBoXVubIRYcxEJLH); 
loadTrainedMean(JsZenQeBPMhwsyEhVHiD); 
loadTrainedVariance(JwxFdqOKggeawILBfGgg); if (outbufIdx < 0) { 
if(UdmcwaUkepxfZrpdpcAN){ PtkeOkuClHzhOfpmBevf = 
getLayer()->getInputTensor()->getData(); } else{ 
CUDA_CALL(cudaMalloc((void**)&PtkeOkuClHzhOfpmBevf, 
sizeof(float)*opTensor->getHeight()* 
opTensor->getWidth()*opTensor->getChannels()*opTensor->getBatchSize())); } } 
else { setData(enPbWLzEmxYCBmzGJutZ->memBuffer[outbufIdx]); 
opTensor->setopBufIndex(outbufIdx); } } void 
MWBatchNormalizationLayerImpl::iLoadParamOntoGPU(char const * const 
RqCYCrGsNvzKYrRMXbsI, int const fYaOQTeunPwVjnhhTECh, float* 
SugesRlPIbOVzRgNWRnl) { FILE* SUjIWYfjMcdzSZaCSVRT = 
MWCNNLayer::openBinaryFile(RqCYCrGsNvzKYrRMXbsI); assert(SUjIWYfjMcdzSZaCSVRT); int 
const NMMfJylfQjiIUAKhXCJb = sizeof(float)*fYaOQTeunPwVjnhhTECh; float* 
MdSWZSOAjugbWppryHbR = (float*)malloc(NMMfJylfQjiIUAKhXCJb); 
fread(MdSWZSOAjugbWppryHbR, sizeof(float), fYaOQTeunPwVjnhhTECh, SUjIWYfjMcdzSZaCSVRT); 
fclose(SUjIWYfjMcdzSZaCSVRT); CUDA_CALL(cudaMemcpy(SugesRlPIbOVzRgNWRnl, 
MdSWZSOAjugbWppryHbR, NMMfJylfQjiIUAKhXCJb, cudaMemcpyHostToDevice)); 
free(MdSWZSOAjugbWppryHbR); } void MWBatchNormalizationLayerImpl::loadScale(const 
char* RqCYCrGsNvzKYrRMXbsI) { MWBatchNormalizationLayer* BNLayer = 
static_cast<MWBatchNormalizationLayer*>(getLayer()); MWTensor* opTensor = 
BNLayer->getOutputTensor(); iLoadParamOntoGPU(RqCYCrGsNvzKYrRMXbsI, 
opTensor->getChannels(), oJUVMnJggjhEdQLWzIUC); } void 
MWBatchNormalizationLayerImpl::loadOffset(const char* RqCYCrGsNvzKYrRMXbsI) { 
MWBatchNormalizationLayer* BNLayer = 
static_cast<MWBatchNormalizationLayer*>(getLayer()); MWTensor* opTensor = 
BNLayer->getOutputTensor(); iLoadParamOntoGPU(RqCYCrGsNvzKYrRMXbsI, 
opTensor->getChannels(), gsJtSpgIkTNvahoTFqow); } void 
MWBatchNormalizationLayerImpl::loadTrainedMean(const char* RqCYCrGsNvzKYrRMXbsI) 
{ MWBatchNormalizationLayer* BNLayer = 
static_cast<MWBatchNormalizationLayer*>(getLayer()); MWTensor* opTensor = 
BNLayer->getOutputTensor(); iLoadParamOntoGPU(RqCYCrGsNvzKYrRMXbsI, 
opTensor->getChannels(), ugnnrhsgTeWucrMPCJUc); } void 
MWBatchNormalizationLayerImpl::loadTrainedVariance(const char* 
RqCYCrGsNvzKYrRMXbsI) { MWBatchNormalizationLayer* BNLayer = 
static_cast<MWBatchNormalizationLayer*>(getLayer()); MWTensor* opTensor = 
BNLayer->getOutputTensor(); iLoadParamOntoGPU(RqCYCrGsNvzKYrRMXbsI, 
opTensor->getChannels(), ujSEtllBwMdSJhSkFCia); } void 
MWBatchNormalizationLayerImpl::predict() { MWBatchNormalizationLayer* BNLayer = 
static_cast<MWBatchNormalizationLayer*>(getLayer()); MWTensor* ipTensor = 
BNLayer->getInputTensor(); MWTensor* opTensor = BNLayer->getOutputTensor(); 
const cudnnTensorDescriptor_t UWAGLbDcvybdWBtshhsr = 
*getCuDNNDescriptor(ipTensor); float* UpnEytIWGokwbTFkBcSx = ipTensor->getData(); 
cudnnTensorDescriptor_t kNsviQGMPdXzNMRixGWR = *getOutputDescriptor(); float* 
kkqTyvjYvRFtTOyQUwrF = getData(); 
CUDNN_CALL(cudnnBatchNormalizationForwardInference( 
*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), eFaDPmxDdzHlRYSAoMmX, getOnePtr(), 
getZeroPtr(),  UWAGLbDcvybdWBtshhsr, UpnEytIWGokwbTFkBcSx, kNsviQGMPdXzNMRixGWR, 
kkqTyvjYvRFtTOyQUwrF, MRnAxrRZGjgErnCjJcbo, oJUVMnJggjhEdQLWzIUC, 
gsJtSpgIkTNvahoTFqow, ugnnrhsgTeWucrMPCJUc, ujSEtllBwMdSJhSkFCia, 
REXdEoRjxuQJkqgIDihy)); } void MWBatchNormalizationLayerImpl::cleanup() { 
CUDNN_CALL(cudnnDestroyTensorDescriptor(MRnAxrRZGjgErnCjJcbo)); 
CUDNN_CALL(cudnnDestroyTensorDescriptor(*getOutputDescriptor())); 
if(oJUVMnJggjhEdQLWzIUC) { CUDA_FREE_CALL(oJUVMnJggjhEdQLWzIUC); } 
if(gsJtSpgIkTNvahoTFqow) { CUDA_FREE_CALL(gsJtSpgIkTNvahoTFqow); } 
if(ugnnrhsgTeWucrMPCJUc) { CUDA_FREE_CALL(ugnnrhsgTeWucrMPCJUc); } 
if(ujSEtllBwMdSJhSkFCia) { CUDA_FREE_CALL(ujSEtllBwMdSJhSkFCia); } 
MWTensor* op = getLayer()->getOutputTensor(0); float* data = op->getData(); if 
(data) { if((op->getopBufIndex() < 0) && !UdmcwaUkepxfZrpdpcAN) 
CUDA_FREE_CALL(data); } }