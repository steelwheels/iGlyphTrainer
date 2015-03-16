/**
 * @file	KGHackProgressDrawer.h
 * @brief	Define KGHackProgressDrawer class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGHackProgressType.h"

@interface KGHackProgressDrawer : NSObject <KCGraphicsDrawing>
{
	KGHackProgress *	hackProgress ;
	CGRect			previousBounds ;
	struct CNHexagon	hackHexagon[KGLimitProgressCount] ;
}

- (instancetype) init ;
- (void) setHackProgress: (KGHackProgress *) progress ;

@end
