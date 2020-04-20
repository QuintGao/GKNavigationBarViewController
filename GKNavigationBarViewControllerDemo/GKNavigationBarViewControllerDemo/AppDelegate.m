//
//  AppDelegate.m
//  GKNavigationBarViewControllerDemo
//
//  Created by gaokun on 2019/8/16.
//  Copyright © 2019 gaokun. All rights reserved.
//

#import "AppDelegate.h"
#import "GKMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 配置导航栏属性
    [GKConfigure setupCustomConfigure:^(GKNavigationBarConfigure *configure) {
        configure.gk_translationX = 15;
        configure.gk_translationY = 20;
        configure.gk_scaleX = 0.90;
        configure.gk_scaleY = 0.92;
        configure.gk_navItemLeftSpace = 12.0f;
        configure.gk_navItemRightSpace = 12.0f;
//        configure.gk_disableFixSpace = YES;
    }];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *nav = [UINavigationController rootVC:[GKMainViewController new] translationScale:NO];
    nav.gk_openScrollLeftPush = YES;
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
