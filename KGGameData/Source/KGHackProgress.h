/**
 * @file	KGHackProgress.h
 * @brief	Define KGHackProgress class
 * @par Copyright
 *   Copyright (C) 2015 Steel Wheels Project
 * @par Reference
 *   http://d.hatena.ne.jp/unk_pizza/20130325/p1
 */

#import <Coconut/Coconut.h>

#define KGLimitProgressCount			5

@interface KGHackProgress : CNNotifierObject

@property (assign, nonatomic) unsigned int	maxProgress ;
@property (assign, nonatomic) unsigned int	currentProgress ;

- (instancetype) initWithMaxProgress: (unsigned int) val ;
- (void) addCurrentProgressObserver: (NSObject *) observer ;

@end
