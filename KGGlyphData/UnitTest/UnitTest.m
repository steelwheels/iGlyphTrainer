/**
 * @file	UnitTest.m
 * @brief	Header file for unit test
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "UnitTest.h"

static void
printTitle(const char * title) ;
int
main(int argc, const char * argv[]) {
	(void) argc ;
	(void) argv ;
	unsigned int	errorcount = 0 ;
	@autoreleasepool {
		printTitle("UTHackProgress") ;	//errorcount += UTHackProgress() ? 0 : 1 ;
		
		BOOL result = YES ;
		result &= UTGlyphStrokeArray() ;
		result &= UTGlyphComparator() ;
		result &= UTDumpSentence() ;
		
		if(result){
			puts("*** Summary : OK") ;
		} else {
			puts("*** Summary : NG") ;
		}
	}
	return errorcount == 0 ? 0 : 1 ;
}

static void
printTitle(const char * title)
{
	for(unsigned int i=0 ; i<40 ; i++){
		fputc('*', stdout) ;
	}
	fputc('\n', stdout) ;
	
	printf("* %s\n", title) ;
	
	for(unsigned int i=0 ; i<40 ; i++){
		fputc('*', stdout) ;
	}
	fputc('\n', stdout) ;
}

