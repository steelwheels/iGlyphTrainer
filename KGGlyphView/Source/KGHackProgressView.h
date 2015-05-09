/**
 * @file	KGHackProgressView.h
 * @brief	Define for KGHackProgressView class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphViewType.h"
#import "KGHackProgressDrawer.h"

@interface KGHackProgressView : KCGraphicsView 
{
	KGHackProgressDrawer *		progressDrawer ;
	KGGameState			prevState ;
	unsigned int			prevIndex ;
}

@end
