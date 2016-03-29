//
//  PersonalMyCollectionViewController.h
//  iwayward
//
//  Created by caopeng on 15/3/29.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
@interface PersonalMyCollectionViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{

    UITableView *tempTbleView;
    
    //收藏的职位
    UITableView *CollectionResumeTableView;
    //收藏的简历
    UITableView *PostCollectionTableView;
    

}
-(void)initUILayout;
@end
