//
//  FoundViewController.m
//  iwayward
//
//  Created by caopeng on 15/3/15.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "FoundViewController.h"
#import "TSKPCPTabBarView.h"
@interface FoundViewController ()

@end

@implementation FoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=VIEW_BG_COLOR;
    self.title=@"任性－发现";
    self.navigationItem.hidesBackButton=YES;
    [self initUILayout];
}
-(void)initUILayout{
    CGFloat orginHeight = self.view.frame.size.height- 60;
    if (iPhone5) {
        orginHeight = self.view.frame.size.height- 60 + addHeight;
    }
    
    [CommonHelper SetValueConfigFile:@"config" fileSetObject:@"1" fileForKey:@"tabbarIndex"];
    _tabbar = [[TSKPCPTabBarView alloc]initWithFrame:CGRectMake(0,orginHeight,self.view.bounds.size.width, 60)];
    
    _tabbar.delegate = self;
    [self.view addSubview:_tabbar];
    
    [self touchBtnAtIndex:1];
    
    
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
           
        }
            
            break;
            //消息
        case 2:{
            NewsViewController *news=[[NewsViewController alloc]init];
            [self.navigationController pushViewController:news animated:YES];
            
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
