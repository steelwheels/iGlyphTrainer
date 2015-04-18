/**
 * @file	AppDelegate.h
 * @brief	Define AppDelegate class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <KGGameData/KGGameData.h>
#import <UIKit/UIKit.h>
#import "MainStateMachine.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *		window;
@property (strong, nonatomic) KGGameStatus *		status ;
@property (strong, nonatomic) MainStateMachine *	stateMachine ;

- (instancetype) init ;

@end

