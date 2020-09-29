/* Copyright 2017 The MathWorks, Inc. */

#include "MWBatchNormalizationLayer.hpp"
#include "MWBatchNormalizationLayerImpl.hpp"
#include "MWTargetNetworkImpl.hpp"

// utils
#include <stdio.h>
#include <cassert>

MWBatchNormalizationLayer::MWBatchNormalizationLayer()
{  
}

MWBatchNormalizationLayer::~MWBatchNormalizationLayer()
{
}

void MWBatchNormalizationLayer::createBatchNormalizationLayer(MWTargetNetworkImpl* ntwk_impl,
                                                              MWTensor* MW_mangled_in,
                                                              double const MW_mangled_epsilon_in,
                                                              const char* MW_mangled_offset_file,
                                                              const char* MW_mangled_scale_file,
                                                              const char* MW_mangled_trainedMean_file,
                                                              const char* MW_mangled_trainedVariance_file,
                                                              int inPlaceOp,
                                                              int outbufIdx)
{
    setInputTensor(MW_mangled_in);
    allocateOutputTensor(getInputTensor()->getHeight(),
                         getInputTensor()->getWidth(),
                         getInputTensor()->getChannels(),
                         getInputTensor()->getBatchSize(),
                         NULL);     
    
    m_impl = new MWBatchNormalizationLayerImpl(this,
                                               ntwk_impl,
                                               MW_mangled_epsilon_in,
                                               MW_mangled_offset_file,
                                               MW_mangled_scale_file,
                                               MW_mangled_trainedMean_file,
                                               MW_mangled_trainedVariance_file,
                                               inPlaceOp,
                                               outbufIdx);

    MWTensor *opTensor = getOutputTensor();
    opTensor->setData(m_impl->getData());
}
