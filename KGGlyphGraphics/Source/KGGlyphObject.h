/**
 * @file	KGGlyphObject.h
 * @brief	Define KGGlyphObject class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <KGGlyphData/KGGlyphData.h>

struct KGGlyphLayout {
	CGFloat			vertexSize ;
	struct CNCircle		vertex[KGGLYPH_VERTEX_NUM] ;
} ;

static const CGFloat	OUT_RADIUS_DIFF = 8.0 ;

@interface KGGlyphObject : NSObject
{
	struct KGGlyphLayout		glyphLayout ;
	CGSize				previousGlyphSize ;
}

- (instancetype) init ;
- (void) drawWithContext: (CGContextRef) context inBoundsRect: (CGRect) boundsrect ;

@end
