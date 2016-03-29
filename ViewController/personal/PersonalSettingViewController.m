//
//  PersonalSettingViewController.m
//  iwayward
//
//  Created by caopeng on 15/3/29.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "PersonalSettingViewController.h"

@interface PersonalSettingViewController ()

@end

@implementation PersonalSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=VIEW_BG_COLOR;
    self.title=@"设置";
    
    
    [self initUILayout];
}
-(void)initUILayout{
    
    tempTbleView=[[UITableView alloc]initWithFrame:CGRectMake(5, 80, self.view.bounds.size.width-10, 40)];
    tempTbleView.tag=100;
    tempTbleView.scrollEnabled=NO;
    [tempTbleView setDelegate:self];
    [tempTbleView setDataSource:self];
    [self.view addSubview:tempTbleView];
    
    SetUpTableView=[[UITableView alloc]initWithFrame:CGRectMake(5, 80, self.view.bounds.size.width-10, 160) ];
    SetUpTableView.tag=1;
    SetUpTableView.layer.borderWidth = 1;
    SetUpTableView.layer.cornerRadius = 8;
    SetUpTableView.layer.masksToBounds = YES;
    SetUpTableView.layer.borderColor =LINE_COLOR;
    SetUpTableView.scrollEnabled=NO;
    [SetUpTableView setDelegate:self];
    [SetUpTableView setDataSource:self];
    [self.view addSubview:SetUpTableView];

    SettingArray=[[NSMutableArray alloc] initWithObjects:@"关于我们",@"意见反馈",@"当前版本",@"清除缓存", nil];

    //登录按钮
    UIButton *btnLogin=[[UIButton alloc] initWithFrame:CGRectMake(50,SetUpTableView.frame.size.height+SetUpTableView.frame.origin.y+80,280, 50)];
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
    if(tableView.tag==1)
    {
        return [SettingArray count];
    }else{
        return 1;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 40;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *tableViewIdentifier = @"tableViewIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewIdentifier];
    if(cell==nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:tableViewIdentifier];
    }
    NSUInteger row=[indexPath row];


    if(tableView.tag==1){
        
            cell.textLabel.text=[SettingArray objectAtIndex:row];
            cell.backgroundColor=[UIColor whiteColor];
            cell.textLabel.font=[UIFont boldSystemFontOfSize:16];
            cell.textLabel.textColor=[UIColor blueColor];
        
    
    }
    

   
    
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
