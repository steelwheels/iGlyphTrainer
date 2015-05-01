/**
 * @file	KGGlyphVertexDrawer.m
 * @brief	Define KGGlyphVertexDrawer class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphVertexDrawer.h"

static void
drawVertexes(CGContextRef context, const CGPoint * origin, const struct KGGlyphLayout * ginfo) ;

@implementation KGGlyphVertexDrawer

- (void) drawWithContext: (CGContextRef) context inBoundsRect: (CGRect) boundsrect
{
	[super drawWithContext: context inBoundsRect: boundsrect] ;
	
	/* Setup stroke color */
	CNColorTable * ctable = [CNColorTable defaultColorTable] ;
	struct CNRGB strokecol = ctable.white ;
	KCSetStrokeColor(context, strokecol) ;
	
	/* Draw vertexes */
	drawVertexes(context, &(boundsrect.origin), &glyphLayout) ;
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
drawVertex(CGContextRef context, CGGradientRef gradient, const CGPoint * origin, const struct CNCircle * circle)
{
	CGContextSaveGState(context);
	
	CGFloat inradius  = circle->radius ;
	CGFloat outradius = inradius + OUT_RADIUS_DIFF ;
	
	struct CGRect bounds = {
		.origin = {
			.x = origin->x + (circle->center).x - outradius,
			.y = origin->y + (circle->center).y - outradius
		},
		.size = {
			.width	= outradius * 2.0,
			.height = outradius * 2.0
		}
	} ;
	
	CGContextAddEllipseInRect(context, bounds);
	CGContextClip(context) ;
	
	CGPoint center = CGPointMake(origin->x + (circle->center).x, origin->y + (circle->center).y) ;
	CGContextDrawRadialGradient(context,
				    gradient,
				    center,
				    inradius,
				    center,
				    outradius,
				    kCGGradientDrawsAfterEndLocation);
	
	CGContextRestoreGState(context);
}

static void
drawVertexes(CGContextRef context, const CGPoint * origin, const struct KGGlyphLayout * ginfo)
{
	CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
	static const CGFloat components[] = {
		1.0f, 1.0f, 1.0f, 1.0f,
		0.5f, 0.5f, 0.5f, 1.0f,
		0.0f, 0.0f, 0.0f, 1.0f,
	};
	static const CGFloat locations[] = { 0.0, 0.5, 1.0 };
	
	size_t count = sizeof(components)/ (sizeof(CGFloat)* 4);
	CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, count);
	
	unsigned int i ;
	for(i=0 ; i<KGGLYPH_VERTEX_NUM ; i++){
		drawVertex(context, gradient, origin, &(ginfo->vertex[i])) ;
	}
	
	CGGradientRelease(gradient);
	CGColorSpaceRelease(colorspace);
}


