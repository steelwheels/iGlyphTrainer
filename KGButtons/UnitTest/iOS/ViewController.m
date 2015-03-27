//
//  ViewController.m
//  UTButtons
//
//  Created by Tomoo Hamada on 2015/03/23.
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
	[status addStateObserver: self.startButton] ;
	
	status.state = KGIdleState ;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
