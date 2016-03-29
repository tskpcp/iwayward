//
//  EducationViewController.m
//  iwayward
//
//  Created by caopeng on 15/4/26.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "EducationViewController.h"

@interface EducationViewController ()
@property(nonatomic,strong)NSArray *educationArray;
@property(nonatomic,strong)NSString *strEducation;
@end

@implementation EducationViewController

@synthesize educationArray=_educationArray;
@synthesize strEducation=_strEducation;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=VIEW_BG_COLOR;
    self.title=@"学历";

   
    _educationArray=[[NSArray alloc]initWithObjects:@"初中",@"高中",@"技校",@"中专", @"大专",@"本科",@"硕士",@"博士",@"博士后",nil];

    
    EducationTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,495 )];
    EducationTableView.backgroundColor=[UIColor whiteColor];
    EducationTableView.tag=1;
    EducationTableView.scrollEnabled=NO;
    [EducationTableView setDelegate:self];
    [EducationTableView setDataSource:self];
    [self.view addSubview:EducationTableView];
}
#pragma mark -
#pragma mark Table View Data Source mathods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return [_educationArray count];
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
    
    cell.textLabel.text=[_educationArray objectAtIndex:[indexPath row]];
    
    
    return cell;
}
#pragma mark -
#pragma mark Table View Delegate Methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _strEducation=[_educationArray objectAtIndex:[indexPath row]];
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"educationData"  object:_strEducation];
    [self.navigationController popViewControllerAnimated:YES];
    
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
