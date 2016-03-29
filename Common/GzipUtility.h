//
//  GzipUtility.h
//  C6
//
//  Created by Dai Daly on 12-8-9.
//  Copyright (c) 2012年 Jinher. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "zlib.h"
#import "zconf.h"
@interface GzipUtility : NSObject
//数据解压缩
+(NSData *)decompressData:(NSData *)compressedData;
+(NSData *)uncompressZippedData:(NSData *)compressedData;

+(NSString *)ToHex:(int)tmpid;
@end
