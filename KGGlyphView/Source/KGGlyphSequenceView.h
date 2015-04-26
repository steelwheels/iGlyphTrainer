/**
 * @file	KGGlyphSequenceView.h
 * @brief	Define KGGlyphSequenceView data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <KGGlyphGraphics/KGGlyphGraphics.h>

@protocol KGGlyphSequenceEditiing <NSObject>
- (void) glyphEditingEnded: (const struct KGGlyphStroke *) stroke ;
- (void) glyphEditingCancelled ;
@end

@interface KGGlyphSequenceView : KCGraphicsView <KCGraphicsDelegate>
{
	KGGlyphDrawer *			glyphDrawer ;
	KGGlyphEditor *			glyphEditor ;
	id <KGGlyphSequenceEditiing>	glyphDelegate ;
}

- (instancetype) initWithCoder:(NSCoder *) decoder ;
#if TARGET_OS_IPHONE
- (instancetype) initWithFrame:(CGRect)frame ;
#else
- (instancetype) initWithFrame:(NSRect)frame ;
#endif

- (void) setDelegate: (id <KGGlyphSequenceEditiing>) delegate ;
- (void) setAllNeedsDisplay ;

@end
