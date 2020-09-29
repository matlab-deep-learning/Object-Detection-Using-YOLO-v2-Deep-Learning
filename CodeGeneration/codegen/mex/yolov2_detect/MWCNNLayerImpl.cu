#include <cstdlib>
#include <cassert>
#include <stdio.h>
#include <stdexcept>
#include "MWCNNLayerImpl.hpp"
#include "MWTargetNetworkImpl.hpp"
#include "cnn_api.hpp"
#ifdef RANDOM
#include <curand.h>
 curandGenerator_t SUleyRyvAggTFnSdxLru; void 
curand_call_line_file(curandStatus_t puSFZkRJmyuFPfQRswDK, const int 
bDTIjtxZiSHtjwzgEluE, const char *RQSttSyDKXCHDWSijmNk) { if (puSFZkRJmyuFPfQRswDK != 
CURAND_STATUS_SUCCESS) { char buffer[100]; int numElem = sprintf(buffer, 
"%d at line: %d, file: %s\n", puSFZkRJmyuFPfQRswDK, bDTIjtxZiSHtjwzgEluE, 
RQSttSyDKXCHDWSijmNk); throw std::runtime_error(buffer); } }
#endif
 float* malloc_call_line_file(size_t msize, const int bDTIjtxZiSHtjwzgEluE, const 
char *RQSttSyDKXCHDWSijmNk) { float * mem = (float*)malloc(msize); if (!mem) { char 
buffer[100]; int numElem = sprintf(buffer, "%s at line: %d, file: %s\n", 
"Memory allocation failed. ", bDTIjtxZiSHtjwzgEluE, RQSttSyDKXCHDWSijmNk); throw 
std::runtime_error(buffer); } return mem; } void call_cuda_free(float* mem, 
const int bDTIjtxZiSHtjwzgEluE, const char *RQSttSyDKXCHDWSijmNk) { if (!mem) { return; } 
cudaError_t puSFZkRJmyuFPfQRswDK = cudaFree(mem); if ((puSFZkRJmyuFPfQRswDK != 
cudaErrorCudartUnloading) && (puSFZkRJmyuFPfQRswDK != cudaSuccess)) { char 
buffer[100]; int numElem = sprintf(buffer, 
"Cuda Error %d(%s) thrown for cuda free call at line: %d, file: %s\n", 
puSFZkRJmyuFPfQRswDK, cudaGetErrorString(puSFZkRJmyuFPfQRswDK), bDTIjtxZiSHtjwzgEluE, 
RQSttSyDKXCHDWSijmNk); throw std::runtime_error(buffer); } } void 
cuda_call_line_file(cudaError_t puSFZkRJmyuFPfQRswDK, const int bDTIjtxZiSHtjwzgEluE, 
const char *RQSttSyDKXCHDWSijmNk) { if (puSFZkRJmyuFPfQRswDK != cudaSuccess) { char 
buffer[100]; int numElem = sprintf(buffer, 
"Cuda Error %d(%s) at line: %d, file: %s\n", puSFZkRJmyuFPfQRswDK, 
cudaGetErrorString(puSFZkRJmyuFPfQRswDK), bDTIjtxZiSHtjwzgEluE, RQSttSyDKXCHDWSijmNk); throw 
std::runtime_error(buffer); } } void cudnn_call_line_file(cudnnStatus_t 
puSFZkRJmyuFPfQRswDK, const int bDTIjtxZiSHtjwzgEluE, const char *RQSttSyDKXCHDWSijmNk) { if 
(puSFZkRJmyuFPfQRswDK != CUDNN_STATUS_SUCCESS) { char buffer[100]; int numElem = 
sprintf(buffer, "CuDNN Error %d(%s) at line: %d, file: %s\n", 
puSFZkRJmyuFPfQRswDK, cudnnGetErrorString(puSFZkRJmyuFPfQRswDK), bDTIjtxZiSHtjwzgEluE, 
RQSttSyDKXCHDWSijmNk); throw std::runtime_error(buffer); } } const char* 
cublasGetErrorString(cublasStatus_t puSFZkRJmyuFPfQRswDK) { 
switch(puSFZkRJmyuFPfQRswDK) { case CUBLAS_STATUS_SUCCESS: return 
"CUBLAS_STATUS_SUCCESS"; case CUBLAS_STATUS_NOT_INITIALIZED: return 
"CUBLAS_STATUS_NOT_INITIALIZED"; case CUBLAS_STATUS_ALLOC_FAILED: return 
"CUBLAS_STATUS_ALLOC_FAILED"; case CUBLAS_STATUS_INVALID_VALUE: return 
"CUBLAS_STATUS_INVALID_VALUE";  case CUBLAS_STATUS_ARCH_MISMATCH: return 
"CUBLAS_STATUS_ARCH_MISMATCH";  case CUBLAS_STATUS_MAPPING_ERROR: return 
"CUBLAS_STATUS_MAPPING_ERROR"; case CUBLAS_STATUS_EXECUTION_FAILED: return 
"CUBLAS_STATUS_EXECUTION_FAILED";  case CUBLAS_STATUS_INTERNAL_ERROR: return 
"CUBLAS_STATUS_INTERNAL_ERROR";  case CUBLAS_STATUS_NOT_SUPPORTED: return 
"CUBLAS_STATUS_NOT_SUPPORTED";  case CUBLAS_STATUS_LICENSE_ERROR: return 
"CUBLAS_STATUS_LICENSE_ERROR";  } return "unknown error"; } void 
cublas_call_line_file(cublasStatus_t puSFZkRJmyuFPfQRswDK, const int 
bDTIjtxZiSHtjwzgEluE, const char *RQSttSyDKXCHDWSijmNk) { if (puSFZkRJmyuFPfQRswDK != 
CUBLAS_STATUS_SUCCESS) { char buffer[100]; int numElem = sprintf(buffer, 
"CuBlas Error %d(%s) at line: %d, file: %s\n", puSFZkRJmyuFPfQRswDK, 
cublasGetErrorString(puSFZkRJmyuFPfQRswDK), bDTIjtxZiSHtjwzgEluE, RQSttSyDKXCHDWSijmNk); 
throw std::runtime_error(buffer); } } 
MWCNNLayerImpl::MWCNNLayerImpl(MWCNNLayer* layer, MWTargetNetworkImpl* 
ntwk_impl) : RAtlBpdedvgxUsgDTsch(0.0), QhTesEEIHwhNmHSeYbRR(1.0), 
QhTWatiCfcWYsHdkcyhZ(-1.0), atVCyzqXZAZxwlkRLBRA(layer), 
enPbWLzEmxYCBmzGJutZ(ntwk_impl), PtkeOkuClHzhOfpmBevf(0)  { } 
MWCNNLayerImpl::~MWCNNLayerImpl() { for(std::map<int, 
cudnnTensorDescriptor_t*>::iterator it = lHtftnmGBvlSSoGOXVui.begin(); it != 
lHtftnmGBvlSSoGOXVui.end(); ++it) { delete it->second; it->second = 0; } } 
float* MWCNNLayerImpl::getZeroPtr() { return &RAtlBpdedvgxUsgDTsch; } float* 
MWCNNLayerImpl::getOnePtr() { return &QhTesEEIHwhNmHSeYbRR; } float* 
MWCNNLayerImpl::getNegOnePtr() { return &QhTWatiCfcWYsHdkcyhZ; } 
cudnnTensorDescriptor_t* MWCNNLayerImpl::getOutputDescriptor(int index) { 
std::map<int, cudnnTensorDescriptor_t*>::iterator it = 
lHtftnmGBvlSSoGOXVui.find(index); if (it == lHtftnmGBvlSSoGOXVui.end()) { 
cudnnTensorDescriptor_t* tmp = new cudnnTensorDescriptor_t;  
lHtftnmGBvlSSoGOXVui[index] = tmp; return tmp; } else { return it->second; } } 
cudnnTensorDescriptor_t* MWCNNLayerImpl::getOutputDescriptorWithErrorCheck(int 
index) { std::map<int, cudnnTensorDescriptor_t*>::iterator it = 
lHtftnmGBvlSSoGOXVui.find(index); assert(it != lHtftnmGBvlSSoGOXVui.end()); 
return it->second; } cudnnTensorDescriptor_t* 
MWCNNLayerImpl::getCuDNNDescriptor(MWTensor* tensor) { MWCNNLayerImpl* impl = 
tensor->getOwner()->getImpl(); if (!impl || 
dynamic_cast<MWPassthroughLayer*>(tensor->getOwner())) { 
assert(dynamic_cast<MWPassthroughLayer*>(tensor->getOwner())); return 
getCuDNNDescriptor(tensor->getOwner()->getInputTensor(0)); } return 
impl->getOutputDescriptorWithErrorCheck(tensor->getSourcePortIndex()); } void 
__global__ __launch_bounds__(1024) padInputImpl(float* in, int inputH, int 
inputW, int inputCh, int outputH, int outputW, int offsetH, int offsetW, float* 
out, int inputElems) { for(int i = blockDim.x * blockIdx.x + threadIdx.x; i < 
inputElems; i+= blockDim.x*gridDim.x) { int idxB = i/(inputH*inputW*inputCh); 
int rem = (i - idxB*(inputH*inputW*inputCh)); int idxCh = rem/(inputH*inputW); 
int rem1 = rem - idxCh*(inputH*inputW); int idxH = rem1/inputW; int idxCol = 
rem1 - idxH*inputW; if ((idxH < inputH) && (idxCol < inputW)) { int outputR = 
idxH + offsetH; int outputCol = idxCol + offsetW; int outputCh = inputCh; *(out 
+ idxB*(outputH*outputW*outputCh) + idxCh*(outputH*outputW) + outputR*(outputW) 
+ outputCol) = *(in + i); } } } void MWCNNLayerImpl::padInput(float* 
URgvgDXnZskIYGdtimcU, int YGiQICncmsGZkNUyiQyg, int YNDVziqpDddiXQKYZZhX, int 
XVcMnvCXvZpKICKIjgZi, int leWFtIPrKkXLixGWBGJW, int lteHjcLsItGbVPMQtGDB, int 
gzSTokDHvkXefhiGDcWL, int hDaNSVZAofAENeIAiWEw, float* kFQQPKSOkZeHlmrkAXuE, int 
fhikqqlnUKCjleVKDqiG) { int tnTPxeDjBsqLAPkJcPJX = (fhikqqlnUKCjleVKDqiG + 
31)/32 * 32; tnTPxeDjBsqLAPkJcPJX = (tnTPxeDjBsqLAPkJcPJX < 1024) ? 
tnTPxeDjBsqLAPkJcPJX : 1024; int MNuwXDSoGEYeABeVTwOh = 
(fhikqqlnUKCjleVKDqiG + tnTPxeDjBsqLAPkJcPJX - 
1)/tnTPxeDjBsqLAPkJcPJX; padInputImpl<<<MNuwXDSoGEYeABeVTwOh, 
tnTPxeDjBsqLAPkJcPJX>>>(URgvgDXnZskIYGdtimcU, YGiQICncmsGZkNUyiQyg, 
YNDVziqpDddiXQKYZZhX, XVcMnvCXvZpKICKIjgZi, leWFtIPrKkXLixGWBGJW, lteHjcLsItGbVPMQtGDB, 
gzSTokDHvkXefhiGDcWL, hDaNSVZAofAENeIAiWEw, kFQQPKSOkZeHlmrkAXuE, fhikqqlnUKCjleVKDqiG); } 
MWInputLayerImpl::MWInputLayerImpl(MWCNNLayer* layer, MWTargetNetworkImpl* 
ntwk_impl, int eVAFqeShtGZAZluKdMvQ, int TaAJDyqFVJXfAfCJhOuU, int vIWQzNvYZSuxmOTVDFhU, int 
NNhshzQGJHLSGjDiVerE, int wMySyzzledUmSLTWhuYH, const char* avg_file_name, int outbufIdx) 
: MWCNNLayerImpl(layer, ntwk_impl) , GFggoMvRWucDMqzlWzCl(0) { 
createInputLayer(eVAFqeShtGZAZluKdMvQ, TaAJDyqFVJXfAfCJhOuU, vIWQzNvYZSuxmOTVDFhU, NNhshzQGJHLSGjDiVerE, 
wMySyzzledUmSLTWhuYH, avg_file_name, outbufIdx); } 
MWInputLayerImpl::~MWInputLayerImpl() { } void 
MWInputLayerImpl::createInputLayer(int eVAFqeShtGZAZluKdMvQ, int TaAJDyqFVJXfAfCJhOuU, int 
vIWQzNvYZSuxmOTVDFhU, int NNhshzQGJHLSGjDiVerE, int wMySyzzledUmSLTWhuYH, const char* 
avg_file_name, int outbufIdx){ if (outbufIdx < 0) { 
CUDA_CALL(cudaMalloc((void**)&PtkeOkuClHzhOfpmBevf, 
sizeof(float)*TaAJDyqFVJXfAfCJhOuU*vIWQzNvYZSuxmOTVDFhU*NNhshzQGJHLSGjDiVerE*eVAFqeShtGZAZluKdMvQ)); } else { 
setData(enPbWLzEmxYCBmzGJutZ->memBuffer[outbufIdx]); 
getLayer()->getOutputTensor(0)->setopBufIndex(outbufIdx); } 
CUDNN_CALL(cudnnCreateTensorDescriptor(getOutputDescriptor())); 
CUDNN_CALL(cudnnCreateTensorDescriptor(&KCudOrFMfgCzUPMcdePX)); 
aPzBTLIjCXEQZUlbxayX = wMySyzzledUmSLTWhuYH; 
enPbWLzEmxYCBmzGJutZ->setWorkSpaceSize(0); 
CUDNN_CALL(cudnnSetTensor4dDescriptor(*getOutputDescriptor(), 
CUDNN_TENSOR_NCHW, CUDNN_DATA_FLOAT, eVAFqeShtGZAZluKdMvQ, NNhshzQGJHLSGjDiVerE, TaAJDyqFVJXfAfCJhOuU, 
vIWQzNvYZSuxmOTVDFhU)); if( aPzBTLIjCXEQZUlbxayX == 1) { 
CUDNN_CALL(cudnnSetTensor4dDescriptor(KCudOrFMfgCzUPMcdePX, CUDNN_TENSOR_NCHW, 
CUDNN_DATA_FLOAT, 1, NNhshzQGJHLSGjDiVerE, TaAJDyqFVJXfAfCJhOuU, vIWQzNvYZSuxmOTVDFhU)); 
CUDA_CALL(cudaMalloc((void**)&GFggoMvRWucDMqzlWzCl, 
sizeof(float)*NNhshzQGJHLSGjDiVerE*TaAJDyqFVJXfAfCJhOuU*vIWQzNvYZSuxmOTVDFhU)); int eqOmMKQRpqBqRQCnJmxt = 
NNhshzQGJHLSGjDiVerE*TaAJDyqFVJXfAfCJhOuU*vIWQzNvYZSuxmOTVDFhU;  loadAvg(avg_file_name, 
eqOmMKQRpqBqRQCnJmxt); } else if (aPzBTLIjCXEQZUlbxayX == 2){ 
CUDA_CALL(cudaMalloc((void**)&GFggoMvRWucDMqzlWzCl, sizeof(float)*NNhshzQGJHLSGjDiVerE)); int 
eqOmMKQRpqBqRQCnJmxt = NNhshzQGJHLSGjDiVerE;  loadAvg(avg_file_name, eqOmMKQRpqBqRQCnJmxt); }
#ifdef RANDOM
 curandGenerateUniform(SUleyRyvAggTFnSdxLru, MW_data, eVAFqeShtGZAZluKdMvQ*NNhshzQGJHLSGjDiVerE*TaAJDyqFVJXfAfCJhOuU*vIWQzNvYZSuxmOTVDFhU);
#endif
 enPbWLzEmxYCBmzGJutZ->setWorkSpaceSize(0); return; } void 
