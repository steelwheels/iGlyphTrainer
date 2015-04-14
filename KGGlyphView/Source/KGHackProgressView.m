/**
 * @file	KGHackProgressView.m
 * @brief	Define for KGHackProgressView class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGHackProgressView.h"
#import "KGHackProgressDrawer.h"

@implementation KGHackProgressView

- (instancetype) initWithCoder:(NSCoder *) decoder
{
	if((self = [super initWithCoder: decoder]) != nil){
		KGHackProgressDrawer * drawer = [[KGHackProgressDrawer alloc] init] ;
		[super setGraphicsDrawer: drawer] ;
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
		KGHackProgressDrawer * drawer = [[KGHackProgressDrawer alloc] init] ;
		[super setGraphicsDrawer: drawer] ;
	}
	return self ;
}

- (void) observeValueForKeyPath:(NSString *) keyPath ofObject:(id) object change:(NSDictionary *) change context:(void *) context
{
	(void) keyPath ; (void) change ; (void) context ;
	if([object isKindOfClass: [KGGameStatus class]]){
		KGGameStatus *		status = object ;
		switch(status.state){
			case KGIdleState:
			case KGStrokeState:
			case KGEvaluateState: {
				/* Do nothing */
			} break ;
			case KGDisplayQuestionState: {
				KGHackProgressDrawer *	drawer = [self graphicsDrawer] ;
				/* Pass the state */
				drawer.maxGlyphNum       = status.maxGlyphNum ;
				drawer.processedGlyphNum = status.processedGlyphNum ;
#				if TARGET_OS_IPHONE
				[self setNeedsDisplay] ;
#				else
				[self setNeedsDisplay: YES] ;
#				endif
			} break ;
		}
	} else {
		NSLog(@"Unknown object") ;
	}
}

@end
