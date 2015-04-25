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

static inline unsigned int
KGGetSentenceNum(unsigned int wordnum)
{
	unsigned int result = 0 ;
	switch(wordnum){
		case 2: result = KGGet2WordSentenceNum() ;	break ;
		case 3: result = KGGet3WordSentenceNum() ;	break ;
		case 4: result = KGGet4WordSentenceNum() ;	break ;
		case 5: result = KGGet5WordSentenceNum() ;	break ;
	}
	return result ;
}

static inline struct KGGlyphSentence
KGGetSentence(unsigned int wordnum, unsigned int index)
{
	struct KGGlyphSentence result = KGGetEmptySentence() ;
	switch(wordnum){
		case 2: result = KGGet2WordSentence(index) ;	break ;
		case 3: result = KGGet3WordSentence(index) ;	break ;
		case 4: result = KGGet4WordSentence(index) ;	break ;
		case 5: result = KGGet5WordSentence(index) ;	break ;
	}
	return result ;
}
