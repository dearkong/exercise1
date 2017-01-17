//
//  KImage.m
//  DrawImage
//
//  Created by cheyipai.com on 16/12/8.
//  Copyright © 2016年 kong. All rights reserved.
//

#import "KImage.h"
#import <CoreFoundation/CoreFoundation.h>
@interface KImage() {
    CGPoint firstTouch ;
    CGPoint prevTouch;
    CGPoint lastTouch;
    CGFloat leftTopX;
    CGFloat leftTopY;
    CGContextRef buffCtx;
    UIImage *image;

}

@end


@implementation KImage


- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        self.currentColor = [UIColor redColor];//初始化红色为默认颜色
        UIGraphicsBeginImageContext(self.bounds.size);//创建内存中的图片
        buffCtx = UIGraphicsGetCurrentContext();//获取内存中的图片执行绘图的CGContextRef
        
    }
    return self;

}

//当用户手指触碰时调用该方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    UITouch *touch = [touches anyObject];
    //获取触碰点的坐标
    firstTouch  = [touch locationInView:self];
    //如果当前正在进行自由绘制，prevTouch代表第一个触碰点
    if (self.shape == KPenShape) {
        prevTouch = firstTouch;
    }
}
//当用户手指在控件上移动时调用该方法
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
   
    UITouch *touch = [touches anyObject];
    //获取触碰点的坐标
    lastTouch = [touch locationInView:self];
    if (self.shape == KPenShape) {
        //向内存中的图片进行绘制
        [self draw:buffCtx];
        //取出内存中的图片，保存到image中
        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    //通知控件重绘，此时会时实绘制起始点于用户手指拖动点之间的形状
    [self setNeedsDisplay];

}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    UITouch *touch = [touches anyObject];
    //获取触碰点的坐标
    lastTouch = [touch locationInView:self];
    
    //向内存中的图片进行绘制
    [self draw:buffCtx];
    
    //取出内存中的图片，保存到image中
    image = UIGraphicsGetImageFromCurrentImageContext();

    //通知重绘
    [self setNeedsDisplay];

}
- (void)drawRect:(CGRect)rect {
    //获取绘图上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //将内存中的图片绘制出来
    [image drawAtPoint:CGPointZero];
    //调用draw:方法进行绘制
    [self draw:ctx];
}
- (void)draw:(CGContextRef)ctx {

    //设置线条颜色
    CGContextSetStrokeColorWithColor(ctx, self.currentColor.CGColor);
    //设置填充颜色
    CGContextSetFillColorWithColor(ctx, self.currentColor.CGColor);
    //设置线宽
    CGContextSetLineWidth(ctx, 2.0);
    //线条设置锯齿状
    CGContextSetShouldAntialias(ctx, YES);
    switch (self.shape) {
        case KLineShape:
            //绘制直线，添加从firstTouch到lastTouch的线段
            CGContextMoveToPoint(ctx, firstTouch.x, firstTouch.y);
            CGContextAddLineToPoint(ctx, lastTouch.x, lastTouch.y);
            //绘制路径
            CGContextStrokePath(ctx);
            
            break;
        case KRectShape:
            //绘制填充矩形
            CGContextFillRect(ctx, [self currentRect]);
            
            break;
        
        case KEllipseShape:
            //绘制填充椭圆
            CGContextFillEllipseInRect(ctx, [self currentRect]);
            ;
            break;
        case KRoundRectShape: {
            //绘制圆角矩形
            //计算左上角的坐标
             leftTopX = firstTouch.x < lastTouch.x?firstTouch.x:lastTouch.x;
             leftTopY = firstTouch.y < lastTouch.y?firstTouch.y:lastTouch.y;
            //添加圆角矩形的路径
            CGFloat radius1 = fabs(lastTouch.x - firstTouch.x)<fabs(lastTouch.y - firstTouch.y)?fabs(lastTouch.x - firstTouch.x):fabs(lastTouch.y - firstTouch.y);
            CGFloat radius =radius1/2.0< 16?radius1/2.0:16;
            CGContextAddRoundRect(ctx, leftTopX, leftTopY, fabs(lastTouch.x - firstTouch.x), fabs(lastTouch.y - firstTouch.y), radius);
            //填充路径
            CGContextStrokePath(ctx);
            
        }
            break;
        case KPenShape:{
            //手写路径添加从prevTouch到lastTouch的路径
            CGContextMoveToPoint(ctx, prevTouch.x, prevTouch.y);
            CGContextAddLineToPoint(ctx, lastTouch.x, lastTouch.y);
            //填充路径
            CGContextStrokePath(ctx);
            //保存当前点
            prevTouch = lastTouch;
            
        }
            
            break;
            
        default:
            break;
    }


}
- (CGRect)currentRect {

    return CGRectMake(firstTouch.x, firstTouch.y, lastTouch.x - firstTouch.x, lastTouch.y - firstTouch.y);
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
- (void)setShape:(ShapType)shape {
    _shape = shape;
    if (_shape == KClearShape) {
        [self clearAll];
    }
}
- (void)clearAll {

    CGContextClearRect(buffCtx, self.bounds);
    image = nil;
    [self setNeedsDisplay];
}

@end
