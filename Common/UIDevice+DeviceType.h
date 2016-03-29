//
//  UIDevice+DeviceType.h
//  iwayward
//
//  Created by caopeng on 15/3/15.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIDevice(machine)
+ (NSString*)getDeviceVersion;
+ (NSString *)getPlatformString;
@end

