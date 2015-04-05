/**
 * @file	KGGlyphKind.h
 * @brief	Define kind of glyphs
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <Foundation/Foundation.h>

typedef enum {
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
	KGBodyGlyph,
	KGBreathGlyph,
	KGCaptureGlyph,
	KGChangeGlyph,
	KGChaosGlyph,
	KGClearGlyph,
	KGClearAllGlyph,
	KGComplexGlyph,
	KGConflictGlyph,
	KGConsequenceGlyph
} KGGlyphKind ;

static const KGGlyphKind	KGRepeatGlyph		= KGAgainGlyph ;
static const KGGlyphKind	KGWarGlyph		= KGAttackGlyph ;
static const KGGlyphKind	KGStruggleGlyph		= KGAvoidGlyph ;
static const KGGlyphKind	KGObstacleGlyph		= KGBarrierGlyph ;
static const KGGlyphKind	KGHumanGlyph		= KGBeforeGlyph ;
static const KGGlyphKind	KGShellGlyph		= KGBodyGlyph ;
static const KGGlyphKind	KGModifyGlyph		= KGChangeGlyph ;