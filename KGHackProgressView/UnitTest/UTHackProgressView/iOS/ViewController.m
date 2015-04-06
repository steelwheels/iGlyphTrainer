//
//  ViewController.m
//  UTHackProgressView
//
//  Created by Tomoo Hamada on 2015/03/17.
//  Copyright (c) 2015年 Steel Wheels Project. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	KGGameStatus * status = [[KGGameStatus alloc] init] ;
	[status addStateObserver: self.hackProgressView] ;
	
	KGHackProgressDrawer * drawer = [[KGHackProgressDrawer alloc] init] ;
	[self.hackProgressView setGraphicsDrawer: drawer] ;

	status.maxGlyphNum		= 4 ;
	status.processedGlyphNum	= 2 ;
	status.state			= KGDisplayQuestionState ;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
