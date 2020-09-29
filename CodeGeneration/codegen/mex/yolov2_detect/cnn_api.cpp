/* Copyright 2016-2019 The MathWorks, Inc. */

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <stdexcept>
#include <string>
#include <stdarg.h>
#include <cassert>
#include <vector>
#include "cnn_api.hpp"
#include "MWCNNLayerImpl.hpp"
#include "MWTargetNetworkImpl.hpp"
// Get string value from the macro
#define XSTR(x) #x
#define STR(x) XSTR(x)

void call_fread(float* m_buffer, size_t m_size, size_t m_num, FILE* m_fp, char const* const m_fileName) {
    if (fread(m_buffer, m_size, m_num, m_fp) != m_num) {
        throw std::runtime_error("Unexpected number of bytes read from " + std::string(m_fileName));
    }
}

MWCNNLayer::MWCNNLayer() :
    m_impl( NULL)
{    
}

MWCNNLayer::~MWCNNLayer()
{
    if (m_impl)
    {
        delete m_impl;
        m_impl = 0;
    }
}

void MWCNNLayer::predict() 
{
    if (m_impl)
    {
        m_impl->predict();
    }
}

void MWCNNLayer::cleanup()
{
    if (m_impl)
    {
        m_impl->cleanup();
    }
    
    for(int idx = 0; idx < getNumOutputs(); idx++)
    {        
        MWTensor* op = getOutputTensor(idx);
        delete op;
        op = 0;
    }
}
void MWCNNLayer::allocate()
{
	if(m_impl)
        {
            m_impl->allocate();
        }
}
std::string getFilePath(std:: string fileS)
{
    char* usrDataPath = NULL;
    std::string path;
    
// Get file path from user environment
    usrDataPath = getenv("USER_DL_DATA_PATH");
    
    if(usrDataPath != NULL)
    {
        path = usrDataPath;
    }
    else
    {
        // Get file path from macro
        path = STR(MW_DL_DATA_PATH);
    }
    
    // Find name of file
    size_t fNamePos = fileS.find_last_of("/\\");
    
    if(fNamePos != std::string::npos)
    {
        std::string fileN(fileS.substr(fNamePos));
        fileS = path + fileN;
    }
    else
    {
        fileS = path + fileS;
    }
    
    return fileS;
}
// open filename
// if file is not found, look in current directory
FILE* MWCNNLayer::openBinaryFile(const char* fileName)
{
    FILE* fp = fopen(fileName, "rb");
    if (!fp)
    {
        std::string fileS(fileName);
        size_t pos = 0;
#ifdef MW_DL_DATA_PATH
        fileS = getFilePath(fileS);
#else
#if defined(_WIN32) || defined(_WIN64)
        
        char delim_unix[] = "/";
        char delim_win[] = "\\";
        
        while(((pos = fileS.find(delim_unix)) != std::string::npos) || 
              ((pos = fileS.find(delim_win)) != std::string::npos))
#else
        char delim_unix[] = "/";
        
        while((pos = fileS.find(delim_unix)) != std::string::npos)
#endif
        {
            if (pos == (fileS.size() - 1))
            {
                fileS = "";
                break;
            }
            fileS = fileS.substr(pos+1);
        }
#endif
        
        if (!fileS.empty())
        {
            fp = fopen(fileS.c_str(), "rb");           
        }
        
        if (!fp)
        {
            std::string errmsg = std::string("Error opening binary file ") + fileS;
            printf("Error! Unable to open file %s\n", fileS.c_str());
            throw std::runtime_error(errmsg.c_str());
        }
    }

    return fp;
}

std::runtime_error MWCNNLayer::getFileOpenError(const char* filename)
{
    const std::string message = std::string("Error! Unable to open file ") +
        std::string(filename);
    return std::runtime_error(message);
}

//Name of each layer is not set nor used for now.
void MWCNNLayer::setName(const char* n)
{
    m_name = n;
    return;
}

