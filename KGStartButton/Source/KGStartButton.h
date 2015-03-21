/**
 * @file	KGStartButton.h
 * @brief	Header file for KGStartButton framework
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGStartButtonType.h"
#import <KGGameData/KGGameData.h>

//! Project version number for KGStartButton.
FOUNDATION_EXPORT double KGStartButtonVersionNumber;

//! Project version string for KGStartButton.
FOUNDATION_EXPORT const unsigned char KGStartButtonVersionString[];

#if TARGET_OS_IPHONE
#	define KGButton		UIButton
#else
#	define KGButton		NSButton
#endif

@protocol  KGStartButtonDelegate <NSObject>
- (void) startButtonPressedWithStatus: (KGGameStatus) status ;
@end

@interface KGStartButton : KGButton
{
	KGGameProgress *		gameProgress ;
	id <KGStartButtonDelegate>	buttonPressDelegate ;
}

- (void) setGameProgress: (KGGameProgress *) progress ;
- (void) setButtonPressDelegate: (id <KGStartButtonDelegate>) delegate ;
@end

#undef KGButton
