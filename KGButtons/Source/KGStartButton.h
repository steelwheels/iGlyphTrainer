/**
 * @file	KGStartButton.h
 * @brief	Header file for KGStartButton framework
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGButton.h"
#import <KGGameData/KGGameData.h>

@protocol  KGStartButtonDelegate <NSObject>
- (void) startButtonPressed ;
@end

@interface KGStartButton : KGButton
{
	id <KGStartButtonDelegate>	buttonPressDelegate ;
}

- (void) setButtonPressDelegate: (id <KGStartButtonDelegate>) delegate ;
@end

