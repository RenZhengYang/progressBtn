//
//  ProgressView.m
//  progressBtn
//
//  Created by mac on 16/9/24.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView

/*
 * 获取ProgressLayer的实例
 */
+ (Class) layerClass
{
    return [ProgressLayer class];
}

/*
 * 进度条的初始化
 */
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initIVars];
    }
    return self;
}

/*
 * 初始化实例对象
 */
- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initIVars];
    }
    return self;
}
/*
 * 对进度条中的属性进行设置
 */
- (void) initIVars
{
    self.backgroundColor = [UIColor clearColor];  //  设置背景颜色
    self.opaque = NO;                                           //  不透明--提高渲染
    self.tintColor = [UIColor colorWithRed:0.2 green:0.45 blue:0.8 alpha:1.0];
                                                                            //  底色
    self.trackColor = [UIColor whiteColor];           //   设置轨道颜色
}
/*
 * 获取进度条
 */
-(float)progress
{
    ProgressLayer *layer = (ProgressLayer *)self.layer;
    return layer.progress;
}
/*
 * 设置进度条的增长动画
 */
-(void)setProgress:(float)progress
{
    BOOL growing = progress > self.progress;
    [self setProgress:progress animated:growing];
}
/*
 * 设置进度条中的动画
 */
- (void) setProgress:(float)progress animated:(BOOL)animated
{
         // Coerce the value
    if (progress < 0.0f){
        progress = 0.0f;
    }else if(progress > 1.0f){
        progress = 1.0f;
    }
        // Apply to the layer
        ProgressLayer *layer = (ProgressLayer *)self.layer;
        if(animated )
        {
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"progress"];
            animation.duration = 0.25;                                                                      //   设置时间
            animation.fromValue = [NSNumber numberWithFloat:layer.progress];  //    设置开始值
            animation.fromValue = [NSNumber numberWithFloat:progress];           //    设置结束值
            [layer addAnimation:animation forKey:@"progressAnimation"];
            
            layer.progress = progress;                                                                       //    设置进度
        }
        else{
            layer.progress = progress;                                                                       //   设置进度
            [layer setNeedsDisplay];                                                                          //   重写绘制
        
        }
    
    }  
/*
 *  对进度条加载的颜色进行设置
 */
- (void) setTintColor:(UIColor *)tintColor
{
    ProgressLayer *layer = (ProgressLayer *)self.layer;
    layer.tintColor = tintColor;               //  设置颜色
    [layer setNeedsDisplay];                 //  重绘
}

-(UIColor *)tintColor
{
    ProgressLayer *layer = (ProgressLayer*)self.layer;
    return  layer.tintColor;
}

/*
 * 对按钮中的轨道颜色进行设计
 */
- (void)setTrackColor:(UIColor *)trackColor
{
    ProgressLayer *layer = (ProgressLayer *)self.layer;
    layer.trackColor = trackColor;
//    [layer setNeedsDisplay];
}

-(UIColor *)trackColor
{
    ProgressLayer *layer = (ProgressLayer *)self.layer;
    return layer.trackColor;
}
/*
 *  进度条加载的角度
 */
- (float) startAngle
{
    ProgressLayer *layer = (ProgressLayer *)self.layer;
    return layer.startAngle;
}

- (void) setStartAngle:(float)startAngle
{
    ProgressLayer *layer = (ProgressLayer *)self.layer;
    layer.startAngle = startAngle;
    [layer setNeedsDisplay];
}

@end
