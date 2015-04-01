//
//  ViewController.m
//  UTControls
//
//  Created by Tomoo Hamada on 2015/04/01.
//  Copyright (c) 2015年 Steel Wheels Project. All rights reserved.
//

#import "ViewController.h"
#import <KGGameData/KGGameData.h>

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	KGGameStatus * status = [[KGGameStatus alloc] init] ;
	[status addStateObserver: self.startButton] ;
	
	status.state = KGIdleState ;
}

- (void)setRepresentedObject:(id)representedObject {
	[super setRepresentedObject:representedObject];

	// Update the view, if already loaded.
}

@end
