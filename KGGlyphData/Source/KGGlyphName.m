/**
 * @file	KGGlyphName.m
 * @brief	Define function to get glyph name
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGGlyphName.h"

NSString *
KGNameOfGlyph(KGGlyphKind kind)
{
	NSString * result = nil ;
#	define CASE(NAME) \
		case KG ## NAME ## Glyph : result = @#NAME ; break
	switch(kind){
			CASE(Abandon) ;
			CASE(Adapt) ;
			CASE(Advance) ;
			CASE(After) ;
			CASE(Again) ;
			CASE(All) ;
			CASE(Answer) ;
			CASE(Attack) ;
			CASE(Avoid) ;
			CASE(Barrier) ;
			CASE(Before) ;
			CASE(Begin) ;
			CASE(Body) ;
			CASE(Breath) ;
			CASE(Capture) ;
			CASE(Change) ;
			CASE(Chaos) ;
			CASE(Clear) ;
			CASE(ClearAll) ;
			CASE(Complex) ;
			CASE(Conflict) ;
			CASE(Consequence) ;
			CASE(Contemplate) ;
			CASE(Contact) ;
			CASE(Courage) ;
			CASE(Create) ;
			CASE(Creativity) ;
			CASE(Mind) ;
			CASE(Danger) ;
			CASE(Data) ;
	}
	return result ;
#	undef CASE
}
