/**
 * @file	KGPreference.h
 * @brief	Define KGPreference class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <CoconutGraphics/CoconutGraphics.h>

typedef enum {
	KGNormalSpeed		= 0,
	KGSlowSpeed		= 1,
	KGVerySlowSpeed		= 2
} KGSpeedSelection ;

@interface KGPreference : NSObject

@property (readonly, nonatomic) double		questionInterval ;

@property (assign, nonatomic)	NSInteger		maxQuestionSentenceLength ;
@property (assign, nonatomic)	NSInteger		minQuestionSentenceLength ;
@property (assign, nonatomic)   BOOL			doDisplayGlyphNameAtQuestionState ;
@property (assign, nonatomic)   BOOL			doDisplayGlyphNameAtAnswerState ;
@property (assign, nonatomic)	KGSpeedSelection	displaySpeed ;
@property (readonly, nonatomic) struct CNRGB		normalGlyphColor ;
@property (readonly, nonatomic) struct CNRGB		correctGlyphColor ;
@property (readonly, nonatomic) struct CNRGB		wrongGlyphColor ;

+ (KGPreference *) sharedPreference ;

- (instancetype) init ;

@end
