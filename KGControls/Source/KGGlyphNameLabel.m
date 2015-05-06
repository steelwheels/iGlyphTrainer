/**
 * @file	KGGlyphNameLabel.m
 * @brief	Define KGGlyphNameLabel class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphNameLabel.h"
#import <KGGameData/KGGameData.h>

static NSString * currentGlyphName(KGGameStatus * status) ;

@interface KGGlyphNameLabel ()
- (NSString *) glyphName: (KGGameStatus *) status ;
@end

@implementation KGGlyphNameLabel

- (void) observeValueForKeyPath:(NSString *) keyPath ofObject:(id) object change:(NSDictionary *) change context:(void *) context
{
	(void) change ; (void) context ;
	if([object isKindOfClass: [KGGameStatus class]]){
		if([keyPath isEqualToString: [KGGameStatus stateKeyPath]]){
			NSString * glyphname = [self glyphName: (KGGameStatus *) object] ;
			[self setTitle: glyphname] ;
		}
	}
}

- (NSString *) glyphName: (KGGameStatus *) status
{
	KGPreference * preference = [KGPreference sharedPreference] ;
	
	NSString * glyphname = @"" ;
	switch(status.state){
		case KGIdleState: {
			/* Display no glyph */
		} break ;
		case KGDisplayQuestionState: {
			if(preference.doDisplayGlyphNameAtQuestionState){
				glyphname = currentGlyphName(status) ;
			}
		} break ;
		case KGInputAnswerState: {
			if(preference.doDisplayGlyphNameAtAnswerState){
				glyphname = currentGlyphName(status) ;
			}
		} break ;
		case KGEvaluateState: {
			glyphname = currentGlyphName(status) ;
		} break ;
	}
	return glyphname ;
}

@end

static NSString *
currentGlyphName(KGGameStatus * status)
{
	struct KGGlyphSentence sentence = status.currentSentence ;
	KGGlyphKind kind = sentence.glyphWords[status.currentGlyphIndex] ;
	return KGNameOfGlyph(kind) ;
}
