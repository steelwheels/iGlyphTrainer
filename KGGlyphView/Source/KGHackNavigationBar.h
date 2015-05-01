/**
 * @file	KGHackNavigationBar.h
 * @brief	Define KGHackNavigationBar class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphViewType.h"
#import "KGHackProgressView.h"

#if TARGET_OS_IPHONE

@interface KGHackNavigationBar : UINavigationBar

- (void) setupProgressBar ;

- (KGHackProgressView *) progressView ;

@end

#endif
