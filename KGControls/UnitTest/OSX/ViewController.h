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

@interface ViewController : NSViewController
{
	KGGameStatus *	gameStatus ;
}

@property (weak) IBOutlet KGLabel *normalLabel;
@property (weak) IBOutlet KGGlyphNameLabel *glyphNameLabel;
@property (weak) IBOutlet KGButton *normalButton;
@property (weak) IBOutlet KGStartButton *startButton;

- (void) pressNormalButton: (id) sender ;
- (void) pressStartButton: (id) sender ;

@end

