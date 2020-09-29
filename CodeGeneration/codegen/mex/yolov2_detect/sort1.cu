/*
 * sort1.cu
 *
 * Code generation for function 'sort1'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "yolov2_detect.h"
#include "sort1.h"

/* Function Definitions */
__device__ void b_sort(real_T x_data[], int32_T x_size[1])
{
  int32_T dim;
  int32_T i7;
  real_T vwork_data[784];
  int32_T vstride;
  int32_T k;
  int32_T j;
  int32_T nBlocks;
  int16_T b_x_size[1];
  real_T b_x_data[784];
  real_T x4[4];
  int16_T unnamed_idx_0;
  real_T xwork_data[784];
  int8_T perm[4];
  int32_T nPairs;
  int32_T i2;
  int32_T bLen;
  int32_T i3;
  int32_T offset;
  int32_T i4;
  real_T xwork[256];
  int32_T bLen2;
  int32_T q;
  int32_T p;
  int32_T exitg1;
  dim = 0;
  if (x_size[0] != 1) {
    dim = -1;
  }

  if (dim + 2 <= 1) {
    i7 = x_size[0];
  } else {
    i7 = 1;
  }

  vstride = 1;
  for (k = 0; k <= dim; k++) {
    vstride *= x_size[0];
  }

  for (j = 0; j < vstride; j++) {
    for (k = 0; k < i7; k++) {
      vwork_data[k] = x_data[j + k * vstride];
    }

    nBlocks = static_cast<int32_T>(static_cast<int16_T>(i7));
    if (static_cast<int32_T>(static_cast<int16_T>(i7)) != 0) {
      b_x_size[0] = static_cast<int16_T>(i7);
      for (dim = 0; dim < nBlocks; dim++) {
        b_x_data[dim] = vwork_data[dim];
      }

      nBlocks = static_cast<int32_T>(static_cast<int16_T>(i7));
      for (dim = 0; dim < 4; dim++) {
        x4[dim] = 0.0;
      }

      unnamed_idx_0 = static_cast<int16_T>(i7);
      for (dim = 0; dim < static_cast<int32_T>(unnamed_idx_0); dim++) {
        xwork_data[dim] = 0.0;
      }

      dim = 0;
      for (k = 0; k < nBlocks; k++) {
        dim++;
        x4[dim - 1] = b_x_data[k];
        if (dim == 4) {
          if (x4[0] <= x4[1]) {
            dim = 1;
            i2 = 2;
          } else {
            dim = 2;
            i2 = 1;
          }

          if (x4[2] <= x4[3]) {
            i3 = 3;
            i4 = 4;
          } else {
            i3 = 4;
            i4 = 3;
          }

          if (x4[dim - 1] <= x4[i3 - 1]) {
            if (x4[i2 - 1] <= x4[i3 - 1]) {
              perm[0] = static_cast<int8_T>(dim);
              perm[1] = static_cast<int8_T>(i2);
              perm[2] = static_cast<int8_T>(i3);
              perm[3] = static_cast<int8_T>(i4);
            } else if (x4[i2 - 1] <= x4[i4 - 1]) {
              perm[0] = static_cast<int8_T>(dim);
              perm[1] = static_cast<int8_T>(i3);
              perm[2] = static_cast<int8_T>(i2);
              perm[3] = static_cast<int8_T>(i4);
            } else {
              perm[0] = static_cast<int8_T>(dim);
              perm[1] = static_cast<int8_T>(i3);
              perm[2] = static_cast<int8_T>(i4);
              perm[3] = static_cast<int8_T>(i2);
            }
          } else if (x4[dim - 1] <= x4[i4 - 1]) {
            if (x4[i2 - 1] <= x4[i4 - 1]) {
              perm[0] = static_cast<int8_T>(i3);
              perm[1] = static_cast<int8_T>(dim);
              perm[2] = static_cast<int8_T>(i2);
              perm[3] = static_cast<int8_T>(i4);
            } else {
              perm[0] = static_cast<int8_T>(i3);
              perm[1] = static_cast<int8_T>(dim);
              perm[2] = static_cast<int8_T>(i4);
              perm[3] = static_cast<int8_T>(i2);
            }
          } else {
            perm[0] = static_cast<int8_T>(i3);
            perm[1] = static_cast<int8_T>(i4);
            perm[2] = static_cast<int8_T>(dim);
            perm[3] = static_cast<int8_T>(i2);
          }

          b_x_data[k - 3] = x4[static_cast<int32_T>(perm[0]) - 1];
          b_x_data[k - 2] = x4[static_cast<int32_T>(perm[1]) - 1];
          b_x_data[k - 1] = x4[static_cast<int32_T>(perm[2]) - 1];
          b_x_data[k] = x4[static_cast<int32_T>(perm[3]) - 1];
          dim = 0;
        }
      }

      if (dim > 0) {
        for (nBlocks = 0; nBlocks < 4; nBlocks++) {
          perm[nBlocks] = static_cast<int8_T>(0);
        }

        if (dim == 1) {
          perm[0] = static_cast<int8_T>(1);
        } else if (dim == 2) {
          if (x4[0] <= x4[1]) {
            perm[0] = static_cast<int8_T>(1);
            perm[1] = static_cast<int8_T>(2);
          } else {
            perm[0] = static_cast<int8_T>(2);
            perm[1] = static_cast<int8_T>(1);
          }
        } else if (x4[0] <= x4[1]) {
          if (x4[1] <= x4[2]) {
            perm[0] = static_cast<int8_T>(1);
            perm[1] = static_cast<int8_T>(2);
            perm[2] = static_cast<int8_T>(3);
          } else if (x4[0] <= x4[2]) {
            perm[0] = static_cast<int8_T>(1);
            perm[1] = static_cast<int8_T>(3);
            perm[2] = static_cast<int8_T>(2);
          } else {
            perm[0] = static_cast<int8_T>(3);
            perm[1] = static_cast<int8_T>(1);
            perm[2] = static_cast<int8_T>(2);
          }
        } else if (x4[0] <= x4[2]) {
          perm[0] = static_cast<int8_T>(2);
          perm[1] = static_cast<int8_T>(1);
          perm[2] = static_cast<int8_T>(3);
        } else if (x4[1] <= x4[2]) {
          perm[0] = static_cast<int8_T>(2);
          perm[1] = static_cast<int8_T>(3);
          perm[2] = static_cast<int8_T>(1);
        } else {
          perm[0] = static_cast<int8_T>(3);
          perm[1] = static_cast<int8_T>(2);
          perm[2] = static_cast<int8_T>(1);
        }

        for (k = 0; k < dim; k++) {
          b_x_data[(static_cast<int32_T>(static_cast<int16_T>(i7)) - dim) + k] =
            x4[static_cast<int32_T>(perm[k]) - 1];
        }
      }

      dim = 2;
      if (static_cast<int32_T>(static_cast<int16_T>(i7)) > 1) {
        if (static_cast<int32_T>(static_cast<int16_T>(i7)) >= 256) {
          nBlocks = static_cast<int32_T>(static_cast<int16_T>(i7)) >> 8;
          if (nBlocks > 0) {
            for (i3 = 0; i3 < nBlocks; i3++) {
              offset = i3 << 8;
              for (i4 = 0; i4 < 6; i4++) {
                bLen = 1 << (i4 + 2);
                bLen2 = bLen << 1;
                nPairs = 256 >> (3 + i4);
                for (k = 0; k < nPairs; k++) {
                  dim = offset + k * bLen2;
                  for (q = 0; q < bLen2; q++) {
                    xwork[q] = b_x_data[dim + q];
                  }

                  p = 1;
                  q = bLen;
                  i2 = dim - 1;
                  do {
                    exitg1 = 0;
                    i2++;
                    if (xwork[p - 1] <= xwork[q]) {
                      b_x_data[i2] = xwork[p - 1];
                      if (p < bLen) {
                        p++;
                      } else {
                        exitg1 = 1;
                      }
                    } else {
                      b_x_data[i2] = xwork[q];
                      if (q + 1 < bLen2) {
                        q++;
                      } else {
                        dim = (i2 - p) + 1;
                        for (q = 0; q <= bLen - p; q++) {
                          i2 = p + q;
                          b_x_data[dim + i2] = xwork[i2 - 1];
                        }

                        exitg1 = 1;
                      }
                    }
                  } while (exitg1 == 0);
                }
              }
            }

            i3 = nBlocks << 8;
            i4 = static_cast<int32_T>(static_cast<int16_T>(i7)) - i3;
            if (i4 > 0) {
              nPairs = i4 >> 2;
              bLen = 4;
              while (nPairs > 1) {
                if ((nPairs & 1) != 0) {
                  nPairs--;
                  dim = bLen * nPairs;
                  i2 = i4 - dim;
                  if (i2 > bLen) {
                    offset = i3 + dim;
                    dim = i2 - bLen;
                    if (dim != 0) {
                      i2 = bLen + dim;
                      for (q = 0; q < i2; q++) {
                        xwork_data[q] = b_x_data[offset + q];
                      }

                      p = 0;
                      q = bLen;
                      dim += bLen;
                      i2 = offset - 1;
                      do {
                        exitg1 = 0;
                        i2++;
                        if (xwork_data[p] <= xwork_data[q]) {
                          b_x_data[i2] = xwork_data[p];
                          if (p + 1 < bLen) {
                            p++;
                          } else {
                            exitg1 = 1;
                          }
                        } else {
                          b_x_data[i2] = xwork_data[q];
                          if (q + 1 < dim) {
                            q++;
                          } else {
                            dim = i2 - p;
                            for (q = 0; q < bLen - p; q++) {
                              i2 = (p + q) + 1;
                              b_x_data[dim + i2] = xwork_data[i2 - 1];
                            }

                            exitg1 = 1;
                          }
                        }
                      } while (exitg1 == 0);
                    }
                  }
                }

                bLen2 = bLen << 1;
                nPairs >>= 1;
                for (k = 0; k < nPairs; k++) {
                  offset = i3 + k * bLen2;
                  if (bLen != 0) {
                    i2 = bLen + bLen;
                    for (q = 0; q < i2; q++) {
                      xwork_data[q] = b_x_data[offset + q];
                    }

                    p = 0;
                    q = bLen;
                    dim = bLen + bLen;
                    i2 = offset - 1;
                    do {
                      exitg1 = 0;
                      i2++;
                      if (xwork_data[p] <= xwork_data[q]) {
                        b_x_data[i2] = xwork_data[p];
                        if (p + 1 < bLen) {
                          p++;
                        } else {
                          exitg1 = 1;
                        }
                      } else {
                        b_x_data[i2] = xwork_data[q];
                        if (q + 1 < dim) {
                          q++;
                        } else {
                          dim = i2 - p;
                          for (q = 0; q < bLen - p; q++) {
                            i2 = (p + q) + 1;
                            b_x_data[dim + i2] = xwork_data[i2 - 1];
                          }

                          exitg1 = 1;
                        }
                      }
                    } while (exitg1 == 0);
                  }
                }

                bLen = bLen2;
              }

              if (i4 > bLen) {
                dim = i4 - bLen;
                if (dim != 0) {
                  i2 = bLen + dim;
                  for (q = 0; q < i2; q++) {
                    xwork_data[q] = b_x_data[i3 + q];
                  }

                  p = 0;
                  q = bLen;
                  dim += bLen;
                  i2 = i3 - 1;
                  do {
                    exitg1 = 0;
                    i2++;
                    if (xwork_data[p] <= xwork_data[q]) {
                      b_x_data[i2] = xwork_data[p];
                      if (p + 1 < bLen) {
                        p++;
                      } else {
                        exitg1 = 1;
                      }
                    } else {
                      b_x_data[i2] = xwork_data[q];
                      if (q + 1 < dim) {
                        q++;
                      } else {
                        dim = i2 - p;
                        for (q = 0; q < bLen - p; q++) {
                          i2 = (p + q) + 1;
                          b_x_data[dim + i2] = xwork_data[i2 - 1];
                        }

                        exitg1 = 1;
                      }
                    }
                  } while (exitg1 == 0);
                }
              }
            }

            dim = 8;
          }
        }

        nPairs = static_cast<int32_T>(static_cast<int16_T>(i7)) >> dim;
        bLen = 1 << dim;
        while (nPairs > 1) {
          if ((nPairs & 1) != 0) {
            nPairs--;
            i3 = bLen * nPairs;
            i2 = static_cast<int32_T>(static_cast<int16_T>(i7)) - i3;
            if (i2 > bLen) {
              dim = i2 - bLen;
              if (dim != 0) {
                i2 = bLen + dim;
                for (q = 0; q < i2; q++) {
                  xwork_data[q] = b_x_data[i3 + q];
                }

                p = 0;
                q = bLen;
                dim += bLen;
                i2 = i3 - 1;
                do {
                  exitg1 = 0;
                  i2++;
                  if (xwork_data[p] <= xwork_data[q]) {
                    b_x_data[i2] = xwork_data[p];
                    if (p + 1 < bLen) {
                      p++;
                    } else {
                      exitg1 = 1;
                    }
                  } else {
                    b_x_data[i2] = xwork_data[q];
                    if (q + 1 < dim) {
                      q++;
                    } else {
                      dim = i2 - p;
                      for (q = 0; q < bLen - p; q++) {
                        i2 = (p + q) + 1;
                        b_x_data[dim + i2] = xwork_data[i2 - 1];
                      }

                      exitg1 = 1;
                    }
                  }
                } while (exitg1 == 0);
              }
            }
          }

          bLen2 = bLen << 1;
          nPairs >>= 1;
          for (k = 0; k < nPairs; k++) {
            offset = k * bLen2;
            if (bLen != 0) {
              i2 = bLen + bLen;
              for (q = 0; q < i2; q++) {
                xwork_data[q] = b_x_data[offset + q];
              }

              p = 0;
              q = bLen;
              dim = bLen + bLen;
              i2 = offset - 1;
              do {
                exitg1 = 0;
                i2++;
                if (xwork_data[p] <= xwork_data[q]) {
                  b_x_data[i2] = xwork_data[p];
                  if (p + 1 < bLen) {
                    p++;
                  } else {
                    exitg1 = 1;
                  }
                } else {
                  b_x_data[i2] = xwork_data[q];
                  if (q + 1 < dim) {
                    q++;
                  } else {
                    dim = i2 - p;
                    for (q = 0; q < bLen - p; q++) {
                      i2 = (p + q) + 1;
                      b_x_data[dim + i2] = xwork_data[i2 - 1];
                    }

                    exitg1 = 1;
                  }
                }
              } while (exitg1 == 0);
            }
          }

          bLen = bLen2;
        }

        if (static_cast<int32_T>(static_cast<int16_T>(i7)) > bLen) {
          dim = static_cast<int32_T>(static_cast<int16_T>(i7)) - bLen;
          if (dim != 0) {
            i2 = bLen + dim;
            for (q = 0; q < i2; q++) {
              xwork_data[q] = b_x_data[q];
            }

            p = 0;
            q = bLen;
            dim += bLen;
            i2 = -1;
            do {
              exitg1 = 0;
              i2++;
              if (xwork_data[p] <= xwork_data[q]) {
                b_x_data[i2] = xwork_data[p];
                if (p + 1 < bLen) {
                  p++;
                } else {
                  exitg1 = 1;
                }
              } else {
                b_x_data[i2] = xwork_data[q];
                if (q + 1 < dim) {
                  q++;
                } else {
                  dim = i2 - p;
                  for (q = 0; q < bLen - p; q++) {
                    i2 = (p + q) + 1;
                    b_x_data[dim + i2] = xwork_data[i2 - 1];
                  }

                  exitg1 = 1;
                }
              }
            } while (exitg1 == 0);
          }
        }
      }

      for (nBlocks = 0; nBlocks < static_cast<int32_T>(b_x_size[0]); nBlocks++)
      {
        vwork_data[nBlocks] = b_x_data[nBlocks];
      }
    }

    for (k = 0; k < i7; k++) {
      x_data[j + k * vstride] = vwork_data[k];
    }
  }
}

