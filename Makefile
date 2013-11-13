GO_EASY_ON_ME = 1

include theos/makefiles/common.mk

BUNDLE_NAME = WeeForAnyThing
WeeForAnyThing_FILES = WeeForAnyThingController.m
WeeForAnyThing_INSTALL_PATH = /System/Library/WeeAppPlugins/
WeeForAnyThing_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/bundle.mk

after-install::
	install.exec "killall -9 SpringBoard"
