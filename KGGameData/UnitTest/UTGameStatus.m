/**
 * @file	UTHackProgress
 * @brief	Unit test for KGHackProgress class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "UnitTest.h"

@interface UTObserver : NSObject
@end

@implementation UTObserver

-(void) observeValueForKeyPath: (NSString *) keyPath
		      ofObject: (id) object
		        change: (NSDictionary *) change
		       context: (void *) context
{
	(void) change ; (void) context ;
	
	printf("objeserve: keypath=%s ", [keyPath UTF8String]) ;
	
	KGGameStatus * status = object ;
	printf("-> current status = %u, max glyph num = %u, processed glyph no = %u",
	       status.state, status.maxGlyphNum, status.processedGlyphNum) ;
	
	fputc('\n', stdout) ;
}

@end

BOOL
UTGameStatus(void)
{
	KGGameStatus *	status = [[KGGameStatus alloc] init] ;
	UTObserver *	observer = [[UTObserver alloc] init] ;
	
	[status addStateObserver: observer] ;
	status.maxGlyphNum		= 3 ;
	status.processedGlyphNum	= 1 ;
	status.state			= KGDisplayQuestionState ;
	
	status.maxGlyphNum		= 3 ;
	status.processedGlyphNum	= 2 ;
	status.state			= KGDisplayQuestionState ;
	
	return YES ;
}
