//
//  StudyExperienceAddViewController.m
//  iwayward
//
//  Created by caopeng on 15/4/15.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "StudyExperienceAddViewController.h"

@interface StudyExperienceAddViewController ()

@end

@implementation StudyExperienceAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=VIEW_BG_COLOR;
    self.title=@"添加学校经历";
    UIBarButtonItem *barBtn=[[UIBarButtonItem alloc]init];
    barBtn.title=@"保存";
    self.navigationItem.rightBarButtonItem=barBtn;
    
    [self initUILayout];

}
-(void)initUILayout{

    UILabel *lblSchool=[[UILabel alloc]initWithFrame:CGRectMake(10,70,75, 30)];
    lblSchool.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblSchool.font=[UIFont boldSystemFontOfSize:15];
    lblSchool.backgroundColor=[UIColor clearColor];
    lblSchool.text=@"学校名称:";
    [self.view addSubview:lblSchool];
    
    txtSchool=[[UITextField alloc]initWithFrame:CGRectMake(lblSchool.frame.origin.x+lblSchool.frame.size.width, 70, self.view.bounds.size.width-80, 30)];
    txtSchool.font=[UIFont boldSystemFontOfSize:14];
    txtSchool.backgroundColor=[UIColor clearColor];
    txtSchool.tag=100;
    txtSchool.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    txtSchool.delegate=self;
    txtSchool.keyboardType=UIKeyboardAppearanceDefault;
    txtSchool.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtSchool.adjustsFontSizeToFitWidth = YES;
    txtSchool.placeholder=@"请输学校名称";
    [self.view addSubview:txtSchool];
    
    UILabel *lblline1=[[UILabel alloc]initWithFrame:CGRectMake(0, lblSchool.frame.origin.y+lblSchool.frame.size.height+5, self.view.bounds.size.width, 1)];
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
    
    
    txtBeginDate=[[UITextField alloc]initWithFrame:CGRectMake(lbleginDate.frame.origin.x+lbleginDate.frame.size.width, lblline1.frame.origin.y+lblline1.frame.size.height+5, self.view.bounds.size.width-80, 30)];
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
    UILabel *lblEducation=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline3.frame.origin.y+lblline3.frame.size.height+5,75, 30)];
    lblEducation.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblEducation.font=[UIFont boldSystemFontOfSize:15];
    lblEducation.backgroundColor=[UIColor clearColor];
    lblEducation.text=@"学   历:";
    [self.view addSubview:lblEducation];
    
    lblEducationText=[[UILabel alloc]initWithFrame:CGRectMake(lblEducation.frame.origin.x+lblEducation.frame.size.width+2,lblline3.frame.origin.y+lblline3.frame.size.height+5, 75, 25)];
    lblEducationText.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblEducationText.font=[UIFont boldSystemFontOfSize:15];
    lblEducationText.backgroundColor=[UIColor clearColor];
    [self.view addSubview:lblEducationText];
    
    
    UIImageView *imageEducation=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-30,lblline3.frame.origin.y+lblline3.frame.size.height+5, 25, 25)];
    [imageEducation setImage:[UIImage imageNamed:@"u51"]];
    [self.view addSubview:imageEducation];
    
    UIButton *btnEducation=[[UIButton alloc] initWithFrame:CGRectMake(0,lblline3.frame.origin.y+lblline3.frame.size.height+5,self.view.frame.size.width, 35)];
    btnEducation.tag=10000;
    [btnEducation addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [btnEducation setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btnEducation.backgroundColor=[UIColor clearColor];
    [self.view addSubview:btnEducation];
    
    
    UILabel *lblline4=[[UILabel alloc]initWithFrame:CGRectMake(0, lblEducation.frame.origin.y+lblEducation.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline4.layer.borderWidth = 1;
    lblline4.layer.borderColor = LINE_COLOR;
    lblline4.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline4];
    //================================================
    UILabel *lblProfessional=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline4.frame.origin.y+lblline4.frame.size.height+5,75, 30)];
    lblProfessional.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblProfessional.font=[UIFont boldSystemFontOfSize:15];
    lblProfessional.backgroundColor=[UIColor clearColor];
    lblProfessional.text=@"专   业:";
    [self.view addSubview:lblProfessional];
    
    lblProfessionalText=[[UILabel alloc]initWithFrame:CGRectMake(lblProfessional.frame.origin.x+lblProfessional.frame.size.width+2,lblline3.frame.origin.y+lblline3.frame.size.height+5, 75, 25)];
    lblProfessionalText.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblProfessionalText.font=[UIFont boldSystemFontOfSize:15];
    lblProfessionalText.backgroundColor=[UIColor clearColor];
    [self.view addSubview:lblProfessionalText];
    
    
    UIImageView *imageProfessional=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-30,lblline4.frame.origin.y+lblline4.frame.size.height+5, 25, 25)];
    [imageProfessional setImage:[UIImage imageNamed:@"u51"]];
    [self.view addSubview:imageProfessional];
    
    UIButton *btnProfessional=[[UIButton alloc] initWithFrame:CGRectMake(0,lblline4.frame.origin.y+lblline4.frame.size.height+5,self.view.frame.size.width, 35)];
    btnProfessional.tag=10001;
    [btnProfessional addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [btnProfessional setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btnProfessional.backgroundColor=[UIColor clearColor];
    [self.view addSubview:btnProfessional];
    
    
    UILabel *lblline5=[[UILabel alloc]initWithFrame:CGRectMake(0, lblProfessional.frame.origin.y+lblProfessional.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline5.layer.borderWidth = 1;
    lblline5.layer.borderColor = LINE_COLOR;
    lblline5.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline5];
    //================================================
    UILabel *lblProfessionalDdescription=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline5.frame.origin.y+lblline5.frame.size.height+5,75, 30)];
    lblProfessionalDdescription.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblProfessionalDdescription.font=[UIFont boldSystemFontOfSize:15];
    lblProfessionalDdescription.backgroundColor=[UIColor clearColor];
    lblProfessionalDdescription.text=@"专业描述:";
    [self.view addSubview:lblProfessionalDdescription];
    
    lblProfessionalDdescriptiontext=[[UILabel alloc]initWithFrame:CGRectMake(lblProfessionalDdescription.frame.origin.x+lblProfessionalDdescription.frame.size.width+2,lblline3.frame.origin.y+lblline3.frame.size.height+5, 75, 25)];
    lblProfessionalDdescriptiontext.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblProfessionalDdescriptiontext.font=[UIFont boldSystemFontOfSize:15];
    lblProfessionalDdescriptiontext.backgroundColor=[UIColor clearColor];
    [self.view addSubview:lblProfessionalDdescriptiontext];
    
    
    UIImageView *imageProfessionalDdescription=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-30,lblline5.frame.origin.y+lblline5.frame.size.height+5, 25, 25)];
    [imageProfessionalDdescription setImage:[UIImage imageNamed:@"u51"]];
    [self.view addSubview:imageProfessionalDdescription];
    
    UIButton *btnProfessionalDdescription=[[UIButton alloc] initWithFrame:CGRectMake(0,lblline5.frame.origin.y+lblline5.frame.size.height+5,self.view.frame.size.width, 35)];
    btnProfessionalDdescription.tag=10002;
    [btnProfessionalDdescription addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [btnProfessionalDdescription setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btnProfessionalDdescription.backgroundColor=[UIColor clearColor];
    [self.view addSubview:btnProfessionalDdescription];
    
    
    UILabel *lblline6=[[UILabel alloc]initWithFrame:CGRectMake(0, lblProfessionalDdescription.frame.origin.y+lblProfessionalDdescription.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline6.layer.borderWidth = 1;
    lblline6.layer.borderColor = LINE_COLOR;
    lblline6.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline6];
    //================================================
    UILabel *lblOverseasStudy=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline6.frame.origin.y+lblline6.frame.size.height+5,75, 30)];
    lblOverseasStudy.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblOverseasStudy.font=[UIFont boldSystemFontOfSize:15];
    lblOverseasStudy.backgroundColor=[UIColor clearColor];
    lblOverseasStudy.text=@"海外经历:";
    [self.view addSubview:lblOverseasStudy];
    
    swOverseasStudy =[[ZJSwitch alloc] initWithFrame:CGRectMake(lblOverseasStudy.frame.origin.x+lblOverseasStudy.frame.size.width+10, lblline6.frame.origin.y+6, 80, 30)];
    swOverseasStudy.backgroundColor = [UIColor clearColor];
    swOverseasStudy.tintColor = [UIColor orangeColor];
    swOverseasStudy.tag=1000;
    swOverseasStudy.on=YES;
    swOverseasStudy.onText = @"是";
    swOverseasStudy.offText = @"否";
    [swOverseasStudy addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:swOverseasStudy];
    
    UILabel *lblline7=[[UILabel alloc]initWithFrame:CGRectMake(0, lblOverseasStudy.frame.origin.y+lblOverseasStudy.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline7.layer.borderWidth = 1;
    lblline7.layer.borderColor = LINE_COLOR;
    lblline7.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline7];
    //================================================
    UILabel *lblStudentAward=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline7.frame.origin.y+lblline7.frame.size.height+5,75, 30)];
    lblStudentAward.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblStudentAward.font=[UIFont boldSystemFontOfSize:15];
    lblStudentAward.backgroundColor=[UIColor clearColor];
    lblStudentAward.text=@"学校奖励:";
    [self.view addSubview:lblStudentAward];
    
    lblStudentAwardtext=[[UILabel alloc]initWithFrame:CGRectMake(lblStudentAward.frame.origin.x+lblStudentAward.frame.size.width+2,lblline7.frame.origin.y+lblline7.frame.size.height+5, 75, 25)];
    lblStudentAwardtext.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblStudentAwardtext.font=[UIFont boldSystemFontOfSize:15];
    lblStudentAwardtext.backgroundColor=[UIColor clearColor];
    [self.view addSubview:lblStudentAwardtext];
    
    
    UIImageView *imageStudentAward=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-30,lblline7.frame.origin.y+lblline7.frame.size.height+5, 25, 25)];
    [imageStudentAward setImage:[UIImage imageNamed:@"u51"]];
    [self.view addSubview:imageStudentAward];
    
    UIButton *btnStudentAward=[[UIButton alloc] initWithFrame:CGRectMake(0,lblline7.frame.origin.y+lblline7.frame.size.height+5,self.view.frame.size.width, 35)];
    btnStudentAward.tag=10003;
    [btnStudentAward addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [btnStudentAward setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btnStudentAward.backgroundColor=[UIColor clearColor];
    [self.view addSubview:btnStudentAward];
    
    
    UILabel *lblline8=[[UILabel alloc]initWithFrame:CGRectMake(0, lblStudentAward.frame.origin.y+lblStudentAward.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline8.layer.borderWidth = 1;
    lblline8.layer.borderColor = LINE_COLOR;
    lblline8.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline8];

    //================================================
    UILabel *lblschoolOffice=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline8.frame.origin.y+lblline8.frame.size.height+5,75, 30)];
    lblschoolOffice.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblschoolOffice.font=[UIFont boldSystemFontOfSize:15];
    lblschoolOffice.backgroundColor=[UIColor clearColor];
    lblschoolOffice.text=@"校内职务:";
    [self.view addSubview:lblschoolOffice];
    
    lblschoolOfficetext=[[UILabel alloc]initWithFrame:CGRectMake(lblschoolOffice.frame.origin.x+lblschoolOffice.frame.size.width+2,lblline7.frame.origin.y+lblline7.frame.size.height+5, 75, 25)];
    lblschoolOfficetext.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblschoolOfficetext.font=[UIFont boldSystemFontOfSize:15];
    lblschoolOfficetext.backgroundColor=[UIColor clearColor];
    [self.view addSubview:lblschoolOfficetext];
    
    
    UIImageView *imageschoolOffice=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-30,lblline8.frame.origin.y+lblline8.frame.size.height+5, 25, 25)];
    [imageschoolOffice setImage:[UIImage imageNamed:@"u51"]];
    [self.view addSubview:imageschoolOffice];
    
    UIButton *btnschoolOffice=[[UIButton alloc] initWithFrame:CGRectMake(0,lblline8.frame.origin.y+lblline8.frame.size.height+5,self.view.frame.size.width, 35)];
    btnschoolOffice.tag=10004;
    [btnschoolOffice addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [btnschoolOffice setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btnschoolOffice.backgroundColor=[UIColor clearColor];
    [self.view addSubview:btnschoolOffice];
    
    
    UILabel *lblline9=[[UILabel alloc]initWithFrame:CGRectMake(0, lblschoolOffice.frame.origin.y+lblschoolOffice.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline9.layer.borderWidth = 1;
    lblline9.layer.borderColor = LINE_COLOR;
    lblline9.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline9];
    //================================================
    UILabel * lblPracticalExperience=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline9.frame.origin.y+lblline9.frame.size.height+5,75, 30)];
     lblPracticalExperience.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
      lblPracticalExperience.font=[UIFont boldSystemFontOfSize:15];
     lblPracticalExperience.backgroundColor=[UIColor clearColor];
     lblPracticalExperience.text=@"实践经验:";
    [self.view addSubview: lblPracticalExperience];
    
    lblPracticalExperiencetext=[[UILabel alloc]initWithFrame:CGRectMake(lblPracticalExperience.frame.origin.x+lblPracticalExperience.frame.size.width+2,lblline7.frame.origin.y+lblline7.frame.size.height+5, 75, 25)];
    lblPracticalExperiencetext.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblPracticalExperiencetext.font=[UIFont boldSystemFontOfSize:15];
    lblPracticalExperiencetext.backgroundColor=[UIColor clearColor];
    [self.view addSubview:lblPracticalExperiencetext];
    
    
    UIImageView *imageracticalExperience=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-30,lblline9.frame.origin.y+lblline9.frame.size.height+5, 25, 25)];
    [imageracticalExperience setImage:[UIImage imageNamed:@"u51"]];
    [self.view addSubview:imageracticalExperience];
    
    UIButton *btnracticalExperience=[[UIButton alloc] initWithFrame:CGRectMake(0,lblline9.frame.origin.y+lblline9.frame.size.height+5,self.view.frame.size.width, 35)];
    btnracticalExperience.tag=10004;
    [btnracticalExperience addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [btnracticalExperience setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btnracticalExperience.backgroundColor=[UIColor clearColor];
    [self.view addSubview:btnracticalExperience];
    
    
    UILabel *lblline10=[[UILabel alloc]initWithFrame:CGRectMake(0, lblPracticalExperience.frame.origin.y+lblPracticalExperience.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline10.layer.borderWidth = 1;
    lblline10.layer.borderColor = LINE_COLOR;
    lblline10.backgroundColor=LINE_BG_COLOR;
    [self.view addSubview:lblline10];


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
  
}
-(void)valueChanged:(id)sender{}
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
