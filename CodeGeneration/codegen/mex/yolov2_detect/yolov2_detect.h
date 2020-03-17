/*
 * yolov2_detect.h
 *
 * Code generation for function 'yolov2_detect'
 *
 */

#ifndef YOLOV2_DETECT_H
#define YOLOV2_DETECT_H

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
extern void yolov2_detect(yolov2_detectStackData *SD, const uint8_T in[150528],
  uint8_T outImg[150528]);
extern void yolov2_detect_init();

#endif

/* End of code generation (yolov2_detect.h) */