void MWTensor::setData(float* data) { 
    m_data = data; 
}

MWTensor* MWCNNLayer::getInputTensor(int index)
{ 
    std::map<int, MWTensor*>::iterator it = m_input.find(index);
    assert(it != m_input.end());
    return it->second;
}

MWTensor* MWCNNLayer::getOutputTensor(int index)
{
    std::map<int, MWTensor*>::iterator it = m_output.find(index);
    assert(it != m_output.end());
    return it->second;
}

void MWCNNLayer::setInputTensor(MWTensor * other, int index)
{
    m_input[index] = other;
}

int MWCNNLayer::getHeight(int index)
{
    return getOutputTensor(index)->getHeight();
}

int MWCNNLayer::getBatchSize()
{
    // return batch size from the output tensor
    return getOutputTensor(0)->getBatchSize();
}

int MWCNNLayer::getWidth(int index)
{
    return getOutputTensor(index)->getWidth();
}

int MWCNNLayer::getNumInputFeatures(int index)
{
    return getInputTensor(index)->getChannels();
}

int MWCNNLayer::getNumOutputFeatures(int index)
{
    return getOutputTensor(index)->getChannels();
}

float* MWCNNLayer::getData(int index)
{
    float* data = getOutputTensor(index)->getData();
    assert(data);
    return data;
}

void MWCNNLayer::allocateOutputTensor(int numHeight, int numWidth, int numChannels, int batchSize, float* data, int index) 
{
    MWTensor* op = new MWTensor(numHeight, numWidth, numChannels, batchSize, data, this, index);
    assert(op != NULL);
    std::map<int, MWTensor*>::iterator it = m_output.find(index);
    assert(it == m_output.end());
    m_output[index]  = op;
}

MWTensor::MWTensor(int height, int width, int channels, int batchsize, float* data, MWCNNLayer* owner, int srcport) :
    m_height(height),
    m_width(width),
    m_channels(channels),
    m_batchSize(batchsize),
    m_data(data),
    m_owner(owner),
    m_srcport(srcport),
    opBufIndex(-1)
{
}

MWTensor::~MWTensor()
{
}


//Creating the ImageInputLayer
//InputSize should be [h w n].
//If normalization is 'zerocenter', withAvg should be true.
//g1429526: currently AverageImage is not accessible.
//Will have to update the codegen to generate avg binary file once the geck is complete.
//And 'zerocenter' is the only supported transformation for this layer.
void MWInputLayer::createInputLayer(MWTargetNetworkImpl* ntwk_impl, int m_n, int m_h, int m_w, int m_c, int m_withAvg, const char* avg_file_name, int outbufIdx)
{
    // populate output tensor
    allocateOutputTensor(m_h, m_w, m_c, m_n, NULL);
    m_impl = new MWInputLayerImpl(this, ntwk_impl, m_n, m_h, m_w, m_c,
                                  m_withAvg, avg_file_name, outbufIdx);
    
    /*Setting the data pointer */
    MWTensor *opTensor = getOutputTensor();
    opTensor->setData(m_impl->getData());
    
    return;
}

//Create ReLULayer
void MWReLULayer::createReLULayer(MWTargetNetworkImpl* ntwk_impl, MWTensor* m_in, int inPlace, int outbufIdx)
{
    setInputTensor(m_in);

    // allocate output, reusing input tensor's data buffer
    int numOutputFeatures = getInputTensor()->getChannels();
    allocateOutputTensor(getInputTensor()->getHeight(), getInputTensor()->getWidth(), numOutputFeatures, getInputTensor()->getBatchSize(), NULL);       
   
    m_impl = new MWReLULayerImpl(this, ntwk_impl, inPlace, outbufIdx);
    
    MWTensor *opTensor = getOutputTensor();
    opTensor->setData(m_impl->getData());
	
    return;
}

