/**
 * @file	KGGlyphStrokeArray.m
 * @brief	Define KGGlyphStrokeArray data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphStrokeArray.h"

void
KGInitGlyphStrokeArray(struct KGGlyphStrokeArray * dst)
{
	dst->strokeNum = 0 ;
	unsigned int i ;
	for(i=0 ; i<KGMaxGlyphWordNum ; i++){
		static const struct KGGlyphStroke estroke = {
			.edgeCount	= 0,
			.edgeArray	= NULL
		} ;
		dst->strokeArray[i] = estroke ;
	}
}

void
KGDestroyGlyphStrokeArray(struct KGGlyphStrokeArray * dst)
{
	unsigned int i ;
	for(i=0 ; i<KGMaxGlyphWordNum ; i++){
		const struct KGGlyphEdge * edges = (dst->strokeArray[i]).edgeArray ;
		if(edges != NULL){
			free((void *) edges) ;
			(dst->strokeArray[i]).edgeArray = NULL ;
		}
		(dst->strokeArray[i]).edgeCount = 0 ;
	}
	dst->strokeNum = 0 ;
}

BOOL
KGAddStrokeToArray(struct KGGlyphStrokeArray * dst, const struct KGGlyphStroke * src)
{
	unsigned int idx = dst->strokeNum ;
	if(idx >= KGMaxGlyphWordNum){
		return NO ;
	}
	const struct KGGlyphEdge * dstedges = ((dst->strokeArray)[idx]).edgeArray ;
	size_t newsize = sizeof(struct KGGlyphEdge) * src->edgeCount ;
	struct KGGlyphEdge * newedges = realloc((void *) dstedges, newsize) ;
	memcpy(newedges, src->edgeArray, newsize) ;
	struct KGGlyphStroke newstroke = {
		.edgeCount	= src->edgeCount,
		.edgeArray	= newedges
	} ;
	(dst->strokeArray)[idx] = newstroke ;
	dst->strokeNum += 1 ;
	return YES ;
}

