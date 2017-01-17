//
//  ViewController.m
//  DrawImage
//
//  Created by cheyipai.com on 16/12/8.
//  Copyright © 2016年 kong. All rights reserved.
//

#import "ViewController.h"
#import "KImage.h"
@interface ViewController () {

    NSArray *colors;
    KImage *image;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    image = [[KImage alloc] initWithFrame:self.view.bounds];
    image.backgroundColor = [UIColor clearColor];
    [self.view addSubview:image];
    
    colors = @[[UIColor redColor],
                       [UIColor greenColor],
                       [UIColor blueColor],
                       [UIColor yellowColor],
                       [UIColor purpleColor],
                       [UIColor cyanColor],
                       [UIColor blackColor]];
    
    
    UISegmentedControl *control = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 50)];
    [control insertSegmentWithTitle:@"红" atIndex:0 animated:YES];
    [control insertSegmentWithTitle:@"绿" atIndex:1 animated:YES];
    [control insertSegmentWithTitle:@"蓝" atIndex:2 animated:YES];
    [control insertSegmentWithTitle:@"黄" atIndex:3 animated:YES];
    [control insertSegmentWithTitle:@"紫" atIndex:4 animated:YES];
    [control insertSegmentWithTitle:@"青" atIndex:5 animated:YES];
    [control insertSegmentWithTitle:@"黑" atIndex:6 animated:YES];
    [self.view addSubview:control];
    [control addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventValueChanged];
    
    
    UISegmentedControl *control1 = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50)];
    [control1 insertSegmentWithTitle:@"直线" atIndex:0 animated:YES];
    [control1 insertSegmentWithTitle:@"矩形" atIndex:1 animated:YES];
    [control1 insertSegmentWithTitle:@"椭圆" atIndex:2 animated:YES];
    [control1 insertSegmentWithTitle:@"圆角矩形" atIndex:3 animated:YES];
    [control1 insertSegmentWithTitle:@"铅笔" atIndex:4 animated:YES];
    [control1 insertSegmentWithTitle:@"清空" atIndex:5 animated:YES];
   
    [control1 setWidth:80 forSegmentAtIndex:3];
    [self.view addSubview:control1];
    [control1 addTarget:self action:@selector(changeMode:) forControlEvents:UIControlEventValueChanged];

    // Do any additional setup after loading the view, typically from a nib.
}
- (void)changeColor:(UISegmentedControl *)con {
    image.currentColor = [colors objectAtIndex:con.selectedSegmentIndex];
    NSLog(@"改变颜色");


}
- (void)changeMode:(UISegmentedControl *)con {
    image.shape = con.selectedSegmentIndex;
    NSLog(@"更改绘画方式");

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
