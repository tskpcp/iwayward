//
//  PositionInfoViewController.m
//  iwayward
//
//  Created by caopeng on 15/7/18.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "PositionInfoViewController.h"

@interface PositionInfoViewController ()
@property(nonatomic,strong)NSDictionary* dict;
@property(nonatomic,strong)NSDictionary *subct;

@property(nonatomic,strong)NSArray* positionArray;

@end

@implementation PositionInfoViewController
@synthesize dict=_dict;
@synthesize positionArray=_positionArray;
@synthesize positionIndexSection;
@synthesize positionIndexRow;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=VIEW_BG_COLOR;
    //职位
    UIBarButtonItem *barBtn=[[UIBarButtonItem alloc]init];
    barBtn.title=@"确认";
    self.navigationItem.rightBarButtonItem=barBtn;
    [self initDataSource];
    
}
-(void)initDataSource{
    
    //数据加载
    NSString* plistPath=[[NSBundle mainBundle] pathForResource:@"post" ofType:@"plist"];
    _dict=[[NSDictionary alloc] initWithContentsOfFile:plistPath];
    NSString *strTitle=[[[[_dict objectForKey:[[_dict allKeys] objectAtIndex:positionIndexSection]] objectAtIndex:0]allKeys] objectAtIndex:positionIndexRow];
    self.title=strTitle;
    
   
    self.positionArray=[[[_dict objectForKey:[[_dict allKeys] objectAtIndex:positionIndexSection]] objectAtIndex:0] objectForKey:strTitle];
   
   
    
    PositonInfoTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height)];
    PositonInfoTableView.backgroundColor=[UIColor whiteColor];
    PositonInfoTableView.tag=1;
    PositonInfoTableView.scrollEnabled=YES;
    [PositonInfoTableView setDelegate:self];
    [PositonInfoTableView setDataSource:self];
    [self.view addSubview:PositonInfoTableView];
}
#pragma mark -
#pragma mark Table View Data Source mathods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
  
    return [_positionArray count];
  
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
        
        
        
        
        
    }
    
    cell.textLabel.text=[_positionArray objectAtIndex:[indexPath row]];
    
    
    return cell;
}
#pragma mark -
#pragma mark Table View Delegate Methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   /* UIBarButtonItem *barBtn=[[UIBarButtonItem alloc]init];
    barBtn.title=@"返回";
    self.navigationItem.backBarButtonItem=barBtn;
    IndustryInfoViewController *proDesc=[[IndustryInfoViewController alloc]init];
    proDesc.industryIndex=[indexPath row];
    [self.navigationController pushViewController:proDesc animated:YES];*/
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
