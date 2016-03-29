//
//  IndustryViewController.m
//  iwayward
//
//  Created by caopeng on 15/4/3.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "IndustryViewController.h"

@interface IndustryViewController ()
@property(nonatomic,strong)NSDictionary* dict;
@property(nonatomic,strong)NSArray* IndustryArray;
@end

@implementation IndustryViewController
@synthesize dict=_dict;
@synthesize IndustryArray=_industryArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=VIEW_BG_COLOR;
    //行业、行业类型
    self.title=@"行业";
    [self initDataSource];
   
}
-(void)initDataSource{

    //数据加载
    NSString* plistPath=[[NSBundle mainBundle] pathForResource:@"Industry" ofType:@"plist"];
    _dict=[[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    self.IndustryArray=[_dict allKeys];
    //NSLog(@"%@",_industryArray);
    
    
    IndustryTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height)];
    IndustryTableView.backgroundColor=[UIColor whiteColor];
    IndustryTableView.tag=1;
    IndustryTableView.scrollEnabled=YES;
    [IndustryTableView setDelegate:self];
    [IndustryTableView setDataSource:self];
    [self.view addSubview:IndustryTableView];
}
#pragma mark -
#pragma mark Table View Data Source mathods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_industryArray count];
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
    
    cell.textLabel.text=[_industryArray objectAtIndex:[indexPath row]];
    
    
    return cell;
}
#pragma mark -
#pragma mark Table View Delegate Methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIBarButtonItem *barBtn=[[UIBarButtonItem alloc]init];
    barBtn.title=@"返回";
    self.navigationItem.backBarButtonItem=barBtn;
    IndustryInfoViewController *proDesc=[[IndustryInfoViewController alloc]init];
    proDesc.industryIndex=[indexPath row];
    [self.navigationController pushViewController:proDesc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
