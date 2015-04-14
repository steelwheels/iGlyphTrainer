/**
 * @file	KGHackNavigationBar.h
 * @brief	Define KGHackNavigationBar class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphViewType.h"
#import "KGHackProgressView.h"

@interface KGHackNavigationBar : UINavigationBar

- (void) setupProgressBar ;

- (KGHackProgressView *) progressView ;

@end
