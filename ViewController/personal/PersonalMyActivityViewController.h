//
//  PersonalMyActivityViewController.h
//  iwayward
//
//  Created by caopeng on 15/3/29.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
@interface PersonalMyActivityViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    UITableView *tempTbleView;
    //招聘职位
    UITableView *RecruitmentTableView;
    //求职记录
    UITableView *CandidatesTableView;

}
-(void)initUILayout;
@end
