/**
 * @file	KGGlyphSentence.m
 * @brief	Define KGGlyphSentence data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 * @par Reference
 *   Web page : http://www.ingress.tv/2-glyph-hack-sequences.html
 */

#import "KGGlyphSentence.h"

struct KG2WordSentence {
	KGGlyphKind		word_1st ;
	KGGlyphKind		word_2nd ;
} ;

struct KG3WordSentence {
	KGGlyphKind		word_1st ;
	KGGlyphKind		word_2nd ;
	KGGlyphKind		word_3rd ;
} ;

struct KG4WordSentence {
	KGGlyphKind		word_1st ;
	KGGlyphKind		word_2nd ;
	KGGlyphKind		word_3rd ;
	KGGlyphKind		word_4th ;
} ;

struct KG5WordSentence {
	KGGlyphKind		word_1st ;
	KGGlyphKind		word_2nd ;
	KGGlyphKind		word_3rd ;
	KGGlyphKind		word_4th ;
	KGGlyphKind		word_5th ;
} ;

static const struct KG2WordSentence s_2words[] = {
	{KGCivillizationGlyph,	KGChaosGlyph			},
	{KGPursueGlyph,		KGXMGlyph			},
	{KGPursueGlyph,		KGTruthGlyph			},
	{KGSeparateGlyph,	KGWarGlyph			},
	{KGCreateGlyph,		KGDangerGlyph			},
	{KGPathGlyph,		KGPerfectionGlyph		},
	{KGDiscoverGlyph,	KGSafetyGlyph			},
	{KGDiscoverGlyph,	KGLieGlyph			},
	{KGDiscoverGlyph,	KGPortalGlyph			},
	{KGAttackGlyph,		KGChaosGlyph			},
	{KGAttackGlyph,		KGDifficultGlyph		},
	{KGLiberateGlyph,	KGXMGlyph			},
	{KGQuestionGlyph,	KGWarGlyph			},
	{KGLeadGlyph,		KGEnlightenedGlyph		},
	{KGSearchGlyph,		KGPotencialGlyph		},
	{KGSearchGlyph,		KGPastGlyph			},
	{KGCaptureGlyph,	KGPortalGlyph			},
	{KGPureGlyph,		KGTruthGlyph			},
	{KGPureGlyph,		KGBodyGlyph			},
	{KGPureGlyph,		KGHumanGlyph			},
	{KGNourishGlyph,	KGJourneyGlyph			},
	{KGAllGlyph,		KGChaosGlyph			},
	{KGOpenAllGlyph,	KGTruthGlyph			}
} ;

