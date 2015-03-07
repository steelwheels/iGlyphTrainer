/**
 * @file	KGGlyphDrawer.h
 * @brief	Define KGGlyphDrawer class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <KCGraphicsView/KCGraphicsView.h>
#import <KGGlyphData/KGGlyphData.h>

#define	KGGlyphBaseLayer		0
#define	KGGlyphStrokeLayer		1
#define KGGlyphTransparentViewNum	1


struct KGGlyphInfo {
	CGFloat			vertexSize ;
	struct CNCircle		vertex[KGGLYPH_VERTEX_NUM] ;
} ;

@interface KGGlyphDrawer : NSObject <KCGraphicsDrawing>
{
	BOOL			isInitialized ;
	CGSize			previousSize ;
	struct KGGlyphInfo	glyphInfo ;
	struct KGGlyphStroke	glyphStroke ;
}

- (instancetype) init ;

- (void) setStroke: (const struct KGGlyphStroke *) stroke ;

@end
