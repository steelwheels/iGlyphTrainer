/**
 * @file	KGButton.m
 * @brief	Define KGButton class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGButton.h"
#import <KiwiControl/KiwiControl.h>

@interface KGButton ()
- (void) setupButton ;
@end

@implementation KGButton

- (instancetype) initWithCoder:(NSCoder *) decoder
{
	if((self = [super initWithCoder: decoder]) != nil){
		[self setupButton] ;
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
		[self setupButton] ;
	}
	return self ;
}

- (void) setupButton
{
#if TARGET_OS_IPHONE
	KCPreference * preference = [KCPreference sharedPreference] ;
	UIColor * bordercol = [preference borderColor] ;
	self.layer.borderWidth = [preference borderWidth] ;
	self.layer.borderColor = [bordercol CGColor] ;
	
	UIColor * fontcol = [preference fontColor] ;
	[self setTitleColor: fontcol forState: UIControlStateNormal] ;
#else
	// do nothing
#endif
}

@end