static const struct KG3WordSentence s_3words[] = {
	{KGDestroyGlyph,	KGDifficultGlyph,	KGBarrierGlyph		},
	{KGGainGlyph,		KGCivillizationGlyph,	KGPeaceGlyph		},
	{KGDestroyGlyph,	KGWeakGlyph,		KGCivillizationGlyph	},
	{KGDestroyGlyph,	KGDestinyGlyph,		KGBarrierGlyph		},
	{KGCivillizationGlyph,	KGWarGlyph,		KGChaosGlyph		},
	{KGAvoidGlyph,		KGDestinyGlyph,		KGLieGlyph		},
	{KGAvoidGlyph,		KGComplexGlyph,		KGConflictGlyph		},
	{KGSeparateGlyph,	KGFutureGlyph,		KGEvolutionGlyph	},
	{KGPathGlyph,		KGPeaceGlyph,		KGDifficultGlyph	},
	{KGAgainGlyph,		KGJourneyGlyph,		KGOutsideGlyph		},
	{KGDiscoverGlyph,	KGShaperGlyph,		KGLieGlyph		},
	{KGDiscoverGlyph,	KGPureGlyph,		KGTruthGlyph		},
	{KGNatureGlyph,		KGPureGlyph,		KGDefendGlyph		},
	{KGWarGlyph,		KGCreateGlyph,		KGDangerGlyph		},
	{KGWarGlyph,		KGDestroyGlyph,		KGFutureGlyph		},
	{KGAttackGlyph,		KGDifficultGlyph,	KGFutureGlyph		},
	{KGAttackGlyph,		KGShaperGlyph,		KGEvolutionGlyph	},
	{KGLiberateGlyph,	KGPortalGlyph,		KGPotencialGlyph	},
	{KGInsideGlyph,		KGMindGlyph,		KGFutureGlyph		},
	{KGFearGlyph,		KGChaosGlyph,		KGXMGlyph		},
	{KGChangeGlyph,		KGHumanGlyph,		KGFutureGlyph		},
	{KGQuestionGlyph,	KGShaperGlyph,		KGChaosGlyph		},
	{KGQuestionGlyph,	KGHideGlyph,		KGTruthGlyph		},
	{KGQuestionGlyph,	KGConflictGlyph,	KGDataGlyph		},
	{KGEscapeGlyph,		KGImpureGlyph,		KGEvolutionGlyph	},
	{KGComplexGlyph,	KGJourneyGlyph,		KGFutureGlyph		},
	{KGFollowGlyph,		KGPureGlyph,		KGJourneyGlyph		},
	{KGLeadGlyph,		KGResistanceGlyph,	KGQuestionGlyph		},
	{KGReactGlyph,		KGImpureGlyph,		KGCivillizationGlyph	},
	{KGCaptureGlyph,	KGShaperGlyph,		KGPortalGlyph		},
	{KGJourneyGlyph,	KGInsideGlyph,		KGSoulGlyph		},
	{KGLoseGlyph,		KGAttackGlyph,		KGRetreatGlyph		},
	{KGImproveGlyph,	KGAdvanceGlyph,		KGPresentGlyph		},
	{KGImproveGlyph,	KGHumanGlyph,		KGShaperGlyph		},
	{KGFutureGlyph,		KGEqualGlyph,		KGPastGlyph		},
	{KGTogetherGlyph,	KGPursueGlyph,		KGSafetyGlyph		},
	{KGHarmGlyph,		KGDangerGlyph,		KGAvoidGlyph		},
	{KGPerfectGlyph,	KGPathGlyph,		KGPeaceGlyph		},
	{KGMindGlyph,		KGOpenGlyph,		KGLiveGlyph		},
	{KGAllGlyph,		KGXMGlyph,		KGLiberateGlyph		},
	{KGOpenAllGlyph,	KGPortalGlyph,		KGSuccessGlyph		},
	{KGXMGlyph,		KGNourishGlyph,		KGCivillizationGlyph	},
	{KGTruthGlyph,		KGNourishGlyph,		KGSoulGlyph		}
} ;

