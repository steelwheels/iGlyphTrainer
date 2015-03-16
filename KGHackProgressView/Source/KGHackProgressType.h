/**
 * @file	KGHackProgressType.h
 * @brief	Type definition for KGHackProgressView framework
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <TargetConditionals.h>
#if TARGET_OS_IPHONE
#	import <UIKit/UIKit.h>
#else
#	import <Cocoa/Cocoa.h>
#endif
#import <KCGraphicsView/KCGraphicsView.h>
#import <KGGlyphData/KGGlyphData.h>
