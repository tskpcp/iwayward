//
//  SchoolAwardsViewController.m
//  iwayward
//
//  Created by caopeng on 15/3/29.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "SchoolAwardsViewController.h"

@interface SchoolAwardsViewController ()

@end

@implementation SchoolAwardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=VIEW_BG_COLOR;
    self.title=@"在校奖励情况";
    UIBarButtonItem *retuButton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    self.navigationItem.rightBarButtonItem=retuButton;
    
    [self initUILayout];

}
-(void)initUILayout{}
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
