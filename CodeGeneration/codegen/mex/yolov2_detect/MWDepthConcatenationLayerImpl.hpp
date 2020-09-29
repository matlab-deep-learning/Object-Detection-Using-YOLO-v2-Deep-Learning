/* Copyright 2017 The MathWorks, Inc. */

#include "MWCNNLayerImpl.hpp"

#ifndef __DEPTH_CONCAT_LAYER_IMPL_HPP
#define __DEPTH_CONCAT_LAYER_IMPL_HPP

/**
  *  Codegen class for Depth Concat Layer
  *  Concatenates inputs along third dimension (channel dimension)
**/
class MWCNNLayer;
class MWTargetNetworkImpl;
class MWDepthConcatenationLayerImpl : public MWCNNLayerImpl
{
  public:
    MWDepthConcatenationLayerImpl(MWCNNLayer*, MWTargetNetworkImpl*, int);
    ~MWDepthConcatenationLayerImpl();

    void createDepthConcatenationLayer(int);
    virtual void predict();
    virtual void cleanup(); 
};

#endif
