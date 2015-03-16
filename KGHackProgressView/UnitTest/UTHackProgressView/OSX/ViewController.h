//
//  ViewController.h
//  UTHackProgressView
//
//  Created by Tomoo Hamada on 2015/03/17.
//  Copyright (c) 2015年 Steel Wheels Project. All rights reserved.
//

#import <KGHackProgressView/KGHackProgressView.h>
#import <Cocoa/Cocoa.h>


@interface ViewController : NSViewController
{
	KGHackProgress *	hackProgress ;
}

@property (weak) IBOutlet KGHackProgressView *progressView;

@end

