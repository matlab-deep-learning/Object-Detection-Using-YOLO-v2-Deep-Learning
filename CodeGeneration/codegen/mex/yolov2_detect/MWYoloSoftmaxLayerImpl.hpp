/* Copyright 2018 The MathWorks, Inc. */

#ifndef YOLO_SOFTMAX_LAYER_IMPL_HPP
#define YOLO_SOFTMAX_LAYER_IMPL_HPP

#include "MWCNNLayerImpl.hpp"

/**
 *  Codegen class for Keras Flatten Layer
 **/
class MWCNNLayer;
class MWTargetNetworkImpl;
class MWYoloSoftmaxLayerImpl : public MWCNNLayerImpl {
  public:
    MWYoloSoftmaxLayerImpl(MWCNNLayer*, MWTargetNetworkImpl*, int, int);
    ~MWYoloSoftmaxLayerImpl();

    void createYoloSoftmaxLayer(int);
    void predict();
    void cleanup();

  private:
    cudnnTensorDescriptor_t* tGsvtyAVkrDznETdweDC;
    int eybNKlJCSDUvsznWynwK;
};
#endif
