/**
 * @file	UTPrintStroken.h
 * @brief	Function to print KGGlyphStroke
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "UnitTest.h"

void
UTPrintStroke(const struct KGGlyphStroke * src)
{
	unsigned int count = src->edgeCount ;
	printf("{stroke edgeCount=%u\n", count) ;
	
	unsigned int i ;
	for(i=0 ; i<count ; i++){
		const struct KGGlyphEdge * edge = &((src->edgeArray)[i]) ;
		printf(" {%u, %u}\n", (unsigned int) edge->fromVertex, (unsigned int) edge->toVertex) ;
	}
	
	puts("}") ;
}
