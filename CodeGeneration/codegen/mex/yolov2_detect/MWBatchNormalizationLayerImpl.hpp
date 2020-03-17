/* Copyright 2017 The MathWorks, Inc. */

						
#ifndef GPUCODER_BATCHNORMALIZATIONIMPL_HPP
#define GPUCODER_BATCHNORMALIZATIONIMPL_HPP

#include "MWBatchNormalizationLayer.hpp"
#include "MWCNNLayerImpl.hpp"
#include "MWTargetNetworkImpl.hpp"
#include "cnn_api.hpp"

/**
 * Codegen class for Batch Normalization Layer
 *
 * This layer performs a simple scale and offset of the input data
 * using previously learned weights together with measured mean and
 * variance over the training data.
 */

class MWBatchNormalizationLayerImpl : public MWCNNLayerImpl
{
  public:
    MWBatchNormalizationLayerImpl(MWCNNLayer *,
                                  MWTargetNetworkImpl *,
                                  double const,
                                  const char*,
                                  const char*,
                                  const char*,
                                  const char*,
                                  int,                                  
                                  int);
    ~MWBatchNormalizationLayerImpl();

    /** Create a new batch normalization layer. */
    void createBatchNormalizationLayer(double const epsilon,
                                       const char*,
                                       const char*,
                                       const char*,
                                       const char*,
                                       int outbufIdx
        );
    void predict();
    void cleanup();
    
  protected:
    // Methods to setup the scale, offset, mean and variance parameters
    void loadScale(const char*);
    void loadOffset(const char*);
    void loadTrainedMean(const char*);
    void loadTrainedVariance(const char*);

  private:
    double REXdEoRjxuQJkqgIDihy;
    cudnnBatchNormMode_t eFaDPmxDdzHlRYSAoMmX;
    cudnnTensorDescriptor_t MRnAxrRZGjgErnCjJcbo;

    // Parameters from training
    float* oJUVMnJggjhEdQLWzIUC;
    float* gsJtSpgIkTNvahoTFqow;
    float* ugnnrhsgTeWucrMPCJUc;
    float* ujSEtllBwMdSJhSkFCia;

    int UdmcwaUkepxfZrpdpcAN;

  private:
    /** Helper to load a parameter from file into GPU memory. */
    void iLoadParamOntoGPU(char const * const RqCYCrGsNvzKYrRMXbsI,
                           int const fYaOQTeunPwVjnhhTECh,
                           float* SugesRlPIbOVzRgNWRnl);
};

#endif
