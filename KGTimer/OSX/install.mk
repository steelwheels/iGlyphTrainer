#
# install.mk
#

SRCROOT		?= ..

PRODUCT		= KCTimer

install: dummy
	xcodebuild install -target $(PROJECT_NAME) -project $(PROJECT_NAME).xcodeproj -configuration Release DSTROOT=/ ONLY_ACTIVE_ARCH=NO 

dummy:

