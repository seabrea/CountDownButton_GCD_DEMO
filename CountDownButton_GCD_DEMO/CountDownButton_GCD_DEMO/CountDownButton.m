//
//  CountDownButton.m
//  CountDownButton_GCD_DEMO
//
//  Created by He Bob on 2017/11/7.
//  Copyright © 2017年 He Bob. All rights reserved.
//

#import "CountDownButton.h"

@interface CountDownButton()

@property (nonatomic, strong) void(^handlerblk)(void);
@property (nonatomic, assign) int maxSecond;

@end

@implementation CountDownButton

- (instancetype)initWithMaxSecond:(int)second {
    self = [super init];
    if(self) {
        self.maxSecond = second;
        [self setUpButton];
    }
    return self;
}

- (void)setUpButton {
    self.backgroundColor = [UIColor orangeColor];
    self.tintColor = [UIColor whiteColor];
    [self setTitle:@"点击" forState:UIControlStateNormal];
    [self addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onClick:(id)sender {
    [self countDown];
    !_handlerblk?:_handlerblk();
}

/*
 dispatch处理倒计时
 */
- (void)countDown {
    __block int time = self.maxSecond;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    
    __weak typeof(self) weakself = self;
    dispatch_source_set_event_handler(timer, ^{
        if(time <= 0) {
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //UI刷新放在主线程
                [weakself setUserInteractionEnabled:YES];
                [weakself setBackgroundColor:[UIColor orangeColor]];
                [weakself setTitle:@"点击" forState:UIControlStateNormal];
            });
        }
        else {
            --time;
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakself setUserInteractionEnabled:NO];
                [weakself setBackgroundColor:[UIColor grayColor]];
                [weakself setTitle:[NSString stringWithFormat:@"%d",time] forState:UIControlStateNormal];
            });
        }
    });
    dispatch_resume(timer);
}


#pragma mark - public

+ (CountDownButton *)createCountDownButtonSecond:(int)maxSecond ClickHandler:(void(^)(void))blk {
    CountDownButton *btn = [[CountDownButton alloc] initWithMaxSecond:maxSecond];
    btn.handlerblk = blk;
    return btn;
}

@end
