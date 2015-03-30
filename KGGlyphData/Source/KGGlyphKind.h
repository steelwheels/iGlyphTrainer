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
	KGBeginGlyph
} KGGlyphKind ;

static const KGGlyphKind	KGRepeatGlyph		= KGAgainGlyph ;
static const KGGlyphKind	KGWarGlyph		= KGAttackGlyph ;
static const KGGlyphKind	KGStruggleGlyph		= KGAvoidGlyph ;
static const KGGlyphKind	KGObstacleGlyph		= KGBarrierGlyph ;