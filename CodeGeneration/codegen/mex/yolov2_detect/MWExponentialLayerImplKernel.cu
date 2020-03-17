#include "MWKernelHeaders.hpp"
#include <math.h>
 void __global__ __launch_bounds__(1024) exp_kernel(float* inputBuffer, float* 
outputBuffer, const long int BUOdotSvmFyUWQKMUdra) { for (int idx = blockDim.x * 
blockIdx.x + threadIdx.x; idx < BUOdotSvmFyUWQKMUdra; idx += blockDim.x * gridDim.x) { 
outputBuffer[idx] = exp(inputBuffer[idx]); } }