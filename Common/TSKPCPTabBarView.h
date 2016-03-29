//
//  TSKPCPTabBarViewController.h
//  iwayward
//
//  Created by caopeng on 15/3/15.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "MainViewController.h"
#import "UIDevice+DeviceType.h"
#import "CommonHelper.h"

@interface TSKPCPTabBarView : UIView{
   
}
@property(nonatomic,strong) UIImageView *tabbarView;


@property(nonatomic,strong) UIButton *button_1;
@property(nonatomic,strong) UIButton *button_2;
@property(nonatomic,strong) UIButton *button_3;
@property(nonatomic,strong) UIButton *button_4;
@property(nonatomic,strong) UIButton *button_5;
@property(nonatomic,weak) id<TSKPCPTabBarDelegate> delegate;


@end
