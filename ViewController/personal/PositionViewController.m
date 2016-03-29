//
//  PositionViewController.m
//  iwayward
//
//  Created by caopeng on 15/4/4.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "PositionViewController.h"

@interface PositionViewController ()
@property(nonatomic,strong)NSDictionary* dict;
@property(nonatomic,strong)NSDictionary *subct;

@property(nonatomic,strong)NSArray* positionArray;
@property(nonatomic,strong)NSArray *subpositionArray;
@end

@implementation PositionViewController
@synthesize dict=_dict;
@synthesize positionArray=_positionArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    //职位、职位类型
    self.view.backgroundColor=VIEW_BG_COLOR;
    self.title=@"职位";
    UIBarButtonItem *barBtn=[[UIBarButtonItem alloc]init];
    /*
    barBtn.title=@"保存";
    self.navigationItem.rightBarButtonItem=barBtn;
    */
    [self initDataSource];

}
-(void)initDataSource{
    
    //数据加载
    NSString* plistPath=[[NSBundle mainBundle] pathForResource:@"post" ofType:@"plist"];
    _dict=[[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    self.positionArray=[_dict allKeys];
    
    /*for(int i=0;i<[_positionArray count];i++){
        NSArray *selectArray=[_dict objectForKey:[[_dict allKeys] objectAtIndex:i]];
       // NSLog(@"selectArray=%@",selectArray);
       for(int j=0;j<[selectArray count];j++){
            //NSArray *subArray=[selectArray objectAtIndex:j];
            
           //NSLog(@"nema=%@",[CommonHelper replaceUnicode:[selectArray objectAtIndex:j]]);
           NSLog(@"%i",[[selectArray objectAtIndex:j] count]);
        }
        
    }*/
    
    
    
    PositonTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height)];
    PositonTableView.backgroundColor=[UIColor whiteColor];
    PositonTableView.tag=1;
    PositonTableView.scrollEnabled=YES;
    [PositonTableView setDelegate:self];
    [PositonTableView setDataSource:self];
    [self.view addSubview:PositonTableView];
}
#pragma mark -
#pragma mark Table View Data Source mathods
//指定有多少个分区(Section)，默认为1
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   return [_positionArray count];
}
//每个section底部标题高度（实现这个代理方法后前面 sectionHeaderHeight 设定的高度无效）
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
//每个section头部标题高度（实现这个代理方法后前面 sectionFooterHeight 设定的高度无效）
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45;
}
//每个section头部的标题－Header
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [_positionArray objectAtIndex:section];
}
//每个section底部的标题－Footer
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return nil;
}

//用以定制自定义的section头部视图－Header
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
/*
//用以定制自定义的section底部视图－Footer
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIImageView *imageView_=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
    imageView_.image=[UIImage imageNamed:@"1000.png"];
    return [imageView_ autorelease];
}
*/

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

  //  NSLog(@"count=%@",[[[_dict objectForKey:[_positionArray objectAtIndex:section]] objectAtIndex:0]allKeys] );
    
     return [[[_dict objectForKey:[_positionArray objectAtIndex:section]] objectAtIndex:0] count];
    //return [[[[_positionArray objectAtIndex:section]objectAtIndex:0] allKeys ] count ];
    

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
        //设定附加视图
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        // [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
        //        UITableViewCellAccessoryNone,                   // 没有标示
        //        UITableViewCellAccessoryDisclosureIndicator,    // 下一层标示
        //        UITableViewCellAccessoryDetailDisclosureButton, // 详情button
        //        UITableViewCellAccessoryCheckmark               // 勾选标记
        
        //设定选中cell时的cell的背影颜色
        cell.selectionStyle=UITableViewCellSelectionStyleBlue;     //选中时蓝色效果
        //        cell.selectionStyle=UITableViewCellSelectionStyleNone; //选中时没有颜色效果
        //        cell.selectionStyle=UITableViewCellSelectionStyleGray;  //选中时灰色效果
        //
        //        //自定义选中cell时的背景颜色
        //        UIView *selectedView = [[UIView alloc] initWithFrame:cell.contentView.frame];
        //        selectedView.backgroundColor = [UIColor orangeColor];
        //        cell.selectedBackgroundView = selectedView;
        //        [selectedView release];
        
        
        //        cell.selectionStyle=UITableViewCellAccessoryNone; //行不能被选中

        
        
        
        
    }
   cell.textLabel.text=[[[[_dict objectForKey:[_positionArray objectAtIndex:indexPath.section]] objectAtIndex:0]allKeys] objectAtIndex:indexPath.row] ;

    
    return cell;
}
#pragma mark -
#pragma mark Table View Delegate Methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIBarButtonItem *barBtn=[[UIBarButtonItem alloc]init];
    barBtn.title=@"返回";
    self.navigationItem.backBarButtonItem=barBtn;
    PositionInfoViewController *proDesc=[[PositionInfoViewController alloc]init];
       proDesc.positionIndexSection=[indexPath section];
    proDesc.positionIndexRow=[indexPath row];


    [self.navigationController pushViewController:proDesc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
