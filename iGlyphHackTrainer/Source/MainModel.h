/**
 * @file	MainModel.h
 * @brief	Define MainModel class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <KGGameData/KGGameData.h>
#import "MainStateMachine.h"

@interface MainModel : NSObject

+ (KGGameStatus *)	sharedStatus ;
+ (MainStateMachine *)	sharedStateMachine ;

@end
