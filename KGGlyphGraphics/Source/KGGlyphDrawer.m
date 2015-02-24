/**
 * @file	KGGlyphDrawer.m
 * @brief	Define KGGlyphDrawer class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphDrawer.h"
#import <CoconutGraphics/CoconutGraphics.h>
#import <CoconutGraphics/CNGraphicsUtil.h>

static void
updateLayout(struct KGGlyphInfo * ginfo, const CGSize * size) ;
static void
drawContent(CGContextRef context, const CGPoint * origin, const struct KGGlyphInfo * ginfo) ;

@implementation KGGlyphDrawer

- (instancetype) init
{
	if((self = [super init]) != nil){
		previousSize = CGSizeMake(0.0, 0.0) ;
	}
	return self ;
}

- (void) drawWithContext: (CGContextRef) context inBoundsRect: (CGRect) boundsrect
{
	if(!CNIsSameSize(&previousSize, &(boundsrect.size))){
		updateLayout(&glyphInfo, &(boundsrect.size)) ;
		previousSize = boundsrect.size ;
	}
	drawContent(context, &(boundsrect.origin), &glyphInfo) ;
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
	CGFloat radius = min(size->width, size->height) / 2.0 ;
	
	unsigned int	i ;
	CGFloat		angle = CNPi / 2.0 ;
	CGFloat		adiff = CNPi * 2.0 / 6.0 ;
	for(i=0 ; i<6 ; i++){
		ginfo->vertex[i] = makeVertex(hcenter, vcenter, radius, angle) ;
		angle += adiff ;
	}
	
	CGFloat	x0, y0, x1, y1, dx, dy ;
	x0 = (ginfo->vertex[5]).center.x ; y0 = (ginfo->vertex[5]).center.y ;
	x1 = (ginfo->vertex[2]).center.x ; y1 = (ginfo->vertex[2]).center.y ;
	dx = (x1 - x0) / 4.0 ;
	dy = (y1 - y0) / 4.0 ;
	for(i=0 ; i<3 ; i++){
		x0 += dx ; y0 += dy ;
		ginfo->vertex[6+i] = CNMakeCircle(x0, y0, radius/20.0) ;
	}
	
	x0 = (ginfo->vertex[1]).center.x ; y0 = (ginfo->vertex[1]).center.y ;
	x1 = (ginfo->vertex[4]).center.x ; y1 = (ginfo->vertex[4]).center.y ;
	dx = (x1 - x0) / 4.0 ;
	dy = (y1 - y0) / 4.0 ;
	ginfo->vertex[ 9] = CNMakeCircle(x0+dx,     y0+dy,     radius/20.0) ;
	ginfo->vertex[10] = CNMakeCircle(x0+dx*3.0, y0+dy*3.0, radius/20.0) ;
}

static inline void
drawVertex(CGContextRef context, const CGPoint * origin, const struct CNCircle * circle)
{
	CGFloat radius2 = circle->radius * 2 ;
	struct CGRect bounds = {
		.origin = {
			.x = origin->x + (circle->center).x - circle->radius,
			.y = origin->y + (circle->center).y - circle->radius
		},
		.size = {
			.width	= radius2,
			.height = radius2
		}
	} ;
	CGContextFillEllipseInRect(context, bounds) ;
}

static void
drawContent(CGContextRef context, const CGPoint * origin, const struct KGGlyphInfo * ginfo)
{
	unsigned int i ;
	for(i=0 ; i<KGGLYPH_VERTEX_NUM ; i++){
		drawVertex(context, origin, &(ginfo->vertex[i])) ;
	}
	
}

