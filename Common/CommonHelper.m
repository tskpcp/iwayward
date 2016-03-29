//
//  CommonHelper.m
//  Dyrs
//
//  Created by jinher-cppg on 12-1-6.
//  Copyright 2012 Jinher Software. All rights reserved.
//

#import "CommonHelper.h"


@implementation CommonHelper

+(NSDate *) getNowDate{
	NSTimeZone *zone = [NSTimeZone defaultTimeZone];//获得当前应用程序的默认时区
	NSInteger interval = [zone secondsFromGMTForDate:[NSDate date]];//以秒为单位返回当前应用程序与世界标准时间的时差
	NSDate *nowDate = [NSDate dateWithTimeIntervalSinceNow:interval];
	return nowDate;
}

+(BOOL) isRole:(NSString *)role{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *configPath = [documentsDirectory stringByAppendingPathComponent:@"config.plist"];
	
	NSDictionary *config = [NSDictionary dictionaryWithContentsOfFile:configPath];
	NSString *roleStr = [NSString stringWithFormat:@"%@", [config objectForKey:role]];
	if ([roleStr isEqualToString:@"true"]) {
		return YES;
	}else{
		return NO;
	}
}

+(NSString *)dataFilePath:(NSString *)kFilenName{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory=[paths objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:kFilenName];
}

+(NSString *) getPicNameAtSkip:(NSString *)picName{
    NSString *filePath=[CommonHelper dataFilePath:@"config.plist"];
    NSMutableDictionary *config=[[NSMutableDictionary alloc] initWithContentsOfFile:filePath];

    return [NSString stringWithFormat:@"%@%@",[config objectForKey:@"SkinName"],picName];
}  

+(UIImage *) imageFromURLString:(NSString *) urlString{
    return [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]]];
}

+(NSDictionary *)getSocketAddrAndPort{
    NSString *sysinfoPath=[CommonHelper dataFilePath:@"sysinfo.plist"];
    
    return [NSDictionary dictionaryWithContentsOfFile:sysinfoPath];
}

+(NSString*) sha1:(NSString*)input
{
    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:input.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return [output uppercaseString];
}

+(NSString *) md5:(NSString *)str 
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3], 
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

#pragma mark -
#pragma mark String and Date Convert
+(NSString *)stringFromDate:(NSDate *)date{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *destDate=[dateFormatter stringFromDate:date];
    [dateFormatter release];
    
    return destDate;
    
}

+(NSDate *)dateFromString:(NSString *)dateString{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *destDate=[dateFormatter dateFromString:dateString];
    [dateFormatter release];
    return destDate;
}

//从config文件中，根据键名获取对应的键值
+(NSString *) getConfigFieldValue:(NSString *)fieldName{
    
    NSString *configPath=[self dataFilePath:@"config.plist"];
    
    NSMutableDictionary *config = [NSMutableDictionary dictionaryWithContentsOfFile:configPath];
    return [config objectForKey:fieldName];
}  
//等比率缩放
+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize

{
     UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
     [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
     UIGraphicsEndImageContext();
     return scaledImage;
                                
}
                                
                                
//自定长宽
+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize
{
        UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
        [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
        UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        
        return reSizeImage;
}
+(NSString *)getFileSizeString:(NSString *)size
{
    if([size floatValue]>=1024*1024)//大于1M，则转化成M单位的字符串
    {
        return [NSString stringWithFormat:@"%fM",[size floatValue]/1024/1024];
    }
    else if([size floatValue]>=1024&&[size floatValue]<1024*1024) //不到1M,但是超过了1KB，则转化成KB单位
    {
        return [NSString stringWithFormat:@"%fK",[size floatValue]/1024];
    }
    else//剩下的都是小于1K的，则转化成B单位
    {
        return [NSString stringWithFormat:@"%fB",[size floatValue]];
    }
}

+(float)getFileSizeNumber:(NSString *)size
{
    NSInteger indexM=[size rangeOfString:@"M"].location;
    NSInteger indexK=[size rangeOfString:@"K"].location;
    NSInteger indexB=[size rangeOfString:@"B"].location;
    if(indexM<1000)//是M单位的字符串
    {
        return [[size substringToIndex:indexM] floatValue]*1024*1024;
    }
    else if(indexK<1000)//是K单位的字符串
    {
        return [[size substringToIndex:indexK] floatValue]*1024;
    }
    else if(indexB<1000)//是B单位的字符串
    {
        return [[size substringToIndex:indexB] floatValue];
    }
    else//没有任何单位的数字字符串
    {
        return [size floatValue];
    }
}
+(NSString *)getDocumentPath
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

+(NSString *)getTargetFloderPath
{
    return [self getDocumentPath];
}

+(NSString *)getTempFolderPath
{
    return [[self getDocumentPath] stringByAppendingPathComponent:@"Temp"];
}

+(BOOL)isExistFile:(NSString *)fileName
{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:fileName];
}

+(BOOL)isNotLenght:(NSString *)txtValue intLenght:(int)intLenght{
    if([txtValue length]>intLenght){
        return YES;
    }else{
        return  NO;
    }
}
//自定义UIPross的进度
+(float)getProgress:(float)totalSize currentSize:(float)currentSize
{
    return currentSize/totalSize;
}
+(void)SetValueConfigFile:(NSString *)fileName fileSetObject:(NSString *)fileSetObject fileForKey:(NSString *)fileForKey{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    [data setObject:fileSetObject forKey:fileForKey];
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath1 = [paths objectAtIndex:0];
    //得到完整的文件名
    NSString *filename=[plistPath1 stringByAppendingPathComponent:@"config.plist"];
    //输入写入
    [data writeToFile:filename atomically:YES];

}
+(BOOL)isValidateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
+ (NSString *)replaceUnicode:(NSString *)unicodeStr {
    
    NSString *tempStr1 = [unicodeStr stringByReplacingOccurrencesOfString:@"\\u"withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""];
    NSString *tempStr3 = [[@"\""stringByAppendingString:tempStr2]stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];

    NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData
                                                          mutabilityOption:NSPropertyListImmutable
                                                                    format:NULL
                                                          errorDescription:NULL];

    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n"withString:@"\n"];
}
@end
