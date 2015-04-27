/**
 * @file	KGameStatus.h
 * @brief	Define KGameStatus class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <Coconut/Coconut.h>
#import <KGGlyphData/KGGlyphData.h>

#define KGLimitProgressCount			5

typedef enum {
	KGIdleState,
	KGDisplayQuestionState,
	KGInputAnswerState,
	KGEvaluateState
} KGGameState ;

static const double	KGNoValidTime		= -1.0 ;

@interface KGGameStatus : CNNotifierObject

@property (assign, nonatomic) KGGameState	state ;

/**
 * questionGlyph has valid value when the state is KGDisplayQuestionState
 */
@property (assign, nonatomic) struct KGGlyphSentence	currentSentence ;
@property (assign, nonatomic) KGGlyphKind		currentGlyphKind ;

@property (assign, nonatomic) unsigned int		maxGlyphNum ;
@property (assign, nonatomic) unsigned int		processedGlyphNum ;
@property (assign, nonatomic) double			currentTime ;
@property (assign, nonatomic) double			timerInterval ;

+ (NSString *) stateKeyPath ;

- (instancetype) init ;
- (void) addStateObserver: (NSObject *) observer ;

- (void) setNextState: (KGGameState) nextstate withGlyphSentence: (struct KGGlyphSentence) sentence withGlyphKind: (KGGlyphKind) kind
      withMaxGlyphNum: (unsigned int) maxnum withProcessedGlyphNum: (unsigned int) procnum ;

@end
