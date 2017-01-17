//
//  KImage.h
//  DrawImage
//
//  Created by cheyipai.com on 16/12/8.
//  Copyright © 2016年 kong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {

    KLineShape = 0,
    KRectShape ,
    KEllipseShape ,
    KRoundRectShape ,
    KPenShape ,
    KClearShape,
    

}ShapType;


@interface KImage : UIView
@property (nonatomic ,assign)ShapType shape;
@property (nonatomic ,strong) UIColor *currentColor;
@end
