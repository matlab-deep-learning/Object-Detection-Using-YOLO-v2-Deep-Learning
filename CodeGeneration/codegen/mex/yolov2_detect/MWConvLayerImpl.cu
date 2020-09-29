#include "MWConvLayerImpl.hpp"
#include "MWConvLayer.hpp"
#include "MWTargetNetworkImpl.hpp"
#include "cnn_api.hpp"
#include <cassert>
#include <stdio.h>
 MWConvLayerImpl::MWConvLayerImpl(MWCNNLayer* layer, MWTargetNetworkImpl* 
ntwk_impl, int filt_H, int filt_W, int numGrps, int numChnls, int numFilts, int 
FpguQZSermqZCMRiUfML, int FrpxvsDMwwgbpqHXWxmN, int CpMjJjtGOeWOzwxpAAQP, int 
ClEhcJFlvGCgiavziIag, int CufLFODQDXTAPyRqYodN, int DRzwhbNPpftRRIXXfHzd, 
int ATEikvMQPqBefhJzjzhc, int AuqaQHxmPQSyYRemQvyX, const char* 
vpXxoeEhdEosLSsYXkNG, const char* MIBnYCbKBdUrlfqlHdoo, int outbufIdx) : 
MWCNNLayerImpl(layer, ntwk_impl)  , yPBlKhIGljihkXaXbYpB(NULL) , vIWQzNvYZSuxmOTVDFhU(NULL) , 
KHClOltUSuqFVVErSxVb(NULL) , veFyKKHbdqBIvQLYBqfF(NULL) , URgvgDXnZskIYGdtimcU(NULL) , 
XCLDbxHBtWRStETWIkId(NULL) , aLsOwwcceEmRSYzllBNs(0) , 
AwZQzUhuWVLGrWgLHRuM(filt_H) , AzTsxYcYjIEJsGQbeYHm (filt_W) , 
BuyZFXzwOMxcePIbCLfl (numGrps) , BdqURaHPmdnfzvtUvocl (numChnls) , 
BlRIQPyqJZORKENzSdYf (numFilts) { enPbWLzEmxYCBmzGJutZ = ntwk_impl; 
CUDNN_CALL(cudnnCreateConvolutionDescriptor(&ONvcEjLBnVNUdjMKOAwF)); 
CUDNN_CALL(cudnnCreateFilterDescriptor(&SDWKEQTZaTFZByPlzUDR)); 
CUDNN_CALL(cudnnCreateTensorDescriptor(&MEmIeGILUZNEWEagSzRk)); 
CUDNN_CALL(cudnnCreateTensorDescriptor(getOutputDescriptor())); 
createConvLayer(FpguQZSermqZCMRiUfML, FrpxvsDMwwgbpqHXWxmN, CpMjJjtGOeWOzwxpAAQP, 
ClEhcJFlvGCgiavziIag, CufLFODQDXTAPyRqYodN, DRzwhbNPpftRRIXXfHzd, 
ATEikvMQPqBefhJzjzhc, AuqaQHxmPQSyYRemQvyX, 
vpXxoeEhdEosLSsYXkNG, MIBnYCbKBdUrlfqlHdoo, outbufIdx); } float 
MWConvLayerImpl::getIsGrouped() { return aLsOwwcceEmRSYzllBNs; } void 
MWConvLayerImpl::setIsGrouped(float ig) { aLsOwwcceEmRSYzllBNs = ig; } void 
MWConvLayerImpl::setOutput2(float* out2) { yPBlKhIGljihkXaXbYpB = out2; } float* 
MWConvLayerImpl::getOutput2() { return yPBlKhIGljihkXaXbYpB; } 
cudnnTensorDescriptor_t* MWConvLayerImpl::getGroupDescriptor() { return 
&THfVbcZJtANcLKxEriuV; } void MWConvLayerImpl::createConvLayer(int 
FpguQZSermqZCMRiUfML, int FrpxvsDMwwgbpqHXWxmN, int CpMjJjtGOeWOzwxpAAQP, int 
ClEhcJFlvGCgiavziIag , int CufLFODQDXTAPyRqYodN, int DRzwhbNPpftRRIXXfHzd, 
int ATEikvMQPqBefhJzjzhc, int AuqaQHxmPQSyYRemQvyX, const char* 
vpXxoeEhdEosLSsYXkNG, const char* MIBnYCbKBdUrlfqlHdoo, int outbufIdx) { 
MWTensor* ipTensor = getLayer()->getInputTensor(0); int 
OVOphSOolqRQDDoKPwxy = CpMjJjtGOeWOzwxpAAQP; int 
OiVqrkNdXioJhALWMMvm = CufLFODQDXTAPyRqYodN; if 
((CpMjJjtGOeWOzwxpAAQP != ClEhcJFlvGCgiavziIag) || (CufLFODQDXTAPyRqYodN != 
DRzwhbNPpftRRIXXfHzd)) { float* newInput; int inputH = ipTensor->getHeight() + 
CpMjJjtGOeWOzwxpAAQP + ClEhcJFlvGCgiavziIag; int inputW = 
ipTensor->getWidth() + CufLFODQDXTAPyRqYodN + DRzwhbNPpftRRIXXfHzd; 
CUDA_CALL(cudaMalloc((void**)&newInput, sizeof(float)*ipTensor->getBatchSize() 
* ipTensor->getChannels() * inputH * inputW)); CUDA_CALL(cudaMemset(newInput, 
0, 
sizeof(float)*ipTensor->getBatchSize()*ipTensor->getChannels()*inputH*inputW)); 
URgvgDXnZskIYGdtimcU = new MWTensor(inputH, inputW, ipTensor->getChannels(), 
ipTensor->getBatchSize(), newInput,getLayer(), 0); 
CUDNN_CALL(cudnnCreateTensorDescriptor(&YgcpEBUCwCLaPhyntIio)); 
CUDNN_CALL(cudnnSetTensor4dDescriptor(YgcpEBUCwCLaPhyntIio, CUDNN_TENSOR_NCHW, 
CUDNN_DATA_FLOAT, URgvgDXnZskIYGdtimcU->getBatchSize(), URgvgDXnZskIYGdtimcU->getChannels(), 
URgvgDXnZskIYGdtimcU->getHeight(), URgvgDXnZskIYGdtimcU->getWidth())); 
OVOphSOolqRQDDoKPwxy = 0;  OiVqrkNdXioJhALWMMvm = 0;  } else { 
URgvgDXnZskIYGdtimcU = ipTensor; YgcpEBUCwCLaPhyntIio = 
*getCuDNNDescriptor(URgvgDXnZskIYGdtimcU);  } bUVPfnrJhLfHzOLUUrKk = 
CpMjJjtGOeWOzwxpAAQP; cQBKlCKXxecGPJrXBXdk = CufLFODQDXTAPyRqYodN;  
assert(URgvgDXnZskIYGdtimcU != NULL); MWConvLayer* convLayer = static_cast<MWConvLayer*>(getLayer());
#if (CUDNN_MAJOR <= 5)
 { if ((ATEikvMQPqBefhJzjzhc != 1) && (AuqaQHxmPQSyYRemQvyX != 1)){ 
printf("Dilated Convolution only supported for cuDNN 6 or greater "); throw 
std::runtime_error("Unsupported Dilation Factor"); } 
CUDNN_CALL(cudnnSetConvolution2dDescriptor(ONvcEjLBnVNUdjMKOAwF, 
OVOphSOolqRQDDoKPwxy, OiVqrkNdXioJhALWMMvm, FpguQZSermqZCMRiUfML, 
FrpxvsDMwwgbpqHXWxmN, 1, 1, CUDNN_CROSS_CORRELATION));  }
#else
 { CUDNN_CALL(cudnnSetConvolution2dDescriptor(ONvcEjLBnVNUdjMKOAwF, 
OVOphSOolqRQDDoKPwxy, OiVqrkNdXioJhALWMMvm, FpguQZSermqZCMRiUfML, 
FrpxvsDMwwgbpqHXWxmN, ATEikvMQPqBefhJzjzhc, AuqaQHxmPQSyYRemQvyX, 
CUDNN_CROSS_CORRELATION, CUDNN_DATA_FLOAT)); }
#endif
#if (FP16_ENABLED == 1 && ( CUDNN_MAJOR > 7 || (CUDNN_MAJOR == 7 && CUDNN_MINOR >= 2) ))
 CUDNN_CALL(cudnnSetConvolutionMathType(ONvcEjLBnVNUdjMKOAwF, CUDNN_TENSOR_OP_MATH_ALLOW_CONVERSION));
#endif
 int shEncNmxJsMuJKwbrwok, rxMAtVYGgGtZoKBkJcjc; int numInputFeatures = 
BdqURaHPmdnfzvtUvocl*BuyZFXzwOMxcePIbCLfl; int 
fxxCPKTclxXPxrdMAkwi,sRECVoNNtDdcBOWgDyar,sxuOMwKXOKfuExclRaSe; MWTensor* 
opTensor = convLayer->getOutputTensor(0); fxxCPKTclxXPxrdMAkwi = 
opTensor->getChannels(); sRECVoNNtDdcBOWgDyar = opTensor->getHeight(); 
sxuOMwKXOKfuExclRaSe = opTensor->getWidth();  size_t twppmWSuyDzoZjSbrMHi = 0; if( 
BuyZFXzwOMxcePIbCLfl == 1 ) { 
CUDNN_CALL(cudnnSetFilter4dDescriptor(SDWKEQTZaTFZByPlzUDR, CUDNN_DATA_FLOAT, 
CUDNN_TENSOR_NCHW, fxxCPKTclxXPxrdMAkwi, numInputFeatures, 
AwZQzUhuWVLGrWgLHRuM, AzTsxYcYjIEJsGQbeYHm));  
CUDNN_CALL(cudnnSetTensor4dDescriptor(MEmIeGILUZNEWEagSzRk, CUDNN_TENSOR_NCHW, 
CUDNN_DATA_FLOAT, 1, fxxCPKTclxXPxrdMAkwi, 1, 1)); 
CUDNN_CALL(cudnnGetConvolution2dForwardOutputDim(ONvcEjLBnVNUdjMKOAwF, 
YgcpEBUCwCLaPhyntIio, SDWKEQTZaTFZByPlzUDR, &shEncNmxJsMuJKwbrwok, 
&rxMAtVYGgGtZoKBkJcjc, &sRECVoNNtDdcBOWgDyar, &sxuOMwKXOKfuExclRaSe)); 
CUDNN_CALL(cudnnSetTensor4dDescriptor(*getOutputDescriptor(), 
CUDNN_TENSOR_NCHW, CUDNN_DATA_FLOAT, shEncNmxJsMuJKwbrwok, rxMAtVYGgGtZoKBkJcjc, 
opTensor->getHeight(), opTensor->getWidth())); assert(opTensor->getHeight() == 
sRECVoNNtDdcBOWgDyar); assert(opTensor->getWidth() == sxuOMwKXOKfuExclRaSe);
#if (CUDNN_MAJOR < 7)
 { 
CUDNN_CALL(cudnnGetConvolutionForwardAlgorithm(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), 
YgcpEBUCwCLaPhyntIio, SDWKEQTZaTFZByPlzUDR, ONvcEjLBnVNUdjMKOAwF, 
*getOutputDescriptor(), CUDNN_CONVOLUTION_FWD_PREFER_FASTEST, 0, 
&NtWaRGCHLeTapjWdEHHS)); }
#else
 { cudnnConvolutionFwdAlgoPerf_t perf_results[3]; int returnedAlgoCount; 
CUDNN_CALL(cudnnGetConvolutionForwardAlgorithm_v7(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), 
YgcpEBUCwCLaPhyntIio, SDWKEQTZaTFZByPlzUDR, ONvcEjLBnVNUdjMKOAwF, 
*getOutputDescriptor(), 3, &returnedAlgoCount, perf_results)); 
NtWaRGCHLeTapjWdEHHS = perf_results[0].algo; }
#endif
 
