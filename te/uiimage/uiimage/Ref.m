//
//  Ref.m
//  uiimage
//
//  Created by cheyipai.com on 16/11/28.
//  Copyright © 2016年 kong. All rights reserved.
//

#import "Ref.h"

@implementation Ref

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */

- (void)drawRect:(CGRect)rect {

//    CGContextRef ctf = UIGraphicsGetCurrentContext();//获取绘图的CGContextRef
//    CGContextSetLineWidth(ctf, 16);//设置线宽
//    CGContextSetRGBStrokeColor(ctf, 0, 1, 0, 1);//设置颜色
//    
//    //定义4个点，绘制线段
//    const CGPoint points1[] = {CGPointMake(10, 20),CGPointMake(100, 20),CGPointMake(100, 20),CGPointMake(20, 50)};
//    CGContextStrokeLineSegments(ctf, points1, 4);//绘制线段（默认不绘制端点）
//    
//    
//    CGContextSetLineCap(ctf, kCGLineCapSquare);//设置线段的端点形状：方形端点
//    //定义4个点，绘制线段
//    const CGPoint points2[] = {CGPointMake(110, 20),CGPointMake(200, 20),CGPointMake(200, 20),CGPointMake(120, 50)};
//     CGContextStrokeLineSegments(ctf, points2, 4);//
//    
//    
//    CGContextSetLineCap(ctf, kCGLineCapRound);//设置线段的端点形状：圆形端点
//    //定义4个点，绘制线段
//    const CGPoint points3[] = {CGPointMake(210, 20),CGPointMake(300, 20),CGPointMake(300, 20),CGPointMake(220, 50)};
//    CGContextStrokeLineSegments(ctf, points3, 4);//
//    
//    //绘制3个线段测试点线模式
//    
//    CGContextSetLineCap(ctf, kCGLineCapButt);
//    CGContextSetLineWidth(ctf, 10);//设置线宽
//    CGFloat patterns1[] = {6,10};
//    CGContextSetLineDash(ctf, 0, patterns1, 1);//设置点线模式，实线线宽6 间距为10
//    
//    
//    const CGPoint points4[] = {CGPointMake(40, 65),CGPointMake(280, 65)};
//    //定义两个点，绘制线段
//    CGContextStrokeLineSegments(ctf, points4, 2);
//    
//    
//    //下面填充矩形
//    
//    //设置线条颜色
//    CGContextSetStrokeColorWithColor(ctf, [UIColor yellowColor].CGColor);
//    //设置线条宽度
//    CGContextSetLineWidth(ctf, 14);
//    //设置填充颜色
//    CGContextSetFillColorWithColor(ctf, [UIColor redColor].CGColor)
//    ;
//    
//    
//    //绘制矩形边框
//    CGContextFillRect(ctf, CGRectMake(30, 120, 120, 60));
//    //取消点线模式
//    CGContextSetLineDash(ctf, 0, 0, 0);
//    //绘制矩形边框
//    CGContextStrokeRect(ctf, CGRectMake(30, 230, 120, 60));
//    
//    
//    
//    //设置线条颜色
//    CGContextSetStrokeColorWithColor(ctf, [UIColor purpleColor].CGColor);
//    //设置线条连接点的形状
//    CGContextSetLineJoin(ctf, kCGLineJoinRound);
//    //绘制一个矩形边框
//    CGContextStrokeRect(ctf, CGRectMake(80, 260, 120, 60));
//    
//    
//    //下面绘制和填充一个椭圆
//    //绘制一个椭圆
//    CGContextStrokeEllipseInRect(ctf, CGRectMake(30, 380, 120, 60));
//    
//    CGContextSetFillColorWithColor(ctf, [UIColor redColor].CGColor);
//    //填充一个椭圆
//    CGContextFillEllipseInRect(ctf, CGRectMake(180, 380, 120, 60));
    CGContextRef ctf = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctf);
    CGContextAddRoundRect(ctf, 100, 100, 80, 100, 30);
    
    CGContextAddStar(ctf, 5, 200, 300, 50);
    CGContextClosePath(ctf);
    CGContextSetRGBStrokeColor(ctf, 1, 1, 0, 1);
    CGContextSetLineWidth(ctf, 3);
    CGContextStrokePath(ctf);
    
}
/*
 该方法负责绘制圆角矩形，x1,y1:是圆角矩形左上角的坐标；width，height：控制圆角矩形的宽和高；radius：控制圆角矩形的四个圆角的半径
 */
void CGContextAddRoundRect (CGContextRef c,CGFloat x1,CGFloat y1,CGFloat width,CGFloat height,CGFloat radius) {
    
    
    CGContextMoveToPoint(c, x1 + radius, y1);//移到左上角
    //连接一条连接右上角的直线
    CGContextAddLineToPoint(c, x1 + width - radius, y1);
    //添加一段圆弧
    CGContextAddArcToPoint(c, x1 + width, y1, x1 + width, y1+ radius , radius);
    //添加一条连接到右下角的线段
    CGContextAddLineToPoint(c, x1 + width, y1 + height - radius);
    //添加一段圆弧
    CGContextAddArcToPoint(c, x1 + width, y1 + height, x1 + width - radius, y1 + height, radius);
    //添加一条连接左下角的线段
    CGContextAddLineToPoint(c, x1 + radius, y1 + height );
    //添加一段圆弧
    CGContextAddArcToPoint(c, x1 , y1 + height, x1, y1 + height - radius, radius);
    //添加一段连接左上角的线段
    CGContextAddLineToPoint(c, x1 , y1 + radius);
    //添加一段圆弧
    CGContextAddArcToPoint(c, x1, y1, x1 + radius, y1, radius);
    

}
/*
 绘制多角星，n:该参数通常设置为奇数，控制绘制n角星，dx,dy:控制n角星的中心。size控制n角星的大小
 */
void CGContextAddStar(CGContextRef c,NSUInteger n,CGFloat dx,CGFloat dy,NSUInteger size) {

    CGFloat dig = 4 * M_PI /n;
    CGContextMoveToPoint(c, dx, dy + size);
    for (int i = 1; i <= n ; i ++) {
        CGFloat x = sin(i *dig);
        CGFloat y = cos(i *dig);
        //绘制从当前点连接到指定点的线条
        CGContextAddLineToPoint(c, x * size +dx, y * size + dy);
        
    }
    


}

@end
