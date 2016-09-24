//
//  ProgressPlay.m
//  progressBtn
//
//  Created by mac on 16/9/24.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ProgressPlay.h"

@implementation ProgressPlay
/*
 * 播放
 */
- (void) play
{
    if(_timer){
        return;
    }
  
    _timer = [NSTimer scheduledTimerWithTimeInterval:PERIOD target:self selector:@selector(timerDidFire:) userInfo:nil repeats:YES];
}
/*
 * 暂停
 */
- (void) pause
{
    [_timer invalidate];
    _timer = nil;
}
/*
 * 加载动画的功能
 */
- (void) timerDidFire:(NSTimer *)theTimer
{
    if(self.position >= 1.0)
    {
        self.position = 0.0;
        [_timer invalidate];
        _timer = nil;
        [self.delegate playerDidStop:self];
    }
    else
    {
        self.position += PERIOD/DURATION;
        [self.delegate player:self didReachPosition:self.position];
    }
}

@end
