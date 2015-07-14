/**
 * @file	SetupViewController.m
 * @brief	Define SetupViewController class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "SetupViewController.h"
#import <KGGameData/KGGameData.h>

static const BOOL doDebug = NO ;

typedef enum {
	MaxNumberStepperId	= 1,
	MinNumberStepperId	= 2
} stepper_id ;

@interface SetupViewController ()
- (void) switchDoDisplayGlypyNameAtQuestionState: (KCSwitch *) switchbutton ;
- (void) switchDoDisplayGlypyNameAtAnswerState: (KCSwitch *) switchbutton ;
@end

@interface SetupViewController (Stepper) <KCNumberStepperOperating>
@end

@implementation SetupViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.backToMainViewButton.target = self ;
	self.backToMainViewButton.action = @selector(backToMainViewButtonPressed:) ;
	
	self.moveToGlyphViewButton.target = self ;
	self.moveToGlyphViewButton.action = @selector(moveToGlyphViewButtonPressed:) ;
	
	KGPreference * preference = [KGPreference sharedPreference] ;
	
	self.displaySwithForQuestionState.on = preference.doDisplayGlyphNameAtQuestionState ;
	[self.displaySwithForQuestionState addTarget: self action: @selector(switchDoDisplayGlypyNameAtQuestionState:) forControlEvents: UIControlEventValueChanged] ;
	
	self.displaySwitchForAnswerState.on = preference.doDisplayGlyphNameAtAnswerState ;
	[self.displaySwitchForAnswerState addTarget: self action: @selector(switchDoDisplayGlypyNameAtAnswerState:) forControlEvents: UIControlEventValueChanged] ;

	self.maxNumberStepper.tag = MaxNumberStepperId ;
	self.maxNumberStepper.delegate = self ;
	[self.maxNumberStepper setMaxIntValue: 5 withMinIntValue: 2 withStepIntValue: 1 withInitialValue: preference.maxQuestionSentenceLength];

	self.minNumberStepper.tag = MinNumberStepperId ;
	self.minNumberStepper.delegate = self ;
	[self.minNumberStepper setMaxIntValue: 5 withMinIntValue: 2 withStepIntValue: 1 withInitialValue: preference.minQuestionSentenceLength] ;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void) backToMainViewButtonPressed: (UIBarButtonItem *) item
{
	(void) item ;
	if(doDebug){
		puts("back to main view from setup") ;
	}
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void) moveToGlyphViewButtonPressed: (UIBarButtonItem *) item
{
	(void) item ;
	if(doDebug){
		puts("move to glyph view from setup") ;
	}
	[self performSegueWithIdentifier: @"SegueFromSetupToGlyph" sender: self] ;
}

- (void) switchDoDisplayGlypyNameAtQuestionState: (KCSwitch *) switchbutton
{
	KGPreference * preference = [KGPreference sharedPreference] ;
	preference.doDisplayGlyphNameAtQuestionState = switchbutton.on ;
}

- (void) switchDoDisplayGlypyNameAtAnswerState: (KCSwitch *) switchbutton
{
	KGPreference * preference = [KGPreference sharedPreference] ;
	preference.doDisplayGlyphNameAtAnswerState = switchbutton.on ;
}

@end

@implementation SetupViewController (Stepper)

- (void) updateNumberStepper: (KCNumberStepperView *) view
{
	KGPreference * preference = [KGPreference sharedPreference] ;
	switch(view.tag){
		case MaxNumberStepperId: {
			NSInteger curminnum = [self.minNumberStepper value] ;
			NSInteger newmaxnum = [self.maxNumberStepper value] ;
			if(newmaxnum < curminnum){
				[self.minNumberStepper setValue: newmaxnum ];
				preference.minQuestionSentenceLength = newmaxnum ;
				curminnum = newmaxnum ;
			}
			preference.maxQuestionSentenceLength = newmaxnum ;
			if(doDebug){
				printf(" [MAX]  min %d, *max %d\n", (int) curminnum, (int) newmaxnum) ;
			}
		} break ;
		case MinNumberStepperId: {
			NSInteger newminnum = [self.minNumberStepper value] ;
			NSInteger curmaxnum = [self.maxNumberStepper value] ;
			if(curmaxnum < newminnum){
				[self.maxNumberStepper setValue: newminnum] ;
				preference.maxQuestionSentenceLength = newminnum ;
				curmaxnum = newminnum ;
			}
			preference.minQuestionSentenceLength = newminnum ;
			if(doDebug){
				printf(" [MIN] *min %d,  max %d\n", (int) newminnum, (int) curmaxnum) ;
			}
		} break ;
	}
}

@end

