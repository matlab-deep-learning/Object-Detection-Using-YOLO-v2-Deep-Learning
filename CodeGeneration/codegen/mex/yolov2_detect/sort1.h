/*
 * sort1.h
 *
 * Code generation for function 'sort1'
 *
 */

#ifndef SORT1_H
#define SORT1_H

/* Include files */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include "rtwtypes.h"
#include "yolov2_detect_types.h"

/* Function Declarations */
extern __device__ void b_sort(real_T x_data[], int32_T x_size[1]);
extern void sort(real32_T x_data[], int32_T x_size[1], int32_T idx_data[],
                 int32_T idx_size[1]);

#endif

/* End of code generation (sort1.h) */