static const struct KG4WordSentence s_4words[] = {
	{KGGainGlyph,		KGPortalGlyph,		KGAttackGlyph,		KGWeakGlyph		},
	{KGPastGlyph,		KGAgainGlyph,		KGPresenceGlyph,	KGAgainGlyph		},
	{KGDestroyGlyph,	KGDestinyGlyph,		KGHumanGlyph,		KGLieGlyph		},
	{KGDestinyGlyph,	KGComplexGlyph,		KGShaperGlyph,		KGLieGlyph		},
	{KGRestraintGlyph,	KGPathGlyph,		KGGainGlyph,		KGHarmonyGlyph		},
	{KGRestraintGlyph,	KGFearGlyph,		KGAvoidGlyph,		KGDangerGlyph		},
	{KGBreathGlyph,		KGAgainGlyph,		KGJourneyGlyph,		KGAgainGlyph		},
	{KGBreathGlyph,		KGNatureGlyph,		KGPerfectGlyph,		KGHarmonyGlyph		},
	{KGDefendGlyph,		KGMessageGlyph,		KGAnswerGlyph,		KGIdeaGlyph		},
	{KGHelpGlyph,		KGGainGlyph,		KGCreateGlyph,		KGPursueGlyph		},
	{KGHelpGlyph,		KGShaperGlyph,		KGCreateGlyph,		KGFutureGlyph		},
	{KGAvoidGlyph,		KGXMGlyph,		KGMessageGlyph,		KGLieGlyph		},
	{KGSeparateGlyph,	KGWeakGlyph,		KGIgnoreGlyph,		KGTruthGlyph		},
	{KGForgetGlyph,		KGConflictGlyph,	KGAcceptGlyph,		KGWarGlyph		},
	{KGCreateGlyph,		KGDistanceGlyph,	KGImpureGlyph,		KGPathGlyph		},
	{KGCreateGlyph,		KGFutureGlyph,		KGNotGlyph,		KGWarGlyph		},
	{KGCreateGlyph,		KGFutureGlyph,		KGChangeGlyph,		KGDestinationGlyph	},
	{KGAdvanceGlyph,	KGCivillizationGlyph,	KGRepeatGlyph,		KGFutureGlyph		},
	{KGPathGlyph,		KGRestraintGlyph,	KGStrongGlyph,		KGSafetyGlyph		},
	{KGDeteriorateGlyph,	KGHumanGlyph,		KGWeakGlyph,		KGRebelGlyph		},
	{KGCourageGlyph,	KGWarGlyph,		KGShaperGlyph,		KGFutureGlyph		},
	{KGStayGlyph,		KGTogetherGlyph,	KGDefendGlyph,		KGTruthGlyph		},
	{KGShaperGlyph,		KGSeeGlyph,		KGPotencialGlyph,	KGEvolutionGlyph	},
	{KGShaperGlyph,		KGPortalGlyph,		KGMindGlyph,		KGRestraintGlyph	},
	{KGShaperGlyph,		KGPastGlyph,		KGPresenceGlyph,	KGFutureGlyph		},
	{KGShaperGlyph,		KGMindGlyph,		KGComplexGlyph,		KGHarmonyGlyph		},
	{KGShaperGlyph,		KGHaveGlyph,		KGStrongGlyph,		KGPathGlyph		},
	{KGShaperGlyph,		KGChaosGlyph,		KGPureGlyph,		KGHarmGlyph		},
	{KGShaperGlyph,		KGMessageGlyph,		KGEndGlyph,		KGCivillizationGlyph	},
	{KGAttackGlyph,		KGWeakGlyph,		KGShaperGlyph,		KGLieGlyph		},
	{KGAttackGlyph,		KGResistanceGlyph,	KGPursueGlyph,		KGEnlightenedGlyph	},
	{KGAttackGlyph,		KGEnlightenedGlyph,	KGPursueGlyph,		KGResistanceGlyph	},
	{KGChaosGlyph,		KGBarrierGlyph,		KGShaperGlyph,		KGPortalGlyph		},
	{KGLiberateGlyph,	KGXMGlyph,		KGPortalGlyph,		KGTogetherGlyph		},
	{KGSeeGlyph,		KGTruthGlyph,		KGSeeGlyph,		KGFutureGlyph		},
	{KGLessGlyph,		KGChaosGlyph,		KGMoreGlyph,		KGStabilityGlyph	},
	{KGLessGlyph,		KGTruthGlyph,		KGMoreGlyph,		KGChaosGlyph		},
	{KGLessGlyph,		KGSoulGlyph,		KGMoreGlyph,		KGMindGlyph		},
	{KGInsideGlyph,		KGMindGlyph,		KGJourneyGlyph,		KGPerfectGlyph		},
	{KGHideGlyph,		KGImpureGlyph,		KGHumanGlyph,		KGThoughtGlyph		},
	{KGSimpleGlyph,		KGCivillizationGlyph,	KGImpureGlyph,		KGWeakGlyph		},
	{KGSimpleGlyph,		KGTruthGlyph,		KGBreathGlyph,		KGNatureGlyph		},
	{KGSimpleGlyph,		KGMessageGlyph,		KGComplexGlyph,		KGIdeaGlyph		},
	{KGChangeGlyph,		KGHumanGlyph,		KGPotencialGlyph,	KGUseGlyph		},
	{KGChangeGlyph,		KGFutureGlyph,		KGCaptureGlyph,		KGHarmonyGlyph		},
	{KGChangeGlyph,		KGBodyGlyph,		KGImproveGlyph,		KGHumanGlyph		},
	{KGQuestionGlyph,	KGTruthGlyph,		KGGainGlyph,		KGFutureGlyph		},
	{KGEscapeGlyph,		KGSimpleGlyph,		KGHumanGlyph,		KGFutureGlyph		},
	{KGComplexGlyph,	KGShaperGlyph,		KGCivillizationGlyph,	KGStrongGlyph		},
	{KGClearGlyph,		KGMindGlyph,		KGOpenGlyph,		KGMindGlyph		},
	{KGFollowGlyph,		KGShaperGlyph,		KGPortalGlyph,		KGMessageGlyph		},
	{KGLeadGlyph,		KGPursueGlyph,		KGReactGlyph,		KGDefendGlyph		},
	{KGContemplateGlyph,	KGComplexGlyph,		KGShaperGlyph,		KGTruthGlyph		},
	{KGContemplateGlyph,	KGComplexGlyph,		KGShaperGlyph,		KGCivillizationGlyph	},
	{KGContemplateGlyph,	KGSelfGlyph,		KGPortalGlyph,		KGTruthGlyph		},
	{KGContemplateGlyph,	KGSelfGlyph,		KGPathGlyph,		KGTruthGlyph		},
	{KGSearchGlyph,		KGTruthGlyph,		KGSaveGlyph,		KGCivillizationGlyph	},
	{KGSearchGlyph,		KGXMGlyph,		KGSaveGlyph,		KGPortalGlyph		},
	{KGSearchGlyph,		KGDataGlyph,		KGDiscoverGlyph,	KGPortalGlyph		},
	{KGCaptureGlyph,	KGFearGlyph,		KGDiscoverGlyph,	KGCourageGlyph		},
	{KGJourneyGlyph,	KGInsideGlyph,		KGImproveGlyph,		KGSoulGlyph		},
	{KGIgnoreGlyph,		KGHumanGlyph,		KGChaosGlyph,		KGLieGlyph		},
	{KGLoseGlyph,		KGDangerGlyph,		KGGainGlyph,		KGSafetyGlyph		},
	{KGImproveGlyph,	KGBodyGlyph,		KGPursueGlyph,		KGJourneyGlyph		},
	{KGImproveGlyph,	KGBodyGlyph,		KGMindGlyph,		KGSoulGlyph		},
	{KGImproveGlyph,	KGMindGlyph,		KGJourneyGlyph,		KGInsideGlyph		},
	{KGTogetherGlyph,	KGDiscoverGlyph,	KGHarmonyGlyph,		KGEqualGlyph		},
	{KGStruggleGlyph,	KGImproveGlyph,		KGHumanGlyph,		KGSoulGlyph		},
	{KGStruggleGlyph,	KGDefendGlyph,		KGShaperGlyph,		KGDangerGlyph		},
	{KGPerfectGlyph,	KGBalanceGlyph,		KGSafetyGlyph,		KGAllGlyph		},
	{KGHumanGlyph,		KGHaveGlyph,		KGImpureGlyph,		KGCivillizationGlyph	},
	{KGHumanGlyph,		KGSoulGlyph,		KGStrongGlyph,		KGPureGlyph		},
	{KGHumanGlyph,		KGPastGlyph,		KGPresentGlyph,		KGFutureGlyph		},
	{KGNourishGlyph,	KGXMGlyph,		KGCreateGlyph,		KGThoughtGlyph		},
	{KGSoulGlyph,		KGRebelGlyph,		KGHumanGlyph,		KGDieGlyph		},
	{KGAllGlyph,		KGChaosGlyph,		KGInsideGlyph,		KGBodyGlyph		},
	{KGCloseAllGlyph,	KGOpenAllGlyph,		KGDiscoverGlyph,	KGTruthGlyph		},
	{KGStrongGlyph,		KGIdeaGlyph,		KGPursueGlyph,		KGTruthGlyph		},
	{KGStrongGlyph,		KGTogetherGlyph,	KGAvoidGlyph,		KGWarGlyph		},
	{KGStrongGlyph,		KGResistanceGlyph,	KGCaptureGlyph,		KGPortalGlyph		},
	{KGXMGlyph,		KGHaveGlyph,		KGMindGlyph,		KGJourneyGlyph		},
	{KGXMGlyph,		KGDieGlyph,		KGChaosGlyph,		KGDieGlyph		},
	{KGTruthGlyph,		KGIdeaGlyph,		KGDiscoverGlyph,	KGXMGlyph		},
	{KGPortalGlyph,		KGHaveGlyph,		KGTruthGlyph,		KGDataGlyph		},
	{KGPortalGlyph,		KGPotencialGlyph,	KGChangeGlyph,		KGFutureGlyph		},
	{KGPortalGlyph,		KGDieGlyph,		KGCivillizationGlyph,	KGDieGlyph		},
	{KGPortalGlyph,		KGChangeGlyph,		KGCivillizationGlyph,	KGEndGlyph		},
	{KGPortalGlyph,		KGDieGlyph,		KGCivillizationGlyph,	KGDieGlyph		},
	{KGPortalGlyph,		KGChangeGlyph,		KGCivillizationGlyph,	KGEndGlyph		},
	{KGPeaceGlyph,		KGPathGlyph,		KGNourishGlyph,		KGPresentGlyph		}
} ;

