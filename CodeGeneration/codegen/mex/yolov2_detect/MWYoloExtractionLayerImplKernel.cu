#include "MWKernelHeaders.hpp"
 void __global__ __launch_bounds__(1024) YoloExtractionImpl(float* inputBuffer, 
float* outputBuffer_iouxy, float* outputBuffer_wh, float* outputBuffer_cscores, 
int eybNKlJCSDUvsznWynwK, int aFDPITUhkPdupMfPOBnd, long int 
ZinudJuZuGitiNTsJpBR, long int ZUTPCvgISoRdtnhGqXzM, long int 
jhFUWlztBndwjbXwYNaJ, long int jmcFOAbZArjGDNhshSro, 
long int jaqKGCwoANNDMHgAsehk, const long int BUOdotSvmFyUWQKMUdra) { 
for (int idx = blockDim.x * blockIdx.x + threadIdx.x; idx < BUOdotSvmFyUWQKMUdra; idx 
+= blockDim.x * gridDim.x) { int eVAFqeShtGZAZluKdMvQ = idx / 
ZUTPCvgISoRdtnhGqXzM; long int FLuSVNoPhAFKtLUchSvv = idx - 
(ZUTPCvgISoRdtnhGqXzM * eVAFqeShtGZAZluKdMvQ); int NNhshzQGJHLSGjDiVerE = 
static_cast<int>(FLuSVNoPhAFKtLUchSvv / ZinudJuZuGitiNTsJpBR); long 
int FeVcBgtQmTLtmnNcJGMY = FLuSVNoPhAFKtLUchSvv - 
(ZinudJuZuGitiNTsJpBR * NNhshzQGJHLSGjDiVerE); int yCdIUfwoZFngCRRRkCTg = 
static_cast<int>(FeVcBgtQmTLtmnNcJGMY % aFDPITUhkPdupMfPOBnd); int 
wvufwFZlsnpjbxmTBVYE = static_cast<int>(FeVcBgtQmTLtmnNcJGMY / aFDPITUhkPdupMfPOBnd); 
if (NNhshzQGJHLSGjDiVerE < 3 * eybNKlJCSDUvsznWynwK) { long int opIdx = eVAFqeShtGZAZluKdMvQ * 
jhFUWlztBndwjbXwYNaJ + NNhshzQGJHLSGjDiVerE * 
ZinudJuZuGitiNTsJpBR + wvufwFZlsnpjbxmTBVYE * aFDPITUhkPdupMfPOBnd + 
yCdIUfwoZFngCRRRkCTg; outputBuffer_iouxy[opIdx] = inputBuffer[idx]; } else if 
(NNhshzQGJHLSGjDiVerE >= 3 * eybNKlJCSDUvsznWynwK && NNhshzQGJHLSGjDiVerE < 5 * 
eybNKlJCSDUvsznWynwK) { int NZjOkZPwLzQsdEVkwMcX = NNhshzQGJHLSGjDiVerE - (3 * 
eybNKlJCSDUvsznWynwK); long int opIdx = eVAFqeShtGZAZluKdMvQ * 
jmcFOAbZArjGDNhshSro + NZjOkZPwLzQsdEVkwMcX * 
ZinudJuZuGitiNTsJpBR + wvufwFZlsnpjbxmTBVYE * aFDPITUhkPdupMfPOBnd + 
yCdIUfwoZFngCRRRkCTg; outputBuffer_wh[opIdx] = inputBuffer[idx]; } else { int 
NZjOkZPwLzQsdEVkwMcX = NNhshzQGJHLSGjDiVerE - (5 * eybNKlJCSDUvsznWynwK); long int opIdx = 
eVAFqeShtGZAZluKdMvQ * jaqKGCwoANNDMHgAsehk + NZjOkZPwLzQsdEVkwMcX * 
ZinudJuZuGitiNTsJpBR + wvufwFZlsnpjbxmTBVYE * aFDPITUhkPdupMfPOBnd + 
yCdIUfwoZFngCRRRkCTg; outputBuffer_cscores[opIdx] = inputBuffer[idx]; } } }