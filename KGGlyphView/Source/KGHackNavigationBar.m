/**
 * @file	KGHackNavigationBar.m
 * @brief	Define KGHackNavigationBar class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGHackNavigationBar.h"
#import "KGGlyphViewType.h"

#if TARGET_OS_IPHONE

@implementation KGHackNavigationBar

- (void) setupProgressBar
{
	CGRect barframe = CGRectMake(0, 0, 480*0.75, 44*0.8) ;
	KGHackProgressView *	progressview = [[KGHackProgressView alloc] initWithFrame: barframe] ;
	self.topItem.titleView = progressview ;
}

- (KGHackProgressView *) progressView
{
	return (KGHackProgressView *) self.topItem.titleView ;
}

@end

#endif
