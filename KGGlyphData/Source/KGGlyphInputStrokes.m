/**
 * @file	KGGlyphInputStrokes.m
 * @brief	Define KGGlyphInputStrokes data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphInputStrokes.h"


static struct KGGlyphInputStrokes *
sharedGlyphInputStrokes(void) ;
static void
KGInitInpurGlyphStrokes(struct KGGlyphInputStrokes * dst) ;
static void
KGClearGlyphInputStrokes(struct KGGlyphInputStrokes * dst) ;
static BOOL
KGAddStrokeToInputStrokes(struct KGGlyphInputStrokes * dst, const struct KGGlyphStroke * src) ;

const struct KGGlyphInputStrokes *
KGSharedGlyphInputStrokes(void)
{
	return sharedGlyphInputStrokes() ;
}

void
KGClearSharedGlyphInputStrokes(void)
{
	KGClearGlyphInputStrokes(sharedGlyphInputStrokes()) ;
}

BOOL
KGAddStrokeToSharedInputStrokes(const struct KGGlyphStroke * src)
{
	return KGAddStrokeToInputStrokes(sharedGlyphInputStrokes(), src) ;
}

static struct KGGlyphInputStrokes *
sharedGlyphInputStrokes(void)
{
	static struct KGGlyphInputStrokes s_input_strokes ;
	static BOOL isinitialized = NO ;
	if(!isinitialized){
		KGInitInpurGlyphStrokes(&s_input_strokes) ;
		isinitialized = YES ;
	}
	return &s_input_strokes ;
}

static void
KGInitInpurGlyphStrokes(struct KGGlyphInputStrokes * dst)
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

static void
KGClearGlyphInputStrokes(struct KGGlyphInputStrokes * dst)
{
	/* Clear dynamic allocated memory */
	unsigned int i ;
	for(i=0 ; i<KGMaxGlyphWordNum ; i++){
		const struct KGGlyphEdge * edges = (dst->strokeArray[i]).edgeArray ;
		if(edges != NULL){
			free((void *) edges) ;
		}
	}
	/* Initialize */
	KGInitInpurGlyphStrokes(dst) ;
}

static BOOL
KGAddStrokeToInputStrokes(struct KGGlyphInputStrokes * dst, const struct KGGlyphStroke * src)
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

