/* Copyright 2018 The MathWorks, Inc. */

#include "cnn_api.hpp"

#ifndef __YOLO_SOFTMAX_LAYER_HPP
#define __YOLO_SOFTMAX_LAYER_HPP

/**
 *  Codegen class for YoloSoftmaxLayer
 **/
class MWTensor;
class MWYoloSoftmaxLayer : public MWCNNLayer {
  public:
    MWYoloSoftmaxLayer();
    ~MWYoloSoftmaxLayer();

    void createYoloSoftmaxLayer(MWTargetNetworkImpl*, MWTensor*, int, int);
};

#endif
