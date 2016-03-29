//
//  UIView+ModalAnimation.h
//  Dyrs
//
//  Created by jinher-cppg on 11-12-26.
//  Copyright 2011 Jinher Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView (ModalAnimation) 
+(void) commitModalAnimations;

@end

@interface UIViewModalAnimationDelegate : NSObject
{
	CFRunLoopRef currentLoop;
}
-(id) initWithRunLoop:(CFRunLoopRef) cfRunLoopRef;
@end

