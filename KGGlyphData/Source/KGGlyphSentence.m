/**
 * @file	KGGlyphSentence.m
 * @brief	Define KGGlyphSentence data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphSentence.h"

static const struct KGGlyphSentence	s_2word_sentences[] = {
	{
		{KGWarGlyph, KGChangeGlyph}
	}
} ;

#define COUNT_OF_ARRAY(V)	(sizeof(V) / sizeof(struct KGGlyphSentence))

unsigned int
KGGet2WordSentence(const struct KGGlyphSentence ** ptr)
{
	*ptr = s_2word_sentences ;
	return COUNT_OF_ARRAY(s_2word_sentences) ;
}