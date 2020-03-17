/* Copyright 2017-2018 The MathWorks, Inc. */

#ifndef CNN_API_IMPL
#define CNN_API_IMPL

#include <cudnn.h>
#include <cublas_v2.h>
#include <map>
#include <vector>
class MWTensor;
class MWCNNLayer;
class MWTargetNetworkImpl;

#define CUDA_CALL(status) cuda_call_line_file(status,__LINE__,__FILE__)
#define MALLOC_CALL(msize) malloc_call_line_file(msize,__LINE__,__FILE__)
#define CUDNN_CALL(status) cudnn_call_line_file(status,__LINE__,__FILE__)
#define CUBLAS_CALL(status) cublas_call_line_file(status,__LINE__,__FILE__)
#define CUDA_FREE_CALL(buf) call_cuda_free(buf,__LINE__,__FILE__)

//#define RANDOM
#ifdef RANDOM
#include <curand.h>
#define CURAND_CALL(status) curand_call_line_file(status,__LINE__,__FILE__)
#endif

void cuda_call_line_file(cudaError_t, const int, const char *);
void cudnn_call_line_file(cudnnStatus_t, const int, const char *);
float* malloc_call_line_file(size_t, const int, const char *);
const char* cublasGetErrorString(cublasStatus_t);
void cublas_call_line_file(cublasStatus_t, const int, const char *);
void call_cuda_free(float* mem, const int, const char *);
//void call_malloc(float* mem);

#ifdef RANDOM
void curand_call_line_file(curandStatus_t, const int, const char *);
#endif


class MWCNNLayerImpl
{
public :
    
    MWCNNLayerImpl(MWCNNLayer* layer, MWTargetNetworkImpl* ntwk_impl);
    virtual ~MWCNNLayerImpl();
    virtual void predict() = 0;
    virtual void cleanup() = 0;
    void allocate(){}
    virtual void postSetup() {}
    float* getData() { return PtkeOkuClHzhOfpmBevf; }
    MWCNNLayer* getLayer() { return atVCyzqXZAZxwlkRLBRA; }
    
protected:
    
    MWCNNLayer* atVCyzqXZAZxwlkRLBRA;
    std::map<int, cudnnTensorDescriptor_t*> lHtftnmGBvlSSoGOXVui; // output descriptor
    MWTargetNetworkImpl* enPbWLzEmxYCBmzGJutZ;

    float RAtlBpdedvgxUsgDTsch;
    float QhTesEEIHwhNmHSeYbRR;
    float QhTWatiCfcWYsHdkcyhZ;
    float* PtkeOkuClHzhOfpmBevf;

    float* getZeroPtr();            // Get the pointer to a zero value parameter
    float* getOnePtr();             // Get the pointer to a one value parameter
    float* getNegOnePtr();          // Get the pointer to a negative one value parameter

protected:

    cudnnTensorDescriptor_t* getOutputDescriptor(int index = 0); // Get the cuDNN  descriptor for the output and create tmp if map is empty
    cudnnTensorDescriptor_t* getOutputDescriptorWithErrorCheck(int index = 0); // Get the cuDNN  descriptor for the output and assert if map is empty
    cudnnTensorDescriptor_t* getCuDNNDescriptor(MWTensor* tensor);  // get Descriptor from a tensor
    void setData(float* data) {
        PtkeOkuClHzhOfpmBevf = data;
    }

public:
    static void padInput(float* ,int ,int ,int ,int ,int ,int ,int ,float* ,int );

};

class MWInputLayerImpl  : public MWCNNLayerImpl
{
private:
    int   aPzBTLIjCXEQZUlbxayX;
    float* GFggoMvRWucDMqzlWzCl;

public:
    MWInputLayerImpl(MWCNNLayer* layer,
                     MWTargetNetworkImpl* ntwk_impl,
                     int, int, int, int, int, const char* avg_file_name, int outbufIdx);
    ~MWInputLayerImpl();
    void predict();
    void cleanup();
    
private:
    void createInputLayer(int, int, int, int, int, const char* avg_file_name, int outbufIdx);
    void loadAvg(const char*, int);

private:
    cudnnTensorDescriptor_t       KCudOrFMfgCzUPMcdePX;

};

