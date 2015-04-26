/**
 * @file	KGGlyphEditor.h
 * @brief	Define KGGlyphEditor class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphDrawer.h"
#import "KGGlyphEditableStroke.h"


@interface KGGlyphEditor : KGGlyphDrawer <KCGraphicsEditing>
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

@end
