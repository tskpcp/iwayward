//
//  IndustryViewController.h
//  iwayward
//
//  Created by caopeng on 15/4/3.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "IndustryInfoViewController.h"
@interface IndustryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
     UITableView *IndustryTableView;
}
-(void)initDataSource;
@end
