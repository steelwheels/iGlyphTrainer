/**
 * @file	KGameStatus.m
 * @brief	Define KGameStatus class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGameStatus.h"

@implementation KGGameStatus

@synthesize state, maxGlyphNum, processedGlyphNum, currentGlyphKind ;
@synthesize currentTime, timerInterval ;

+ (NSString *) stateKeyPath
{
	return @"state" ;
}

- (instancetype) init
{
	if((self = [super init]) != nil){
		self.state		= KGIdleState ;
		
		self.currentSentence	= KGGetEmptySentence() ;
		self.currentGlyphKind	= KGNilGlyph ;

		self.maxGlyphNum	= 0 ;
		self.processedGlyphNum	= 0 ;
		
		self.currentTime	= KGNoValidTime ;
		self.timerInterval	= KGNoValidTime ;
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

- (void) setNextState: (KGGameState) nextstate withGlyphSentence: (struct KGGlyphSentence) sentence withGlyphKind: (KGGlyphKind) kind
      withMaxGlyphNum: (unsigned int) maxnum withProcessedGlyphNum: (unsigned int) procnum
{
	self.currentSentence	= sentence ;
	self.currentGlyphKind	= kind ;
	self.maxGlyphNum	= maxnum ;
	self.processedGlyphNum	= procnum ;
	self.state		= nextstate ;
}

@end
