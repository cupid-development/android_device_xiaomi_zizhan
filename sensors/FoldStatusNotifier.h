/*
 * Copyright (C) 2024 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#pragma once

#include "SensorNotifier.h"

class FoldStatusNotifier : public SensorNotifier {
  public:
    FoldStatusNotifier(sp<ISensorManager> manager);
    ~FoldStatusNotifier();

  protected:
    void notify();
};
