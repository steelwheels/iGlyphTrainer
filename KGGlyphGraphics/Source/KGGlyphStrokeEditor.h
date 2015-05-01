/**
 * @file	KGGlyphStrokeEditor.h
 * @brief	Define KGGlyphStrokeEditor class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphStrokeDrawer.h"
#import "KGGlyphEditableStroke.h"
#import <KCGraphicsView/KCGraphicsView.h>

@interface KGGlyphStrokeEditor : KGGlyphStrokeDrawer <KCGraphicsDrawing>
{
	BOOL				isEditableFlag ;
	bool				hasBeginningVertex ;
	unsigned int			beginningVertexId ;
	bool				hasEndingVertex ;
	CGPoint				endingVertexPoint ;
	struct KGGlyphEditableStroke	editableStroke ;
}

- (instancetype) init ;
- (const struct KGGlyphStroke *) glyphStroke ;
- (void) clearGlyphStroke ;

@end
