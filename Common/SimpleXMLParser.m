//
//  SimpleXMLParser.m
//  Dyrs
//
//  Created by jinher-cppg on 11-12-21.
//  Copyright 2011 Jinher Software. All rights reserved.
//

#import "SimpleXMLParser.h"


@implementation SimpleXMLParser


#pragma mark -
#pragma mark 初始化函数
-(id) init{
	if(self=[super init]){
		currElement = nil;
		formerElement = nil;
	}
	return self;
}

#pragma mark -
#pragma mark 业务函数 
-(id) dataInfo:(NSString *)xml dataType:(NSString *)type{
	return nil;
}

#pragma mark -
#pragma mark NSXMLParser调用

//遍历XML的节点
-(void) parser:(NSXMLParser *)parser 
		didStartElement:(NSString *)elementName 
		namespaceURI:(NSString *)namespaceURI 
		qualifiedName:(NSString *)qName 
		attributes:(NSDictionary *)attributeDict{
	
}
//当XML节点有值时，则进入此句
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	//屏蔽可能出现的“\n”换行符
}
//当遇到结束标记时，进入此句
-(void)parser:(NSXMLParser *)parser 
		didEndElement:(NSString *)elementName 
		namespaceURI:(NSString *)namespaceURI
		qualifiedName:(NSString	*)qName{
	
}

#pragma mark -
#pragma mark 析构函数
-(void) dealloc{
	if(dataType){
		[dataType release];		
		dataType = nil;
	}
	if (currElement) {
		[currElement release];
		currElement = nil;
	}
	if (formerElement) {
		[formerElement release];
		formerElement = nil;
	}
	[super dealloc];
}
@end
