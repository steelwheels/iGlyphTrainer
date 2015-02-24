/**
 * @file	KGGlyphDrawer.h
 * @brief	Define KGGlyphDrawer class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <KCGraphicsView/KCGraphicsView.h>
#import "KGGlyphDefinition.h"

struct KGGlyphInfo {
	struct CNCircle		vertex[KGGLYPH_VERTEX_NUM] ;
} ;

@interface KGGlyphDrawer : KCGraphicsDrawer <KCGraphicsDrawing>
{
	CGSize			previousSize ;
	struct KGGlyphInfo	glyphInfo ;
}

- (instancetype) init ;

@end
