/**
 * @file	MainStateMachine.h
 * @brief	Define MainStateMachine class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "MainStateMachine.h"
#import "GlyphSentenceSelector.h"

static const BOOL doDebug	= NO ;

@interface MainStateMachine ()
- (void) setNextState: (KGGameState) newstate ;
- (void) idleState ;
- (void) questionState ;
- (void) answerState ;
- (void) evaluateState ;
@end

@interface MainStateMachine (TimerDelegates) <CNCountTimerDelegate>
@end

@interface MainStateMachine (Evaluating)
- (void) evaluateCurrentGlyph ;
@end

@implementation MainStateMachine

- (instancetype) initWithStatus: (KGGameStatus *) status
{
	if((self = [super init]) != nil){
		gameStatus = status ;
		countDownTimer = [[CNCountTimer alloc] init] ;
	}
	return self ;
}

- (void) setNextState: (KGGameState) newstate
{
	switch(gameStatus.state){
		case KGIdleState: {
			if(newstate == KGDisplayQuestionState){
				if(doDebug){
					printf("[%s] idle -> question\n", __func__) ;
				}
				[self questionState] ;
			}
		} break ;
		case KGDisplayQuestionState: {
			switch(newstate){
				case KGIdleState: {
					if(doDebug){
						printf("[%s] question -> idle\n", __func__) ;
					}
					[self idleState] ;
				} break ;
				case KGInputAnswerState: {
					if(doDebug){
						printf("[%s] question -> answer\n", __func__) ;
					}
					[self answerState] ;
				} break ;
				case KGDisplayQuestionState: {
					/* No change */
				} break ;
				case KGEvaluateState: {
					/* Can not happen */
					puts("Invalid trans") ;
				} break ;
			}
		} break ;
		case KGInputAnswerState: {
			switch(newstate){
				case KGIdleState: {
					if(doDebug){
						printf("[%s] answer -> idle\n", __func__) ;
					}
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
					if(doDebug){
						printf("[%s] answer -> evalueate\n", __func__) ;
					}
					[self evaluateState] ;
				} break ;
			}
		} break ;
		case KGEvaluateState: {
			switch(newstate){
				case KGIdleState: {
					if(doDebug){
						printf("[%s] evaluate -> idle\n", __func__) ;
					}
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
			struct KGGlyphInputStrokes strokes = gameStatus.inputStrokes ;
			KGAddGlyphStrokeToInputStrokes(&strokes, stroke) ;
			gameStatus.inputStrokes = strokes ;

			struct KGGlyphSentence sentence = gameStatus.currentSentence ;
			NSUInteger index = gameStatus.currentGlyphIndex ;
			//printf("*** %s current index : %u\n", __func__, index) ;
			if(sentence.wordNum <= index + 1){
				if(doDebug){
					printf("* %s : Invalidate timer\n", __func__) ;
				}
				[countDownTimer invalidate] ;
				//[self setNextState: KGEvaluateState] ;
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

	[countDownTimer repeatWithCount: maxnum - 1
			   withInterval: 1.0
			   withDelegate: self] ;
}

- (void) answerState
{
	struct KGGlyphSentence sentence = gameStatus.currentSentence ;
	[gameStatus setNextState: KGInputAnswerState withGlyphSentence: sentence] ;

	/* Initialize the inputted strokes */
	struct KGGlyphInputStrokes strokes = gameStatus.inputStrokes ;
	KGClearGlyphInputStrokes(&strokes) ;
	gameStatus.inputStrokes = KGMakeEmptyInputStrokes() ;

	double timelimit = KGCalcTimeForHacking(&sentence) ;
	double interval  = 0.2 ;
	
	gameStatus.currentTime		= timelimit ;
	gameStatus.timerInterval	= interval ;
	[countDownTimer repeatWithCount: timelimit / interval
			   withInterval: interval
			   withDelegate: self] ;
}

- (void) evaluateState
{
	gameStatus.currentGlyphIndex	= 0 ;
	
	gameStatus.currentTime		= KGNoValidTime ;
	gameStatus.timerInterval	= KGNoValidTime ;
	
	gameStatus.hasCorrectAnswer = NO ;
	gameStatus.correctAnswerNum = 0 ;
	[self evaluateCurrentGlyph] ;
	
	struct KGGlyphSentence sentence = gameStatus.currentSentence ;
	[gameStatus setNextState: KGEvaluateState withGlyphSentence: sentence] ;
	
	[countDownTimer repeatWithCount: sentence.wordNum - 1
			   withInterval: 1.0
			   withDelegate: self] ;
}

@end

@implementation MainStateMachine (TimerDelegates)

- (void) repeatForCount: (unsigned int) count
{
	if(doDebug){
		printf("* %s : repeat for count %u\n", __func__, count) ;
	}
	switch(gameStatus.state){
		case KGIdleState: {
			/* Do nothing */
		} break ;
		case KGDisplayQuestionState: {
			struct KGGlyphSentence sentence = gameStatus.currentSentence ;
			NSUInteger index = gameStatus.currentGlyphIndex ;
			if(index < sentence.wordNum-1){
				gameStatus.currentGlyphIndex = ++index ;
			}
			gameStatus.state = KGDisplayQuestionState ;
		} break ;
		case KGInputAnswerState: {
			gameStatus.currentTime -= gameStatus.timerInterval ;
			gameStatus.state = KGInputAnswerState ;
		} break ;
		case KGEvaluateState: {
			struct KGGlyphSentence sentence = gameStatus.currentSentence ;
			NSUInteger index = gameStatus.currentGlyphIndex ;
			
			if(index < sentence.wordNum-1){
				gameStatus.currentGlyphIndex = ++index ;
				[self evaluateCurrentGlyph] ;
			}
			gameStatus.state = KGEvaluateState ;
		} break ;
	}
}

- (void) repeatDone
{
	if(doDebug){
		printf("* %s : repeat done\n", __func__) ;
	}
	switch(gameStatus.state){
		case KGIdleState: {
			/* Do nothing */
		} break ;
		case KGDisplayQuestionState: {
			gameStatus.currentGlyphIndex = 0 ;
			[self setNextState: KGInputAnswerState] ;
		} break ;
		case KGInputAnswerState: {
			[self setNextState: KGEvaluateState] ;
		} break ;
		case KGEvaluateState: {
			if(gameStatus.correctAnswerNum == gameStatus.currentSentence.wordNum){
				gameStatus.totalSuccessNum += 1 ;
			}
			gameStatus.totalQuestionNum += 1 ;
			[self setNextState: KGIdleState] ;
		} break ;
	}
}

@end

@implementation MainStateMachine (Evaluating)

- (void) evaluateCurrentGlyph
{
	struct KGGlyphSentence sentence = gameStatus.currentSentence ;
	NSUInteger index = gameStatus.currentGlyphIndex ;
	
	/* Check the input stroke is correct or not */
	KGGlyphKind expkind = sentence.glyphWords[index] ;
	struct KGGlyphStroke expstroke = KGStrokeOfGlyph(expkind) ;
	struct KGGlyphInputStrokes instrokes = gameStatus.inputStrokes ;
	struct KGGlyphStroke instroke  = KGGlyphInputStrokeAtIndex(&instrokes, index) ;
	
	if(doDebug){
		printf("edge num: exp %lu <-> real %lu\n", (unsigned long) expstroke.edgeCount, (unsigned long) instroke.edgeCount) ;
	}
	
	if(KGCompareGlyphStrokes(&expstroke, &instroke) == 0){
		/* Correct */
		if(doDebug){
			printf("%s at index %lu -> correct\n", __func__, (unsigned long) index) ;
		}
		gameStatus.hasCorrectAnswer = YES ;
		gameStatus.correctAnswerNum += 1 ;
	} else {
		/* Not correct */
		if(doDebug){
			printf("%s at index %lu -> not correct\n", __func__, (unsigned long) index) ;
		}
		gameStatus.hasCorrectAnswer = NO ;
	}
}

@end



