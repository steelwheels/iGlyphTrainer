/**
 * @file	KGGlyphDrawer.h
 * @brief	Define KGGlyphDrawer class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <KCGraphicsView/KCGraphicsView.h>
#import <KGGlyphData/KGGlyphData.h>

struct KGGlyphInfo {
	CGFloat			vertexSize ;
	struct CNCircle		vertex[KGGLYPH_VERTEX_NUM] ;
} ;

@interface KGGlyphDrawer : KCGraphicsDrawer <KCGraphicsDrawing>
{
	BOOL			isInitialized ;
	CGSize			previousSize ;
	struct KGGlyphInfo	glyphInfo ;
	struct KGGlyphStroke	glyphStroke ;
}

- (instancetype) init ;

- (void) setStroke: (const struct KGGlyphStroke *) stroke ;

@end