static const struct KG5WordSentence s_5words[] = {
	{KGGainGlyph,		KGTruthGlyph,		KGOpenGlyph,		KGHumanGlyph,		KGSoulGlyph		},
	{KGOldGlyph,		KGNatureGlyph,		KGLessGlyph,		KGStrongGlyph,		KGNowGlyph		},
	{KGPastGlyph,		KGChaosGlyph,		KGCreateGlyph,		KGFutureGlyph,		KGHarmonyGlyph		},
	{KGPastGlyph,		KGPathGlyph,		KGCreateGlyph,		KGFutureGlyph,		KGJourneyGlyph		},
	{KGDestroyGlyph,	KGLieGlyph,		KGInsideGlyph,		KGGainGlyph,		KGSoulGlyph		},
	{KGDestroyGlyph,	KGCivillizationGlyph,	KGEndGlyph,		KGConflictGlyph,	KGWarGlyph		},
	{KGBreathGlyph,		KGInsideGlyph,		KGXMGlyph,		KGLoseGlyph,		KGSelfGlyph		},
	{KGDefendGlyph,		KGDestinyGlyph,		KGDefendGlyph,		KGHumanGlyph,		KGCivillizationGlyph	},
	{KGDefendGlyph,		KGHumanGlyph,		KGCivillizationGlyph,	KGXMGlyph,		KGMessageGlyph		},
	{KGDefendGlyph,		KGHumanGlyph,		KGCivillizationGlyph,	KGShaperGlyph,		KGLieGlyph		},
	{KGDefendGlyph,		KGHumanGlyph,		KGCivillizationGlyph,	KGPortalGlyph,		KGDataGlyph		},
	{KGDefendGlyph,		KGHumanGlyph,		KGCivillizationGlyph,	KGShaperGlyph,		KGPortalGlyph		},
	{KGHelpGlyph,		KGEnlightenmentGlyph,	KGCaptureGlyph,		KGAllGlyph,		KGPortalGlyph		},
	{KGHelpGlyph,		KGResistanceGlyph,	KGCaptureGlyph,		KGAllGlyph,		KGPortalGlyph		},
	{KGHelpGlyph,		KGHumanGlyph,		KGCivillizationGlyph,	KGPursueGlyph,		KGDestinyGlyph		},
	{KGPursueGlyph,		KGPathGlyph,		KGOutsideGlyph,		KGShaperGlyph,		KGLieGlyph		},
	{KGPursueGlyph,		KGConflictGlyph,	KGWarGlyph,		KGAdvanceGlyph,		KGChaosGlyph		},
	{KGWeakGlyph,		KGHumanGlyph,		KGDestinyGlyph,		KGDestroyGlyph,		KGCivillizationGlyph	},
	{KGAvoidGlyph,		KGChaosGlyph,		KGRepairGlyph,		KGPotencialGlyph,	KGWarGlyph		},
	{KGAvoidGlyph,		KGPerfectGlyph,		KGStabilityGlyph,	KGHumanGlyph,		KGSelfGlyph		},
	{KGAvoidGlyph,		KGChaosGlyph,		KGAvoidGlyph,		KGShaperGlyph,		KGLieGlyph		},
	{KGRebelGlyph,		KGThoughtGlyph,		KGEvolutionGlyph,	KGDestinyGlyph,		KGNowGlyph		},
	{KGSeparateGlyph,	KGMindGlyph,		KGBodyGlyph,		KGDiscoverGlyph,	KGEnlightenedGlyph	},
	{KGSeparateGlyph,	KGTruthGlyph,		KGLieGlyph,		KGShaperGlyph,		KGFutureGlyph		},
	{KGForgetGlyph,		KGPastGlyph,		KGSeeGlyph,		KGPresentGlyph,		KGDangerGlyph		},
	{KGForgetGlyph,		KGWarGlyph,		KGSeeGlyph,		KGDistanceGlyph,	KGHarmonyGlyph		},
	{KGCreateGlyph,		KGPureGlyph,		KGFutureGlyph,		KGNotGlyph,		KGWarGlyph		},
	{KGCreateGlyph,		KGPureGlyph,		KGFutureGlyph,		KGHumanGlyph,		KGCivillizationGlyph	},
	{KGCreateGlyph,		KGSeparateGlyph,	KGPathGlyph,		KGEndGlyph,		KGJourneyGlyph		},
	{KGAdvanceGlyph,	KGCivillizationGlyph,	KGPursueGlyph,		KGShaperGlyph,		KGPathGlyph		},
	{KGDistanceGlyph,	KGSelfGlyph,		KGAvoidGlyph,		KGHumanGlyph,		KGLieGlyph		},
	{KGCourageGlyph,	KGAttackGlyph,		KGShaperGlyph,		KGPortalGlyph,		KGTogetherGlyph		},
	{KGWantGlyph,		KGTruthGlyph,		KGPursueGlyph,		KGDifficultGlyph,	KGPathGlyph		},
	{KGStayGlyph,		KGStrongGlyph,		KGTogetherGlyph,	KGDefendGlyph,		KGResistanceGlyph	},
	{KGShaperGlyph,		KGPortalGlyph,		KGDataGlyph,		KGCreateGlyph,		KGChaosGlyph		},
	{KGShaperGlyph,		KGPortalGlyph,		KGMessageGlyph,		KGDestroyGlyph,		KGCivillizationGlyph	},
	{KGShaperGlyph,		KGWantGlyph,		KGHumanGlyph,		KGMindGlyph,		KGFutureGlyph		},
	{KGShaperGlyph,		KGLeadGlyph,		KGHumanGlyph,		KGComplexGlyph,		KGJourneyGlyph		},
	{KGChaosGlyph,		KGWarGlyph,		KGConflictGlyph,	KGDiscoverGlyph,	KGPeaceGlyph		},
	{KGLiberateGlyph,	KGPortalGlyph,		KGLiberateGlyph,	KGHumanGlyph,		KGMindGlyph		},
	{KGPresenceGlyph,	KGChaosGlyph,		KGCreateGlyph,		KGFutureGlyph,		KGCivillizationGlyph	},
	{KGInsideGlyph,		KGMindGlyph,		KGInsideGlyph,		KGSoulGlyph,		KGHarmonyGlyph		},
	{KGAnswerGlyph,		KGQuestionGlyph,	KGDiscoverGlyph,	KGDifficultGlyph,	KGTruthGlyph		},
	{KGHideGlyph,		KGStruggleGlyph,	KGAdvanceGlyph,		KGStrongGlyph,		KGTogetherGlyph		},
	{KGSimpleGlyph,		KGTruthGlyph,		KGShaperGlyph,		KGDestroyGlyph,		KGCivillizationGlyph	},
	{KGSimpleGlyph,		KGOldGlyph,		KGTruthGlyph,		KGJourneyGlyph,		KGInsideGlyph		},
	{KGMoreGlyph,		KGDataGlyph,		KGGainGlyph,		KGPortalGlyph,		KGAdvanceGlyph		},
	{KGSaveGlyph,		KGHumanGlyph,		KGCivillizationGlyph,	KGDestroyGlyph,		KGPortalGlyph		},
	{KGQuestionGlyph,	KGLessGlyph,		KGForgetGlyph,		KGAllGlyph,		KGLieGlyph		},
	{KGEscapeGlyph,		KGBodyGlyph,		KGJourneyGlyph,		KGOutsideGlyph,		KGPresentGlyph		},
	{KGEscapeGlyph,		KGBodyGlyph,		KGMindGlyph,		KGSelfGlyph,		KGWantGlyph		},
	{KGClearGlyph,		KGMindGlyph,		KGLiberateGlyph,	KGBarrierGlyph,		KGBodyGlyph		},
	{KGContemplateGlyph,	KGFutureGlyph,		KGNotGlyph,		KGShaperGlyph,		KGPathGlyph		},
	{KGContemplateGlyph,	KGRestraintGlyph,	KGDiscoverGlyph,	KGMoreGlyph,		KGCourageGlyph		},
	{KGUseGlyph,		KGRestraintGlyph,	KGFollowGlyph,		KGEasyGlyph,		KGPathGlyph		},
	{KGUseGlyph,		KGMindGlyph,		KGUseGlyph,		KGCourageGlyph,		KGChangeGlyph		},
	{KGSearchGlyph,		KGDestinyGlyph,		KGCreateGlyph,		KGPureGlyph,		KGFutureGlyph		},
	{KGEasyGlyph,		KGPathGlyph,		KGFutureGlyph,		KGFollowGlyph,		KGShaperGlyph		},
	{KGReactGlyph,		KGRebelGlyph,		KGQuestionGlyph,	KGShaperGlyph,		KGLieGlyph		},
	{KGCaptureGlyph,	KGPortalGlyph,		KGDefendGlyph,		KGPortalGlyph,		KGCourageGlyph		},
	{KGLoseGlyph,		KGShaperGlyph,		KGMessageGlyph,		KGGainGlyph,		KGChaosGlyph		},
	{KGPureGlyph,		KGHumanGlyph,		KGFailureGlyph,		KGNowGlyph,		KGChaosGlyph		},
	{KGImperfectGlyph,	KGXMGlyph,		KGMessageGlyph,		KGHumanGlyph,		KGChaosGlyph		},
	{KGImperfectGlyph,	KGTruthGlyph,		KGAcceptGlyph,		KGComplexGlyph,		KGAnswerGlyph		},
	{KGHumanGlyph,		KGShaperGlyph,		KGTogetherGlyph,	KGCreateGlyph,		KGDestinyGlyph		},
	{KGHumanGlyph,		KGNotGlyph,		KGTogetherGlyph,	KGCivillizationGlyph,	KGDeteriorateGlyph	},
	{KGRechargeGlyph,	KGPresentGlyph,		KGRechargeGlyph,	KGHumanGlyph,		KGSoulGlyph		},
	{KGRepairGlyph,		KGSoulGlyph,		KGLessGlyph,		KGHumanGlyph,		KGHarmGlyph		},
	{KGCloseAllGlyph,	KGThoughtGlyph,		KGPastGlyph,		KGPresentGlyph,		KGFutureGlyph		},
	{KGStrongGlyph,		KGTogetherGlyph,	KGWarGlyph,		KGTogetherGlyph,	KGDestinyGlyph		},
	{KGStrongGlyph,		KGTogetherGlyph,	KGWarGlyph,		KGTogetherGlyph,	KGChaosGlyph		},
	{KGXMGlyph,		KGPathGlyph,		KGFutureGlyph,		KGDestinyGlyph,		KGHarmonyGlyph		},
	{KGXMGlyph,		KGCreateGlyph,		KGComplexGlyph,		KGHumanGlyph,		KGDestinyGlyph		},
	{KGPortalGlyph,		KGCreateGlyph,		KGDangerGlyph,		KGPursueGlyph,		KGSafetyGlyph		},
	{KGPortalGlyph,		KGPotencialGlyph,	KGHelpGlyph,		KGHumanGlyph,		KGFutureGlyph		},
	{KGPortalGlyph,		KGBarrierGlyph,		KGDefendGlyph,		KGHumanGlyph,		KGShaperGlyph		},
	{KGPortalGlyph,		KGImproveGlyph,		KGHumanGlyph,		KGFutureGlyph,		KGCivillizationGlyph	}
} ;

