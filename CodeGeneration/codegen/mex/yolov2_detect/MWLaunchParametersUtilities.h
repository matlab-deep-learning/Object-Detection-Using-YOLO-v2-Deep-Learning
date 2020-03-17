
#ifdef __CUDACC__
#ifndef MW_LAUNCH_PARAMETERS_HPP
#define MW_LAUNCH_PARAMETERS_HPP

#define MW_LAUNCH_UNSIGNED_TYPE unsigned long long

bool mwGetLaunchParameters(double numberOfThreads, dim3 *grid, dim3 *block, MW_LAUNCH_UNSIGNED_TYPE MAX_THREADS_PER_BLOCK, MW_LAUNCH_UNSIGNED_TYPE MAX_BLOCKS_PER_GRID) ;
bool mwGetLaunchParameters1D(double numberOfThreads, dim3 *grid, dim3 *block, MW_LAUNCH_UNSIGNED_TYPE MAX_THREADS_PER_BLOCK, MW_LAUNCH_UNSIGNED_TYPE MAX_BLOCKS_PER_GRID) ;
bool mwGetLaunchParameters2D(double numberOfThreads, dim3 *grid, dim3 *block, MW_LAUNCH_UNSIGNED_TYPE MAX_THREADS_PER_BLOCK, MW_LAUNCH_UNSIGNED_TYPE MAX_BLOCKS_PER_GRID) ;
bool mwGetLaunchParameters3D(double numberOfThreads, dim3 *grid, dim3 *block, MW_LAUNCH_UNSIGNED_TYPE MAX_THREADS_PER_BLOCK, MW_LAUNCH_UNSIGNED_TYPE MAX_BLOCKS_PER_GRID) ;
MW_LAUNCH_UNSIGNED_TYPE mwRoundToMultipleOf32(MW_LAUNCH_UNSIGNED_TYPE val);
bool mwValidDim3(dim3 *obj);
void mwResetDim3(dim3 *obj);
void mwResetDim3ToZeros(dim3 *obj);
#endif
#endif
