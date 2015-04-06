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

	gameStatus = [[KGGameStatus alloc] init] ;
	[gameStatus addStateObserver: self.progressView] ;
	
	gameStatus.maxGlyphNum		= 5 ;
	gameStatus.processedGlyphNum	= 2 ;
	gameStatus.state		= KGDisplayQuestionState ;
}

- (void)setRepresentedObject:(id)representedObject {
	[super setRepresentedObject:representedObject];

	// Update the view, if already loaded.
}

@end
