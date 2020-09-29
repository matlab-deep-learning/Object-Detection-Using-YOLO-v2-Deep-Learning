/* Copyright 2016-2017 The MathWorks, Inc. */
#ifndef CNN_API_HPP
#define CNN_API_HPP

#include <string>
#include <stdexcept>
#include <map>

void call_fread(float*, size_t, size_t, FILE*, const char*);

class MWTensor;
class MWTargetNetworkImpl;
class MWCNNLayerImpl;

class MWCNNLayer
{
  protected:
    
    std::string m_name;                // Name of the layer    
    std::map<int, MWTensor*> m_input;  // inputs
    std::map<int, MWTensor*> m_output; // outputs
   
    MWCNNLayerImpl* m_impl;            // layer impl   
    
  public:
    
    MWCNNLayer();
    virtual ~MWCNNLayer();
    virtual void predict();
    virtual void cleanup();
    virtual void allocate();
    virtual void postSetup() {}

    MWCNNLayerImpl* getImpl() { return m_impl; }
    float*  getData(int index = 0);   // Get the output data
    size_t getNumOutputs() { return m_output.size(); }
    size_t getNumInputs() { return m_input.size(); }
    MWTensor* getInputTensor(int index = 0);
    MWTensor* getOutputTensor(int index = 0);
    void setName(const char*);      // Set the name for this layer

  protected:
    
    int getBatchSize();                          // Get the batch size
    int getHeight(int index = 0);                // Get the height of output y
    int getWidth(int index = 0);                 // Get the width of output y
    int getNumInputFeatures(int index = 0);      // Get the number of channels of the input
    int getNumOutputFeatures(int index = 0);     // Get the number of channels of the output

    void setInputTensor(MWTensor * other, int index = 0); // shallow copy tensor from other
    void allocateOutputTensor(int numHeight,
                              int numWidth,
                              int numChannels,
                              int batchsize,
                              float* data,
                              int index = 0); // allocate output tensor

  public:
    
    static FILE* openBinaryFile(const char* filename);    
    static std::runtime_error getFileOpenError(const char* filename);
};

class MWTensor
{
  public:
    
    MWTensor(int height, int width, int channels, int batchsize, float* data, MWCNNLayer* owner, int srcport);
    ~MWTensor();
    
    int getHeight() const { return m_height;}
    int getWidth() const { return m_width;}
    int getChannels() const { return m_channels;}
    int getBatchSize() const { return m_batchSize;}
    float* getData() const { return m_data; }
    MWCNNLayer* getOwner() const { return m_owner; }
    int getSourcePortIndex() const { return m_srcport; }    
    void setData(float* data);
    void setopBufIndex(int bufIndex){ opBufIndex = bufIndex;}
    int getopBufIndex(){return opBufIndex;}
    
  private:    
    int m_height;
    int m_width;
    int m_channels;
    int m_batchSize;
    float* m_data;
    MWCNNLayer* m_owner;
    int m_srcport;
    int opBufIndex;
};


//ImageInputLayer
class MWInputLayer: public MWCNNLayer
{
  public:
    MWInputLayer() {}
    ~MWInputLayer() {}

    void createInputLayer(MWTargetNetworkImpl* ntwk_impl,
                          int, int, int, int, 
                          int,const char* avg_file_name, int);
 
};

//ReLULayer
class MWReLULayer: public MWCNNLayer
{
  public:
    MWReLULayer(){}
    ~MWReLULayer(){}

    void createReLULayer(MWTargetNetworkImpl*, MWTensor*, int, int);  
};

//CrossChannelNormalizationLayer
class MWNormLayer: public MWCNNLayer
{
  public:
    MWNormLayer(){}
    ~MWNormLayer(){}

    void createNormLayer(MWTargetNetworkImpl*, MWTensor*, unsigned, double, double, double, int);  
};

//AvgPooling2DLayer
class MWAvgPoolingLayer: public MWCNNLayer
{
  public:
    MWAvgPoolingLayer(){}
    ~MWAvgPoolingLayer(){}
    void createAvgPoolingLayer(MWTargetNetworkImpl*, MWTensor*, int, int, int, int, int, int, int); 
};

//MaxPooling2DLayer
class MWMaxPoolingLayer: public MWCNNLayer
{
  public:
    MWMaxPoolingLayer(){}
    ~MWMaxPoolingLayer(){}
    //Create MaxPooling2DLayer with PoolSize = [ PoolH PoolW ]
    //                                Stride = [ StrideH StrideW ]
    //                               Padding = [ PaddingH_T PaddingH_B PaddingW_L PaddingW_R ]
    void createMaxPoolingLayer(MWTargetNetworkImpl*, MWTensor*, int, int, int, int, int, int, int, int, bool, int, ...);
};

//FullyConnectedLayer
class MWFCLayer: public MWCNNLayer
{
  public:
    MWFCLayer(){}
    ~MWFCLayer(){}
		
    void createFCLayer(MWTargetNetworkImpl*, MWTensor*, int, int, const char*, const char*, int);  
};

//SoftmaxLayer
class MWSoftmaxLayer: public MWCNNLayer
{
  public:
    MWSoftmaxLayer(){}
    ~MWSoftmaxLayer(){}

    void createSoftmaxLayer(MWTargetNetworkImpl*, MWTensor*, int); 

};

//ClassificationOutputLayer
class MWOutputLayer: public MWCNNLayer
{
  public:
    MWOutputLayer(){}
    ~MWOutputLayer(){}

    void createOutputLayer(MWTargetNetworkImpl*, MWTensor*, int);
    void predict();
};

// pass through 
class MWPassthroughLayer: public MWCNNLayer
{
  public:
    MWPassthroughLayer(){}
    ~MWPassthroughLayer(){}

    void createPassthroughLayer(MWTargetNetworkImpl*, MWTensor*, int);
    void predict();  
};

#endif
