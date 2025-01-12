/*
 * Copyright (C) 2024 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#define LOG_TAG "FoldStatusNotifier"

#include "FoldStatusNotifier.h"

#include <android-base/logging.h>
#include <android-base/unique_fd.h>
#include <linux/xiaomi_touch.h>
#include <sys/ioctl.h>

#include "SensorNotifierUtils.h"
#include "SscCalApi.h"

static const std::string kTouchDevice = "/dev/xiaomi-touch";

using android::hardware::Return;
using android::hardware::Void;
using android::hardware::sensors::V1_0::Event;

namespace {

class FoldStatusSensorCallback : public IEventQueueCallback {
  public:
    FoldStatusSensorCallback() {
        touch_fd_ = android::base::unique_fd(open(kTouchDevice.c_str(), O_RDWR));
        if (touch_fd_.get() == -1) {
            LOG(ERROR) << "failed to open " << kTouchDevice;
        }
    }

    Return<void> onEvent(const Event& e) {
        if (foldStatus != static_cast<int>(e.u.scalar)) {
            foldStatus = static_cast<int>(e.u.scalar);
            struct touch_mode_request request = {
                    .mode = TOUCH_MODE_FOLD_STATUS,
                    .value = foldStatus ? TOUCH_FOLD_STATUS_FOLDED : TOUCH_FOLD_STATUS_UNFOLDED,
            };
            ioctl(touch_fd_.get(), TOUCH_IOC_SET_CUR_VALUE, &request);
        }

        return Void();
    }

  private:
    android::base::unique_fd touch_fd_;
    int foldStatus = -1;
};

}  // namespace

FoldStatusNotifier::FoldStatusNotifier(sp<ISensorManager> manager) : SensorNotifier(manager) {
    if (initializeSensorQueue("xiaomi.sensor.fold_status", false, new FoldStatusSensorCallback()) ==
        Result::OK) {
        mQueue->enableSensor(mSensorHandle, 20000 /* sample period */, 0 /* latency */);
    }
}

FoldStatusNotifier::~FoldStatusNotifier() {
    deactivate();
}

void FoldStatusNotifier::notify() {}
