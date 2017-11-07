//
//  ViewController.m
//  CountDownButton_GCD_DEMO
//
//  Created by He Bob on 2017/11/6.
//  Copyright © 2017年 He Bob. All rights reserved.
//

#import "ViewController.h"
#import "CountDownButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    CountDownButton *btn = [CountDownButton createCountDownButtonSecond:10 ClickHandler:^{
        NSLog(@"onclick");
    }];
    btn.frame = CGRectMake(100, 100, 100, 60);
    [self.view addSubview:btn];
}

@end
