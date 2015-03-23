/**
 * @file	KGButton.h
 * @brief	Define KGButton class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGButtonsType.h"

#if TARGET_OS_IPHONE
#	define KGSuperClassOfButton	UIButton
#else
#	define KGSuperClassOfButton	NSButton
#endif

@interface KGButton : KGSuperClassOfButton

@end

#undef KGSuperClassOfButton
