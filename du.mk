# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Enhanced NFC
$(call inherit-product, vendor/du/config/nfc_enhanced.mk)

# Inherit from the common product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Boobanimation
TARGET_BOOTANIMATION_SIZE := 720x480

# no DSPManager for us
TARGET_NO_DSPMANAGER := true

# Inherit from our custom product configuration
$(call inherit-product, vendor/du/config/common_full_phone.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/oppo/find7/device.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := du_find7
PRODUCT_DEVICE := find7
PRODUCT_BRAND := OPPO
PRODUCT_MODEL := FIND7
PRODUCT_MANUFACTURER := OPPO

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_PRODUCT=FIND7 \
    TARGET_DEVICE=FIND7 \
    BUILD_FINGERPRINT=5.0/LRX21M/1426582430:user/release-keys \
    PRIVATE_BUILD_DESC="msm8974-user 5.0 LRX21M 193 release-keys"

# Inline kernel
TARGET_KERNEL_SOURCE := kernel/oppo/msm8974
TARGET_KERNEL_CONFIG := msm8974_find7_defconfig

# Inherit from proprietary blobs
$(call inherit-product, vendor/oppo/find7a/find7a-vendor.mk)

