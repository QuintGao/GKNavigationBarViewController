//
//  GKNavigationBarConfigure.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2017/7/10.
//  Copyright © 2017年 高坤. All rights reserved.
//  https://github.com/QuintGao/GKNavigationBarViewController.git

#import "GKNavigationBarConfigure.h"
#import "UIBarButtonItem+GKCategory.h"

@implementation GKNavigationBarConfigure

static GKNavigationBarConfigure *instance = nil;

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [GKNavigationBarConfigure new];
    });
    return instance;
}

- (void)setupDefaultConfigure {
    // 统一设置导航栏默认的背景色、标题颜色、字体、返回按钮
    self.barTintColor = [UIColor whiteColor];
    
    self.tintColor    = [UIColor blackColor];
    
    self.titleColor   = [UIColor blackColor];
    
    self.titleFont    = [UIFont boldSystemFontOfSize:17.0];
    
    // 待添加
}

@end
