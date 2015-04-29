#
#
#

IOS_TMP	= tmpi
OSX_TMP	= tmpx

all: KGGlyphData KGGameData KGGlyphGraphics KGControls \
     KGGlyphGraphics KGGlyphView

iGlyphHackTrainer: dummy
	(cd iGlyphHackTrainer/iOS && \
	 make PROJECT_NAME=iGlyphHackTrainer \
	      PROJECT_DIR=. \
	      BUILD_DIR=~/build/iGlyphHackTrainer.$(IOS_TMP) \
	      BUILD_ROOT=~/build/iGlyphHackTrainer.$(IOS_TMP) \
	      -f ../../Script/install.mk \
	)
	(cd iGlyphHackTrainer/OSX && \
	 make PROJECT_NAME=iGlyphHackTrainer \
	      PROJECT_DIR=. \
	      BUILD_DIR=~/build/iGlyphHackTrainer.$(OSX_TMP) \
	      BUILD_ROOT=~/build/iGlyphHackTrainer.$(OSX_TMP) \
	      -f ../../Script/install-osx.mk \
	)

KGControls: dummy
	(cd KGControls/iOS && \
	 make PROJECT_NAME=KGControls \
	      PROJECT_DIR=. \
	      BUILD_DIR=~/build/KGControls.$(IOS_TMP) \
	      BUILD_ROOT=~/build/KGControls.$(IOS_TMP) \
	      -f ../../Script/install.mk \
	)
	(cd KGControls/OSX && \
	 make PROJECT_NAME=KGControls \
	      PROJECT_DIR=. \
	      BUILD_DIR=~/build/KGControls.$(OSX_TMP) \
	      BUILD_ROOT=~/build/KGControls.$(OSX_TMP) \
	      -f ../../Script/install-osx.mk \
	)

KGGlyphGraphics: dummy
	(cd KGGlyphGraphics/iOS && \
	 make PROJECT_NAME=KGGlyphGraphics \
	      PROJECT_DIR=. \
	      BUILD_DIR=~/build/KGGlyphGraphics.$(IOS_TMP) \
	      BUILD_ROOT=~/build/KGGlyphGraphics.$(IOS_TMP) \
	      -f ../../Script/install.mk \
	)
	(cd KGGlyphGraphics/OSX && \
	 make PROJECT_NAME=KGGlyphGraphics \
	      PROJECT_DIR=. \
	      BUILD_DIR=~/build/KGGlyphGraphics.$(OSX_TMP) \
	      BUILD_ROOT=~/build/KGGlyphGraphics.$(OSX_TMP) \
	      -f ../../Script/install-osx.mk \
	)

KGGlyphView: dummy
	(cd KGGlyphView/iOS && \
	 make PROJECT_NAME=KGGlyphView \
	      PROJECT_DIR=. \
	      BUILD_DIR=~/build/KGGlyphView.$(IOS_TMP) \
	      BUILD_ROOT=~/build/KGGlyphView.$(IOS_TMP) \
	      -f ../../Script/install.mk \
	)

KGGameData: dummy
	(cd KGGameData/iOS && \
	 make PROJECT_NAME=KGGameData \
	      PROJECT_DIR=. \
	      BUILD_DIR=~/build/KGGameData.$(IOS_TMP) \
	      BUILD_ROOT=~/build/KGGameData.$(IOS_TMP) \
	      -f ../../Script/install.mk \
	)
	(cd KGGameData/OSX && \
	 make PROJECT_NAME=KGGameData \
	      PROJECT_DIR=. \
	      BUILD_DIR=~/build/KGGameData.$(OSX_TMP) \
	      BUILD_ROOT=~/build/KGGameData.$(OSX_TMP) \
	      -f ../../Script/install-osx.mk \
	)

KGGlyphData: dummy
	(cd KGGlyphData/iOS && \
	 make PROJECT_NAME=KGGlyphData \
	      PROJECT_DIR=. \
	      BUILD_DIR=~/build/KGGlyphData.$(IOS_TMP) \
	      BUILD_ROOT=~/build/KGGlyphData.$(IOS_TMP) \
	      -f ../../Script/install.mk \
	)
	(cd KGGlyphData/OSX && \
	 make PROJECT_NAME=KGGlyphData \
	      PROJECT_DIR=. \
	      BUILD_DIR=~/build/KGGlyphData.$(OSX_TMP) \
	      BUILD_ROOT=~/build/KGGlyphData.$(OSX_TMP) \
	      -f ../../Script/install-osx.mk \
	)

dummy:

