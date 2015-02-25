/**
 * @file	KGGlyphStroke.m
 * @brief	Define KGGlyphStroke data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphStroke.h"

static struct KGGlyphStroke
makeStroke(unsigned int count, const uint8_t * strokes)
{
	struct KGGlyphStroke result = {
		.strokeCount	= count,
		.strokeArray	= strokes
	} ;
	return result ;
}

struct KGGlyphStroke
KGStrokeOfGlyph(KGGlyphKind kind)
{
#	define COUNT_OF_ARRAY(VAR)	(sizeof(VAR) / sizeof(uint8_t))
	struct KGGlyphStroke result  ;
	switch(kind){
		case KGAbondonGlyph: {
			static uint8_t	s_strokes[] = {3, 4, 9, 7, 10, 1} ;
			result = makeStroke(COUNT_OF_ARRAY(s_strokes), s_strokes) ;
		} break ;
		case KGAdaptGlyph: {
			static uint8_t	s_strokes[] = {5, 9, 7, 8} ;
			result = makeStroke(COUNT_OF_ARRAY(s_strokes), s_strokes) ;
		} break ;
		case KGAdvanceGlyph: {
			static uint8_t	s_strokes[] = {0, 6, 4} ;
			result = makeStroke(COUNT_OF_ARRAY(s_strokes), s_strokes) ;
		} break ;
		case KGAfterGlyph: {
			static uint8_t	s_strokes[] = {1, 2, 8, 7, 10, 1} ;
			result = makeStroke(COUNT_OF_ARRAY(s_strokes), s_strokes) ;
		} break ;
	}
	return result ;
}