CUDNN_CALL(cudnnGetConvolutionForwardWorkspaceSize(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), 
YgcpEBUCwCLaPhyntIio, SDWKEQTZaTFZByPlzUDR, ONvcEjLBnVNUdjMKOAwF, 
*getOutputDescriptor(), NtWaRGCHLeTapjWdEHHS, &twppmWSuyDzoZjSbrMHi)); } else { 
setIsGrouped(1); MWTensor* ipTensor = URgvgDXnZskIYGdtimcU;  XCLDbxHBtWRStETWIkId = 
ipTensor->getData() + ipTensor->getChannels()/BuyZFXzwOMxcePIbCLfl * 
ipTensor->getHeight() * ipTensor->getWidth(); 
CUDNN_CALL(cudnnCreateTensorDescriptor(&ZCArwzdUdwQuFQUWjnUE)); 
CUDNN_CALL(cudnnSetTensor4dDescriptorEx(ZCArwzdUdwQuFQUWjnUE, 
CUDNN_DATA_FLOAT, ipTensor->getBatchSize(), 
ipTensor->getChannels()/BuyZFXzwOMxcePIbCLfl, ipTensor->getHeight(), 
ipTensor->getWidth(), 
ipTensor->getChannels()*ipTensor->getHeight()*ipTensor->getWidth(), 
ipTensor->getHeight()*ipTensor->getWidth(), ipTensor->getWidth(), 1)); 
CUDNN_CALL(cudnnCreateTensorDescriptor(getGroupDescriptor()));  
CUDNN_CALL(cudnnSetFilter4dDescriptor(SDWKEQTZaTFZByPlzUDR, CUDNN_DATA_FLOAT, 
CUDNN_TENSOR_NCHW, BlRIQPyqJZORKENzSdYf, BdqURaHPmdnfzvtUvocl, 
AwZQzUhuWVLGrWgLHRuM, AzTsxYcYjIEJsGQbeYHm));  
CUDNN_CALL(cudnnGetConvolution2dForwardOutputDim(ONvcEjLBnVNUdjMKOAwF, 
ZCArwzdUdwQuFQUWjnUE, SDWKEQTZaTFZByPlzUDR, &shEncNmxJsMuJKwbrwok, 
&rxMAtVYGgGtZoKBkJcjc, &sRECVoNNtDdcBOWgDyar, &sxuOMwKXOKfuExclRaSe)); 
assert(opTensor->getHeight() == sRECVoNNtDdcBOWgDyar); assert(opTensor->getWidth() 
== sxuOMwKXOKfuExclRaSe); 
CUDNN_CALL(cudnnSetTensor4dDescriptorEx(*getGroupDescriptor(), 
CUDNN_DATA_FLOAT, shEncNmxJsMuJKwbrwok, rxMAtVYGgGtZoKBkJcjc, sRECVoNNtDdcBOWgDyar, 
sxuOMwKXOKfuExclRaSe, 
rxMAtVYGgGtZoKBkJcjc*BuyZFXzwOMxcePIbCLfl*sRECVoNNtDdcBOWgDyar*sxuOMwKXOKfuExclRaSe, 
sRECVoNNtDdcBOWgDyar*sxuOMwKXOKfuExclRaSe, sxuOMwKXOKfuExclRaSe, 1)); 
CUDNN_CALL(cudnnSetTensor4dDescriptor(*getOutputDescriptor(), 
CUDNN_TENSOR_NCHW, CUDNN_DATA_FLOAT, shEncNmxJsMuJKwbrwok, 
rxMAtVYGgGtZoKBkJcjc*BuyZFXzwOMxcePIbCLfl, sRECVoNNtDdcBOWgDyar, sxuOMwKXOKfuExclRaSe)); 
CUDNN_CALL(cudnnSetTensor4dDescriptor(MEmIeGILUZNEWEagSzRk, CUDNN_TENSOR_NCHW, 
CUDNN_DATA_FLOAT, 1, rxMAtVYGgGtZoKBkJcjc*BuyZFXzwOMxcePIbCLfl, 1, 1));
#if (CUDNN_MAJOR < 7) 
 
CUDNN_CALL(cudnnGetConvolutionForwardAlgorithm(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), 
ZCArwzdUdwQuFQUWjnUE, SDWKEQTZaTFZByPlzUDR, ONvcEjLBnVNUdjMKOAwF, 
*getGroupDescriptor(), CUDNN_CONVOLUTION_FWD_PREFER_FASTEST, 0, &NtWaRGCHLeTapjWdEHHS));
#else
 cudnnConvolutionFwdAlgoPerf_t perf_results[3]; int returnedAlgoCount; 
