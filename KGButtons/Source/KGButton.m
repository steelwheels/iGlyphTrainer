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

#if TARGET_OS_IPHONE
- (void) setBorderColor: (UIColor *) color
#else
- (void) setBorderColor: (NSColor *) color
#endif
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
#if TARGET_OS_IPHONE
	_borderColor = [UIColor blackColor] ;
#else
	_borderColor = [NSColor blackColor] ;
#endif
	_borderWidth = 0.0 ;
}

@end

