//
//  IndustryInfoViewController.m
//  iwayward
//
//  Created by caopeng on 15/6/6.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "IndustryInfoViewController.h"

@interface IndustryInfoViewController ()
@property(nonatomic,strong)NSDictionary* dict;
@property(nonatomic,strong)NSArray* IndustryArray;
@property(nonatomic,strong)NSArray* IndustryInfoArray;

@end

@implementation IndustryInfoViewController
@synthesize dict=_dict;
@synthesize IndustryArray=_industryArray;
@synthesize IndustryInfoArray=_IndustryInfoArray;
@synthesize industryIndex;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=VIEW_BG_COLOR;
    //行业、行业类型
    self.title=@"行业";
    UIBarButtonItem *barBtn=[[UIBarButtonItem alloc]init];
    barBtn.title=@"确认";
    self.navigationItem.rightBarButtonItem=barBtn;
    [self initDataSource];
    
}
-(void)initDataSource{
    //数据加载
    NSString* plistPath=[[NSBundle mainBundle] pathForResource:@"Industry" ofType:@"plist"];
    _dict=[[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    self.IndustryArray=[_dict allKeys];
    self.IndustryInfoArray=[_dict objectForKey:[[_dict allKeys] objectAtIndex:industryIndex]];
    
    int c=5;
    int m=3;
    int w=(self.view.bounds.size.width-4*c)/m;
    int h=30;
    int count=[_IndustryInfoArray count];
    if(count%3!=0){
        switch (count%3) {
            case 1:
                count=count+2;
                break;
            case 2:
                count=count+1;
            default:
                break;
        }
    }
   
    int j=0,k=0;
    while (j<count && k<count) {
        for(int i=0;i<m;i++){
            if(k<[self.IndustryInfoArray count]){
                
            UIButton *btnInOne=[[UIButton alloc] initWithFrame:CGRectMake(c+i*(c+w),70+(j*(c+h))/3,w,h)];
            btnInOne.tag=20000+k+i;
            [btnInOne addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
            [btnInOne setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            btnInOne.layer.borderWidth = 1;
            btnInOne.layer.cornerRadius = 0;
            [btnInOne setTitle:[self.IndustryInfoArray objectAtIndex:k]  forState:UIControlStateNormal];
            btnInOne.titleLabel.font=[UIFont boldSystemFontOfSize:12];
            
            btnInOne.layer.borderColor =LINE_COLOR;
            btnInOne.backgroundColor=[UIColor clearColor];
            [self.view addSubview:btnInOne];
        
            }
            k++;
                   
        }
       j=j+3;
        
}
  

}
-(void)btnClick:(UIButton *)sender{
    int m=3;
    int j=0,k=0;
    int count=[_IndustryInfoArray count];
    if(count%3!=0){
        switch (count%3) {
            case 1:
                count=count+2;
                break;
            case 2:
                count=count+1;
            default:
                break;
        }
    }

    while (j<count && k<count) {
        for(int i=0;i<m;i++){
            int flag=20000+k+i;
            
          if((int)sender.tag ==flag)
          {
              NSLog(@"%@",[self.IndustryInfoArray objectAtIndex:k]);
          }
          k++;
            
        }
        j=j+3;
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