CUDNN_CALL(cudnnGetConvolutionForwardAlgorithm_v7(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), 
ZCArwzdUdwQuFQUWjnUE, SDWKEQTZaTFZByPlzUDR, ONvcEjLBnVNUdjMKOAwF, 
*getGroupDescriptor(), 3, &returnedAlgoCount,perf_results)); 
NtWaRGCHLeTapjWdEHHS = perf_results[0].algo;
#endif
 
CUDNN_CALL(cudnnGetConvolutionForwardWorkspaceSize(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), 
ZCArwzdUdwQuFQUWjnUE, SDWKEQTZaTFZByPlzUDR, ONvcEjLBnVNUdjMKOAwF, 
*getGroupDescriptor(), NtWaRGCHLeTapjWdEHHS, &twppmWSuyDzoZjSbrMHi)); } if( 
twppmWSuyDzoZjSbrMHi > *enPbWLzEmxYCBmzGJutZ->getWorkSpaceSize() ) { 
enPbWLzEmxYCBmzGJutZ->setWorkSpaceSize(twppmWSuyDzoZjSbrMHi); }  
assert(shEncNmxJsMuJKwbrwok == ipTensor->getBatchSize()); 
assert(fxxCPKTclxXPxrdMAkwi == rxMAtVYGgGtZoKBkJcjc * 
BuyZFXzwOMxcePIbCLfl); if (outbufIdx < 0) { 
CUDA_CALL(cudaMalloc((void**)&PtkeOkuClHzhOfpmBevf, sizeof(float) * 
opTensor->getBatchSize() * opTensor->getChannels() * opTensor->getHeight() * 
opTensor->getWidth())); } else { 
setData(enPbWLzEmxYCBmzGJutZ->memBuffer[outbufIdx]); 
getLayer()->getOutputTensor(0)->setopBufIndex(outbufIdx); } 
CUDA_CALL(cudaMalloc((void**)&vIWQzNvYZSuxmOTVDFhU, 
sizeof(float)*BdqURaHPmdnfzvtUvocl*fxxCPKTclxXPxrdMAkwi*AwZQzUhuWVLGrWgLHRuM*AzTsxYcYjIEJsGQbeYHm)); 
CUDA_CALL(cudaMalloc((void**)&KHClOltUSuqFVVErSxVb, sizeof(float)*fxxCPKTclxXPxrdMAkwi));
#ifdef RANDOM
 curandGenerateNormal(SUleyRyvAggTFnSdxLru, vIWQzNvYZSuxmOTVDFhU, 
BdqURaHPmdnfzvtUvocl*fxxCPKTclxXPxrdMAkwi*AwZQzUhuWVLGrWgLHRuM*AzTsxYcYjIEJsGQbeYHm, 
0, 0.1); curandGenerateNormal(SUleyRyvAggTFnSdxLru, KHClOltUSuqFVVErSxVb, 
fxxCPKTclxXPxrdMAkwi, -0.5, 1);
#endif
 if( BuyZFXzwOMxcePIbCLfl == 2 ) { veFyKKHbdqBIvQLYBqfF = vIWQzNvYZSuxmOTVDFhU + 
BlRIQPyqJZORKENzSdYf * BdqURaHPmdnfzvtUvocl * AwZQzUhuWVLGrWgLHRuM * 
AzTsxYcYjIEJsGQbeYHm; setOutput2(getData() + fxxCPKTclxXPxrdMAkwi/ 2 
* sRECVoNNtDdcBOWgDyar * sxuOMwKXOKfuExclRaSe); setIsGrouped(1); } 
loadWeights(vpXxoeEhdEosLSsYXkNG); loadBias(MIBnYCbKBdUrlfqlHdoo); } void 
MWConvLayerImpl::predict() { MWConvLayer* convLayer = 
static_cast<MWConvLayer*>(getLayer()); if (URgvgDXnZskIYGdtimcU != 
convLayer->getInputTensor()) { CUDA_CALL(cudaMemset(URgvgDXnZskIYGdtimcU->getData(), 
0, 
sizeof(float)*URgvgDXnZskIYGdtimcU->getBatchSize()*URgvgDXnZskIYGdtimcU->getChannels()*URgvgDXnZskIYGdtimcU->getHeight()*URgvgDXnZskIYGdtimcU->getWidth())); 
 int fhikqqlnUKCjleVKDqiG = 
convLayer->getInputTensor()->getHeight()*convLayer->getInputTensor()->getWidth()*convLayer->getInputTensor()->getBatchSize()*convLayer->getInputTensor()->getChannels(); 
MWCNNLayerImpl::padInput(convLayer->getInputTensor()->getData(), 
convLayer->getInputTensor()->getHeight(), 
convLayer->getInputTensor()->getWidth(), 
convLayer->getInputTensor()->getChannels(), URgvgDXnZskIYGdtimcU->getHeight(), 
URgvgDXnZskIYGdtimcU->getWidth(), bUVPfnrJhLfHzOLUUrKk, cQBKlCKXxecGPJrXBXdk, 
URgvgDXnZskIYGdtimcU->getData(), fhikqqlnUKCjleVKDqiG); } if(BuyZFXzwOMxcePIbCLfl == 1 
) { assert(getData() != URgvgDXnZskIYGdtimcU->getData()); 
CUDNN_CALL(cudnnConvolutionForward(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(),getOnePtr(), 
YgcpEBUCwCLaPhyntIio, URgvgDXnZskIYGdtimcU->getData(), SDWKEQTZaTFZByPlzUDR, 
vIWQzNvYZSuxmOTVDFhU, ONvcEjLBnVNUdjMKOAwF, NtWaRGCHLeTapjWdEHHS, 
enPbWLzEmxYCBmzGJutZ->getWorkSpace(), *enPbWLzEmxYCBmzGJutZ->getWorkSpaceSize(), 
getZeroPtr(), *getOutputDescriptor(),getData())); 
CUDNN_CALL(cudnnAddTensor(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), getOnePtr(), 
MEmIeGILUZNEWEagSzRk, KHClOltUSuqFVVErSxVb, getOnePtr(), 
*getOutputDescriptor(),getData())); } else { assert(getData() != 
URgvgDXnZskIYGdtimcU->getData()); 
CUDNN_CALL(cudnnConvolutionForward(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), 
getOnePtr(), ZCArwzdUdwQuFQUWjnUE, URgvgDXnZskIYGdtimcU->getData(), 
SDWKEQTZaTFZByPlzUDR, vIWQzNvYZSuxmOTVDFhU, ONvcEjLBnVNUdjMKOAwF, NtWaRGCHLeTapjWdEHHS, 
enPbWLzEmxYCBmzGJutZ->getWorkSpace(), *enPbWLzEmxYCBmzGJutZ->getWorkSpaceSize(), 
getZeroPtr(), *getGroupDescriptor(), getData())); 
CUDNN_CALL(cudnnConvolutionForward(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), 
getOnePtr(), ZCArwzdUdwQuFQUWjnUE, XCLDbxHBtWRStETWIkId, SDWKEQTZaTFZByPlzUDR, 
veFyKKHbdqBIvQLYBqfF, ONvcEjLBnVNUdjMKOAwF, NtWaRGCHLeTapjWdEHHS, 
enPbWLzEmxYCBmzGJutZ->getWorkSpace(), *enPbWLzEmxYCBmzGJutZ->getWorkSpaceSize(), 
getZeroPtr(), *getGroupDescriptor(), getOutput2())); 
CUDNN_CALL(cudnnAddTensor(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), getOnePtr(), 
MEmIeGILUZNEWEagSzRk, KHClOltUSuqFVVErSxVb, getOnePtr(), *getOutputDescriptor(), 
getData())); } } void MWConvLayerImpl::cleanup() { 
CUDNN_CALL(cudnnDestroyConvolutionDescriptor(ONvcEjLBnVNUdjMKOAwF)); 
CUDNN_CALL(cudnnDestroyFilterDescriptor(SDWKEQTZaTFZByPlzUDR)); if 
(vIWQzNvYZSuxmOTVDFhU) { CUDA_FREE_CALL(vIWQzNvYZSuxmOTVDFhU); } 
CUDNN_CALL(cudnnDestroyTensorDescriptor(MEmIeGILUZNEWEagSzRk)); if 
(KHClOltUSuqFVVErSxVb) { CUDA_FREE_CALL(KHClOltUSuqFVVErSxVb); } 
CUDNN_CALL(cudnnDestroyTensorDescriptor(*getOutputDescriptor())); if 
(URgvgDXnZskIYGdtimcU != getLayer()->getInputTensor(0)) { 
CUDNN_CALL(cudnnDestroyTensorDescriptor(YgcpEBUCwCLaPhyntIio)); 
CUDA_FREE_CALL(URgvgDXnZskIYGdtimcU->getData()); } if (getIsGrouped()) { 
CUDNN_CALL(cudnnDestroyTensorDescriptor(ZCArwzdUdwQuFQUWjnUE));  
CUDNN_CALL(cudnnDestroyTensorDescriptor(*getGroupDescriptor())); } for(int idx 
= 0; idx < getLayer()->getNumOutputs(); idx++) {  float* data = 
getLayer()->getOutputTensor(idx)->getData(); if (data) { 
if(getLayer()->getOutputTensor(idx)->getopBufIndex() < 0) CUDA_FREE_CALL(data); 
} } } void MWConvLayerImpl::loadWeights(const char* RVrPByQXdKmunRZHKWJD) { 
MWConvLayer* convLayer = static_cast<MWConvLayer*>(getLayer()); FILE* 
SUjIWYfjMcdzSZaCSVRT = MWCNNLayer::openBinaryFile(RVrPByQXdKmunRZHKWJD); 
assert(SUjIWYfjMcdzSZaCSVRT); assert(BdqURaHPmdnfzvtUvocl == 
URgvgDXnZskIYGdtimcU->getChannels()/BuyZFXzwOMxcePIbCLfl); int eqOmMKQRpqBqRQCnJmxt = 
BdqURaHPmdnfzvtUvocl*convLayer->getOutputTensor()->getChannels()*AwZQzUhuWVLGrWgLHRuM*AzTsxYcYjIEJsGQbeYHm; 
 float* MdSWZSOAjugbWppryHbR = MALLOC_CALL(sizeof(float)*eqOmMKQRpqBqRQCnJmxt); 
call_fread(MdSWZSOAjugbWppryHbR, sizeof(float), eqOmMKQRpqBqRQCnJmxt, SUjIWYfjMcdzSZaCSVRT, 
RVrPByQXdKmunRZHKWJD); if( AwZQzUhuWVLGrWgLHRuM != 1 && 
AzTsxYcYjIEJsGQbeYHm != 1 ) { float* MgAiRWiTutoTMxKXjmHQ = 
MALLOC_CALL(sizeof(float)*AwZQzUhuWVLGrWgLHRuM*AzTsxYcYjIEJsGQbeYHm); 
for(int k=0; k<eqOmMKQRpqBqRQCnJmxt/AwZQzUhuWVLGrWgLHRuM/AzTsxYcYjIEJsGQbeYHm; 
k++) { for(int i=0; i<AwZQzUhuWVLGrWgLHRuM*AzTsxYcYjIEJsGQbeYHm; i++) 
MgAiRWiTutoTMxKXjmHQ[i]=MdSWZSOAjugbWppryHbR[k*AwZQzUhuWVLGrWgLHRuM*AzTsxYcYjIEJsGQbeYHm+i]; 
for(int j=0; j<AwZQzUhuWVLGrWgLHRuM; j++) for(int i=0; 
i<AzTsxYcYjIEJsGQbeYHm; i++) 
MdSWZSOAjugbWppryHbR[k*AwZQzUhuWVLGrWgLHRuM*AzTsxYcYjIEJsGQbeYHm+j*AzTsxYcYjIEJsGQbeYHm+i]=MgAiRWiTutoTMxKXjmHQ[j+i*AwZQzUhuWVLGrWgLHRuM]; 
} free(MgAiRWiTutoTMxKXjmHQ); } CUDA_CALL(cudaMemcpy(vIWQzNvYZSuxmOTVDFhU, 
MdSWZSOAjugbWppryHbR, sizeof(float)*eqOmMKQRpqBqRQCnJmxt, cudaMemcpyHostToDevice));
#if 0
 printf("%s loaded. Size = %d. %f\n", RVrPByQXdKmunRZHKWJD, eqOmMKQRpqBqRQCnJmxt, MdSWZSOAjugbWppryHbR[0]);
#endif
 free(MdSWZSOAjugbWppryHbR); fclose(SUjIWYfjMcdzSZaCSVRT); } void 
