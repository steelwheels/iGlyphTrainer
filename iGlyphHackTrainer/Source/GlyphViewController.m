/**
 * @file	GlyphViewController.m
 * @brief	Define GlyphViewController class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "GlyphViewController.h"

static const BOOL doDebug = NO ;

@implementation GlyphViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.backToSetupViewButton.target = self ;
	self.backToSetupViewButton.action = @selector(backToSetupViewButtonPressed:) ;
	
#if 0
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
#endif
}

- (void) backToSetupViewButtonPressed: (UIBarButtonItem *) item
{
	(void) item ;
	if(doDebug){
		puts("back to setup view from glyph") ;
	}
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
