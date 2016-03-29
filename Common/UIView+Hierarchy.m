//
//  UIView+Hierarchy.m
//  Dyrs
//
//  Created by Wang Shuguang on 11-12-24.
//  Copyright 2011 Jinher Software. All rights reserved.
//

#import "UIView+Hierarchy.h"
#import <UIKit/UIKit.h>

@implementation UIView(Hierarchy)

#pragma mark -
#pragma mark UIView类的扩充

//获取view所在层级，从上到下依次减少
-(int) getSubviewIndex{
	return ([self.superview.subviews indexOfObject:self]);
}

//将当前层级移到最顶层
-(void) bringToFront{
	[self.superview bringSubviewToFront:self];
}

//将当前层级移动到最底层
-(void) sentToBack{
	[self.superview sendSubviewToBack:self];
}

//将当前层级向上移动一层
-(void) bringOneLeaveUp{
	int currentIndex = [self getSubviewIndex];
	[self.superview exchangeSubviewAtIndex:currentIndex withSubviewAtIndex:currentIndex + 1];
}

//将当前层级向下移动一层
-(void) bringOneLeaveDown{
	int currentIndex = [self getSubviewIndex];
	[self.superview exchangeSubviewAtIndex:currentIndex withSubviewAtIndex:currentIndex - 1];
}

//判断当前层级是否在最顶层
-(BOOL) isInFront{
	return ([self.superview.subviews lastObject] == self);
}

//判断当前层级是否在最底层
-(BOOL) isAtBack{
	return ([self.superview.subviews objectAtIndex:0] == self);
}

//交换两个层级
-(void) swapDepthsWithView:(UIView *) swapView{
	[self.superview exchangeSubviewAtIndex:[self getSubviewIndex] withSubviewAtIndex:[swapView getSubviewIndex]];
}
@end
