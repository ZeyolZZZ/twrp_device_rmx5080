$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, device/realme/RE6025L1/device.mk)
$(call inherit-product, vendor/twrp/config/common.mk)

PRODUCT_NAME := twrp_RE6025L1
PRODUCT_DEVICE := RE6025L1
PRODUCT_BRAND := realme
PRODUCT_MODEL := RMX5080
PRODUCT_MANUFACTURER := realme
