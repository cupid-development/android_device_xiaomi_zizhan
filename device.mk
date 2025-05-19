#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from xiaomi sm8450-common
$(call inherit-product, device/xiaomi/sm8450-common/common.mk)

# Inherit from the proprietary version
$(call inherit-product, vendor/xiaomi/zizhan/zizhan-vendor.mk)

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths_waipio_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/mixer_paths_waipio_mtp.xml \
    $(LOCAL_PATH)/audio/resourcemanager_waipio_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/resourcemanager_waipio_mtp.xml \
    $(LOCAL_PATH)/audio/usecaseKvManager.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usecaseKvManager.xml

# Display configurations
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/display/display_config_inner.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4630946220589295746.xml \
    $(LOCAL_PATH)/display/display_config_outer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4630946220589295747.xml \
    $(LOCAL_PATH)/display/display_layout_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_layout_configuration.xml

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
