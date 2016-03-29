//
//  UIView+ModalAnimation.m
//  Dyrs
//
//  Created by jinher-cppg on 11-12-26.
//  Copyright 2011 Jinher Software. All rights reserved.
//

#import "UIView+ModalAnimation.h"

@implementation UIViewModalAnimationDelegate

-(id) initWithRunLoop:(CFRunLoopRef)runLoop{
	if (self==[super init]) {
		currentLoop = runLoop;
		
	}
	return self;
}

-(void) animationFinished:(id)sender{
	CFRunLoopStop(currentLoop);
}

@end

@implementation UIView (ModalAnimation)



+(void) commitModalAnimations{
	CFRunLoopRef currentLoop = CFRunLoopGetCurrent();
	UIViewModalAnimationDelegate *viewDelegate = [[UIViewModalAnimationDelegate alloc] initWithRunLoop:currentLoop];
	[UIView setAnimationDelegate:viewDelegate];
	[UIView setAnimationDidStopSelector:@selector(animationFinished:)];
	[UIView commitAnimations];
	CFRunLoopRun();
	[viewDelegate release];
}

@end

