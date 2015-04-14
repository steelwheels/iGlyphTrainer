/**
 * @file	KGHackProgressDrawer.h
 * @brief	Define KGHackProgressDrawer class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphViewType.h"

@interface KGHackProgressDrawer : NSObject <KCGraphicsDrawing>
{
	CGRect			previousBounds ;
	struct CNHexagon	hackHexagon[KGLimitProgressCount] ;
	unsigned int		prevMaxGlyphNum ;
}

@property (assign, nonatomic) unsigned int	maxGlyphNum ;
@property (assign, nonatomic) unsigned int	processedGlyphNum ;

- (instancetype) init ;

@end
