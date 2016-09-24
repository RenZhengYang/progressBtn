//
//  ViewController.m
//  progressBtn
//
//  Created by mac on 16/9/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
//  头文件
#import "ProgressView.h"
#import "ProgressPlay.h"

@interface ViewController ()<ProgressPlayDelegate>
/*
 * 进度条视图的插座变量
 */
@property (weak, nonatomic) IBOutlet ProgressView *progress;
/*
 * 按钮的插座变量
 */
@property (weak, nonatomic) IBOutlet UIButton *playPauseButton;
@property(strong,nonatomic)ProgressPlay *player;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.player = [[ProgressPlay alloc]init];
    self.player.delegate = self;
    UIColor *tintColor = [UIColor greenColor];
    
    [[ProgressView appearance] setTintColor:tintColor];

    _progress.trackColor = [UIColor grayColor];
    _progress.startAngle = (3.0*M_PI)/2.0;

}
/*
 * 点击方法
 */
- (IBAction)playPauseBtn:(UIButton*)sender {
    if(sender.selected) // Shows the Pause symbol
    {
        sender.selected = NO;
        [self.player pause];
        [_playPauseButton setBackgroundImage:[UIImage imageNamed:@"Pause"] forState:UIControlStateNormal];
        
//        [_playPauseButton setTitle:@"Pause" forState:UIControlStateNormal];
        
    }
    else    // Shows the Play symbol
    {
        
        [self.player play];
        sender.selected=YES;
        [_playPauseButton setBackgroundImage:[UIImage imageNamed:@"Play"] forState:UIControlStateNormal];
//        
//        [_playPauseButton setTitle:@"Play" forState:UIControlStateNormal];
        
        
    }
    }

- (void) player:(ProgressPlay *)player didReachPosition:(float)position
{
    _progress.progress = position;
    NSLog(@">>>>>>>>>%f",position);
}

- (void) playerDidStop:(ProgressPlay *)player
{
    _playPauseButton.selected = NO;
    _progress.progress = 0.0;
    
}



@end
