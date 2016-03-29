//
//  TabIndex.h
//  iwayward
//
//  Created by caopeng on 15/3/15.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Engine : NSObject{
    NSUInteger board[100];
}
+(Engine *)sharedInstance;
-(NSUInteger)getFileValue:(NSUInteger)x;
-(void)setFileValue:(NSUInteger)x ToValue:(NSUInteger)newVal;
@end
