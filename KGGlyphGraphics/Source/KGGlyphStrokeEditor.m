/**
 * @file	KGGlyphStrokeEditor.m
 * @brief	Define KGGlyphStrokeEditor class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphStrokeEditor.h"
#import <KGGameData/KGGameData.h>

static const BOOL		doDebug = NO ;

#if TARGET_OS_IPHONE
#	define	KCColor			UIColor
#	define	KCBezierPath		UIBezierPath
#else
#	define	KCColor			NSColor
#	define	KCBezierPath		NSBezierPath
#endif

static bool
getVertexId(unsigned int * vertexid, const struct KGGlyphLayout * ginfo, CGPoint point) ;
static void
drawVertexes(CGContextRef context, const CGPoint * origin, const struct KGGlyphLayout * ginfo, const struct KGGlyphEditableStroke * strokes) ;

static inline void
setStrokeVetex(struct KGGlyphStrokeVertex * dst, BOOL isvalid, unsigned int vertexid)
{
	dst->isValid	= isvalid ;
	dst->vetexId	= vertexid ;
}

@implementation KGGlyphStrokeEditor

- (instancetype) init
{
	if((self = [super init]) != nil){
		isEditable = NO ;
		imageCanvas = nil ;
		bezierPath = nil ;
		KGInitGlyphEditableStroke(&editableStroke) ;
		setStrokeVetex(&prevVertex, NO, 0) ;
#		if TARGET_OS_IPHONE
		drawColor = [UIColor whiteColor] ;
#		else
		drawColor = [NSColor whiteColor] ;
#		endif
	}
	return self ;
}

- (BOOL) isEditable
{
	return isEditable ;
}

- (void) setEditable: (BOOL) flag
{
	isEditable = flag ;
	if(!flag){
		bezierPath = nil ;
	}
}

- (void) touchesBegan: (CGPoint) point inBoundsRect: (CGRect) boundsrect
{
	(void) boundsrect ;
	
	if(!isEditable){
		return  ;
	}
	if(doDebug){
		NSLog(@"KGInitGlyphEditableStroke") ;
	}
	KGInitGlyphEditableStroke(&editableStroke) ;
	
	unsigned int vid ;
	if(getVertexId(&vid, &glyphLayout, point)){
		setStrokeVetex(&prevVertex, YES, vid) ;
	} else {
		setStrokeVetex(&prevVertex, NO, 0) ;
	}
	
	CGFloat radius = glyphLayout.vertexSize ;
	
	bezierPath = [KCBezierPath bezierPath];
	bezierPath.lineCapStyle = kCGLineCapRound;
	bezierPath.lineWidth = radius * 1.5 ;
	[bezierPath moveToPoint: point];

	KCPreference * pref = [KCPreference sharedPreference] ;
	KCColor * col = [pref color: @"GlyphColor"] ;
	if(col){
		drawColor = col ;
	}
}

- (void) touchesMoved: (CGPoint) newpoint inBoundsRect: (CGRect) boundsrect
{
	(void) boundsrect ;
	
	if(!isEditable){
		return  ;
	}
	unsigned int	vid ;
	if(getVertexId(&vid, &glyphLayout, newpoint)){
		if(prevVertex.isValid){
			if(prevVertex.vetexId != vid){
				if(doDebug){
					NSLog(@"KGAddGlyphEditableStroke") ;
				}
				KGAddGlyphEditableStroke(&editableStroke, prevVertex.vetexId, vid) ;
			}
		}
		setStrokeVetex(&prevVertex, YES, vid) ;
	}
#	if TARGET_OS_IPHONE
	[bezierPath addLineToPoint: newpoint];
#	else
	[bezierPath lineToPoint: newpoint];
#	endif
	
}

- (void *) touchesEnded
{
	bezierPath = nil ;
	setStrokeVetex(&prevVertex, NO, 0) ;
	return &(editableStroke.strokeBody) ;
}

- (void) touchesCancelled
{
	bezierPath = nil ;
	setStrokeVetex(&prevVertex, NO, 0) ;
}

- (void) drawWithContext: (CGContextRef) context inBoundsRect: (CGRect) boundsrect
{
	[super drawWithContext: context inBoundsRect: boundsrect] ;
	if(isEditable && bezierPath != nil){
		[drawColor setStroke] ;
		[bezierPath stroke] ;
		drawVertexes(context, &(boundsrect.origin), &glyphLayout, &editableStroke) ;
	}
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

static void
drawVertex(CGContextRef context, const CGPoint * origin, const struct KGGlyphLayout * ginfo, uint8_t vertex)
{
	struct CNCircle circle = ginfo->vertex[vertex] ;
	
	CGFloat radius  = circle.radius ;
	struct CGRect bounds = {
		.origin = {
			.x = origin->x + (circle.center).x - radius,
			.y = origin->y + (circle.center).y - radius
		},
		.size = {
			.width	= radius * 2.0,
			.height = radius * 2.0
		}
	} ;
	CGContextFillEllipseInRect(context, bounds) ;
}

static void
drawVertexes(CGContextRef context, const CGPoint * origin, const struct KGGlyphLayout * ginfo, const struct KGGlyphEditableStroke * strokes)
{
	CNColorTable * ctable = [CNColorTable defaultColorTable] ;
	KCSetFillColor(context, ctable.goldenrod) ;
	
	unsigned int i, count = (strokes->strokeBody).edgeCount ;
	for(i=0 ; i<count ; i++){
		struct KGGlyphEdge edge = strokes->storage[i] ;
		drawVertex(context, origin, ginfo, edge.fromVertex) ;
		drawVertex(context, origin, ginfo, edge.toVertex) ;
	}
}

