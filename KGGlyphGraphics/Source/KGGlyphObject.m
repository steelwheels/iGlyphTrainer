/**
 * @file	KGGlyphObject.m
 * @brief	Define KGGlyphObject class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphObject.h"

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

@interface KGGlyphObject ()
- (void) updateLayout: (const CGSize *) size ;
@end

@implementation KGGlyphObject

- (instancetype) init
{
	if((self = [super init]) != nil){
		previousGlyphSize = CGSizeMake(0.0, 0.0) ;
	}
	return self ;
}

- (void) drawWithContext: (CGContextRef) context inBoundsRect: (CGRect) boundsrect
{
	(void) context ;
	
	/* Update graphics layout */
	if(!CNIsSameSize(&previousGlyphSize, &(boundsrect.size))){
		[self updateLayout: &(boundsrect.size)] ;
		previousGlyphSize = boundsrect.size ;
	}
}

- (void) updateLayout: (const CGSize *) size
{
	CGFloat hcenter = size->width  / 2.0 ;
	CGFloat vcenter = size->height / 2.0 ;
	CGFloat radius  = min(size->width, size->height) / 2.0 ;
	CGFloat vsize   = radius / 20.0 ;
	radius = radius - vsize - OUT_RADIUS_DIFF ;
	
	glyphLayout.vertexSize = vsize ;
	
	unsigned int	i ;
	CGFloat		angle = CNPi / 2.0 ;
	CGFloat		adiff = CNPi * 2.0 / 6.0 ;
	for(i=0 ; i<6 ; i++){
		glyphLayout.vertex[i] = makeVertex(hcenter, vcenter, radius, angle) ;
		angle -= adiff ;
	}
	
	CGFloat	x0, y0, x1, y1, dx, dy ;
	
	x0 = (glyphLayout.vertex[5]).center.x ; y0 = (glyphLayout.vertex[5]).center.y ;
	x1 = (glyphLayout.vertex[2]).center.x ; y1 = (glyphLayout.vertex[2]).center.y ;
	dx = (x1 - x0) / 4.0 ;
	dy = (y1 - y0) / 4.0 ;
	for(i=0 ; i<3 ; i++){
		x0 += dx ; y0 += dy ;
		glyphLayout.vertex[6+i] = CNMakeCircle(x0, y0, vsize) ;
	}
	
	x0 = (glyphLayout.vertex[1]).center.x ; y0 = (glyphLayout.vertex[1]).center.y ;
	x1 = (glyphLayout.vertex[4]).center.x ; y1 = (glyphLayout.vertex[4]).center.y ;
	dx = (x1 - x0) / 4.0 ;
	dy = (y1 - y0) / 4.0 ;
	glyphLayout.vertex[ 9] = CNMakeCircle(x0+dx*3.0, y0+dy*3.0, vsize) ;
	glyphLayout.vertex[10] = CNMakeCircle(x0+dx,     y0+dy,     vsize) ;
}

@end
