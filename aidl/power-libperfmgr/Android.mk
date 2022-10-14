ifneq (,$(findstring hardware/google/interfaces, $(PRODUCT_SOONG_NAMESPACES)))
ifneq (,$(findstring hardware/google/pixel, $(PRODUCT_SOONG_NAMESPACES)))

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_RELATIVE_PATH := hw

LOCAL_SHARED_LIBRARIES := \
    android.hardware.power-V2-ndk_platform \
    libbase \
    libbinder_ndk \
    libcutils \
    libdl \
    liblog \
    libperfmgr \
    libprocessgroup \
    libutils \
    pixel-power-ext-V1-ndk_platform

LOCAL_SRC_FILES := \
    service.cpp \
    InteractionHandler.cpp \
    Power.cpp \
    PowerExt.cpp \
    PowerHintSession.cpp \
    PowerSessionManager.cpp

LOCAL_CFLAGS := -Wno-unused-parameter -Wno-unused-variable

ifneq ($(TARGET_POWERHAL_MODE_EXT),)
    LOCAL_CFLAGS += -DMODE_EXT
    LOCAL_SRC_FILES += ../../../../$(TARGET_POWERHAL_MODE_EXT)
endif

ifneq ($(TARGET_TAP_TO_WAKE_NODE),)
    LOCAL_CFLAGS += -DTAP_TO_WAKE_NODE=\"$(TARGET_TAP_TO_WAKE_NODE)\"
endif

LOCAL_MODULE := android.hardware.power-service.xiaomi-libperfmgr
LOCAL_INIT_RC := android.hardware.power-service.xiaomi-libperfmgr.rc
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true
LOCAL_VINTF_FRAGMENTS := android.hardware.power-service.xiaomi.xml

include $(BUILD_EXECUTABLE)

endif
endif
