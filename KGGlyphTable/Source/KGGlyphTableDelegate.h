/**
 * @file	KGGlyphTableDelegate.h
 * @brief	Define KGGlyphTableDelegate class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <UIKit/UIKit.h>

@interface KGGlyphTableDelegate : NSObject <UICollectionViewDelegateFlowLayout>

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath ;

@end
