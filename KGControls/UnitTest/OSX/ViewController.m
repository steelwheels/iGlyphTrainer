//
//  ViewController.m
//  UTControls
//
//  Created by Tomoo Hamada on 2015/04/01.
//  Copyright (c) 2015年 Steel Wheels Project. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	gameStatus = [[KGGameStatus alloc] init] ;
	[gameStatus addStateObserver: self.startButton] ;
	[gameStatus addStateObserver: self.glyphNameLabel] ;
	
	self.startButton.target  = self ;
	self.startButton.action  = @selector(pressStartButton:) ;
	
	self.normalButton.target = self ;
	self.normalButton.action = @selector(pressNormalButton:) ;
	
	gameStatus.state = KGIdleState ;
	gameStatus.presentingGlyph = KGAdvanceGlyph ;
}

- (void)setRepresentedObject:(id)representedObject {
	[super setRepresentedObject:representedObject];

	// Update the view, if already loaded.
}

- (void) pressNormalButton: (id) sender
{
	(void) sender ;
	puts("normal button pressed") ;
}

- (void) pressStartButton: (id) sender
{
	(void) sender ;
	puts("start button pressed") ;
	if(gameStatus.state == KGIdleState){
		gameStatus.state = KGPresentationState ;
		gameStatus.presentingGlyph = KGAbandonGlyph ;
	} else {
		gameStatus.state = KGIdleState ;
		gameStatus.presentingGlyph = KGAgainGlyph ;
	}
}

@end
