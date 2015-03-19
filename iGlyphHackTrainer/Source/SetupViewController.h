/**
 * @file	SetupViewController.h
 * @brief	Define SetupViewController class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <UIKit/UIKit.h>

@interface SetupViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *backToMainViewButton;

- (void) backToMainViewButtonPressed: (UIBarButtonItem *) item ;

@end
