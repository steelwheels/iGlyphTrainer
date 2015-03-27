/**
 * @file	MainViewController.m
 * @brief	Define MainViewController class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "MainViewController.h"
#import "AppDelegate.h"

static inline KGGameStatus *
gameStatus(void)
{
	UIApplication * app = [UIApplication sharedApplication] ;
	AppDelegate * delegate = app.delegate ;
	return delegate.gameStatus ;
}

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.moveToSetupViewButton.target = self ;
	self.moveToSetupViewButton.action = @selector(moveToSetupViewButtonPressed:) ;
	
	self.moveToAboutViewButton.target = self ;
	self.moveToAboutViewButton.action = @selector(moveToAboutViewButtonPressed:) ;
	
	KGGameStatus * status = gameStatus() ;
	[status addStateObserver: self.startButton] ;
	[status addStateObserver: self.hackProgressView] ;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void) moveToSetupViewButtonPressed: (UIBarButtonItem *) item
{
	(void) item ;
	puts("moveToSetupViewButtonPressed:") ;
	[self performSegueWithIdentifier: @"SegueFromMainToSetup" sender: self] ;
}

- (void) moveToAboutViewButtonPressed: (UIBarButtonItem *) item
{
	(void) item ;
	puts("moveToAboutViewButtonPressed: ") ;
	[self performSegueWithIdentifier: @"SegueFromMainToAbout" sender: self] ;
}

@end
