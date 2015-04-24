/**
 * @file	KGGlyphSentence.h
 * @brief	Define KGGlyphSentence data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphKind.h"

#define KGMaxGlyphWordNum			5

struct KGGlyphSentence {
	unsigned int		wordNum ;
	KGGlyphKind		glyphWords[KGMaxGlyphWordNum] ;
} ;

struct KGGlyphSentence
KGGetEmptySentence(void) ;

unsigned int
KGGet2WordSentenceNum(void) ;

struct KGGlyphSentence
KGGet2WordSentence(unsigned int index) ;

unsigned int
KGGet3WordSentenceNum(void) ;

struct KGGlyphSentence
KGGet3WordSentence(unsigned int index) ;

unsigned int
KGGet4WordSentenceNum(void) ;

struct KGGlyphSentence
KGGet4WordSentence(unsigned int index) ;

unsigned int
KGGet5WordSentenceNum(void) ;

struct KGGlyphSentence
KGGet5WordSentence(unsigned int index) ;
