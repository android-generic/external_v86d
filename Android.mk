# Copyright 2011, The Android-x86 Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

KERNEL_DIR ?= kernel

use_uapi = $(firstword $(wildcard $(addprefix $(KERNEL_DIR)/include/,uapi/$(1) $(1))))

LOCAL_CFLAGS += \
	-include $(call use_uapi,video/uvesafb.h) \
	-include $(call use_uapi,linux/connector.h)

LOCAL_SRC_FILES := \
	v86.c \
	v86_common.c

LOCAL_SRC_FILES_x86 := \
	v86_lrmi.c \
	lrmi/lrmi.c \
	lrmi/x86-common.c

LOCAL_SRC_FILES_x86_64 := \
	v86_mem.c \
	v86_x86emu.c \
	x86emu/decode.c \
	x86emu/fpu.c \
	x86emu/ops.c \
	x86emu/ops2.c \
	x86emu/prim_ops.c \
	x86emu/sys.c

LOCAL_C_INCLUDES_x86 := $(LOCAL_PATH)/lrmi
LOCAL_C_INCLUDES_x86_64 := $(LOCAL_PATH)/x86emu

LOCAL_MODULE := v86d
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT_SBIN)

include $(BUILD_EXECUTABLE)
