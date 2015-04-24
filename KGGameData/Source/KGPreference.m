/**
 * @file	KGPreference.m
 * @brief	Define KGPreference class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGPreference.h"

@interface KGPreference ()
@property (assign, nonatomic) struct CNRGB	glyphColor ;
@property (assign, nonatomic) double		questionInterval ;
@property (assign, nonatomic) unsigned int	maxQuestionSentenceLength ;
@property (assign, nonatomic) unsigned int	minQuestionSentenceLength ;
@end

@implementation KGPreference

@synthesize glyphColor, questionInterval, maxQuestionSentenceLength, minQuestionSentenceLength ;

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
		CNColorTable * ctable = [CNColorTable defaultColorTable] ;
		self.glyphColor			= ctable.goldenrod ;
		self.questionInterval		= 1.0 ;
		self.maxQuestionSentenceLength	= 5 ;
		self.minQuestionSentenceLength	= 2 ;
	}
	return self ;
}

@end
