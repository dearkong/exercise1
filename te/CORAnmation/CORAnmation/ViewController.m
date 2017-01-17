//
//  ViewController.m
//  CORAnmation
//
//  Created by cheyipai.com on 16/12/15.
//  Copyright © 2016年 kong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //使用Core Animation 动画具有更好的性能，原因有如下两个
    /*
     1.Core Animation动画在单独的线程中完成，不会阻塞主线程。
     2.Core Animatio动画只会重绘界面上变化的部分（局部刷新）。
     
     */

    UIView *magentView = [[UIView alloc] initWithFrame:self.view.bounds];
    magentView.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:magentView];
    UIView *grayView = [[UIView alloc]initWithFrame:self.view.bounds];
    grayView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:grayView];
    NSArray *bnTitleArray = @[@"添加",@"翻页",@"移入",@"揭开",@"立方体",@"收缩",@"翻转",@"水波"];
    NSMutableArray *bnArray = [[NSMutableArray alloc] init];

    //获取屏幕的高度
    CGFloat totalHeight = [UIScreen mainScreen].bounds.size.height;
    //创建8个按钮，并将按钮添加到NSMutableArray集合中
    
    for (int i = 0; i < 8; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:bnTitleArray[i] forState:UIControlStateNormal];
        NSInteger row = i /4;
        NSInteger col = i%4;
        btn.frame = CGRectMake(5 + col*80, totalHeight - (2 - row)* 45-20, 70, 35);
        [self.view addSubview:btn];
        [bnArray addObject:btn];
        
    }
    
    //为8个按钮分别绑定不同的事件处理方法
    [[bnArray objectAtIndex:0] addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
    [[bnArray objectAtIndex:1] addTarget:self action:@selector(curl:) forControlEvents:UIControlEventTouchUpInside];
    [[bnArray objectAtIndex:2] addTarget:self action:@selector(move:) forControlEvents:UIControlEventTouchUpInside];
    [[bnArray objectAtIndex:3] addTarget:self action:@selector(reveal:) forControlEvents:UIControlEventTouchUpInside];
    [[bnArray objectAtIndex:4] addTarget:self action:@selector(cube:) forControlEvents:UIControlEventTouchUpInside];
    [[bnArray objectAtIndex:5] addTarget:self action:@selector(suck:) forControlEvents:UIControlEventTouchUpInside];
    [[bnArray objectAtIndex:6] addTarget:self action:@selector(oglflip:) forControlEvents:UIControlEventTouchUpInside];
    [[bnArray objectAtIndex:7] addTarget:self action:@selector(ripple:) forControlEvents:UIControlEventTouchUpInside];
    
    

}
- (void)add:(UIButton *)btn {


    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
    //设置动画的变化曲线
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //提交动画
    [UIView commitAnimations];

}
- (void)curl:(UIButton *)btn {
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
    //设置动画的变化曲线
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [self.view exchangeSubviewAtIndex:3 withSubviewAtIndex:2];
    //提交动画
    [UIView commitAnimations];
    
    
    
}
- (void)move:(UIButton *)btn {
    CATransition *transition = [CATransition animation];
    transition.duration = 2.0f;
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromLeft;
    [self.view.layer addAnimation:transition forKey:@"animation"];
    [self.view exchangeSubviewAtIndex:2 withSubviewAtIndex:3];
    
    
    
}
- (void)reveal:(UIButton *)btn {
    
    CATransition *transition = [CATransition animation];
    transition.duration = 2.0f;
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromTop;
    [self.view.layer addAnimation:transition forKey:@"animation"];
    [self.view exchangeSubviewAtIndex:2 withSubviewAtIndex:3];

    
    
    
}
- (void)cube:(UIButton *)btn {
    
    CATransition *transition = [CATransition animation];
    transition.duration = 2.0f;
    transition.type = @"cube";
    transition.subtype = kCATransitionFromLeft;
    [self.view.layer addAnimation:transition forKey:@"animation"];
    [self.view exchangeSubviewAtIndex:2 withSubviewAtIndex:3];
  
    
    
}
- (void)suck:(UIButton *)btn {
    
    CATransition *transition = [CATransition animation];
    transition.duration = 2.0f;
    transition.type = @"suckEffect";
    [self.view.layer addAnimation:transition forKey:@"animation"];
    [self.view exchangeSubviewAtIndex:2 withSubviewAtIndex:3];
    
    
}
- (void)oglflip:(UIButton *)btn {
    
    CATransition *transition = [CATransition animation];
    transition.duration = 2.0f;
    transition.type = @"oglFlip";
    transition.subtype = kCATransitionFromBottom;
    [self.view.layer addAnimation:transition forKey:@"animation"];
    [self.view exchangeSubviewAtIndex:2 withSubviewAtIndex:3];
    
}
- (void)ripple:(UIButton *)btn {
    
    CATransition *transition = [CATransition animation];
    transition.duration = 2.0f;
    transition.type = @"rippleEffect";
    [self.view.layer addAnimation:transition forKey:@"animation"];
    [self.view exchangeSubviewAtIndex:2 withSubviewAtIndex:3];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
