//
//  ViewController.m
//  UnitTest
//
//  Created by Tomoo Hamada on 2015/02/22.
//  Copyright (c) 2015年 Steel Wheels Project. All rights reserved.
//

#import "ViewController.h"
#import "KGGlyphGraphics.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.graphicsView.backgroundColor = [UIColor blackColor] ;
	
	KGGlyphDrawer * drawer = [[KGGlyphDrawer alloc] init] ;
	[self.graphicsView setDrawer: drawer] ;
	
	struct KGGlyphStroke stroke ;
	switch(1){
		case 0: {
			static struct KGGlyphEdge edge0 = { .fromVertex=7, .toVertex=8 } ;
			static struct KGGlyphEdge edge1 = { .fromVertex=8, .toVertex=9 } ;
			static struct KGGlyphEdge edges[2] ;
			edges[0] = edge0 ;
			edges[1] = edge1 ;
			stroke = KGMakeGlyphStroke(2, edges) ;
		} break ;
		case 1: {
			stroke = KGStrokeOfGlyph(
						 //KGAbondonGlyph,
						 //KGAdaptGlyph
						 //KGAdvanceGlyph
						 KGAfterGlyph
						 ) ;
		} break ;
	}
	
	[drawer setStroke: &stroke] ;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
