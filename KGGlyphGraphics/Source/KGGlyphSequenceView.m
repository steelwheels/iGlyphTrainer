/**
 * @file	KGGlyphSequenceView.m
 * @brief	Define KGGlyphSequenceView data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphSequenceView.h"
#import <KGGameData/KGGameData.h>
#import "KGGlyphDrawer.h"

@interface KGGlyphSequenceView ()
- (void) setupGlyphSequenceView ;
@end

@implementation KGGlyphSequenceView

- (instancetype) initWithCoder:(NSCoder *) coder
{
	if((self = [super initWithCoder: coder]) != nil){
		[self setupGlyphSequenceView] ;
	}
	return self ;
}

#if TARGET_OS_IPHONE
- (instancetype) initWithFrame:(CGRect)frame
#else
- (instancetype) initWithFrame:(NSRect)frame
#endif
{
	if((self = [super initWithFrame: frame]) != nil){
		[self setupGlyphSequenceView] ;
	}
	return self ;
}

- (void) setupGlyphSequenceView
{
	struct KGGlyphStroke stroke = KGStrokeOfGlyph(KGNilGlyph) ;
	glyphDrawer = [[KGGlyphDrawer alloc] init] ;
	[glyphDrawer setStroke: &stroke] ;
	
	[self setGraphicsDrawer: glyphDrawer] ;
	[self allocateTransparentViews: KGGlyphTransparentViewNum] ;
}

- (void) observeValueForKeyPath:(NSString *) keyPath ofObject:(id) object change:(NSDictionary *) change context:(void *) context
{
	(void) change ; (void) context ;
	if([object isKindOfClass: [KGGameStatus class]]){
		if([keyPath isEqualToString: [KGGameStatus stateKeyPath]]){
			KGGameStatus * status = object ;
			if(status.state == KGDisplayQuestionState){
				KGGlyphKind gkind = status.currentGlyphKind ;
				if(gkind != KGNilGlyph){
					struct KGGlyphStroke gstroke = KGStrokeOfGlyph(gkind) ;
					[glyphDrawer setStroke: &gstroke] ;
					[self setAllNeedsDisplay] ;
				}
			}
		}
	}
}

- (void) setAllNeedsDisplay
{
	NSArray * subviews = self.subviews ;
	for(UIView * subview in subviews){
		[subview setNeedsDisplay] ;
	}
	[self setNeedsDisplay] ;
}

@end
