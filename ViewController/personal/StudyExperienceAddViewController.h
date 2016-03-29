//
//  StudyExperienceAddViewController.h
//  iwayward
//
//  Created by caopeng on 15/4/15.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "ZJSwitch.h"
@interface StudyExperienceAddViewController : UIViewController<UITextFieldDelegate>{

    UIToolbar *toolBarfData;
    UIBarButtonItem *fexibleSpace;
    
    //学校
    UITextField *txtSchool;
    //
    UITextField *txtBeginDate;
    UIDatePicker *BeginDateDataPicker;
    //
    UITextField *txtEndDate;
    UIDatePicker *EndDateDataPicker;
    //学历
    UILabel *lblEducationText;
    //专业
    UILabel *lblProfessionalText;

    //专业描述
    UILabel *lblProfessionalDdescriptiontext;
    //海外学习
    ZJSwitch    *swOverseasStudy;
    //学生奖励
    UILabel *lblStudentAwardtext;
    //校内职务
    UILabel *lblschoolOfficetext;
    //实践经验
    UILabel *lblPracticalExperiencetext;
    
}
-(void)initUILayout;
-(void)PickerSelect:(UIBarButtonItem *)sender;
-(void)btnClick:(UIButton *)sender;
-(void)valueChanged:(id)sender;

@end
