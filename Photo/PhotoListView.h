//
//  PhotoListView.h
//  Dyrs
//
//  Created by jinher-cppg on 11-12-29.
//  Copyright 2011 Jinher Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Thumbnail.h"
#import "PhotoView.h"



@protocol PhotoListViewDataSource;
@protocol PhotoListViewDelegate;

@interface PhotoListView : UIScrollView {
	CGSize imageSize;
	NSInteger spaceBetweenImage;
	id dataSource;
	id selDelegate;
	UIView *containerView;
}

@property (nonatomic) CGSize imageSize;
@property (nonatomic) NSInteger spaceBetweenImage;
@property (nonatomic,assign) id<PhotoListViewDataSource> dataSource;
@property (nonatomic,assign) id<PhotoListViewDelegate> selDelegate;
-(void) reloadData;
@end

@protocol PhotoListViewDataSource
-(NSInteger) numberOfImageInCustomImageList;
-(NSString *) imageAtCustomIndex:(NSInteger)index;
@end

@protocol PhotoListViewDelegate
-(void) didSelectImageAtIndex:(NSInteger)index;
@end
