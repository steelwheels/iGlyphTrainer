/**
 * @file	KGameProgress.h
 * @brief	Define KGameProgress class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 */

#import <Foundation/Foundation.h>

typedef enum {
	KGIdleStatus,
	KGPresentationStatus,
	KGStrokeSequence,
	KGDisplayResultSequence
} KGGameStatus ;

@interface KGGameProgress : NSObject
@property (assign, nonatomic) KGGameStatus	gameStatus ;

- (instancetype) init ;
- (void) addStatusObserver: (NSObject *) observer ;

@end
