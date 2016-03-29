//
//  PhotoView.h
//  PhotoListView
//
//  Created by Wang Shuguang on 12-1-3.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#import "Thumbnail.h"

@protocol PhotoViewDelegate;

@interface PhotoView : UIView<SDWebImageManagerDelegate> {
	NSString *imgUrl;
	NSString *newImgUrl;
	UIImage *defaultImg;
	id delegate;
	UIImageView *imageView;
	SDWebImageManager *manager;
	UIActivityIndicatorView *aiv;
}
@property (nonatomic,retain) UIImage *defaultImg;
@property (nonatomic,assign) id<PhotoViewDelegate> delegate;

//构造函数
-(id) initWithFrame:(CGRect)frame imgUrl:(NSString *)theUrl;
//处理图像
-(void) dealWithImage:(UIImage *)image;
-(void) reloadData;
-(void) updateUrl:(NSString *)newUrl;
@end

@protocol PhotoViewDelegate

-(void) touchWithPhoto:(UIImageView *)image;

@end

