/**
 * @file	KGTimerLabel.m
 * @brief	Define KGTimerLabel class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import "KGTimerLabel.h"
#import <KGGameData/KGGameData.h>

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

- (void) observeValueForKeyPath:(NSString *) keyPath ofObject:(id) object change:(NSDictionary *) change context:(void *) context
{
	(void) change ; (void) context ;
	if([object isKindOfClass: [KGGameStatus class]]){
		if([keyPath isEqualToString: [KGGameStatus stateKeyPath]]){
			KGGameStatus * status = object ;
			switch(status.state){
				case KGIdleState:
				case KGDisplayQuestionState:
				case KGEvaluateState: {
					[self clearTimerLabel] ;
				} break ;
				case KGInputAnswerState: {
					double curtime = status.currentTime ;
					if(curtime != KGNoValidTime){
						[self setTimerLabel: curtime] ;
					} else {
						[self clearTimerLabel] ;
					}
				} break ;
			}
		}
	}
}

@end
