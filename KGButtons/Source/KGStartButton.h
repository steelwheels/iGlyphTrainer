/**
 * @file	KGStartButton.h
 * @brief	Header file for KGStartButton framework
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGButton.h"
#import <KGGameData/KGGameData.h>

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

