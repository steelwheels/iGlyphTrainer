/**
 * @file	KGGlyphSentence.h
 * @brief	Define KGGlyphSentence data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphKind.h"

#define KGMaxGlyphWordNum			5

struct KGGlyphWords {
	KGGlyphKind		glyphWords[KGMaxGlyphWordNum] ;
} ;

struct KGGlyphSentence {
	unsigned int		wordNum ;
	struct KGGlyphWords	wordArray ;
} ;

struct KGGlyphSentence
KGGetEmptySentence(void) ;

unsigned int
KGGet2WordSentenceNum(void) ;

struct KGGlyphSentence
KGGet2WordSentence(unsigned int index) ;
