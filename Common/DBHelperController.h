//
//  DBHelperController.h
//  uitabletest
//
//  Created by Dai Daly on 12-3-8.
//  Copyright (c) 2012年 Jinher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
@interface DBHelperController : NSObject{
    FMDatabase *db;
    BOOL isInitDatabase;  //是否初始化数据库，如果是，则初始化表结构；
}
-(BOOL)initDatabase;
-(void)closeDatabase;
-(FMDatabase *)getDatabase;
-(void)initTable;

@end
