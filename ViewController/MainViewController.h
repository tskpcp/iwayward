//
//  MainViewController.h
//  iwayward
//
//  Created by caopeng on 15/3/7.
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

#import "DBHelperController.h"

@protocol TSKPCPTabBarDelegate <NSObject>

-(void)touchBtnAtIndex:(NSInteger)index;

@end

@class TSKPCPTabBarView;
@interface MainViewController : UIViewController<TSKPCPTabBarDelegate,UITableViewDataSource,UITableViewDelegate>{
    //招聘
    UITableView *RecruitmentTableView;
    //应聘
    UITableView *CandidatesTableView;
    
}
@property(nonatomic,strong) TSKPCPTabBarView *tabbar;
@property(nonatomic,strong) NSArray *arrayViewcontrollers;

-(void)initUILayout;
-(void)initDataSource;
@end
