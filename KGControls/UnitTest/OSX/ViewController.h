//
//  ViewController.h
//  UTControls
//
//  Created by Tomoo Hamada on 2015/04/01.
//  Copyright (c) 2015年 Steel Wheels Project. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <KGControls/KGControls.h>
#import <KGGameData/KGGameData.h>
#import <Coconut/Coconut.h>

@interface ViewController : NSViewController
{
	KGGameStatus *		gameStatus ;
	CNCountTimer *		countTimer ;
}

@property (weak) IBOutlet KGLabel *normalLabel;
@property (weak) IBOutlet KGGlyphNameLabel *glyphNameLabel;
@property (weak) IBOutlet KGButton *normalButton;
@property (weak) IBOutlet KGStartButton *startButton;
@property (weak) IBOutlet KGTimerLabel *timerLabel;

- (void) pressNormalButton: (id) sender ;
- (void) pressStartButton: (id) sender ;

@end

