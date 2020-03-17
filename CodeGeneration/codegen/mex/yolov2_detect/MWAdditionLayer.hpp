/* Copyright 2017 The MathWorks, Inc. */

#include "cnn_api.hpp"

#ifndef __ADDITION_LAYER_HPP
#define __ADDITION_LAYER_HPP

/**
  *  Codegen class for AdditionLayer
  *  ElementWise Addition layer
**/
class MWAdditionLayer : public MWCNNLayer
{
  public:
    MWAdditionLayer();
    ~MWAdditionLayer();

    void createAdditionLayer(MWTargetNetworkImpl* , int numInputs, ...);
};

#endif
