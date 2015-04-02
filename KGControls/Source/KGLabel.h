/**
 * @file	KGLabel.h
 * @brief	Define KGLabel class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGControlType.h"

#if TARGET_OS_IPHONE
#	define KGSuperClassOfLabel	UILabel
#else
#	define KGSuperClassOfLabel	NSLabel
#endif

@interface KGLabel : KGSuperClassOfLabel

@end

#undef KGSuperClassOfLabel
