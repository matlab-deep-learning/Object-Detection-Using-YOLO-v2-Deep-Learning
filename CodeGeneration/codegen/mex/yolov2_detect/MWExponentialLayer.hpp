/* Copyright 2018 The MathWorks, Inc. */

#include "cnn_api.hpp"

#ifndef __EXPONENTIAL_LAYER_HPP
#define __EXPONENTIAL_LAYER_HPP

/**
  *  Codegen class for Exponential Layer 
**/
class MWTensor;
class MWExponentialLayer : public MWCNNLayer
{
  public:
    MWExponentialLayer();
    ~MWExponentialLayer();

    void createExponentialLayer(MWTargetNetworkImpl*, MWTensor*, int);
};

#endif
