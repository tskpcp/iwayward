//
//  PositionInfoViewController.h
//  iwayward
//
//  Created by caopeng on 15/7/18.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
@interface PositionInfoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    UITableView *PositonInfoTableView;
    
    NSInteger *positionIndexSection;
    NSInteger *positionIndexRow;
}
@property(assign)NSInteger *positionIndexSection;
@property(assign)NSInteger *positionIndexRow;

-(void)btnClick:(UIButton *)sender;
@end
