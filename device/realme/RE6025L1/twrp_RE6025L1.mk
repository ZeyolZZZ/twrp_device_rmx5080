# Release name
PRODUCT_RELEASE_NAME := RE6025L1

DEVICE_PATH := device/realme/$(PRODUCT_RELEASE_NAME)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, $(DEVICE_PATH)/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := twrp_RE6025L1
PRODUCT_DEVICE := RE6025L1
PRODUCT_BRAND := realme
PRODUCT_MODEL := RMX5080
PRODUCT_MANUFACTURER := realme
