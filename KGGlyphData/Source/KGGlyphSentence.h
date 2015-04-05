/**
 * @file	KGGlyphSentence.h
 * @brief	Define KGGlyphSentence data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphKind.h"

#define KGMaxGlyphWordNum			5

struct KGGlyphSentence {
	KGGlyphKind		glyphWords[KGMaxGlyphWordNum] ;
} ;

unsigned int
KGGet2WordSentence(const struct KGGlyphSentence ** ptr) ;
