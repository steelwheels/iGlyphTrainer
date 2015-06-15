/**
 * @file	KGGlyphComparator.m
 * @brief	Define function to compare glyph strokes
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphComparator.h"

static void
stroke2vertexes(uint8_t vertexes[KGGLYPH_VERTEX_NUM][KGGLYPH_VERTEX_NUM], const struct KGGlyphStroke * src) ;

static inline int
compareVertexes(uint8_t v0[KGGLYPH_VERTEX_NUM][KGGLYPH_VERTEX_NUM], uint8_t v1[KGGLYPH_VERTEX_NUM][KGGLYPH_VERTEX_NUM])
{
	return memcmp(v0, v1, KGGLYPH_VERTEX_NUM * KGGLYPH_VERTEX_NUM) ;
}

int
KGCompareGlyphStrokes(const struct KGGlyphStroke * s0, const struct KGGlyphStroke * s1)
{
	uint8_t	vertexes0[KGGLYPH_VERTEX_NUM][KGGLYPH_VERTEX_NUM] ;
	uint8_t	vertexes1[KGGLYPH_VERTEX_NUM][KGGLYPH_VERTEX_NUM] ;
	
	stroke2vertexes(vertexes0, s0) ;
	stroke2vertexes(vertexes1, s1) ;
	return compareVertexes(vertexes0, vertexes1) ;
}

static void
stroke2vertexes(uint8_t vertexes[KGGLYPH_VERTEX_NUM][KGGLYPH_VERTEX_NUM], const struct KGGlyphStroke * src)
{
	/* Initialize the array */
	memset(vertexes, 0, KGGLYPH_VERTEX_NUM * KGGLYPH_VERTEX_NUM) ;

	unsigned int count = src->edgeCount ;
	unsigned int i ;
	for(i=0 ; i<count ; i++){
		uint8_t fv = (src->edgeArray[i]).fromVertex ;
		uint8_t tv = (src->edgeArray[i]).toVertex ;
		if(fv < KGGLYPH_VERTEX_NUM && tv < KGGLYPH_VERTEX_NUM){
			vertexes[fv][tv] = 1 ;
			vertexes[tv][fv] = 1 ;
		} else {
			fprintf(stderr, "%s: Invalid vertex id (%u, %u)\n", __func__, fv, tv) ;
		}
	}
}




