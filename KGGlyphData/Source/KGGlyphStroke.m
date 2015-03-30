/**
 * @file	KGGlyphStroke.m
 * @brief	Define KGGlyphStroke data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphStroke.h"

static struct KGGlyphStroke
makeStroke(unsigned int count, const struct KGGlyphEdge * edges)
{
	struct KGGlyphStroke result = {
		.edgeCount	= count,
		.edgeArray	= edges
	} ;
	return result ;
}

struct KGGlyphStroke
KGStrokeOfGlyph(KGGlyphKind kind)
{
#	define COUNT_OF_ARRAY(VAR)	(sizeof(VAR) / sizeof(struct KGGlyphEdge))
	struct KGGlyphStroke result  ;
	switch(kind){
		case KGAbandonGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 3,  4},
				{ 4,  9},
				{ 9,  7},
				{ 7, 10},
				{10,  1}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGAdaptGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 5,  9},
				{ 9,  7},
				{ 7,  8}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGAdvanceGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 4,  6},
				{ 6,  0}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGAfterGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 7, 10},
				{10,  1},
				{ 1,  2},
				{ 2,  8},
				{ 8,  7}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGAgainGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 4,  6},
				{ 6,  9},
				{ 9, 10},
				{10,  8}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGAllGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,  1},
				{ 1,  2},
				{ 2,  3},
				{ 3,  4},
				{ 4,  5},
				{ 5,  0}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGAnswerGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 6, 10},
				{10,  8},
				{ 8,  7}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGAttackGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 4,  6},
				{ 6,  0},
				{ 0, 10},
				{10,  2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGAvoidGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 5,  0},
				{ 0, 10},
				{10,  1},
				{ 1,  8}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGBarrierGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,  7},
				{ 7,  8},
				{ 8,  2}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGBeforeGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 5,  6},
				{ 6,  7},
				{ 7,  9},
				{ 9,  4},
				{ 4,  5}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
		case KGBeginGlyph: {
			static struct KGGlyphEdge s_stroke[] = {
				{ 0,  9},
				{ 9,  3},
				{ 3,  8}
			} ;
			result = makeStroke(COUNT_OF_ARRAY(s_stroke), s_stroke) ;
		} break ;
	}
	return result ;
}

