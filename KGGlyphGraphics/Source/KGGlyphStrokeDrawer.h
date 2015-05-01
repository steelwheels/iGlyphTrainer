/**
 * @file	KGGlyphStrokeDrawer.h
 * @brief	Define KGGlyphStrokeDrawer class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphObject.h"
#import <KCGraphicsView/KCGraphicsView.h>

@interface KGGlyphStrokeDrawer : KGGlyphObject <KCGraphicsDrawing>
{
	struct KGGlyphStroke	glyphStroke ;
	struct CNRGB		strokeColor ;
}

- (instancetype) init ;
- (void) setStroke: (const struct KGGlyphStroke *) stroke ;
- (void) setColor: (const struct CNRGB *) color ;

@end
