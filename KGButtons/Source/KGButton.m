/**
 * @file	KGButton.m
 * @brief	Define KGButton class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGButton.h"
#import <KiwiControl/KiwiControl.h>

@interface KGButton (KGPrivate)
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

- (void) setBorderColor: (UIColor *) color
{
	_borderColor = color ;
	self.layer.borderColor = self.borderColor.CGColor ;
}

- (void) setBorderWidth:(CGFloat) width
{
	_borderWidth = width ;
	self.layer.borderWidth = width ;
}

@end

@implementation KGButton (KGPrivate)

- (void) setupButton
{
	_borderColor = [UIColor blackColor] ;
	_borderWidth = 0.0 ;
}

@end

