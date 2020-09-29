/* Copyright 2018 The MathWorks, Inc. */

#ifndef _MW_CUDNN_CONV_LAYER_IMPL_
#define _MW_CUDNN_CONV_LAYER_IMPL_

#include "MWCNNLayerImpl.hpp"

/**
 * Codegen class for Convolution layer implementation
 */
class MWConvLayerImpl : public MWCNNLayerImpl
{   
  public:
    
    int AwZQzUhuWVLGrWgLHRuM;          
    int AzTsxYcYjIEJsGQbeYHm;          

    int BuyZFXzwOMxcePIbCLfl;
    int BdqURaHPmdnfzvtUvocl;
    int BlRIQPyqJZORKENzSdYf;

  private:   

    float* yPBlKhIGljihkXaXbYpB;
    float* vIWQzNvYZSuxmOTVDFhU;
    float* KHClOltUSuqFVVErSxVb;
    float* veFyKKHbdqBIvQLYBqfF;

    // for temporary pre-padded input for asymmetric padding
    MWTensor* URgvgDXnZskIYGdtimcU;
    float* XCLDbxHBtWRStETWIkId;
    float  aLsOwwcceEmRSYzllBNs;
    int bUVPfnrJhLfHzOLUUrKk;
    int cQBKlCKXxecGPJrXBXdk;   

  public:
    
    MWConvLayerImpl(MWCNNLayer* layer,
                    MWTargetNetworkImpl* ntwk_impl,
                    int filt_H,
                    int filt_W,
                    int numGrps,
                    int numChannels,
                    int numFilts,
                    int FpguQZSermqZCMRiUfML,
                    int FrpxvsDMwwgbpqHXWxmN,
                    int CpMjJjtGOeWOzwxpAAQP,
                    int ClEhcJFlvGCgiavziIag,
                    int CufLFODQDXTAPyRqYodN,
                    int DRzwhbNPpftRRIXXfHzd,
                    int ATEikvMQPqBefhJzjzhc,
                    int AuqaQHxmPQSyYRemQvyX,
                    const char* vpXxoeEhdEosLSsYXkNG,
                    const char* MIBnYCbKBdUrlfqlHdoo,
                    int outbufIdx);
    
    ~MWConvLayerImpl(){}

    void predict();
    void cleanup();
    virtual void postSetup();

    // setter and getters for pointer to the second half of the output for grouped convolution
    void setOutput2(float*); 
    float* getOutput2();

    // Get the cuDNN descriptor of the output for grouped convolution
    cudnnTensorDescriptor_t* getGroupDescriptor(); 

    float  getIsGrouped();         
    void   setIsGrouped(float);    
    
  private:
    
   void createConvLayer(int,
                         int,
                         int,
                         int,
                         int,
                         int,
                         int,
                         int,
                         const char*,
                         const char*,
                         int outbufIdx);
    void loadWeights(const char*);
    void loadBias(const char*);
    void getConvAlgoTuned();
    void getConvAlgoNoWorkSpace();
		
  private:
    
    cudnnConvolutionDescriptor_t  ONvcEjLBnVNUdjMKOAwF;
    cudnnConvolutionFwdAlgo_t     NtWaRGCHLeTapjWdEHHS;

    cudnnFilterDescriptor_t       SDWKEQTZaTFZByPlzUDR;
    cudnnTensorDescriptor_t       MEmIeGILUZNEWEagSzRk;

    cudnnTensorDescriptor_t       ZCArwzdUdwQuFQUWjnUE;
    cudnnTensorDescriptor_t       THfVbcZJtANcLKxEriuV;

    cudnnTensorDescriptor_t       YgcpEBUCwCLaPhyntIio;

};

#endif
