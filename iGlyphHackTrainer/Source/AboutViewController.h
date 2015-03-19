/**
 * @file	AboutViewController.h
 * @brief	Define AboutViewController class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *backToMainViewButton;

- (void) backToMainViewButtonPressed: (UIBarButtonItem *) item ;

@end