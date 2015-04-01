/**
 * @file	KGStartButton.h
 * @brief	Define KGStartButton class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGStartButton.h"

static void
setButtonStatus(KGStartButton * button, KGGameState stat) ;

@interface KGStartButton (KGPrivate)
- (void) buttonPressed: (id) button ;
@end

@implementation KGStartButton

- (instancetype) initWithCoder:(NSCoder *) decoder
{
	if((self = [super initWithCoder: decoder]) != nil){
		buttonPressDelegate = nil ;
#		if TARGET_OS_IPHONE
		[self addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
#		else
		[self setTarget: self] ;
		[self setAction: @selector(buttonPressed:)] ;
#		endif
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
		buttonPressDelegate = nil ;
#		if TARGET_OS_IPHONE
		[self addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
#		else
		[self setTarget: self] ;
		[self setAction: @selector(buttonPressed:)] ;
#		endif
	}
	return self ;
}

- (void) setButtonPressDelegate: (id <KGStartButtonDelegate>) delegate
{
	buttonPressDelegate = delegate ;
}

- (void) observeValueForKeyPath:(NSString *) keyPath ofObject:(id) object change:(NSDictionary *) change context:(void *) context
{
	(void) change ; (void) context ;
	if([object isKindOfClass: [KGGameStatus class]] && [keyPath isEqualToString: [KGGameStatus stateKeyPath]]){
		KGGameStatus * stat = (KGGameStatus *) object ;
		setButtonStatus(self, stat.state) ;
	} else {
		assert(false) ;
	}
}

@end

@implementation KGStartButton (KGPrivate)

- (void) buttonPressed: (id) button
{
	(void) button ;
	if(buttonPressDelegate){
		[buttonPressDelegate startButtonPressed] ;
	}
}

@end

static void
setButtonStatus(KGStartButton * button, KGGameState stat)
{
	NSString * labstr ;
	if(stat == KGIdleState){
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
