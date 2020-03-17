/* Copyright 2018 The MathWorks, Inc. */

#include "MWYoloSoftmaxLayer.hpp"
#include "MWYoloSoftmaxLayerImpl.hpp"

#include <cassert>

MWYoloSoftmaxLayer::MWYoloSoftmaxLayer() {
}

MWYoloSoftmaxLayer::~MWYoloSoftmaxLayer() {
}

void MWYoloSoftmaxLayer::createYoloSoftmaxLayer(MWTargetNetworkImpl* ntwk_impl,
                                                MWTensor* Input,
                                                int numAnchors,
                                                int outbufIdx) {

    setInputTensor(Input, 0);

    int outputHeight = getInputTensor(0)->getHeight();
    int outputWidth = getInputTensor(0)->getWidth();
    int BatchSize = getInputTensor()->getBatchSize();
    int numChannels = getInputTensor(0)->getChannels();

    // assert truth
    assert((BatchSize >= 0) && (numChannels >= 0) && (numAnchors >= 0));

    allocateOutputTensor(outputHeight, outputWidth, numChannels, BatchSize, NULL, 0);

    m_impl = new MWYoloSoftmaxLayerImpl(this, ntwk_impl, numAnchors, outbufIdx);
}
