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
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt/dtb
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

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

# ---- 分区大小（没这几行 AOSP 根本不会去构建对应镜像，
#      表现为 "ninja: no work to do"）----
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 67108864
BOARD_FLASH_BLOCK_SIZE := 4096

# vendor_boot 的头部要求
BOARD_BOOT_HEADER_VERSION := 4
BOARD_VENDOR_BOOTIMAGE_HEADER_VERSION := 4
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_INIT_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

# ---- vendor_boot 的 recovery 片段（不加这几行，产出的 vendor_boot 只有 12KB 空壳）----
BOARD_USES_RECOVERY_AS_BOOT := false
BOARD_VENDOR_RAMDISK_FRAGMENTS := recovery
BOARD_VENDOR_RAMDISK_FRAGMENT.recovery.PREBUILT := $(DEVICE_PATH)/prebuilt/ramdisk-recovery.cpio
BOARD_VENDOR_RAMDISK_FRAGMENT.recovery.MKBOOTIMG_ARGS := --ramdisk_type RECOVERY

# TWRP 自己的板级配置（BoardConfigKernel.mk + BoardConfigSoong.mk）
include vendor/twrp/config/BoardConfigTWRP.mk
