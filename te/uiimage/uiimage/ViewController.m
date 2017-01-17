//
//  ViewController.m
//  uiimage
//
//  Created by cheyipai.com on 16/11/28.
//  Copyright © 2016年 kong. All rights reserved.
//

#import "ViewController.h"
#import "Ref.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Ref *ref = [[Ref alloc] initWithFrame:self.view.bounds];
    ref.backgroundColor = [UIColor clearColor];
    [self.view addSubview:ref];
    

  
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
