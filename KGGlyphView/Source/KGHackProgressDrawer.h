/**
 * @file	KGHackProgressDrawer.h
 * @brief	Define KGHackProgressDrawer class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphViewType.h"

typedef enum {
	KGNotHackedAtDisplayState,
	KGHackedAtDisplayState,
	
	KGNotHackedAtEvaluationState,
	KGCorrectHackedAtEvaluationState,
	KGWrongHackedAtEvaluationState
} KGHackState ;

@interface KGHackProgressDrawer : NSObject <KCGraphicsDrawing>
{
	
	struct CNHexagon	hackHexagon[KGLimitProgressCount] ;
	KGHackState		hackStates[KGLimitProgressCount] ;
	
	unsigned int		maxGlyphNum ;
	unsigned int		nextIndex ;
	
	CGRect			previousBounds ;
	unsigned int		prevMaxGlyphNum ;
}

- (instancetype) init ;

- (void) setMaxGlyphNum: (unsigned int) maxnum ;
- (void) clearStates ;
- (void) addNextHackState: (KGHackState) state ;

@end
