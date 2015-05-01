/**
 * @file	KGHackProgressView.m
 * @brief	Define for KGHackProgressView class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGHackProgressView.h"

@implementation KGHackProgressView

- (instancetype) initWithCoder:(NSCoder *) decoder
{
	if((self = [super initWithCoder: decoder]) != nil){
		progressDrawer = [[KGHackProgressDrawer alloc] init] ;
		[super addGraphicsDrawer: progressDrawer withDelegate: nil] ;
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
		progressDrawer = [[KGHackProgressDrawer alloc] init] ;
		[super addGraphicsDrawer: progressDrawer withDelegate: nil] ;
	}
	return self ;
}

- (void) observeValueForKeyPath:(NSString *) keyPath ofObject:(id) object change:(NSDictionary *) change context:(void *) context
{
	(void) keyPath ; (void) change ; (void) context ;
	if([object isKindOfClass: [KGGameStatus class]]){
		KGGameStatus *		status = object ;
		
		unsigned int maxnum, currentnum ;
		switch(status.state){
			case KGIdleState:
			case KGEvaluateState: {
				maxnum     = 0 ;
				currentnum = 0 ;
			} break ;
			case KGDisplayQuestionState:
			case KGInputAnswerState: {
				struct KGGlyphSentence sentence = status.currentSentence ;
				maxnum	   = sentence.wordNum ;
				currentnum = status.currentGlyphIndex + 1 ;
			} break ;
		}
		
		progressDrawer.maxGlyphNum       = maxnum ;
		progressDrawer.processedGlyphNum = currentnum ;
#		if TARGET_OS_IPHONE
		[self setNeedsDisplay] ;
#		else
		[self setNeedsDisplay: YES] ;
#		endif
	} else {
		NSLog(@"Unknown object") ;
	}
}

@end
