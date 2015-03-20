//
//  ViewController.m
//  UnitTest
//
//  Created by Tomoo Hamada on 2015/03/20.
//  Copyright (c) 2015年 Steel Wheels Project. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	// Do any additional setup after loading the view.
	KGGameProgress * progress = [[KGGameProgress alloc] init] ;
	[self.startButton setGameProgress: progress] ;
	
	progress.gameStatus = KGIdleStatus ;
}

- (void)setRepresentedObject:(id)representedObject {
	[super setRepresentedObject:representedObject];

	// Update the view, if already loaded.
}

@end
