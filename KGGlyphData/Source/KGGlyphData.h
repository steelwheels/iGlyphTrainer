/**
 * @file	KGGlyphData.h
 * @brief	File to include all header files in KGGlyphData framework
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <Foundation/Foundation.h>
#import <TargetConditionals.h>
#if !TARGET_OS_IPHONE

//! Project version number for KGGlyphData.
FOUNDATION_EXPORT double KGGlyphDataVersionNumber;

//! Project version string for KGGlyphData.
FOUNDATION_EXPORT const unsigned char KGGlyphDataVersionString[];

#endif

#import <KGGlyphData/KGGlyphKind.h>
#import <KGGlyphData/KGGlyphModel.h>
#import <KGGlyphData/KGGlyphStroke.h>
#import <KGGlyphData/KGGlyphInputStrokes.h>
#import <KGGlyphData/KGGlyphName.h>
#import <KGGlyphData/KGGlyphSentence.h>
#import <KGGlyphData/KGGlyphHackTime.h>


