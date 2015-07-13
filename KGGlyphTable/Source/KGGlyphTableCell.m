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

static UIView *
loadXib(UIView * parentview, NSString * nibname) ;

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
	glyphStrokeDrawer	= nil ;
	glyphLabelView		= nil ;
	
	if([[self.contentView subviews] count] > 0){
		return ; /* Already added */
	}
	
	UIView * xibview = loadXib(self, NSStringFromClass(self.class)) ;
	if(xibview != nil){
		[self.contentView addSubview: xibview] ;
	} else {
		NSLog(@"Could not load XIB") ;
		return ;
	}
	
	//KCPrintView(xibview) ;
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
	glyphKind = kind ;
	
	struct KGGlyphStroke stroke = KGStrokeOfGlyph(kind) ;
	[glyphStrokeDrawer setStroke: &stroke] ;
	[glyphGraphicsView setNeedsLayout] ;
	 
	NSString * name = KGNameOfGlyph(kind) ;
	glyphLabelView.text = name ;
}

- (KGGlyphKind) glyphKind
{
	return glyphKind ;
}

- (void)drawRect:(CGRect)rect
{
	[super drawRect: rect] ;
}

- (void) prepareForReuse
{
	[super prepareForReuse] ;
	//[glyphGraphicsView setNeedsDisplay] ;
}

@end

static inline NSLayoutConstraint *
allocateLayout(UIView * parentview, UIView * subview, NSLayoutAttribute attribute)
{
	return [NSLayoutConstraint constraintWithItem: parentview
					    attribute: attribute
					    relatedBy: NSLayoutRelationEqual
					       toItem: subview
					    attribute: attribute
					   multiplier: 1.0
					     constant: 0.0];
}

static UIView *
loadXib(UIView * parentview, NSString * nibname)
{
	UINib *nib = [UINib nibWithNibName: nibname bundle:nil];
	UIView * loadedSubview = [[nib instantiateWithOwner:nil options:nil] objectAtIndex:0];
		
	[parentview addSubview:loadedSubview];
		
	loadedSubview.translatesAutoresizingMaskIntoConstraints = NO;
		
	[parentview addConstraint: allocateLayout(parentview, loadedSubview, NSLayoutAttributeTop)] ;
	[parentview addConstraint: allocateLayout(parentview, loadedSubview, NSLayoutAttributeLeft)] ;
	[parentview addConstraint: allocateLayout(parentview, loadedSubview, NSLayoutAttributeBottom)] ;
	[parentview addConstraint: allocateLayout(parentview, loadedSubview, NSLayoutAttributeRight)] ;
		
	return loadedSubview ;
}

