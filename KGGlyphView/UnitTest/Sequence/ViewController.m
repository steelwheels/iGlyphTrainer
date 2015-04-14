//
//  ViewController.m
//  UTSequence
//
//  Created by Tomoo Hamada on 2015/04/10.
//  Copyright (c) 2015年 Steel Wheels Project. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (void) pressNextButton: (UIButton *) button ;
- (void) pressPrevButton: (UIButton *) button ;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	// Do any additional setup after loading the view, typically from a nib.
	gameStatus = [[KGGameStatus alloc] init] ;
	[gameStatus addStateObserver: self.nameLabel] ;
	[gameStatus addStateObserver: self.sequenceView] ;
	
	[self.navigationBar setupProgressBar] ;
	KGHackProgressView * progressview = [self.navigationBar progressView] ;
	[gameStatus addStateObserver: progressview] ;
	
	[self.nextButton addTarget: self action:@selector(pressNextButton:) forControlEvents: UIControlEventTouchUpInside] ;
	[self.prevButton addTarget: self action:@selector(pressPrevButton:) forControlEvents: UIControlEventTouchUpInside] ;
	
	gameStatus.currentGlyphKind = KGAbandonGlyph ;
	gameStatus.maxGlyphNum = 5 ;
	gameStatus.processedGlyphNum = 2 ;
	gameStatus.state = KGDisplayQuestionState ;
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void) pressNextButton: (UIButton *) button
{
	(void) button ;
	KGGlyphKind curkind = gameStatus.currentGlyphKind ;
	KGGlyphKind nextkind ;
	if(curkind < KGLastClyph){
		nextkind = curkind + 1 ;
	} else {
		nextkind = KGFirstClyph ;
	}
	gameStatus.currentGlyphKind = nextkind ;
	gameStatus.state = KGDisplayQuestionState ;
}

- (void) pressPrevButton: (UIButton *) button
{
	(void) button ;
	KGGlyphKind curkind = gameStatus.currentGlyphKind ;
	KGGlyphKind nextkind ;
	if(curkind > KGFirstClyph){
		nextkind = curkind - 1 ;
	} else {
		nextkind = KGLastClyph ;
	}
	gameStatus.currentGlyphKind = nextkind ;
	gameStatus.state = KGDisplayQuestionState ;
}

@end
