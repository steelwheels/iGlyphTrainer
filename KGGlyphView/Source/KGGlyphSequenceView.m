/**
 * @file	KGGlyphSequenceView.m
 * @brief	Define KGGlyphSequenceView data structure
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphSequenceView.h"
#import <KGGameData/KGGameData.h>

static inline struct KGGlyphStroke
currentStroke(KGGameStatus * status)
{
	struct KGGlyphSentence sentence = status.currentSentence ;
	NSUInteger index = status.currentGlyphIndex ;
	KGGlyphKind gkind = sentence.glyphWords[index] ;
	return KGStrokeOfGlyph(gkind) ;
}

static inline struct KGGlyphStroke
inputedStroke(const struct KGGlyphInputStrokes * inputs, KGGameStatus * status)
{
	NSUInteger index = status.currentGlyphIndex ;
	struct KGGlyphStroke stroke ;
	if(index < inputs->strokeNum){
		stroke = inputs->strokeArray[index] ;
	} else {
		stroke = KGStrokeOfGlyph(KGNilGlyph) ;
	}
	return stroke ;
}

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
	vertexDrawer  = [[KGGlyphVertexDrawer alloc] init] ;
	stroke0Drawer = [[KGGlyphStrokeDrawer alloc] init] ;
	stroke1Drawer = [[KGGlyphStrokeDrawer alloc] init] ;
	strokeEditor  = [[KGGlyphStrokeEditor alloc] init] ;

	[self addGraphicsDrawer: vertexDrawer  withDelegate: nil] ;
	[self addGraphicsDrawer: stroke0Drawer withDelegate: nil] ;
	[self addGraphicsDrawer: stroke1Drawer withDelegate: nil] ;
	[self addGraphicsDrawer: strokeEditor  withDelegate: self] ;
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
			struct KGGlyphStroke nilstroke = KGStrokeOfGlyph(KGNilGlyph) ;
			
			KGPreference * preference = [KGPreference sharedPreference] ;
			struct CNRGB normalcolor  = preference.normalGlyphColor ;
			struct CNRGB correctcolor = preference.correctGlyphColor ;
			struct CNRGB wrongcolor   = preference.wrongGlyphColor ;
			
			KGGameStatus * status = object ;
			switch(status.state){
				case KGIdleState: {
					[stroke0Drawer setStroke: &nilstroke] ;
					[stroke0Drawer setColor: &normalcolor] ;
					[stroke1Drawer setStroke: &nilstroke] ;
					[stroke1Drawer setColor: &normalcolor] ;
					[strokeEditor setEditable: NO] ;
				} break ;
				case KGDisplayQuestionState: {
					struct KGGlyphStroke gstroke = currentStroke(status) ;
					[stroke0Drawer setStroke: &gstroke] ;
					[stroke0Drawer setColor: &normalcolor] ;
					[stroke1Drawer setStroke: &nilstroke] ;
					[stroke1Drawer setColor: &normalcolor] ;
					[strokeEditor setEditable: NO] ;
				} break ;
				case KGInputAnswerState: {
					[stroke0Drawer setStroke: &nilstroke] ;
					[stroke0Drawer setColor: &normalcolor] ;
					[stroke1Drawer setStroke: &nilstroke] ;
					[stroke1Drawer setColor: &normalcolor] ;
					[strokeEditor setEditable: YES] ;
				} break ;
				case KGEvaluateState: {
					/* Inputed stroken */
					struct KGGlyphInputStrokes instrokes = status.inputStrokes ;
					struct KGGlyphStroke instroke = inputedStroke(&instrokes, status) ;
					[stroke0Drawer setStroke: &instroke] ;
					[stroke0Drawer setColor: &wrongcolor] ;
					
					/* Expected stroke */
					struct KGGlyphStroke gstroke = currentStroke(status) ;
					[stroke1Drawer setStroke: &gstroke] ;
					[stroke1Drawer setColor: &correctcolor] ;
					
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

- (void) editingGraphicsEndedWithData: (void *) data
{
	if(glyphDelegate){
		if([strokeEditor isEditable]){
			assert(data != NULL) ;
			const struct KGGlyphStroke * stroke = data ;
			[glyphDelegate glyphEditingEnded: stroke] ;
		}
	}
}

- (void) editingGraphicsCancelled
{
	if(glyphDelegate){
		if([strokeEditor isEditable]){
			[glyphDelegate glyphEditingCancelled] ;
		}
	}
}

@end
