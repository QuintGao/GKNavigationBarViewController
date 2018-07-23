//
//  AppDelegate.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2017/7/7.
//  Copyright © 2017年 高坤. All rights reserved.
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
    
    UINavigationController *nav = [UINavigationController rootVC:[GKMainViewController new] translationScale:NO];
    nav.gk_openScrollLeftPush = YES;
    
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    
    // 授权推送通知
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert | UNAuthorizationOptionBadge | UNAuthorizationOptionSound) completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
            NSLog(@"授权成功");
            [self sendLocalNotification];
        }else {
            NSLog(@"授权失败");
        }
    }];
    
    return YES;
}

/**
 发送本地通知
 */
- (void)sendLocalNotification {
    // 延时5s发送一个本地通知
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 创建通知
        UNMutableNotificationContent *content = [UNMutableNotificationContent new];
        // 主标题
        content.title = [NSString localizedUserNotificationStringForKey:@"通知标题" arguments:nil];
        // 副标题
        content.subtitle = [NSString localizedUserNotificationStringForKey:@"通知副标题" arguments:nil];
        // 内容
        content.body = [NSString localizedUserNotificationStringForKey:@"通知内容" arguments:nil];
        // 通知提示音
        content.sound = [UNNotificationSound defaultSound];
        
        content.userInfo = @{@"id": @"123"};
        
        // 设置触发时间
        UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:10 repeats:NO];
        
        // 创建一个发送请求
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"local_notification" content:content trigger:trigger];
        
        // 发送通知
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        [center addNotificationRequest:request withCompletionHandler:nil];
    });
}

#pragma mark - UNUserNotificationCenterDelegate
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //应用处于前台时的远程推送接收
    }else{
        //应用处于前台时的本地推送接收
        NSLog(@"%@", userInfo);
        
        UIViewController *currentVC = GKConfigure.visibleController;
        
        [currentVC.navigationController pushViewController:[GKDemo001ViewController new] animated:YES];
    }
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
    
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //应用处于后台时的远程推送接收
    }else {
        //应用处于后台时的本地推送接收
        
        NSLog(@"%@", userInfo);
        // 接收到通知后的跳转方法
        // 方法一：
        UIViewController *currentVC = GKConfigure.visibleController;

        [currentVC.navigationController pushViewController:[GKDemo001ViewController new] animated:YES];
        
        // 方法二
        [self.window.rootViewController.navigationController pushViewController:[GKDemo001ViewController new] animated:YES];
    }
    
    completionHandler();
}

@end
