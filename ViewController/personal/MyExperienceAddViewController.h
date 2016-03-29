//
//  MyExperienceAddViewController.h
//  iwayward
//
//  Created by caopeng on 15/4/12.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "IndustryViewController.h"
#import "PositionViewController.h"
#import "CompanySizeViewController.h"
@interface MyExperienceAddViewController : UIViewController<UITextFieldDelegate>{
    UIToolbar *toolBarfData;
    UIBarButtonItem *fexibleSpace;
    UITextField *txtComanyName;
    
    UITextField *txtBeginDate;
    UIDatePicker *BeginDateDataPicker;
    UITextField *txtEndDate;
    UIDatePicker *EndDateDataPicker;
    
    UILabel *lblIndustryCategory;
    UILabel *lblCompanySize;
    UILabel *lblJobCategory;
    UITextField *txtPositionName;
    UILabel *lblSalary;
    UILabel *lblJobDescription;
}
-(void)initUILayout;
-(void)btnClick:(UIButton *)sender;
-(void)PickerSelect:(UIBarButtonItem *)sender;
@end
