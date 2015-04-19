/**
 * @file	KGGlyphStroke.m
 * @brief	Define KGGlyphStroke data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphStroke.h"

static struct KGGlyphStroke
makeStroke(unsigned int count, const struct KGGlyphEdge * edges)
{
	struct KGGlyphStroke result = {
		.edgeCount	= count,
		.edgeArray	= edges
	} ;
	return result ;
}

struct KGGlyphStroke
KGStrokeOfGlyph(KGGlyphKind kind)
{
#	define COUNT_OF_ARRAY(VAR)	(sizeof(VAR) / sizeof(struct KGGlyphEdge))
	struct KGGlyphStroke result  ;
	switch(kind){
		case KGNilGlyph: {
			static struct KGGlyphEdge s_stroke[1] ;
			result = makeStroke(0, s_stroke) ;
		} break ;
		case KGAbandonGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 3,  4},
				{ 4,  9},
				{ 9,  7},
				{ 7, 10},
				{10,  1}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGAdaptGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 5,  9},
				{ 9,  7},
				{ 7,  8}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGAdvanceGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 4,  6},
				{ 6,  0}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGAfterGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 7, 10},
				{10,  1},
				{ 1,  2},
				{ 2,  8},
				{ 8,  7}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGAgainGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 4,  6},
				{ 6,  9},
				{ 9, 10},
				{10,  8}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGAllGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,  1},
				{ 1,  2},
				{ 2,  3},
				{ 3,  4},
				{ 4,  5},
				{ 5,  0}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGAnswerGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 6, 10},
				{10,  8},
				{ 8,  7}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGAttackGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 4,  6},
				{ 6,  0},
				{ 0, 10},
				{10,  2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGAvoidGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 5,  0},
				{ 0, 10},
				{10,  1},
				{ 1,  8}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGBarrierGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,  7},
				{ 7,  8},
				{ 8,  2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGBeforeGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 5,  6},
				{ 6,  7},
				{ 7,  9},
				{ 9,  4},
				{ 4,  5}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGBeginGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,  9},
				{ 9,  3},
				{ 3,  8}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGBeingGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 6, 10},
				{10,  8},
				{ 8,  3},
				{ 3,  9},
				{ 9,  6}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGBodyGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 7,   6},
				{ 6,  10},
				{10,   7}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGBreathGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 5,   6},
				{ 6,   7},
				{ 7,  10},
				{10,   1}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGCaptureGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 1,   8},
				{ 8,   7},
				{ 7,   9},
				{ 9,   4},
				{ 4,   3}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGChangeGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 9,   7},
				{ 7,   3},
				{ 3,   8}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGChaosGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 4,   5},
				{ 5,   0},
				{ 0,   1},
				{ 1,  10},
				{10,   7},
				{ 7,   9},
				{ 9,   3}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGClearGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,   7},
				{ 7,   3}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGClearAllGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,   1},
				{ 1,   2},
				{ 2,   3},
				{ 3,   4},
				{ 4,   5},
				{ 5,   0},
				{ 0,   7},
				{ 7,   3}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGComplexGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{10,   6},
				{ 6,   7},
				{ 7,   9}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGConflictGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 4,   6},
				{ 6,   9},
				{ 9,   8},
				{ 8,  10},
				{10,   2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGConsequenceGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 5,   6},
				{ 6,   9},
				{ 9,   8},
				{ 8,   2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGContemplateGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,   1},
				{ 1,   2},
				{ 2,   3},
				{ 3,   9},
				{ 9,   6},
				{ 6,   7},
				{ 7,  10}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGContactGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 8,  10},
				{10,   2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGCourageGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 4,   6},
				{ 6,   9},
				{ 9,   8}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGCreateGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 4,   9},
				{ 9,   7},
				{ 7,  10},
				{10,   1}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGCreativityGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 6,   7},
				{ 7,   3},
				{ 3,   6}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGMindGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{10,   1},
				{ 1,   2},
				{ 2,   8},
				{ 8,   7},
				{ 7,   6},
				{ 6,   5},
				{ 5,   4},
				{ 4,   9}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGDangerGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,   6},
				{ 6,   7},
				{ 7,   3}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGDataGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,  10},
				{10,   7},
				{ 7,   9},
				{ 9,   3}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGDefendGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 5,   9},
				{ 9,   3},
				{ 3,   8},
				{ 8,   1}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGDestinationGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 1,   2},
				{ 2,   3}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGDestinyGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 6,   7},
				{ 7,  10},
				{10,   8},
				{ 8,   9},
				{ 9,   3}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGDestroyGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 5,   6},
				{ 6,   7},
				{ 7,   8},
				{ 8,   2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGDeteriorateGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 6,   7},
				{ 7,   9},
				{ 9,   4}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGDieGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 4,   9},
				{ 9,   7},
				{ 7,   8},
				{ 8,   2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGDifficultGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 9,   7},
				{ 7,   8},
				{ 8,  10},
				{10,   1}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGDiscoverGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 1,   2},
				{ 2,   3},
				{ 3,   4}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGDistanceGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,   5},
				{ 5,   4}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGEasyGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{10,   7},
				{ 7,   9},
				{ 9,   3}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGEndGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,   1},
				{ 1,   3},
				{ 3,   7},
				{ 7,   0}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGEnlightenedGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 3,   2},
				{ 2,   1},
				{ 1,   0},
				{ 0,   6},
				{ 6,   7},
				{ 7,  10},
				{10,   6}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGEqualGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 9,   6},
				{ 6,  10},
				{10,   8}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGEscapeGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,   1},
				{ 1,  10},
				{10,   6},
				{ 6,   9}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGEvolutionGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,   7},
				{ 7,   6},
				{ 6,   9}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGFailureGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,   7},
				{ 7,  10},
				{10,   8}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGFearGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 6,  10},
				{10,   8},
				{ 8,   1}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGFollowGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 6,  10},
				{10,   8},
				{ 8,   1}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGForgetGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 4,   9}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGFutureGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 1,  10},
				{10,   8},
				{ 8,   2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGGainGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 5,   9}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGGovernmentGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 5,   6},
				{ 6,   9},
				{ 9,   8},
				{ 8,  10},
				{10,   1}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGGrowGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 4,   6},
				{ 6,   9}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
	}
	return result ;
}

