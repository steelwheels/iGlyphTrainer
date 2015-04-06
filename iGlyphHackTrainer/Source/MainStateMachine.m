/**
 * @file	MainStateMachine.h
 * @brief	Define MainStateMachine class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "MainStateMachine.h"

static MainStateMachine *		sharedStateMachine ;

@interface MainStateMachine ()
- (void) transferFromIdleToQuestion ;
@end

@implementation MainStateMachine

+ (void) initialize
{
	static dispatch_once_t once;
	dispatch_once( &once, ^{
		sharedStateMachine = [[MainStateMachine alloc] init] ;
	});
}

+ (MainStateMachine *) sharedMainStateMachine
{
	return sharedStateMachine ;
}

- (instancetype) initWithGameStatus: (KGGameStatus *) status
{
	if((self = [super init]) != nil){
		gameStatus = status ;
	}
	return self ;
}

- (void) start
{
	switch(gameStatus.state){
		case KGIdleState: {
			[self transferFromIdleToQuestion] ;
		} break ;
		default: {
			/* do nothing */
		} break ;
	}
}

- (void) transferFromIdleToQuestion
{
	
}

@end
