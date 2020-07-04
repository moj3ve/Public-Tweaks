ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = HV

HV_FILES = $(wildcard *.m)
HV_INSTALL_PATH = /Library/PreferenceBundles
HV_FRAMEWORKS = UIKit
HV_PRIVATE_FRAMEWORKS = Preferences OnBoardingKit
HV_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/HVprefs.plist$(ECHO_END)
