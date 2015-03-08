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
	bool				hasBeginningVertex ;
	unsigned int			beginningVertexId ;
	bool				hasEndingVertex ;
	CGPoint				endingVertexPoint ;
	struct KGGlyphEditableStroke	editableStroke ;
}

- (instancetype) init ;

@end