struct KGGlyphSentence
KGGetEmptySentence(void)
{
	struct KGGlyphSentence sentence = {
		.wordNum	= 0
	} ;
	return sentence ;
}

unsigned int
KGGet2WordSentenceNum(void)
{
	return sizeof(s_2words) / sizeof(struct KG2WordSentence) ;
}

struct KGGlyphSentence
KGGet2WordSentence(unsigned int index)
{
	unsigned int sentnum = KGGet2WordSentenceNum() ;
	if(index < sentnum){
		const struct KG2WordSentence * srcsent = &(s_2words[index]) ;
		struct KGGlyphSentence result ;
		result.wordNum		= 2 ;
		result.glyphWords[0]	= srcsent->word_1st ;
		result.glyphWords[1]	= srcsent->word_2nd ;
		return result ;
	} else {
		return KGGetEmptySentence() ;
	}
}

unsigned int
KGGet3WordSentenceNum(void)
{
	return sizeof(s_3words) / sizeof(struct KG3WordSentence) ;
}

struct KGGlyphSentence
KGGet3WordSentence(unsigned int index)
{
	unsigned int sentnum = KGGet3WordSentenceNum() ;
	if(index < sentnum){
		const struct KG3WordSentence * srcsent = &(s_3words[index]) ;
		struct KGGlyphSentence result ;
		result.wordNum		= 3 ;
		result.glyphWords[0]	= srcsent->word_1st ;
		result.glyphWords[1]	= srcsent->word_2nd ;
		result.glyphWords[2]	= srcsent->word_3rd ;
		return result ;
	} else {
		return KGGetEmptySentence() ;
	}
}

