/**
 * @file	KGGlyphModel.h
 * @brief	Model of glyph
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <CoconutGraphics/CoconutGraphics.h>

#define KGGLYPH_VERTEX_NUM		11

struct KGGlyphEdge {
	uint8_t			fromVertex ;
	uint8_t			toVertex ;
} ;

struct KGGlyphStroke {
	unsigned int			edgeCount ;
	const struct KGGlyphEdge *	edgeArray ;
} ;

static inline struct KGGlyphStroke
KGMakeGlyphStroke(unsigned int count, const struct KGGlyphEdge * array)
{
	struct KGGlyphStroke result = {
		.edgeCount	= count,
		.edgeArray	= array
	} ;
	return result ;
}

