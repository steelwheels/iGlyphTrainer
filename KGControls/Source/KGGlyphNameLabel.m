/**
 * @file	KGGlyphNameLabel.m
 * @brief	Define KGGlyphNameLabel class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphNameLabel.h"
#import <KGGameData/KGGameData.h>

static NSString * currentGlyphName(KGGameStatus * status) ;
static NSString * currentScore(KGGameStatus * status) ;

@interface KGGlyphNameLabel ()
- (NSString *) labelTitle: (KGGameStatus *) status ;
@end

@implementation KGGlyphNameLabel

- (void) observeValueForKeyPath:(NSString *) keyPath ofObject:(id) object change:(NSDictionary *) change context:(void *) context
{
	(void) change ; (void) context ;
	if([object isKindOfClass: [KGGameStatus class]]){
		if([keyPath isEqualToString: [KGGameStatus stateKeyPath]]){
			NSString * title = [self labelTitle: (KGGameStatus *) object] ;
			[self setTitle: title] ;
		}
	}
}

- (NSString *) labelTitle: (KGGameStatus *) status
{
	KGPreference * preference = [KGPreference sharedPreference] ;
	
	NSString * title = @"" ;
	switch(status.state){
		case KGIdleState: {
			title = currentScore(status) ;
		} break ;
		case KGDisplayQuestionState: {
			if(preference.doDisplayGlyphNameAtQuestionState){
				title = currentGlyphName(status) ;
			}
		} break ;
		case KGInputAnswerState: {
			if(preference.doDisplayGlyphNameAtAnswerState){
				title = currentGlyphName(status) ;
			}
		} break ;
		case KGEvaluateState: {
			title = currentGlyphName(status) ;
		} break ;
	}
	return title ;
}

@end

static NSString *
currentGlyphName(KGGameStatus * status)
{
	struct KGGlyphSentence sentence = status.currentSentence ;
	KGGlyphKind kind = sentence.glyphWords[status.currentGlyphIndex] ;
	return KGNameOfGlyph(kind) ;
}

static NSString *
currentScore(KGGameStatus * status)
{
	NSString * result ;
	if(status.totalQuestionNum > 0){
		result = [[NSString alloc] initWithFormat: @"Score %u/%u", status.totalSuccessNum, status.totalQuestionNum] ;
	} else {
		result = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"] ;
		if(result == nil){
			result = @"Welcome !!" ;
		}
	}
	return result ;
}
