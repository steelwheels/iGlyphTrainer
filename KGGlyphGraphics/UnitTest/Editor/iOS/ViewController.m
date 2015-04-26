//
//  ViewController.m
//  UTGlyphEditor
//
//  Created by Tomoo Hamada on 2015/03/08.
//  Copyright (c) 2015年 Steel Wheels Project. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.graphicsView.backgroundColor = [UIColor blackColor] ;
	
	KGGlyphEditor * editor = [[KGGlyphEditor alloc] init] ;
	[self.graphicsView setGraphicsDrawer: editor] ;
	[self.graphicsView setGraphicsEditor: editor] ;
	[self.graphicsView allocateTransparentViews: KGGlyphTransparentViewNum] ;
	[editor setEditable: YES] ;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