void sort(real32_T x_data[], int32_T x_size[1], int32_T idx_data[], int32_T
          idx_size[1])
{
  int32_T dim;
  int32_T i6;
  real32_T vwork_data[784];
  int32_T vstride;
  int32_T k;
  int16_T unnamed_idx_0;
  int32_T j;
  int32_T q;
  int16_T iidx_data[784];
  int16_T b_idx_size[1];
  int16_T b_idx_data[784];
  int16_T b_x_size[1];
  real32_T b_x_data[784];
  real32_T x4[4];
  int16_T idx4[4];
  int16_T b_unnamed_idx_0;
  int16_T iwork_data[784];
  int32_T nNaNs;
  real32_T xwork_data[784];
  int32_T i2;
  int8_T perm[4];
  int32_T i1;
  int32_T nNonNaN;
  int32_T i4;
  int32_T nPairs;
  int32_T i3;
  int32_T bLen;
  int32_T offset;
  int16_T iwork[256];
  int32_T bLen2;
  real32_T xwork[256];
  int32_T p;
  int32_T exitg1;
  dim = 0;
  if (x_size[0] != 1) {
    dim = -1;
  }

  if (dim + 2 <= 1) {
    i6 = x_size[0];
  } else {
    i6 = 1;
  }

  idx_size[0] = static_cast<int16_T>(x_size[0]);
  vstride = 1;
  for (k = 0; k <= dim; k++) {
    vstride *= x_size[0];
  }

  if (0 <= vstride - 1) {
    unnamed_idx_0 = static_cast<int16_T>(i6);
  }

  for (j = 0; j < vstride; j++) {
    for (k = 0; k < i6; k++) {
      vwork_data[k] = x_data[j + k * vstride];
    }

    for (q = 0; q < unnamed_idx_0; q++) {
      iidx_data[q] = 0;
    }

    if (static_cast<int16_T>(i6) != 0) {
      q = unnamed_idx_0;
      b_idx_size[0] = unnamed_idx_0;
      for (dim = 0; dim < q; dim++) {
        b_idx_data[dim] = 0;
      }

      q = static_cast<int16_T>(i6);
      b_x_size[0] = static_cast<int16_T>(i6);
      for (dim = 0; dim < q; dim++) {
        b_x_data[dim] = vwork_data[dim];
      }

      q = static_cast<int16_T>(i6);
      for (dim = 0; dim < 4; dim++) {
        x4[dim] = 0.0F;
        idx4[dim] = 0;
      }

      for (dim = 0; dim < unnamed_idx_0; dim++) {
        iwork_data[dim] = 0;
      }

      b_unnamed_idx_0 = static_cast<int16_T>(i6);
      for (dim = 0; dim < b_unnamed_idx_0; dim++) {
        xwork_data[dim] = 0.0F;
      }

      nNaNs = 0;
      dim = 0;
      for (k = 0; k < q; k++) {
        if (rtIsNaNF(b_x_data[k])) {
          b_idx_data[(static_cast<int16_T>(i6) - nNaNs) - 1] = static_cast<
            int16_T>((1 + k));
          xwork_data[(static_cast<int16_T>(i6) - nNaNs) - 1] = b_x_data[k];
          nNaNs++;
        } else {
          dim++;
          idx4[dim - 1] = static_cast<int16_T>((1 + k));
          x4[dim - 1] = b_x_data[k];
          if (dim == 4) {
            dim = k - nNaNs;
            if (x4[0] >= x4[1]) {
              i1 = 1;
              i2 = 2;
            } else {
              i1 = 2;
              i2 = 1;
            }

            if (x4[2] >= x4[3]) {
              i3 = 3;
              i4 = 4;
            } else {
              i3 = 4;
              i4 = 3;
            }

            if (x4[i1 - 1] >= x4[i3 - 1]) {
              if (x4[i2 - 1] >= x4[i3 - 1]) {
                perm[0] = static_cast<int8_T>(i1);
                perm[1] = static_cast<int8_T>(i2);
                perm[2] = static_cast<int8_T>(i3);
                perm[3] = static_cast<int8_T>(i4);
              } else if (x4[i2 - 1] >= x4[i4 - 1]) {
                perm[0] = static_cast<int8_T>(i1);
                perm[1] = static_cast<int8_T>(i3);
                perm[2] = static_cast<int8_T>(i2);
                perm[3] = static_cast<int8_T>(i4);
              } else {
                perm[0] = static_cast<int8_T>(i1);
                perm[1] = static_cast<int8_T>(i3);
                perm[2] = static_cast<int8_T>(i4);
                perm[3] = static_cast<int8_T>(i2);
              }
            } else if (x4[i1 - 1] >= x4[i4 - 1]) {
              if (x4[i2 - 1] >= x4[i4 - 1]) {
                perm[0] = static_cast<int8_T>(i3);
                perm[1] = static_cast<int8_T>(i1);
                perm[2] = static_cast<int8_T>(i2);
                perm[3] = static_cast<int8_T>(i4);
              } else {
                perm[0] = static_cast<int8_T>(i3);
                perm[1] = static_cast<int8_T>(i1);
                perm[2] = static_cast<int8_T>(i4);
                perm[3] = static_cast<int8_T>(i2);
              }
            } else {
              perm[0] = static_cast<int8_T>(i3);
              perm[1] = static_cast<int8_T>(i4);
              perm[2] = static_cast<int8_T>(i1);
              perm[3] = static_cast<int8_T>(i2);
            }

            b_idx_data[dim - 3] = idx4[perm[0] - 1];
            b_idx_data[dim - 2] = idx4[perm[1] - 1];
            b_idx_data[dim - 1] = idx4[perm[2] - 1];
            b_idx_data[dim] = idx4[perm[3] - 1];
            b_x_data[dim - 3] = x4[perm[0] - 1];
            b_x_data[dim - 2] = x4[perm[1] - 1];
            b_x_data[dim - 1] = x4[perm[2] - 1];
            b_x_data[dim] = x4[perm[3] - 1];
            dim = 0;
          }
        }
      }

      i2 = static_cast<int16_T>(i6) - nNaNs;
      if (dim > 0) {
        for (q = 0; q < 4; q++) {
          perm[q] = 0;
        }

        if (dim == 1) {
          perm[0] = 1;
        } else if (dim == 2) {
          if (x4[0] >= x4[1]) {
            perm[0] = 1;
            perm[1] = 2;
          } else {
            perm[0] = 2;
            perm[1] = 1;
          }
        } else if (x4[0] >= x4[1]) {
          if (x4[1] >= x4[2]) {
            perm[0] = 1;
            perm[1] = 2;
            perm[2] = 3;
          } else if (x4[0] >= x4[2]) {
            perm[0] = 1;
            perm[1] = 3;
            perm[2] = 2;
          } else {
            perm[0] = 3;
            perm[1] = 1;
            perm[2] = 2;
          }
        } else if (x4[0] >= x4[2]) {
          perm[0] = 2;
          perm[1] = 1;
          perm[2] = 3;
        } else if (x4[1] >= x4[2]) {
          perm[0] = 2;
          perm[1] = 3;
          perm[2] = 1;
        } else {
          perm[0] = 3;
          perm[1] = 2;
          perm[2] = 1;
        }

        for (k = 0; k < dim; k++) {
          b_idx_data[(i2 - dim) + k] = idx4[perm[k] - 1];
          b_x_data[(i2 - dim) + k] = x4[perm[k] - 1];
        }
      }

      dim = nNaNs >> 1;
      for (k = 0; k < dim; k++) {
        i1 = b_idx_data[i2 + k];
        b_idx_data[i2 + k] = b_idx_data[(static_cast<int16_T>(i6) - k) - 1];
        b_idx_data[(static_cast<int16_T>(i6) - k) - 1] = static_cast<int16_T>(i1);
        b_x_data[i2 + k] = xwork_data[(static_cast<int16_T>(i6) - k) - 1];
        b_x_data[(static_cast<int16_T>(i6) - k) - 1] = xwork_data[i2 + k];
      }

      if ((nNaNs & 1) != 0) {
        b_x_data[i2 + dim] = xwork_data[i2 + dim];
      }

      nNonNaN = static_cast<int16_T>(i6) - nNaNs;
      dim = 2;
      if (nNonNaN > 1) {
        if (static_cast<int16_T>(i6) >= 256) {
          i4 = nNonNaN >> 8;
          if (i4 > 0) {
            for (i2 = 0; i2 < i4; i2++) {
              offset = i2 << 8;
              for (i3 = 0; i3 < 6; i3++) {
                bLen = 1 << (i3 + 2);
                bLen2 = bLen << 1;
                nPairs = 256 >> (3 + i3);
                for (k = 0; k < nPairs; k++) {
                  dim = offset + k * bLen2;
                  for (q = 0; q < bLen2; q++) {
                    iwork[q] = b_idx_data[dim + q];
                    xwork[q] = b_x_data[dim + q];
                  }

                  p = 0;
                  q = bLen;
                  i1 = dim - 1;
                  do {
                    exitg1 = 0;
                    i1++;
                    if (xwork[p] >= xwork[q]) {
                      b_idx_data[i1] = iwork[p];
                      b_x_data[i1] = xwork[p];
                      if (p + 1 < bLen) {
                        p++;
                      } else {
                        exitg1 = 1;
                      }
                    } else {
                      b_idx_data[i1] = iwork[q];
                      b_x_data[i1] = xwork[q];
                      if (q + 1 < bLen2) {
                        q++;
                      } else {
                        dim = i1 - p;
                        for (q = 0; q < bLen - p; q++) {
                          i1 = p + q;
                          b_idx_data[(dim + i1) + 1] = iwork[i1];
                          b_x_data[(dim + i1) + 1] = xwork[i1];
                        }

                        exitg1 = 1;
                      }
                    }
                  } while (exitg1 == 0);
                }
              }
            }

            i2 = i4 << 8;
            i3 = nNonNaN - i2;
            if (i3 > 0) {
              nPairs = i3 >> 2;
              bLen = 4;
              while (nPairs > 1) {
                if ((nPairs & 1) != 0) {
                  nPairs--;
                  dim = bLen * nPairs;
                  i1 = i3 - dim;
                  if (i1 > bLen) {
                    offset = i2 + dim;
                    dim = i1 - bLen;
                    if (dim != 0) {
                      i1 = bLen + dim;
                      for (q = 0; q < i1; q++) {
                        iwork_data[q] = b_idx_data[offset + q];
                        xwork_data[q] = b_x_data[offset + q];
                      }

                      p = 0;
                      q = bLen;
                      dim += bLen;
                      i1 = offset - 1;
                      do {
                        exitg1 = 0;
                        i1++;
                        if (xwork_data[p] >= xwork_data[q]) {
                          b_idx_data[i1] = iwork_data[p];
                          b_x_data[i1] = xwork_data[p];
                          if (p + 1 < bLen) {
                            p++;
                          } else {
                            exitg1 = 1;
                          }
                        } else {
                          b_idx_data[i1] = iwork_data[q];
                          b_x_data[i1] = xwork_data[q];
                          if (q + 1 < dim) {
                            q++;
                          } else {
                            dim = i1 - p;
                            for (q = 0; q < bLen - p; q++) {
                              i1 = (p + q) + 1;
                              b_idx_data[dim + i1] = iwork_data[i1 - 1];
                              b_x_data[dim + i1] = xwork_data[i1 - 1];
                            }

                            exitg1 = 1;
                          }
                        }
                      } while (exitg1 == 0);
                    }
                  }
                }

                bLen2 = bLen << 1;
                nPairs >>= 1;
                for (k = 0; k < nPairs; k++) {
                  offset = i2 + k * bLen2;
                  if (bLen != 0) {
                    i1 = bLen + bLen;
                    for (q = 0; q < i1; q++) {
                      iwork_data[q] = b_idx_data[offset + q];
                      xwork_data[q] = b_x_data[offset + q];
                    }

                    p = 0;
                    q = bLen;
                    dim = bLen + bLen;
                    i1 = offset - 1;
                    do {
                      exitg1 = 0;
                      i1++;
                      if (xwork_data[p] >= xwork_data[q]) {
                        b_idx_data[i1] = iwork_data[p];
                        b_x_data[i1] = xwork_data[p];
                        if (p + 1 < bLen) {
                          p++;
                        } else {
                          exitg1 = 1;
                        }
                      } else {
                        b_idx_data[i1] = iwork_data[q];
                        b_x_data[i1] = xwork_data[q];
                        if (q + 1 < dim) {
                          q++;
                        } else {
                          dim = i1 - p;
                          for (q = 0; q < bLen - p; q++) {
                            i1 = (p + q) + 1;
                            b_idx_data[dim + i1] = iwork_data[i1 - 1];
                            b_x_data[dim + i1] = xwork_data[i1 - 1];
                          }

                          exitg1 = 1;
                        }
                      }
                    } while (exitg1 == 0);
                  }
                }

                bLen = bLen2;
              }

              if (i3 > bLen) {
                dim = i3 - bLen;
                if (dim != 0) {
                  i1 = bLen + dim;
                  for (q = 0; q < i1; q++) {
                    iwork_data[q] = b_idx_data[i2 + q];
                    xwork_data[q] = b_x_data[i2 + q];
                  }

                  p = 0;
                  q = bLen;
                  dim += bLen;
                  i1 = i2 - 1;
                  do {
                    exitg1 = 0;
                    i1++;
                    if (xwork_data[p] >= xwork_data[q]) {
                      b_idx_data[i1] = iwork_data[p];
                      b_x_data[i1] = xwork_data[p];
                      if (p + 1 < bLen) {
                        p++;
                      } else {
                        exitg1 = 1;
                      }
                    } else {
                      b_idx_data[i1] = iwork_data[q];
                      b_x_data[i1] = xwork_data[q];
                      if (q + 1 < dim) {
                        q++;
                      } else {
                        dim = i1 - p;
                        for (q = 0; q < bLen - p; q++) {
                          i1 = (p + q) + 1;
                          b_idx_data[dim + i1] = iwork_data[i1 - 1];
                          b_x_data[dim + i1] = xwork_data[i1 - 1];
                        }

                        exitg1 = 1;
                      }
                    }
                  } while (exitg1 == 0);
                }
              }
            }

            dim = 8;
          }
        }

        nPairs = nNonNaN >> dim;
        bLen = 1 << dim;
        while (nPairs > 1) {
          if ((nPairs & 1) != 0) {
            nPairs--;
            i2 = bLen * nPairs;
            i1 = nNonNaN - i2;
            if (i1 > bLen) {
              dim = i1 - bLen;
              if (dim != 0) {
                i1 = bLen + dim;
                for (q = 0; q < i1; q++) {
                  iwork_data[q] = b_idx_data[i2 + q];
                  xwork_data[q] = b_x_data[i2 + q];
                }

                p = 0;
                q = bLen;
                dim += bLen;
                i1 = i2 - 1;
                do {
                  exitg1 = 0;
                  i1++;
                  if (xwork_data[p] >= xwork_data[q]) {
                    b_idx_data[i1] = iwork_data[p];
                    b_x_data[i1] = xwork_data[p];
                    if (p + 1 < bLen) {
                      p++;
                    } else {
                      exitg1 = 1;
                    }
                  } else {
                    b_idx_data[i1] = iwork_data[q];
                    b_x_data[i1] = xwork_data[q];
                    if (q + 1 < dim) {
                      q++;
                    } else {
                      dim = i1 - p;
                      for (q = 0; q < bLen - p; q++) {
                        i1 = (p + q) + 1;
                        b_idx_data[dim + i1] = iwork_data[i1 - 1];
                        b_x_data[dim + i1] = xwork_data[i1 - 1];
                      }

                      exitg1 = 1;
                    }
                  }
                } while (exitg1 == 0);
              }
            }
          }

          bLen2 = bLen << 1;
          nPairs >>= 1;
          for (k = 0; k < nPairs; k++) {
            offset = k * bLen2;
            if (bLen != 0) {
              i1 = bLen + bLen;
              for (q = 0; q < i1; q++) {
                iwork_data[q] = b_idx_data[offset + q];
                xwork_data[q] = b_x_data[offset + q];
              }

              p = 0;
              q = bLen;
              dim = bLen + bLen;
              i1 = offset - 1;
              do {
                exitg1 = 0;
                i1++;
                if (xwork_data[p] >= xwork_data[q]) {
                  b_idx_data[i1] = iwork_data[p];
                  b_x_data[i1] = xwork_data[p];
                  if (p + 1 < bLen) {
                    p++;
                  } else {
                    exitg1 = 1;
                  }
                } else {
                  b_idx_data[i1] = iwork_data[q];
                  b_x_data[i1] = xwork_data[q];
                  if (q + 1 < dim) {
                    q++;
                  } else {
                    dim = i1 - p;
                    for (q = 0; q < bLen - p; q++) {
                      i1 = (p + q) + 1;
                      b_idx_data[dim + i1] = iwork_data[i1 - 1];
                      b_x_data[dim + i1] = xwork_data[i1 - 1];
                    }

                    exitg1 = 1;
                  }
                }
              } while (exitg1 == 0);
            }
          }

          bLen = bLen2;
        }

        if (nNonNaN > bLen) {
          dim = nNonNaN - bLen;
          if (dim != 0) {
            i1 = bLen + dim;
            for (q = 0; q < i1; q++) {
              iwork_data[q] = b_idx_data[q];
              xwork_data[q] = b_x_data[q];
            }

            p = 0;
            q = bLen;
            dim += bLen;
            i1 = -1;
            do {
              exitg1 = 0;
              i1++;
              if (xwork_data[p] >= xwork_data[q]) {
                b_idx_data[i1] = iwork_data[p];
                b_x_data[i1] = xwork_data[p];
                if (p + 1 < bLen) {
                  p++;
                } else {
                  exitg1 = 1;
                }
              } else {
                b_idx_data[i1] = iwork_data[q];
                b_x_data[i1] = xwork_data[q];
                if (q + 1 < dim) {
                  q++;
                } else {
                  dim = i1 - p;
                  for (q = 0; q < bLen - p; q++) {
                    i1 = (p + q) + 1;
                    b_idx_data[dim + i1] = iwork_data[i1 - 1];
                    b_x_data[dim + i1] = xwork_data[i1 - 1];
                  }

                  exitg1 = 1;
                }
              }
            } while (exitg1 == 0);
          }
        }
      }

      if ((nNaNs > 0) && (nNonNaN > 0)) {
        for (k = 0; k < nNaNs; k++) {
          xwork_data[k] = b_x_data[nNonNaN + k];
          iwork_data[k] = b_idx_data[nNonNaN + k];
        }

        for (k = 0; k < nNonNaN; k++) {
          dim = (nNonNaN - k) - 1;
          b_x_data[nNaNs + dim] = b_x_data[dim];
          b_idx_data[nNaNs + dim] = b_idx_data[dim];
        }

        for (k = 0; k < nNaNs; k++) {
          b_x_data[k] = xwork_data[k];
          b_idx_data[k] = iwork_data[k];
        }
      }

      for (q = 0; q < b_idx_size[0]; q++) {
        iidx_data[q] = b_idx_data[q];
      }

      for (q = 0; q < b_x_size[0]; q++) {
        vwork_data[q] = b_x_data[q];
      }
    }

    for (k = 0; k < i6; k++) {
      x_data[j + k * vstride] = vwork_data[k];
      idx_data[j + k * vstride] = iidx_data[k];
    }
  }
}

/* End of code generation (sort1.cu) */
