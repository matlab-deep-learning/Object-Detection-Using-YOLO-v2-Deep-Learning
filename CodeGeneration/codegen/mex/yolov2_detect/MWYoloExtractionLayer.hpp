/* Copyright 2018 The MathWorks, Inc. */

#include "cnn_api.hpp"

#ifndef __YOLO_EXTRACTION_LAYER_HPP
#define __YOLO_EXTRACTION_LAYER_HPP

/**
 *  Codegen class for YoloExtractionLayer
 **/
class MWTensor;
class MWYoloExtractionLayer : public MWCNNLayer {
  public:
    MWYoloExtractionLayer();
    ~MWYoloExtractionLayer();

    void createYoloExtractionLayer(MWTargetNetworkImpl*, MWTensor*, int, int, int, int);
};

#endif