unsigned int
KGGet4WordSentenceNum(void)
{
	return sizeof(s_4words) / sizeof(struct KG4WordSentence) ;
}

struct KGGlyphSentence
KGGet4WordSentence(unsigned int index)
{
	unsigned int sentnum = KGGet4WordSentenceNum() ;
	if(index < sentnum){
		const struct KG4WordSentence * srcsent = &(s_4words[index]) ;
		struct KGGlyphSentence result ;
		result.wordNum		= 4 ;
		result.glyphWords[0]	= srcsent->word_1st ;
		result.glyphWords[1]	= srcsent->word_2nd ;
		result.glyphWords[2]	= srcsent->word_3rd ;
		result.glyphWords[3]	= srcsent->word_4th ;
		return result ;
	} else {
		return KGGetEmptySentence() ;
	}
}

unsigned int
KGGet5WordSentenceNum(void)
{
	return sizeof(s_5words) / sizeof(struct KG5WordSentence) ;
}

struct KGGlyphSentence
KGGet5WordSentence(unsigned int index)
{
	unsigned int sentnum = KGGet5WordSentenceNum() ;
	if(index < sentnum){
		const struct KG5WordSentence * srcsent = &(s_5words[index]) ;
		struct KGGlyphSentence result ;
		result.wordNum		= 5 ;
		result.glyphWords[0]	= srcsent->word_1st ;
		result.glyphWords[1]	= srcsent->word_2nd ;
		result.glyphWords[2]	= srcsent->word_3rd ;
		result.glyphWords[3]	= srcsent->word_4th ;
		result.glyphWords[4]	= srcsent->word_5th ;
		return result ;
	} else {
		return KGGetEmptySentence() ;
	}
}
