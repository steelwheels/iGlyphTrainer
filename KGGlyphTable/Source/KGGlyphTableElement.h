/**
 * @file	KGGlyphTableElement.h
 * @brief	Define KGGlyphTableElement class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <UIKit/UIKit.h>
#import <KCGraphicsView/KCGraphicsView.h>

@interface KGGlyphTableElement : UIView
{
	KCGraphicsView *		glyphGraphicsView ;
	UILabel *			glyphLabelView ;
}

@end
