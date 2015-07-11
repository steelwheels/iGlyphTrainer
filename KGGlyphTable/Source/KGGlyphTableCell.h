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
	KGGlyphKind			internalGlyphKind ;
}

@property (assign, nonatomic, setter=setGlyphKind:, getter=glyphKind)	KGGlyphKind glyphKind ;

@end
