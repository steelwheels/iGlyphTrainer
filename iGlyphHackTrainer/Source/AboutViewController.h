/**
 * @file	AboutViewController.h
 * @brief	Define AboutViewController class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <KCPreferenceTable/KCPreferenceTable.h>

@interface AboutViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *backToMainViewButton;
@property (weak, nonatomic) IBOutlet KCPreferenceTable *preferenceTable ;

- (void) backToMainViewButtonPressed: (UIBarButtonItem *) item ;

@end
