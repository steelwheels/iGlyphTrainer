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
	KGStrokeState,
	KGEvaluateState
} KGGameState ;

@interface KGGameStatus : CNNotifierObject

@property (assign, nonatomic) KGGameState	state ;
@property (assign, nonatomic) unsigned int	maxGlyphNum ;
@property (assign, nonatomic) unsigned int	processedGlyphNum ;

/**
 * questionGlyph has valid value when the state is KGDisplayQuestionState
 */
@property (assign, nonatomic) KGGlyphKind	questionGlyph ;

+ (NSString *) stateKeyPath ;

- (instancetype) init ;
- (void) addStateObserver: (NSObject *) observer ;

@end
