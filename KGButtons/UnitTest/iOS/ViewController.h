//
//  ViewController.h
//  UTButtons
//
//  Created by Tomoo Hamada on 2015/03/23.
//  Copyright (c) 2015年 Steel Wheels Project. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KGButtons/KGButtons.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet KGButton *normalButton;
@property (weak, nonatomic) IBOutlet KGStartButton *startButton;

@end

