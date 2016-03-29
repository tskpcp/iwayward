//
//  AppDelegate.h
//  iwayward
//
//  Created by caopeng on 15/2/27.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "ZWIntroductionViewController.h" 
#import "XHYScrollingNavBarViewController.h"
@interface IwaywardAppDelegate : UIResponder <UIApplicationDelegate>{
    UINavigationController *nav;//导航
}

@property (nonatomic,strong) UIWindow *window;
@property (nonatomic, strong) UINavigationController *nav;

@end

