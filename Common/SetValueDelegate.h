//
//  SetValueDelegate.h
//  iwayward
//
//  Created by caopeng on 15/3/18.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//
#import <Foundation/Foundation.h>
#ifndef iwayward_SetValueDelegate_h
#define iwayward_SetValueDelegate_h
@protocol SetValueDelegate<NSObject>
-(void) setValue:(NSString *)value;//用于传值的方法
@end

#endif
