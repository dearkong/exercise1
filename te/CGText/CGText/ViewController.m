//
//  ViewController.m
//  CGText
//
//  Created by cheyipai.com on 16/11/29.
//  Copyright © 2016年 kong. All rights reserved.
//

#import "ViewController.h"
#import "CGTextView.h"
@interface ViewController () {

    CGTextView *view;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50, self.view.frame.size.height - 100, self.view.frame.size.width - 100, 20)];
    slider.minimumValue = 0.1;
    slider.maximumValue = 5;
     [slider addTarget:self action:@selector(scaleChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    UILabel *textLable = [[UILabel alloc] initWithFrame:CGRectMake(0, slider.frame.origin.y , 50, 20)];
    textLable.text = @"缩放";
    [self.view addSubview:textLable];
    
    
    
    
    UISlider *slider1 = [[UISlider alloc] initWithFrame:CGRectMake(50, self.view.frame.size.height - 50, self.view.frame.size.width - 100, 20)];
    slider1.minimumValue = - 90;
    slider1.maximumValue = 90;
    [slider1 addTarget:self action:@selector(rotateChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider1];
    
    UILabel *textLable1 = [[UILabel alloc] initWithFrame:CGRectMake(0, slider1.frame.origin.y , 50, 20)];
    textLable1.text = @"旋转";
    
    [self.view addSubview:textLable1];
    
    
    
    view = [[CGTextView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor clearColor];
    view.userInteractionEnabled = NO;
    [self.view addSubview:view];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)scaleChange:(UISlider *)sl {


    NSLog(@"缩放：%f",sl.value);
    view.scaleRate = sl.value;
}
- (void)rotateChange:(UISlider *)sl {
    
     NSLog(@"旋转：%f",sl.value);
     view.rotateAngle = sl.value;
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
