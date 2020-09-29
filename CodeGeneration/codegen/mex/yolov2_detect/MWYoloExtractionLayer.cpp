/* Copyright 2018 The MathWorks, Inc. */

#include "MWYoloExtractionLayer.hpp"
#include "MWYoloExtractionLayerImpl.hpp"

#include <stdarg.h>
#include <cassert>

MWYoloExtractionLayer::MWYoloExtractionLayer() {
}

MWYoloExtractionLayer::~MWYoloExtractionLayer() {
}

void MWYoloExtractionLayer::createYoloExtractionLayer(MWTargetNetworkImpl* ntwk_impl,
                                                      MWTensor* Input,
                                                      int numAnchors,
                                                      int outbufIdx1,
                                                      int outbufIdx2,
                                                      int outbufIdx3) {

    setInputTensor(Input, 0);

    // Compute grid size
    int outputHeight = getInputTensor(0)->getHeight();
    int outputWidth = getInputTensor(0)->getWidth();
    int BatchSize = getInputTensor()->getBatchSize();
    int numClasses = (getInputTensor(0)->getChannels() / numAnchors) - 5; // x,y,w,h,iou
    int numChannels;

    // assert truth
    assert((BatchSize >= 0) && (numClasses >= 0) && (numAnchors >= 0));

    for (int i = 0; i < 3; i++) {

        // iou, x, y
        if (i == 0) {
            numChannels = numAnchors * 3;
        }

        // w and h
        else if (i == 1) {
            numChannels = numAnchors * 2;
        }

        // classPredictions
        else {
            numChannels = numAnchors * numClasses;
        }

        allocateOutputTensor(outputHeight, outputWidth, numChannels, BatchSize, NULL, i);
    }

    {

        const int numOutputs = 3;
        std::vector<int> bufIndices(numOutputs, -1);

        bufIndices[0] = outbufIdx1;
        bufIndices[1] = outbufIdx2;
        bufIndices[2] = outbufIdx3;

        m_impl = new MWYoloExtractionLayerImpl(this, ntwk_impl, numAnchors, bufIndices);
    }
}
