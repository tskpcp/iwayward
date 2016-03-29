//
//  ProjectExperienceViewController.m
//  iwayward
//
//  Created by caopeng on 15/3/29.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "ProjectExperienceViewController.h"

@interface ProjectExperienceViewController ()

@end

@implementation ProjectExperienceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=VIEW_BG_COLOR;
    self.title=@"项目经验";
    UIBarButtonItem *retuButton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(projectExperienceAdd:)];
    self.navigationItem.rightBarButtonItem=retuButton;
    [self initUILayout];
}
-(void)initUILayout{}
-(void)projectExperienceAdd:(UIBarButtonItem *)sender{
    UIBarButtonItem *ProjectExperienceViewAddbarBtn=[[UIBarButtonItem alloc]init];
    ProjectExperienceViewAddbarBtn.title=@"返回";
    self.navigationItem.backBarButtonItem=ProjectExperienceViewAddbarBtn;
    ProjectExperienceAddViewController *ProjectExperienceView=[[ProjectExperienceAddViewController alloc]init];
    [self.navigationController pushViewController:ProjectExperienceView animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
