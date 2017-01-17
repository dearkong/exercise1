//
//  ViewController.m
//  就
//
//  Created by cheyipai.com on 16/11/24.
//  Copyright © 2016年 kong. All rights reserved.
//

#import "ViewController.h"
#import "MovePointBiew.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MovePointBiew *view = [[MovePointBiew alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:view];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
