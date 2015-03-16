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

	KGHackProgress * progress = [[KGHackProgress alloc] initWithMaxProgress: 5] ;
	KGHackProgressDrawer * drawer = [[KGHackProgressDrawer alloc] init] ;
	[self.hackProgressView setGraphicsDrawer: drawer] ;
	[self.hackProgressView setHackProgress: progress] ;

	progress.currentProgress = 2 ;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
