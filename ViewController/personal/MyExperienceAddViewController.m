//
//  MyExperienceAddViewController.m
//  iwayward
//
//  Created by caopeng on 15/4/12.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "MyExperienceAddViewController.h"

@interface MyExperienceAddViewController ()

@end

@implementation MyExperienceAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=VIEW_BG_COLOR;
    self.title=@"添加工作经历";
    UIBarButtonItem *barBtn=[[UIBarButtonItem alloc]init];
    barBtn.title=@"保存";
    self.navigationItem.rightBarButtonItem=barBtn;
    
    [self initUILayout];
}
-(void)initUILayout{
    UILabel *lblName=[[UILabel alloc]initWithFrame:CGRectMake(10,70,75, 30)];
    lblName.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblName.font=[UIFont boldSystemFontOfSize:15];
    lblName.backgroundColor=[UIColor clearColor];
    lblName.text=@"公司名称:";
    [self.view addSubview:lblName];
    
    txtComanyName=[[UITextField alloc]initWithFrame:CGRectMake(lblName.frame.origin.x+lblName.frame.size.width, 70, self.view.bounds.size.width-80, 30)];
    txtComanyName.font=[UIFont boldSystemFontOfSize:14];
    txtComanyName.backgroundColor=[UIColor clearColor];
    txtComanyName.tag=100;
    txtComanyName.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    txtComanyName.delegate=self;
    txtComanyName.keyboardType=UIKeyboardAppearanceDefault;
    txtComanyName.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtComanyName.adjustsFontSizeToFitWidth = YES;
    txtComanyName.placeholder=@"请输公司名称";
    [self.view addSubview:txtComanyName];
    
    UILabel *lblline1=[[UILabel alloc]initWithFrame:CGRectMake(0, lblName.frame.origin.y+lblName.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline1.layer.borderWidth = 1;
    lblline1.layer.borderColor = LINE_COLOR;
    lblline1.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline1];
    //====================================================================
    UILabel *lblBeginDate=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline1.frame.origin.y+lblline1.frame.size.height+5,75, 30)];
    lblBeginDate.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblBeginDate.font=[UIFont boldSystemFontOfSize:15];
    lblBeginDate.backgroundColor=[UIColor clearColor];
    lblBeginDate.text=@"开始时间:";
    [self.view addSubview:lblBeginDate];
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
    
    txtBeginDate=[[UITextField alloc]initWithFrame:CGRectMake(lblBeginDate.frame.origin.x+lblBeginDate.frame.size.width, lblline1.frame.origin.y+lblline1.frame.size.height+5, self.view.bounds.size.width-80, 30)];
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
    
    UILabel *lblline2=[[UILabel alloc]initWithFrame:CGRectMake(0, lblBeginDate.frame.origin.y+lblBeginDate.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline2.layer.borderWidth = 1;
    lblline2.layer.borderColor = LINE_COLOR;
    lblline2.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline2];
    //====================================================================
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
    
    txtEndDate=[[UITextField alloc]initWithFrame:CGRectMake(lblEndDate.frame.origin.x+lblEndDate.frame.size.width, lblline2.frame.origin.y+lblline2.frame.size.height+5, self.view.bounds.size.width-80, 30)];
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

    //====================================================================
    UIView *CompanyInfoView=[[UIView alloc]initWithFrame:CGRectMake(0, lblline3.frame.origin.y+lblline3.frame.size.height, self.view.bounds.size.width, 45)];
    CompanyInfoView.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:CompanyInfoView];
    
    UILabel *lblCompanyInfo=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline3.frame.origin.y+lblline3.frame.size.height+5,75, 30)];
    lblCompanyInfo.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblCompanyInfo.font=[UIFont boldSystemFontOfSize:15];
    lblCompanyInfo.backgroundColor=[UIColor clearColor];
    lblCompanyInfo.text=@"公司信息";
    [self.view addSubview:lblCompanyInfo];

    //====================================================================
    UILabel *lblIndustry=[[UILabel alloc]initWithFrame:CGRectMake(10,CompanyInfoView.frame.origin.y+CompanyInfoView.frame.size.height+8, 75, 25)];
    lblIndustry.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblIndustry.font=[UIFont boldSystemFontOfSize:15];
    lblIndustry.backgroundColor=[UIColor clearColor];
    lblIndustry.text=@"行业类型:";
    [self.view addSubview:lblIndustry];
    
    lblIndustryCategory=[[UILabel alloc]initWithFrame:CGRectMake(lblIndustry.frame.origin.x+lblIndustry.frame.size.width+2,lblIndustry.frame.origin.y+lblIndustry.frame.size.height+8, 75, 25)];
    lblIndustryCategory.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblIndustryCategory.font=[UIFont boldSystemFontOfSize:15];
    lblIndustryCategory.backgroundColor=[UIColor clearColor];
    [self.view addSubview:lblIndustryCategory];
    
    
    UIImageView *imageIndustryCategory=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-30,CompanyInfoView.frame.origin.y+CompanyInfoView.frame.size.height+8, 25, 25)];
    [imageIndustryCategory setImage:[UIImage imageNamed:@"u51"]];
    [self.view addSubview:imageIndustryCategory];
    
    UIButton *btnIndustryCategory=[[UIButton alloc] initWithFrame:CGRectMake(0,CompanyInfoView.frame.origin.y+CompanyInfoView.frame.size.height+8,self.view.frame.size.width, 35)];
    btnIndustryCategory.tag=10003;
    [btnIndustryCategory addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [btnIndustryCategory setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btnIndustryCategory.backgroundColor=[UIColor clearColor];
    [self.view addSubview:btnIndustryCategory];
    
    
    UILabel *lblline4=[[UILabel alloc]initWithFrame:CGRectMake(0, lblIndustry.frame.origin.y+lblIndustry.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline4.layer.borderWidth = 1;
    lblline4.layer.borderColor = LINE_COLOR;
    lblline4.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline4];
    //====================================================================
    UILabel *lblCompany=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline4.frame.origin.y+lblline4.frame.size.height+8, 75, 25)];
    lblCompany.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblCompany.font=[UIFont boldSystemFontOfSize:15];
    lblCompany.backgroundColor=[UIColor clearColor];
    lblCompany.text=@"公司规模:";
    [self.view addSubview:lblCompany];
    
    lblCompanySize=[[UILabel alloc]initWithFrame:CGRectMake(lblCompany.frame.origin.x+lblCompany.frame.size.width+2,lblCompany.frame.origin.y+lblCompany.frame.size.height+8, 75, 25)];
    lblCompanySize.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblCompanySize.font=[UIFont boldSystemFontOfSize:15];
    lblCompanySize.backgroundColor=[UIColor clearColor];
    [self.view addSubview:lblCompanySize];
    
    
    UIImageView *imageCompanySize=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-30,lblline4.frame.origin.y+lblline4.frame.size.height+8, 25, 25)];
    [imageCompanySize setImage:[UIImage imageNamed:@"u51"]];
    [self.view addSubview:imageCompanySize];
    
    UIButton *btnCompanySize=[[UIButton alloc] initWithFrame:CGRectMake(0,lblline4.frame.origin.y+lblline4.frame.size.height+8,self.view.frame.size.width, 35)];
    btnCompanySize.tag=10004;
    [btnCompanySize addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [btnCompanySize setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btnCompanySize.backgroundColor=[UIColor clearColor];
    [self.view addSubview:btnCompanySize];
    
    
    UILabel *lblline5=[[UILabel alloc]initWithFrame:CGRectMake(0, lblCompany.frame.origin.y+lblCompany.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline5.layer.borderWidth = 1;
    lblline5.layer.borderColor = LINE_COLOR;
    lblline5.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline5];
    //====================================================================
    UIView *PositionInfoView=[[UIView alloc]initWithFrame:CGRectMake(0, lblline5.frame.origin.y+lblline5.frame.size.height, self.view.bounds.size.width, 45)];
    PositionInfoView.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:PositionInfoView];
    
    UILabel *lblPositionInfo=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline5.frame.origin.y+lblline5.frame.size.height+5,75, 30)];
    lblPositionInfo.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblPositionInfo.font=[UIFont boldSystemFontOfSize:15];
    lblPositionInfo.backgroundColor=[UIColor clearColor];
    lblPositionInfo.text=@"职位信息";
    [self.view addSubview:lblPositionInfo];
    //====================================================================
    UILabel *lblCategory=[[UILabel alloc]initWithFrame:CGRectMake(10,PositionInfoView.frame.origin.y+PositionInfoView.frame.size.height+8, 75, 25)];
    lblCategory.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblCategory.font=[UIFont boldSystemFontOfSize:15];
    lblCategory.backgroundColor=[UIColor clearColor];
    lblCategory.text=@"职位类别:";
    [self.view addSubview:lblCategory];
    
    lblJobCategory=[[UILabel alloc]initWithFrame:CGRectMake(lblCategory.frame.origin.x+lblCategory.frame.size.width+2,lblCategory.frame.origin.y+lblCategory.frame.size.height+8, 75, 25)];
    lblJobCategory.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblJobCategory.font=[UIFont boldSystemFontOfSize:15];
    lblJobCategory.backgroundColor=[UIColor clearColor];
    [self.view addSubview:lblJobCategory];
    
    
    UIImageView *imageCategory=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-30,PositionInfoView.frame.origin.y+PositionInfoView.frame.size.height+8, 25, 25)];
    [imageCategory setImage:[UIImage imageNamed:@"u51"]];
    [self.view addSubview:imageCategory];
    
    UIButton *btnJobCategory=[[UIButton alloc] initWithFrame:CGRectMake(0,PositionInfoView.frame.origin.y+PositionInfoView.frame.size.height+8,self.view.frame.size.width, 35)];
    btnJobCategory.tag=10005;
    [btnJobCategory addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [btnJobCategory setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btnJobCategory.backgroundColor=[UIColor clearColor];
    [self.view addSubview:btnJobCategory];
    
    
    UILabel *lblline6=[[UILabel alloc]initWithFrame:CGRectMake(0, lblCategory.frame.origin.y+lblCategory.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline6.layer.borderWidth = 1;
    lblline6.layer.borderColor = LINE_COLOR;
    lblline6.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline6];
    
    //====================================================================
    UILabel *lblPositionName=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline6.frame.origin.y+lblline6.frame.size.height+5,75, 30)];
    lblPositionName.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblPositionName.font=[UIFont boldSystemFontOfSize:15];
    lblPositionName.backgroundColor=[UIColor clearColor];
    lblPositionName.text=@"职位名称:";
    [self.view addSubview:lblPositionName];
    
    txtPositionName=[[UITextField alloc]initWithFrame:CGRectMake(lblPositionName.frame.origin.x+lblPositionName.frame.size.width, lblline6.frame.origin.y+lblline6.frame.size.height+5, self.view.bounds.size.width-80, 30)];
    txtPositionName.font=[UIFont boldSystemFontOfSize:14];
    txtPositionName.backgroundColor=[UIColor clearColor];
    txtPositionName.tag=400;
    txtPositionName.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    txtPositionName.placeholder=@"请输职位名称";
    txtPositionName.delegate=self;
    txtPositionName.keyboardType=UIKeyboardAppearanceDefault;
    txtPositionName.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtPositionName.adjustsFontSizeToFitWidth = YES;
    
    [self.view addSubview:txtPositionName];
    
    UILabel *lblline7=[[UILabel alloc]initWithFrame:CGRectMake(0, lblPositionName.frame.origin.y+lblPositionName.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline7.layer.borderWidth = 1;
    lblline7.layer.borderColor = LINE_COLOR;
    lblline7.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline7];
    
    //====================================================================
    UILabel *lblSalaryl=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline7.frame.origin.y+lblline7.frame.size.height+8, 75, 25)];
    lblSalaryl.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblSalaryl.font=[UIFont boldSystemFontOfSize:15];
    lblSalaryl.backgroundColor=[UIColor clearColor];
    lblSalaryl.text=@"职位薪金:";
    [self.view addSubview:lblSalaryl];
    
    lblSalary=[[UILabel alloc]initWithFrame:CGRectMake(lblSalaryl.frame.origin.x+lblSalaryl.frame.size.width+2,lblSalaryl.frame.origin.y+lblSalaryl.frame.size.height+8, 75, 25)];
    lblSalary.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblSalary.font=[UIFont boldSystemFontOfSize:15];
    lblSalary.backgroundColor=[UIColor clearColor];
    [self.view addSubview:lblSalary];
    
    
    UIImageView *imageSalary=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-30,lblline7.frame.origin.y+lblline7.frame.size.height+8, 25, 25)];
    [imageSalary setImage:[UIImage imageNamed:@"u51"]];
    [self.view addSubview:imageSalary];
    
    UIButton *btnSalary=[[UIButton alloc] initWithFrame:CGRectMake(0,lblline7.frame.origin.y+lblline7.frame.size.height+8,self.view.frame.size.width, 35)];
    btnSalary.tag=10006;
    [btnSalary addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [btnSalary setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btnSalary.backgroundColor=[UIColor clearColor];
    [self.view addSubview:btnSalary];
    
    
    UILabel *lblline8=[[UILabel alloc]initWithFrame:CGRectMake(0, lblSalaryl.frame.origin.y+lblSalaryl.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline8.layer.borderWidth = 1;
    lblline8.layer.borderColor = LINE_COLOR;
    lblline8.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline8];
    
    //====================================================================
    UILabel *lblDescription=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline8.frame.origin.y+lblline8.frame.size.height+8, 75, 25)];
    lblDescription.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblDescription.font=[UIFont boldSystemFontOfSize:15];
    lblDescription.backgroundColor=[UIColor clearColor];
    lblDescription.text=@"职位描述:";
    [self.view addSubview:lblDescription];
    
    lblJobDescription=[[UILabel alloc]initWithFrame:CGRectMake(lblDescription.frame.origin.x+lblDescription.frame.size.width+2,lblDescription.frame.origin.y+lblDescription.frame.size.height+8, 75, 25)];
    lblJobDescription.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblJobDescription.font=[UIFont boldSystemFontOfSize:15];
    lblJobDescription.backgroundColor=[UIColor clearColor];
    [self.view addSubview:lblJobDescription];
    
    
    UIImageView *imageJobDescription=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-30,lblline8.frame.origin.y+lblline8.frame.size.height+8, 25, 25)];
    [imageJobDescription setImage:[UIImage imageNamed:@"u51"]];
    [self.view addSubview:imageJobDescription];
    
    UIButton *btnJobDescription=[[UIButton alloc] initWithFrame:CGRectMake(0,lblline8.frame.origin.y+lblline8.frame.size.height+8,self.view.frame.size.width, 35)];
    btnJobDescription.tag=10007;
    [btnJobDescription addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [btnJobDescription setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btnJobDescription.backgroundColor=[UIColor clearColor];
    [self.view addSubview:btnJobDescription];
    
    UILabel *lblline9=[[UILabel alloc]initWithFrame:CGRectMake(0, lblDescription.frame.origin.y+lblDescription.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline9.layer.borderWidth = 1;
    lblline9.layer.borderColor = LINE_COLOR;
    lblline9.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline9];


    
    //====================================================================
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
-(void)btnClick:(UIButton *)sender{
    switch (sender.tag) {
        case 10003:{
            //行业类型
            IndustryViewController *industry=[[IndustryViewController alloc]init];
            UIBarButtonItem *barBtn=[[UIBarButtonItem alloc]init];
            barBtn.title=@"返回";
            self.navigationItem.backBarButtonItem=barBtn;
           
            [self.navigationController pushViewController:industry animated:YES];
        }
            break;
        case 10004:{
            //公司规模
            CompanySizeViewController *companySize=[[CompanySizeViewController alloc]init];
        }
            break;
        case 10005:{
            //职位类别
            PositionViewController *position=[[PositionViewController alloc]init];
        }
            break;
        case 10006:{
            //职位薪金
            
        }
            break;
        case 10007:{
            //工作描述
        }
            break;
        default:
            break;
    }

}
//点击键盘return键关闭键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    return YES;
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
