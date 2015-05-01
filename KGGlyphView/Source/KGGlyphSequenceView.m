/**
 * @file	KGGlyphSequenceView.m
 * @brief	Define KGGlyphSequenceView data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphSequenceView.h"
#import <KGGameData/KGGameData.h>

@interface KGGlyphSequenceView () <KCGraphicsDelegate>
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
	vertexDrawer = [[KGGlyphVertexDrawer alloc] init] ;
	strokeDrawer = [[KGGlyphStrokeDrawer alloc] init] ;
	strokeEditor = [[KGGlyphStrokeEditor alloc] init] ;

	[self addGraphicsDrawer: vertexDrawer withDelegate: nil] ;
	[self addGraphicsDrawer: strokeDrawer withDelegate: nil] ;
	[self addGraphicsDrawer: strokeEditor withDelegate: self] ;
}

- (void) setEditable: (BOOL) flag
{
	if(strokeEditor){
		[strokeEditor setEditable: flag] ;
	}
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
					[strokeDrawer setStroke: &gstroke] ;
					[strokeEditor setEditable: NO] ;
				} break ;
				case KGInputAnswerState: {
					struct KGGlyphStroke nilstroke = KGStrokeOfGlyph(KGNilGlyph) ;
					[strokeDrawer setStroke: &nilstroke] ;
					[strokeEditor setEditable: YES] ;
				} break ;
				case KGIdleState:
				case KGEvaluateState: {
					struct KGGlyphStroke gstroke = KGStrokeOfGlyph(KGNilGlyph) ;
					[strokeDrawer setStroke: &gstroke] ;
					[strokeEditor setEditable: NO] ;
				} break ;
			}
			[self setAllNeedsDisplay] ;
		}
	}
}

- (void) setDelegate: (id <KGGlyphSequenceEditiing>) delegate
{
	glyphDelegate = delegate ;
}

- (void) setAllNeedsDisplay
{
	NSArray * subviews = self.subviews ;
	for(UIView * subview in subviews){
		[subview setNeedsDisplay] ;
	}
	[self setNeedsDisplay] ;
}

- (void) editingGraphicsEnded
{
	if(glyphDelegate){
		if([strokeEditor isEditable]){
			const struct KGGlyphStroke * stroke = [strokeEditor glyphStroke] ;
			[glyphDelegate glyphEditingEnded: stroke] ;
			[strokeEditor clearGlyphStroke] ;
		}
	}
}

- (void) editingGraphicsCancelled
{
	if(glyphDelegate){
		if([strokeEditor isEditable]){
			[glyphDelegate glyphEditingCancelled] ;
			[strokeEditor clearGlyphStroke] ;
		}
	}
}

@end