//Create CrossChannelNormalizationLayer
//Parameters here are the same naming as NNT.
void MWNormLayer::createNormLayer(MWTargetNetworkImpl* ntwk_impl, MWTensor* m_in, unsigned m_WindowChannelSize, double m_Alpha, double m_Beta, double m_K, int outbufIdx)
{
    setInputTensor(m_in);
    
    int numOutputFeatures = getInputTensor()->getChannels();
    allocateOutputTensor(getInputTensor()->getHeight(), getInputTensor()->getWidth(), numOutputFeatures, getInputTensor()->getBatchSize(), NULL);

    m_impl = new MWNormLayerImpl(this, ntwk_impl, m_WindowChannelSize, m_Alpha, m_Beta, m_K, outbufIdx);

    MWTensor *opTensor = getOutputTensor();
    opTensor->setData(m_impl->getData());

    return;
}

//Create MaxPooling2DLayer with PoolSize = [ PoolH PoolW ]
//                                Stride = [ StrideH StrideW ]
//                               Padding = [ PaddingH_T PaddingH_B PaddingW_L PaddingW_R ]
void MWMaxPoolingLayer::createMaxPoolingLayer(MWTargetNetworkImpl* ntwk_impl, MWTensor* m_in, int m_PoolH, int m_PoolW, int m_StrideH, int m_StrideW, int m_PaddingH_T,int m_PaddingH_B, int m_PaddingW_L, int m_PaddingW_R, bool m_hasIndices, int numOutputs, ...)
{
    setInputTensor(m_in);

    int outputH = ((getInputTensor()->getHeight()- m_PoolH + m_PaddingH_T + m_PaddingH_B)/m_StrideH) + 1;
    int outputW = ((getInputTensor()->getWidth()- m_PoolW + m_PaddingW_L + m_PaddingW_R)/m_StrideW) + 1;

    int numOutputFeatures = getInputTensor()->getChannels();
    allocateOutputTensor(outputH, outputW, numOutputFeatures, getInputTensor()->getBatchSize(), NULL, 0);

    if (m_hasIndices)
    {
        // allocate index tensor
        allocateOutputTensor(outputH, outputW, numOutputFeatures, getInputTensor()->getBatchSize(), NULL, 1);
    }


    {
        va_list args;
        va_start(args, numOutputs);
        std::vector<int> bufIndices(numOutputs, -1);
   
        for(int i = 0; i < numOutputs; i++)
        {
            bufIndices[i] = va_arg(args, int);
        }

        m_impl = new MWMaxPoolingLayerImpl(this, ntwk_impl, m_PoolH, m_PoolW, m_StrideH, m_StrideW, m_PaddingH_T, m_PaddingH_B, m_PaddingW_L, m_PaddingW_R, m_hasIndices, numOutputs, bufIndices);

    }

    /*Setting the MWTensor pointer */
    MWTensor *opTensor = getOutputTensor(0);
    opTensor->setData(m_impl->getData());

    if (m_hasIndices)
    {
        MWTensor *indexOpTensor = getOutputTensor(1);
        indexOpTensor->setData(dynamic_cast<MWMaxPoolingLayerImpl*>(m_impl)->getIndexData());
    }
}

//Create FullyConnectedLayer with corresponding InputSize and OutputSize.
//This implementation uses SGEMV for m_BatchSize = 1 and SGEMM for others.
void MWFCLayer::createFCLayer(MWTargetNetworkImpl* ntwk_impl, MWTensor* m_in, int m_InputSize, int m_OutputSize, const char* m_weights_file, const char* m_bias_file, int outbufIdx)
{
    setInputTensor(m_in);
    allocateOutputTensor(1, 1, m_OutputSize, getInputTensor()->getBatchSize(), NULL);

    m_impl = new MWFCLayerImpl(this, ntwk_impl, m_InputSize, m_weights_file, m_bias_file, outbufIdx);

    /*Setting the MWTensor pointer */
    MWTensor *opTensor = getOutputTensor();
    opTensor->setData(m_impl->getData());
    
    return;
}

