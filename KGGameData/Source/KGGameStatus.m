/**
 * @file	KGameStatus.m
 * @brief	Define KGameStatus class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGameStatus.h"

@implementation KGGameStatus

@synthesize state, maxGlyphNum, processedGlyphNum, presentingGlyph ;

+ (NSString *) stateKeyPath
{
	return @"state" ;
}

- (instancetype) init
{
	if((self = [super init]) != nil){
		self.state		= KGIdleState ;
		self.maxGlyphNum	= 0 ;
		self.processedGlyphNum	= 0 ;
	}
	return self ;
}

- (void) addStateObserver: (NSObject *) observer
{
	[super addObserver: observer
		forKeyPath: [KGGameStatus stateKeyPath]
		   options: NSKeyValueObservingOptionNew
		   context: nil] ;
}

@end
