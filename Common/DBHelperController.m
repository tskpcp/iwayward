//
//  DBHelperController.m
//  uitabletest
//
//  Created by Dai Daly on 12-3-8.
//  Copyright (c) 2012年 Jinher. All rights reserved.
//

#import "DBHelperController.h"
#define DB_NAME @"iwayward.db"
@implementation DBHelperController
-(BOOL)initDatabase{
    BOOL success;
    NSError *error;
    NSFileManager *fm=[NSFileManager defaultManager];
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *wirtableDBPath=[documentsDirectory stringByAppendingPathComponent:DB_NAME];
    isInitDatabase=NO;
    success=[fm fileExistsAtPath:wirtableDBPath];
    if(!success){
        NSString *defaultDBPath=[[[NSBundle mainBundle]bundlePath]stringByAppendingPathComponent:DB_NAME];
        success=[fm copyItemAtPath:defaultDBPath toPath:wirtableDBPath error:&error];
        if(!success){
            NSLog(@"error:%@",[error localizedDescription]);
        }
        isInitDatabase=YES;
        success=YES;
    }
    if(success){
        db=[[FMDatabase databaseWithPath:wirtableDBPath]retain];    //创建数据库实例db  这里说明下:如果路径中不存在"jhcs.db"的文件,sqlite会自动创建"jhcs.db" 
        if([db open]){
            [db setShouldCacheStatements:YES];
            
            if (isInitDatabase) {
                [self initTable];
            }
        }
        else{
            NSLog(@"failed to open database.");
            success=NO;
        }
    }
    return success;
}

-(void)initTable{
    [db executeUpdate:@"CREATE TABLE android_metadata (locale TEXT)"];
    [db executeUpdate:@"CREATE TABLE sqlite_sequence(name,seq)"];
#pragma mark-
#pragma mark 招聘职位表
    [db executeUpdate:@"CREATE TABLE positioninfo(ID Integer PRIMARY KEY autoincrement,PosId Integer,userID varchar(50),companyID Integer,posName varchar(50),createTime varchar(50),region Integer,city Integer,province Integer,record varchar(32),recruitment Integer,range varchar(100),posstate Integer,posType varchar(32),requirements varchar(5000))"];
    [db executeUpdate:@"CREATE INDEX POSITIONINFO_INDEX_POSID ON positioninfo(PosId)"];
#pragma mark-
#pragma mark 简历表
#pragma mark-
#pragma mark 项目经验表
#pragma mark-
    [db executeUpdate:@"CREATE TABLE projectExperience(ID Integer PRIMARY KEY autoincrement,UserID Integer,proIndex Integer,proID Integer,proName varchar(100),proBeginDate varchar(100),proEndDate varchar(100),proDesc varchar(500),proDespons varchar(500))"];
    [db executeUpdate:@"CREATE INDEX PROJECTEXP_INDEX_PROINDEX ON projectExperience(proIndex)"];
#pragma mark 工作经历表
#pragma mark-
#pragma mark 公司信息表
#pragma mark-
#pragma mark 地区表
    [db executeUpdate:@"CREATE TABLE regionTable(ID Integer PRIMARY KEY autoincrement,provinceID Integer,provinceName varchar(32),cityID Integer,cityName varchar(32),regionID Integer,regionName varchar(32))"];
#pragma mark-
#pragma mark 简历－项目关系表
#pragma mark-
#pragma mark 简历－工作关系表
#pragma mark-
#pragma mark 用户表
    [db executeUpdate:@"CREATE TABLE UserInfo(ID Integer PRIMARY KEY autoincrement,UserID Integer,password varchar(50),phone Integer,headUrl varchar(100),rickName varchar(50),userName varchar(50),age Integer,sex Integer,region Integer,city Integer,province Integer,mail varchar(100),qqNo Integer,sinaId varchar(100),tengID varchar(100),baiduID varchar(100),weixinID varchar(100),weixinName varchar(100),weixinTwo varchar(1000),professional varchar(100),industry varchar(100),position varchar(100),erweima varchar(1000),zhuceTime varchar(100),qianming varchar(500))"];
    [db executeUpdate:@"CREATE INDEX USERINFO_INDEX_USERID ON UserInfo(UserID)"];
#pragma mark-
#pragma mark 关注行业表
#pragma mark-
#pragma mark 服务信息表
#pragma mark-
#pragma mark 服务匹配表
#pragma mark-
#pragma mark 信息交流表
#pragma mark-
#pragma mark 服务评价表
#pragma mark-
#pragma mark 人员关系表
#pragma mark-
#pragma mark 代码表
    [db executeUpdate:@"CREATE TABLE Code(ID Integer PRIMARY KEY autoincrement,CodeID varchar(32),CodeName varchar(100),CodeFatherID varchar(32),CodeIndex Integer,CodeValue1 varchar(50),CodeValue2 varchar(50),CodeValue3 varchar(50),CodeMark varchar(1000))"];
#pragma mark-
#pragma mark 行业表
    [db executeUpdate:@"CREATE TABLE industry(ID Integer PRIMARY KEY autoincrement,IndID Integer,IndName varchar(50),IndChildId Integer,IndChildName varchar(50))"];
#pragma mark-
#pragma mark 电话本表



    
    if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
	}
    
    if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
	}
}


-(void)closeDatabase{
    [db close];
}

-(FMDatabase *)getDatabase{
    if([self initDatabase]){
        return db;
    }
    return NULL;
}

-(void)dealloc{
    [self closeDatabase];
    [db release];
    [super dealloc];
}
@end