MWInputLayerImpl::loadAvg(const char* RVrPByQXdKmunRZHKWJD, int eqOmMKQRpqBqRQCnJmxt) 
{ FILE* SUjIWYfjMcdzSZaCSVRT = MWCNNLayer::openBinaryFile(RVrPByQXdKmunRZHKWJD); 
assert(SUjIWYfjMcdzSZaCSVRT); float* MdSWZSOAjugbWppryHbR = 
MALLOC_CALL(sizeof(float)*eqOmMKQRpqBqRQCnJmxt); call_fread(MdSWZSOAjugbWppryHbR, 
sizeof(float), eqOmMKQRpqBqRQCnJmxt, SUjIWYfjMcdzSZaCSVRT, RVrPByQXdKmunRZHKWJD); 
CUDA_CALL(cudaMemcpy(GFggoMvRWucDMqzlWzCl, MdSWZSOAjugbWppryHbR, 
sizeof(float)*eqOmMKQRpqBqRQCnJmxt, cudaMemcpyHostToDevice)); 
free(MdSWZSOAjugbWppryHbR); fclose(SUjIWYfjMcdzSZaCSVRT); return; } void __global__ 
__launch_bounds__(1024) subtractMeanPerChannelImpl(float * 
dMxIKDGTITyhdLqIHBLA, float * QMgBqCuvjnbWHWiVPEwn, const int 
fXhhiexIRPLyKXApPmmy, const int fSbUUBgjKRbNXrHrlOLo, const int 
BUOdotSvmFyUWQKMUdra) {  for(int i = blockDim.x * blockIdx.x + threadIdx.x; i < 
BUOdotSvmFyUWQKMUdra; i+= blockDim.x*gridDim.x) {  int idx = static_cast<int>((i % 
fSbUUBgjKRbNXrHrlOLo) / fXhhiexIRPLyKXApPmmy); 
QMgBqCuvjnbWHWiVPEwn[i] -= dMxIKDGTITyhdLqIHBLA[idx]; } } void 
MWInputLayerImpl::predict() { if (!getData()) { char buffer[100]; int numElem = 
sprintf(buffer, "Uninitialized input data"); throw std::runtime_error(buffer); 
} if ( aPzBTLIjCXEQZUlbxayX == 1) 
CUDNN_CALL(cudnnAddTensor(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), 
getNegOnePtr(), KCudOrFMfgCzUPMcdePX, GFggoMvRWucDMqzlWzCl, getOnePtr(), 
*getOutputDescriptor(), getData())); else if( aPzBTLIjCXEQZUlbxayX == 2){ 
MWInputLayer* thisLayer = static_cast<MWInputLayer*>(getLayer()); MWTensor* 
opTensor = thisLayer->getOutputTensor(0); int fSKMHAqIghbYYgyIpNDw = 
opTensor->getHeight()*opTensor->getWidth()* 
opTensor->getChannels()*opTensor->getBatchSize(); int 
fXhhiexIRPLyKXApPmmy = opTensor->getHeight() * opTensor->getWidth(); 
int fSbUUBgjKRbNXrHrlOLo = 
fXhhiexIRPLyKXApPmmy*opTensor->getChannels(); int 
tnTPxeDjBsqLAPkJcPJX = (fSKMHAqIghbYYgyIpNDw < 1024) ? fSKMHAqIghbYYgyIpNDw : 
1024; int MNuwXDSoGEYeABeVTwOh = (fSKMHAqIghbYYgyIpNDw + 
tnTPxeDjBsqLAPkJcPJX - 1)/tnTPxeDjBsqLAPkJcPJX; 
subtractMeanPerChannelImpl<<<MNuwXDSoGEYeABeVTwOh, 
tnTPxeDjBsqLAPkJcPJX>>>( GFggoMvRWucDMqzlWzCl, getData(), 
fXhhiexIRPLyKXApPmmy, fSbUUBgjKRbNXrHrlOLo, fSKMHAqIghbYYgyIpNDw); 
} return; } void MWInputLayerImpl::cleanup() { 
CUDNN_CALL(cudnnDestroyTensorDescriptor(*getOutputDescriptor())); for(int idx = 
0; idx < atVCyzqXZAZxwlkRLBRA->getNumOutputs(); idx++) {  float* data = 
atVCyzqXZAZxwlkRLBRA->getOutputTensor(idx)->getData(); if (data) { 
if(getLayer()->getOutputTensor(idx)->getopBufIndex() < 0) CUDA_FREE_CALL(data); 
} } if ( aPzBTLIjCXEQZUlbxayX == 1) { 
CUDNN_CALL(cudnnDestroyTensorDescriptor(KCudOrFMfgCzUPMcdePX)); if (GFggoMvRWucDMqzlWzCl) 
{ CUDA_FREE_CALL(GFggoMvRWucDMqzlWzCl); } } return; } 
MWReLULayerImpl::MWReLULayerImpl(MWCNNLayer* layer, MWTargetNetworkImpl* 
ntwk_impl, int inPlace, int outbufIdx)  : MWCNNLayerImpl(layer, ntwk_impl) , 
UdmcwaUkepxfZrpdpcAN(inPlace)  { 
CUDNN_CALL(cudnnCreateActivationDescriptor(&nlIRrOJaFuVaywxOqOyb)); 
CUDNN_CALL(cudnnCreateTensorDescriptor(getOutputDescriptor())); 
createReLULayer(outbufIdx); } MWReLULayerImpl::~MWReLULayerImpl() { } void 
MWReLULayerImpl::createReLULayer(int outbufIdx) { MWReLULayer* reluLayer = 
static_cast<MWReLULayer*>(getLayer()); MWTensor* ipTensor = 
reluLayer->getInputTensor(0); MWTensor* opTensor = 
reluLayer->getOutputTensor(0); 
CUDNN_CALL(cudnnSetActivationDescriptor(nlIRrOJaFuVaywxOqOyb, 
CUDNN_ACTIVATION_RELU, CUDNN_NOT_PROPAGATE_NAN, 0));  
CUDNN_CALL(cudnnSetTensor4dDescriptor(*getOutputDescriptor(), 
CUDNN_TENSOR_NCHW, CUDNN_DATA_FLOAT, opTensor->getBatchSize(), 
opTensor->getChannels(), opTensor->getHeight(), opTensor->getWidth())); if 
(outbufIdx < 0) { if(UdmcwaUkepxfZrpdpcAN){ PtkeOkuClHzhOfpmBevf = 
getLayer()->getInputTensor()->getData(); } else{ 
CUDA_CALL(cudaMalloc((void**)&PtkeOkuClHzhOfpmBevf, 
sizeof(float)*opTensor->getHeight()* 
opTensor->getWidth()*opTensor->getChannels()*opTensor->getBatchSize())); } } 
else { setData(enPbWLzEmxYCBmzGJutZ->memBuffer[outbufIdx]); 
reluLayer->getOutputTensor(0)->setopBufIndex(outbufIdx); }  } void 
MWReLULayerImpl::predict() { MWReLULayer* reluLayer = 
static_cast<MWReLULayer*>(getLayer()); cudnnTensorDescriptor_t ipDesc = 
*getCuDNNDescriptor(reluLayer->getInputTensor()); 
CUDNN_CALL(cudnnActivationForward(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), 
nlIRrOJaFuVaywxOqOyb, getOnePtr(), ipDesc, 
reluLayer->getInputTensor()->getData(), getZeroPtr(), *getOutputDescriptor(), 
PtkeOkuClHzhOfpmBevf)); } void MWReLULayerImpl::cleanup() { 
CUDNN_CALL(cudnnDestroyActivationDescriptor(nlIRrOJaFuVaywxOqOyb)); 
CUDNN_CALL(cudnnDestroyTensorDescriptor(*getOutputDescriptor())); MWTensor* op 
= getLayer()->getOutputTensor(0); float* data = op->getData(); if (data) { 
if((op->getopBufIndex() < 0) && !UdmcwaUkepxfZrpdpcAN) CUDA_FREE_CALL(data); } } 
MWNormLayerImpl::MWNormLayerImpl(MWCNNLayer* layer, MWTargetNetworkImpl* 
ntwk_impl, unsigned FwLnexHgxHRquTKmNpoa,  double AFQBkxwYGKLsACiDKwRM,  
double AHqhysOOIgbDpWZoPUFT,  double BRSPqxNffoBYKqpSVHne, int outbufIdx) : 
MWCNNLayerImpl(layer, ntwk_impl)  { 
CUDNN_CALL(cudnnCreateLRNDescriptor(&edQOkUJIZbwzEeIcCLzG)); 
CUDNN_CALL(cudnnCreateTensorDescriptor(getOutputDescriptor())); 
createNormLayer(FwLnexHgxHRquTKmNpoa, AFQBkxwYGKLsACiDKwRM, 
AHqhysOOIgbDpWZoPUFT, BRSPqxNffoBYKqpSVHne, outbufIdx); } 
MWNormLayerImpl::~MWNormLayerImpl() { } void MWNormLayerImpl::createNormLayer( 
unsigned FwLnexHgxHRquTKmNpoa,  double AFQBkxwYGKLsACiDKwRM,  double 
AHqhysOOIgbDpWZoPUFT,  double BRSPqxNffoBYKqpSVHne, int outbufIdx) { MWNormLayer* normLayer 
= static_cast<MWNormLayer*>(getLayer()); MWTensor* ipTensor = 
normLayer->getInputTensor(0); MWTensor* opTensor = 
normLayer->getOutputTensor(0); int numOutputFeatures = opTensor->getChannels(); 
if (outbufIdx < 0) { CUDA_CALL(cudaMalloc((void**)&PtkeOkuClHzhOfpmBevf, 
sizeof(float)*opTensor->getHeight()*opTensor->getWidth()*numOutputFeatures*opTensor->getBatchSize())); 
} else { setData(enPbWLzEmxYCBmzGJutZ->memBuffer[outbufIdx]); 
normLayer->getOutputTensor(0)->setopBufIndex(outbufIdx); } 
CUDNN_CALL(cudnnSetLRNDescriptor(edQOkUJIZbwzEeIcCLzG, 
FwLnexHgxHRquTKmNpoa, AFQBkxwYGKLsACiDKwRM, AHqhysOOIgbDpWZoPUFT, 
BRSPqxNffoBYKqpSVHne)); CUDNN_CALL(cudnnSetTensor4dDescriptor(*getOutputDescriptor(), 
CUDNN_TENSOR_NCHW, CUDNN_DATA_FLOAT, opTensor->getBatchSize(), 
opTensor->getChannels(), opTensor->getHeight(), opTensor->getWidth())); return; 
} void MWNormLayerImpl::predict() { MWNormLayer* normLayer = 
static_cast<MWNormLayer*>(getLayer()); cudnnTensorDescriptor_t ipDesc = 
*getCuDNNDescriptor(normLayer->getInputTensor()); 
CUDNN_CALL(cudnnLRNCrossChannelForward(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), 
edQOkUJIZbwzEeIcCLzG, CUDNN_LRN_CROSS_CHANNEL_DIM1, getOnePtr(), ipDesc, 
normLayer->getInputTensor()->getData(),getZeroPtr(), *getOutputDescriptor(), 
normLayer->getOutputTensor()->getData())); } void MWNormLayerImpl::cleanup() { 
CUDNN_CALL(cudnnDestroyLRNDescriptor(edQOkUJIZbwzEeIcCLzG)); 
CUDNN_CALL(cudnnDestroyTensorDescriptor(*getOutputDescriptor())); for(int idx = 
0; idx < getLayer()->getNumOutputs(); idx++) {  MWTensor* op = 
getLayer()->getOutputTensor(idx); float* data = op->getData(); if (data) { 
if(getLayer()->getOutputTensor(idx)->getopBufIndex() < 0 ) 
CUDA_FREE_CALL(data); } }  } void __global__ MWSetDyForBackPropImpl(float * 
QwUuNuQNtlPXrIwRNiSZ, const int fvTCtkwXgyScJYogJVFU); void __global__ 
doMWMaxPoolingLayerImpl(float * WIxRBCJtmETvfxpuRuus, float * 
VFKMunbyHoAmpHUSkuUn, const int BUOdotSvmFyUWQKMUdra); 
MWMaxPoolingLayerImpl::MWMaxPoolingLayerImpl(MWCNNLayer* layer, 
MWTargetNetworkImpl* ntwk_impl, int DSsxcjIrUgZCKZovyNQf,  int DqxLTLaJwwgQqmrtCDuu,  
int FpguQZSermqZCMRiUfML,  int FrpxvsDMwwgbpqHXWxmN, int CpMjJjtGOeWOzwxpAAQP, int 
ClEhcJFlvGCgiavziIag,  int CufLFODQDXTAPyRqYodN, int DRzwhbNPpftRRIXXfHzd, 
bool GZGFVDrXwFLJleoTDywO, int fylVqSnTjNbHDtlPhzaj, const std::vector<int>& 
MUmglsoWcEiRiAZsclur) : MWCNNLayerImpl(layer, ntwk_impl) , 
BLjrjqvCcCommiXWQLjs(GZGFVDrXwFLJleoTDywO) , WIxRBCJtmETvfxpuRuus(0) 
, QwUuNuQNtlPXrIwRNiSZ(0) , VFKMunbyHoAmpHUSkuUn(0)  {  
CUDNN_CALL(cudnnCreatePoolingDescriptor(&mbKaFvmHqfBiTISNPGKJ)); 
CUDNN_CALL(cudnnCreateTensorDescriptor(getOutputDescriptor())); 
createMaxPoolingLayer(DSsxcjIrUgZCKZovyNQf,DqxLTLaJwwgQqmrtCDuu,FpguQZSermqZCMRiUfML,FrpxvsDMwwgbpqHXWxmN,CpMjJjtGOeWOzwxpAAQP,ClEhcJFlvGCgiavziIag,CufLFODQDXTAPyRqYodN,DRzwhbNPpftRRIXXfHzd, 
fylVqSnTjNbHDtlPhzaj, MUmglsoWcEiRiAZsclur); } 
MWMaxPoolingLayerImpl::~MWMaxPoolingLayerImpl() { } void 
MWMaxPoolingLayerImpl::createMaxPoolingLayer(int DSsxcjIrUgZCKZovyNQf,  int 
DqxLTLaJwwgQqmrtCDuu,  int FpguQZSermqZCMRiUfML, int FrpxvsDMwwgbpqHXWxmN, int 
CpMjJjtGOeWOzwxpAAQP, int ClEhcJFlvGCgiavziIag,  int CufLFODQDXTAPyRqYodN, 
int DRzwhbNPpftRRIXXfHzd, int fylVqSnTjNbHDtlPhzaj, const std::vector<int>& 
MUmglsoWcEiRiAZsclur) { MWMaxPoolingLayer* maxpoolLayer = 
static_cast<MWMaxPoolingLayer*>(getLayer()); MWTensor* ipTensor = 
maxpoolLayer->getInputTensor(0); int muwRQxtWMMXAPxSuMYBw = 
CpMjJjtGOeWOzwxpAAQP; int nDsbARncmIrIaLubvLVZ = 
CufLFODQDXTAPyRqYodN; cudnnTensorDescriptor_t YgcpEBUCwCLaPhyntIio = 
*getCuDNNDescriptor(ipTensor);  
CUDNN_CALL(cudnnSetPooling2dDescriptor(mbKaFvmHqfBiTISNPGKJ, CUDNN_POOLING_MAX, 
CUDNN_NOT_PROPAGATE_NAN, DSsxcjIrUgZCKZovyNQf, DqxLTLaJwwgQqmrtCDuu, 
muwRQxtWMMXAPxSuMYBw, nDsbARncmIrIaLubvLVZ, FpguQZSermqZCMRiUfML, 
FrpxvsDMwwgbpqHXWxmN)); int eVAFqeShtGZAZluKdMvQ, NNhshzQGJHLSGjDiVerE, TaAJDyqFVJXfAfCJhOuU, 
vIWQzNvYZSuxmOTVDFhU; CUDNN_CALL(cudnnGetPooling2dForwardOutputDim(mbKaFvmHqfBiTISNPGKJ, 
YgcpEBUCwCLaPhyntIio, &eVAFqeShtGZAZluKdMvQ ,&NNhshzQGJHLSGjDiVerE, &TaAJDyqFVJXfAfCJhOuU, 
&vIWQzNvYZSuxmOTVDFhU)); TaAJDyqFVJXfAfCJhOuU = getLayer()->getOutputTensor(0)->getHeight(); 
vIWQzNvYZSuxmOTVDFhU = getLayer()->getOutputTensor(0)->getWidth(); 
CUDNN_CALL(cudnnSetTensor4dDescriptor(*getOutputDescriptor(), 
CUDNN_TENSOR_NCHW, CUDNN_DATA_FLOAT, eVAFqeShtGZAZluKdMvQ, NNhshzQGJHLSGjDiVerE, TaAJDyqFVJXfAfCJhOuU, 
vIWQzNvYZSuxmOTVDFhU)); int outbufIdx = MUmglsoWcEiRiAZsclur[0]; if (outbufIdx < 0) { 
CUDA_CALL(cudaMalloc((void**)&PtkeOkuClHzhOfpmBevf, 
sizeof(float)*eVAFqeShtGZAZluKdMvQ*NNhshzQGJHLSGjDiVerE*TaAJDyqFVJXfAfCJhOuU*vIWQzNvYZSuxmOTVDFhU)); } else { 
setData(enPbWLzEmxYCBmzGJutZ->memBuffer[outbufIdx]); 
maxpoolLayer->getOutputTensor(0)->setopBufIndex(outbufIdx); } if 
(BLjrjqvCcCommiXWQLjs){ 
CUDNN_CALL(cudnnCreateTensorDescriptor(getOutputDescriptor(1))); const int 
fSKMHAqIghbYYgyIpNDw = 
(ipTensor->getHeight())*(ipTensor->getWidth())*(ipTensor->getChannels())*(ipTensor->getBatchSize()); 
CUDA_CALL(cudaMalloc((void**)&WIxRBCJtmETvfxpuRuus, 
sizeof(float)*fSKMHAqIghbYYgyIpNDw)); assert(fylVqSnTjNbHDtlPhzaj == 2); int 
bufIndex = MUmglsoWcEiRiAZsclur[1]; if (bufIndex < 0) { 
CUDA_CALL(cudaMalloc((void**)&VFKMunbyHoAmpHUSkuUn, 
sizeof(float)*eVAFqeShtGZAZluKdMvQ*NNhshzQGJHLSGjDiVerE*TaAJDyqFVJXfAfCJhOuU*vIWQzNvYZSuxmOTVDFhU)); } else { 
VFKMunbyHoAmpHUSkuUn = enPbWLzEmxYCBmzGJutZ->memBuffer[bufIndex]; 
maxpoolLayer->getOutputTensor(1)->setopBufIndex(bufIndex); } 
assert((NNhshzQGJHLSGjDiVerE == ipTensor->getChannels()) && (eVAFqeShtGZAZluKdMvQ == 
ipTensor->getBatchSize()));  const int fvTCtkwXgyScJYogJVFU = 
vIWQzNvYZSuxmOTVDFhU*TaAJDyqFVJXfAfCJhOuU*NNhshzQGJHLSGjDiVerE*eVAFqeShtGZAZluKdMvQ; 
CUDA_CALL(cudaMalloc((void**)&QwUuNuQNtlPXrIwRNiSZ, 
sizeof(float)*fvTCtkwXgyScJYogJVFU)); int tnTPxeDjBsqLAPkJcPJX = 
(fvTCtkwXgyScJYogJVFU < 1024) ? fvTCtkwXgyScJYogJVFU : 1024; int 
MNuwXDSoGEYeABeVTwOh = (fvTCtkwXgyScJYogJVFU + tnTPxeDjBsqLAPkJcPJX - 
1)/tnTPxeDjBsqLAPkJcPJX; 
MWSetDyForBackPropImpl<<<MNuwXDSoGEYeABeVTwOh, 
tnTPxeDjBsqLAPkJcPJX>>>( QwUuNuQNtlPXrIwRNiSZ, fvTCtkwXgyScJYogJVFU); } } void 
MWMaxPoolingLayerImpl::predict() { MWMaxPoolingLayer* maxpoolLayer = 
static_cast<MWMaxPoolingLayer*>(getLayer()); cudnnTensorDescriptor_t 
YgcpEBUCwCLaPhyntIio = *getCuDNNDescriptor(maxpoolLayer->getInputTensor()); 
MWTensor* ipTensor = getLayer()->getInputTensor(0); 
CUDNN_CALL(cudnnPoolingForward(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), 
mbKaFvmHqfBiTISNPGKJ, getOnePtr(), YgcpEBUCwCLaPhyntIio, ipTensor->getData(), 
getZeroPtr(), *getOutputDescriptor(), 
maxpoolLayer->getOutputTensor()->getData())); if (BLjrjqvCcCommiXWQLjs) { 
CUDNN_CALL(cudnnPoolingBackward(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), 
mbKaFvmHqfBiTISNPGKJ, getOnePtr(), *getOutputDescriptor(0), 
getLayer()->getOutputTensor(0)->getData(), *getOutputDescriptor(0), 
QwUuNuQNtlPXrIwRNiSZ, YgcpEBUCwCLaPhyntIio, ipTensor->getData(), getZeroPtr(), 
YgcpEBUCwCLaPhyntIio, WIxRBCJtmETvfxpuRuus)); int fSKMHAqIghbYYgyIpNDw = 
ipTensor->getHeight()*(ipTensor->getWidth())*(ipTensor->getChannels())*(ipTensor->getBatchSize()); 
int tnTPxeDjBsqLAPkJcPJX = (fSKMHAqIghbYYgyIpNDw < 1024) ? 
fSKMHAqIghbYYgyIpNDw : 1024; int MNuwXDSoGEYeABeVTwOh = (fSKMHAqIghbYYgyIpNDw + 
tnTPxeDjBsqLAPkJcPJX - 1)/tnTPxeDjBsqLAPkJcPJX; 
doMWMaxPoolingLayerImpl<<<MNuwXDSoGEYeABeVTwOh, 
tnTPxeDjBsqLAPkJcPJX>>>( WIxRBCJtmETvfxpuRuus, 
maxpoolLayer->getOutputTensor(1)->getData(), fSKMHAqIghbYYgyIpNDw); } return; } 
void MWMaxPoolingLayerImpl::cleanup() { 
CUDNN_CALL(cudnnDestroyPoolingDescriptor(mbKaFvmHqfBiTISNPGKJ)); 
CUDNN_CALL(cudnnDestroyTensorDescriptor(*getOutputDescriptor())); if 
(BLjrjqvCcCommiXWQLjs){ 
CUDNN_CALL(cudnnDestroyTensorDescriptor(*getOutputDescriptor(1))); } for(int 
idx = 0; idx < getLayer()->getNumOutputs(); idx++) {  float* data = 
getLayer()->getOutputTensor(idx)->getData(); if (data) { 
if(getLayer()->getOutputTensor(idx)->getopBufIndex() < 0) CUDA_FREE_CALL(data); 
} } if (WIxRBCJtmETvfxpuRuus){ 
CUDA_FREE_CALL(WIxRBCJtmETvfxpuRuus); } if (QwUuNuQNtlPXrIwRNiSZ){ 
CUDA_FREE_CALL(QwUuNuQNtlPXrIwRNiSZ); }  } float* 
MWMaxPoolingLayerImpl::getIndexData()  { return VFKMunbyHoAmpHUSkuUn; } void 
__global__ __launch_bounds__(1024) MWSetDyForBackPropImpl(float * 
QwUuNuQNtlPXrIwRNiSZ, const int fvTCtkwXgyScJYogJVFU) { for(int i = blockDim.x * 
blockIdx.x + threadIdx.x; i < fvTCtkwXgyScJYogJVFU; i+= blockDim.x*gridDim.x) { 
QwUuNuQNtlPXrIwRNiSZ[i] = i+1; } } void __global__ __launch_bounds__(1024) 
doMWMaxPoolingLayerImpl(float * WIxRBCJtmETvfxpuRuus, float * 
VFKMunbyHoAmpHUSkuUn, const int BUOdotSvmFyUWQKMUdra) { for(int i = blockDim.x * 
blockIdx.x + threadIdx.x; i < BUOdotSvmFyUWQKMUdra; i+= blockDim.x*gridDim.x) { if 
(static_cast<int>(WIxRBCJtmETvfxpuRuus[i]) != 0){ 
VFKMunbyHoAmpHUSkuUn[static_cast<int>(WIxRBCJtmETvfxpuRuus[i])-1] = 
i; } } } MWFCLayerImpl::MWFCLayerImpl(MWCNNLayer* layer, MWTargetNetworkImpl* 
ntwk_impl, int CDJtexcMbXMWAmnNZsNf, const char* 
vpXxoeEhdEosLSsYXkNG,  const char* MIBnYCbKBdUrlfqlHdoo, int outbufIdx) : 
MWCNNLayerImpl(layer, ntwk_impl)  { 
CUDNN_CALL(cudnnCreateTensorDescriptor(getOutputDescriptor())); 
CUDNN_CALL(cudnnCreateTensorDescriptor(&MEmIeGILUZNEWEagSzRk)); 
createFCLayer(CDJtexcMbXMWAmnNZsNf, vpXxoeEhdEosLSsYXkNG, 
MIBnYCbKBdUrlfqlHdoo, outbufIdx); } MWFCLayerImpl::~MWFCLayerImpl() { } void 
MWFCLayerImpl::createFCLayer( int CDJtexcMbXMWAmnNZsNf, const char* 
vpXxoeEhdEosLSsYXkNG, const char* MIBnYCbKBdUrlfqlHdoo, int outbufIdx) { 
MWFCLayer* fcLayer = static_cast<MWFCLayer*>(getLayer()); MWTensor* opTensor = 
fcLayer->getOutputTensor(0); if (outbufIdx < 0) { 
CUDA_CALL(cudaMalloc((void**)&PtkeOkuClHzhOfpmBevf, 
sizeof(float)*fcLayer->getOutputTensor()->getBatchSize()*fcLayer->getOutputTensor()->getChannels())); 
} else { setData(enPbWLzEmxYCBmzGJutZ->memBuffer[outbufIdx]); 
fcLayer->getOutputTensor(0)->setopBufIndex(outbufIdx); } 
CUDA_CALL(cudaMalloc((void**)&vIWQzNvYZSuxmOTVDFhU, 
sizeof(float)*CDJtexcMbXMWAmnNZsNf* 
fcLayer->getOutputTensor()->getChannels())); 
CUDNN_CALL(cudnnSetTensor4dDescriptor(*getOutputDescriptor(), 
CUDNN_TENSOR_NCHW, CUDNN_DATA_FLOAT, 
fcLayer->getOutputTensor()->getBatchSize(),fcLayer->getOutputTensor()->getChannels(), 
1, 1)); CUDNN_CALL(cudnnSetTensor4dDescriptor(MEmIeGILUZNEWEagSzRk, 
CUDNN_TENSOR_NCHW, CUDNN_DATA_FLOAT, 1, 
fcLayer->getOutputTensor()->getChannels(), 1, 1)); 
CUDA_CALL(cudaMalloc((void**)&KHClOltUSuqFVVErSxVb, sizeof(float)*fcLayer->getOutputTensor()->getChannels()));
#ifdef RANDOM
 curandGenerateNormal(SUleyRyvAggTFnSdxLru, vIWQzNvYZSuxmOTVDFhU, 
fcLayer->getInputTensor()->getChannels()*fcLayer->getInputTensor()->getWidth()*fcLayer->getInputTensor()->getHeight()*fcLayer->getOutputTensor()->getChannels(), 
0, 0.1); curandGenerateNormal(SUleyRyvAggTFnSdxLru, KHClOltUSuqFVVErSxVb, 
fcLayer->getOutputTensor()->getChannels(), -0.5, 1);
#endif
 int eqOmMKQRpqBqRQCnJmxt = CDJtexcMbXMWAmnNZsNf*opTensor->getChannels();  
loadWeights(eqOmMKQRpqBqRQCnJmxt, vpXxoeEhdEosLSsYXkNG); 
loadBias(MIBnYCbKBdUrlfqlHdoo); return; } void MWFCLayerImpl::loadWeights(int 
eqOmMKQRpqBqRQCnJmxt, const char* RVrPByQXdKmunRZHKWJD) {  MWFCLayer* fcLayer = 
static_cast<MWFCLayer*>(getLayer()); MWTensor* ipTensor = 
fcLayer->getInputTensor(0); FILE* SUjIWYfjMcdzSZaCSVRT = 
MWCNNLayer::openBinaryFile(RVrPByQXdKmunRZHKWJD); assert(SUjIWYfjMcdzSZaCSVRT); float* 
MdSWZSOAjugbWppryHbR = MALLOC_CALL(sizeof(float)*eqOmMKQRpqBqRQCnJmxt); 
call_fread(MdSWZSOAjugbWppryHbR, sizeof(float), eqOmMKQRpqBqRQCnJmxt, SUjIWYfjMcdzSZaCSVRT, 
RVrPByQXdKmunRZHKWJD); if( ipTensor->getHeight() != 1 && ipTensor->getWidth() != 
1 ) { float* MgAiRWiTutoTMxKXjmHQ = 
MALLOC_CALL(sizeof(float)*ipTensor->getHeight()*ipTensor->getWidth()); for(int 
k=0; k<eqOmMKQRpqBqRQCnJmxt/ipTensor->getHeight()/ipTensor->getWidth(); k++) { 
for(int i=0; i<ipTensor->getHeight()*ipTensor->getWidth(); i++) 
MgAiRWiTutoTMxKXjmHQ[i]=MdSWZSOAjugbWppryHbR[k*ipTensor->getHeight()*ipTensor->getWidth()+i]; 
for(int j=0; j<ipTensor->getHeight(); j++) for(int i=0; i<ipTensor->getWidth(); 
i++) 
MdSWZSOAjugbWppryHbR[k*ipTensor->getHeight()*ipTensor->getWidth()+j*ipTensor->getWidth()+i]=MgAiRWiTutoTMxKXjmHQ[j+i*ipTensor->getHeight()]; 
} free(MgAiRWiTutoTMxKXjmHQ); } CUDA_CALL(cudaMemcpy(vIWQzNvYZSuxmOTVDFhU, 
MdSWZSOAjugbWppryHbR, sizeof(float)*eqOmMKQRpqBqRQCnJmxt, cudaMemcpyHostToDevice));
#if 0
 printf("%s loaded. Size = %d. %f\n", RVrPByQXdKmunRZHKWJD, eqOmMKQRpqBqRQCnJmxt, MdSWZSOAjugbWppryHbR[0]);
#endif
 free(MdSWZSOAjugbWppryHbR); fclose(SUjIWYfjMcdzSZaCSVRT); return; } void 
