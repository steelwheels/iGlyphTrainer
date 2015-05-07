/**
 * @file	UTGlyphComparator.h
 * @brief	Unit test for KGGlyphComparator function
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "UnitTest.h"

static BOOL compare(KGGlyphKind k0, KGGlyphKind k1) ;

BOOL
UTGlyphComparator(void)
{
	BOOL result = YES ;
	result &= compare(KGNilGlyph, KGNilGlyph) ;
	result &= compare(KGAbandonGlyph, KGAbandonGlyph) ;
	result &= compare(KGAcceptGlyph, KGAdaptGlyph) ;
	return result ;
}

static BOOL
compare(KGGlyphKind k0, KGGlyphKind k1)
{
	NSString * n0 = KGNameOfGlyph(k0) ;
	NSString * n1 = KGNameOfGlyph(k1) ;
	printf("compare \"%s\" and \"%s\" -> ", [n0 UTF8String], [n1 UTF8String]) ;
	
	struct KGGlyphStroke s0 = KGStrokeOfGlyph(k0) ;
	struct KGGlyphStroke s1 = KGStrokeOfGlyph(k1) ;

	BOOL result ;
	if(KGCompareGlyphStrokes(&s0, &s1) == 0){
		printf(" same -> ") ;
		if(k0 == k1){
			result = YES ;
		} else {
			result = NO ;
		}
	} else {
		printf(" different -> ") ;
		if(k0 == k1){
			result = NO ;
		} else {
			result = YES ;
		}
	}
	puts(result ? "OK" : "NG") ;
	return result ;
}