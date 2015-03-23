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
	
	KGGameProgress * progress = [[KGGameProgress alloc] init] ;
	[self.startButton setGameProgress: progress] ;
	
	progress.gameStatus = KGPresentationStatus ;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
