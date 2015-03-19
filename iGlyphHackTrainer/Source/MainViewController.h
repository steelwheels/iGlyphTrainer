/**
 * @file	MainViewController.h
 * @brief	Define MainViewController class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *moveToSetupViewButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *moveToAboutViewButton;

- (void) moveToSetupViewButtonPressed: (UIBarButtonItem *) item ;
- (void) moveToAboutViewButtonPressed: (UIBarButtonItem *) item ;

@end

