//
//  NewsViewController.m
//  iwayward
//
//  Created by caopeng on 15/3/15.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "NewsViewController.h"
#import "TSKPCPTabBarView.h"
@interface NewsViewController ()

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=VIEW_BG_COLOR;
    self.title=@"任性－消息";
    self.navigationItem.hidesBackButton=YES;

   [self initUILayout];
}
-(void)initUILayout{
    CGFloat orginHeight = self.view.frame.size.height- 60;
    if (iPhone5) {
        orginHeight = self.view.frame.size.height- 60 + addHeight;
    }
    
    [CommonHelper SetValueConfigFile:@"config" fileSetObject:@"2" fileForKey:@"tabbarIndex"];
    _tabbar = [[TSKPCPTabBarView alloc]initWithFrame:CGRectMake(0,orginHeight,self.view.bounds.size.width, 60)];
    
    _tabbar.delegate = self;
    [self.view addSubview:_tabbar];
    
    [self touchBtnAtIndex:2];
    
    
}
-(void)touchBtnAtIndex:(NSInteger)index
{
    NSLog(@"index=%li",(long)index);
    switch (index) {
            //服务
        case 0:{
            ServicesViewController *service=[[ServicesViewController alloc]init];
            [self.navigationController pushViewController:service animated:YES];
        }
            
            break;
            //发现
        case 1:{
            FoundViewController *found=[[FoundViewController alloc]init];
            [self.navigationController pushViewController:found animated:YES];
        }
            
            break;
            //消息
        case 2:{
            
            
        }
            
            break;
            //联系人
        case 3:{
            ContactViewController *conteact=[[ContactViewController alloc]init];
            [self.navigationController pushViewController:conteact animated:YES];
            
        }
            
            break;
            //个人
        case 4:{
            PersonalViewController *personal=[[PersonalViewController alloc]init];
            [self.navigationController pushViewController:personal animated:YES ];
        }
            
            break;
            
        default:
            break;
    }
    
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
