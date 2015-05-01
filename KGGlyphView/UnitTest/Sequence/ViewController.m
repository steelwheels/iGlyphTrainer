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
	
	struct KGGlyphSentence sentence = KGGet5WordSentence(0) ;
	[gameStatus setNextState: KGDisplayQuestionState withGlyphSentence: sentence] ;
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void) pressNextButton: (UIButton *) button
{
	(void) button ;
	struct KGGlyphSentence sentence = gameStatus.currentSentence ;
	unsigned int index = gameStatus.currentGlyphIndex ;
	if(index < sentence.wordNum-1){
		index++ ;
	} else {
		index = 0 ;
	}
	gameStatus.currentGlyphIndex = index ;
	gameStatus.state = KGDisplayQuestionState ;
}

- (void) pressPrevButton: (UIButton *) button
{
	(void) button ;
	struct KGGlyphSentence sentence = gameStatus.currentSentence ;
	unsigned int index = gameStatus.currentGlyphIndex ;
	if(index > 0){
		index-- ;
	} else {
		index = sentence.wordNum - 1 ;
	}
	gameStatus.currentGlyphIndex = index ;
	gameStatus.state = KGDisplayQuestionState ;
}

@end
