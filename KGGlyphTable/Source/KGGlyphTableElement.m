/**
 * @file	KGGlyphTableElement.m
 * @brief	Define KGGlyphTableElement class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphTableElement.h"

@interface KGGlyphTableElement ()
- (void) setupGlyphTableElement ;
@end

@implementation KGGlyphTableElement

- (instancetype) initWithCoder: (NSCoder *) decoder
{
	if ((self = [super initWithCoder:decoder]) != nil){
		[self setupGlyphTableElement] ;
	}
	return self;
}

- (instancetype) initWithFrame: (CGRect)frame
{
	if ((self = [super initWithFrame:frame]) != nil){
		[self setupGlyphTableElement] ;
	}
	return self;
}

- (void) setupGlyphTableElement
{
	if([[self subviews] count] > 0){
		return ; /* Already added */
	}
	
	UIView * xibview = KCLoadXib(self, NSStringFromClass(self.class)) ;
	if(xibview != nil){
		[self addSubview: xibview] ;
	} else {
		return ;
	}
	
	glyphGraphicsView	= nil ;
	glyphLabelView		= nil ;
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
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
