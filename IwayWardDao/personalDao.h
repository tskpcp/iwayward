//
//  personalDao.h
//  iwayward
//
//  Created by caopeng on 15/5/31.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "BaseDao.h"

@interface personalDao : BaseDao
#pragma mark -
#pragma mark 项目经历
-(BOOL)insertProjectExperienceUserID:(int)UserID
                            proIndex:(int)ProIndex
                               proID:(int)ProID
                             proName:(NSString *)ProName
                        proBeginDate:(NSString *)ProBeginDate
                          proEndDate:(NSString *)ProEndDate
                             proDesc:(NSString *)ProDesc
                          proDespons:(NSString *)ProDespons;

@end
