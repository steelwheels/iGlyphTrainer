//
//  ViewController.m
//  UTTimerLabel
//
//  Created by Tomoo Hamada on 2015/03/12.
//  Copyright (c) 2015年 Steel Wheels Project. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	CNCountTimer * timer = [[CNCountTimer alloc] init] ;
	[timer addDelegate: self.timerLabel] ;
	
	// Do any additional setup after loading the view.
	//[self.timerLabel setTimerLabel: 1.0] ;
	
	[timer startFromTime: 15.0 toTime: 0.0 withInterval: -1.0] ;
}

- (void)setRepresentedObject:(id)representedObject {
	[super setRepresentedObject:representedObject];

	// Update the view, if already loaded.
}

@end
