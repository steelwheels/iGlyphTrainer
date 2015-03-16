/**
 * @file	KGHackProgressDrawer.m
 * @brief	Define KGHackProgressDrawer class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGHackProgressDrawer.h"

static void
updateHexagonLayout(struct CNHexagon hexagon[], KGHackProgress * progress, CGRect bounds) ;
static void
drawHexagon(CGContextRef context, KGHackProgress * progress, struct CNHexagon hexagon[]) ;

@implementation KGHackProgressDrawer

- (instancetype) init
{
	if((self = [super init]) != nil){
		hackProgress = nil ;
		previousBounds = CGRectMake(0.0, 0.0, 0.0, 0.0) ;
	}
	return self ;
}

- (void) setHackProgress: (KGHackProgress *) progress
{
	hackProgress = progress ;
}

- (void) drawWithContext: (CGContextRef) context atLevel: (NSUInteger) level inBoundsRect: (CGRect) bounds
{
	(void) level ;
	if(hackProgress == nil){
		return  ;
	}
	if(!CGRectEqualToRect(previousBounds, bounds)){
		updateHexagonLayout(hackHexagon, hackProgress, bounds) ;
		previousBounds = bounds ;
	}
	drawHexagon(context, hackProgress, hackHexagon) ;
}

@end

static void
updateHexagonLayout(struct CNHexagon hexagon[], KGHackProgress * progress, CGRect bounds)
{
	CGFloat hexwidth  = bounds.size.width / KGLimitProgressCount ;
	CGFloat radius = MIN(hexwidth, bounds.size.height) / 2.0 ;
	
	unsigned int maxprogress = progress.maxProgress ;
	CGFloat totalwidth = hexwidth * maxprogress ;
	CGFloat offset = (bounds.size.width - totalwidth) / 2.0 ;
	
	CGFloat ycenter = bounds.size.height / 2.0 + bounds.origin.y ;
	for(unsigned int i=0 ; i<maxprogress ; i++){
		CGPoint center = CGPointMake(offset + radius + bounds.origin.x, ycenter) ;
		hexagon[i] = CNMakeHexagon(center, radius) ;
		offset += radius * 2.0 ;
	}
}

static void
drawHexagon(CGContextRef context, KGHackProgress * progress, struct CNHexagon hexagon[])
{
	unsigned int	maxprogress = progress.maxProgress ;
	unsigned int	curprogress = progress.currentProgress ;
	unsigned int	i ;
	for(i=0 ; i<curprogress ; i++){
		KCFillHexagon(context, &(hexagon[i])) ;
	}
	for(i=curprogress ; i<maxprogress ; i++){
		KCDrawHexagon(context, &(hexagon[i])) ;
	}
}


