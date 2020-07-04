INSTALL_TARGET_PROCESSES = SpringBoard
ARCHS = arm64 arm64e

# this tweak only works for iOS 13, well actually i dont know since i dont have a device on iOS 12 so rip.
export TARGET = iphone:clang:13.4:latest

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HV

HV_FILES = Tweak.xm
HV_CFLAGS = -fobjc-arc
HV_FRAMEWORKS = UIKit 

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += prefs
include $(THEOS_MAKE_PATH)/aggregate.mk
