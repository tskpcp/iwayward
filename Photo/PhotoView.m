//
//  PhotoView.m
//  PhotoListView
//
//  Created by Wang Shuguang on 12-1-3.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "PhotoView.h"


@implementation PhotoView

@synthesize defaultImg;
@synthesize delegate;

#pragma mark -
#pragma mark 构造函数
-(id) initWithFrame:(CGRect)frame imgUrl:(NSString *)theUrl{
	if (self = [super initWithFrame:frame]) {
		//图片按钮
		imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
		imageView.userInteractionEnabled = YES;
		UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageButtonClick:)];
		[imageView addGestureRecognizer:singleTap];
		[singleTap release];
		[self addSubview:imageView];
		[imageView release];
		imgUrl = theUrl;
		newImgUrl = nil;
		
	}
	return self;
}
-(id) initWithFrame:(CGRect)frame{
	if (self = [super initWithFrame:frame]) {
		imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
		imageView.userInteractionEnabled = YES;
		[self addSubview:imageView];
		[imageView release];
		imgUrl = @"";
		newImgUrl = nil;
		
		//loading
	}
	return self;
}

-(void) reloadData{
	
	//添加默认背景图片
	if (self.defaultImg) {
		imageView.image = defaultImg;
	}else {
		imageView.image = nil;
	}
	
	//NSLog(@"%@",imgUrl);
	
	manager = [SDWebImageManager sharedManager];
	UIImage *cachedImage = [manager imageWithURL:[NSURL  URLWithString:newImgUrl ]];
	if (cachedImage)
	{
		// Use the cached image immediatly
		[self dealWithImage:cachedImage];
	}
	else
	{
		[manager cancelForDelegate:self];
		[manager downloadWithURL:[NSURL URLWithString:imgUrl] delegate:self];
	}	
}

-(void) updateUrl:(NSString *)newUrl{
	newImgUrl = newUrl;
	imgUrl = newUrl;
}


#pragma mark -
#pragma mark 图像处理
-(void) dealWithImage:(UIImage *)image{
	//生成规定尺寸的所略图
	UIImage *newImage = [Thumbnail image:image fitInSize:self.frame.size];
	
	//图片按钮
	
	imageView.image = newImage;
	CGRect frame = imageView.frame;
	frame.size.width  = newImage.size.width;
	frame.size.height = newImage.size.height;
	imageView.frame = frame;
	imageView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
	
}

//点击图片按钮时触发发
-(void) imageButtonClick:(UIGestureRecognizer *)gestureRecognizer{
	if ([delegate respondsToSelector:@selector(touchWithPhoto:)]) {
		[delegate touchWithPhoto:(UIImageView *)gestureRecognizer.view];
	}
}

#pragma mark -
#pragma mark SDWebImageManagerDelegate
//图片下载成功
- (void)webImageManager:(SDWebImageManager *)imageManager didFinishWithImage:(UIImage *)image{
	
	[self dealWithImage:image];
}

//图片下载失败
-(void) webImageManager:(SDWebImageManager *)imageManager didFailWithError:(NSError *)error{
	
}


#pragma mark -
#pragma mark 内存回收
-(void) dealloc{
	if (defaultImg) {
		[defaultImg release];
		defaultImg = nil;
	}
	delegate = nil;
	imageView = nil;
	manager = nil;
	imgUrl = nil;
	newImgUrl = nil;
	
	
	[super dealloc];
}
@end
