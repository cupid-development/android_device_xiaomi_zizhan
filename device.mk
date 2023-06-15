#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from xiaomi sm8450-common
$(call inherit-product, device/xiaomi/sm8450-common/common.mk)

# Inherit from the proprietary version
$(call inherit-product, vendor/xiaomi/zizhan/zizhan-vendor.mk)

# Display configurations
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display/display_id_4630946220589295746.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/displayconfig/display_id_4630946220589295746.xml \
    $(LOCAL_PATH)/configs/display/display_id_4630946220589295747.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/displayconfig/display_id_4630946220589295747.xml

# Hinge angle sensor
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.hinge_angle.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_cape/android.hardware.sensor.hinge_angle.xml

# Overlay
PRODUCT_PACKAGES += \
    ApertureResZizhan \
    FrameworksResZizhan \
    NfcResZizhan \
    SettingsProviderResZizhan \
    SettingsResZizhan \
    SystemUIResZizhan \
    WifiResZizhan

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
