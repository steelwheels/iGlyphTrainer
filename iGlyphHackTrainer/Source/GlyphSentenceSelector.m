/**
 * @file	GlyphSentenceSelector.m
 * @brief	Define glyph selection function
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "GlyphSentenceSelector.h"
#import <KGGameData/KGGameData.h>

struct KGGlyphSentence
SelectGlyphSentence(void)
{
	KGPreference *	preference = [KGPreference sharedPreference] ;
	NSUInteger maxlen = preference.maxQuestionSentenceLength ;
	NSUInteger minlen = preference.minQuestionSentenceLength ;
	unsigned int sentlen = (unsigned int) [CNRandom randomIntegerBetween: minlen and: maxlen] ;
	
	unsigned int sentnum = KGGetSentenceNum(sentlen) ;
	unsigned int sentidx = (unsigned int) [CNRandom randomIntegerBetween: 0 and: sentnum-1] ;
	
	return KGGetSentence(sentlen, sentidx) ;
}
