//
//  CustomOperation.m
//  CountDownButton_GCD_DEMO
//
//  Created by He Bob on 2017/11/7.
//  Copyright © 2017年 He Bob. All rights reserved.
//

#import "CustomOperation.h"

@interface CustomOperation()
@property (strong , nonatomic) NSString *operationName;
@end

@implementation CustomOperation

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if(self) {
        self.operationName = name;
    }
    return self;
}

- (void)main {
    NSLog(@"233");
}

@end
