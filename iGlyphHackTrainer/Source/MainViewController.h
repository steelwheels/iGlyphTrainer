/**
 * @file	MainViewController.h
 * @brief	Define MainViewController class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *moveToLevelViewButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *moveToAboutViewButton;

- (void) moveToLevelViewButtonPressed: (UIBarButtonItem *) item ;
- (void) moveToAboutViewButtonPressed: (UIBarButtonItem *) item ;

@end

