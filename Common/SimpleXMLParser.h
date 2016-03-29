//
//  SimpleXMLParser.h
//  Dyrs
//
//  Created by jinher-cppg on 11-12-21.
//  Copyright 2011 Jinher Software. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SimpleXMLParser : NSObject<NSXMLParserDelegate>{
	NSString *currElement;
	NSString *formerElement;
	NSString *dataType;
	NSMutableDictionary *data;
	NSMutableArray *dataArray;
}


//业务相关函数
-(NSMutableDictionary *) dataInfo:(NSString *)xml dataType:(NSString *)type;

@end

