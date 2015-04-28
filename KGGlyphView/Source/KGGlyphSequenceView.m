/**
 * @file	KGGlyphSequenceView.m
 * @brief	Define KGGlyphSequenceView data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphSequenceView.h"
#import <KGGameData/KGGameData.h>

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
	
	
	glyphEditor = [[KGGlyphEditor alloc] init] ;
	[glyphEditor setStroke: &stroke] ;
	[self setGraphicsDrawer: glyphEditor] ;
	[self setGraphicsEditor: glyphEditor] ;
	
	glyphDelegate = nil ;
	
	[self allocateTransparentViews: KGGlyphTransparentViewNum] ;
}

- (void) observeValueForKeyPath:(NSString *) keyPath ofObject:(id) object change:(NSDictionary *) change context:(void *) context
{
	(void) change ; (void) context ;
	if([object isKindOfClass: [KGGameStatus class]]){
		if([keyPath isEqualToString: [KGGameStatus stateKeyPath]]){
			KGGameStatus * status = object ;
			
			switch(status.state){
				case KGDisplayQuestionState: {
					struct KGGlyphSentence sentence = status.currentSentence ;
					unsigned int index = status.currentGlyphIndex ;
					KGGlyphKind gkind = sentence.glyphWords[index] ;
					struct KGGlyphStroke gstroke = KGStrokeOfGlyph(gkind) ;
					[glyphEditor setStroke: &gstroke] ;
					[glyphEditor setEditable: NO] ;
					[self setAllNeedsDisplay] ;
				} break ;
				case KGInputAnswerState: {
					struct KGGlyphStroke gstroke = KGStrokeOfGlyph(KGNilGlyph) ;
					[glyphEditor setStroke: &gstroke] ;
					[glyphEditor setEditable: YES] ;
					[self setAllNeedsDisplay] ;
				} break ;
				case KGIdleState:
				case KGEvaluateState: {
					struct KGGlyphStroke gstroke = KGStrokeOfGlyph(KGNilGlyph) ;
					[glyphEditor setStroke: &gstroke] ;
					[glyphEditor setEditable: NO] ;
					[self setAllNeedsDisplay] ;
				} break ;
			}
		}
	}
}

- (void) setEditable: (BOOL) flag
{
	[glyphEditor setEditable: flag] ;
}

- (void) setAllNeedsDisplay
{
	NSArray * subviews = self.subviews ;
	for(UIView * subview in subviews){
		[subview setNeedsDisplay] ;
	}
	[self setNeedsDisplay] ;
}

- (void) setDelegate: (id <KGGlyphSequenceEditiing>) delegate
{
	glyphDelegate = delegate ;
}

- (void) editingGraphicsEnded
{
	if(glyphDelegate){
		if([glyphEditor isEditable]){
			const struct KGGlyphStroke * stroke = [glyphEditor glyphStroke] ;
			[glyphDelegate glyphEditingEnded: stroke] ;
		}
	}
}

- (void) editingGraphicsCancelled
{
	if(glyphDelegate){
		if([glyphEditor isEditable]){
			[glyphDelegate glyphEditingCancelled] ;
		}
	}
}

@end
