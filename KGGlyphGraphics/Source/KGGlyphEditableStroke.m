/**
 * @file	KGGlyphEditableStroke.m
 * @brief	Define KGGlyphEditableStroke data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphEditableStroke.h"

bool
KGAddGlyphEditableStroke(struct KGGlyphEditableStroke * dst, uint8_t fromvt, uint8_t tovt)
{
	unsigned int validnum = (dst->strokeBody).edgeCount ;
	if(KGGLYPH_EDITABLE_VERTEX_NUM <= validnum || KGGLYPH_VERTEX_NUM <= fromvt || KGGLYPH_VERTEX_NUM <= tovt){
		return false ;
	}
	(dst->storage[validnum]).fromVertex = fromvt ;
	(dst->storage[validnum]).toVertex   = tovt ;
	(dst->strokeBody).edgeCount += 1 ;
	return true ;
}