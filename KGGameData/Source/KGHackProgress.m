/**
 * @file	KGHackProgress.m
 * @brief	Define KGHackProgress class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGHackProgress.h"

@implementation KGHackProgress

@synthesize maxProgress ;
@synthesize currentProgress ;

- (instancetype) initWithMaxProgress: (unsigned int) val
{
	if((self = [super init]) != nil){
		self.maxProgress = val ;
		self.currentProgress = 0 ;
	}
	return self ;
}

- (void) addCurrentProgressObserver: (NSObject *) observer
{
	[super addObserver: observer
	        forKeyPath: @"currentProgress"
		   options: NSKeyValueObservingOptionNew
		   context: nil] ;
	[super addObserver: observer
		forKeyPath: @"maxProgress"
		   options: NSKeyValueObservingOptionNew
		   context: nil] ;
}

@end
