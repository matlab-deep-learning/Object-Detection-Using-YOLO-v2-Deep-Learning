/* Copyright 2018 The MathWorks, Inc. */

#ifndef __KERNEL_HEADER_HPP
#define __KERNEL_HEADER_HPP

/* YOLO reorg kernel impl */
void __global__ YoloReorg2dImpl(float*,
                                float*,
                                int,
                                int,
                                long int,
                                long int,
                                long int,
                                long int,
                                int,
                                int,
                                int,
                                int,
                                const long int BUOdotSvmFyUWQKMUdra);


/* YOLO extraction kernel impl */
void __global__ YoloExtractionImpl(float*,
                                   float*,
                                   float*,
                                   float*,
                                   int,
                                   int,
                                   long int,
                                   long int,
                                   long int,
                                   long int,
                                   long int,
                                   const long int);

/* Exponential kernel impl */
void __global__ exp_kernel(float*, float*, const long int);


/* Max unpooling kernel impl */
void __global__ MaxUnpoolingImpl(float  *,
                  float *,
                  float *,
                  const int);

#endif