/**
 * @file	SetupViewController.m
 * @brief	Define SetupViewController class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "SetupViewController.h"
#import <KGGameData/KGGameData.h>

static const BOOL doDebug = NO ;

@interface SetupViewController ()
- (void) switchDoDisplayGlypyNameAtQuestionState: (KCSwitch *) switchbutton ;
- (void) switchDoDisplayGlypyNameAtAnswerState: (KCSwitch *) switchbutton ;
@end

@implementation SetupViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.backToMainViewButton.target = self ;
	self.backToMainViewButton.action = @selector(backToMainViewButtonPressed:) ;
	
	KGPreference * preference = [KGPreference sharedPreference] ;
	
	self.displaySwithForQuestionState.on = preference.doDisplayGlyphNameAtQuestionState ;
	[self.displaySwithForQuestionState addTarget: self action: @selector(switchDoDisplayGlypyNameAtQuestionState:) forControlEvents: UIControlEventValueChanged] ;
	
	self.displaySwitchForAnswerState.on = preference.doDisplayGlyphNameAtAnswerState ;
	[self.displaySwitchForAnswerState addTarget: self action: @selector(switchDoDisplayGlypyNameAtAnswerState:) forControlEvents: UIControlEventValueChanged] ;
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
