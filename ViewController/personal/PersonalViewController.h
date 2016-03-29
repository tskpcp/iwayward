//
//  PersonalViewController.h
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
#import "PersonalInfoViewController.h"
#import "PersonalMyActivityViewController.h"
#import "PersonalMyInfoViewController.h"
#import "PersonalMyCollectionViewController.h"
#import "PersonalSettingViewController.h"
@protocol TSKPCPTabBarDelegate <NSObject>

-(void)touchBtnAtIndex:(NSInteger)index;
@end
@class TSKPCPTabBarView;
@interface PersonalViewController : UIViewController<TSKPCPTabBarDelegate,UITableViewDataSource,UITableViewDelegate>{
    UITableView *UserInfoTableView;
   
    //我的活动
    UITableView *MyActivitiesTableView;
   
    //我的收藏
    UITableView *MyCollectionTableView;
    //设置
    UITableView *SettingTableView;
    
    UIButton *btnUserInfo;
    UIButton *btnPrivacy;
}
@property(nonatomic,strong) TSKPCPTabBarView *tabbar;
@property(nonatomic,strong) NSArray *arrayViewcontrollers;

-(void)initUILayout;
-(void)btnClick:(UIButton *)sender;


@end
