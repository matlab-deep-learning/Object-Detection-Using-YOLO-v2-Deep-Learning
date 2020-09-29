/* Copyright 2018 The MathWorks, Inc. */

#include "cnn_api.hpp"

#ifndef _MW_CONV_LAYER_
#define _MW_CONV_LAYER_

#include "cnn_api.hpp"

/**
 * Codegen class for Convolution layer
 */
class MWTargetNetworkImpl;

class MWConvLayer: public MWCNNLayer
{
  public :
    
    MWConvLayer(){}
    ~MWConvLayer(){}
    virtual void postSetup();
    void createConvLayer(MWTargetNetworkImpl* ntwk_impl,
                         MWTensor*,
                         int,
                         int,
                         int,
                         int,
                         int,
                         int,
                         int,
                         int,
                         int,
                         int,
                         int,
                         int,
                         int,
                         const char*,
                         const char*,
                         int);
};

#endif
