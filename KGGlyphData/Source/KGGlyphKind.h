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
	KGAdaptGlyph,
	KGAdvanceGlyph,
	KGAfterGlyph,
	KGAgainGlyph,
	KGAllGlyph,
	KGAnswerGlyph,
	KGAttackGlyph,
	KGAvoidGlyph,
	KGBarrierGlyph,
	KGBeforeGlyph,
	KGBeginGlyph,
	KGBeingGlyph,
	KGBodyGlyph,
	KGBreathGlyph,
	KGCaptureGlyph,
	KGChangeGlyph,
	KGChaosGlyph,
	KGClearGlyph,
	KGClearAllGlyph,
	KGComplexGlyph,
	KGConflictGlyph,
	KGConsequenceGlyph,
	KGContemplateGlyph,
	KGContactGlyph,
	KGCourageGlyph,
	KGCreateGlyph,
	KGCreativityGlyph,
	KGMindGlyph,
	KGDangerGlyph,
	KGDataGlyph,
	KGDefendGlyph,
	KGDestinationGlyph,
	KGDestinyGlyph,
	KGDestroyGlyph,
	KGDeteriorateGlyph,
	KGDieGlyph,
	KGDifficultGlyph,
	KGDiscoverGlyph
} KGGlyphKind ;

static const KGGlyphKind	KGFirstClyph		= KGAbandonGlyph ;
static const KGGlyphKind	KGLastClyph		= KGDiscoverGlyph ;

static const KGGlyphKind	KGRepeatGlyph		= KGAgainGlyph ;
static const KGGlyphKind	KGWarGlyph		= KGAttackGlyph ;
static const KGGlyphKind	KGStruggleGlyph		= KGAvoidGlyph ;
static const KGGlyphKind	KGObstacleGlyph		= KGBarrierGlyph ;
static const KGGlyphKind	KGHumanGlyph		= KGBeingGlyph ;
static const KGGlyphKind	KGShellGlyph		= KGBodyGlyph ;
static const KGGlyphKind	KGModifyGlyph		= KGChangeGlyph ;
static const KGGlyphKind	KGReduceGlyph		= KGContactGlyph ;
static const KGGlyphKind	KGCreationGlyph		= KGCreateGlyph ;
static const KGGlyphKind	KGThroughtGlyph		= KGMindGlyph ;
static const KGGlyphKind	KGIdeaGlyph		= KGMindGlyph ;
static const KGGlyphKind	KGSignalGlyph		= KGDataGlyph ;
static const KGGlyphKind	KGMessageGlyph		= KGDataGlyph ;
static const KGGlyphKind	KGDestructionGlyph	= KGDestroyGlyph ;
static const KGGlyphKind	KGErodeGlyph		= KGDeteriorateGlyph ;

