/**
 * @file	SetupViewController.m
 * @brief	Define SetupViewController class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "SetupViewController.h"

@implementation SetupViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.backToMainViewButton.target = self ;
	self.backToMainViewButton.action = @selector(backToMainViewButtonPressed:) ;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void) backToMainViewButtonPressed: (UIBarButtonItem *) item
{
	(void) item ;
	puts("back to main view from setup") ;
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
