/**
 * @file	KGGlyphSentence.m
 * @brief	Define KGGlyphSentence data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphSentence.h"

static const struct KGGlyphWords	s_0word = {} ;

static const struct KGGlyphWords	s_2words[] = {
	{
		{KGWarGlyph, KGChangeGlyph}
	}
} ;

#define COUNT_OF_ARRAY(V)	(sizeof(V) / sizeof(struct KGGlyphSentence))

struct KGGlyphSentence
KGGetEmptySentence(void)
{
	struct KGGlyphSentence sentence = {
		.wordNum	= 0,
		.wordArray	= s_0word
	} ;
	return sentence ;
}

unsigned int
KGGet2WordSentenceNum(void)
{
	return COUNT_OF_ARRAY(s_2words) ;
}

struct KGGlyphSentence
KGGet2WordSentence(unsigned int index)
{
	struct KGGlyphSentence sentence = {
		.wordNum	= 2,
		.wordArray	= s_2words[index]
	} ;
	return sentence ;
}