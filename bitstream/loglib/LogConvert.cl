// Copyright (c) Facebook, Inc. and its affiliates. All Rights Reserved.
// All rights reserved.
//
// This source code is licensed under the license found in the
// LICENSE file in the root directory of this source tree.

#include "LogConvertRTL.h"

__kernel
__attribute((max_global_work_dim(0)))
void positToFloat8_1(global FloatType* restrict positIn,
                     char expAdjust,
                     unsigned int n,
                     global unsigned int* restrict floatOut) {
  for (unsigned int i = 0; i < n; ++i) {
    floatOut[i] = logToFloat_RTL(positIn[i]);
  }
}

__kernel
__attribute((max_global_work_dim(0)))
void floatToPosit8_1(global unsigned int* restrict floatIn,
                     char expAdjust,
                     unsigned int n,
                     global FloatType* restrict positOut) {
  for (unsigned int i = 0; i < n; ++i) {
    positOut[i] = floatToLog_RTL(floatIn[i]);
  }
}
