/**
 * @file	KGGlyphComparator.m
 * @brief	Define function to compare glyph strokes
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphComparator.h"

static void
stroke2vertexes(int vertexes[], const struct KGGlyphStroke * src) ;
static int
compareVertexes(int v0[], int v1[]) ;

int
KGCompareGlyphStrokes(const struct KGGlyphStroke * s0, const struct KGGlyphStroke * s1)
{
	int	vertexes0[KGGLYPH_VERTEX_NUM] ;
	int	vertexes1[KGGLYPH_VERTEX_NUM] ;
	
	stroke2vertexes(vertexes0, s0) ;
	stroke2vertexes(vertexes1, s1) ;
	return compareVertexes(vertexes0, vertexes1) ;
}

static void
stroke2vertexes(int vertexes[], const struct KGGlyphStroke * src)
{
	/* Initialize the array */
	unsigned int i ;
	for(i=0 ; i<KGGLYPH_VERTEX_NUM ; i++){
		vertexes[i] = 0 ;
	}
	
	unsigned int count = src->edgeCount ;
	for(i=0 ; i<count ; i++){
		uint8_t fv = (src->edgeArray[i]).fromVertex ;
		if(fv < KGGLYPH_VERTEX_NUM){
			vertexes[fv] = 1 ;
		} else {
			fprintf(stderr, "%s: Invalid vertex id (%u)\n", __func__, fv) ;
		}
		uint8_t tv = (src->edgeArray[i]).toVertex ;
		if(tv < KGGLYPH_VERTEX_NUM){
			vertexes[tv] = 1 ;
		} else {
			fprintf(stderr, "%s: Invalid vertex id (%u)\n", __func__, tv) ;
		}
	}
}

static int
compareVertexes(int v0[], int v1[])
{
	unsigned int i ;
	for(i=0 ; i<KGGLYPH_VERTEX_NUM ; i++){
		int diff = v0[i] - v1[i] ;
		if(diff != 0){
			return diff ;
		}
	}
	return 0 ;
}



