//
//  GzipUtility.m
//  C6
//
//  Created by Dai Daly on 12-8-9.
//  Copyright (c) 2012年 Jinher. All rights reserved.
//

#import "GzipUtility.h"

@implementation GzipUtility
//数据解压缩
+(NSData *)decompressData:(NSData *)compressedData{
    z_stream zStream;

    zStream.zalloc = Z_NULL;
    
    zStream.zfree = Z_NULL;
    
    zStream.opaque = Z_NULL;
    
    zStream.avail_in = 0;
    
    zStream.next_in = 0;
    
    int status = inflateInit2(&zStream, (15+32));
    
    
    
    if (status != Z_OK) {
        
        return nil;
        
    }
    
    
    
    Bytef *bytes = (Bytef *)[compressedData bytes];
    
    NSUInteger length = [compressedData length];
    
    
    
    NSUInteger halfLength = length/2;
    
    NSMutableData *uncompressedData = [NSMutableData dataWithLength:length+halfLength];
    
    
    
    zStream.next_in = bytes;
    
    zStream.avail_in = (unsigned int)length;
    
    zStream.avail_out = 0;
    
    
    
    NSInteger bytesProcessedAlready = zStream.total_out;
    
    while (zStream.avail_in != 0) {
        
        
        
        if (zStream.total_out - bytesProcessedAlready >= [uncompressedData length]) {
            
            [uncompressedData increaseLengthBy:halfLength];
            
        }
        
        
        
        zStream.next_out = (Bytef*)[uncompressedData mutableBytes] + zStream.total_out-bytesProcessedAlready;
        
        zStream.avail_out = (unsigned int)([uncompressedData length] - (zStream.total_out-bytesProcessedAlready));
        
        
        
        status = inflate(&zStream, Z_NO_FLUSH);
        
        
        
        if (status == Z_STREAM_END) {
            
            break;
            
        } else if (status != Z_OK) {
            
            return nil;
            
        }
        
    }
    
    
    
    status = inflateEnd(&zStream);
    
    if (status != Z_OK) {
        
        return nil;
        
    }
    
    
    
    [uncompressedData setLength: zStream.total_out-bytesProcessedAlready];  // Set real length
    
    
    return uncompressedData;         
}

+(NSData *)uncompressZippedData:(NSData *)compressedData
{
    
    if ([compressedData length] == 0) return compressedData;
    
    unsigned full_length = [compressedData length];
    
    unsigned half_length = [compressedData length] / 2;
    
    NSMutableData *decompressed = [NSMutableData dataWithLength: full_length + half_length];
    
    BOOL done = NO;
    int status;
    z_stream strm;
    strm.next_in = (Bytef *)[compressedData bytes];
    strm.avail_in = [compressedData length];
    strm.total_out = 0;
    strm.zalloc = Z_NULL;
    strm.zfree = Z_NULL;
    if (inflateInit2(&strm, (15+32)) != Z_OK) return nil;
    while (!done) {
        // Make sure we have enough room and reset the lengths.
        if (strm.total_out >= [decompressed length]) {
            [decompressed increaseLengthBy: half_length];
        }
        strm.next_out = [decompressed mutableBytes] + strm.total_out;
        strm.avail_out = [decompressed length] - strm.total_out;
        // Inflate another chunk.
        status = inflate (&strm, Z_SYNC_FLUSH);
        if (status == Z_STREAM_END) {
            done = YES;
        } else if (status != Z_OK) {
            break;
        }
        
    }
    if (inflateEnd (&strm) != Z_OK) return nil;
    // Set real length.
    if (done) {
        [decompressed setLength: strm.total_out];
        return [NSData dataWithData: decompressed];
    } else {
        return nil;
    }
}


//十进制转为十六进制
+(NSString *)ToHex:(int)tmpid
{
    NSString *endtmp=@"";
    NSString *nLetterValue;
    NSString *nStrat;
    int ttmpig=tmpid%16;
    int tmp=tmpid/16;
    switch (ttmpig)
    {
        case 10:
            nLetterValue =@"A";break;
        case 11:
            nLetterValue =@"B";break;
        case 12:
            nLetterValue =@"C";break;
        case 13:
            nLetterValue =@"D";break;
        case 14:
            nLetterValue =@"E";break;
        case 15:
            nLetterValue =@"F";break;
        default:nLetterValue=[[NSString alloc]initWithFormat:@"%i",ttmpig];
            
    }
    switch (tmp)
    {
        case 10:
            nStrat =@"A";break;
        case 11:
            nStrat =@"B";break;
        case 12:
            nStrat =@"C";break;
        case 13:
            nStrat =@"D";break;
        case 14:
            nStrat =@"E";break;
        case 15:
            nStrat =@"F";break;
        default:nStrat=[[NSString alloc]initWithFormat:@"%i",tmp];
            
    }
    endtmp=[[NSString alloc]initWithFormat:@"%@%@",nStrat,nLetterValue];
    NSString *str=@"";
    if([endtmp length]<4)
    {
        for (int x=[endtmp length]; x<4; x++) {
            str=[str stringByAppendingString:@"0"];
        }
        endtmp=[[NSString alloc]initWithFormat:@"%@%@",str,endtmp];
    }
    return endtmp;
}


@end
