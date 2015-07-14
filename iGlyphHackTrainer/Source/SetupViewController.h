/**
 * @file	SetupViewController.h
 * @brief	Define SetupViewController class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <KCSwitch/KCSwitch.h>
#import <KCNumberStepper/KCNumberStepper.h>

@interface SetupViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *backToMainViewButton ;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *moveToGlyphViewButton;
@property (weak, nonatomic) IBOutlet KCSwitch *displaySwithForQuestionState;
@property (weak, nonatomic) IBOutlet KCSwitch *displaySwitchForAnswerState;
@property (weak, nonatomic) IBOutlet KCNumberStepperView *maxNumberStepper;
@property (weak, nonatomic) IBOutlet KCNumberStepperView *minNumberStepper;

- (void) backToMainViewButtonPressed: (UIBarButtonItem *) item ;
- (void) moveToGlyphViewButtonPressed: (UIBarButtonItem *) item ;

@end
