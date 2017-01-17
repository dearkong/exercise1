//
//  KSnowView.m
//  SnowView
//
//  Created by cheyipai.com on 16/12/9.
//  Copyright © 2016年 kong. All rights reserved.
//

#import "KSnowView.h"

@implementation KSnowView


//定义雪花的初始位置
static CGPoint snowPos [] = {
    {20,4},
    {30,4},
    {40,4},
    {50,4},
    {60,4},
    {70,4},
    {80,4},
    {90,4},
    {100,4},
    {110,4},
    {120,4},
    {130,4},
    {140,4},
    {150,4},
    {160,4},
    {170,4},
    {180,4},
    {190,4},
    {200,4},
    {210,4},
    {220,4},
    {230,4},
    {240,4},
    {250,4},
    {260,4},
    {270,4},
    {280,4},
    {290,4},

};
//计算雪花的数量
static NSInteger snowCount = sizeof(snowPos)/sizeof(snowPos[0]);
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
     
        //每隔0.2秒刷新一次
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
        NSLog(@"%lu",snowCount);
   
    }

    return self;
}
- (void)drawRect:(CGRect)rect {

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //设置填充颜色
    CGContextSetRGBFillColor(ctx, 1, 1, 1, 1);
    CGContextClearRect(ctx, self.bounds);
    for (int i = 0; i < snowCount; i ++) {
    
        //保存当前绘图状态
        CGContextSaveGState(ctx);
        //平移坐标系统
        CGContextTranslateCTM(ctx, snowPos[i].x, snowPos[i].y);
        //旋转坐标系统
        
        int n = arc4random()%6;
        NSLog(@"n:%d",n);
        CGFloat angle = (n-3)*M_PI/10;
        NSLog(@"angle:%f",angle);
        CGContextRotateCTM(ctx, angle);
        //控制雪花下落
        snowPos[i].y += arc4random()%200;
        
        if (snowPos[i].y > [UIScreen mainScreen].bounds.size.height) {
//            if (snowPos[i].y > 320) {

            
            snowPos[i].y = 4;
        
        }
        //创建雪花
        CGContextAddFlower(ctx, 6, 0, 0, 4, 8);
        CGContextFillPath(ctx);
        CGContextRestoreGState(ctx);
        
        
    }
}
void CGContextAddFlower(CGContextRef c,NSInteger n,CGFloat dx ,CGFloat dy,CGFloat size,CGFloat length) {
    //移动到指定点
    CGContextMoveToPoint(c, dx, dy + size);
    CGFloat dig = 2* M_PI/n;
    //采用循环添加n段二次曲线路径
    for (int i = 1; i < n+1; i ++) {
        //计算控制点坐标
        CGFloat ctrlX = sin((i - 0.5)*dig)*length + dx;
        CGFloat ctrlY = cos((i - 0.5)*dig)*length + dy;
        
         //计算结束点坐标
        CGFloat x = sin(i *dig)*size + dx;
        CGFloat y = cos(i *dig)*size + dy;
        
        //添加二次曲线
        CGContextAddQuadCurveToPoint(c, ctrlX, ctrlY, x, y);
    }
    
}


@end
