/**
 * @file	KGHackProgressDrawer.m
 * @brief	Define KGHackProgressDrawer class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGHackProgressDrawer.h"
#import <KGGameData/KGGameData.h>

static void
updateHexagonLayout(struct CNHexagon hexagon[], unsigned int maxnum, CGRect bounds) ;
static void
drawHexagon(CGContextRef context, unsigned int maxnum, unsigned int curno, struct CNHexagon hexagon[]) ;

@implementation KGHackProgressDrawer

@synthesize maxGlyphNum, processedGlyphNum ;

- (instancetype) init
{
	if((self = [super init]) != nil){
		previousBounds		= CGRectMake(0.0, 0.0, 0.0, 0.0) ;
		maxGlyphNum		= 0 ;
		processedGlyphNum	= 0 ;
		prevMaxGlyphNum		= 0 ;
	}
	return self ;
}

- (void) drawWithContext: (CGContextRef) context atLevel: (NSUInteger) level inBoundsRect: (CGRect) bounds
{
	(void) level ;
	
	if(maxGlyphNum == 0){
		return ;
	}
	
	if(!CGRectEqualToRect(previousBounds, bounds) || prevMaxGlyphNum != maxGlyphNum){
		updateHexagonLayout(hackHexagon, maxGlyphNum, bounds) ;
		previousBounds  = bounds ;
		prevMaxGlyphNum = maxGlyphNum ;
	}

	drawHexagon(context, maxGlyphNum, processedGlyphNum, hackHexagon) ;
}

@end

static void
updateHexagonLayout(struct CNHexagon hexagon[], unsigned int maxnum, CGRect bounds)
{
	CGFloat hexwidth  = bounds.size.width / KGLimitProgressCount ;
	CGFloat radius = MIN(hexwidth, bounds.size.height) / 2.0 ;
	
	CGFloat totalwidth = hexwidth * maxnum ;
	CGFloat offset = (bounds.size.width - totalwidth) / 2.0 ;
	
	CGFloat ycenter = bounds.size.height / 2.0 + bounds.origin.y ;
	for(unsigned int i=0 ; i<maxnum ; i++){
		CGPoint center = CGPointMake(offset + radius + bounds.origin.x, ycenter) ;
		hexagon[i] = CNMakeHexagon(center, radius) ;
		offset += radius * 2.0 ;
	}
}

static void
drawHexagon(CGContextRef context, unsigned int maxnum, unsigned int curnum, struct CNHexagon hexagon[])
{
	KGPreference * preference = [KGPreference sharedPreference] ;
	struct CNRGB glyphcolor = preference.glyphColor ;
	KCSetFillColor(context, glyphcolor) ;
	KCSetStrokeColor(context, glyphcolor) ;
	
	unsigned int	i ;
	for(i=0 ; i<curnum ; i++){
		KCFillHexagon(context, &(hexagon[i])) ;
	}
	for(i=curnum ; i<maxnum ; i++){
		KCDrawHexagon(context, &(hexagon[i])) ;
	}
}


