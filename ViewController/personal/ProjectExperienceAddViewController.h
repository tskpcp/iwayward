//
//  ProjectExperienceAddViewController.h
//  iwayward
//
//  Created by caopeng on 15/4/12.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "ProDescViewController.h"
#import "ProResponsViewController.h"
#import "CustomViewSet.h"
#import "personalDao.h"
#import "personalModel.h"
#import "Toast+UIView.h"
@interface ProjectExperienceAddViewController : UIViewController<UITextFieldDelegate>{
    UIToolbar *toolBarfData;
    UIBarButtonItem *fexibleSpace;
    UITextField *txtProjectName;
    UITextField *txtBeginDate;
    UIDatePicker *BeginDateDataPicker;
    UITextField *txtEndDate;
    UIDatePicker *EndDateDataPicker;
    UILabel *lblProjectDescription;
    UILabel *lblResponsibilitydDescription;
    
    personalDao *perdao;

    
}
-(void)initUILayout;
-(void)btnClick:(UIButton *)sender;
-(void)PickerSelect:(UIBarButtonItem *)sender;
-(void)btnRightAction:(UIBarButtonItem *)sender;
//注册通知函数
-(void)proDescData:(NSNotification *)readArray;
-(void)proRespData:(NSNotification *)readArray;
@end
