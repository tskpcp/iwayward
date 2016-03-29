//
//  WebServices.h
//  JCS
//
//  Created by haunghe on 12-3-2.
//  Copyright (c) 2012年 huanghe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "CheckNetwork.h"
#import "ASIHTTPRequest.h"
#import "CommonHelper.h"
#import "JSON.h"
#import "BSJSONEncoder.h"
@protocol WebServicesDelegate; 
@interface WebServices : NSObject<ASIHTTPRequestDelegate>{
    NSString *strServiceURL;
    NSString *strActionURL;
    id<WebServicesDelegate> delegate;
    NSTimer *timer;
    
    BOOL FlagGzip;//是否解压缩
}

@property (nonatomic,assign) id<WebServicesDelegate> delegate;
@property (nonatomic,retain) NSString *strServiceURL;
@property (nonatomic,retain) NSString *strActionURL;
#pragma mark-
#pragma mark WebService调用借口定义
//业务相关调用
//登陆 Login
//-(void) login:(NSString *) sign;

//更新联系人
//-(void) getContacts:(NSString *)sign count:(int)count size:(int)size lastTime:(NSString *)lasttime;

//修改密码
//-(void) changePassword:(NSString *)sign oldPass:(NSString *)oldPass newPass:(NSString *)newPass;

//退出登录
//-(void) exitLogin:(NSString *)sign;

#pragma mark-
#pragma mark WebService相关调用
-(NSString *)doWebService:(NSString *)postData postURL:(NSString *)url;
-(void)doWebServiceAsyn:(NSString *)postData postURL:(NSString *)url;
-(void)doWebServiceAsyn:(NSString *)soapBody soapURL:(NSString *)soapURL soapAction:(NSString *)soapAction;
-(NSString *)doWebService:(NSString *)soapBody soapURL:(NSString *)soapURL soapAction:(NSString *)soapAction;

-(void) dataAnalysis:(NSString *)backInfo;
@end

@protocol WebServicesDelegate
@optional
-(void) requestSucceed:(id)data;
-(void) requestError:(NSError *)error;
@end
