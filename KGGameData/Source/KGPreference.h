/**
 * @file	KGPreference.h
 * @brief	Define KGPreference class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <CoconutGraphics/CoconutGraphics.h>

@interface KGPreference : NSObject

@property (readonly, nonatomic) struct CNRGB	glyphColor ;
@property (readonly, nonatomic) double		questionInterval ;

+ (KGPreference *) sharedPreference ;

- (instancetype) init ;

@end
