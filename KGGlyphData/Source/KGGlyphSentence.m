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
	{KGDestroyGlyph,	KGDifficultGlyph,	KGBarrierGlyph						},
	{KGGainGlyph,		KGCivillizationGlyph,	KGPeaceGlyph						},
	{KGDestroyGlyph,	KGWeakGlyph,		KGCivillizationGlyph					},
	{KGDestroyGlyph,	KGDestinyGlyph,		KGBarrierGlyph						},
	{KGCivillizationGlyph,	KGWarGlyph,		KGChaosGlyph						},
} ;

static const struct KG4WordSentence s_4words[] = {
	{KGGainGlyph,		KGPortalGlyph,		KGAttackGlyph,		KGWeakGlyph			},
	{KGPastGlyph,		KGAgainGlyph,		KGPresenceGlyph,	KGAgainGlyph			},
	{KGDestroyGlyph,	KGDestinyGlyph,		KGHumanGlyph,		KGLieGlyph			},
	{KGDestinyGlyph,	KGComplexGlyph,		KGShaperGlyph,		KGLieGlyph			},
	{KGRestraintGlyph,	KGPathGlyph,		KGGainGlyph,		KGHarmonyGlyph			},
} ;

static const struct KG5WordSentence s_5words[] = {
	{KGGainGlyph,		KGTruthGlyph,		KGOpenGlyph,		KGHumanGlyph,	KGSoulGlyph	},
	{KGOldGlyph,		KGNatureGlyph,		KGLessGlyph,		KGStrongGlyph,	KGNowGlyph	},
	{KGPastGlyph,		KGChaosGlyph,		KGCreateGlyph,		KGFutureGlyph,	KGHarmonyGlyph	},
	{KGPastGlyph,		KGPathGlyph,		KGCreateGlyph,		KGFutureGlyph,	KGJourneyGlyph	},
	{KGDestroyGlyph,	KGLieGlyph,		KGInsideGlyph,		KGGainGlyph,	KGSoulGlyph	},
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
