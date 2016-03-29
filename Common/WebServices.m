//
//  WebServices.m
//  JCS
//
//  Created by haunghe on 12-3-2.
//  Copyright (c) 2012年 huanghe. All rights reserved.
//

#import "WebServices.h"

@implementation WebServices

@synthesize delegate;
@synthesize strServiceURL;
@synthesize strActionURL;

#pragma mark -
#pragma mark 初始化函数
//默认初始化函数
-(id)init{
    if(self =[super init]){
        strServiceURL=nil;
        strActionURL=nil;
        FlagGzip=NO;
        //读取系统配置文件
        NSString *sysinfoPath=[CommonHelper dataFilePath:@"sysinfo.plist"];
        
        NSDictionary *dict=[NSDictionary dictionaryWithContentsOfFile:sysinfoPath];
        strServiceURL=[[NSString stringWithFormat:@"%@/jhsoft.wcf/POSTServiceForAndroid.svc",[dict objectForKey:@"ServerAndPort"]] copy];
        strActionURL=[[dict objectForKey:@"ActionUrl"] copy];
    }
    return self;
}

#pragma mark -
#pragma mark 业务相关函数
//登录
//返回为{"mes":null,"success":1,"mesCount":1,"userId":"ligf","workCount":3}
-(void) login:(NSString *) sign{
    NSString *body = [NSString stringWithFormat:@"{\"sign\":\"%@\"}",sign];
	NSString *url = [NSString stringWithFormat:@"%@/Login",self.strServiceURL];
    
        
	[self doWebServiceAsyn:body postURL:url];
}


//修改密码
//成功：{"mes":"ligf","success":1}  
//失败：{"mes":"用户名或密码输入错误","success":0}
-(void) changePassword:(NSString *)sign oldPass:(NSString *)oldPass newPass:(NSString *)newPass{
   
    NSMutableDictionary *_dic=[[NSMutableDictionary alloc]init];
    [_dic setValue:sign forKey:@"sign"];
    [_dic setValue:oldPass forKey:@"oldPass"];
    [_dic setValue:newPass forKey:@"newPass"];
     NSString *body = [BSJSONEncoder jsonStringForValue:_dic withIndentLevel:0];
    [_dic release];
    
   // NSString *body = [NSString stringWithFormat:@"{\"sign\":\"%@\",\"oldPass\":\"%@\",\"newPass\":\"%@\"}",sign,oldPass,newPass];
	NSString *url = [NSString stringWithFormat:@"%@/changePassword",self.strServiceURL];
	[self doWebServiceAsyn:body postURL:url];
}

//退出登录
//{"mes":null,"success":1}
-(void) exitLogin:(NSString *)sign{
    
    NSMutableDictionary *_dic=[[NSMutableDictionary alloc]init];
    [_dic setValue:sign forKey:@"sign"];
    NSString *body = [BSJSONEncoder jsonStringForValue:_dic withIndentLevel:0];
    [_dic release];
    
   // NSString *body = [NSString stringWithFormat:@"{\"sign\":\"%@\"}",sign];
	NSString *url = [NSString stringWithFormat:@"%@/ExitLogin",self.strServiceURL];
	[self doWebServiceAsyn:body postURL:url];
}
//获取未阅寻呼数和待办条数(主要应用于服务中，功能是更新未阅寻呼数和待办数)
//{"mes":"操作成功","success":1,"callNumTotal":55,"callnum":0,"wfNumTotal":12,"wfnum":0}
-(void) getUnread:(NSString *)sign lastCallTime:(NSString *)lastCallTime lastWkTime:(NSString *)lastWkTime{
    
    NSMutableDictionary *_dic=[[NSMutableDictionary alloc]init];
    [_dic setValue:sign forKey:@"sign"];
    [_dic setValue:lastCallTime forKey:@"lastCallTime"];
    [_dic setValue:lastWkTime forKey:@"lastWkTime"];
    NSString *body = [BSJSONEncoder jsonStringForValue:_dic withIndentLevel:0];
    [_dic release];
    
  //  NSString *body = [NSString stringWithFormat:@"{\"sign\":\"%@\",\"lastCallTime\":\"%@\",\"lastWkTime\":\"%@\"}",sign,lastCallTime,lastWkTime];

     NSString *url = [NSString stringWithFormat:@"%@/getUnreadNew",self.strServiceURL];
	[self doWebServiceAsyn:body postURL:url];
}


