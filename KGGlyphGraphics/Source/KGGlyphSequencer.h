/**
 * @file	KGGlyphSequencer.h
 * @brief	Define KGGlyphSequencer class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphDrawer.h"
#import <KGGlyphData/KGGlyphData.h>
#import <Coconut/Coconut.h>

@protocol KGGlyphSequenceOperation
- (void) drawGlyphSequence: (KGGlyphKind) kind ;
- (void) doneGlyphSequence ;
@end

@interface KGGlyphSequencer : NSObject
{
	const struct KGGlyphSentence *	glyphSentence ;
	KGGlyphDrawer *			glyphDrawer ;
	id <KGGlyphSequenceOperation>	glyphDelegate ;
	
	CNCountTimer *			countTimer ;
}

- (instancetype) init ;
- (void) drawStroke: (const struct KGGlyphSentence *) sentence byDrawer: (KGGlyphDrawer *) drawer withDelegete: (id <KGGlyphSequenceOperation>) delegate ;

@end
