//
//  MovePointBiew.m
//  就
//
//  Created by cheyipai.com on 16/11/24.
//  Copyright © 2016年 kong. All rights reserved.
//

#import "MovePointBiew.h"

@implementation MovePointBiew
double curX;
double curY;
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {


    UITouch *touch = [touches anyObject];
    
    //获得触当前碰事件在当前组建上的触碰点
    CGPoint lastPoint = [touch locationInView:self];
//    if ([touches anyObject].phase == UITouchPhaseBegan) {
//          NSLog(@"开始");
        if (curX - 30<lastPoint.x&& lastPoint.x<curX+ 30&&curY - 30<lastPoint.y&&lastPoint.y<curY+ 30) {
            
            curX = lastPoint.x;
            curY = lastPoint.y;
            [self setNeedsDisplay];
            
        }
  
//    }else {
//    
//        
//        curX = lastPoint.x;
//        curY = lastPoint.y;
//        [self setNeedsDisplay];
//        NSLog(@"过程");
//    }
    
   
    
}
- (void)drawRect:(CGRect)rect {

    self.backgroundColor = [UIColor clearColor];
    //获取绘图上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextClearRect(ctx, self.bounds);
    //设置填充颜色
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextFillEllipseInRect(ctx, CGRectMake(curX - 30, curY - 30, 60, 60));
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
