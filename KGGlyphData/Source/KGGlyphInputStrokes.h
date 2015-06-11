/**
 * @file	KGGlyphInputStrokes.h
 * @brief	Define KGGlyphInputStrokes data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphModel.h"
#import "KGGlyphSentence.h"

struct KGGlyphInputStrokes {
	unsigned int		strokeNum ;
	struct KGGlyphStroke	strokeArray[KGMaxGlyphWordNum] ;
} ;

struct KGGlyphInputStrokes
KGMakeEmptyInputStrokes(void) ;

void
KGClearGlyphInputStrokes(struct KGGlyphInputStrokes * dst) ;

struct KGGlyphStroke
KGGlyphInputStrokeAtIndex(struct KGGlyphInputStrokes * src, NSUInteger index) ;

BOOL
KGAddGlyphStrokeToInputStrokes(struct KGGlyphInputStrokes * dst, const struct KGGlyphStroke * src) ;





