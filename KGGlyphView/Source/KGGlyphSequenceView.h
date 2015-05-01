/**
 * @file	KGGlyphSequenceView.h
 * @brief	Define KGGlyphSequenceView data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphViewType.h"
#import <KGGlyphGraphics/KGGlyphGraphics.h>

@protocol KGGlyphSequenceEditiing <NSObject>
- (void) glyphEditingEnded: (const struct KGGlyphStroke *) stroke ;
- (void) glyphEditingCancelled ;
@end

@interface KGGlyphSequenceView : KCGraphicsView <KCGraphicsDelegate>
{
	KGGlyphVertexDrawer *		vertexDrawer ;
	KGGlyphStrokeDrawer *		strokeDrawer ;
	KGGlyphStrokeEditor *		strokeEditor ;
	
	id <KGGlyphSequenceEditiing>	glyphDelegate ;
}

- (instancetype) initWithCoder:(NSCoder *) decoder ;
#if TARGET_OS_IPHONE
- (instancetype) initWithFrame:(CGRect)frame ;
#else
- (instancetype) initWithFrame:(NSRect)frame ;
#endif

- (void) setDelegate: (id <KGGlyphSequenceEditiing>) delegate ;
- (void) setEditable: (BOOL) flag ;
- (void) setAllNeedsDisplay ;

@end
