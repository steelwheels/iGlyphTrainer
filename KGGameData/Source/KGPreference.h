/**
 * @file	KGPreference.h
 * @brief	Define KGPreference class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <CoconutGraphics/CoconutGraphics.h>

@interface KGPreference : NSObject

@property (readonly, nonatomic) double		questionInterval ;

@property (assign, nonatomic)	NSInteger	maxQuestionSentenceLength ;
@property (assign, nonatomic)	NSInteger	minQuestionSentenceLength ;
@property (assign, nonatomic)   BOOL		doDisplayGlyphNameAtQuestionState ;
@property (assign, nonatomic)   BOOL		doDisplayGlyphNameAtAnswerState ;

@property (readonly, nonatomic) struct CNRGB	normalGlyphColor ;
@property (readonly, nonatomic) struct CNRGB	correctGlyphColor ;
@property (readonly, nonatomic) struct CNRGB	wrongGlyphColor ;

+ (KGPreference *) sharedPreference ;

- (instancetype) init ;

@end
