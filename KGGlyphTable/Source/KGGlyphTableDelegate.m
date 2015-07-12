/**
 * @file	KGGlyphTableDelegate.m
 * @brief	Define KGGlyphTableDelegate class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphTableDelegate.h"

@implementation KGGlyphTableDelegate

- (CGSize) collectionView: (UICollectionView *) collectionView
		   layout: (UICollectionViewLayout *) collectionViewLayout
   sizeForItemAtIndexPath: (NSIndexPath *) indexPath
{
	(void) collectionView ;
	(void) collectionViewLayout ;
	(void) indexPath ;
	CGSize cellsize = CGSizeMake(100.0, 140.0) ;
	return cellsize ;
}

@end
