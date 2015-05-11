/**
 * @file	KGGlyphComparator.m
 * @brief	Define function to compare glyph strokes
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphComparator.h"

static void
stroke2vertexes(int vertexes[KGGLYPH_VERTEX_NUM][KGGLYPH_VERTEX_NUM], const struct KGGlyphStroke * src) ;
static int
compareVertexes(int v0[KGGLYPH_VERTEX_NUM][KGGLYPH_VERTEX_NUM], int v1[KGGLYPH_VERTEX_NUM][KGGLYPH_VERTEX_NUM]) ;

int
KGCompareGlyphStrokes(const struct KGGlyphStroke * s0, const struct KGGlyphStroke * s1)
{
	int	vertexes0[KGGLYPH_VERTEX_NUM][KGGLYPH_VERTEX_NUM] ;
	int	vertexes1[KGGLYPH_VERTEX_NUM][KGGLYPH_VERTEX_NUM] ;
	
	stroke2vertexes(vertexes0, s0) ;
	stroke2vertexes(vertexes1, s1) ;
	return compareVertexes(vertexes0, vertexes1) ;
}

static void
stroke2vertexes(int vertexes[KGGLYPH_VERTEX_NUM][KGGLYPH_VERTEX_NUM], const struct KGGlyphStroke * src)
{
	/* Initialize the array */
	unsigned int i, j ;
	for(i=0 ; i<KGGLYPH_VERTEX_NUM ; i++){
		for(j=0 ; j<KGGLYPH_VERTEX_NUM ; j++){
			vertexes[i][j] = 0 ;
		}
	}
	
	unsigned int count = src->edgeCount ;
	for(i=0 ; i<count ; i++){
		uint8_t fv = (src->edgeArray[i]).fromVertex ;
		uint8_t tv = (src->edgeArray[i]).toVertex ;
		if(fv < KGGLYPH_VERTEX_NUM && tv < KGGLYPH_VERTEX_NUM){
			vertexes[fv][tv] = 1 ;
		} else {
			fprintf(stderr, "%s: Invalid vertex id (%u, %u)\n", __func__, fv, tv) ;
		}
	}
}

static int
compareVertexes(int v0[KGGLYPH_VERTEX_NUM][KGGLYPH_VERTEX_NUM], int v1[KGGLYPH_VERTEX_NUM][KGGLYPH_VERTEX_NUM])
{
	unsigned int i, j ;
	for(i=0 ; i<KGGLYPH_VERTEX_NUM ; i++){
		for(j=0 ; j<KGGLYPH_VERTEX_NUM ; j++){
			int diff = v0[i][j] - v1[i][j] ;
			if(diff != 0){
				return diff ;
			}
		}
	}
	return 0 ;
}



