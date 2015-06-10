/**
 * @file	KGGlyphDumper.h
 * @brief	Define functions to dump glyph-data
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphInputStrokes.h"

void
KGDumpGlyphStroke(FILE * outfp, unsigned int indent, const struct KGGlyphStroke * src) ;

void
KGDumpGlyphInputStroke(FILE * outfp, unsigned int indent, const struct KGGlyphInputStrokes * src) ;
