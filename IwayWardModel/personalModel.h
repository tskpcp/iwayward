//
//  personalModel.h
//  iwayward
//
//  Created by caopeng on 15/5/31.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface personalModel : NSObject{
    int index;
#pragma mark -
#pragma mark 项目经历
    int userID;
    int proIndex;
    int proID;
    NSString *proName;
    NSString *proBeginDate;
    NSString *proEndDate;
    NSString *proDesc;
    NSString *proDespons;
    
#pragma mark-
#pragma mark 我的信息
    
#pragma mark-
#pragma mark 学习经历
    
#pragma mark-
#pragma mark 个人简介
    
#pragma mark-
#pragma mark 招聘职位
    
#pragma mark-
#pragma mark 求职记录
    
#pragma mark-
#pragma mark 我的经历


}
#pragma mark -
#pragma mark 项目经历
@property(nonatomic,strong)NSString *proName;
@property(nonatomic,strong)NSString *proBeginDate;
@property(nonatomic,strong)NSString *proEndDate;
@property(nonatomic,strong)NSString *proDesc;
@property(nonatomic,strong)NSString *proDespons;
-(id)initProjectExperienceWithIndex:(int)pro_index
                             userID:(int)pro_userID
                           proIndex:(int)ProIndex
                              proID:(int)ProID
                            proName:(NSString *)ProName
                       proBeginDate:(NSString *)ProBeginDate
                         proEndDate:(NSString *)ProEndDate
                            proDesc:(NSString *)ProDesc
                         proDespons:(NSString *)ProDespons;

@end
