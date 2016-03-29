//
//  PhotoListView.m
//  Dyrs
//
//  Created by jinher-cppg on 11-12-29.
//  Copyright 2011 Jinher Software. All rights reserved.
//

#import "PhotoListView.h"


@implementation PhotoListView
@synthesize imageSize;
@synthesize selDelegate;
@synthesize dataSource;
@synthesize spaceBetweenImage;

-(id) initWithFrame:(CGRect)rect{
	if (self = [super initWithFrame:rect]) {
		//super.delegate = self.delegate;
		
		if (self.contentSize.height<self.frame.size.height) {
			[self setContentSize:CGSizeMake(320, self.frame.size.height + 1)];
		}
		self.backgroundColor = [UIColor whiteColor];
		return self;
	}
	return self;
}

-(void) reloadData{
	
	[containerView removeFromSuperview];
	containerView = nil;
	containerView = [[UIView alloc] initWithFrame:self.frame];
	[self addSubview:containerView];
	[containerView release];
	
	//计算横向可排列的图片数量 sectionNum
	CGSize frameSize = self.frame.size; 
	NSInteger sectionNum = (frameSize.width - spaceBetweenImage)/(imageSize.width + spaceBetweenImage);
	
	//图片数量
	NSInteger imageNum = 0;
	if ([dataSource respondsToSelector:@selector(numberOfImageInCustomImageList)]) {
		imageNum = [dataSource numberOfImageInCustomImageList];
	}
	NSInteger cheight = imageNum/sectionNum + (imageNum%sectionNum==0?0:1);
	[self setContentSize:CGSizeMake(self.frame.size.width, (cheight + 1)*spaceBetweenImage + cheight * imageSize.height)];
	
	if (self.contentSize.height<self.frame.size.height) {
		[self setContentSize:CGSizeMake(320, self.frame.size.height + 10)];
	}
	
	for (int i = 0;i<imageNum;i+=sectionNum) {
		for (int j = 0; j < sectionNum && (i+j)< imageNum; j++) {	
			PhotoView *photoView;
			NSString *imgPath;
			if ([dataSource respondsToSelector:@selector(imageAtCustomIndex:)]) {
				imgPath = [dataSource imageAtCustomIndex:(i+j)];
			}
			if (!imgPath) {
				return;
			}
			
			//dawn:记得注释掉
			//imgPath = @"http://www.cnupc.net/edu/uploadpic/2009-6/200961143415100.jpg";
						
			NSInteger x = (j + 1) * spaceBetweenImage + j * imageSize.width;
			NSInteger sectionIndex = i / sectionNum;
			NSInteger y = (sectionIndex + 1) * spaceBetweenImage + sectionIndex * imageSize.height;			
			photoView = [[PhotoView alloc] initWithFrame:CGRectMake(x, y, imageSize.width, imageSize.height) imgUrl:imgPath];
			

			
			
			//添加边框
			CALayer *layer = [photoView layer];
			layer.borderColor = [[UIColor whiteColor] CGColor];
			layer.borderWidth = 4.0f;
			
			//添加阴影
			
			photoView.layer.shadowColor = [UIColor grayColor].CGColor;
			photoView.layer.shadowOffset = CGSizeMake(0,0);
			photoView.layer.shadowOpacity = 0.6;
			photoView.layer.shadowRadius = 4.0;
			
			 
			
			//注册点击事件
			photoView.userInteractionEnabled = YES;
			//UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
			photoView.tag = (i + j);
			//[photoView addGestureRecognizer:singleTap];
			//[singleTap release];
			//photoView.delegate = self;
			
			[containerView addSubview:photoView];
			[photoView release];
		}
	}
}

/*
-(void) handleSingleTap:(UIGestureRecognizer *)gestureRecognizer{
	if ([selDelegate respondsToSelector:@selector(didSelectImageAtIndex:)]) {
		[selDelegate didSelectImageAtIndex:gestureRecognizer.view.tag];
	}
}
 */


#pragma mark -
#pragma mark PhotoViewDelegate
-(void) selectAtIndex:(NSInteger)index{
	if ([selDelegate respondsToSelector:@selector(didSelectImageAtIndex:)]) {
		[selDelegate didSelectImageAtIndex:index];
	}
}

#pragma mark -
#pragma mark 内存回收

-(void) dealloc{
	
	selDelegate = nil;
	dataSource = nil;
	[super dealloc];
}

@end
