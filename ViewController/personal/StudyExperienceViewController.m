//
//  StudyExperienceViewController.m
//  iwayward
//
//  Created by caopeng on 15/4/15.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "StudyExperienceViewController.h"

@interface StudyExperienceViewController ()

@end

@implementation StudyExperienceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=VIEW_BG_COLOR;
    self.title=@"学习经历";
    UIBarButtonItem *retuButton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(projectExperienceAdd:)];
    self.navigationItem.rightBarButtonItem=retuButton;
    
    [self initUILayout];
}
-(void)initUILayout{}
-(void)projectExperienceAdd:(UIBarButtonItem *)sender{
    UIBarButtonItem *ProjectExperienceViewAddbarBtn=[[UIBarButtonItem alloc]init];
    ProjectExperienceViewAddbarBtn.title=@"返回";
    self.navigationItem.backBarButtonItem=ProjectExperienceViewAddbarBtn;
    StudyExperienceAddViewController *ProjectExperienceView=[[StudyExperienceAddViewController alloc]init];
    [self.navigationController pushViewController:ProjectExperienceView animated:YES];
    
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