//ReLULayer
class MWReLULayerImpl: public MWCNNLayerImpl
{
public:
    MWReLULayerImpl(MWCNNLayer* , MWTargetNetworkImpl*, int, int );
    ~MWReLULayerImpl();

    void createReLULayer(int outbufIdx);
    void predict();
    void cleanup();

private:
    cudnnActivationDescriptor_t   nlIRrOJaFuVaywxOqOyb;
    int UdmcwaUkepxfZrpdpcAN;
};

class MWNormLayerImpl: public MWCNNLayerImpl
{
public:
    MWNormLayerImpl(MWCNNLayer*, MWTargetNetworkImpl*, unsigned, double, double, double, int outbufIdx);
    ~MWNormLayerImpl();

    void createNormLayer(unsigned, double, double, double, int);
    void predict();
    void cleanup();


private:
    cudnnLRNDescriptor_t          edQOkUJIZbwzEeIcCLzG;
};

//MaxPooling2DLayer
class MWMaxPoolingLayerImpl: public MWCNNLayerImpl
{
public:
    //Create MaxPooling2DLayer with PoolSize = [ PoolH PoolW ]
    //                                Stride = [ StrideH StrideW ]
    //                               Padding = [ PaddingH_T PaddingH_B PaddingW_L PaddingW_R ]
    MWMaxPoolingLayerImpl(MWCNNLayer *, MWTargetNetworkImpl*, int, int, int, int, int, int, int, int, bool, int, const std::vector<int>& bufIndices);
    ~MWMaxPoolingLayerImpl();

    void predict();
    void cleanup();
    float* getIndexData();
    
private:

    void createMaxPoolingLayer(int, int, int, int, int, int, int, int, int, const std::vector<int>& bufIndices );
    
private:
    
    bool BLjrjqvCcCommiXWQLjs;
    float* WIxRBCJtmETvfxpuRuus;
    float* QwUuNuQNtlPXrIwRNiSZ;
    float* VFKMunbyHoAmpHUSkuUn;
    cudnnPoolingDescriptor_t mbKaFvmHqfBiTISNPGKJ;
    int cCXqPFPPcoHzYMDpnUxQ;
    int dJcdBfQQLhIAYHPxwQeg;
};

//FullyConnectedLayer
class MWFCLayerImpl: public MWCNNLayerImpl
{
private:
    int AwZQzUhuWVLGrWgLHRuM;
    int AzTsxYcYjIEJsGQbeYHm;
    int CDJtexcMbXMWAmnNZsNf;
    float* vIWQzNvYZSuxmOTVDFhU;
    float* KHClOltUSuqFVVErSxVb;

public:
    MWFCLayerImpl(MWCNNLayer*, MWTargetNetworkImpl*, int, const char*, const char*, int);
    ~MWFCLayerImpl();

    void createFCLayer(int, const char*, const char*, int);
    void predict();
    void cleanup();

private:
    
    void loadWeights(int, const char*);
    void loadBias(const char*);

private:
    cudnnTensorDescriptor_t       MEmIeGILUZNEWEagSzRk;
};

//SoftmaxLayer
class MWSoftmaxLayerImpl: public MWCNNLayerImpl
{
public:
    MWSoftmaxLayerImpl(MWCNNLayer* , MWTargetNetworkImpl*, int);
    ~MWSoftmaxLayerImpl();

    void createSoftmaxLayer(int outbufIdx);
    void predict();
    void cleanup();

private:
    cudnnLRNDescriptor_t          edQOkUJIZbwzEeIcCLzG;
};

//AvgPooling2DLayer
class MWAvgPoolingLayerImpl : public MWCNNLayerImpl
{
public:
    MWAvgPoolingLayerImpl(MWCNNLayer*, MWTargetNetworkImpl*, int, int, int, int, int, int, int);
    ~MWAvgPoolingLayerImpl();

    void createAvgPoolingLayer(int, int, int, int, int, int, int);
    void predict();
    void cleanup();

private:
    cudnnPoolingDescriptor_t      mbKaFvmHqfBiTISNPGKJ;
};

class MWOutputLayerImpl : public MWCNNLayerImpl {
public:
    MWOutputLayerImpl(MWCNNLayer*, MWTargetNetworkImpl*, int);
    ~MWOutputLayerImpl();
    void createOutputLayer();
    void predict();
    void cleanup();
};
#endif
