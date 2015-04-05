/**
 * @file	MainViewController.h
 * @brief	Define MainViewController class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <KGControls/KGControls.h>
#import <KGHackProgressView/KGHackProgressView.h>
#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *		moveToSetupViewButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *		moveToAboutViewButton;
@property (weak, nonatomic) IBOutlet KGGlyphNameLabel *		glyphNameLabel;
@property (weak, nonatomic) IBOutlet KGStartButton *		startButton;
@property (weak, nonatomic) IBOutlet KGHackProgressView *	hackProgressView;
@property (weak, nonatomic) IBOutlet KGTimerLabel *timerLabel;

- (void) moveToSetupViewButtonPressed: (UIBarButtonItem *) item ;
- (void) moveToAboutViewButtonPressed: (UIBarButtonItem *) item ;

@end

