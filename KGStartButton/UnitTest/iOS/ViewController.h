//
//  ViewController.h
//  UTStartButton
//
//  Created by Tomoo Hamada on 2015/03/21.
//  Copyright (c) 2015年 Steel Wheels Project. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KGStartButton/KGStartButton.h>

@interface ViewController : UIViewController <KGStartButtonDelegate>

@property (weak, nonatomic) IBOutlet KGStartButton *startButton;

@end

