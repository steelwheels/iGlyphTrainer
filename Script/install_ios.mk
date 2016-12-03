#
# install_ios.mk
#
# Reference URL: http://stackoverflow.com/questions/28652650/how-to-build-cocoa-touch-framework-for-i386-and-x86-64-architecture
#

INSTALL_PATH ?= $(HOME)/local/Frameworks

OS_DIR     = $(INSTALL_PATH)/iphoneos
SIM_DIR	   = $(INSTALL_PATH)/iphonesimulator

install: dummy
	# Build framework for device
	xcodebuild install -scheme $(PROJECT_NAME) \
	  -project $(PROJECT_NAME).xcodeproj \
	  -configuration Release \
	  -sdk iphoneos \
	  ONLY_ACTIVE_ARCH=NO DSTROOT=/ \
	  INSTALL_PATH=$(INSTALL_PATH)/iphoneos

	# Build framework for simulator
	xcodebuild install -scheme $(PROJECT_NAME) \
	  -project $(PROJECT_NAME).xcodeproj \
	  -configuration Release \
	  -sdk iphonesimulator \
	  ONLY_ACTIVE_ARCH=NO DSTROOT=/ \
	  INSTALL_PATH=$(INSTALL_PATH)/iphonesimulator

 	# Copy framework
	(cd $(OS_DIR); tar cf - $(PROJECT_NAME).framework) \
	| (cd $(INSTALL_PATH) ; tar xfv -) 
	(cd $(SIM_DIR)/$(PROJECT_NAME).framework/Modules ; \
	  tar cf - $(PROJECT_NAME).swiftmodule) \
	| (cd $(INSTALL_PATH)/$(PROJECT_NAME).framework/Modules ; tar xfv -)

	# Merge frameworks
	lipo -create \
	  -output $(INSTALL_PATH)/$(PROJECT_NAME).framework/$(PROJECT_NAME) \
	  $(OS_DIR)/$(PROJECT_NAME).framework/$(PROJECT_NAME) \
	  $(SIM_DIR)/$(PROJECT_NAME).framework/$(PROJECT_NAME) 

dummy:

