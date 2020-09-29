/* Copyright 2017 The MathWorks, Inc. */

#ifndef __MW_CUDA_DIM_UTILS_H__
#define __MW_CUDA_DIM_UTILS_H__

#ifdef __CUDACC__

#define MW_GC_GLOBAL __global__
#define MW_GC_DEVICE __device__
//#define MW_GC_INLINE __forceinline__
#define MW_GC_INLINE 
#define GPUCODER_INT32 int

MW_GC_DEVICE MW_GC_INLINE GPUCODER_INT32 mwGetTotalThreadsLaunched() ;
MW_GC_DEVICE MW_GC_INLINE GPUCODER_INT32 mwGetBlockIndex() ;
MW_GC_DEVICE MW_GC_INLINE GPUCODER_INT32 mwGetGlobalThreadIndex() ;
MW_GC_DEVICE MW_GC_INLINE GPUCODER_INT32 mwGetThreadIndexWithinBlock();
MW_GC_DEVICE MW_GC_INLINE GPUCODER_INT32 mwGetThreadsPerBlock();
MW_GC_DEVICE MW_GC_INLINE GPUCODER_INT32 mwGetGlobalThreadIndexInXDimension();
MW_GC_DEVICE MW_GC_INLINE GPUCODER_INT32 mwGetGlobalThreadIndexInYDimension();
MW_GC_DEVICE MW_GC_INLINE GPUCODER_INT32 mwGetGlobalThreadIndexInZDimension();
MW_GC_DEVICE MW_GC_INLINE GPUCODER_INT32 mwGetBlocksPerGrid();

#endif

#endif
