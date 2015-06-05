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

const struct KGGlyphInputStrokes *
KGSharedGlyphInputStrokes(void) ;

void
KGClearSharedGlyphInputStrokes(void) ;

struct KGGlyphStroke
KGSharedGlyphInputStrokeAtIndex(NSUInteger index) ;

BOOL
KGAddStrokeToSharedInputStrokes(const struct KGGlyphStroke * src) ;



