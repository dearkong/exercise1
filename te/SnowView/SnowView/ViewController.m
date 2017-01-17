//
//  ViewController.m
//  SnowView
//
//  Created by cheyipai.com on 16/12/9.
//  Copyright © 2016年 kong. All rights reserved.
//

#import "ViewController.h"
#import "KSnowView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    KSnowView *snowView = [[KSnowView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:snowView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
