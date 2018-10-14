LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := src/zip.c src/zipfile.c src/zipup.c src/fileio.c src/util.c src/globals.c \
                   src/crypt.c src/ttyio.c src/crc32.c src/zbz2err.c src/deflate.c \
                   src/trees.c src/unix/unix.c

LOCAL_C_INCLUDES := src src/unix

LOCAL_CFLAGS := -O2 -Wall -DUNIX -D__BIONIC__ -DNO_LARGE_FILE_SUPPORT \
                -DHAVE_DIRENT_H -DHAVE_TERMIOS_H

LOCAL_CFLAGS += -Wno-error

LOCAL_ARM_MODE := arm

LOCAL_MODULE := zip-r
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/sbin
LOCAL_LDFLAGS += -Wl,-dynamic-linker,/sbin/linker64
include $(BUILD_EXECUTABLE)

