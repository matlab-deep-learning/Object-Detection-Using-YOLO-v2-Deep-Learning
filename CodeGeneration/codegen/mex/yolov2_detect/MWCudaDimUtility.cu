

#include "MWCudaDimUtility.h"



MW_GC_DEVICE int mwGetThreadsPerBlock() {
    int block_size = (int)(blockDim.x *  blockDim.y * blockDim.z);
    return block_size;
}

MW_GC_DEVICE int mwGetBlocksPerGrid() {

    int grid_size = (int)(gridDim.x *  gridDim.y * gridDim.z);
    return grid_size;
}


MW_GC_DEVICE int mwGetTotalThreadsLaunched() {

    int total_thread_count = mwGetThreadsPerBlock() * mwGetBlocksPerGrid();
    return total_thread_count;
}

MW_GC_DEVICE int mwGetGlobalThreadIndex() {

    int thread_idx  = (int)(((((gridDim.x * gridDim.y * blockIdx.z + gridDim.x * blockIdx.y)
                               + blockIdx.x) * (mwGetThreadsPerBlock()) +
                                     threadIdx.z * blockDim.x * blockDim.y) + threadIdx.y *
                                    blockDim.x) + threadIdx.x);
    return thread_idx;
}


MW_GC_DEVICE int mwGetBlockIndex() {
    int block_idx = (gridDim.x * gridDim.y * blockIdx.z) + (gridDim.x * blockIdx.y) + blockIdx.x;
    return block_idx;
}


MW_GC_DEVICE int mwGetThreadIndexWithinBlock() {

    int thread_block_idx = (blockDim.x * blockDim.y * threadIdx.z) + (blockDim.x * threadIdx.y) + threadIdx.x;
    return thread_block_idx ;
}

MW_GC_DEVICE int mwGetGlobalThreadIndexInXDimension() {
    int x_idx = blockDim.x * blockIdx.x + threadIdx.x ;
    return x_idx ;
}

MW_GC_DEVICE int mwGetGlobalThreadIndexInYDimension() {
    int y_idx = blockDim.y * blockIdx.y + threadIdx.y ;
    return y_idx ;
}

MW_GC_DEVICE int mwGetGlobalThreadIndexInZDimension() {
    int z_idx = blockDim.z * blockIdx.z + threadIdx.z ;
    return z_idx ;
}
