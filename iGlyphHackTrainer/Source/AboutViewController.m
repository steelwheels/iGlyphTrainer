/**
 * @file	AboutViewController.m
 * @brief	Define AboutViewController class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "AboutViewController.h"

@implementation AboutViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.backToMainViewButton.target = self ;
	self.backToMainViewButton.action = @selector(backToMainViewButtonPressed:) ;
	
	[self.preferenceTable applyPreferenceColors] ;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void) backToMainViewButtonPressed: (UIBarButtonItem *) item
{
	(void) item ;
	puts("back to main view from about") ;
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
