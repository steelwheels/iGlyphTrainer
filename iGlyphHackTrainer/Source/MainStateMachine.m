/**
 * @file	MainStateMachine.h
 * @brief	Define MainStateMachine class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "MainStateMachine.h"
#import "GlyphSentenceSelector.h"

@interface MainStateMachine ()
- (void) setNextState: (KGGameState) newstate ;
- (void) idleState ;
- (void) questionState ;
- (void) answerState ;
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

- (void) setNextState: (KGGameState) newstate
{
	dispatch_async(dispatch_get_main_queue(), ^{
		switch(gameStatus.state){
			case KGIdleState: {
				if(newstate == KGDisplayQuestionState){
					[self questionState] ;
				}
			} break ;
			case KGDisplayQuestionState: {
				switch(newstate){
					case KGIdleState: {
						[self idleState] ;
					} break ;
					case KGInputAnswerState: {
						[self answerState] ;
					} break ;
					case KGDisplayQuestionState: {
						/* No change */
					} break ;
					case KGEvaluateState: {
						[self idleState] ;
					} break ;
				}
			} break ;
			case KGInputAnswerState: {
				
			} break ;
			case KGEvaluateState: {
				
			} break ;
		}
	});
}

- (void) start
{
	[self setNextState: KGDisplayQuestionState] ;
}

- (void) idleState
{
	struct KGGlyphSentence sentence = KGGetEmptySentence() ;
	[gameStatus setNextState: KGIdleState withGlyphSentence: sentence withGlyphKind: KGNilGlyph withMaxGlyphNum: 0 withProcessedGlyphNum: 0] ;
}

- (void) questionState
{
	puts("* question state") ;
	
	struct KGGlyphSentence sentence = SelectGlyphSentence() ;
	KGGlyphKind firstkind = sentence.glyphWords[0] ;
	unsigned int maxnum = sentence.wordNum ;
	[gameStatus setNextState: KGDisplayQuestionState withGlyphSentence: sentence withGlyphKind: firstkind withMaxGlyphNum: maxnum withProcessedGlyphNum: 1] ;
	
	countDownTimer = [[CNCountTimer alloc] init] ;
	[countDownTimer repeatWithCount: maxnum - 1
			   withInterval: 1.0
			   withDelegate: self] ;
}

- (void) answerState
{
	puts("* answer state") ;
	struct KGGlyphSentence sentence = KGGetEmptySentence() ;
	[gameStatus setNextState: KGInputAnswerState withGlyphSentence: sentence withGlyphKind: KGNilGlyph withMaxGlyphNum: 0 withProcessedGlyphNum: 0] ;
}

@end

@implementation MainStateMachine (DisplayQuestionState)

- (void) repeatForCount: (unsigned int) count
{
	printf("repeatForCount: %u\n", count) ;
	gameStatus.currentGlyphKind = gameStatus.currentSentence.glyphWords[count+1] ;
	gameStatus.processedGlyphNum += 1 ;
	gameStatus.state = KGDisplayQuestionState ;
}

- (void) repeatDone
{
	gameStatus.processedGlyphNum = 0 ;
	[self setNextState: KGInputAnswerState] ;
}

@end

@implementation MainStateMachine (InputAnswerState)

- (void) glyphEditingEnded: (const struct KGGlyphStroke *) stroke
{
	(void) stroke ;
	[self setNextState: KGInputAnswerState] ;
}

- (void) glyphEditingCancelled
{
	[self setNextState: KGIdleState] ;
}

@end


