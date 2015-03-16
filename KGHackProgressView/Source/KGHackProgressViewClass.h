/**
 * @file	KGHackProgressViewClass.h
 * @brief	Define for KGHackProgressView class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGHackProgressType.h"

@interface KGHackProgressView : KCGraphicsView
{
	KGHackProgress *	hackProgress ;
}

- (void) setHackProgress: (KGHackProgress *) progress ;

@end
