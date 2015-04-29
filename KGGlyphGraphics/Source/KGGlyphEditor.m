/**
 * @file	KGGlyphEditor.m
 * @brief	Define KGGlyphEditor class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphEditor.h"
#import <KGGameData/KGGameData.h>

static bool
getVertexId(unsigned int * vertexid, const struct KGGlyphInfo * ginfo, CGPoint point) ;

@implementation KGGlyphEditor

- (instancetype) init
{
	if((self = [super init]) != nil){
		isEditableFlag = NO ;
		hasBeginningVertex = hasEndingVertex = false ;
		KGInitGlyphEditableStroke(&editableStroke) ;
		[super setStroke: &(editableStroke.strokeBody)] ;
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

- (void) drawWithContext: (CGContextRef) context atLevel: (NSUInteger) level inBoundsRect: (CGRect) boundsrect
{
	if(isEditableFlag){
		[super setStroke: &(editableStroke.strokeBody)] ;
		[super drawWithContext: context atLevel: level inBoundsRect: boundsrect] ;
		if(level == KGGlyphStrokeLayer && hasBeginningVertex && hasEndingVertex){
			KGPreference * preference = [KGPreference sharedPreference] ;
			struct CNRGB strokecol = preference.glyphColor ;
			
			CGContextSetLineWidth(context, glyphInfo.vertexSize) ;
			CGContextSetLineCap(context, kCGLineCapRound) ;
			KCSetStrokeColor(context, strokecol) ;
			
			CGPoint		drawpoints[2] ;
			drawpoints[0] = glyphInfo.vertex[beginningVertexId].center ;
			drawpoints[1] = endingVertexPoint ;
			CGContextAddLines(context, drawpoints, 2) ;
			CGContextStrokePath(context) ;
		}
	} else {
		[super drawWithContext: context atLevel: level inBoundsRect: boundsrect] ;
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

- (void) touchesBegan: (CGPoint) point atLevel: (NSUInteger) level inBoundsRect: (CGRect) boundsrect
{
	(void) boundsrect ;
	if(level != KGGlyphStrokeLayer){
		return ;
	}
	unsigned int vid ;
	if(getVertexId(&vid, &glyphInfo, point)){
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

- (bool) touchesMoved: (CGPoint) newpoint atLevel: (NSUInteger) level inBoundsRect: (CGRect) boundsrect
{
	(void) boundsrect ;
	if(level != KGGlyphStrokeLayer){
		return false ;
	}
	BOOL		result = false ;
	unsigned int	vid ;
	if(getVertexId(&vid, &glyphInfo, newpoint)){
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
			result = true ;
		}
	} else {
		if(hasBeginningVertex){
			//printf("touchesMoved (3)\n") ;
			hasEndingVertex		= true ;
			endingVertexPoint	= newpoint ;
			result			= true ;
		} else {
			//printf("touchesMoved (4)\n") ;
		}
	}
	return result ;
}

- (bool) touchesEnded
{
	hasBeginningVertex	= false ;
	hasEndingVertex		= false ;
	return true ;
}

- (bool) touchesCancelled
{
	hasBeginningVertex	= false ;
	hasEndingVertex		= false ;
	return true ;
}

@end

static bool
getVertexId(unsigned int * vertexid, const struct KGGlyphInfo * ginfo, CGPoint point)
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
