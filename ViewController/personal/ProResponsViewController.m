//
//  ProResponsViewController.m
//  iwayward
//
//  Created by caopeng on 15/5/31.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "ProResponsViewController.h"

@interface ProResponsViewController ()
@property(nonatomic,strong)NSString *strProRespon;
-(void)btnRightAction:(UIBarButtonItem *)sender;
@end

@implementation ProResponsViewController
@synthesize strProRespon=_strProRespon;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=VIEW_BG_COLOR;
    self.title=@"责任描述";
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action: @selector(btnRightAction:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    proResponsTxtView=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2)];
    proResponsTxtView.layer.cornerRadius = 6;
    proResponsTxtView.layer.borderWidth = 1;
    proResponsTxtView.layer.borderColor = LINE_COLOR;
    proResponsTxtView.textColor=[UIColor grayColor];
    proResponsTxtView.font=[UIFont fontWithName:@"Arial" size:16];
    proResponsTxtView.returnKeyType=UIReturnKeyDone;
    proResponsTxtView.text=@"请输入责任描述";
    proResponsTxtView.delegate=self;
    [self.view addSubview:proResponsTxtView];
    
}
-(void)btnRightAction:(UIBarButtonItem *)sender{
    _strProRespon=proResponsTxtView.text;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"proRespData"  object:_strProRespon];
    [self.navigationController popViewControllerAnimated:YES];

}
#pragma mark -
#pragma mark UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    if([text isEqualToString:@"\n"]){
        [textView resignFirstResponder];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:0.3];
        [UIView commitAnimations];
        return NO;
    }
    if([text length]==0)
    {
        return YES;
    }
    return YES;
}
#pragma mark -
#pragma mark 设置textView获取焦点事件后，内容显示形式
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    if([textView.text isEqualToString:@"请输入责任描述"]){
        textView.text=@"";
    }
    return YES;
}
-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    if([textView.text length]>0){
        textView.textColor=[UIColor blackColor];
    }else{
        textView.text=@"请输入责任描述";
        textView.textColor=[UIColor grayColor];
    }
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
