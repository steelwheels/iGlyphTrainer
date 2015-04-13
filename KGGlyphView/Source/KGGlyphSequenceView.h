/**
 * @file	KGGlyphSequenceView.h
 * @brief	Define KGGlyphSequenceView data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <KGGlyphGraphics/KGGlyphGraphics.h>

@interface KGGlyphSequenceView : KCGraphicsView
{
	KGGlyphDrawer *		glyphDrawer ;
}

- (instancetype) initWithCoder:(NSCoder *) decoder ;
#if TARGET_OS_IPHONE
- (instancetype) initWithFrame:(CGRect)frame ;
#else
- (instancetype) initWithFrame:(NSRect)frame ;
#endif

- (void) setAllNeedsDisplay ;

@end
