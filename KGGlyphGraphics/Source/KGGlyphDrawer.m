/**
 * @file	KGGlyphDrawer.m
 * @brief	Define KGGlyphDrawer class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphDrawer.h"
#import <CoconutGraphics/CoconutGraphics.h>

static void
updateLayout(struct KGGlyphInfo * ginfo, const CGSize * size) ;
static void
drawVertexes(CGContextRef context, const CGPoint * origin, const struct KGGlyphInfo * ginfo) ;
static void
drawStroke(CGContextRef context, const CGPoint * origin, const struct KGGlyphInfo * ginfo, const struct KGGlyphStroke * stroke) ;

@implementation KGGlyphDrawer

- (instancetype) init
{
	if((self = [super init]) != nil){
		isInitialized = NO ;
		previousSize = CGSizeMake(0.0, 0.0) ;
	}
	return self ;
}

- (void) drawWithContext: (CGContextRef) context atLevel: (NSUInteger) level inBoundsRect: (CGRect) boundsrect
{
	(void) level ;
	
	if(!isInitialized){
		CNColorTable * ctable = [CNColorTable defaultColorTable] ;
		struct CNRGB strokecol = ctable.white ;
		KCSetStrokeColor(context, &strokecol) ;
		isInitialized = YES ;
	}
	if(!CNIsSameSize(&previousSize, &(boundsrect.size))){
		updateLayout(&glyphInfo, &(boundsrect.size)) ;
		previousSize = boundsrect.size ;
	}

	drawVertexes(context, &(boundsrect.origin), &glyphInfo) ;
	drawStroke(context, &(boundsrect.origin), &glyphInfo, &glyphStroke) ;
	
	
}

- (void) setStroke: (const struct KGGlyphStroke *) stroke
{
	glyphStroke = *stroke ;
}

@end

static inline CGFloat
min(CGFloat s0, CGFloat s1)
{
	return s0 <= s1 ? s0 : s1 ;
}

static inline struct CNCircle
makeVertex(CGFloat hcenter, CGFloat vcenter, CGFloat radius, CGFloat angle)
{
	CGFloat x = hcenter + radius * cos(angle) ;
	CGFloat y = vcenter + radius * sin(angle) ;
	return CNMakeCircle(x, y, radius/20.0) ;
}

static void
updateLayout(struct KGGlyphInfo * ginfo, const CGSize * size)
{
	CGFloat hcenter = size->width  / 2.0 ;
	CGFloat vcenter = size->height / 2.0 ;
	CGFloat radius  = min(size->width, size->height) / 2.0 ;
	CGFloat vsize   = radius / 20.0 ;
	
	ginfo->vertexSize = vsize ;
	
	unsigned int	i ;
	CGFloat		angle = CNPi / 2.0 ;
	CGFloat		adiff = CNPi * 2.0 / 6.0 ;
	for(i=0 ; i<6 ; i++){
		ginfo->vertex[i] = makeVertex(hcenter, vcenter, radius, angle) ;
		angle -= adiff ;
	}
	
	CGFloat	x0, y0, x1, y1, dx, dy ;
	
	x0 = (ginfo->vertex[5]).center.x ; y0 = (ginfo->vertex[5]).center.y ;
	x1 = (ginfo->vertex[2]).center.x ; y1 = (ginfo->vertex[2]).center.y ;
	dx = (x1 - x0) / 4.0 ;
	dy = (y1 - y0) / 4.0 ;
	for(i=0 ; i<3 ; i++){
		x0 += dx ; y0 += dy ;
		ginfo->vertex[6+i] = CNMakeCircle(x0, y0, vsize) ;
	}
	
	x0 = (ginfo->vertex[1]).center.x ; y0 = (ginfo->vertex[1]).center.y ;
	x1 = (ginfo->vertex[4]).center.x ; y1 = (ginfo->vertex[4]).center.y ;
	dx = (x1 - x0) / 4.0 ;
	dy = (y1 - y0) / 4.0 ;
	ginfo->vertex[ 9] = CNMakeCircle(x0+dx*3.0, y0+dy*3.0, vsize) ;
	ginfo->vertex[10] = CNMakeCircle(x0+dx,     y0+dy,     vsize) ;
}

static inline void
drawVertex(CGContextRef context, CGGradientRef gradient, const CGPoint * origin, const struct CNCircle * circle)
{
	CGContextSaveGState(context);
	
	CGFloat inradius  = circle->radius ;
	CGFloat outradius = inradius + 8.0 ;

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
drawVertexes(CGContextRef context, const CGPoint * origin, const struct KGGlyphInfo * ginfo)
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

static void
drawStroke(CGContextRef context, const CGPoint * origin, const struct KGGlyphInfo * ginfo, const struct KGGlyphStroke * stroke)
{
	CNColorTable * ctable = [CNColorTable defaultColorTable] ;
	struct CNRGB gold = [ctable goldenrod] ;
	
	CGContextSetLineWidth(context, ginfo->vertexSize) ;
	CGContextSetLineCap(context, kCGLineCapRound) ;
	KCSetStrokeColor(context, &gold) ;
	
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





