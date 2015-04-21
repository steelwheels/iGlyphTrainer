/**
 * @file	KGGlyphKind.h
 * @brief	Define kind of glyphs
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <Foundation/Foundation.h>

typedef enum {
	KGNilGlyph,		/* Nil glyph	*/
	KGAbandonGlyph,
	KGAbsentGlyph,
	KGAcceptGlyph,
	KGAdaptGlyph,
	KGAdvanceGlyph,
	KGAfterGlyph,
	KGAgainGlyph,
	KGAllGlyph,
	KGAnswerGlyph,
	KGAspirationGlyph,
	KGAttackGlyph,
	KGAvoidGlyph,
	KGBaranceGlyph,
	KGBarrierGlyph,
	KGBeforeGlyph,
	KGBeginGlyph,
	KGBeingGlyph,
	KGBodyGlyph,
	KGBreathGlyph,
	KGCaptureGlyph,
	KGChangeGlyph,
	KGChaosGlyph,
	KGChaseGlyph,
	KGCityGlyph,		/* KGGovernmentGlyph	*/
	KGCivillizationGlyph,	/* KGGovernmentGlyph	*/
	KGClearGlyph,
	KGClearAllGlyph,
	KGCloseGlyph,		/* KGEndGlyph		*/
	KGComplexGlyph,
	KGConflictGlyph,
	KGConsequenceGlyph,
	KGContemplateGlyph,
	KGContactGlyph,
	KGCourageGlyph,
	KGCreateGlyph,
	KGCreationGlyph,	/* KGCreateGlyph	*/
	KGCreativityGlyph,
	KGDangerGlyph,
	KGDataGlyph,
	KGDefendGlyph,
	KGDestinationGlyph,
	KGDestinyGlyph,
	KGDestroyGlyph,
	KGDestructionGlyph,	/* KGDestroyGlyph	*/
	KGDeteriorateGlyph,
	KGDieGlyph,
	KGDifficultGlyph,
	KGDiscoverGlyph,
	KGDistanceGlyph,	/* KGOpeningGlyph	*/
	KGDoorwayGlyph,
	KGEasyGlyph,
	KGEndGlyph,
	KGEnlightenedGlyph,
	KGEnlightenmentGlyph,	/* KGEnlightenedGlyph	*/
	KGEqualGlyph,
	KGErodeGlyph,		/* KGDeteriorateGlyph	*/
	KGEscapeGlyph,
	KGEvolutionGlyph,
	KGFailureGlyph,
	KGFearGlyph,
	KGFinalityGlyph,	/* KGEndGlyph		*/
	KGFollowGlyph,
	KGForgetGlyph,
	KGForwardGlyph,		/* KGFutureGlyph	*/
	KGFutureGlyph,
	KGGainGlyph,
	KGGovernmentGlyph,
	KGGrowGlyph,
	KGHarmGlyph,
	KGHarmonyGlyph,
	KGHaveGlyph,
	KGHelpGlyph,
	KGHideGlyph,
	KGHumanGlyph,		/* KGBeingGlyph		*/
	KGIGlyph,		/* KGHideGlyph		*/
	KGIdeaGlyph,		/* KGMindGlyph		*/
	KGIgnoreGlyph,
	KGImperfectGlyph,
	KGImproveGlyph,
	KGImpureGlyph,
	KGInsideGlyph,
	KGInterruptGlyph,
	KGJourneyGlyph,
	KGKnowledgeGlyph,
	KGLeadGlyph,
	KGLegacyGlyph,
	KGLessGlyph,
	KGLiberateGlyph,
	KGLieGlyph,
	KGLiveAgainGlyph,
	KGLoseGlyph,
	KGLossGlyph,
	KGMeGlyph,		/* KGHideGlyph		*/
	KGMessageGlyph,		/* KGDataGlyph		*/
	KGMindGlyph,
	KGModifyGlyph,		/* KGChangeGlyph	*/
	KGMoreGlyph,
	KGMysteryGlyph,
	KGNzeerGlyph,
	KGNatureGlyph,
	KGNewGlyph,
	KGNoGlyph,
	KGNotGlyph,
	KGNourishGlyph,
	KGNowGlyph,
	KGObstacleGlyph,	/* KGBarrierGlyph	*/
	KGOldGlyph,
	KGOpenGlyph,
	KGOpenAllGlyph,
	KGOpeningGlyph,
	KGOutsideGlyph,		/* KGDistanceGlyph	*/
	KGPastGlyph,
	KGPathGlyph,
	KGPerfectionGlyph,
	KGPeaceGlyph,
	KGPerspectiveGlyph,
	KGPotencialGlyph,
	KGPresenceGlyph,
	KGPresentGlyph,
	KGProgressGlyph,	/* KGEvolutionGlyph	*/
	KGPortalGlyph,		/* KGOpeningGlyph	*/
	KGPureGlyph,
	KGPurityGlyph,		/* KGPureGlyph		*/
	KGPursueGlyph,
	KGQuestionGlyph,
	KGReactGlyph,
	KGRebelGlyph,
	KGRechargeGlyph,
	KGRegistGlyph,
	KGRegistanceGlyph,
	KGReincarnateGlyph,
	KGReduceGlyph,		/* KGContactGlyph	*/
	KGRepeatGlyph,		/* KGAgainGlyph		*/
	KGRescueGlyph,
	KGSaveGlyph,
	KGSeeGlyph,
	KGSeekGlyph,
	KGSearchGlyph,
	KGSelfGlyph,		/* KGIGlyph		*/
	KGShellGlyph,		/* KGBodyGlyph		*/
	KGSignalGlyph,		/* KGDataGlyph		*/
	KGStructureGlyph,	/* KGGovernmentGlyph	*/
	KGStruggleGlyph,	/* KGAvoidGlyph		*/
	KGSuccessGlyph,		/* KGEvolutionGlyph	*/
	KGThoughtGlyph,		/* KGMindGlyph		*/
	KGWarGlyph,		/* KGAttackGlyph	*/
} KGGlyphKind ;

static const KGGlyphKind	KGFirstClyph		= KGAbandonGlyph ;
static const KGGlyphKind	KGLastClyph		= KGWarGlyph ;

