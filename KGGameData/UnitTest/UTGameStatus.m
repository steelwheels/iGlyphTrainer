/**
 * @file	UTHackProgress
 * @brief	Unit test for KGHackProgress class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "UnitTest.h"

static void
printStatus(KGGameStatus * status) ;

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
	printStatus(status) ;
}

@end

BOOL
UTGameStatus(void)
{
	KGGameStatus *	status = [[KGGameStatus alloc] init] ;
	UTObserver *	observer = [[UTObserver alloc] init] ;
	
	[status addStateObserver: observer] ;
	status.currentTime		= 1.0 ;
	status.timerInterval		= 1.0 ;
	status.state			= KGDisplayQuestionState ;
	
	status.currentGlyphIndex	= 2 ;
	status.currentTime		= 2.0 ;
	status.timerInterval		= 2.0 ;
	status.state			= KGInputAnswerState ;
	
	return YES ;
}

static void
printStatus(KGGameStatus * status)
{
	printf("state = {state:%u, index:%u, time:%lf, interval:%lf}\n",
	       status.state,
	       status.currentGlyphIndex,
	       status.currentTime,
	       status.timerInterval) ;
}

