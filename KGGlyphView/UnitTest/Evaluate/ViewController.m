//
//  ViewController.m
//  UTEvaluate
//
//  Created by Tomoo Hamada on 2015/05/02.
//  Copyright (c) 2015年 Steel Wheels Project. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	struct KGGlyphStroke istroke = KGStrokeOfGlyph(KGBalanceGlyph) ;
	KGAddStrokeToSharedInputStrokes(&istroke) ;

	struct KGGlyphStroke instroke = KGStrokeOfGlyph(KGResistanceGlyph) ;
	KGAddStrokeToSharedInputStrokes(&instroke) ;
	
	KGGameStatus * status = [[KGGameStatus alloc] init] ;
	
	[status addStateObserver: self.glyphSequenceView] ;
	struct KGGlyphSentence sentence = KGGet2WordSentence(0) ;
	[status setNextState: KGEvaluateState withGlyphSentence: sentence] ;
}

- (void)setRepresentedObject:(id)representedObject {
	[super setRepresentedObject:representedObject];

	// Update the view, if already loaded.
}

@end
