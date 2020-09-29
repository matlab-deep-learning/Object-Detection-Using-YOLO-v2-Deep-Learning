/* Copyright 2018 The MathWorks, Inc. */

// Target Agnostic header for Keras' Sigmoid Layer
#include "cnn_api.hpp"

#ifndef SIGMOID_LAYER_HPP
#define SIGMOID_LAYER_HPP

/**
  * Codegen class for Keras Sigmoid Layer
**/
class MWSigmoidLayer : public MWCNNLayer
{
  public:
    MWSigmoidLayer();
    ~MWSigmoidLayer();

    /** Create a new Sigmoid Layer */
    void createSigmoidLayer(MWTargetNetworkImpl*, MWTensor*, int);
};
#endif
