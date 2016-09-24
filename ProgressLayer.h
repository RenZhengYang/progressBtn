//
//  ProgressLayer.h
//  progressBtn
//
//  Created by mac on 16/9/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ProgressLayer : CALayer     //  属性
@property(assign,nonatomic) float progress;

@property(assign,nonatomic) float startAngle;
@property(strong,nonatomic) UIColor *tintColor;         //  底色
@property(strong,nonatomic) UIColor *trackColor;      //   通道颜色
@end
