/* Copyright 2018 The MathWorks, Inc. */

#include "MWExponentialLayer.hpp"
#include "MWExponentialLayerImpl.hpp"

MWExponentialLayer::MWExponentialLayer() {
}

MWExponentialLayer::~MWExponentialLayer() {
}

void MWExponentialLayer::createExponentialLayer(MWTargetNetworkImpl* ntwk_impl,
                                                MWTensor* Input,
                                                int outbufIdx) {

    setInputTensor(Input, 0);

    // Compute height and width of output
    int outH = getInputTensor(0)->getHeight();
    int outW = getInputTensor(0)->getWidth();
    int numOutputFeatures = getInputTensor()->getChannels();
    int BatchSize = getInputTensor()->getBatchSize();
    allocateOutputTensor(outH, outW, numOutputFeatures, BatchSize, NULL, 0);

    m_impl = new MWExponentialLayerImpl(this, ntwk_impl, outbufIdx);
}
