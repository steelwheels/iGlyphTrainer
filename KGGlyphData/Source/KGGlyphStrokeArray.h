/**
 * @file	KGGlyphStrokeArray.h
 * @brief	Define KGGlyphStrokeArray data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphModel.h"
#import "KGGlyphSentence.h"

struct KGGlyphStrokeArray {
	unsigned int		strokeNum ;
	struct KGGlyphStroke	strokeArray[KGMaxGlyphWordNum] ;
} ;

void
KGInitGlyphStrokeArray(struct KGGlyphStrokeArray * dst) ;

void
KGDestroyGlyphStrokeArray(struct KGGlyphStrokeArray * dst) ;

BOOL
KGAddStrokeToArray(struct KGGlyphStrokeArray * dst, const struct KGGlyphStroke * src) ;



