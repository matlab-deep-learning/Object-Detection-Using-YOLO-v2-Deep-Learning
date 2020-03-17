/* Copyright 2018 The MathWorks, Inc. */

// Target Specific (cudnn) header for Keras' Sigmoid Layer
#ifndef SIGMOID_LAYER_IMPL_HPP
#define SIGMOID_LAYER_IMPL_HPP

#include "MWCNNLayerImpl.hpp"

/** 
  *  Codegen class for Keras Sigmoid Layer
**/
class MWCNNLayer;
class MWTargetNetworkImpl;
class MWSigmoidLayerImpl : public MWCNNLayerImpl
{
  public:
    MWSigmoidLayerImpl(MWCNNLayer*, MWTargetNetworkImpl*, int);
    ~MWSigmoidLayerImpl();

    void createSigmoidLayer(int);
    void predict();
    void cleanup();

  private:
    cudnnActivationDescriptor_t pckLLTEdVPoCZLRwyDnM;
};
#endif
