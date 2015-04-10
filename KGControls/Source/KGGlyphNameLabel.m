/**
 * @file	KGGlyphNameLabel.m
 * @brief	Define KGGlyphNameLabel class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphNameLabel.h"
#import <KGGameData/KGGameData.h>

@implementation KGGlyphNameLabel

- (void) observeValueForKeyPath:(NSString *) keyPath ofObject:(id) object change:(NSDictionary *) change context:(void *) context
{
	(void) change ; (void) context ;
	if([object isKindOfClass: [KGGameStatus class]]){
		if([keyPath isEqualToString: [KGGameStatus stateKeyPath]]){
			
			NSString * glyphname = @"" ;
			KGGameStatus * status = object ;
			switch(status.state){
				case KGIdleState:
				case KGStrokeState: {
					
				} break ;
				case KGDisplayQuestionState:
				case KGEvaluateState: {
					glyphname = KGNameOfGlyph(status.currentGlyphKind) ;
				} break ;
			}
			dispatch_queue_t mainqueue = dispatch_get_main_queue();
			dispatch_async(mainqueue, ^{
#				if TARGET_OS_IPHONE
				self.text = glyphname ;
#				else
				[self setStringValue: glyphname] ;
#				endif
			});
		}
	}
}

@end
