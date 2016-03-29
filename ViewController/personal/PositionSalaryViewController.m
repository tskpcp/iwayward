//
//  PositionSalaryViewController.m
//  iwayward
//
//  Created by caopeng on 15/5/31.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "PositionSalaryViewController.h"

@interface PositionSalaryViewController ()

@end

@implementation PositionSalaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=VIEW_BG_COLOR;
    self.title=@"职位薪金";
    UIBarButtonItem *barBtn=[[UIBarButtonItem alloc]init];
    barBtn.title=@"保存";
    self.navigationItem.rightBarButtonItem=barBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
