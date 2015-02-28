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
	// Do any additional setup after loading the view, typically from a nib.
	
	KGGlyphDrawer * drawer = [[KGGlyphDrawer alloc] init] ;
	[self.graphicsView setDrawer: drawer] ;
	
	static struct KGGlyphEdge edge = { .fromVertex=0, .toVertex=1 } ;
	struct KGGlyphStroke stroke = KGMakeGlyphStroke(1, &edge) ;
	[drawer setStroke: &stroke] ;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
