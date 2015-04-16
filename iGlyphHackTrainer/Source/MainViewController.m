/**
 * @file	MainViewController.m
 * @brief	Define MainViewController class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "MainViewController.h"
#import "MainStateMachine.h"
#import "AppDelegate.h"
#import <KGGlyphGraphics/KGGlyphGraphics.h>

static inline KGGameStatus *
gameStatus(void)
{
	UIApplication * app = [UIApplication sharedApplication] ;
	AppDelegate * delegate = app.delegate ;
	return delegate.gameStatus ;
}

@interface MainViewController ()
- (void) moveToSetupViewButtonPressed: (UIBarButtonItem *) item ;
- (void) moveToAboutViewButtonPressed: (UIBarButtonItem *) item ;
- (void) startButtonPressed: (KGStartButton *) button ;
@end

@implementation MainViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.moveToSetupViewButton.target = self ;
	self.moveToSetupViewButton.action = @selector(moveToSetupViewButtonPressed:) ;
	
	self.moveToAboutViewButton.target = self ;
	self.moveToAboutViewButton.action = @selector(moveToAboutViewButtonPressed:) ;
	
	[self.startButton addTarget: self
			     action: @selector(startButtonPressed:)
		   forControlEvents: UIControlEventTouchUpInside] ;
	
	KGGameStatus * status = gameStatus() ;
	[status addStateObserver: self.startButton] ;
	[status addStateObserver: self.navigationBar.progressView] ;
	
	stateMachine = [MainStateMachine sharedMainStateMachine] ;
	[stateMachine setGameStatus: status] ;
	
	KGGlyphDrawer * drawer = [[KGGlyphDrawer alloc] init] ;
	[self.glyphGraphicsView setGraphicsDrawer: drawer] ;
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

- (void) startButtonPressed: (KGStartButton *) button
{
	(void) button ;
	puts("Start button pressed") ;
	stateMachine = [MainStateMachine sharedMainStateMachine] ;
	[stateMachine start] ;
}

@end
