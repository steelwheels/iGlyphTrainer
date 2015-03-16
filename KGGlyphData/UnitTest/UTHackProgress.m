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
	printf("objeserve: keypath=%s ", [keyPath UTF8String]) ;
	
	KGHackProgress * progress = object ;
	printf("-> current progress = %u, max progress = %u", progress.currentProgress, progress.maxProgress) ;
	
	fputc('\n', stdout) ;
}

@end

BOOL
UTHackProgress(void)
{
	KGHackProgress *	progress = [[KGHackProgress alloc] initWithMaxProgress: 5] ;
	UTObserver *		observer = [[UTObserver alloc] init] ;
	
	[progress addCurrentProgressObserver: observer] ;
	progress.currentProgress = 1 ;
	progress.currentProgress = 2 ;
	
	progress.maxProgress = 1 ;
	progress.maxProgress = 2 ;
	
	return YES ;
}
