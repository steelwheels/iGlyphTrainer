/**
 * @file	KGHackProgressView.m
 * @brief	Define for KGHackProgressView class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGHackProgressView.h"

static const BOOL		doDebug = NO ;
static const unsigned int	invalidIndex = (unsigned int) -1 ;

@interface KGHackProgressView ()
- (void) setupHackProgressView ;
@end

@implementation KGHackProgressView

- (instancetype) initWithCoder:(NSCoder *) decoder
{
	if((self = [super initWithCoder: decoder]) != nil){
		[self setupHackProgressView] ;
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
		[self setupHackProgressView] ;
	}
	return self ;
}

- (void) setupHackProgressView
{
	progressDrawer = [[KGHackProgressDrawer alloc] init] ;
	[super addGraphicsDrawer: progressDrawer withDelegate: nil] ;
	prevState = KGIdleState ;
	prevIndex = invalidIndex ;
}

- (void) observeValueForKeyPath:(NSString *) keyPath ofObject:(id) object change:(NSDictionary *) change context:(void *) context
{
	if(doDebug){
		printf("%s (0)\n", __func__) ;
	}

	(void) keyPath ; (void) change ; (void) context ;
	if([object isKindOfClass: [KGGameStatus class]]){
		KGGameStatus *	status = object ;
		KGGameState	newstate = status.state ;
		NSUInteger	newindex = status.currentGlyphIndex ;
		
		if(newstate == KGIdleState || newstate != prevState){
			[progressDrawer setMaxGlyphNum: 0] ;
			[progressDrawer clearStates] ;
			prevState = newstate ;
			prevIndex = invalidIndex ;
		}
		
		switch(newstate){
			case KGIdleState: {
				//[progressDrawer setMaxGlyphNum: 0] ;
				//[progressDrawer clearStates] ;
			} break ;
			case KGDisplayQuestionState:
			case KGInputAnswerState: {
				if(prevIndex != newindex){
					struct KGGlyphSentence sentence = status.currentSentence ;
					[progressDrawer setMaxGlyphNum: sentence.wordNum] ;
					[progressDrawer addNextHackState: KGHackedAtDisplayState] ;
					prevIndex = newindex ;
				}
			} break ;
			case KGEvaluateState: {
				if(prevIndex != newindex){
					struct KGGlyphSentence sentence = status.currentSentence ;
					[progressDrawer setMaxGlyphNum: sentence.wordNum] ;
					KGHackState hstate = status.hasCorrectAnswer ? KGCorrectHackedAtEvaluationState : KGWrongHackedAtEvaluationState ;
					[progressDrawer addNextHackState: hstate] ;
					prevIndex = newindex ;
				}
			} break ;
		}
		if(doDebug){
			printf("%s (1) state=%s\n",
			       __func__, [KGGameStatus stateToString: status.state]) ;
		}
		
		[self setAllNeedsDisplay] ;
	} else {
		NSLog(@"Unknown object") ;
	}
}

@end
