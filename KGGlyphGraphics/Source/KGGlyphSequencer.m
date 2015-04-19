/**
 * @file	KGGlyphSequencer.m
 * @brief	Define KGGlyphSequencer class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphSequencer.h"
#import <KGGameData/KGGameData.h>
#import <Coconut/Coconut.h>

@interface KGGlyphSequencer (KGPrivate) <CNCountTimerDelegate>
@end

@implementation KGGlyphSequencer

- (instancetype) init
{
	if((self = [super init]) != nil){
		countTimer = nil ;
	}
	return self ;
}

- (void) drawStroke: (const struct KGGlyphSentence *) sentence byDrawer: (KGGlyphDrawer *) drawer withDelegete: (id <KGGlyphSequenceOperation>) delegate
{
	glyphSentence	= sentence ;
	glyphDrawer	= drawer ;
	glyphDelegate	= delegate ;
	
	KGPreference * preference = [KGPreference sharedPreference] ;
	
	countTimer = [[CNCountTimer alloc] init] ;
	[countTimer repeatWithCount: sentence->wordNum
		       withInterval: preference.questionInterval
		       withDelegate: self] ;
}

@end

@implementation KGGlyphSequencer (KGPrivate)

- (void) repeatForCount: (unsigned int) count
{
	[glyphDelegate drawGlyphSequence: (glyphSentence->wordArray).glyphWords[count]] ;
}

- (void) repeatDone
{
	[glyphDelegate doneGlyphSequence] ;
}

@end

