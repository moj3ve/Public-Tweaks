ARCHS = arm64 arm64e

export SDKVERSION = 13.4

TARGET = ::13.0

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Mavalry

Mavalry_FILES = Mavalry.xm
Tweak.xm_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += mavalryprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
