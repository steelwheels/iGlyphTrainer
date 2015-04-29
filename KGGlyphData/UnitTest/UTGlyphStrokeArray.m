/**
 * @file	UTGlyphStrokeArray.h
 * @brief	Unit test for KGGlyphStrokeArray data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "UnitTest.h"

static struct KGGlyphEdge s_edges1[] = {
	{0, 1},
	{1, 2}
} ;

static struct KGGlyphStroke s_stroke1 = {
	.edgeCount	= 2,
	.edgeArray	= s_edges1
} ;

static struct KGGlyphEdge s_edges2[] = {
	{3, 2},
	{2, 1},
	{1, 0}
} ;

static struct KGGlyphStroke s_stroke2 = {
	.edgeCount	= 3,
	.edgeArray	= s_edges2
} ;

static void
printGlyphStrokeArray(struct KGGlyphStrokeArray * array) ;

BOOL
UTGlyphStrokeArray(void)
{
	struct KGGlyphStrokeArray	strokearray ;
	KGInitGlyphStrokeArray(&strokearray) ;
	puts("** init state") ;
	printGlyphStrokeArray(&strokearray) ;
	
	KGAddStrokeToArray(&strokearray, &s_stroke1) ;
	puts("** added state") ;
	printGlyphStrokeArray(&strokearray) ;
	
	KGAddStrokeToArray(&strokearray, &s_stroke2) ;
	puts("** added state") ;
	printGlyphStrokeArray(&strokearray) ;
	
	KGDestroyGlyphStrokeArray(&strokearray) ;
	puts("** after destruct") ;
	printGlyphStrokeArray(&strokearray) ;
	
	return YES ;
}

static void
printGlyphStrokeArray(struct KGGlyphStrokeArray * array)
{
	unsigned int num = array->strokeNum ;
	printf("[stroke %u\n", num) ;
	
	unsigned int i ;
	for(i=0 ; i<num ; i++){
		UTPrintStroke(&(array->strokeArray[i])) ;
	}
	
	puts("]") ;
}
