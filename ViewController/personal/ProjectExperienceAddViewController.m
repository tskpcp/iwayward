//
//  ProjectExperienceAddViewController.m
//  iwayward
//
//  Created by caopeng on 15/4/12.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "ProjectExperienceAddViewController.h"

@interface ProjectExperienceAddViewController ()
@property(nonatomic,strong)NSString *strProDesc;
@property(nonatomic,strong)NSString *strProResp;

@end

@implementation ProjectExperienceAddViewController
@synthesize strProDesc=_strProDesc;
@synthesize strProResp=_strProResp;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=VIEW_BG_COLOR;
    self.title=@"添加项目经验";
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action: @selector(btnRightAction:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    [self initUILayout];
    [self initDataSource];
}
-(void)initUILayout{
    UILabel *lblProjectName=[[UILabel alloc]initWithFrame:CGRectMake(10,70,75, 30)];
    lblProjectName.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblProjectName.font=[UIFont boldSystemFontOfSize:15];
    lblProjectName.backgroundColor=[UIColor clearColor];
    lblProjectName.text=@"项目名称:";
    [self.view addSubview:lblProjectName];
    
    txtProjectName=[[UITextField alloc]initWithFrame:CGRectMake(lblProjectName.frame.origin.x+lblProjectName.frame.size.width, 70, self.view.bounds.size.width-80, 30)];
    txtProjectName.font=[UIFont boldSystemFontOfSize:14];
    txtProjectName.backgroundColor=[UIColor clearColor];
    txtProjectName.tag=100;
    txtProjectName.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    txtProjectName.delegate=self;
    txtProjectName.keyboardType=UIKeyboardAppearanceDefault;
    txtProjectName.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtProjectName.adjustsFontSizeToFitWidth = YES;
    txtProjectName.placeholder=@"请输项目名称";
    [self.view addSubview:txtProjectName];
    
    UILabel *lblline1=[[UILabel alloc]initWithFrame:CGRectMake(0, lblProjectName.frame.origin.y+lblProjectName.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline1.layer.borderWidth = 1;
    lblline1.layer.borderColor = LINE_COLOR;
    lblline1.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline1];
    //================================================
    UILabel *lbleginDate=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline1.frame.origin.y+lblline1.frame.size.height+5,75, 30)];
    lbleginDate.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lbleginDate.font=[UIFont boldSystemFontOfSize:15];
    lbleginDate.backgroundColor=[UIColor clearColor];
    lbleginDate.text=@"开始时间:";
    [self.view addSubview:lbleginDate];
    
    BeginDateDataPicker=[[UIDatePicker alloc]init];
    BeginDateDataPicker.frame=CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 216);
    BeginDateDataPicker.tag=9100;
    BeginDateDataPicker.datePickerMode=UIDatePickerModeDate;
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    BeginDateDataPicker.locale=locale;
    BeginDateDataPicker.backgroundColor=[UIColor whiteColor];
    
    
    fexibleSpace=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIToolbar *toolBarData=[[UIToolbar alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 40)];
    NSMutableArray *buttonArrayData=[[NSMutableArray alloc]init];
    
    UIBarButtonItem *itemBarBtnData=[[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(PickerSelect:)];
    
    itemBarBtnData.tag=51001;
    [buttonArrayData addObject:fexibleSpace];
    [buttonArrayData addObject:itemBarBtnData];
    [toolBarData setItems:buttonArrayData animated:YES];
    
    
    txtBeginDate=[[UITextField alloc]initWithFrame:CGRectMake(lbleginDate.frame.origin.x+lbleginDate.frame.size.width,lblline1.frame.origin.y+lblline1.frame.size.height+5, self.view.bounds.size.width-80, 30)];
    txtBeginDate.font=[UIFont boldSystemFontOfSize:14];
    txtBeginDate.backgroundColor=[UIColor clearColor];
    txtBeginDate.tag=200;
    txtBeginDate.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    txtBeginDate.delegate=self;
    txtBeginDate.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtBeginDate.placeholder=@"请输开始日期";
    txtBeginDate.inputView=BeginDateDataPicker;
    txtBeginDate.inputAccessoryView=toolBarData;

    [self.view addSubview:txtBeginDate];
    
    UILabel *lblline2=[[UILabel alloc]initWithFrame:CGRectMake(0, lbleginDate.frame.origin.y+lbleginDate.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline2.layer.borderWidth = 1;
    lblline2.layer.borderColor = LINE_COLOR;
    lblline2.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline2];
    //================================================
    UILabel *lblEndDate=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline2.frame.origin.y+lblline2.frame.size.height+5,75, 30)];
    lblEndDate.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblEndDate.font=[UIFont boldSystemFontOfSize:15];
    lblEndDate.backgroundColor=[UIColor clearColor];
    lblEndDate.text=@"结束时间:";
    [self.view addSubview:lblEndDate];
    
    EndDateDataPicker=[[UIDatePicker alloc]init];
    EndDateDataPicker.frame=CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 216);
    EndDateDataPicker.tag=9200;
    EndDateDataPicker.datePickerMode=UIDatePickerModeDate;
    NSLocale *endlocale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    EndDateDataPicker.locale=endlocale;
    EndDateDataPicker.backgroundColor=[UIColor whiteColor];
    
    
    fexibleSpace=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIToolbar *EndtoolBarData=[[UIToolbar alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 40)];
    NSMutableArray *EndbuttonArrayData=[[NSMutableArray alloc]init];
    
    UIBarButtonItem *EnditemBarBtnData=[[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(PickerSelect:)];
    
    EnditemBarBtnData.tag=51002;
    [EndbuttonArrayData addObject:fexibleSpace];
    [EndbuttonArrayData addObject:EnditemBarBtnData];
    [EndtoolBarData setItems:EndbuttonArrayData animated:YES];

    
    txtEndDate=[[UITextField alloc]initWithFrame:CGRectMake(lblEndDate.frame.origin.x+lblEndDate.frame.size.width,lblline2.frame.origin.y+lblline2.frame.size.height+5, self.view.bounds.size.width-80, 30)];
    txtEndDate.font=[UIFont boldSystemFontOfSize:14];
    txtEndDate.backgroundColor=[UIColor clearColor];
    txtEndDate.tag=300;
    txtEndDate.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    txtEndDate.delegate=self;
    txtEndDate.placeholder=@"请输结束日期";
    txtEndDate.inputView=EndDateDataPicker;
    txtEndDate.inputAccessoryView=EndtoolBarData;
    [self.view addSubview:txtEndDate];
    
    UILabel *lblline3=[[UILabel alloc]initWithFrame:CGRectMake(0, lblEndDate.frame.origin.y+lblEndDate.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline3.layer.borderWidth = 1;
    lblline3.layer.borderColor = LINE_COLOR;
    lblline3.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline3];
    //================================================
    UILabel *lblProject=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline3.frame.origin.y+lblline3.frame.size.height+8, 75, 25)];
    lblProject.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblProject.font=[UIFont boldSystemFontOfSize:15];
    lblProject.backgroundColor=[UIColor clearColor];
    lblProject.text=@"项目描述:";
    [self.view addSubview:lblProject];
    
    lblProjectDescription=[[UILabel alloc]initWithFrame:CGRectMake(lblProject.frame.origin.x+lblProject.frame.size.width+2,lblProject.frame.origin.y+lblProject.frame.size.height+8, 75, 25)];
    lblProjectDescription.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblProjectDescription.font=[UIFont boldSystemFontOfSize:15];
    lblProjectDescription.backgroundColor=[UIColor clearColor];
    [self.view addSubview:lblProjectDescription];
    
    
    UIImageView *imageProjectDescription=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-30,lblline3.frame.origin.y+lblline3.frame.size.height+8, 25, 25)];
    [imageProjectDescription setImage:[UIImage imageNamed:@"u51"]];
    [self.view addSubview:imageProjectDescription];
    
    UIButton *btnIndustryCategory=[[UIButton alloc] initWithFrame:CGRectMake(0,lblline3.frame.origin.y+lblline3.frame.size.height+8,self.view.frame.size.width, 35)];
    btnIndustryCategory.tag=10003;
    [btnIndustryCategory addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [btnIndustryCategory setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btnIndustryCategory.backgroundColor=[UIColor clearColor];
    [self.view addSubview:btnIndustryCategory];
    
    
    UILabel *lblline4=[[UILabel alloc]initWithFrame:CGRectMake(0, lblProject.frame.origin.y+lblProject.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline4.layer.borderWidth = 1;
    lblline4.layer.borderColor = LINE_COLOR;
    lblline4.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline4];
    //================================================
    UILabel *lblResponsibilityd=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline4.frame.origin.y+lblline4.frame.size.height+8, 75, 25)];
    lblResponsibilityd.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblResponsibilityd.font=[UIFont boldSystemFontOfSize:15];
    lblResponsibilityd.backgroundColor=[UIColor clearColor];
    lblResponsibilityd.text=@"责任描述:";
    [self.view addSubview:lblResponsibilityd];
    
    lblResponsibilitydDescription=[[UILabel alloc]initWithFrame:CGRectMake(lblResponsibilityd.frame.origin.x+lblResponsibilityd.frame.size.width+2,lblProject.frame.origin.y+lblProject.frame.size.height+8, 75, 25)];
    lblResponsibilitydDescription.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblResponsibilitydDescription.font=[UIFont boldSystemFontOfSize:15];
    lblResponsibilitydDescription.backgroundColor=[UIColor clearColor];
    [self.view addSubview:lblResponsibilitydDescription];
    
    
    UIImageView *imageResponsibilitydDescription=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-30,lblline4.frame.origin.y+lblline4.frame.size.height+8, 25, 25)];
    [imageResponsibilitydDescription setImage:[UIImage imageNamed:@"u51"]];
    [self.view addSubview:imageResponsibilitydDescription];
    
    UIButton *btnImageResponsibilitydDescription=[[UIButton alloc] initWithFrame:CGRectMake(0,lblline4.frame.origin.y+lblline4.frame.size.height+8,self.view.frame.size.width, 35)];
    btnImageResponsibilitydDescription.tag=10004;
    [btnImageResponsibilitydDescription addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [btnImageResponsibilitydDescription setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btnImageResponsibilitydDescription.backgroundColor=[UIColor clearColor];
    [self.view addSubview:btnImageResponsibilitydDescription];
    
    
    UILabel *lblline5=[[UILabel alloc]initWithFrame:CGRectMake(0, lblResponsibilityd.frame.origin.y+lblResponsibilityd.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline5.layer.borderWidth = 1;
    lblline5.layer.borderColor = LINE_COLOR;
    lblline5.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline5];

}
-(void)PickerSelect:(UIBarButtonItem *)sender{
    switch (sender.tag) {
        case 51001:{
            NSDate *select = [BeginDateDataPicker date];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            txtBeginDate.text =  [dateFormatter stringFromDate:select];
            [txtBeginDate endEditing:YES];
            
            break;
        }
        case 51002:{
            NSDate *select = [EndDateDataPicker date];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            txtEndDate.text =  [dateFormatter stringFromDate:select];
            [txtEndDate endEditing:YES];
            
            break;
        }
        default:
            break;
    }
}
-(void)btnRightAction:(UIBarButtonItem *)sender{
    
   BOOL flag= [perdao insertProjectExperienceUserID:1 proIndex:0 proID:9 proName:txtProjectName.text proBeginDate:txtBeginDate.text proEndDate:txtEndDate.text proDesc:_strProDesc proDespons:_strProResp];
   
    if(flag){
      [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self.view makeToast:@"添加失败，请重新添加！"];
    }
    
    
    
}
-(void)initDataSource{
    perdao=[[personalDao alloc]init];
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(proDescData:)
                                                 name: @"proDescData"
                                               object: nil];
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(proRespData:)
                                                 name: @"proRespData"
                                               object: nil];
    
}
-(void)proDescData:(NSNotification *)readArray{
    
     _strProDesc=[readArray object];
}
-(void)proRespData:(NSNotification *)readArray{
    _strProResp=[readArray object];
    
}
-(void)btnClick:(UIButton *)sender{
    switch (sender.tag) {
        case 10003:{
            //项目描述
            UIBarButtonItem *barBtn=[[UIBarButtonItem alloc]init];
            barBtn.title=@"返回";
            self.navigationItem.backBarButtonItem=barBtn;
            ProDescViewController *proDesc=[[ProDescViewController alloc]init];
            [self.navigationController pushViewController:proDesc animated:YES];
            break;
        }
        case 10004:{
            //责任描述
            UIBarButtonItem *barBtn=[[UIBarButtonItem alloc]init];
            barBtn.title=@"返回";
            self.navigationItem.backBarButtonItem=barBtn;
            ProResponsViewController *proRespons=[[ProResponsViewController alloc]init];
            [self.navigationController pushViewController:proRespons animated:YES];
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
