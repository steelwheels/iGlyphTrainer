//
//  ViewController.m
//  UTSequence
//
//  Created by Tomoo Hamada on 2015/04/10.
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
	[gameStatus addStateObserver: self.nameLabel] ;
	[gameStatus addStateObserver: self.sequenceView] ;

	gameStatus.currentGlyphKind = KGAbandonGlyph ;
	gameStatus.state = KGDisplayQuestionState ;

}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
