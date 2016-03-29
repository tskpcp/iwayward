//
//  personalDao.m
//  iwayward
//
//  Created by caopeng on 15/5/31.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "personalDao.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"

#define PROJECTEXPRIENCE @"projectExperience"

@implementation personalDao
#pragma mark -
#pragma mark 项目经历
-(BOOL)insertProjectExperienceUserID:(int)UserID
                            proIndex:(int)ProIndex
                               proID:(int)ProID
                             proName:(NSString *)ProName
                        proBeginDate:(NSString *)ProBeginDate
                          proEndDate:(NSString *)ProEndDate
                             proDesc:(NSString *)ProDesc
                          proDespons:(NSString *)ProDespons{
    
    BOOL isRet=NO;
   

   [db executeUpdate:[NSString stringWithFormat:@"INSERT INTO projectExperience (UserID,proIndex,proID,proName,proBeginDate,proEndDate,proDesc,proDespons) VALUES ('%i','%i','%i','%@','%@','%@','%@','%@')",UserID,ProIndex,ProID,ProName,ProBeginDate,ProEndDate,ProDesc,ProDespons]];
    isRet=YES;
    if ([db hadError]) {
        isRet=NO;
        NSLog(@"Err %d: %@",[db lastErrorCode],[db lastErrorMessage]);
    }
    return isRet;

}
@end