//Create SoftmaxLayer
void MWSoftmaxLayer::createSoftmaxLayer(MWTargetNetworkImpl* ntwk_impl, MWTensor* m_in, int outbufIdx)
{
    setInputTensor(m_in);
    
    allocateOutputTensor(getInputTensor()->getHeight(), getInputTensor()->getWidth(), getInputTensor()->getChannels(), getInputTensor()->getBatchSize(), NULL);

    m_impl = new MWSoftmaxLayerImpl(this, ntwk_impl, outbufIdx);

    /*Setting the MWTensor pointer */
    MWTensor *opTensor = getOutputTensor();
    opTensor->setData(m_impl->getData());
    
    return;
}

//Create ClassificationOutputLayer
//We are doing inference only so LossFunction is not needed.
//This layer would do nothing but point the data to previous layer.
void MWOutputLayer::createOutputLayer(MWTargetNetworkImpl* ntwk_impl, MWTensor* m_in, int outbufIdx)
{
    
    setInputTensor(m_in);
    allocateOutputTensor(getInputTensor()->getHeight(),
                         getInputTensor()->getWidth(),
                         getInputTensor()->getChannels(),
                         getInputTensor()->getBatchSize(),
                         getInputTensor()->getData());

    m_impl = new MWOutputLayerImpl(this, ntwk_impl, outbufIdx);

    /*Setting the MWTensor pointer */
    MWTensor* opTensor = getOutputTensor();
    opTensor->setData(m_impl->getData());

    return;
}

void MWOutputLayer::predict() 
{
    m_impl->predict();
}


//Create pass through
//This layer would do nothing but point the data to previous layer.
void MWPassthroughLayer::createPassthroughLayer(MWTargetNetworkImpl* /*ntwk_impl*/, MWTensor* m_in, int /* outbufIdx */)
{
    setInputTensor(m_in);

    int numOutputFeatures = getInputTensor()->getChannels();
    allocateOutputTensor(getInputTensor()->getHeight(),
                         getInputTensor()->getWidth(),
                         numOutputFeatures,
                         getInputTensor()->getBatchSize(),
                         getInputTensor()->getData());
    return;
}

void MWPassthroughLayer::predict()
{
    return;
}

//Create AvgPooling2DLayer with PoolSize = [ PoolH PoolW ]
//                                Stride = [ StrideH StrideW ]
//                               Padding = [ PaddingH PaddingW ]
void MWAvgPoolingLayer::createAvgPoolingLayer(MWTargetNetworkImpl* ntwk_impl, MWTensor* m_in, int m_PoolH, int m_PoolW, int m_StrideH, int m_StrideW, int m_PaddingH, int m_PaddingW, int outbufIdx)
{
    
    setInputTensor(m_in);    

    // Global Average Pooling case
    if ((m_PoolH == -1 )&& (m_PoolW == -1)){
        m_PoolH = getInputTensor()->getHeight();
        m_PoolW = getInputTensor()->getWidth();
    } 
    
    int outputH = ((getInputTensor()->getHeight()- m_PoolH +2*m_PaddingH)/m_StrideH) + 1;
    int outputW = ((getInputTensor()->getWidth()- m_PoolW + 2*m_PaddingW)/m_StrideW) + 1;

    int numOutputFeatures = getInputTensor()->getChannels();
    allocateOutputTensor(outputH, outputW, numOutputFeatures, getInputTensor()->getBatchSize(), NULL);
   
  
    m_impl = new MWAvgPoolingLayerImpl(this, ntwk_impl, m_PoolH, m_PoolW, m_StrideH, m_StrideW, m_PaddingH, m_PaddingW, outbufIdx);    
    
    /*Setting the MWTensor pointer */
    MWTensor *opTensor = getOutputTensor();
    opTensor->setData(m_impl->getData());
}