#pragma mark -
#pragma mark 异步回调数据处理

-(void) dataAnalysis:(NSString *)backInfo{
 ///NSLog(@"%@",backInfo);
    NSMutableDictionary *data =[backInfo JSONValue];
    [delegate requestSucceed:data];
    return;
}

#pragma mark -
#pragma mark WebServices调用
//soap同步调用
-(NSString *)doWebService:(NSString *)soapBody soapURL:(NSString *)soapURL soapAction:(NSString *)soapAction{
	if (![CheckNetwork isExistenceNetwork]) {
		return @"";
	}
	
	//显示网络活动指示器
	UIApplication *app = [UIApplication sharedApplication];
	app.networkActivityIndicatorVisible = !app.networkActivityIndicatorVisible;
	
	//soap数据
	NSString *soapData = [NSString stringWithFormat: 
						  @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
						  "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
						  "<soap:Body>\n"
						  "%@"
						  "</soap:Body>\n"
						  "</soap:Envelope>\n",soapBody];
	
	//封装soap请求
	NSURL *url = [NSURL URLWithString:soapURL];	
	ASIHTTPRequest *theRequest = [ASIHTTPRequest requestWithURL:url];
	NSString *msgLength = [NSString stringWithFormat:@"%d",[soapData length]];
	
	//设置请求头信息
	[theRequest addRequestHeader:@"Content-Type" value:@"text/xml; charset=utf-8"];
	[theRequest addRequestHeader:@"Content-Length" value:msgLength];
	[theRequest addRequestHeader:@"SOAPAction" value:soapAction];
	[theRequest setRequestMethod:@"POST"];
	[theRequest setPostBody:[NSMutableData dataWithData:[soapData dataUsingEncoding:NSUTF8StringEncoding]]];
	
	
	
	//超时
	[theRequest setTimeOutSeconds:NETWORK_TIMEOUT];
	
	//隐藏网络活动指示器
	app.networkActivityIndicatorVisible = !app.networkActivityIndicatorVisible;
	
	//同步数据返回方法
	//theRequest.delegate = self;
	[theRequest startSynchronous];
	NSError *error = [theRequest error];
	if (!error) {
		NSString *response = [theRequest responseString];
		return response;
	}else {
		return @"";
	}
	
}

//post同步调用
-(NSString *)doWebService:(NSString *)postData postURL:(NSString *)postURL{
	if (![CheckNetwork isExistenceNetwork]) {
		return @"";
	}
	
	//显示网络活动指示器
	UIApplication *app = [UIApplication sharedApplication];
	app.networkActivityIndicatorVisible = !app.networkActivityIndicatorVisible;
	
	//post数据
	NSString *postMsg = [NSString stringWithFormat:@"%@",postData];
	
	//封装post请求
	NSURL *url = [NSURL URLWithString:postURL];	
	ASIHTTPRequest *theRequest = [ASIHTTPRequest requestWithURL:url];
	NSString *msgLength = [NSString stringWithFormat:@"%d",[postMsg length]];
	
	//设置请求头信息
	[theRequest addRequestHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];
	[theRequest addRequestHeader:@"Content-Length" value:msgLength];
	[theRequest setRequestMethod:@"POST"];
	[theRequest setPostBody:[NSMutableData dataWithData:[postMsg dataUsingEncoding:NSUTF8StringEncoding]]];
	
	//超时
	[theRequest setTimeOutSeconds:NETWORK_TIMEOUT];
	
	//隐藏网络活动指示器
	app.networkActivityIndicatorVisible = !app.networkActivityIndicatorVisible;
	
	//同步数据返回
	//theRequest.delegate = self;
	[theRequest startSynchronous];
	NSError *error = [theRequest error];
	if (!error) {
		NSString *response = [theRequest responseString];
		return response;
	}else {
		return @"";
	}
    
}

