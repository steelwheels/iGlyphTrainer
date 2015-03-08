/**
 * @file	KGGlyphEditableStroke.h
 * @brief	Define KGGlyphEditableStroke data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <KGGlyphData/KGGlyphData.h>
 
#define KGGLYPH_EDITABLE_VERTEX_NUM	(KGGLYPH_VERTEX_NUM*2)

struct KGGlyphEditableStroke {
	struct KGGlyphStroke		strokeBody ;
	struct KGGlyphEdge		storage[KGGLYPH_EDITABLE_VERTEX_NUM] ;
} ;

static inline void
KGInitGlyphEditableStroke(struct KGGlyphEditableStroke * dst)
{
	dst->strokeBody = KGMakeGlyphStroke(0, dst->storage) ;
}

bool
KGAddGlyphEditableStroke(struct KGGlyphEditableStroke * dst, uint8_t fromvt, uint8_t tovt) ;

