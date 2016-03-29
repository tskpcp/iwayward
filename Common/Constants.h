/*
 *  Constants.h
 *  Dyrs
 *
 *  Created by Wang Shuguang on 11-12-24.
 *  Copyright 2011 Jinher Software. All rights reserved.
 *
 */

#pragma mark -
#pragma mark UIViewTag常量集合

#define CUSTOMNAVIGATIONBARBG_VIEWTAG 11
#define LOADING_MASK_VIEWTAG 9999912
#define PHOTO_MASK 13
#define ROOT_VIEW 14


#pragma mark -
#pragma mark 系统常用配置
#define NETWORK_TIMEOUT 45
#define PHOTOSIZE CGSizeMake(98,98)
#define PHOTOSPACE 6
#define LIST_DEFAULT_NUM  20

#pragma mark-
#pragma mark tabbar 宽高
#define TABBAR_IMAGE_WIDTH 40
#define TABBAR_IMAGE_HEIGHT 40
#define TABBAR_IMAGE_Y 10


#pragma mark-
#pragma mark 公共常量
#pragma mark 视图背景色
#define VIEW_BG_COLOR [UIColor colorWithRed:252.0/255.0 green:252.0/255.0 blue:252.0/255.0 alpha:1.0]

#pragma mark 横线颜色
#define LINE_COLOR [UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1].CGColor
#define LINE_BG_COLOR [UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0]
#pragma mark 清除颜色
#define DCLEAR_COLOR [UIColor clearColor]

#pragma mark 文本框颜色
#define TEXT_COLOR [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]


#pragma mark-
#pragma mark iphone4.0
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(320, 480), [[UIScreen mainScreen] currentMode].size) : 0)
#define iPhone4_WIDTH 320
#define iPhone4_HEIGHT 480
#define iPhone4_addHeight 88


#pragma mark-
#pragma mark iphone5.0
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : 0)
#define iPhone5_WIDTH 320
#define iPhone5_HEIGHT 568
#define iPhone5_FIST_X 12
#define addHeight 88




#pragma mark-
#pragma mark iphone6.0
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currenMode)]?CGSizeEqualToSize(CGSizeMake(750,1334),[[UIScreen mainScreen] currentMode].size):0)
#define iPhone6_HEIGHT 667
#define iPhone6_WIDTH 375
#define iPhone6_FIST_X 17.5

#pragma mark-
#pragma mark iphone6.0 plus
#define iPhone6plus ([UIScreen instancesRespondToSelector:@selector(currenMode)]?CGSizeEqualToSize(CGSizeMake(1080,1920),[[UIScreen mainScreen]currentMode].size):0)
#define iPhone6_plus_WIDHT 414
#define iPhone6_plus_HEIGHT 736
#define iPhone6_plus_FIST_X 21.4


#pragma mark-
#pragma mark other
#define SELECTED_VIEW_CONTROLLER_TAG 98456345
#define NUMBERS @"0123456789\n"
