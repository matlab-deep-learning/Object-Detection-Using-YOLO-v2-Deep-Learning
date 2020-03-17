#include "MWTargetNetworkImpl.hpp"
#include "cnn_api.hpp"
#include "MWCNNLayerImpl.hpp"
#include <cassert>
 void MWTargetNetworkImpl::preSetup(int BufSize,int numBufsToAlloc) { numBufs = 
numBufsToAlloc; for(int i = 0; i < numBufs; i++) { float *memPtr = 0; 
CUDA_CALL(cudaMalloc((void**)&memPtr, sizeof(float)*BufSize)); 
memBuffer.push_back(memPtr); } OumvfgWXDdmsQaciHMHx = new cublasHandle_t; 
cublasCreate(OumvfgWXDdmsQaciHMHx); OwenhowBxTAXHXmJpIKd = new 
cudnnHandle_t; cudnnCreate(OwenhowBxTAXHXmJpIKd); } void 
MWTargetNetworkImpl::postSetup(MWCNNLayer* layers[],int numLayers) { 
createWorkSpace(&wXLECKaOWaQNZlVHfnNP); for (int i = 0; i < numLayers; i++) { 
layers[i]->postSetup();  } if ((ECTnqgWHyHCHCLBZlffd != (long 
int)*getWorkSpaceSize() && ECTnqgWHyHCHCLBZlffd > -1)) { 
setWorkSpaceSize(ECTnqgWHyHCHCLBZlffd); if (wXLECKaOWaQNZlVHfnNP) 
{ cudaFree(wXLECKaOWaQNZlVHfnNP); wXLECKaOWaQNZlVHfnNP = 0; } if 
(*getWorkSpaceSize() > 0){ CUDA_CALL(cudaMalloc((void**)&wXLECKaOWaQNZlVHfnNP, 
*getWorkSpaceSize())); } }  if (!wXLECKaOWaQNZlVHfnNP && (*getWorkSpaceSize() > 
0)) { throw std::runtime_error("Out of memory. Unable to allocate workspace."); 
} } void MWTargetNetworkImpl::createWorkSpace(float** wtNPjzxHKNoJIigzXrEl) 
{ cudaError_t puSFZkRJmyuFPfQRswDK = cudaMalloc((void**)wtNPjzxHKNoJIigzXrEl, 
npGnQZLrEfVTQnEbwqij); if (puSFZkRJmyuFPfQRswDK != cudaSuccess) { 
*wtNPjzxHKNoJIigzXrEl = 0; setWorkSpaceSize(0); } } void 
MWTargetNetworkImpl::setWorkSpaceSize(size_t wss) { npGnQZLrEfVTQnEbwqij 
= wss;  } size_t* MWTargetNetworkImpl::getWorkSpaceSize() { return 
&npGnQZLrEfVTQnEbwqij; } float* MWTargetNetworkImpl::getWorkSpace() { 
return wXLECKaOWaQNZlVHfnNP; } long int* 
MWTargetNetworkImpl::getPostSetupWorkSpaceSize() { return 
&ECTnqgWHyHCHCLBZlffd; } void 
MWTargetNetworkImpl::setPostSetupWorkSpaceSize(long int psWSize) { 
ECTnqgWHyHCHCLBZlffd = psWSize; } cublasHandle_t* 
MWTargetNetworkImpl::getCublasHandle() { return OumvfgWXDdmsQaciHMHx; } 
cudnnHandle_t* MWTargetNetworkImpl::getCudnnHandle() { return 
OwenhowBxTAXHXmJpIKd; } void MWTargetNetworkImpl::setAutoTune(bool 
autotune) { MW_autoTune = autotune; } bool MWTargetNetworkImpl::getAutoTune() 
const { return MW_autoTune; } void MWTargetNetworkImpl::cleanup() { if 
(wXLECKaOWaQNZlVHfnNP) { cudaFree(wXLECKaOWaQNZlVHfnNP); } if 
(OumvfgWXDdmsQaciHMHx) { cublasDestroy(*OumvfgWXDdmsQaciHMHx); } if 
(OwenhowBxTAXHXmJpIKd) { cudnnDestroy(*OwenhowBxTAXHXmJpIKd); } for(int 
i = 0; i < memBuffer.size(); i++) { float *memPtr = memBuffer[i]; if(memPtr) { 
CUDA_FREE_CALL(memPtr); }  } }