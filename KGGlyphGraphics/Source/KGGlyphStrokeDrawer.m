/**
 * @file	KGGlyphStrokeDrawer.m
 * @brief	Define KGGlyphStrokeDrawer class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphStrokeDrawer.h"
#import <KGGameData/KGGameData.h>

static void
drawStroke(CGContextRef context, const CGPoint * origin, const struct KGGlyphLayout * ginfo, const struct KGGlyphStroke * stroke, const struct CNRGB * color) ;

@implementation KGGlyphStrokeDrawer

- (instancetype) init
{
	if((self = [super init]) != nil){
		glyphStroke = KGStrokeOfGlyph(KGNilGlyph) ;
	}
	return self ;
}

- (void) setStroke: (const struct KGGlyphStroke *) stroke
{
	glyphStroke = *stroke ;
}

- (void) setColor: (const struct CNRGB *) color
{
	strokeColor = *color ;
}

- (void) drawWithContext: (CGContextRef) context inBoundsRect: (CGRect) boundsrect
{
	[super drawWithContext: context inBoundsRect: boundsrect] ;
	
	/* Draw vertexes */
	if(glyphStroke.edgeCount > 0){
		drawStroke(context, &(boundsrect.origin), &glyphLayout, &glyphStroke, &strokeColor) ;
	}
}

- (BOOL) isEditable
{
	return NO ;
}

- (void) setEditable: (BOOL) flag
{
	(void) flag ;
}

- (void) touchesBegan: (CGPoint) point inBoundsRect: (CGRect) boundsrect
{
	(void) point ; (void) boundsrect ;
}

- (void) touchesMoved: (CGPoint) newpoint inBoundsRect: (CGRect) boundsrect
{
	(void) newpoint ; (void) boundsrect ;
}

- (void) touchesEnded
{
}

- (void) touchesCancelled
{
}

@end

static void
drawStroke(CGContextRef context, const CGPoint * origin, const struct KGGlyphLayout * ginfo, const struct KGGlyphStroke * stroke, const struct CNRGB * color)
{
	CGContextSetLineWidth(context, ginfo->vertexSize) ;
	CGContextSetLineCap(context, kCGLineCapRound) ;
	KCSetStrokeColor(context, *color) ;
	
	unsigned int count = stroke->edgeCount ;
	unsigned int i ;
	for(i=0 ; i<count ; i++){
		const struct KGGlyphEdge * edge = &(stroke->edgeArray[i]) ;
		const struct CNCircle * fromvertex = &(ginfo->vertex[edge->fromVertex]) ;
		const struct CNCircle * tovertex   = &(ginfo->vertex[edge->toVertex]) ;
		CGPoint points[2] ;
		points[0] = CNAddPoints(&(fromvertex->center), origin) ;
		points[1] = CNAddPoints(&(tovertex->center), origin) ;
		CGContextAddLines(context, points, 2) ;
	}
	if(count > 0){
		CGContextStrokePath(context) ;
	}
}
