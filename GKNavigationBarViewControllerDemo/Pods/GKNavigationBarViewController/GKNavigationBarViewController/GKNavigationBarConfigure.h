//
//  GKNavigationBarConfigure.h
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2017/7/10.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GKNavigationBarConfigure : NSObject

@property (nonatomic, strong) UIColor *barTintColor;

@property (nonatomic, strong) UIColor *tintColor;

@property (nonatomic, strong) UIColor *titleColor;

@property (nonatomic, strong) UIFont *titleFont;

+ (instancetype)sharedInstance;

// 统一配置导航栏外观，最好在AppDelegate中配置
- (void)setupDefaultConfigure;

@end
