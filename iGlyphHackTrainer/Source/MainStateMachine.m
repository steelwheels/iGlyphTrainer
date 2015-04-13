/**
 * @file	MainStateMachine.h
 * @brief	Define MainStateMachine class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "MainStateMachine.h"

static MainStateMachine *		sharedStateMachine ;

@interface MainStateMachine ()
- (BOOL) transferFromIdleToQuestion ;
- (void) questionState ;
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

- (instancetype) init
{
	if((self = [super init]) != nil){
		gameStatus = nil ;
	}
	return self ;
}

- (void) setGameStatus: (KGGameStatus *) status
{
	gameStatus = status ;
}

- (void) start
{
	switch(gameStatus.state){
		case KGIdleState: {
			if([self transferFromIdleToQuestion]){
				[self questionState] ;
			}
			
		} break ;
		default: {
			/* do nothing */
		} break ;
	}
}

- (BOOL) transferFromIdleToQuestion
{
	/* Select next question */
	struct KGGlyphSentence sentence = KGSelectGlyphSentence() ;
	gameStatus.currentSentence = sentence ;
	gameStatus.currentGlyphKind = sentence.wordNum > 0 ? sentence.wordArray.glyphWords[0] : KGNilGlyph ;
	gameStatus.maxGlyphNum = sentence.wordNum ;
	gameStatus.processedGlyphNum = 0 ;
	return sentence.wordNum > 0 ;
}

- (void) questionState
{
	gameStatus.state = KGDisplayQuestionState ;
}

@end

