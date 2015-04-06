/**
 * @file	MainStateMachine.h
 * @brief	Define MainStateMachine class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <KGGameData/KGGameData.h>

@interface MainStateMachine : NSObject
{
	KGGameStatus *		gameStatus ;
}

+ (void) initialize ;
+ (MainStateMachine *) sharedMainStateMachine ;

- (instancetype) initWithGameStatus: (KGGameStatus *) status ;

- (void) start ;

@end

