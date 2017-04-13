LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := GApps
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED

@echo "Building GApps"
ifeq ($(TARGET_ARCH),arm)
	@make gapps_arm
else ifeq ($(TARGET_ARCH),arm64)
	@make gapps_arm
else ifeq ($(TARGET_ARCH),x86)
	@make gapps_x86
else ifeq ($(TARGET_ARCH),x86_64)
	@echo "You're unlucky."
endif
@echo "Done."

include $(BUILD_PREBUILT)

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/out/MindTheGapps-*.zip:system/addon.d/GApps.zip