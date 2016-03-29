//
//  TSKPCPTabBarViewController.m
//  iwayward
//
//  Created by caopeng on 15/3/15.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "TSKPCPTabBarView.h"

@interface TSKPCPTabBarView ()

@end

@implementation TSKPCPTabBarView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setFrame:frame];
        
        [self layoutView];
    }
    return self;
}

-(void)layoutView
{

    integer_t _width=iPhone6_WIDTH;
    
    if([[UIDevice getPlatformString] isEqualToString:@"iPhone 6"]){

        _width=iPhone6_WIDTH;
        
        
    }
    
    if([[UIDevice getPlatformString] isEqualToString:@"iPhone 6 Plus"]){

        _width=iPhone6_plus_WIDHT;
        
    }
    if([[UIDevice getPlatformString] isEqualToString:@"iPhone 5S"]||[[UIDevice getPlatformString] isEqualToString:@"iPhone 5"]||[[UIDevice getPlatformString] isEqualToString:@"iPhone 5C"]){

        _width=iPhone5_WIDTH;
        
    }
    if([[UIDevice getPlatformString] isEqualToString:@"iPhone 4"]||[[UIDevice getPlatformString] isEqualToString:@"iPhone 4S"]){
        
    }
    _tabbarView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"diary_bg"]];
    [_tabbarView setFrame:CGRectMake(0, 10, _width, 51)];
    [_tabbarView setContentMode:UIViewContentModeScaleToFill];
    [_tabbarView setUserInteractionEnabled:YES];
    [self addSubview:_tabbarView];
    
    
    [self layoutBtn];
    
}

