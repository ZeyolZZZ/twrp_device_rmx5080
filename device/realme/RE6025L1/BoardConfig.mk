DEVICE_PATH := device/realme/RE6025L1

# ---- 架构 ----
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_USES_64_BIT_BINDER := true
TARGET_SUPPORTS_64_BIT_APPS := true
TARGET_IS_64_BIT := true

TARGET_BOARD_PLATFORM := mt6899
TARGET_BOOTLOADER_BOARD_NAME := mt6899

# ---- 分区结构（只影响运行时的识别，不参与镜像构建）----
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    init_boot \
    system \
    system_ext \
    product \
    vendor \
    odm \
    vendor_boot
BOARD_USES_METADATA_PARTITION := true
BOARD_USES_RECOVERY_AS_BOOT := false
BOARD_INCLUDE_RECOVERY_DTBO := true

# ---- 预编译内核（不自己编）----
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel

# ---- TWRP ----
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TW_THEME := portrait_hdpi
TW_USE_TOOLBOX := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_SKIP_COMPATIBILITY_CHECK := true
TW_EXCLUDE_TWRPAPP := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
