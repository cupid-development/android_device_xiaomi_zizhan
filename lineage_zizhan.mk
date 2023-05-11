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

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
