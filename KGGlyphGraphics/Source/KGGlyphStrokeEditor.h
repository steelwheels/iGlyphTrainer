/**
 * @file	KGGlyphStrokeEditor.h
 * @brief	Define KGGlyphStrokeEditor class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphObject.h"
#import "KGGlyphEditableStroke.h"
#import <KCGraphicsView/KCGraphicsView.h>

struct KGGlyphStrokeVertex {
	BOOL		isValid ;
	unsigned int	vetexId ;
} ;

@interface KGGlyphStrokeEditor : KGGlyphObject <KCGraphicsDrawing>
{
#	if TARGET_OS_IPHONE
	UIImageView *			imageCanvas ;
	UIBezierPath *			bezierPath ;
	UIColor *			drawColor ;
#	else
	NSImageView *			imageCanvas ;
	NSBezierPath *			bezierPath ;
	NSColor *			drawColor ;
#	endif
	BOOL				isEditable ;
	struct KGGlyphEditableStroke	editableStroke ;
	struct KGGlyphStrokeVertex	prevVertex ;

}

- (instancetype) init ;

@end
