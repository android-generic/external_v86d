# Copyright 2011, The Android-x86 Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_CFLAGS := \
	-D__HAS_LONG_LONG__ \
	-Wno-unused-parameter

LOCAL_CFLAGS_x86 := \
	-DIF_MASK=X86_EFLAGS_IF \
	-DIOPL_MASK=X86_EFLAGS_IOPL \
	-DTF_MASK=X86_EFLAGS_TF \
	-DVIF_MASK=X86_EFLAGS_VIF

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

include $(BUILD_EXECUTABLE)
