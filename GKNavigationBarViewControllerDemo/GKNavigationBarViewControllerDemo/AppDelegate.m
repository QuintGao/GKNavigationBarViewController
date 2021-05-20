//
//  AppDelegate.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2019/8/16.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "AppDelegate.h"
#import "GKMainViewController.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
#import "GKWXHomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 配置导航栏属性
    [GKConfigure setupCustomConfigure:^(GKNavigationBarConfigure *configure) {
//        configure.gk_translationX = 15;
//        configure.gk_translationY = 20;
//        configure.gk_scaleX = 0.90;
//        configure.gk_scaleY = 0.92;
        // 导航栏背景色
        configure.backgroundColor = [UIColor whiteColor];
        // 导航栏标题颜色
        configure.titleColor = [UIColor blackColor];
        // 导航栏标题字体
        configure.titleFont = [UIFont systemFontOfSize:18.0f];
        // 导航栏返回按钮样式
        configure.backStyle = GKNavigationBarBackStyleBlack;
        // 导航栏左右item间距
        configure.gk_navItemLeftSpace = 12.0f;
        configure.gk_navItemRightSpace = 12.0f;
        configure.shiledGuestureVCs = @[@"TZ"];
        configure.shiledItemSpaceVCs = @[@"TZ", @"GKDemoWebViewController"];
        configure.gk_openScrollViewGestureHandle = YES;
    }];
    
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *nav = [UINavigationController rootVC:[GKMainViewController new] translationScale:NO];
//    UINavigationController *nav = [UINavigationController rootVC:[GKWXHomeViewController new] translationScale:NO];
    nav.gk_openScrollLeftPush = YES;
    nav.gk_openSystemNavHandle = YES;
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
