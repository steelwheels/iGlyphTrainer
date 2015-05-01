/**
 * @file	KGPreference.m
 * @brief	Define KGPreference class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGPreference.h"

@interface KGPreference ()
@property (assign, nonatomic) double		questionInterval ;
@property (assign, nonatomic) unsigned int	maxQuestionSentenceLength ;
@property (assign, nonatomic) unsigned int	minQuestionSentenceLength ;
@property (assign, nonatomic) BOOL		doDisplayGlyphNameAtQuestionState ;
@property (assign, nonatomic) BOOL		doDisplayGlyphNameAtAnswerState ;
@end

@implementation KGPreference

@synthesize questionInterval, maxQuestionSentenceLength, minQuestionSentenceLength ;
@synthesize doDisplayGlyphNameAtQuestionState, doDisplayGlyphNameAtAnswerState ;

+ (KGPreference *) sharedPreference
{
	static KGPreference * sharedPreference = nil ;
	static dispatch_once_t once;
	dispatch_once( &once, ^{
		sharedPreference = [[KGPreference alloc] init] ;
	});
	return sharedPreference ;
}

- (instancetype) init
{
	if((self = [super init]) != nil){
		self.questionInterval			= 1.0 ;
		self.maxQuestionSentenceLength		= 5 ;
		self.minQuestionSentenceLength		= 2 ;
		self.doDisplayGlyphNameAtQuestionState	= YES ;
		self.doDisplayGlyphNameAtAnswerState	= YES ;
	}
	return self ;
}

@end
