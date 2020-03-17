/* Copyright 2017 The MathWorks, Inc. */

#include "cnn_api.hpp"

#ifndef GPUCODER_BATCHNORMALIZATION_HPP
#define GPUCODER_BATCHNORMALIZATION_HPP

/**
 * Codegen class for Batch Normalization Layer
 *
 * This layer performs a simple scale and offset of the input data
 * using previously learned weights together with measured mean and
 * variance over the training data.
 */
class MWTargetNetworkImpl;

class MWBatchNormalizationLayer: public MWCNNLayer
{
  public:
    MWBatchNormalizationLayer();
    ~MWBatchNormalizationLayer();

    /** Create a new batch normalization layer. */
    void createBatchNormalizationLayer(MWTargetNetworkImpl*,
                                       MWTensor* previousLayer,
                                       double const epsilon,
                                       const char*,
                                       const char*,
                                       const char*,
                                       const char*,
                                       int inPlace,
                                       int outbufIdx);
};

#endif
