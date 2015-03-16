//
//  ViewController.m
//  UTHackProgressView
//
//  Created by Tomoo Hamada on 2015/03/17.
//  Copyright (c) 2015年 Steel Wheels Project. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	hackProgress = [[KGHackProgress alloc] initWithMaxProgress: 3] ;
	[self.progressView setHackProgress: hackProgress] ;
}

- (void)setRepresentedObject:(id)representedObject {
	[super setRepresentedObject:representedObject];

	// Update the view, if already loaded.
}

@end
