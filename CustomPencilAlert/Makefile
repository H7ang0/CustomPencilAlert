ARCHS = arm64 arm64e
TARGET := iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CustomPencilAlert

CustomPencilAlert_FILES = Tweak.x
CustomPencilAlert_CFLAGS = -fobjc-arc
CustomPencilAlert_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk 