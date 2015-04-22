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
		case KGAgainGlyph:
		case KGRepeatGlyph: {
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
		case KGAspirationGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 5,   6},
				{ 6,   8},
				{ 8,  10},
				{10,   7}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGAttackGlyph:
		case KGWarGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 4,  6},
				{ 6,  0},
				{ 0, 10},
				{10,  2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGAvoidGlyph:
		case KGStruggleGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 5,  0},
				{ 0, 10},
				{10,  1},
				{ 1,  8}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGBarrierGlyph:
		case KGObstacleGlyph: {
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
		case KGBeginGlyph:
		case KGHumanGlyph: {
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
		case KGBodyGlyph:
		case KGShellGlyph: {
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
		case KGChangeGlyph:
		case KGModifyGlyph: {
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
		case KGContactGlyph:
		case KGReduceGlyph: {
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
		case KGCreateGlyph:
		case KGCreationGlyph: {
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
		case KGIdeaGlyph: {
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
		case KGDataGlyph:
		case KGSignalGlyph: {
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
		case KGDestroyGlyph:
		case KGDestructionGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 5,   6},
				{ 6,   7},
				{ 7,   8},
				{ 8,   2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGDeteriorateGlyph:
		case KGErodeGlyph: {
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
		case KGDistanceGlyph:
		case KGOutsideGlyph: {
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
		case KGEndGlyph:
		case KGCloseGlyph:
		case KGFinalityGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,   1},
				{ 1,   3},
				{ 3,   7},
				{ 7,   0}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGEnlightenedGlyph:
		case KGEnlightenmentGlyph: {
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
		case KGEvolutionGlyph:
		case KGSuccessGlyph:
		case KGProgressGlyph: {
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
				{ 0,  10},
				{10,   1},
				{ 1,   2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGForgetGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 4,   9}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGFutureGlyph:
		case KGForwardGlyph: {
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
		case KGGovernmentGlyph:
		case KGCityGlyph:
		case KGCivillizationGlyph:
		case KGStructureGlyph: {
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
		case KGHarmGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 7,   6},
				{ 6,   0},
				{ 0,  10},
				{10,   7},
				{ 7,   8},
				{ 8,   2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGHarmonyGlyph:
		case KGPeaceGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 7,   6},
				{ 6,   0},
				{ 0,  10},
				{10,   7},
				{ 7,   9},
				{ 9,   3},
				{ 3,   8},
				{ 8,   7}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGHaveGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 8,   7},
				{ 7,   9},
				{ 9,   3}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGHelpGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 5,   6},
				{ 6,   7},
				{ 7,   9},
				{ 9,   8}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGHideGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 6,  10},
				{10,   1},
				{ 1,   8},
				{ 8,   9}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGIGlyph:
		case KGMeGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 6,  10},
				{10,   3},
				{ 3,   6}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGIgnoreGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 8,   2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGImperfectGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 7,   6},
				{ 6,   9},
				{ 9,   7},
				{ 7,  10}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGImproveGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 1,  10},
				{10,   7},
				{ 7,   8}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGImpureGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 7,   6},
				{ 6,   9},
				{ 9,   7},
				{ 7,   3}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGInterruptGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,   7},
				{ 7,   6},
				{ 6,   5},
				{ 5,   4},
				{ 4,   9},
				{ 9,   7},
				{ 7,   3}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGJourneyGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 1,  10},
				{10,   7},
				{ 7,   6},
				{ 6,   5},
				{ 5,   4},
				{ 4,   3}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGKnowledgeGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 6,   7},
				{ 7,  10},
				{10,   3},
				{ 3,   6}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGLeadGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,   5},
				{ 5,   4},
				{ 4,   9},
				{ 9,   3}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGLegacyGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 4,   9},
				{ 9,   6},
				{ 6,   5},
				{ 5,   0},
				{ 0,   1},
				{ 1,  10},
				{10,   8},
				{ 8,   2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGLessGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 6,   7},
				{ 7,  10}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGLiberateGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,   1},
				{ 1,  10},
				{10,   7},
				{ 7,   6},
				{ 6,   4}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGLieGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 7,  10},
				{10,   8},
				{ 8,   7},
				{ 7,   6},
				{ 6,   9}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGLiveAgainGlyph:
		case KGReincarnateGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 4,   6},
				{ 6,   9},
				{ 9,   7},
				{ 7,  10},
				{10,   1}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGLoseGlyph:
		case KGLossGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 1,   8}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGMessageGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 1,   8},
				{ 8,   7},
				{ 7,   6},
				{ 6,   4}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGMindGlyph:
		case KGThoughtGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 6,   7},
				{ 7,   3},
				{ 3,   9},
				{ 9,   6}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGMoreGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 9,   7},
				{ 7,   8}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGMysteryGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 5,   6},
				{ 6,  10},
				{10,   0},
				{ 0,   6},
				{ 6,   9}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGNzeerGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,   6},
				{ 6,   7},
				{ 7,  10},
				{10,   0},
				{ 0,   7},
				{ 7,   3}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGNatureGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 4,   9},
				{ 9,   6},
				{ 6,  10},
				{10,   8},
				{ 8,   2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGNewGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{10,   8},
				{ 8,   2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGNoGlyph:
		case KGNotGlyph:
		case KGAbsentGlyph:
		case KGInsideGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 6,  10},
				{10,   8}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGNourishGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 7,   3},
				{ 3,   4},
				{ 4,   9},
				{ 9,   7}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGOldGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 5,   6},
				{ 6,   9}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGOpenGlyph:
		case KGAcceptGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 8,   3},
				{ 3,   9},
				{ 9,   8}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGOpenAllGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 3,   4},
				{ 4,   5},
				{ 5,   0},
				{ 0,   1},
				{ 1,   2},
				{ 2,   3},
				{ 3,   9},
				{ 9,   8},
				{ 8,   3}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGOpeningGlyph:
		case KGDoorwayGlyph:
		case KGPortalGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 5,   6},
				{ 6,  10},
				{10,   1},
				{ 1,   2},
				{ 2,   8},
				{ 8,   9},
				{ 9,   4},
				{ 4,   5}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGPastGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 5,   6},
				{ 6,   9},
				{ 9,   4}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGPathGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,   7},
				{ 7,   9},
				{ 9,   4}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGPerfectionGlyph:
		case KGBaranceGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,   7},
				{ 7,   9},
				{ 9,   4},
				{ 4,   3},
				{ 3,   2},
				{ 2,   8},
				{ 8,   7}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGPerspectiveGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 4,   9},
				{ 9,   7},
				{ 7,  10},
				{10,   1},
				{ 1,   0},
				{ 0,   5},
				{ 5,   6},
				{ 6,   7},
				{ 7,   8},
				{ 8,   2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGPotencialGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,   7},
				{ 7,   8},
				{ 8,   2},
				{ 2,   1}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGPresenceGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 9,   6},
				{ 6,   7},
				{ 7,  10},
				{10,   8},
				{ 8,   9},
				{ 9,   3},
				{ 3,   8}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGPresentGlyph:
		case KGNowGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 6,   9},
				{ 9,   8},
				{ 8,  10}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGPureGlyph:
		case KGPurityGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,   7},
				{ 7,   8},
				{ 8,  10},
				{10,   7}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGPursueGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{10,   7},
				{ 7,   8},
				{ 8,  10},
				{10,   7}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGChaseGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,   7},
				{ 7,   6},
				{ 6,   9},
				{ 9,   4}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGQuestionGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,  10},
				{10,   6},
				{ 6,   9}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGReactGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{10,   6},
				{ 6,   7},
				{ 7,   8},
				{ 8,   2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGRebelGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 5,   9},
				{ 9,   7},
				{ 7,  10},
				{10,   1},
				{ 1,   2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGRechargeGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,   7},
				{ 7,   6},
				{ 6,   5},
				{ 5,   0},
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGRegistGlyph:
		case KGRegistanceGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{10,   6},
				{ 6,   0},
				{ 0,   7},
				{ 7,   3},
				{ 3,   9}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGSaveGlyph:
		case KGRescueGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 1,   8},
				{ 8,   7},
				{ 7,   9}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGSeeGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,   6}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGSeekGlyph:
		case KGSearchGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 7,  10},
				{10,   6},
				{ 6,   9},
				{ 9,   8}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGSelfGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 2,   3},
				{ 3,   4}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGSeparateGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 5,   6},
				{ 6,   9},
				{ 9,   7},
				{ 7,  10},
				{10,   8},
				{ 8,   2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGShaperGlyph:
		case KGCollectiveGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 4,   9},
				{ 9,   6},
				{ 6,   0},
				{ 0,  10},
				{10,   8},
				{ 8,   2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGShareGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 2,   8},
				{ 8,   9},
				{ 9,   4},
				{ 9,   3}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGSimpleGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 9,   8}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGRestraintGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 5,   6},
				{ 6,   7},
				{ 7,   8},
				{ 8,   2},
				{ 2,   3}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGRetreatGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,  10},
				{10,   2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGSafetyGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 4,   6},
				{ 6,  10},
				{10,   2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGSoulGlyph:
		case KGSplitGlyph:
		case KGLifeForceGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{10,   8},
				{ 8,   3},
				{ 3,   7},
				{ 7,  10}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGStabilityGlyph:
		case KGStayGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 4,   9},
				{ 9,   8},
				{ 8,   2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGStrongGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 6,  10},
				{10,   8},
				{ 8,   9},
				{ 9,   6}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGTogetherGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 7,   6},
				{ 6,  10},
				{10,   7},
				{ 7,   9},
				{ 9,   4}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
	}
	return result ;
}

