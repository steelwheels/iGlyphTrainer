/**
 * @file	KGGlyphTableCell.m
 * @brief	Header file for KGGlyphTableCell framework
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphTableCell.h"
#import <KiwiControl/KiwiControl.h>

@interface KGGlyphTableCell ()
- (void) setupGlyphTableCell ;
@end

@implementation KGGlyphTableCell

- (instancetype) initWithCoder: (NSCoder *) decoder
{
	if ((self = [super initWithCoder:decoder]) != nil){
		[self setupGlyphTableCell] ;
	}
	return self;
}

- (instancetype) initWithFrame: (CGRect)frame
{
	if ((self = [super initWithFrame:frame]) != nil){
		[self setupGlyphTableCell] ;
	}
	return self;
}

- (void) setupGlyphTableCell
{
	glyphGraphicsView	= nil ;
	//glyphVetexDrawer	= nil ;
	glyphStrokeDrawer	= nil ;
	glyphLabelView		= nil ;
	
	if([[self subviews] count] > 0){
		return ; /* Already added */
	}
	
	UIView * xibview = KCLoadXib(self, NSStringFromClass(self.class)) ;
	if(xibview != nil){
		[self addSubview: xibview] ;
	} else {
		return ;
	}
	
	xibview.frame = self.bounds ;
	
	//xibview.translatesAutoresizingMaskIntoConstraints = YES;
	//xibview.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
	
	
	for(UIView * subview in [xibview subviews]){
		if([subview isKindOfClass: [UILabel class]]){
			glyphLabelView = (UILabel *) subview ;
		} else if([subview isKindOfClass: [KCGraphicsView class]]){
			glyphGraphicsView = (KCGraphicsView *) subview ;
		} else {
			NSLog(@"Unknown subview class") ;
		}
	}
	if(glyphGraphicsView == nil || glyphLabelView == nil){
		NSLog(@"Nil sub view") ;
	}
	
	self.backgroundColor = [UIColor blackColor] ;
	glyphLabelView.backgroundColor = [UIColor blackColor] ;
	glyphGraphicsView.backgroundColor = [UIColor blackColor] ;
	glyphLabelView.textColor = [UIColor whiteColor] ;
	
	/* Setup Graphics View */
	glyphStrokeDrawer = [[KGGlyphStrokeDrawer alloc] init] ;
	[glyphGraphicsView addGraphicsDrawer: glyphStrokeDrawer withDelegate: nil] ;
}

- (void) setGlyphKind: (KGGlyphKind) kind
{
	internalGlyphKind = kind ;
	
	struct KGGlyphStroke stroke = KGStrokeOfGlyph(kind) ;
	[glyphStrokeDrawer setStroke: &stroke] ;
	
	NSString * name = KGNameOfGlyph(kind) ;
	glyphLabelView.text = name ;
}

- (KGGlyphKind) glyphKind
{
	return internalGlyphKind ;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
