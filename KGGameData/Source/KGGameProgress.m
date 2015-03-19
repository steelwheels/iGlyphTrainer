/**
 * @file	KGameProgress.m
 * @brief	Define KGameProgress class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGameProgress.h"

@implementation KGGameProgress

@synthesize gameStatus ;

- (instancetype) init
{
	if((self = [super init]) != nil){
		gameStatus = KGIdleStatus ;
	}
	return self ;
}

- (void) addStatusObserver: (NSObject *) observer
{
	[super addObserver: observer
		forKeyPath: @"gameStatus"
		   options: NSKeyValueObservingOptionNew
		   context: nil] ;
}

@end
