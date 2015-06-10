/**
 * @file	KGHackProgressDrawer.m
 * @brief	Define KGHackProgressDrawer class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGHackProgressDrawer.h"
#import <KGGameData/KGGameData.h>

static void
clearStates(KGHackState states[]) ;
static void
updateHexagonLayout(struct CNHexagon hexagon[], unsigned int maxnum, CGRect bounds) ;
static void
drawHexagon(CGContextRef context, unsigned int maxnum, const KGHackState states[], struct CNHexagon hexagon[],
	    struct CN3PointsLineGradient * normalgradient,
	    struct CN3PointsLineGradient * correctgradient,
	    struct CN3PointsLineGradient * wronggradient) ;

@implementation KGHackProgressDrawer

- (instancetype) init
{
	if((self = [super init]) != nil){
		clearStates(hackStates) ;
		maxGlyphNum		= 0 ;
		nextIndex		= 0 ;
		previousBounds		= CGRectMake(0.0, 0.0, 0.0, 0.0) ;
		prevMaxGlyphNum		= 0 ;
		
		KGPreference * preference = [KGPreference sharedPreference] ;
		struct CNRGB normalcol  = [preference normalGlyphColor] ;
		struct CNRGB correctcol = [preference correctGlyphColor] ;
		struct CNRGB wrongcol   = [preference wrongGlyphColor] ;
		
		CNColorTable * ctable = [CNColorTable defaultColorTable] ;
		struct CNRGB blackcol = [ctable black] ;
		
		normalGlyphGradient	= CNAllocate3PointsLineGradient(normalcol, blackcol, normalcol) ;
		correctGlyphGradient	= CNAllocate3PointsLineGradient(correctcol, blackcol, correctcol) ;
		wrongGlyphGradient	= CNAllocate3PointsLineGradient(wrongcol, blackcol, wrongcol) ;
	}
	return self ;
}

- (void) dealloc
{
	CNRelease3PointsLineGradient(&normalGlyphGradient) ;
	CNRelease3PointsLineGradient(&correctGlyphGradient) ;
	CNRelease3PointsLineGradient(&wrongGlyphGradient) ;
}

- (void) drawWithContext: (CGContextRef) context inBoundsRect: (CGRect) bounds
{	
	if(maxGlyphNum == 0){
		return ;
	}
	
	if(!CGRectEqualToRect(previousBounds, bounds) || prevMaxGlyphNum != maxGlyphNum){
		updateHexagonLayout(hackHexagon, maxGlyphNum, bounds) ;
		previousBounds  = bounds ;
		prevMaxGlyphNum = maxGlyphNum ;
	}

	drawHexagon(context, maxGlyphNum, hackStates, hackHexagon,
		    &normalGlyphGradient, &correctGlyphGradient, &wrongGlyphGradient) ;
}

- (void) setMaxGlyphNum: (unsigned int) maxnum
{
	maxGlyphNum	= maxnum ;
}

- (void) clearStates
{
	clearStates(hackStates) ;
	nextIndex = 0 ;
}

- (void) addNextHackState: (KGHackState) state
{
	if(nextIndex < maxGlyphNum){
		hackStates[nextIndex] = state ;
		nextIndex++ ;
	} else {
		NSLog(@"Invalid next index") ;
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

- (void *) touchesEnded
{
	return NULL ;
}

- (void) touchesCancelled
{
}

@end

static void
clearStates(KGHackState states[])
{
	unsigned int i ;
	for(i=0 ; i<KGLimitProgressCount ; i++){
		states[i] = KGNotHackedAtDisplayState ;
	}
}

static void
updateHexagonLayout(struct CNHexagon hexagon[], unsigned int maxnum, CGRect bounds)
{
	CGFloat hexwidth  = bounds.size.width / KGLimitProgressCount ;
	CGFloat radius = MIN(hexwidth, bounds.size.height) / 2.0 ;
	
	CGFloat totalwidth = radius * 2.0 * maxnum ;
	CGFloat offset = (bounds.size.width - totalwidth) / 2.0 ;
	
	CGFloat ycenter = bounds.size.height / 2.0 + bounds.origin.y ;
	for(unsigned int i=0 ; i<maxnum ; i++){
		CGPoint center = CGPointMake(offset + radius + bounds.origin.x, ycenter) ;
		hexagon[i] = CNMakeHexagon(center, radius) ;
		offset += radius * 2.0 ;
	}
}

static void
drawHexagon(CGContextRef context, unsigned int maxnum, const KGHackState states[], struct CNHexagon hexagon[],
	    struct CN3PointsLineGradient * normalgradient, struct CN3PointsLineGradient * correctgradient, struct CN3PointsLineGradient * wronggradient)
{
	static const unsigned int GradientStartIndex	= -1 ;
	static const unsigned int GradientEndIndex	= GradientStartIndex + (6 / 2) ;
	
	KGPreference * preference = [KGPreference sharedPreference] ;	
	unsigned int	i ;
	for(i=0 ; i<maxnum ; i++){
		switch(states[i]){
			case KGNotHackedAtDisplayState: {
				struct CNRGB gcolor = preference.normalGlyphColor ;
				KCSetStrokeColor(context, gcolor) ;
				KCDrawHexagon(context, &(hexagon[i])) ;
			} break ;
			case KGHackedAtDisplayState: {
				struct CNRGB gcolor = preference.normalGlyphColor ;
				KCSetStrokeColor(context, gcolor) ;
				KCSetFillColor(context, gcolor) ;
				KCFillHexagonWithLineGradiation(context, normalgradient, &(hexagon[i]), GradientStartIndex, GradientEndIndex) ;
			} break ;
			case KGNotHackedAtEvaluationState: {
				struct CNRGB gcolor = preference.correctGlyphColor ;
				KCSetStrokeColor(context, gcolor) ;
				KCDrawHexagon(context, &(hexagon[i])) ;
			} break ;
			case KGCorrectHackedAtEvaluationState: {
				struct CNRGB gcolor = preference.correctGlyphColor ;
				KCSetStrokeColor(context, gcolor) ;
				KCSetFillColor(context, gcolor) ;
				KCFillHexagonWithLineGradiation(context, correctgradient, &(hexagon[i]), GradientStartIndex, GradientEndIndex) ;
			} break ;
			case KGWrongHackedAtEvaluationState: {
				struct CNRGB gcolor = preference.wrongGlyphColor ;
				KCSetStrokeColor(context, gcolor) ;
				KCSetFillColor(context, gcolor) ;
				KCFillHexagonWithLineGradiation(context, wronggradient, &(hexagon[i]), GradientStartIndex, GradientEndIndex) ;
			} break ;
		}
	}
}



