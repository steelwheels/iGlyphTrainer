/**
 * @file	KGLabel.m
 * @brief	Define KGLabel class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGLabel.h"
#import <KiwiControl/KiwiControl.h>

@interface KGLabel (KGPrivate)
- (void) setupLabel ;
- (void) setTitleOnMainThread: (NSString *) title ;
@end

@implementation KGLabel

- (instancetype) initWithCoder:(NSCoder *) decoder
{
	if((self = [super initWithCoder: decoder]) != nil){
		[self setupLabel] ;
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
		[self setupLabel] ;
	}
	return self ;
}

- (void) setTitle: (NSString *) title
{
#	if TARGET_OS_IPHONE
	[self performSelectorOnMainThread: @selector(setText:)
			       withObject: title
			    waitUntilDone: YES] ;
#	else
	[self performSelectorOnMainThread: @selector(setStringValue:)
			       withObject: title
			    waitUntilDone: YES] ;
#	endif
}

@end

@implementation KGLabel (KGPrivate)

- (void) setupLabel
{
#if TARGET_OS_IPHONE
	KCPreference * preference = [KCPreference sharedPreference] ;
	UIColor * fontcol = [preference fontColor] ;
	self.textColor = fontcol ;
#else
	[self setEditable: NO] ;
#endif
}

- (void) setTitleOnMainThread: (NSString *) title
{
#	if TARGET_OS_IPHONE
	[self setText: title] ;
	[self setNeedsDisplay] ;
#	else
	[self setStringValue: title] ;
	[self setNeedsDisplay: YES] ;
#	endif
}

@end
