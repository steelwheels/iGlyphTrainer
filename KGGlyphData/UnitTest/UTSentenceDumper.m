/**
 * @file	UTSentenceDumper.h
 * @brief	Dump sentences
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "UnitTest.h"

static void printTitle(const char * title) ;
static void printLine(void) ;
static void printSentence(const struct KGGlyphSentence * src) ;

BOOL
UTDumpSentence(void)
{
	unsigned int i ;
	unsigned int num ;
	
	printTitle("2 words sentence") ;
	num = KGGet2WordSentenceNum() ;
	for(i=0 ; i<num ; i++){
		struct KGGlyphSentence sentence = KGGet2WordSentence(i) ;
		printSentence(&sentence) ;
	}
	
	printTitle("3 words sentence") ;
	num = KGGet3WordSentenceNum() ;
	for(i=0 ; i<num ; i++){
		struct KGGlyphSentence sentence = KGGet3WordSentence(i) ;
		printSentence(&sentence) ;
	}
	
	printTitle("4 words sentence") ;
	num = KGGet4WordSentenceNum() ;
	for(i=0 ; i<num ; i++){
		struct KGGlyphSentence sentence = KGGet4WordSentence(i) ;
		printSentence(&sentence) ;
	}
	
	printTitle("5 words sentence") ;
	num = KGGet5WordSentenceNum() ;
	for(i=0 ; i<num ; i++){
		struct KGGlyphSentence sentence = KGGet5WordSentence(i) ;
		printSentence(&sentence) ;
	}
	
	return YES ;
}

static void
printTitle(const char * title)
{
	printLine() ;
	printf("* %s\n", title) ;
	printLine() ;
}

static void
printLine(void)
{
	unsigned int i ;
	for(i=0 ; i<40 ; i++){
		putc('-', stdout) ;
	}
	putc('\n', stdout) ;
}

static void
printSentence(const struct KGGlyphSentence * src)
{
	unsigned int num = src->wordNum ;
	unsigned int i ;
	for(i=0 ; i<num ; i++){
		KGGlyphKind kind = src->glyphWords[i] ;
		NSString * name = KGNameOfGlyph(kind) ;
		printf("%s ", [name UTF8String]) ;
	}
	putc('\n', stdout) ;
}