/**
 * @file	KGGlyphDumper.m
 * @brief	Define functions to dump glyph-data
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphDumper.h"

static void
printIndent(FILE * outfp, unsigned int indent)
{
	unsigned int i ;
	for(i=0 ; i<indent ; i++){
		fputc(' ', outfp) ;
	}
}

void
KGDumpGlyphStroke(FILE * outfp, unsigned int indent, const struct KGGlyphStroke * src)
{
	printIndent(outfp, indent) ;
	fprintf(outfp, "KGGlyphStroke [%u] = {\n", src->edgeCount) ;
	
	const struct KGGlyphEdge * edgeptr = src->edgeArray ;
	const struct KGGlyphEdge * endedge = edgeptr + src->edgeCount ;
	
	printIndent(outfp, indent+1) ;
	for( ; edgeptr<endedge ; edgeptr++){
		printf("{%u, %u} ", (unsigned int) edgeptr->fromVertex, (unsigned int) edgeptr->toVertex) ;
	}
	fputs("\n", outfp) ;
	
	printIndent(outfp, indent) ;
	fputs("}\n", outfp) ;
}

void
KGDumpGlyphInputStroke(FILE * outfp, unsigned int indent, const struct KGGlyphInputStrokes * src)
{
	printIndent(outfp, indent) ;
	fprintf(outfp, "KGGlyphInputStrokes [%u] = {\n", src->strokeNum) ;
	
	unsigned int i, count = src->strokeNum ;
	unsigned int nindent = indent + 1 ;
	for(i=0 ; i<count ; i++){
		KGDumpGlyphStroke(outfp, nindent, &(src->strokeArray[i])) ;
	}
	
	printIndent(outfp, indent) ;
	fputs("}\n", outfp) ;
}
