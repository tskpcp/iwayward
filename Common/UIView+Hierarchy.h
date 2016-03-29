//
//  UIView+Hierarchy.h
//  Dyrs
//
//  Created by Wang Shuguang on 11-12-24.
//  Copyright 2011 Jinher Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIView (Hierarchy)
-(int) getSubviewIndex;
-(void) bringToFront;
-(void) sentToBack;
-(void) bringOneLeaveUp;
-(void) bringOneLeaveDown;
-(BOOL) isInFront;
-(BOOL) isAtBack;
-(void) swapDepthsWithView:(UIView *) swapView;
@end

