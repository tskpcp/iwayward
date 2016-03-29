//
//  personalModel.m
//  iwayward
//
//  Created by caopeng on 15/5/31.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "personalModel.h"

@implementation personalModel
#pragma mark -
#pragma mark 项目经历
@synthesize proName,proBeginDate,proEndDate,proDesc,proDespons;
-(id)initProjectExperienceWithIndex:(int)pro_index
                             userID:(int)pro_userID
                           proIndex:(int)ProIndex
                              proID:(int)ProID
                            proName:(NSString *)ProName
                       proBeginDate:(NSString *)ProBeginDate
                         proEndDate:(NSString *)ProEndDate
                            proDesc:(NSString *)ProDesc
                         proDespons:(NSString *)ProDespons{
    if(self=[self init]){
        index=pro_index;
       userID=pro_userID;
        proID=ProID;
        self.proName=ProName;
        self.proBeginDate=ProBeginDate;
        self.proEndDate=ProEndDate;
        self.proDesc=ProDesc;
        self.proDespons=ProDespons;
    }
    return self;

}
@end
