#
# install.mk
#

INSTALL_PATH	= $(HOME)/local
LIB_NAME	= lib${PROJECT_NAME}.a
CONFIGURATION	= Release

build_command  = xcodebuild build -target $(PROJECT_NAME) \
	-project $(PROJECT_NAME).xcodeproj \
	-configuration $(CONFIGURATION) \
	ONLY_ACTIVE_ARCH=NO \
	BUILD_DIR=$(BUILD_DIR) \
	BUILD_ROOT=$(BUILD_ROOT)

all: build_library install_library install_header install_resource

build_library: dummy
	$(build_command) -sdk iphoneos
	$(build_command) -sdk iphonesimulator

install_library: dummy
	mkdir -p $(INSTALL_PATH)/lib
	lipo -create -output $(INSTALL_PATH)/lib/$(LIB_NAME) \
	  ${BUILD_DIR}/${CONFIGURATION}-iphoneos/$(LIB_NAME) \
	  ${BUILD_DIR}/${CONFIGURATION}-iphonesimulator/$(LIB_NAME)

install_header: dummy
	mkdir -p $(INSTALL_PATH)/include/$(PROJECT_NAME)
	install -m 0644 ${BUILD_DIR}/${CONFIGURATION}-iphoneos/include/$(PROJECT_NAME)/*.h \
	  $(INSTALL_PATH)/include/$(PROJECT_NAME)

install_resource: dummy
	mkdir -p $(INSTALL_PATH)/resource
	find $(PROJECT_DIR) -name "*.xib" -exec install -m 0644 "{}" $(INSTALL_PATH)/resource ";"

dummy:


