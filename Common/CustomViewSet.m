//
//  CustomViewSet.m
//  JCS
//
//  Created by haunghe on 12-3-5.
//  Copyright (c) 2012年 huanghe. All rights reserved.
//

#import "CustomViewSet.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AudioToolbox/AudioToolbox.h>

@implementation CustomViewSet

-(id) init{
	if (self = [super init]) {
		maskgrayTag = 1001;
	}
	return self;
}

//设置导航条标题样式
-(UILabel *) navigationTitle:(NSString *)titleStr{	
	CGRect rect = CGRectMake(0, 0, 300, 44);
	UILabel *title = [[UILabel alloc] initWithFrame:rect];
	title.text = titleStr;
	title.textColor = [UIColor colorWithRed:0.4156	green:0.4313 blue:0.2627 alpha:1.0];
	title.backgroundColor =[UIColor clearColor];
	title.textAlignment = UITextAlignmentCenter;
	title.center = CGPointMake(160,22);
	UIFont *myFont=[UIFont fontWithName:@"Helvetica-Bold" size:18];
	title.font = myFont;
	return [title autorelease];
}


//显示loading
-(void) startLoading:(UIView *)theView title:(NSString *)title{
	UIView *view = [[[UIApplication sharedApplication] windows]objectAtIndex:0];
	//蒙版
	UIView *mask = [[UIView alloc] initWithFrame:view.frame];
	mask.backgroundColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.0];
	mask.tag = LOADING_MASK_VIEWTAG;
	mask.userInteractionEnabled = YES;
	
	//灰色底层
	UIView *maskgray = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 110, 40)];
	maskgray.tag = maskgrayTag;
	maskgray.alpha = 0.0;
	maskgray.center = CGPointMake(mask.frame.size.width/2, mask.frame.size.height/2);
	maskgray.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.8];
	CALayer *layer = [maskgray layer];
	[layer setCornerRadius:6.0f];
	[mask addSubview:maskgray];
	[maskgray release];
    
	//计算Loading图标和文字的大小和位置
	UIFont *font = [UIFont fontWithName:@"Helvetica" size:14];
	CGSize size = [title sizeWithFont:font];
	CGRect iconRect = CGRectMake((view.frame.size.width - size.width - 20)/2, (view.frame.size.height - 20)/2 + 2, 14, 14);
	CGRect titleRect = CGRectMake((view.frame.size.width - size.width - 20)/2 + 20, (view.frame.size.height - 20)/2 + 2, size.width, 14);
	
	//loading图标
	UIActivityIndicatorView *aiv = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
	aiv.frame = iconRect;
	[aiv startAnimating];
	[mask addSubview:aiv];
	[aiv release];
	
	//title
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
	label.text = title;
	label.textColor =[UIColor whiteColor]; //[UIColor colorWithRed:1 green:0.3 blue:0.3 alpha:0.8];
	label.frame = titleRect;
	label.backgroundColor = [UIColor clearColor];
	label.font = font;
	[mask addSubview:label];
	[label release];
	
	[view addSubview:mask];
	[mask release];
	
	//动画
	CGAffineTransform currentTransform = maskgray.transform;
	CGAffineTransform scallTransform = CGAffineTransformScale(currentTransform, 2.0f, 2.0f);
	[maskgray setTransform:scallTransform];
	
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	[UIView beginAnimations:nil context:context];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	[UIView setAnimationDuration:0.2];	
	[maskgray setTransform:currentTransform];
	maskgray.alpha = 1.0f;
	[UIView commitModalAnimations];
}

//隐藏loading
-(void) stopLoading:(UIView *)theView{
	UIView *view = [[[UIApplication sharedApplication] windows]objectAtIndex:0];
	UIView *vi = [view viewWithTag:LOADING_MASK_VIEWTAG];
    
	UIView *maskgray = [vi viewWithTag:maskgrayTag];
    
	CGAffineTransform currentTransform = maskgray.transform;
	CGAffineTransform scallTransform = CGAffineTransformScale(currentTransform, 0.8f, 0.8f);
	
	
	[UIView beginAnimations:nil context:UIGraphicsGetCurrentContext()];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	[UIView setAnimationDuration:0.4];	
	[maskgray setTransform:scallTransform];
	[UIView commitModalAnimations];
    
	
	scallTransform = CGAffineTransformScale(currentTransform, 2.0, 2.0);
	[UIView beginAnimations:nil context:UIGraphicsGetCurrentContext()];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	[UIView setAnimationDuration:0.2];	
	[maskgray setTransform:scallTransform];
	maskgray.alpha = 0.0;
	[UIView commitModalAnimations];
    
	[vi removeFromSuperview];
}
//显示警告框
-(void) showAlert:(NSString *)title message:(NSString *)msg{
	UIAlertView *av = [[[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:NSLocalizedString(@"OK",@"") otherButtonTitles:nil] autorelease];
	[av show];
}

//蒙版图片展示
-(PhotoView *) startShowPhotoFromPoint:(CGPoint)center size:(CGSize)size withUrl:(NSString *)theUrl{
	UIView *window = [[[UIApplication sharedApplication] windows]objectAtIndex:0];
	
	//蒙版
	UIView *maskPhoto= [[UIView alloc] initWithFrame:CGRectMake(0, 20, 320, 460)];
	maskPhoto.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.5];
	maskPhoto.tag = 99;
	maskPhoto.userInteractionEnabled = YES;
	
	UIView *photoBg =[[UIView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
	[maskPhoto addSubview:photoBg];
	photoBg.backgroundColor = [UIColor clearColor];
	photoBg.clipsToBounds = YES;
	photoBg.alpha = 1.0;
	[photoBg release];
	
	PhotoView *photoView = [[PhotoView alloc]initWithFrame:CGRectMake(0, 0, 280, 360) imgUrl:theUrl];
	[photoBg addSubview:photoView];
	[photoView release];
	[photoView reloadData];
	
	
	[window addSubview:maskPhoto];
	[maskPhoto release];
	
	center.y = center.y - 20;
	photoBg.center = center;
	
	//移除此view
	CGContextRef context = UIGraphicsGetCurrentContext();
	[UIView beginAnimations:nil context:context];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:0.3];
	photoBg.frame = CGRectMake(maskPhoto.center.x-photoView.frame.size.width/2, maskPhoto.center.y-photoView.frame.size.height/2, photoView.frame.size.width, photoView.frame.size.height);
	[UIView commitModalAnimations];	
	return photoView;
}

//停止图片展示
-(void) stopShowPhoto{
	UIView *window = [[[UIApplication sharedApplication] windows]objectAtIndex:0];
	UIView *vi = [window viewWithTag:99];
	[vi removeFromSuperview];
}

//禁用所有的scrollToTop
- (void) disableScrollsToTopPropertyOnAllSubviewsOf:(UIView *)view {
    for (UIView *subview in view.subviews) {
        if ([subview isKindOfClass:[UIScrollView class]]) {
            ((UIScrollView *)subview).scrollsToTop = NO;
        }
        [self disableScrollsToTopPropertyOnAllSubviewsOf:subview];
    }
}

//列表加载结束声音
-(void) playLoadedWithShake:(BOOL)shake{
	SystemSoundID mySound;
	NSString *sndPath = [[NSBundle mainBundle] pathForResource:@"loaded" ofType:@"wav"];
	CFURLRef baseURL = (CFURLRef)[NSURL fileURLWithPath:sndPath];
	AudioServicesCreateSystemSoundID(baseURL, &mySound);
	if ([MPMusicPlayerController iPodMusicPlayer].playbackState == MPMusicPlaybackStatePlaying) {
		AudioServicesPlayAlertSound(mySound);
	}else {
		if (shake) {
			AudioServicesPlayAlertSound(mySound);
		}else{
			AudioServicesPlaySystemSound(mySound);
		}
	}
	if (mySound) {
        
	}
}

//震动
-(void) playShake{
	AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

-(void) dealloc{
	
	[super dealloc];
}

@end
