/**
 * @file	KGTimerLabel.h
 * @brief	Define KGTimerLabel class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGLabel.h"
#import <Coconut/Coconut.h>

@interface KGTimerLabel : KGLabel <CNTimerWakeupDelegate>

- (void) setTimerLabel: (double) timval ;

@end