MWConvLayerImpl::loadBias(const char* RVrPByQXdKmunRZHKWJD) { MWConvLayer* 
convLayer = static_cast<MWConvLayer*>(getLayer()); FILE* SUjIWYfjMcdzSZaCSVRT = 
MWCNNLayer::openBinaryFile(RVrPByQXdKmunRZHKWJD);  assert(SUjIWYfjMcdzSZaCSVRT); int 
eqOmMKQRpqBqRQCnJmxt = convLayer->getOutputTensor()->getChannels();  float* 
MdSWZSOAjugbWppryHbR = MALLOC_CALL(sizeof(float)*eqOmMKQRpqBqRQCnJmxt); 
call_fread(MdSWZSOAjugbWppryHbR, sizeof(float), eqOmMKQRpqBqRQCnJmxt, SUjIWYfjMcdzSZaCSVRT, 
RVrPByQXdKmunRZHKWJD); CUDA_CALL(cudaMemcpy(KHClOltUSuqFVVErSxVb, MdSWZSOAjugbWppryHbR, 
sizeof(float)*eqOmMKQRpqBqRQCnJmxt, cudaMemcpyHostToDevice)); 
free(MdSWZSOAjugbWppryHbR); fclose(SUjIWYfjMcdzSZaCSVRT); } void 
MWConvLayerImpl::postSetup() { if(enPbWLzEmxYCBmzGJutZ->getAutoTune()) { 
getConvAlgoTuned(); } else if(!enPbWLzEmxYCBmzGJutZ->getWorkSpace()) { 
getConvAlgoNoWorkSpace();  } cudnnTensorDescriptor_t tmpInDesc = getIsGrouped() 
? ZCArwzdUdwQuFQUWjnUE : YgcpEBUCwCLaPhyntIio; cudnnTensorDescriptor_t 
hnewnpwgzKmOdualajhn = getIsGrouped() ? *getGroupDescriptor() : 
*getOutputDescriptor();  size_t twppmWSuyDzoZjSbrMHi; 
CUDNN_CALL(cudnnGetConvolutionForwardWorkspaceSize(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), 
tmpInDesc, SDWKEQTZaTFZByPlzUDR, ONvcEjLBnVNUdjMKOAwF, hnewnpwgzKmOdualajhn, 
NtWaRGCHLeTapjWdEHHS, &twppmWSuyDzoZjSbrMHi)); if( (long int)twppmWSuyDzoZjSbrMHi 
> *enPbWLzEmxYCBmzGJutZ->getPostSetupWorkSpaceSize() ) { 
enPbWLzEmxYCBmzGJutZ->setPostSetupWorkSpaceSize((long int)twppmWSuyDzoZjSbrMHi); 
} } void MWConvLayerImpl::getConvAlgoTuned() { cudnnConvolutionFwdAlgoPerf_t 
perf_results[3]; cudnnTensorDescriptor_t tempInDesc = getIsGrouped() ? 
ZCArwzdUdwQuFQUWjnUE : YgcpEBUCwCLaPhyntIio; cudnnTensorDescriptor_t 
hnewnpwgzKmOdualajhn = getIsGrouped() ? *getGroupDescriptor() : 
*getOutputDescriptor(); int returnedAlgoCount; 
CUDNN_CALL(cudnnFindConvolutionForwardAlgorithmEx(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), 
tempInDesc, URgvgDXnZskIYGdtimcU->getData(), SDWKEQTZaTFZByPlzUDR, vIWQzNvYZSuxmOTVDFhU, 
ONvcEjLBnVNUdjMKOAwF, hnewnpwgzKmOdualajhn, getData(), 3, &returnedAlgoCount, 
&perf_results[0], enPbWLzEmxYCBmzGJutZ->getWorkSpace(), 
*enPbWLzEmxYCBmzGJutZ->getWorkSpaceSize())); NtWaRGCHLeTapjWdEHHS = 
perf_results[0].algo; } void MWConvLayerImpl::getConvAlgoNoWorkSpace() { 
assert(enPbWLzEmxYCBmzGJutZ->getWorkSpace() == 0); cudnnTensorDescriptor_t 
tempInDesc = getIsGrouped() ? ZCArwzdUdwQuFQUWjnUE : YgcpEBUCwCLaPhyntIio; 
cudnnTensorDescriptor_t hnewnpwgzKmOdualajhn = getIsGrouped() ? 
*getGroupDescriptor() : *getOutputDescriptor(); 
CUDNN_CALL(cudnnGetConvolutionForwardAlgorithm(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), 
tempInDesc, SDWKEQTZaTFZByPlzUDR, ONvcEjLBnVNUdjMKOAwF, hnewnpwgzKmOdualajhn, 
CUDNN_CONVOLUTION_FWD_NO_WORKSPACE, 0, &NtWaRGCHLeTapjWdEHHS));  }