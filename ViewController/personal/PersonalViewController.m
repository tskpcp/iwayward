//
//  PersonalViewController.m
//  iwayward
//
//  Created by caopeng on 15/3/15.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "PersonalViewController.h"
#import "TSKPCPTabBarView.h"
@interface PersonalViewController ()

@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=VIEW_BG_COLOR;
    self.title=@"个人中心";
    self.navigationItem.hidesBackButton=YES;
    [self initUILayout];
}
-(void)initUILayout{
    CGFloat orginHeight = self.view.frame.size.height- 60;
    if (iPhone5) {
        orginHeight = self.view.frame.size.height- 60 + addHeight;
    }
    [CommonHelper SetValueConfigFile:@"config" fileSetObject:@"4" fileForKey:@"tabbarIndex"];
    _tabbar = [[TSKPCPTabBarView alloc]initWithFrame:CGRectMake(0,orginHeight,self.view.bounds.size.width, 60)];
    _tabbar.delegate = self;
    [self.view addSubview:_tabbar];
    [self touchBtnAtIndex:4];
    
    UserInfoTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 65, self.view.bounds.size.width,60)];
    UserInfoTableView.backgroundColor=[UIColor whiteColor];
    UserInfoTableView.tag=1;
    UserInfoTableView.scrollEnabled=NO;
    [UserInfoTableView setDelegate:self];
    [UserInfoTableView setDataSource:self];
   
    [self.view addSubview:UserInfoTableView];
    
    btnUserInfo=[[UIButton alloc] initWithFrame:CGRectMake(-1,UserInfoTableView.frame.size.height+UserInfoTableView.frame.origin.y,self.view.frame.size.width/2+1, 35)];
    btnUserInfo.tag=10001;
    [btnUserInfo addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [btnUserInfo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnUserInfo setBackgroundColor:[UIColor whiteColor]];
    [btnUserInfo setTitle:@"编辑资料" forState:UIControlStateNormal];
    btnUserInfo.titleLabel.font=[UIFont systemFontOfSize:14.0];
    btnUserInfo.layer.borderWidth = 1;
    btnUserInfo.layer.cornerRadius = 0;

    btnUserInfo.layer.borderColor =LINE_COLOR;
    btnUserInfo.backgroundColor=[UIColor clearColor];
    [self.view addSubview:btnUserInfo];
    
    btnPrivacy=[[UIButton alloc] initWithFrame:CGRectMake(btnUserInfo.frame.size.width-2,UserInfoTableView.frame.size.height+UserInfoTableView.frame.origin.y,self.view.frame.size.width/2+2, 35)];
    btnPrivacy.tag=10002;
    [btnPrivacy addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [btnPrivacy setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnPrivacy setTitle:@"隐私设置" forState:UIControlStateNormal];
    [btnPrivacy setBackgroundColor:[UIColor whiteColor]];
    btnPrivacy.titleLabel.font=[UIFont systemFontOfSize:14.0];
    btnPrivacy.layer.borderWidth = 1;
    btnPrivacy.layer.cornerRadius = 0;
    
    btnPrivacy.layer.borderColor =LINE_COLOR;
    btnPrivacy.backgroundColor=[UIColor clearColor];
    [self.view addSubview:btnPrivacy];
    
    UIView *viewTemp=[[UIView alloc] initWithFrame:CGRectMake(0, btnUserInfo.frame.origin.y+btnUserInfo.frame.size.height, self.view.frame.size.width, 10)];
    [viewTemp setBackgroundColor:[UIColor colorWithRed:203.0/255.0 green:203.0/255.0 blue:203.0/255.0 alpha:1.0]];
    [self.view addSubview:viewTemp];
    
    
    UILabel *lblline0=[[UILabel alloc]initWithFrame:CGRectMake(0, viewTemp.frame.origin.y+viewTemp.frame.size.height, self.view.bounds.size.width, 1)];
    lblline0.layer.borderWidth = 1;
    lblline0.layer.borderColor = LINE_COLOR;
    lblline0.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline0];

   
    MyActivitiesTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, lblline0.frame.size.height+lblline0.frame.origin.y, self.view.bounds.size.width, 40)];
    MyActivitiesTableView.backgroundColor=[UIColor whiteColor];
    MyActivitiesTableView.tag=3;
    
    MyActivitiesTableView.scrollEnabled=NO;
    [MyActivitiesTableView setDelegate:self];
    [MyActivitiesTableView setDataSource:self];
    [self.view addSubview:MyActivitiesTableView];
    UILabel *lblline2=[[UILabel alloc]initWithFrame:CGRectMake(0, MyActivitiesTableView.frame.origin.y+MyActivitiesTableView.frame.size.height, self.view.bounds.size.width, 1)];
    lblline2.layer.borderWidth = 1;
    lblline2.layer.borderColor = LINE_COLOR;
    lblline2.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline2];
    
        MyCollectionTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, lblline2.frame.size.height+lblline2.frame.origin.y, self.view.bounds.size.width, 40)];
    MyCollectionTableView.backgroundColor=[UIColor whiteColor];
    MyCollectionTableView.tag=5;
    
    MyCollectionTableView.scrollEnabled=NO;
    [MyCollectionTableView setDelegate:self];
    [MyCollectionTableView setDataSource:self];
    [self.view addSubview:MyCollectionTableView];
    UILabel *lblline4=[[UILabel alloc]initWithFrame:CGRectMake(0, MyCollectionTableView.frame.origin.y+MyCollectionTableView.frame.size.height, self.view.bounds.size.width, 1)];
    lblline4.layer.borderWidth = 1;
    lblline4.layer.borderColor = LINE_COLOR;
    lblline4.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline4];
    UIView *viewTemp1=[[UIView alloc] initWithFrame:CGRectMake(0, lblline4.frame.origin.y+lblline4.frame.size.height, self.view.frame.size.width, 10)];
    [viewTemp1 setBackgroundColor:[UIColor colorWithRed:203.0/255.0 green:203.0/255.0 blue:203.0/255.0 alpha:1.0]];
    [self.view addSubview:viewTemp1];
    SettingTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, viewTemp1.frame.size.height+viewTemp1.frame.origin.y, self.view.bounds.size.width, 40)];
    SettingTableView.backgroundColor=[UIColor whiteColor];
    SettingTableView.tag=6;
    SettingTableView.scrollEnabled=NO;
    [SettingTableView setDelegate:self];
    [SettingTableView setDataSource:self];
    [self.view addSubview:SettingTableView];
    UILabel *lblline5=[[UILabel alloc]initWithFrame:CGRectMake(0, SettingTableView.frame.origin.y+SettingTableView.frame.size.height, self.view.bounds.size.width, 1)];
    lblline5.layer.borderWidth = 1;
    lblline5.layer.borderColor = LINE_COLOR;
    lblline5.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline5];

}

