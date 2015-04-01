//
//  ViewController.h
//  UTControls
//
//  Created by Tomoo Hamada on 2015/04/01.
//  Copyright (c) 2015年 Steel Wheels Project. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KGControls/KGControls.h>
#import <KGGameData/KGGameData.h>

@interface ViewController : UIViewController
{
	KGGameStatus *		gameStatus ;
}

@property (weak, nonatomic) IBOutlet KGButton *normalButton;
@property (weak, nonatomic) IBOutlet KGStartButton *startButton;

@end

