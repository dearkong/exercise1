//
//  CGTextView.m
//  CGText
//
//  Created by cheyipai.com on 16/11/30.
//  Copyright © 2016年 kong. All rights reserved.
//

#import "CGTextView.h"
#import <CoreText/CoreText.h>
@implementation CGTextView
- (void)setScaleRate:(CGFloat)scaleRate {
    
    if (_scaleRate != scaleRate) {
        _scaleRate = scaleRate;
        [self setNeedsDisplay];
    }

}
- (void)setRotateAngle:(CGFloat)rotateAngle {
    
    if (_rotateAngle != rotateAngle) {
        _rotateAngle = rotateAngle;
        [self setNeedsDisplay];
    }


}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely  affects performance during animation.
*/



- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //设置字符间距
    CGContextSetCharacterSpacing(ctx, 4);
    //设置填充颜色
    CGContextSetRGBFillColor(ctx, 1, 0, 1, 1);
    //设置线条颜色
    CGContextSetRGBStrokeColor(ctx, 0, 0, 1, 1);
    //设置使用填充模式绘制文字
    CGContextSetTextDrawingMode(ctx, kCGTextFill);
    //绘制文字
    [@"iOS text" drawAtPoint:CGPointMake(10, 20) withAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial Rounded MT Bold" size:45], NSFontAttributeName,[UIColor magentaColor],NSForegroundColorAttributeName, nil]];
    
    //设置描边模式绘制文字
    CGContextSetTextDrawingMode(ctx, kCGTextStroke);
    //绘制文字
    [@"iOS text" drawAtPoint:CGPointMake(10, 80) withAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Heiti SC" size:40], NSFontAttributeName,[UIColor blueColor],NSForegroundColorAttributeName, nil]];
    
    
    //使用填充，描边模式绘制文字
    CGContextSetTextDrawingMode(ctx, kCGTextFillStroke);
    //绘制文字
    [@"iOS text" drawAtPoint:CGPointMake(10, 130) withAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Heiti SC" size:50], NSFontAttributeName,[UIColor magentaColor],NSForegroundColorAttributeName, nil]];
    
    
    //定义一个垂直镜像的变换矩阵
    CGAffineTransform yrevert = CGAffineTransformMake(1, 0, 0, -1, 0, 0);

    //为yreveta变换矩阵根据scaleRate添加缩放变换矩阵
    CGAffineTransform scale = CGAffineTransformScale(yrevert, self.scaleRate, self.scaleRate);
    //为scale变换矩阵根据rotateAngle添加旋转变换矩阵
    CGAffineTransform rotate = CGAffineTransformRotate(scale, self.rotateAngle*M_PI/180);
   //对cgcontextref绘制文字时应用变换
    CGContextSetTextMatrix(ctx, rotate);
    
    //设置绘制文本的字体和字体大小

    NSDictionary *attribs = @{NSFontAttributeName:[UIFont fontWithName:@"Courier New" size:40.0]};
    
    //绘制变换
    NSAttributedString *fontStr = [[NSAttributedString alloc] initWithString:@"iOS text" attributes:attribs];
    
    CTLineRef displayLine = CTLineCreateWithAttributedString( (__bridge CFAttributedStringRef)fontStr );
    CGContextSetTextPosition( ctx, 50, 300 );
    CTLineDraw( displayLine, ctx );
    CFRelease( displayLine );
    


}


@end
