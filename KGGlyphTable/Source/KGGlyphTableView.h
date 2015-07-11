/**
 * @file	KGGlyphTableView.h
 * @brief	Define KGGlyphTableSource class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <UIKit/UIKit.h>

@class KGGlyphTableSource ;
@class KGGlyphTableDelegate ;

@interface KGGlyphTableView : UICollectionView
{
	KGGlyphTableSource *	dataSource ;
	KGGlyphTableDelegate *	tableDelegate ;
}

@end
