/**
 * @file	KGGlyphTableElement.h
 * @brief	Define KGGlyphTableElement class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <KCGraphicsView/KCGraphicsView.h>
#import <KGGlyphGraphics/KGGlyphGraphics.h>
#import <KGGlyphData/KGGlyphData.h>
#import <UIKit/UIKit.h>

@interface KGGlyphTableElement : UIView
{
	KCGraphicsView *		glyphGraphicsView ;
	//KGGlyphVertexDrawer *		glyphVetexDrawer ;
	KGGlyphStrokeDrawer *		glyphStrokeDrawer ;
	UILabel *			glyphLabelView ;
	KGGlyphKind			internalGlyphKind ;
}

@property (assign, nonatomic, setter=setGlyphKind:, getter=glyphKind)	KGGlyphKind glyphKind ;

@end
