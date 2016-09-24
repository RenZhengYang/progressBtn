//
//  ProgressPlay.h
//  progressBtn
//
//  Created by mac on 16/9/24.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
//   宏定义
#define DURATION  20.0   //  持续时间
#define PERIOD    0.5        //  周期
//  引入类
@class ProgressPlay;
//  协议的声明
@protocol ProgressPlayDelegate <NSObject>
- (void) player:(ProgressPlay *)player didReachPosition:(float)position;
- (void) playerDidStop:(ProgressPlay *)player;

@end
@interface ProgressPlay : NSObject
/*
 * 定时器
 */
@property(strong,nonatomic)NSTimer*timer;
/*
 *  0..1
 */
@property (assign) float position;
/*
 * 委托对象
 */
@property (retain) id <ProgressPlayDelegate> delegate;

- (void) play;
- (void) pause;

@end
