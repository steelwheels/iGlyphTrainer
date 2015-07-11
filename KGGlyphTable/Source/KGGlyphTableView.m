/**
 * @file	KGGlyphTableView.m
 * @brief	Define KGGlyphTableSource class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphTableView.h"
#import "KGGlyphTableSource.h"
#import "KGGlyphTableDelegate.h"

@interface KGGlyphTableView ()
- (void) setupGlyphTableView ;
@end

@implementation KGGlyphTableView

- (instancetype) initWithCoder: (NSCoder *) decoder
{
	if ((self = [super initWithCoder:decoder]) != nil){
		[self setupGlyphTableView] ;
	}
	return self;
}

- (instancetype) initWithFrame: (CGRect)frame
{
	if ((self = [super initWithFrame:frame]) != nil){
		[self setupGlyphTableView] ;
	}
	return self;
}

- (void) setupGlyphTableView
{
	dataSource = [[KGGlyphTableSource alloc] init] ;
	self.dataSource = dataSource ;
	
	tableDelegate = [[KGGlyphTableDelegate alloc] init] ;
	self.delegate = tableDelegate ;
}

@end
