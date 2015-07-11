/**
 * @file	KGGlyphTableSource.m
 * @brief	Define KGGlyphTableSource class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphTableSource.h"
#import "KGGlyphTableCell.h"
#import <KGGlyphData/KGGlyphData.h>

static NSString *cellIdentifier = @"KGGlyphTableCell";

@implementation KGGlyphTableSource

- (NSInteger) numberOfSectionsInCollectionView: (UICollectionView *) collectionView
{
	(void) collectionView ;
	return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	(void) collectionView ;
	(void) section ;
	return KGNumberOfGlyphs ;
}

- (UICollectionViewCell *) collectionView: (UICollectionView *) collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	
	
	UICollectionViewCell * newcell = [collectionView dequeueReusableCellWithReuseIdentifier: cellIdentifier forIndexPath: indexPath] ;
	if(newcell == nil){
		[collectionView registerClass: [KGGlyphTableCell class] forCellWithReuseIdentifier: cellIdentifier] ;
	}
	return newcell ;
}


@end
