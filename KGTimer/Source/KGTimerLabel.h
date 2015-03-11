/**
 * @file	KGTimerLabel.h
 * @brief	Define KGTimerLabel class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGTimerType.h"
#import <Coconut/Coconut.h>

#if TARGET_OS_IPHONE
#	define	KGSuperClassOfTimerLabel	UILabel
#else
#	define	KGSuperClassOfTimerLabel	NSTextField
#endif

@interface KGTimerLabel : KGSuperClassOfTimerLabel <CNTimerWakeupDelegate>

//- (instancetype) initWithCoder:(NSCoder *) coder ;
//- (id)initWithFrame:(CGRect)frame ;

- (void) setTimerLabel: (double) timval ;

@end

#undef KGSuperClassOfTimerLabel