//
//  GKTab001ViewController.m
//  GKNavigationControllerDemo
//
//  Created by QuintGao on 2017/6/25.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "GKTab001ViewController.h"
#import "GKDemo001ViewController.h"

@interface GKTab001ViewController ()<GKViewControllerPushDelegate>

@end

@implementation GKTab001ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"tab001";
    self.gk_navBackgroundColor = [UIColor cyanColor];
    
    self.contentText = @"我禁止了UITabBarController的滑动返回手势。\n我push的时候不隐藏tabbar";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    self.gk_pushDelegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
//    self.gk_pushDelegate = nil;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // 注意，这里必须在viewDidAppear中设置
    self.tabBarController.gk_interactivePopDisabled = YES;
}

- (void)pushAction {
    GKDemo001ViewController *demo001VC = [GKDemo001ViewController new];
    [self.navigationController pushViewController:demo001VC animated:YES];
}

#pragma mark - GKViewControllerPushDelegate
- (void)pushToNextViewController {
    GKDemo001ViewController *demo001VC = [GKDemo001ViewController new];
    [self.navigationController pushViewController:demo001VC animated:YES];
}

@end
