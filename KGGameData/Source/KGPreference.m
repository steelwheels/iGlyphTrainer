/**
 * @file	KGPreference.m
 * @brief	Define KGPreference class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGPreference.h"

@interface KGPreference ()
@property (assign, nonatomic) struct CNRGB	glyphColor ;
@end

@implementation KGPreference

@synthesize glyphColor ;

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
		self.glyphColor = ctable.goldenrod ;
	}
	return self ;
}

@end
