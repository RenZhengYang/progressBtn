//
//  ProgressView.h
//  progressBtn
//
//  Created by mac on 16/9/24.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgressLayer.h"
@interface ProgressView : UIView
@property (nonatomic, assign) float progress;

@property (nonatomic, assign) float startAngle;
@property (nonatomic, strong) UIColor *tintColor ;
@property (nonatomic, strong) UIColor *trackColor;

- (void) setProgress:(float)progress animated:(BOOL)animated;
@end
