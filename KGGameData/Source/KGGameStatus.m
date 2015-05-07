/**
 * @file	KGameStatus.m
 * @brief	Define KGameStatus class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGameStatus.h"

@implementation KGGameStatus

@synthesize state, currentSentence, currentGlyphIndex ;
@synthesize currentTime, timerInterval ;

+ (NSString *) stateKeyPath
{
	return @"state" ;
}

+ (const char *) stateToString: (KGGameState) state
{
	const char * result = "?" ;
	switch(state){
		case KGIdleState: {
			result = "idle" ;
		} break ;
		case KGDisplayQuestionState: {
			result = "question" ;
		} break ;
		case KGInputAnswerState: {
			result = "answer" ;
		} break ;
		case KGEvaluateState: {
			result = "evaluate" ;
		} break ;
	}
	return result ;
}

- (instancetype) init
{
	if((self = [super init]) != nil){
		self.state		= KGIdleState ;
		
		self.currentSentence	= KGGetEmptySentence() ;
		self.currentGlyphIndex	= 0 ;
		
		self.currentTime	= KGNoValidTime ;
		self.timerInterval	= KGNoValidTime ;
		
		self.correctAnswerNum	= 0 ;
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

- (void) setNextState: (KGGameState) nextstate withGlyphSentence: (struct KGGlyphSentence) sentence
{
	self.currentSentence	= sentence ;
	self.currentGlyphIndex	= 0 ;
	self.currentTime	= KGNoValidTime ;
	self.timerInterval	= KGNoValidTime ;
	self.correctAnswerNum	= 0 ;
	self.state		= nextstate ;
}

@end
