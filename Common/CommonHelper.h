//
//  CommonHelper.h
//  Dyrs
//
//  Created by jinher-cppg on 12-1-6.
//  Copyright 2012 Jinher Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <UIKit/UIKit.h>
@interface CommonHelper : NSObject {

}
+(NSDate *) getNowDate;
+(BOOL) isRole:(NSString *)role;
+(NSString *)dataFilePath:(NSString *)kFilenName;   //根据文件名称返回其在DocumentDirectory下的完整路径 
+(UIImage *) imageFromURLString:(NSString *) urlString;  //根据url地址返回UIImage对象

+(NSDate *)dateFromString:(NSString *)dateString;  //字符串转成日期类型
+(NSString *)stringFromDate:(NSDate *)date;  //日期类型转成字符串
+(NSDictionary *)getSocketAddrAndPort;  //获取socket地址和端口

+(NSString*) sha1:(NSString*)input;  //sha1加密
+(NSString *) md5:(NSString *)str;  //md5加密
+(NSString *) getPicNameAtSkip:(NSString *)picName;  //获取图片在各个皮肤下的真实名称
+(NSString *) getConfigFieldValue:(NSString *)fieldName;  //从config文件中，根据键名获取对应的键值
+(NSString *)stringFromDate:(NSDate *)date;
+(NSDate *)dateFromString:(NSString *)dateString;

//等比率缩放
+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;
//自定长宽
+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;

//传入文件总大小和当前大小，得到文件的下载进度
+(CGFloat) getProgress:(float)totalSize currentSize:(float)currentSize;
//将文件大小转化成M单位或者B单位
+(NSString *)getFileSizeString:(NSString *)size;
//经文件大小转化成不带单位ied数字
+(float)getFileSizeNumber:(NSString *)size;

+(NSString *)getTargetFloderPath;//得到实际文件存储文件夹的路径
+(NSString *)getTempFolderPath;//得到临时文件存储文件夹的路径
+(BOOL)isExistFile:(NSString *)fileName;//检查文件名是否存在
+(BOOL)isNotLenght:(NSString *)txtValue intLenght:(int)intLenght;//判断输入的内容是否过长
//配置config文件
+(void)SetValueConfigFile:(NSString *)fileName fileSetObject:(NSString *)fileSetObject fileForKey:(NSString *)fileForKey;
//邮箱验证
+(BOOL)isValidateEmail:(NSString *)email;
+ (NSString *)replaceUnicode:(NSString *)unicodeStr ;
@end
