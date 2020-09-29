/* Copyright 2017 The MathWorks, Inc. */

#include "MWDepthConcatenationLayer.hpp"
#include "MWDepthConcatenationLayerImpl.hpp"

#include <stdarg.h>
#include <cassert>

MWDepthConcatenationLayer::MWDepthConcatenationLayer()
{
}

MWDepthConcatenationLayer::~MWDepthConcatenationLayer()
{    
}

void MWDepthConcatenationLayer::createDepthConcatenationLayer(MWTargetNetworkImpl* ntwk_impl, int numInputs, ...)
{
    va_list args;
    va_start(args, numInputs);
   
    for(int i = 0; i < numInputs; i++)
    {
        MWTensor* inputTensor = va_arg(args, MWTensor*);
        setInputTensor(inputTensor, i);
    }

    int outbufIdx = va_arg(args, int);

    // check that all input tensors match in size in all dim except channel dim
    unsigned long numChannels = getInputTensor(0)->getChannels();
    for(int k = 1; k < numInputs; k++)
    {
        assert(getInputTensor(0)->getHeight() == getInputTensor(k)->getHeight());
        assert(getInputTensor(0)->getWidth() == getInputTensor(k)->getWidth());      
        assert(getInputTensor(0)->getBatchSize() == getInputTensor(k)->getBatchSize());
        numChannels += (int)getInputTensor(k)->getChannels();
    }
 
    // allocate output
    allocateOutputTensor(getInputTensor(0)->getHeight(),
                         getInputTensor(0)->getWidth(),
                         numChannels,
                         getInputTensor(0)->getBatchSize(),
                         NULL);    
                                                                                                       
    m_impl = new MWDepthConcatenationLayerImpl(this, ntwk_impl, outbufIdx);
    
    MWTensor *opTensor = getOutputTensor();
    opTensor->setData(m_impl->getData());
}