MWFCLayerImpl::loadBias(const char* RVrPByQXdKmunRZHKWJD) { MWFCLayer* fcLayer = 
static_cast<MWFCLayer*>(getLayer()); MWTensor* opTensor = 
fcLayer->getOutputTensor(0); FILE* SUjIWYfjMcdzSZaCSVRT = 
MWCNNLayer::openBinaryFile(RVrPByQXdKmunRZHKWJD); assert(SUjIWYfjMcdzSZaCSVRT); int 
eqOmMKQRpqBqRQCnJmxt = opTensor->getChannels();  float* MdSWZSOAjugbWppryHbR = 
MALLOC_CALL(sizeof(float)*eqOmMKQRpqBqRQCnJmxt); call_fread(MdSWZSOAjugbWppryHbR, 
sizeof(float), eqOmMKQRpqBqRQCnJmxt, SUjIWYfjMcdzSZaCSVRT, RVrPByQXdKmunRZHKWJD); 
CUDA_CALL(cudaMemcpy(KHClOltUSuqFVVErSxVb, MdSWZSOAjugbWppryHbR, 
sizeof(float)*eqOmMKQRpqBqRQCnJmxt, cudaMemcpyHostToDevice)); 
free(MdSWZSOAjugbWppryHbR); fclose(SUjIWYfjMcdzSZaCSVRT); return; } void 
MWFCLayerImpl::predict() { MWFCLayer* fcLayer = 
static_cast<MWFCLayer*>(getLayer()); MWTensor* ipTensor = 
fcLayer->getInputTensor(0); MWTensor* opTensor = fcLayer->getOutputTensor(0); 
int CDJtexcMbXMWAmnNZsNf = 
ipTensor->getChannels()*ipTensor->getHeight()*ipTensor->getWidth(); int 
CGbFsczkgkhjcHoCKzBx = opTensor->getChannels(); int UzaGmBLFEwmwaFXebUma=1; 
int VCbcPxtPsBLTrHYdEvqn=1; if( opTensor->getBatchSize()==1 ) { 
CUDA_CALL(cudaMemcpy(getData(), KHClOltUSuqFVVErSxVb, 
sizeof(float)*CGbFsczkgkhjcHoCKzBx, cudaMemcpyDeviceToDevice)); 
CUBLAS_CALL(cublasSgemv(*enPbWLzEmxYCBmzGJutZ->getCublasHandle(), CUBLAS_OP_T, 
CDJtexcMbXMWAmnNZsNf, CGbFsczkgkhjcHoCKzBx, getOnePtr(), 
vIWQzNvYZSuxmOTVDFhU, CDJtexcMbXMWAmnNZsNf, ipTensor->getData(), 
UzaGmBLFEwmwaFXebUma, getOnePtr(),getData(), VCbcPxtPsBLTrHYdEvqn)); } else { 
CUBLAS_CALL(cublasSgemm(*enPbWLzEmxYCBmzGJutZ->getCublasHandle(), CUBLAS_OP_T, 
CUBLAS_OP_N, CGbFsczkgkhjcHoCKzBx, opTensor->getBatchSize(), 
CDJtexcMbXMWAmnNZsNf, getOnePtr(), vIWQzNvYZSuxmOTVDFhU, 
CDJtexcMbXMWAmnNZsNf, ipTensor->getData(), CDJtexcMbXMWAmnNZsNf, 
getZeroPtr(),getData(), CGbFsczkgkhjcHoCKzBx)); 
CUDNN_CALL(cudnnAddTensor(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), getOnePtr(), 
MEmIeGILUZNEWEagSzRk, KHClOltUSuqFVVErSxVb, getOnePtr(), 
*getOutputDescriptor(),getData())); } return; } void MWFCLayerImpl::cleanup() { 
if (vIWQzNvYZSuxmOTVDFhU) { CUDA_FREE_CALL(vIWQzNvYZSuxmOTVDFhU); }  
CUDNN_CALL(cudnnDestroyTensorDescriptor(MEmIeGILUZNEWEagSzRk)); if 
(KHClOltUSuqFVVErSxVb) { CUDA_FREE_CALL(KHClOltUSuqFVVErSxVb); } 
CUDNN_CALL(cudnnDestroyTensorDescriptor(*getOutputDescriptor())); for(int idx = 
0; idx < getLayer()->getNumOutputs(); idx++) {  float* data = 
getLayer()->getOutputTensor(idx)->getData(); if (data) { 
if(getLayer()->getOutputTensor(idx)->getopBufIndex() < 0) CUDA_FREE_CALL(data); 
} } } MWSoftmaxLayerImpl::MWSoftmaxLayerImpl(MWCNNLayer* layer, 
MWTargetNetworkImpl* ntwk_impl, int outbufIdx) : MWCNNLayerImpl(layer, 
ntwk_impl)  {  CUDNN_CALL(cudnnCreateTensorDescriptor(getOutputDescriptor())); 
createSoftmaxLayer(outbufIdx); } MWSoftmaxLayerImpl::~MWSoftmaxLayerImpl() { } 
void MWSoftmaxLayerImpl::createSoftmaxLayer(int outbufIdx) { MWSoftmaxLayer* 
sfmxLayer = static_cast<MWSoftmaxLayer*>(getLayer()); MWTensor* ipTensor = 
sfmxLayer->getInputTensor(0); MWTensor* opTensor = 
sfmxLayer->getOutputTensor(0); int numOutputFeatures = ipTensor->getChannels(); 
if (outbufIdx < 0) { CUDA_CALL(cudaMalloc((void**)&PtkeOkuClHzhOfpmBevf, 
sizeof(float)*ipTensor->getHeight()*ipTensor->getWidth()*numOutputFeatures*ipTensor->getBatchSize())); 
} else { setData(enPbWLzEmxYCBmzGJutZ->memBuffer[outbufIdx]); 
opTensor->setopBufIndex(outbufIdx); } 
CUDNN_CALL(cudnnSetTensor4dDescriptor(*getOutputDescriptor(), 
CUDNN_TENSOR_NCHW, CUDNN_DATA_FLOAT, opTensor->getBatchSize(), 
opTensor->getChannels(), opTensor->getHeight(), opTensor->getWidth()));  
return; } void MWSoftmaxLayerImpl::predict() { MWSoftmaxLayer* sfmxLayer = 
static_cast<MWSoftmaxLayer*>(getLayer()); MWTensor* ipTensor = 
sfmxLayer->getInputTensor(0); MWTensor* opTensor = 
sfmxLayer->getOutputTensor(0); cudnnTensorDescriptor_t ipDesc = 
*getCuDNNDescriptor(ipTensor);  
CUDNN_CALL(cudnnSoftmaxForward(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), 
CUDNN_SOFTMAX_ACCURATE, CUDNN_SOFTMAX_MODE_CHANNEL, getOnePtr(), ipDesc, 
ipTensor->getData(), getZeroPtr(), *getOutputDescriptor(), getData())); } void 
MWSoftmaxLayerImpl::cleanup() { 
CUDNN_CALL(cudnnDestroyTensorDescriptor(*getOutputDescriptor())); for(int idx = 
0; idx < getLayer()->getNumOutputs(); idx++) {  float* data = 
getLayer()->getOutputTensor(idx)->getData(); if (data) { 
if(getLayer()->getOutputTensor(idx)->getopBufIndex() < 0) CUDA_FREE_CALL(data); 
} } } MWAvgPoolingLayerImpl::MWAvgPoolingLayerImpl(MWCNNLayer* layer, 
MWTargetNetworkImpl* ntwk_impl, int DSsxcjIrUgZCKZovyNQf,  int DqxLTLaJwwgQqmrtCDuu,  
int FpguQZSermqZCMRiUfML,  int FrpxvsDMwwgbpqHXWxmN,  int CZNYmBcNFSZWvaCklqeM,  int 
CqtPRJvHlGJFssiPzsOm, int outbufIdx) : MWCNNLayerImpl(layer, ntwk_impl)  { 
CUDNN_CALL(cudnnCreatePoolingDescriptor(&mbKaFvmHqfBiTISNPGKJ)); 
CUDNN_CALL(cudnnCreateTensorDescriptor(getOutputDescriptor())); 
createAvgPoolingLayer(DSsxcjIrUgZCKZovyNQf, DqxLTLaJwwgQqmrtCDuu, FpguQZSermqZCMRiUfML, 
FrpxvsDMwwgbpqHXWxmN, CZNYmBcNFSZWvaCklqeM, CqtPRJvHlGJFssiPzsOm, outbufIdx); } 
MWAvgPoolingLayerImpl::~MWAvgPoolingLayerImpl() { } void 
MWAvgPoolingLayerImpl::createAvgPoolingLayer(int DSsxcjIrUgZCKZovyNQf, int 
DqxLTLaJwwgQqmrtCDuu, int FpguQZSermqZCMRiUfML, int FrpxvsDMwwgbpqHXWxmN, int 
CZNYmBcNFSZWvaCklqeM, int CqtPRJvHlGJFssiPzsOm, int outbufIdx) { 
MWAvgPoolingLayer* avgpoolLayer = static_cast<MWAvgPoolingLayer*>(getLayer()); 
MWTensor* ipTensor = avgpoolLayer->getInputTensor(0); 
CUDNN_CALL(cudnnSetPooling2dDescriptor(mbKaFvmHqfBiTISNPGKJ, 
CUDNN_POOLING_AVERAGE_COUNT_INCLUDE_PADDING, CUDNN_NOT_PROPAGATE_NAN, 
DSsxcjIrUgZCKZovyNQf, DqxLTLaJwwgQqmrtCDuu, CZNYmBcNFSZWvaCklqeM, CqtPRJvHlGJFssiPzsOm, 
FpguQZSermqZCMRiUfML, FrpxvsDMwwgbpqHXWxmN)); int eVAFqeShtGZAZluKdMvQ, NNhshzQGJHLSGjDiVerE, 
TaAJDyqFVJXfAfCJhOuU, vIWQzNvYZSuxmOTVDFhU;  cudnnTensorDescriptor_t YgcpEBUCwCLaPhyntIio = 
*getCuDNNDescriptor(ipTensor); 
CUDNN_CALL(cudnnGetPooling2dForwardOutputDim(mbKaFvmHqfBiTISNPGKJ, 
YgcpEBUCwCLaPhyntIio, &eVAFqeShtGZAZluKdMvQ ,&NNhshzQGJHLSGjDiVerE, &TaAJDyqFVJXfAfCJhOuU, 
&vIWQzNvYZSuxmOTVDFhU)); CUDNN_CALL(cudnnSetTensor4dDescriptor(*getOutputDescriptor(), 
CUDNN_TENSOR_NCHW, CUDNN_DATA_FLOAT, eVAFqeShtGZAZluKdMvQ, NNhshzQGJHLSGjDiVerE, TaAJDyqFVJXfAfCJhOuU, 
vIWQzNvYZSuxmOTVDFhU)); if (outbufIdx < 0) { 
CUDA_CALL(cudaMalloc((void**)&PtkeOkuClHzhOfpmBevf, 
sizeof(float)*eVAFqeShtGZAZluKdMvQ*NNhshzQGJHLSGjDiVerE*TaAJDyqFVJXfAfCJhOuU*vIWQzNvYZSuxmOTVDFhU)); } else { 
setData(enPbWLzEmxYCBmzGJutZ->memBuffer[outbufIdx]); 
avgpoolLayer->getOutputTensor(0)->setopBufIndex(outbufIdx); } } void 
MWAvgPoolingLayerImpl::predict() { MWAvgPoolingLayer* avgpoolLayer = 
static_cast<MWAvgPoolingLayer*>(getLayer()); MWTensor* ipTensor = 
avgpoolLayer->getInputTensor(0); MWTensor* opTensor = 
avgpoolLayer->getOutputTensor(0); cudnnTensorDescriptor_t YgcpEBUCwCLaPhyntIio = 
*getCuDNNDescriptor(ipTensor); 
CUDNN_CALL(cudnnPoolingForward(*enPbWLzEmxYCBmzGJutZ->getCudnnHandle(), 
mbKaFvmHqfBiTISNPGKJ, getOnePtr(), YgcpEBUCwCLaPhyntIio, ipTensor->getData(), 
getZeroPtr(), *getOutputDescriptor(),opTensor->getData())); } void 
MWAvgPoolingLayerImpl::cleanup() { 
CUDNN_CALL(cudnnDestroyPoolingDescriptor(mbKaFvmHqfBiTISNPGKJ)); 
CUDNN_CALL(cudnnDestroyTensorDescriptor(*getOutputDescriptor())); for(int idx = 
0; idx < getLayer()->getNumOutputs(); idx++) {  float* data = 
getLayer()->getOutputTensor(idx)->getData(); if (data) { 
if(getLayer()->getOutputTensor(idx)->getopBufIndex() < 0) CUDA_FREE_CALL(data); 
} } } MWOutputLayerImpl::MWOutputLayerImpl(MWCNNLayer* layer, 
MWTargetNetworkImpl* ntwk_impl, int ) : MWCNNLayerImpl(layer, ntwk_impl) { 
createOutputLayer(); } MWOutputLayerImpl::~MWOutputLayerImpl() { } void 
MWOutputLayerImpl::createOutputLayer() { MWOutputLayer* opLayer = 
static_cast<MWOutputLayer*>(getLayer()); MWTensor* ipTensor = 
opLayer->getInputTensor(0); setData(ipTensor->getData()); return; } void 
MWOutputLayerImpl::predict() { } void MWOutputLayerImpl::cleanup() { }