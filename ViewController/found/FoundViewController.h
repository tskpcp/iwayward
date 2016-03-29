//
//  FoundViewController.h
//  iwayward
//
//  Created by caopeng on 15/3/15.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "CommonHelper.h"

#import "XHYScrollingNavBarViewController.h"
#import "NewsViewController.h"
#import "ContactViewController.h"
#import "PersonalViewController.h"
#import "FoundViewController.h"
#import "ServicesViewController.h"

@protocol TSKPCPTabBarDelegate <NSObject>

-(void)touchBtnAtIndex:(NSInteger)index;

@end

@class TSKPCPTabBarView;
@interface FoundViewController : UIViewController<TSKPCPTabBarDelegate>
@property(nonatomic,strong) TSKPCPTabBarView *tabbar;
@property(nonatomic,strong) NSArray *arrayViewcontrollers;

-(void)initUILayout;



@end
