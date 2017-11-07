//
//  CountDownButton.h
//  CountDownButton_GCD_DEMO
//
//  Created by He Bob on 2017/11/7.
//  Copyright © 2017年 He Bob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountDownButton : UIButton

+ (CountDownButton *)createCountDownButtonSecond:(int)maxSecond ClickHandler:(void(^)(void))blk;

@end
