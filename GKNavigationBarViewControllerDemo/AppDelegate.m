//
//  AppDelegate.m
//  GKNavigationBarViewControllerDemo
//
//  Created by gaokun on 2018/7/23.
//  Copyright © 2018年 gaokun. All rights reserved.
//

#import "AppDelegate.h"
#import "UINavigationController+GKCategory.h"
#import "GKMainViewController.h"
#import "GKDemo004ViewController.h"
#import "GKNavigationBarConfigure.h"
#import <UserNotifications/UserNotifications.h>
#import "GKDemo001ViewController.h"

@interface AppDelegate ()<UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 配置导航栏属性
    [[GKNavigationBarConfigure sharedInstance] setupDefaultConfigure];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
//    UINavigationController *nav = [UINavigationController rootVC:[GKMainViewController new] translationScale:NO];
//    nav.gk_openScrollLeftPush = YES;

    UINavigationController *nav = [UINavigationController rootVC:[GKDemo001ViewController new] translationScale:NO];
    
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
