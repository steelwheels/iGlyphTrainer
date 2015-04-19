/**
 * @file	MainStateMachine.h
 * @brief	Define MainStateMachine class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "MainStateMachine.h"

@interface MainStateMachine ()
- (BOOL) transferFromIdleToQuestion ;
- (void) questionState ;
@end

@interface MainStateMachine (DisplayQuestionState) <CNCountTimerDelegate>
@end

@implementation MainStateMachine

- (instancetype) initWithStatus: (KGGameStatus *) status
{
	if((self = [super init]) != nil){
		gameStatus = status ;
		countDownTimer = nil ;
	}
	return self ;
}

- (void) start
{
	puts("* start state") ;
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
	puts("* question state") ;
	gameStatus.state = KGDisplayQuestionState ;
	
	countDownTimer = [[CNCountTimer alloc] init] ;
	[countDownTimer repeatWithCount: gameStatus.maxGlyphNum
			   withInterval: 1.0
			   withDelegate: self] ;
}

@end

@implementation MainStateMachine (DisplayQuestionState)

- (void) repeatForCount: (unsigned int) count
{
	printf("repeatForCount: %u\n", count) ;
	gameStatus.currentGlyphKind = gameStatus.currentSentence.wordArray.glyphWords[count] ;
	gameStatus.state = KGDisplayQuestionState ;
}

- (void) repeatDone
{
	gameStatus.state = KGIdleState ;
}

@end