//soap异步调用
-(void)doWebServiceAsyn:(NSString *)soapBody soapURL:(NSString *)soapURL soapAction:(NSString *)soapAction{
	if (![CheckNetwork isExistenceNetwork]) {
		[delegate requestError:nil];
		return;
	}
	
	//显示网络活动指示器
	UIApplication *app = [UIApplication sharedApplication];
	app.networkActivityIndicatorVisible = !app.networkActivityIndicatorVisible;
	
	//soap数据
	NSString *soapData = [NSString stringWithFormat: 
						  @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
						  "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
						  "<soap:Body>\n"
						  "%@"
						  "</soap:Body>\n"
						  "</soap:Envelope>\n",soapBody];
	
	//封装soap请求
	NSURL *url = [NSURL URLWithString:soapURL];	
	ASIHTTPRequest *theRequest = [ASIHTTPRequest requestWithURL:url];
	NSString *msgLength = [NSString stringWithFormat:@"%d",[soapData length]];
	
	//设置请求头信息
	[theRequest addRequestHeader:@"Content-Type" value:@"text/xml; charset=utf-8"];
	[theRequest addRequestHeader:@"Content-Length" value:msgLength];
	[theRequest addRequestHeader:@"SOAPAction" value:soapAction];
	[theRequest setRequestMethod:@"POST"];
	[theRequest setPostBody:[NSMutableData dataWithData:[soapData dataUsingEncoding:NSUTF8StringEncoding]]];
    
	//超时
	[theRequest setTimeOutSeconds:NETWORK_TIMEOUT];
	
	
	//设置回调方法
	theRequest.delegate = self;
	[theRequest startAsynchronous];
	
}


//post异步请求
-(void)doWebServiceAsyn:(NSString *)postData postURL:(NSString *)postURL{
	
	if (![CheckNetwork isExistenceNetwork]) {
		[delegate requestError:nil];
		return;
	}
	
	//显示网络活动指示器
	UIApplication *app = [UIApplication sharedApplication];
	app.networkActivityIndicatorVisible = !app.networkActivityIndicatorVisible;
	
	//post数据
	NSString *postMsg = [NSString stringWithFormat:@"%@",postData];
	//封装post请求
	NSURL *url = [NSURL URLWithString:postURL];	
	ASIHTTPRequest *theRequest = [ASIHTTPRequest requestWithURL:url];
	NSString *msgLength = [NSString stringWithFormat:@"%d",[postMsg length]];
	
	//设置请求头信息
//	[theRequest addRequestHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];  //返回为xml数据
    [theRequest addRequestHeader:@"Content-Type" value:@"application/json"];  //返回为json数据
	[theRequest addRequestHeader:@"Content-Length" value:msgLength];
//    [theRequest addRequestHeader:@"Accept-Encoding" value:@"gzip"];
//    if(FlagGzip){
//      [theRequest setAllowCompressedResponse:NO];  
//    }else{
//      [theRequest setAllowCompressedResponse:YES];
//    }
	[theRequest setRequestMethod:@"POST"];
	[theRequest setPostBody:[NSMutableData dataWithData:[postMsg dataUsingEncoding:NSUTF8StringEncoding]]];
    
	//超时
	[theRequest setTimeOutSeconds:NETWORK_TIMEOUT];
	
	//设置回调方法
  
	theRequest.delegate = self;
	[theRequest startAsynchronous];
}

#pragma mark -
#pragma mark ASIHTTPRequestDelegate
-(void) requestFinished:(ASIHTTPRequest *)request{
	//显示网络活动指示器
	UIApplication *app = [UIApplication sharedApplication];
	app.networkActivityIndicatorVisible = !app.networkActivityIndicatorVisible;
	BOOL dataWasCompressed=[request isResponseCompressed];
    NSString *responseString=@"";
    if(dataWasCompressed){
        //NSLog(@"zip");
        NSData *uncompressedData=[request responseData];
        NSStringEncoding enc=CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        responseString=[[NSString alloc]initWithData:uncompressedData encoding:enc];
       
    }else{
     //   NSLog(@"nuzip");
        responseString = [request responseString];
    }
    
	[self dataAnalysis:responseString];
}
-(void) requestFailed:(ASIHTTPRequest *)request{
	//显示网络活动指示器
	UIApplication *app = [UIApplication sharedApplication];
	app.networkActivityIndicatorVisible = !app.networkActivityIndicatorVisible;
	
	[delegate requestError:nil];
}


#pragma mark -
#pragma mark 析构函数
-(void) dealloc{
    if (strActionURL) {
        [strActionURL release];
        strActionURL = nil;
    }
	if (strServiceURL) {
        [strServiceURL release];
        strServiceURL = nil;
    }
    
	delegate = nil;
	[super dealloc];
}

@end
