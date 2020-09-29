/* Copyright 2017 The MathWorks, Inc. */

#ifndef __ADDITION_IMPL_HPP
#define __ADDITION_IMPL_HPP

#include "MWAdditionLayer.hpp"
#include "MWAdditionLayerImpl.hpp"
#include "MWCNNLayerImpl.hpp"
#include "MWTargetNetworkImpl.hpp"
#include "cnn_api.hpp"
								
class MWAdditionLayerImpl: public MWCNNLayerImpl
{
  public:
    MWAdditionLayerImpl(MWCNNLayer* , MWTargetNetworkImpl* , int);
    ~MWAdditionLayerImpl();

    void createAdditionLayer(int outbufIdx);
    void predict();
    void cleanup();
		
};
								
#endif
