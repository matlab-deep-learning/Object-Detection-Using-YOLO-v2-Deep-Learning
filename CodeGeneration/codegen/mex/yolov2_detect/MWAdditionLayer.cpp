/* Copyright 2017 The MathWorks, Inc. */

#include "MWAdditionLayer.hpp"
#include "MWAdditionLayerImpl.hpp"

#include <stdarg.h>
#include <cassert>

MWAdditionLayer::MWAdditionLayer()
{
}

MWAdditionLayer::~MWAdditionLayer()
{    
}

void MWAdditionLayer::createAdditionLayer(MWTargetNetworkImpl* ntwk_impl, int numInputs, ...)
{
    va_list args;
    va_start(args, numInputs);
   
    for(int i = 0; i < numInputs; i++)
    {
        MWTensor* inputTensor = va_arg(args, MWTensor*);
        setInputTensor(inputTensor, i);
    }

    int outbufIdx = va_arg(args, int);
    
    // check that all input tensors match in size
    for(int k = 1; k < numInputs; k++)
    {
        assert(getInputTensor(0)->getHeight() == getInputTensor(k)->getHeight());
        assert(getInputTensor(0)->getWidth() == getInputTensor(k)->getWidth());
        assert(getInputTensor(0)->getChannels() == getInputTensor(k)->getChannels());
        assert(getInputTensor(0)->getBatchSize() == getInputTensor(k)->getBatchSize());
    }

    // allocate output                                 
    int numOutputFeatures = getInputTensor(0)->getChannels();                                      
    allocateOutputTensor(getInputTensor(0)->getHeight(), getInputTensor(0)->getWidth(), numOutputFeatures, getInputTensor(0)->getBatchSize(), NULL);                                                 
                                                                                                       
    m_impl = new MWAdditionLayerImpl(this, ntwk_impl, outbufIdx);                                             
                                                                                                      
    MWTensor *opTensor = getOutputTensor();                                                        
    opTensor->setData(m_impl->getData());   
}
