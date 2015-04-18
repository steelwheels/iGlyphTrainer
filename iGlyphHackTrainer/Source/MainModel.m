/**
 * @file	MainModel.m
 * @brief	Define MainModel class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "MainModel.h"
#import "AppDelegate.h"

static inline AppDelegate *
sharedAppDelegate(void)
{
	UIApplication * app = [UIApplication sharedApplication] ;
	return app.delegate ;
}

@implementation MainModel

+ (KGGameStatus *) sharedStatus
{
	AppDelegate * delegate = sharedAppDelegate() ;
	return delegate.status ;
}

+ (MainStateMachine *)	sharedStateMachine
{
	AppDelegate * delegate = sharedAppDelegate() ;
	return delegate.stateMachine ;
}

@end
