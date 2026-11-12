LOCAL_PATH := $(call my-dir)

# 把本设备树的 recovery/root/ 内容打进 recovery ramdisk
include $(CLEAR_VARS)
LOCAL_MODULE := device_recovery_root
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)
LOCAL_SRC_FILES := $(call all-subdir-makefiles)
LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
LOCAL_MODULE_TAGS := optional
include $(BUILD_PHONY_PACKAGE)
