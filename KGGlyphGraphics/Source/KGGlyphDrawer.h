/**
 * @file	KGGlyphDrawer.h
 * @brief	Define KGGlyphDrawer class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <KCGraphicsView/KCGraphicsView.h>
#import "KGGlyphDefinition.h"

struct KGGlyphEdge {
	const struct CNCircle *	fromVertex ;
	const struct CNCircle * toVertex ;
	BOOL			isActive ;
} ;

struct KGGlyphInfo {
	CGFloat			vertexSize ;
	struct CNCircle		vertex[KGGLYPH_VERTEX_NUM] ;
	struct KGGlyphEdge	edge[KGGLYPH_EDGE_NUM] ;
} ;

@interface KGGlyphDrawer : KCGraphicsDrawer <KCGraphicsDrawing>
{
	BOOL			isInitialized ;
	CGSize			previousSize ;
	struct KGGlyphInfo	glyphInfo ;
}

- (instancetype) init ;

@end
