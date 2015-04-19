/**
 * @file	KGTimerLabel.m
 * @brief	Define KGTimerLabel class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGTimerLabel.h"

@implementation KGTimerLabel

- (void) setTimerLabel: (double) time
{
	char buf[64] ;
	snprintf(buf, 63, "%2.2lf", time) ;
	buf[63] = '\0' ;
	
	char * bufptr = buf ;
	for( ; *bufptr != '\0' ; bufptr++){
		if(*bufptr == '.'){
			*bufptr = ':' ;
		}
	}
	
	NSString * str = [[NSString alloc] initWithUTF8String: buf] ;
	[self setTitle: str] ;
}

- (void) clearTimerLabel
{
	[self setTitle: @""] ;
}

@end
