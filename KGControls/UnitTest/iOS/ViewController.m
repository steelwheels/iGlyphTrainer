//
//  ViewController.m
//  UTControls
//
//  Created by Tomoo Hamada on 2015/04/01.
//  Copyright (c) 2015年 Steel Wheels Project. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
	gameStatus = [[KGGameStatus alloc] init] ;
	[gameStatus addStateObserver: self.startButton] ;
	
	gameStatus.state = KGIdleState ;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end