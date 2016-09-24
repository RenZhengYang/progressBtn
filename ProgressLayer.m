//
//  ProgressLayer.m
//  progressBtn
//   创建表示层
//  Created by mac on 16/9/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ProgressLayer.h"

@implementation ProgressLayer
/*
 * @pragma 初始化
 *   layer   图层的传入
 */
- (id)initWithLayer:(id)layer
{
    self = [super initWithLayer:layer];
    if (self) {
        // Typically, the method is called to create the Presentation layer.
        // We must copy the parameters to look the same.
       
        if ([layer isKindOfClass:[ProgressLayer class]]) {
            
              ProgressLayer *otherLayer = layer;
              _progress = otherLayer.progress;    //  设置进度条的进度
            _startAngle = otherLayer.startAngle;
               _tintColor = otherLayer.tintColor;
            _trackColor = otherLayer.trackColor;   //   设置进度条的通道颜色
        }
    }
    return self;
}

+ (BOOL) needsDisplayForKey:(NSString *)key
{
    if([key isEqualToString:@"progress"])
        return YES;
    else
        return [super needsDisplayForKey:key];
}


/*
 * @pragma 进度条的绘制
 *   context
 */
- (void)drawInContext:(CGContextRef)ctx
{
    CGFloat radius = MIN(self.bounds.size.width, self.bounds.size.height)/2.0;
    CGPoint center = {self.bounds.size.width/2.0,self.bounds.size.height/2.0};
  
     //   对背景圆的绘制
    CGRect circleRect = {center.x-radius, center.y-radius, radius*2.0, radius*2.0};  //   设置圆
    CGContextAddEllipseInRect(ctx, circleRect);
  
      //   填充颜色 、绘制路径
    CGContextSetFillColorWithColor(ctx, _trackColor.CGColor);  //   设置填充颜色
    CGContextFillPath(ctx);
    
     //   对经弧线的绘制
    CGContextAddArc(ctx, center.x, center.y, radius, _startAngle, _startAngle + _progress*2.0*M_PI, 0);
    CGContextAddLineToPoint(ctx, center.x, center.y);
    CGContextClosePath(ctx);            //  设置直线
    
    CGContextSetFillColorWithColor(ctx, _tintColor.CGColor);
    CGContextFillPath(ctx);

}
@end