-(void)touchBtnAtIndex:(NSInteger)index
{
   
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
    int tableHeiht=0;
    switch (tableView.tag) {
        case 1:
            tableHeiht=65;
            break;
        default:
            tableHeiht=45;
            break;
    }
    return tableHeiht;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *tableViewIdentifier = @"tableViewIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:tableViewIdentifier];
        
       
        switch (tableView.tag) {
            case 1:{
                UILabel *vlabel=[[UILabel alloc]initWithFrame:CGRectMake(60, 5, 300, 25)];
                vlabel.font=[UIFont boldSystemFontOfSize:20];
                vlabel.tag=1;
                vlabel.backgroundColor=[UIColor clearColor];
                [cell.contentView addSubview:vlabel];
                
                
                UILabel *labelValue=[[UILabel alloc]initWithFrame:CGRectMake(135,25, 200, 25)];
                labelValue.font=[UIFont boldSystemFontOfSize:12];
                labelValue.tag=2;
                labelValue.numberOfLines=0;
                labelValue.textColor=[UIColor colorWithRed:168.0/255.0 green:168.0/255.0 blue:168.0/255.0 alpha:1.0];
                labelValue.backgroundColor=[UIColor clearColor];
                [cell.contentView addSubview:labelValue];
                
                UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 50, 50)];
                image.tag=3;
                [cell.contentView addSubview:image];
                
                UIImageView *imageRight=[[UIImageView alloc]initWithFrame:CGRectMake(tableView.frame.size.width-40, 13, 35, 35)];
                imageRight.tag=4;
                [cell.contentView addSubview:imageRight];
                break;
            }
             
            default:
            {
              /*  UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(15, 5, 25, 25)];
                image.tag=5;
                [cell.contentView addSubview:image];
                */
                UIImageView *imageRight=[[UIImageView alloc]initWithFrame:CGRectMake(tableView.frame.size.width-40,10, 25, 25)];
                imageRight.tag=6;
                [cell.contentView addSubview:imageRight];
                
                UILabel *vlabel=[[UILabel alloc]initWithFrame:CGRectMake(5, 5, 300, 25)];
                vlabel.font=[UIFont boldSystemFontOfSize:20];
                vlabel.tag=1;
                vlabel.backgroundColor=[UIColor clearColor];
                [cell.contentView addSubview:vlabel];
            }
                break;
        }
        
       

    }
    
    UIView *backView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView = backView;
    cell.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    
    switch (tableView.tag) {
        case 1:
        {
            UIImageView *imageValue = (UIImageView *)[cell.contentView viewWithTag:3];
            [imageValue setImage:[UIImage imageNamed:@"u126"]];
            
            UIImageView *imageRightValue = (UIImageView *)[cell.contentView viewWithTag:4];
            [imageRightValue setImage:[UIImage imageNamed:@"u51"]];
            
            UILabel *vlabel=(UILabel *)[cell.contentView viewWithTag:1];
            
            vlabel.text=@"我的信息";
            UILabel *labelValue=(UILabel *)[cell.contentView viewWithTag:2];
            labelValue.text=@"已完成10%";

            break;
        }
       case 2:
        {
            /*UIImageView *imageValue = (UIImageView *)[cell.contentView viewWithTag:5];
            [imageValue setImage:[UIImage imageNamed:@"u196"]];
            */
            UIImageView *imageRightValue = (UIImageView *)[cell.contentView viewWithTag:6];
            [imageRightValue setImage:[UIImage imageNamed:@"u51"]];
            
            UILabel *vlabel=(UILabel *)[cell.contentView viewWithTag:1];
            
            vlabel.text=@"我的需求";
            break;
        }
        case 3:
        {
            /*UIImageView *imageValue = (UIImageView *)[cell.contentView viewWithTag:5];
             [imageValue setImage:[UIImage imageNamed:@"u196"]];
             */
            UIImageView *imageRightValue = (UIImageView *)[cell.contentView viewWithTag:6];
            [imageRightValue setImage:[UIImage imageNamed:@"u51"]];
            
            UILabel *vlabel=(UILabel *)[cell.contentView viewWithTag:1];
            
            vlabel.text=@"我的活动";
            break;
        }
        case 5:
        {
            /*UIImageView *imageValue = (UIImageView *)[cell.contentView viewWithTag:5];
             [imageValue setImage:[UIImage imageNamed:@"u196"]];
             */
            UIImageView *imageRightValue = (UIImageView *)[cell.contentView viewWithTag:6];
            [imageRightValue setImage:[UIImage imageNamed:@"u51"]];
            
            UILabel *vlabel=(UILabel *)[cell.contentView viewWithTag:1];
            
            vlabel.text=@"我的收藏";
            break;
        }
        case 6:
        {
            /*UIImageView *imageValue = (UIImageView *)[cell.contentView viewWithTag:5];
             [imageValue setImage:[UIImage imageNamed:@"u196"]];
             */
            UIImageView *imageRightValue = (UIImageView *)[cell.contentView viewWithTag:6];
            [imageRightValue setImage:[UIImage imageNamed:@"u51"]];
            
            UILabel *vlabel=(UILabel *)[cell.contentView viewWithTag:1];
            
            vlabel.text=@"设置";
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
        case 1:{
            
            break;
        }

        case 3:{
            //我的活动
            UIBarButtonItem *barBtn=[[UIBarButtonItem alloc]init];
            barBtn.title=@"返回";
            self.navigationItem.backBarButtonItem=barBtn;
            PersonalMyActivityViewController *personal=[[PersonalMyActivityViewController alloc]init];
            [self.navigationController pushViewController:personal animated:YES];
            break;
        }
        case 5:{
            //我的收藏
            UIBarButtonItem *barBtn=[[UIBarButtonItem alloc]init];
            barBtn.title=@"返回";
            self.navigationItem.backBarButtonItem=barBtn;
            PersonalMyCollectionViewController *personal=[[PersonalMyCollectionViewController alloc]init];
            [self.navigationController pushViewController:personal animated:YES];
            
            break;
        }
        case 6:{
            //设置
            UIBarButtonItem *barBtn=[[UIBarButtonItem alloc]init];
            barBtn.title=@"返回";
            self.navigationItem.backBarButtonItem=barBtn;
            PersonalSettingViewController *personal=[[PersonalSettingViewController alloc]init];
            [self.navigationController pushViewController:personal animated:YES];

            break;
        }
        default:
            break;
    }

}
-(void)btnClick:(UIButton *)sender{
    switch (sender.tag) {
        case 10001:
        {
            //信息编辑
            UIBarButtonItem *barBtn=[[UIBarButtonItem alloc]init];
            barBtn.title=@"返回";
            self.navigationItem.backBarButtonItem=barBtn;
            PersonalMyInfoViewController *personal=[[PersonalMyInfoViewController alloc]init];
            [self.navigationController pushViewController:personal animated:YES];

        }
            break;
        case 10002:
        {}
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
