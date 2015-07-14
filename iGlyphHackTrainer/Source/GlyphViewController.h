/**
 * @file	GlyphViewController.h
 * @brief	Define GlyphViewController class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <KCPreferenceTable/KCPreferenceTable.h>

@interface GlyphViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *backToSetupViewButton;

- (void) backToSetupViewButtonPressed: (UIBarButtonItem *) item ;

@end
