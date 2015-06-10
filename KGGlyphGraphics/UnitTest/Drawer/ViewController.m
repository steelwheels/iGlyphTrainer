//
//  ViewController.m
//  UnitTest
//
//  Created by Tomoo Hamada on 2015/02/22.
//  Copyright (c) 2015年 Steel Wheels Project. All rights reserved.
//

#import "ViewController.h"
#import "KGGlyphGraphics.h"

@interface ViewController () <KCGraphicsDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.graphicsView.backgroundColor = [UIColor blackColor] ;
	
	KGGlyphVertexDrawer * vdrawer = [[KGGlyphVertexDrawer alloc] init] ;
	KGGlyphStrokeDrawer * sdrawer = [[KGGlyphStrokeDrawer alloc] init] ;
	
	[self.graphicsView addGraphicsDrawer: vdrawer withDelegate: nil] ;
	[self.graphicsView addGraphicsDrawer: sdrawer withDelegate: self] ;
	
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
						 //KGAfterGlyph
						 //KGAgainGlyph
						 //KGAllGlyph
						 //KGAnswerGlyph
						 //KGAttackGlyph
						 //KGAvoidGlyph
						 //KGBarrierGlyph
						 //KGBeforeGlyph
						 KGBeginGlyph
						 ) ;
		} break ;
	}
	
	[sdrawer setStroke: &stroke] ;
	
	CNColorTable * ctable = [CNColorTable defaultColorTable] ;
	struct CNRGB color = ctable.goldenrod ;
	[sdrawer setColor: &color] ;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void) editingGraphicsEndedWithData:(void *)data
{
	printf("%s %p\n", __func__, data) ;
}

- (void) editingGraphicsCancelled
{
	printf("%s\n", __func__) ;
}

@end
