//
//  PersonalSettingViewController.h
//  iwayward
//
//  Created by caopeng on 15/3/29.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "Toast+UIView.h"
@interface PersonalSettingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
   UITableView *tempTbleView;
   UITableView *SetUpTableView;
   NSMutableArray *SettingArray;
}
-(void)initUILayout;
-(void)btnClick:(UIButton *)sender;
@end
