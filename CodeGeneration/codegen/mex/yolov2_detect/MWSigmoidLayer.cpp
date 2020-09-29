/* Copyright 2018 Mathworks, Inc. */

// Target Agnostic implementation for Keras's Sigmoid Layer
#include "MWSigmoidLayer.hpp"
#include "MWSigmoidLayerImpl.hpp"

MWSigmoidLayer::MWSigmoidLayer()
{
}

MWSigmoidLayer::~MWSigmoidLayer()
{
}

void MWSigmoidLayer::createSigmoidLayer(MWTargetNetworkImpl* ntwk_impl,
                              MWTensor* dataInput,
                              int outbufIdx)
{
    setInputTensor(dataInput);
    allocateOutputTensor(getInputTensor()->getHeight(), getInputTensor()->getWidth(), getInputTensor()->getChannels(), getInputTensor()->getBatchSize(), NULL);

    m_impl = new MWSigmoidLayerImpl(this, ntwk_impl, outbufIdx);

    MWTensor *opTensor = getOutputTensor();
    opTensor->setData(m_impl->getData());
}
