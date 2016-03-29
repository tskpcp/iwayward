//
//  PositionViewController.h
//  iwayward
//
//  Created by caopeng on 15/4/4.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "CommonHelper.h"
#import "PositionInfoViewController.h"

@interface PositionViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    UITableView *PositonTableView;
}

@end
