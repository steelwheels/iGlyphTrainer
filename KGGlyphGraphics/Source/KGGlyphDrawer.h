/**
 * @file	KGGlyphDrawer.h
 * @brief	Define KGGlyphDrawer class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <KCGraphicsView/KCGraphicsView.h>
#import "KGGlyphDefinition.h"

struct KGGlyphState {
	BOOL			isActive ;
} ;

struct KGGlyphInfo {
	CGFloat			vertexSize ;
	struct CNCircle		vertex[KGGLYPH_VERTEX_NUM] ;
	struct KGGlyphState	edge[KGGLYPH_VERTEX_NUM][KGGLYPH_VERTEX_NUM] ;
} ;

struct KGGlyphEdge {
	uint8_t			fromVertex ;
	uint8_t			toVertex ;
} ;

@interface KGGlyphDrawer : KCGraphicsDrawer <KCGraphicsDrawing>
{
	BOOL			isInitialized ;
	CGSize			previousSize ;
	struct KGGlyphInfo	glyphInfo ;
}

- (instancetype) init ;

- (void) setActiveEdges: (const struct KGGlyphEdge *) edges withCount: (unsigned int) count ;
- (void) clearActiveEdges ;

@end
