/* Copyright 2017 The MathWorks, Inc. */

#include "cnn_api.hpp"

#ifndef __DEPTH_CONCATENTION_LAYER_HPP
#define __DEPTH_CONCATENTION_LAYER_HPP

/**
 *  Codegen class for Depth Concatenation Layer
 *  Depth Concatenation layer
 **/
class MWTargetNetworkImpl;
class MWDepthConcatenationLayer : public MWCNNLayer
{
  public:
    MWDepthConcatenationLayer();
    ~MWDepthConcatenationLayer();

    void createDepthConcatenationLayer(MWTargetNetworkImpl* , int numInputs, ...); 
};

#endif
