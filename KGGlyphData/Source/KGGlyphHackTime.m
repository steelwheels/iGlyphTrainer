/**
 * @file	KGGlyphHackTime.m
 * @brief	Define function for hacking time
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 * @par Reference
 *   http://ingressjp.blogspot.jp/p/hack.html
 */

#import "KGGlyphHackTime.h"
#import <Coconut/Coconut.h>

NSUInteger
KGCalcTimeForHacking(const struct KGGlyphSentence * src)
{
	NSUInteger result = 0 ;
	switch(src->wordNum){
		case 1: {
			result = 20 ;
		} break ;
		case 2: {
			result = 20 ;
		} break ;
		case 3: {
			result = [CNRandom randomIntegerBetween: 18 and: 20] ;
		} break ;
		case 4: {
			result = [CNRandom randomIntegerBetween: 16 and: 17] ;
		} break ;
		case 5: {
			result = 15 ;
		} break ;
	}
	return result ;
}
