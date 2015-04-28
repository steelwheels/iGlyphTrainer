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
	[gameStatus addStateObserver: self.glyphNameLabel] ;
	
	[self.normalButton addTarget: self action: @selector(pressNormalButton:) forControlEvents: UIControlEventTouchUpInside] ;
	[self.startButton addTarget: self action: @selector(pressStartButton:) forControlEvents: UIControlEventTouchUpInside] ;
	
	struct KGGlyphSentence sentence = KGGetEmptySentence() ;
	[gameStatus setNextState: KGIdleState withGlyphSentence: sentence] ;
	
	countTimer = nil ;
	[self.timerLabel setTimerLabel: 0.0] ;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void) pressNormalButton: (UIButton *) sender
{
	(void) sender ;
	puts("normal button pressed") ;
}

- (void) pressStartButton: (UIButton *) sender
{
	(void) sender ;
	puts("start button pressed") ;
	if(gameStatus.state == KGIdleState){
		[self.timerLabel setTimerLabel: 10.0] ;
		struct KGGlyphSentence sentence = KGGet3WordSentence(1) ;
		[gameStatus setNextState: KGDisplayQuestionState withGlyphSentence: sentence] ;
	} else {
		[self.timerLabel clearTimerLabel] ;
		struct KGGlyphSentence sentence = KGGetEmptySentence() ;
		[gameStatus setNextState: KGIdleState withGlyphSentence: sentence] ;
	}
}

@end