-(void)layoutBtn
{
   
    integer_t _x=iPhone6_FIST_X;
    integer_t _width=iPhone6_WIDTH;
    
    if([[UIDevice getPlatformString] isEqualToString:@"iPhone 6"]){
        _x=iPhone6_FIST_X;
        _width=iPhone6_WIDTH;
        
        
    }
    
    if([[UIDevice getPlatformString] isEqualToString:@"iPhone 6 Plus"]){
        _x=iPhone6_plus_FIST_X;
        _width=iPhone6_plus_WIDHT;
     
    }
    if([[UIDevice getPlatformString] isEqualToString:@"iPhone 5S"]||[[UIDevice getPlatformString] isEqualToString:@"iPhone 5"]||[[UIDevice getPlatformString] isEqualToString:@"iPhone 5C"]){
        _x=iPhone5_FIST_X;
        _width=iPhone5_WIDTH;
       
    }
    if([[UIDevice getPlatformString] isEqualToString:@"iPhone 4"]||[[UIDevice getPlatformString] isEqualToString:@"iPhone 4S"]){
    
    }
    
    //服务
    _button_1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button_1 setFrame:CGRectMake(_x, TABBAR_IMAGE_Y, TABBAR_IMAGE_WIDTH, TABBAR_IMAGE_HEIGHT)];
    [_button_1 setTag:101];
    [_button_1 setBackgroundImage:[UIImage imageNamed:@"call_delete_nor"] forState:UIControlStateNormal];
    [_button_1 setBackgroundImage:[UIImage imageNamed:@"call_delete_click"] forState:UIControlStateHighlighted];
    [_button_1 addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    //发现
    _button_2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button_2 setFrame:CGRectMake(_x*3+TABBAR_IMAGE_WIDTH, TABBAR_IMAGE_Y, TABBAR_IMAGE_WIDTH, TABBAR_IMAGE_HEIGHT)];
    [_button_2 setTag:102];
    [_button_2 setBackgroundImage:[UIImage imageNamed:@"call_collect_nor"] forState:UIControlStateNormal];
    [_button_2 setBackgroundImage:[UIImage imageNamed:@"call_collect_click"] forState:UIControlStateHighlighted];
    [_button_2 addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
//消息
    _button_3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button_3 setFrame:CGRectMake(_x*5+TABBAR_IMAGE_WIDTH*2, TABBAR_IMAGE_Y, TABBAR_IMAGE_WIDTH, TABBAR_IMAGE_HEIGHT)];
    [_button_3 setTag:103];
    [_button_3 setBackgroundImage:[UIImage imageNamed:@"call_forward_nor"] forState:UIControlStateNormal];
    [_button_3 setBackgroundImage:[UIImage imageNamed:@"call_forward_click"] forState:UIControlStateHighlighted];
    [_button_3 addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
//联系人
    _button_4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button_4 setFrame:CGRectMake(_x*7+TABBAR_IMAGE_WIDTH*3, TABBAR_IMAGE_Y, TABBAR_IMAGE_WIDTH, TABBAR_IMAGE_HEIGHT)];
    [_button_4 setTag:104];
    [_button_4 setBackgroundImage:[UIImage imageNamed:@"call_haseread_nor"] forState:UIControlStateNormal];
    [_button_4 setBackgroundImage:[UIImage imageNamed:@"call_haseread_click"] forState:UIControlStateHighlighted];
    [_button_4 addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    //个人

    _button_5=[UIButton buttonWithType:UIButtonTypeCustom];
    [_button_5 setFrame:CGRectMake(_x*9+TABBAR_IMAGE_WIDTH*4, TABBAR_IMAGE_Y, TABBAR_IMAGE_WIDTH, TABBAR_IMAGE_HEIGHT)];
    [_button_5 setTag:105];
    [_button_5 setBackgroundImage:[UIImage imageNamed:@"call_replyall_nor"] forState:UIControlStateNormal];
    [_button_5 setBackgroundImage:[UIImage imageNamed:@"call_replyall_click"] forState:UIControlStateHighlighted];
    [_button_5 addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    NSString *tabIndex=[CommonHelper getConfigFieldValue:@"tabbarIndex"];
    NSLog(@"Tindex=%i",[tabIndex intValue]);
    switch ([tabIndex intValue]) {
            //服务
        case 0:{
            [_button_1 setBackgroundImage:[UIImage imageNamed:@"call_delete_click"] forState:UIControlStateNormal];

          break;
                   }
            
            
            //发现
        case 1:{
            [_button_2 setBackgroundImage:[UIImage imageNamed:@"call_collect_click"] forState:UIControlStateNormal];
             break;
        }
            
           
            //消息
        case 2:{
            [_button_3 setBackgroundImage:[UIImage imageNamed:@"call_forward_click"] forState:UIControlStateNormal];
             break;
            
        }
            
           
            //联系人
        case 3:{
            [_button_4 setBackgroundImage:[UIImage imageNamed:@"call_haseread_click"] forState:UIControlStateNormal];

            break;
        }
            
            
            //个人
        case 4:{
            [_button_5 setBackgroundImage:[UIImage imageNamed:@"call_replyall_click"] forState:UIControlStateNormal];

           
             break;
        }
            
           
    }
    [_tabbarView addSubview:_button_1];
    [_tabbarView addSubview:_button_2];
    [_tabbarView addSubview:_button_3];
    [_tabbarView addSubview:_button_4];
    [_tabbarView addSubview:_button_5];
    
}

-(void)btn1Click:(id)sender
{
    UIButton *btn = (UIButton *)sender;
        
    switch (btn.tag) {
        case 101:
        {
           // NSLog(@"101");
           // [_button_1 setBackgroundImage:[UIImage imageNamed:@"call_delete_click"] forState:UIControlStateNormal];

            [self.delegate touchBtnAtIndex:0];
            break;
        }
        case 102:
        {
            //NSLog(@"102");
           // [_button_2 setBackgroundImage:[UIImage imageNamed:@"call_collect_click"] forState:UIControlStateNormal];
            [self.delegate touchBtnAtIndex:1];
            
            break;
        }
        case 103:{
           // NSLog(@"103");
           // [_button_3 setBackgroundImage:[UIImage imageNamed:@"call_forward_click"] forState:UIControlStateNormal];
            [self.delegate touchBtnAtIndex:2];
            
            break;}
        case 104:{
           // NSLog(@"104");
           // [_button_4 setBackgroundImage:[UIImage imageNamed:@"call_haseread_click"] forState:UIControlStateNormal];
            [self.delegate touchBtnAtIndex:3];
            
            break;}
        case 105:{
           // NSLog(@"105");
           // [_button_5 setBackgroundImage:[UIImage imageNamed:@"call_replyall_click"] forState:UIControlStateNormal];

            [self.delegate touchBtnAtIndex:4];
            break;}

        default:
            break;
    }
}

@end
