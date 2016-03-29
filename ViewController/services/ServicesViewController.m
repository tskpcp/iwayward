//
//  ServicesViewController.m
//  iwayward
//
//  Created by caopeng on 15/3/14.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "ServicesViewController.h"
#import "TSKPCPTabBarView.h"
@interface ServicesViewController ()

@end

@implementation ServicesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=VIEW_BG_COLOR;
    self.title=@"任性－服务";
    self.navigationItem.hidesBackButton=YES;
    [self initUILayout];
    
}

-(void)initUILayout{
    CGFloat orginHeight = self.view.frame.size.height- 60;
    if (iPhone5) {
        orginHeight = self.view.frame.size.height- 60 + addHeight;
    }
    [CommonHelper SetValueConfigFile:@"config" fileSetObject:@"0" fileForKey:@"tabbarIndex"];
   
    _tabbar = [[TSKPCPTabBarView alloc]initWithFrame:CGRectMake(0,orginHeight,self.view.bounds.size.width, 60)];
    
    _tabbar.delegate = self;
    [self.view addSubview:_tabbar];
    
    [self touchBtnAtIndex:0];
    
    RecruitmentTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 65, self.view.bounds.size.width, 40)];
    RecruitmentTableView.backgroundColor=[UIColor whiteColor];
    RecruitmentTableView.tag=1;

    RecruitmentTableView.layer.masksToBounds = YES;
    RecruitmentTableView.layer.borderColor =LINE_COLOR;
    RecruitmentTableView.scrollEnabled=NO;
    [RecruitmentTableView setDelegate:self];
    [RecruitmentTableView setDataSource:self];
    [self.view addSubview:RecruitmentTableView];
    
    UILabel *lblline0=[[UILabel alloc]initWithFrame:CGRectMake(0, RecruitmentTableView.frame.origin.y+RecruitmentTableView.frame.size.height, self.view.bounds.size.width, 1)];
    lblline0.layer.borderWidth = 1;
    lblline0.layer.borderColor = LINE_COLOR;
    lblline0.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline0];
    CandidatesTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, lblline0.frame.size.height+lblline0.frame.origin.y, self.view.bounds.size.width, 40)];
    CandidatesTableView.backgroundColor=[UIColor whiteColor];
    CandidatesTableView.tag=2;

    CandidatesTableView.layer.masksToBounds = YES;
    CandidatesTableView.layer.borderColor =LINE_COLOR;
    CandidatesTableView.scrollEnabled=NO;
    [CandidatesTableView setDelegate:self];
    [CandidatesTableView setDataSource:self];
    [self.view addSubview:CandidatesTableView];
    UILabel *lblline1=[[UILabel alloc]initWithFrame:CGRectMake(0, CandidatesTableView.frame.origin.y+CandidatesTableView.frame.size.height, self.view.bounds.size.width, 1)];
    lblline1.layer.borderWidth = 1;
    lblline1.layer.borderColor = LINE_COLOR;
    lblline1.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline1];
    
}
-(void)touchBtnAtIndex:(NSInteger)index
{
    NSLog(@"index=%li",(long)index);
    switch (index) {
            //服务
        case 0:{
            
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
            
            // [self presentViewController:personal animated:YES completion:nil];
            
        }
            
            break;
            
        default:
            break;
    }
    
}
#pragma mark -
#pragma mark Table View Data Source mathods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 45;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *tableViewIdentifier = @"tableViewIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:tableViewIdentifier];
        

        
        UIImageView *imageRight=[[UIImageView alloc]initWithFrame:CGRectMake(tableView.frame.size.width-40,10, 25, 25)];
        imageRight.tag=4;
        [cell.contentView addSubview:imageRight];
        
        UILabel *vlabel=[[UILabel alloc]initWithFrame:CGRectMake(5, 5, 300, 25)];
        vlabel.font=[UIFont boldSystemFontOfSize:20];
        vlabel.tag=1;
        vlabel.backgroundColor=[UIColor clearColor];
        [cell.contentView addSubview:vlabel];
        
        
        
        
    }
   

    switch (tableView.tag) {
        case 1:
        {
            UIImageView *imageRightValue = (UIImageView *)[cell.contentView viewWithTag:4];
            [imageRightValue setImage:[UIImage imageNamed:@"u51"]];
            
            UILabel *vlabel=(UILabel *)[cell.contentView viewWithTag:1];
            
            vlabel.text=@"招聘";
            break;
        }
        case 2:
        {
           
            UIImageView *imageRightValue = (UIImageView *)[cell.contentView viewWithTag:4];
            [imageRightValue setImage:[UIImage imageNamed:@"u51"]];
            
            UILabel *vlabel=(UILabel *)[cell.contentView viewWithTag:1];
            
            vlabel.text=@"应聘";
            break;
        }
            
        default:
            break;
    }
    
    //添加图片
    
    return cell;
}
#pragma mark -
#pragma mark Table View Delegate Methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (tableView.tag) {
        case 1:
            
            break;
        case 2:
            
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
