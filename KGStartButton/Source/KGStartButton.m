/**
 * @file	KGStartButton.h
 * @brief	Define KGStartButton class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGStartButton.h"

static void
setButtonStatus(KGStartButton * button, KGGameStatus stat) ;

@interface KGStartButton (KGPrivate)
- (void) buttonPressed: (id) button ;
@end

@implementation KGStartButton

- (instancetype) initWithCoder:(NSCoder *) decoder
{
	if((self = [super initWithCoder: decoder]) != nil){
		self.gameProgress = nil ;
		buttonPressDelegate = nil ;
		[self setTarget: self] ;
		[self setAction: @selector(buttonPressed:)] ;
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
		self.gameProgress = nil ;
		buttonPressDelegate = nil ;
		[self setTarget: self] ;
		[self setAction: @selector(buttonPressed:)] ;
	}
	return self ;
}

- (void) setGameProgress: (KGGameProgress *) progress
{
	gameProgress = progress ;
	[gameProgress addStatusObserver: self] ;
}

- (void) setBUttonPressDelegate: (id <KGStartButtonDelegate>) delegate
{
	buttonPressDelegate = delegate ;
}

- (void) observeValueForKeyPath:(NSString *) keyPath ofObject:(id) object change:(NSDictionary *) change context:(void *) context
{
	if(gameProgress == object  && [keyPath isEqualToString: @"gameStatus"]){
		setButtonStatus(self, gameProgress.gameStatus) ;
	} else {
		[super observeValueForKeyPath: keyPath ofObject: object change: change context: context] ;
	}
}

@end

@implementation KGStartButton (KGPrivate)

- (void) buttonPressed: (id) button
{
	(void) button ;
	if(buttonPressDelegate){
		[buttonPressDelegate startButtonPressedWithStatus: gameProgress.gameStatus] ;
	}
}

@end

static void
setButtonStatus(KGStartButton * button, KGGameStatus stat)
{
	NSString * labstr ;
	if(stat == KGIdleStatus){
		labstr = @"Start" ;
	} else {
		labstr = @"Stop" ;
	}
	
	dispatch_queue_t mainqueue = dispatch_get_main_queue();
	dispatch_async(mainqueue, ^{
#if TARGET_OS_IPHONE
		[button setTitle: labstr forState: UIControlStateNormal] ;
#else
		[button setTitle: labstr] ;
#endif
	});
}
