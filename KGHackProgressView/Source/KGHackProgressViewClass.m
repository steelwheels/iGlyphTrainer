/**
 * @file	KGHackProgressViewClass.m
 * @brief	Define for KGHackProgressView class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGHackProgressViewClass.h"
#import "KGHackProgressDrawer.h"

@implementation KGHackProgressView

- (instancetype) initWithCoder:(NSCoder *) decoder
{
	if((self = [super initWithCoder: decoder]) != nil){
		hackProgress = nil ;
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
		hackProgress = nil ;
		KGHackProgressDrawer * drawer = [[KGHackProgressDrawer alloc] init] ;
		[super setGraphicsDrawer: drawer] ;
	}
	return self ;
}

- (void) setHackProgress: (KGHackProgress *) progress
{
	hackProgress = progress ;
	[hackProgress addCurrentProgressObserver: self] ;
	KGHackProgressDrawer * drawer = (KGHackProgressDrawer *) [self graphicsDrawer] ;
	[drawer setHackProgress: progress] ;
}

- (void) observeValueForKeyPath:(NSString *) keyPath ofObject:(id) object change:(NSDictionary *) change context:(void *) context
{
	(void) keyPath ; (void) object ; (void) change ; (void) context ;
#	if TARGET_OS_IPHONE
	[self setNeedsDisplay] ;
#	else
	[self setNeedsDisplay: YES] ;
#	endif
}

@end
