#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from zizhan device
$(call inherit-product, device/xiaomi/zizhan/device.mk)

# Inherit from common lineage configuration
$(call inherit-product, vendor/lineage/config/common_full_foldable_book_telephony.mk)

PRODUCT_NAME := lineage_zizhan
PRODUCT_DEVICE := zizhan
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := 22061218C

PRODUCT_SYSTEM_NAME := zizhan
PRODUCT_SYSTEM_DEVICE := zizhan

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="zizhan-user 14 UKQ1.230804.001 V816.0.9.0.ULRCNXM release-keys" \
    TARGET_DEVICE=$(PRODUCT_SYSTEM_DEVICE) \
    TARGET_PRODUCT=$(PRODUCT_SYSTEM_NAME)

BUILD_FINGERPRINT := Xiaomi/zizhan/zizhan:14/UKQ1.230804.001/V816.0.9.0.ULRCNXM:user/release-keys

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
