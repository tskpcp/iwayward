//
//  PersonalInfoViewController.h
//  iwayward
//
//  Created by caopeng on 15/3/15.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "ZJSwitch.h"
#import "IndustryViewController.h"
#import "PositionViewController.h"
#import "EducationViewController.h"
#import "CommonHelper.h"
#import "sqlService.h"
@interface PersonalInfoViewController : UIViewController<UIScrollViewDelegate,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>{

    
    UIToolbar *toolBarfData;
    UIBarButtonItem *fexibleSpace;
    
    
    UIScrollView *sv;
    int iYCenter;
    
    UITextField *txtName;
    
    
    UITextField *txtRickName;
    //个人签名
   // UITextField *txtPersonalSignature;
    
    ZJSwitch    *swGender;
    
    
    UITextField *txtAge;
    
    
    UITextField *txtBirth;

   
    
    UITextField *txtContactTelephoneNumber;
    
    
    UITextField *txtMailbox;
    
    

    
    UITextField *txtProvince;
    
    UITextField *txtArea;
    
/*
    
    UITextField *txtNoQQ;
    
    UITextField *txtSinaMicroBlog;
    
    UITextField *txtTencentMicroBlog;
    
    UITextField *txtBaiduAccount;
    
    UITextField *txtMicroSignal;
    
*/
    
    //城市选择
    UIPickerView *cityPicker;
    UIToolbar *cityToolBarfData;
    UIBarButtonItem *cityFexibleSpace;
    NSString *proviceStr,*cityStr,*regionStr;
    int intProvice,intCity,intRegion;
    
    UILabel *lblEducationText;
    
    double _SCREEN_HEIGHT1;

}

-(void)initUILayout;
-(void)initDataSource;
-(void)btnClick:(UIButton *)sender;
-(void)valueChanged:(id)sender;
-(void)PickerSelect:(UIBarButtonItem *)sender;
-(void)selectLeftAction:(UIBarButtonItem *)sender;
-(void)educationData:(NSNotification *)readArray;
@end
