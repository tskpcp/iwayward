//
//  IndustryInfoViewController.h
//  iwayward
//
//  Created by caopeng on 15/6/6.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
@interface IndustryInfoViewController : UIViewController{
    NSInteger *industryIndex;
}
@property(assign)NSInteger *industryIndex;

-(void)initDataSource;
-(void)btnClick:(UIButton *)sender;
@end
