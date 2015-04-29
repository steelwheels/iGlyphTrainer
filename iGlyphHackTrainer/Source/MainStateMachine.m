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
- (void) evaluateState ;
@end

@interface MainStateMachine (DisplayQuestionState) <CNCountTimerDelegate>
@end

@implementation MainStateMachine

- (instancetype) initWithStatus: (KGGameStatus *) status
{
	if((self = [super init]) != nil){
		gameStatus = status ;
		countDownTimer = nil ;
		KGInitGlyphStrokeArray(&inputStrokes) ;
	}
	return self ;
}

- (void) setNextState: (KGGameState) newstate
{
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
			switch(newstate){
				case KGIdleState: {
					[self idleState] ;
				} break ;
				case KGInputAnswerState: {
					/* No change */
				} break ;
				case KGDisplayQuestionState: {
					/* Can not happen */
					puts("Invalid trans") ;
				} break ;
				case KGEvaluateState: {
					[self evaluateState] ;
				} break ;
			}
		} break ;
		case KGEvaluateState: {
			switch(newstate){
				case KGIdleState: {
					[self idleState] ;
				} break ;
				case KGInputAnswerState: {
					/* Can not happen */
					puts("Invalid trans") ;
				} break ;
				case KGDisplayQuestionState: {
					/* Can not happen */
					puts("Invalid trans") ;
				} break ;
				case KGEvaluateState: {
					/* No change */
				} break ;
			}
		} break ;
	}
}

- (void) start
{
	[self setNextState: KGDisplayQuestionState] ;
}

- (void) stop
{
	[self setNextState: KGIdleState] ;
}

- (void) glyphEditingEnded: (const struct KGGlyphStroke *) stroke
{
	switch(gameStatus.state){
		case KGIdleState:
		case KGDisplayQuestionState:
		case KGEvaluateState: {
			
		} break ;
		case KGInputAnswerState: {
			/* Keep the input stroke */
			KGAddStrokeToArray(&inputStrokes, stroke) ;

			struct KGGlyphSentence sentence = gameStatus.currentSentence ;
			unsigned int index = gameStatus.currentGlyphIndex ;
			printf("*** %s current index : %u\n", __func__, index) ;
			if(sentence.wordNum <= index + 1){
				[self setNextState: KGEvaluateState] ;
			} else {
				gameStatus.currentGlyphIndex += 1 ;
				gameStatus.state = KGInputAnswerState ;
			}
		} break ;
	}
}

- (void) idleState
{
	struct KGGlyphSentence sentence = KGGetEmptySentence() ;
	[gameStatus setNextState: KGIdleState withGlyphSentence: sentence] ;
}

- (void) questionState
{
	struct KGGlyphSentence sentence = SelectGlyphSentence() ;
	unsigned int maxnum = sentence.wordNum ;
	[gameStatus setNextState: KGDisplayQuestionState withGlyphSentence: sentence] ;
	
	countDownTimer = [[CNCountTimer alloc] init] ;
	[countDownTimer repeatWithCount: maxnum - 1
			   withInterval: 1.0
			   withDelegate: self] ;
}

- (void) answerState
{
	struct KGGlyphSentence sentence = gameStatus.currentSentence ;
	[gameStatus setNextState: KGInputAnswerState withGlyphSentence: sentence] ;

	KGInitGlyphStrokeArray(&inputStrokes) ;
	double timelimit = KGCalcTimeForHacking(&sentence) ;
	double interval  = 0.2 ;
	
	gameStatus.currentTime		= 0.0 ;
	gameStatus.timerInterval	= interval ;
	countDownTimer = [[CNCountTimer alloc] init] ;
	[countDownTimer repeatWithCount: timelimit / interval
			   withInterval: interval
			   withDelegate: self] ;
}

- (void) evaluateState
{
	struct KGGlyphSentence sentence = gameStatus.currentSentence ;
	[gameStatus setNextState: KGEvaluateState withGlyphSentence: sentence] ;
	
	/* Transfer to next */
	KGDestroyGlyphStrokeArray(&inputStrokes) ;
	[self setNextState: KGIdleState] ;
}

@end

@implementation MainStateMachine (DisplayQuestionState)

- (void) repeatForCount: (unsigned int) count
{
	(void) count ;
	switch(gameStatus.state){
		case KGIdleState: {
			/* Do nothing */
		} break ;
		case KGDisplayQuestionState: {
			struct KGGlyphSentence sentence = gameStatus.currentSentence ;
			unsigned int index = gameStatus.currentGlyphIndex ;
			if(index < sentence.wordNum-1){
				gameStatus.currentGlyphIndex = ++index ;
			}
			gameStatus.state = KGDisplayQuestionState ;
		} break ;
		case KGInputAnswerState: {
			gameStatus.currentTime += gameStatus.timerInterval ;
			gameStatus.state = KGInputAnswerState ;
		} break ;
		case KGEvaluateState: {
			/* Do nothing */
		} break ;
	}
}

- (void) repeatDone
{
	switch(gameStatus.state){
		case KGIdleState: {
			/* Do nothing */
		} break ;
		case KGDisplayQuestionState: {
			gameStatus.currentGlyphIndex = 0 ;
			[self setNextState: KGInputAnswerState] ;
		} break ;
		case KGInputAnswerState: {
			gameStatus.currentTime		= KGNoValidTime ;
			gameStatus.timerInterval	= KGNoValidTime ;
			[self setNextState: KGEvaluateState] ;
		} break ;
		case KGEvaluateState: {
			/* Do nothing */
		} break ;
	}
}

@end



