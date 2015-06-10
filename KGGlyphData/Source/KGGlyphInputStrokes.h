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

static inline void
KGInitGlyphInputStrokes(struct KGGlyphInputStrokes * dst)
{
	dst->strokeNum = 0 ;
}

void
KGClearGlyphInputStrokes(struct KGGlyphInputStrokes * dst) ;

struct KGGlyphStroke
KGGlyphInputStrokeAtIndex(struct KGGlyphInputStrokes * src, NSUInteger index) ;

BOOL
KGAddStrokeToInputStrokes(struct KGGlyphInputStrokes * dst, const struct KGGlyphStroke * src) ;



