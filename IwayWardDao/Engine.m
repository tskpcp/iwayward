//
//  TabIndex.m
//  iwayward
//
//  Created by caopeng on 15/3/15.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "Engine.h"

@implementation Engine
static Engine *_sharedInstance;
-(id)init{
    if(self=[super init]){
        memset(board,0,sizeof(board));
    }
    return  self;
}
+(Engine *)sharedInstance{
    if (!_sharedInstance)
    {
        _sharedInstance = [[Engine alloc] init];
    }
    
    return _sharedInstance;
}
-(NSUInteger)getFileValue:(NSUInteger)x{
    return board[x];
}
-(void)setFileValue:(NSUInteger)x ToValue:(NSUInteger)newVal{
    board[x] = newVal;
}
@end
