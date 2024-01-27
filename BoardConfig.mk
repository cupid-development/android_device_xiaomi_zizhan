#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from xiaomi sm8450-common
include device/xiaomi/sm8450-common/BoardConfigCommon.mk

# Inherit from the proprietary version
include vendor/xiaomi/zizhan/BoardConfigVendor.mk

DEVICE_PATH := device/xiaomi/zizhan

# Kernel
device_second_stage_modules := \
    goodix_tee.ko \
    qcom_pm8008-regulator.ko \
    qcom-hv-haptics.ko \
    fst2.ko \
    fts_touch_spi.ko \
    wl2866d.ko

device_vendor_dlkm_exclusive_modules := \
    cs35l41_dlkm.ko

BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD += $(device_second_stage_modules)
BOARD_VENDOR_KERNEL_MODULES_LOAD += $(device_second_stage_modules) $(device_vendor_dlkm_exclusive_modules)

BOOT_KERNEL_MODULES += $(device_second_stage_modules)

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/properties/system.prop

# Recovery
TARGET_RECOVERY_DEFAULT_ROTATION := ROTATION_LEFT

# Screen density
TARGET_SCREEN_DENSITY := 440

# Vibrator
TARGET_QTI_VIBRATOR_EFFECT_LIB := libqtivibratoreffect.xiaomi
TARGET_QTI_VIBRATOR_USE_EFFECT_STREAM := true
