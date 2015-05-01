/**
 * @file	KGGlyphStrokeEditor.m
 * @brief	Define KGGlyphStrokeEditor class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphStrokeEditor.h"
#import <KGGameData/KGGameData.h>

static bool
getVertexId(unsigned int * vertexid, const struct KGGlyphLayout * ginfo, CGPoint point) ;

@implementation KGGlyphStrokeEditor

- (instancetype) init
{
	if((self = [super init]) != nil){
		isEditableFlag = NO ;
		hasBeginningVertex = hasEndingVertex = false ;
		KGInitGlyphEditableStroke(&editableStroke) ;
	}
	return self ;
}

- (const struct KGGlyphStroke *) glyphStroke
{
	return &(editableStroke.strokeBody) ;
}

- (void) clearGlyphStroke
{
	KGClearGlyphEditableStroke(&editableStroke) ;
}

- (void) drawWithContext: (CGContextRef) context inBoundsRect: (CGRect) boundsrect
{
	[super setStroke: &(editableStroke.strokeBody)] ;
	[super drawWithContext: context inBoundsRect: boundsrect] ;
	printf("*** %s\n", __func__) ;
	
	if(hasBeginningVertex && hasEndingVertex){
		KGPreference * preference = [KGPreference sharedPreference] ;
		struct CNRGB strokecol = preference.glyphColor ;
		
		CGContextSetLineWidth(context, glyphLayout.vertexSize) ;
		CGContextSetLineCap(context, kCGLineCapRound) ;
		KCSetStrokeColor(context, strokecol) ;
		
		CGPoint		drawpoints[2] ;
		drawpoints[0] = glyphLayout.vertex[beginningVertexId].center ;
		drawpoints[1] = endingVertexPoint ;
		CGContextAddLines(context, drawpoints, 2) ;
		CGContextStrokePath(context) ;
	}
}

- (BOOL) isEditable
{
	return isEditableFlag ;
}

- (void) setEditable: (BOOL) flag
{
	isEditableFlag = flag ;
}

- (void) touchesBegan: (CGPoint) point inBoundsRect: (CGRect) boundsrect
{
	(void) boundsrect ;
	
	unsigned int vid ;
	if(getVertexId(&vid, &glyphLayout, point)){
		//printf("touchesBegin (0) : %u\n", vid) ;
		hasBeginningVertex	= true ;
		beginningVertexId	= vid ;
		hasEndingVertex		= false ;
	} else {
		//puts("touchesBegin (1)") ;
		hasBeginningVertex	= false ;
		hasEndingVertex		= false ;
	}
}

- (void) touchesMoved: (CGPoint) newpoint inBoundsRect: (CGRect) boundsrect
{
	(void) boundsrect ;
	unsigned int	vid ;
	if(getVertexId(&vid, &glyphLayout, newpoint)){
		if(!hasBeginningVertex){
			//printf("touchesMoved (0) : %u\n", vid) ;
			hasBeginningVertex	= true ;
			beginningVertexId	= vid ;
		} else {
			if(beginningVertexId != vid){
				//printf("touchesMoved (1) : %u\n", vid) ;
				KGAddGlyphEditableStroke(&editableStroke, beginningVertexId, vid) ;
				hasBeginningVertex	= true ;
				beginningVertexId	= vid ;
				hasEndingVertex		= false ;
			} else {
				//printf("touchesMoved (2) : %u\n", vid) ;
				hasEndingVertex		= true ;
				endingVertexPoint	= newpoint ;
			}
		}
	} else {
		if(hasBeginningVertex){
			//printf("touchesMoved (3)\n") ;
			hasEndingVertex		= true ;
			endingVertexPoint	= newpoint ;
		} else {
			//printf("touchesMoved (4)\n") ;
		}
	}
}

- (void) touchesEnded
{
	hasBeginningVertex	= false ;
	hasEndingVertex		= false ;
}

- (void) touchesCancelled
{
	hasBeginningVertex	= false ;
	hasEndingVertex		= false ;
}

@end

static bool
getVertexId(unsigned int * vertexid, const struct KGGlyphLayout * ginfo, CGPoint point)
{
	unsigned int i ;
	for(i=0 ; i<KGGLYPH_VERTEX_NUM ; i++){
		struct CNCircle vertex = ginfo->vertex[i] ;
		vertex.radius *= 2.0 ;
		CGRect bounds = CNBoundsOfCircle(&vertex) ;
		if(CGRectContainsPoint(bounds, point)){
			*vertexid = i ;
			return true ;
		}
	}
	return false ;
}

