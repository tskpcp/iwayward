//
//  PersonalMyInfoViewController.m
//  iwayward
//
//  Created by caopeng on 15/3/29.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "PersonalMyInfoViewController.h"

@interface PersonalMyInfoViewController ()

@end

@implementation PersonalMyInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=VIEW_BG_COLOR;
    self.title=@"我的资料";
    [self initUILayout];

    // Do any additional setup after loading the view.
}
-(void)initUILayout{
    tempTbleView=[[UITableView alloc]initWithFrame:CGRectMake(5, 80, self.view.bounds.size.width-10, 40)];
    tempTbleView.tag=100;
    tempTbleView.scrollEnabled=NO;
    [tempTbleView setDelegate:self];
    [tempTbleView setDataSource:self];
    [self.view addSubview:tempTbleView];
      //我的信息
    MyInformation=[[UITableView alloc]initWithFrame:CGRectMake(0, 65, self.view.bounds.size.width, 40)];
    MyInformation.backgroundColor=[UIColor whiteColor];
    MyInformation.tag=1;
    MyInformation.scrollEnabled=NO;
    [MyInformation setDelegate:self];
    [MyInformation setDataSource:self];
    [self.view addSubview:MyInformation];
    UILabel *lblline0=[[UILabel alloc]initWithFrame:CGRectMake(0, MyInformation.frame.origin.y+MyInformation.frame.size.height, self.view.bounds.size.width, 1)];
    lblline0.layer.borderWidth = 1;
    lblline0.layer.borderColor = LINE_COLOR;
    lblline0.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline0];
    //个人简介
    PersonalProfile=[[UITableView alloc]initWithFrame:CGRectMake(0, lblline0.frame.size.height+lblline0.frame.origin.y, self.view.bounds.size.width, 40)];
    PersonalProfile.backgroundColor=[UIColor whiteColor];
    PersonalProfile.tag=3;
    PersonalProfile.scrollEnabled=NO;
    [PersonalProfile setDelegate:self];
    [PersonalProfile setDataSource:self];
    [self.view addSubview:PersonalProfile];
    UILabel *lblline2=[[UILabel alloc]initWithFrame:CGRectMake(0, PersonalProfile.frame.origin.y+PersonalProfile.frame.size.height, self.view.bounds.size.width, 1)];
    lblline2.layer.borderWidth = 1;
    lblline2.layer.borderColor = LINE_COLOR;
    lblline2.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline2];
    
    UIView *viewTemp=[[UIView alloc] initWithFrame:CGRectMake(0, lblline2.frame.origin.y+lblline2.frame.size.height, self.view.frame.size.width, 10)];
    [viewTemp setBackgroundColor:[UIColor colorWithRed:203.0/255.0 green:203.0/255.0 blue:203.0/255.0 alpha:1.0]];
    [self.view addSubview:viewTemp];
    
    //我的经历
    MyExperience=[[UITableView alloc]initWithFrame:CGRectMake(0, viewTemp.frame.size.height+viewTemp.frame.origin.y, self.view.bounds.size.width, 40)];
    MyExperience.backgroundColor=[UIColor whiteColor];
    MyExperience.tag=6;
    
    MyExperience.scrollEnabled=NO;
    [MyExperience setDelegate:self];
    [MyExperience setDataSource:self];
    [self.view addSubview:MyExperience];
    UILabel *lblline4=[[UILabel alloc]initWithFrame:CGRectMake(0, MyExperience.frame.origin.y+MyExperience.frame.size.height, self.view.bounds.size.width, 1)];
    lblline4.layer.borderWidth = 1;
    lblline4.layer.borderColor = LINE_COLOR;
    lblline4.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline4];
    
    //项目经验
    ProjectExperience=[[UITableView alloc]initWithFrame:CGRectMake(0, lblline4.frame.size.height+lblline4.frame.origin.y, self.view.bounds.size.width, 40)];
    ProjectExperience.backgroundColor=[UIColor whiteColor];
    ProjectExperience.tag=7;
    ProjectExperience.scrollEnabled=NO;
    [ProjectExperience setDelegate:self];
    [ProjectExperience setDataSource:self];
    [self.view addSubview:ProjectExperience];
    UILabel *lblline5=[[UILabel alloc]initWithFrame:CGRectMake(0, ProjectExperience.frame.origin.y+ProjectExperience.frame.size.height, self.view.bounds.size.width, 1)];
    lblline5.layer.borderWidth = 1;
    lblline5.layer.borderColor = LINE_COLOR;
    lblline5.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline5];
  
     //教育经历
    StudyExperience=[[UITableView alloc]initWithFrame:CGRectMake(0, lblline5.frame.size.height+lblline5.frame.origin.y, self.view.bounds.size.width, 40)];
    StudyExperience.backgroundColor=[UIColor whiteColor];
    StudyExperience.tag=4;
   
    StudyExperience.scrollEnabled=NO;
    [StudyExperience setDelegate:self];
    [StudyExperience setDataSource:self];
    [self.view addSubview:StudyExperience];
    UILabel *lblline3=[[UILabel alloc]initWithFrame:CGRectMake(0, StudyExperience.frame.origin.y+StudyExperience.frame.size.height, self.view.bounds.size.width, 1)];
    lblline3.layer.borderWidth = 1;
    lblline3.layer.borderColor = LINE_COLOR;
    lblline3.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline3];
    
    UIView *viewTemp1=[[UIView alloc] initWithFrame:CGRectMake(0, lblline3.frame.origin.y+lblline3.frame.size.height, self.view.frame.size.width, 10)];
    [viewTemp1 setBackgroundColor:[UIColor colorWithRed:203.0/255.0 green:203.0/255.0 blue:203.0/255.0 alpha:1.0]];
    [self.view addSubview:viewTemp1];
    
    //我的需求
    JobSearchIntention=[[UITableView alloc]initWithFrame:CGRectMake(0, viewTemp1.frame.size.height+viewTemp1.frame.origin.y, self.view.bounds.size.width, 40)];
    JobSearchIntention.backgroundColor=[UIColor whiteColor];
    JobSearchIntention.tag=2;
    
    JobSearchIntention.scrollEnabled=NO;
    [JobSearchIntention setDelegate:self];
    [JobSearchIntention setDataSource:self];
    [self.view addSubview:JobSearchIntention];
    UILabel *lblline1=[[UILabel alloc]initWithFrame:CGRectMake(0, JobSearchIntention.frame.origin.y+JobSearchIntention.frame.size.height, self.view.bounds.size.width, 1)];
    lblline1.layer.borderWidth = 1;
    lblline1.layer.borderColor = LINE_COLOR;
    lblline1.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline1];
   
    
    //登录按钮
    UIButton *btnLogin=[[UIButton alloc] initWithFrame:CGRectMake(50,lblline1.frame.size.height+lblline1.frame.origin.y+80,280, 50)];
    btnLogin.tag=10001;
    [btnLogin addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [btnLogin setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
   // [btnLogin setBackgroundImage:[UIImage imageNamed:[CommonHelper getPicNameAtSkip:@"btn_unclick.png"]] forState:UIControlStateNormal];
   // [btnLogin setBackgroundImage:[UIImage imageNamed:[CommonHelper getPicNameAtSkip:@"btn_click.png"]] forState:UIControlStateHighlighted];
    btnLogin.layer.borderWidth = 1;
    btnLogin.layer.cornerRadius = 0;

    btnLogin.layer.borderColor =LINE_COLOR;
    btnLogin.backgroundColor=[UIColor clearColor];
    [self.view addSubview:btnLogin];

    
}
-(void)btnClick:(UIButton *)sender{
    switch (sender.tag) {
        case 10001:
            
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
            case 1:
            case 6:
            case 7:{
                UILabel *vlabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 25)];
                vlabel.font=[UIFont boldSystemFontOfSize:20];
                vlabel.tag=1;
                //vlabel.textAlignment =UITextAlignmentRight;
                vlabel.backgroundColor=[UIColor clearColor];
                [cell.contentView addSubview:vlabel];
                
                
                UILabel *labelValue=[[UILabel alloc]initWithFrame:CGRectMake(vlabel.frame.size.width+vlabel.frame.origin.x+5, 15, cell.contentView.bounds.size.width/2+30, 25)];
                labelValue.font=[UIFont boldSystemFontOfSize:12];
                
                labelValue.tag=2;
                labelValue.numberOfLines=0;
                
                labelValue.textColor=[UIColor colorWithRed:168.0/255.0 green:168.0/255.0 blue:168.0/255.0 alpha:1.0];
                labelValue.backgroundColor=[UIColor clearColor];
                [cell.contentView addSubview:labelValue];

                break;
                    }
            default:
            {
              
                
                
                UILabel *vlabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, cell.contentView.bounds.size.width+45, 25)];
                vlabel.font=[UIFont boldSystemFontOfSize:20];
                vlabel.tag=1;
                //vlabel.textAlignment = UITextAlignmentCenter;
                vlabel.backgroundColor=[UIColor clearColor];
                [cell.contentView addSubview:vlabel];
            }
                break;
        }
        
        
        
    }
    
    
    switch (tableView.tag) {
        case 1:
        {
            UILabel *vlabel=(UILabel *)[cell.contentView viewWithTag:1];
            
            vlabel.text=@"我的信息";
            UILabel *labelValue=(UILabel *)[cell.contentView viewWithTag:2];
           
            labelValue.text=@"已完成10%";
            
            break;
        }
        case 2:
        {
            
            
            UILabel *vlabel=(UILabel *)[cell.contentView viewWithTag:1];
            
            vlabel.text=@"我的需求";
            break;
        }
        case 3:
        {
          
            
            UILabel *vlabel=(UILabel *)[cell.contentView viewWithTag:1];
            
            vlabel.text=@"个人简介";
            break;
        }
        case 4:
        {
            UILabel *vlabel=(UILabel *)[cell.contentView viewWithTag:1];
            
            vlabel.text=@"学习经历";
            break;
        }
       
        case 6:
        {
            
            UILabel *vlabel=(UILabel *)[cell.contentView viewWithTag:1];
            
            vlabel.text=@"我的经历";
            UILabel *labelValue=(UILabel *)[cell.contentView viewWithTag:2];
            labelValue.text=@"已完成10%";
            
            break;
        }
        case 7:
        {
            
            UILabel *vlabel=(UILabel *)[cell.contentView viewWithTag:1];
            
            vlabel.text=@"项目经验";
            UILabel *labelValue=(UILabel *)[cell.contentView viewWithTag:2];
            labelValue.text=@"已完成10%";
            
            break;
        }

        default:
            break;
    }
    
    //添加图片
    UIView *backView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView = backView;
    cell.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    return cell;
}
#pragma mark -
#pragma mark Table View Delegate Methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (tableView.tag) {
        case 1:{
            //我的信息
           UIBarButtonItem *infoViewbarBtn=[[UIBarButtonItem alloc]init];
            infoViewbarBtn.title=@"返回";
            self.navigationItem.backBarButtonItem=infoViewbarBtn;
            PersonalInfoViewController *infoView=[[PersonalInfoViewController alloc]init];
            [self.navigationController pushViewController:infoView animated:YES];
                       break;
        }
        case 2:{ //求职意向
            UIBarButtonItem *JobSearchIntentionbarBtn=[[UIBarButtonItem alloc]init];
            JobSearchIntentionbarBtn.title=@"返回";
            self.navigationItem.backBarButtonItem=JobSearchIntentionbarBtn;
            JobSearchIntentionViewController *JobSearchIntentionView=[[JobSearchIntentionViewController alloc]init];
            [self.navigationController pushViewController:JobSearchIntentionView animated:YES];
            
                      break;
        }
        case 3:{ //个人简介
            UIBarButtonItem *PersonalProfileViewbarBtn=[[UIBarButtonItem alloc]init];
            PersonalProfileViewbarBtn.title=@"返回";
            self.navigationItem.backBarButtonItem=PersonalProfileViewbarBtn;
            PersonalProfileViewController *PersonalProfileView=[[PersonalProfileViewController alloc]init];
            [self.navigationController pushViewController:PersonalProfileView animated:YES];
                        break;
        }
        case 4:{ //教育经历
           
            UIBarButtonItem *StudyExperienceViewBarBtn=[[UIBarButtonItem alloc]init];
            StudyExperienceViewBarBtn.title=@"返回";
            self.navigationItem.backBarButtonItem=StudyExperienceViewBarBtn;
            StudyExperienceViewController *studyExperienceView=[[StudyExperienceViewController alloc]init];
            [self.navigationController pushViewController:studyExperienceView animated:YES];
            break;
        }
       
        case 6:{ //我的经历
            UIBarButtonItem *MyExperienceViewbarBtn=[[UIBarButtonItem alloc]init];
            MyExperienceViewbarBtn.title=@"返回";
            self.navigationItem.backBarButtonItem=MyExperienceViewbarBtn;
            MyExperienceViewController *MyExperienceView=[[MyExperienceViewController alloc]init];
            [self.navigationController pushViewController:MyExperienceView animated:YES];
            
            break;
        }
        case 7:{ //项目经验
            UIBarButtonItem *ProjectExperienceViewbarBtn=[[UIBarButtonItem alloc]init];
            ProjectExperienceViewbarBtn.title=@"返回";
            self.navigationItem.backBarButtonItem=ProjectExperienceViewbarBtn;
            ProjectExperienceViewController *ProjectExperienceView=[[ProjectExperienceViewController alloc]init];
            [self.navigationController pushViewController:ProjectExperienceView animated:YES];
            break;
        }
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
