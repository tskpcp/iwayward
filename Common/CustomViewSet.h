//
//  CustomViewSet.h
//  JCS
//
//  Created by haunghe on 12-3-5.
//  Copyright (c) 2012年 huanghe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "PhotoView.h"
#import "UIView+ModalAnimation.h"


@protocol CustomViewSetDelegate;
@interface CustomViewSet : NSObject {
	NSInteger maskgrayTag;
}


//定制导航栏文字
-(UILabel *) navigationTitle:(NSString *)titleStr;
//显示loading
-(void) startLoading:(UIView *)view title:(NSString *)title;
//隐藏loading
-(void) stopLoading:(UIView *)view;
//警告提示框
-(void) showAlert:(NSString *)title message:(NSString *)msg;
//图片展示
-(PhotoView *) startShowPhotoFromPoint:(CGPoint)center size:(CGSize)size withUrl:(NSString *)theUrl;
-(void) stopShowPhoto;
- (void) disableScrollsToTopPropertyOnAllSubviewsOf:(UIView *)view;
//播放声音
-(void) playLoadedWithShake:(BOOL)shake; 
//震动
-(void) playShake;
@end
