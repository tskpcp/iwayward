//
//  ProDescViewController.m
//  iwayward
//
//  Created by caopeng on 15/5/31.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "ProDescViewController.h"

@interface ProDescViewController ()
@property(nonatomic,strong)NSString *strProDesc;
-(void)btnRightAction:(UIBarButtonItem *)sender;
@end

@implementation ProDescViewController
@synthesize strProDesc=_strProDesc;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=VIEW_BG_COLOR;
    self.title=@"项目描述";
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action: @selector(btnRightAction:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    prDescTxtView=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2)];
    prDescTxtView.layer.cornerRadius = 6;
    prDescTxtView.layer.borderWidth = 1;
    prDescTxtView.layer.borderColor = LINE_COLOR;
    prDescTxtView.textColor=[UIColor grayColor];
    prDescTxtView.font=[UIFont fontWithName:@"Arial" size:16];
    prDescTxtView.returnKeyType=UIReturnKeyDone;
    prDescTxtView.text=@"请输入项目描述";
    prDescTxtView.delegate=self;
    [self.view addSubview:prDescTxtView];
}
-(void)btnRightAction:(UIBarButtonItem *)sender{
    _strProDesc=prDescTxtView.text;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"proDescData"  object:_strProDesc];
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
    if([textView.text isEqualToString:@"请输入项目描述"]){
        textView.text=@"";
    }
    return YES;
}
-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    if([textView.text length]>0){
        textView.textColor=[UIColor blackColor];
    }else{
        textView.text=@"请输入项目描述";
        textView.textColor=[UIColor grayColor];
    }
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
