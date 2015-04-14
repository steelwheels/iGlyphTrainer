//
//  ViewController.h
//  UTSequence
//
//  Created by Tomoo Hamada on 2015/04/10.
//  Copyright (c) 2015年 Steel Wheels Project. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KGGlyphView/KGGlyphView.h>
#import <KGGameData/KGGameData.h>
#import <KGControls/KGControls.h>

@interface ViewController : UIViewController
{
	KGGameStatus *		gameStatus ;
}

@property (weak, nonatomic) IBOutlet KGHackNavigationBar *navigationBar;

@property (weak, nonatomic) IBOutlet KGGlyphNameLabel *nameLabel;
@property (weak, nonatomic) IBOutlet KGGlyphSequenceView *sequenceView;

@property (weak, nonatomic) IBOutlet KGButton *nextButton;
@property (weak, nonatomic) IBOutlet KGButton *prevButton;

@end

