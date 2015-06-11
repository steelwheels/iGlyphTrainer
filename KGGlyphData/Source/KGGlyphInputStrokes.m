/**
 * @file	KGGlyphInputStrokes.m
 * @brief	Define KGGlyphInputStrokes data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphInputStrokes.h"
#import "KGGlyphStroke.h"

static void
copyGlyphStroke(struct KGGlyphStroke * dst, const struct KGGlyphStroke * src)
{
	unsigned int count = src->edgeCount ;
	dst->edgeCount = count ;
	if(count > 0){
		size_t arrsize = sizeof(struct KGGlyphEdge) * count ;
		struct KGGlyphEdge * newarr = (struct KGGlyphEdge *) malloc(arrsize) ;
		dst->edgeArray = newarr ;
		memcpy(newarr, src->edgeArray, arrsize) ;
	} else {
		dst->edgeArray = NULL ;
	}
}

static inline void
freeGlypStroke(struct KGGlyphStroke * dst)
{
	if(dst->edgeArray){
		free((void *) dst->edgeArray) ;
		dst->edgeArray = NULL ;
	}
	dst->edgeCount = 0 ;
}

struct KGGlyphInputStrokes
KGMakeEmptyInputStrokes(void)
{
	struct KGGlyphInputStrokes result ;
	result.strokeNum = 0 ;
	unsigned int i ;
	for(i=0 ; i<KGMaxGlyphWordNum ; i++){
		result.strokeArray[i].edgeCount = 0 ;
		result.strokeArray[i].edgeArray = NULL ;
	}
	return result ;
}

void
KGClearGlyphInputStrokes(struct KGGlyphInputStrokes * dst)
{
	unsigned int i, count = dst->strokeNum ;
	for(i=0 ; i<count ; i++){
		freeGlypStroke(&(dst->strokeArray[i])) ;
	}
	dst->strokeNum = 0 ;
}

struct KGGlyphStroke
KGGlyphInputStrokeAtIndex(struct KGGlyphInputStrokes * src, NSUInteger index)
{
	if(index < src->strokeNum){
		return src->strokeArray[index] ;
	} else {
		struct KGGlyphStroke empty = KGMakeGlyphStroke(0, NULL) ;
		return empty ;
	}
}

BOOL
KGAddGlyphStrokeToInputStrokes(struct KGGlyphInputStrokes * dst, const struct KGGlyphStroke * src)
{
	if(dst->strokeNum < KGMaxGlyphWordNum){
		struct KGGlyphStroke clonestroke ;
		copyGlyphStroke(&clonestroke, src) ;
		dst->strokeArray[dst->strokeNum] = clonestroke ;
		dst->strokeNum += 1 ;
		return YES ;
	} else {
		assert(false) ;
		return NO ;
	}
}

