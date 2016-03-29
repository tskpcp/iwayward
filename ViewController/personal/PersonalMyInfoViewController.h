//
//  PersonalMyInfoViewController.h
//  iwayward
//
//  Created by caopeng on 15/3/29.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "PersonalInfoViewController.h"
#import "JobSearchIntentionViewController.h"
#import "PersonalProfileViewController.h"
#import "JobPracticeViewController.h"
#import "SchoolAwardsViewController.h"
#import "MyExperienceViewController.h"
#import "ProjectExperienceViewController.h"
#import "StudyExperienceViewController.h"
@interface PersonalMyInfoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
     UITableView *tempTbleView;
    //我的信息
    UITableView *MyInformation;
    //我的需求
    UITableView *JobSearchIntention;
    //个人简介
    UITableView *PersonalProfile;
    //教育经历
    UITableView *StudyExperience;
    //我的经历
    UITableView *MyExperience;
    //项目经验
    UITableView *ProjectExperience;
}
-(void)initUILayout;
-(void)btnClick:(UIButton *)sender;
@end
