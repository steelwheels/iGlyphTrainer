/**
 * @file	KGGlyphStroke.h
 * @brief	Define KGGlyphStroke data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphKind.h"

struct KGGlyphStroke {
	unsigned int		strokeCount ;
	const uint8_t *		strokeArray ;
} ;

struct KGGlyphStroke
KGStrokeOfGlyph(KGGlyphKind kind) ;


