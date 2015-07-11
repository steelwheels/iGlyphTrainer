/**
 * @file	KGGlyphTableCell.h
 * @brief	Header file for KGGlyphTableCell framework
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <KCGraphicsView/KCGraphicsView.h>
#import <KGGlyphGraphics/KGGlyphGraphics.h>

@interface KGGlyphTableCell : UICollectionViewCell 
{
	KCGraphicsView *		glyphGraphicsView ;
	KGGlyphStrokeDrawer *		glyphStrokeDrawer ;
	UILabel *			glyphLabelView ;
	KGGlyphKind			glyphKind ;
}

- (void) setGlyphKind: (KGGlyphKind) kind ;
- (KGGlyphKind) glyphKind ;

@end
