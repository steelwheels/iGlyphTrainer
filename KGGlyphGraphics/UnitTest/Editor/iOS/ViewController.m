//
//  ViewController.m
//  UTGlyphEditor
//
//  Created by Tomoo Hamada on 2015/03/08.
//  Copyright (c) 2015年 Steel Wheels Project. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <KCGraphicsDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.graphicsView.backgroundColor = [UIColor blackColor] ;
	
	KGGlyphVertexDrawer * vdrawer = [[KGGlyphVertexDrawer alloc] init] ;
	KGGlyphStrokeEditor * editor = [[KGGlyphStrokeEditor alloc] init] ;
	[self.graphicsView addGraphicsDrawer: vdrawer withDelegate: nil] ;
	[self.graphicsView addGraphicsDrawer: editor withDelegate: self] ;
	[editor setEditable: YES] ;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void) editingGraphicsEnded
{
	printf("%s\n", __func__) ;
}

- (void) editingGraphicsCancelled
{
	printf("%s\n", __func__) ;
}

@end
