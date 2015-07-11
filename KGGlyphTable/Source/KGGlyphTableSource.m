/**
 * @file	KGGlyphTableSource.m
 * @brief	Define KGGlyphTableSource class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphTableSource.h"
#import "KGGlyphTableCell.h"
#import <KGGlyphData/KGGlyphData.h>

static NSString *	cellIdentifier = @"KGGlyphTableCell";

static KGGlyphKind
indexPathToKind(NSIndexPath * path) ;

@implementation KGGlyphTableSource

- (instancetype) init
{
	if((self = [super init]) != nil){
		
	}
	return self ;
}

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
	KGGlyphTableCell * newcell = [collectionView dequeueReusableCellWithReuseIdentifier: cellIdentifier forIndexPath: indexPath] ;
	if(newcell == nil){
		[collectionView registerClass: [KGGlyphTableCell class] forCellWithReuseIdentifier: cellIdentifier] ;
		newcell = [collectionView dequeueReusableCellWithReuseIdentifier: cellIdentifier forIndexPath: indexPath] ;
		assert(newcell != nil) ;
	}
	//printf("KGGlyphKind = %u\n", (KGGlyphKind) indexPath.row) ;
	[newcell setGlyphKind: indexPathToKind(indexPath)] ;
	return newcell ;
}

@end

static KGGlyphKind
indexPathToKind(NSIndexPath * path)
{
	return (KGGlyphKind) (path.row + KGFirstGlyph) ;
}


