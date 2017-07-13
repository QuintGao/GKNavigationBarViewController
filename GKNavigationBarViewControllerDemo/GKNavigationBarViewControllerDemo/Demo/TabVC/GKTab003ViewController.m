//
//  GKTab003ViewController.m
//  GKNavigationControllerDemo
//
//  Created by QuintGao on 2017/6/25.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "GKTab003ViewController.h"
#import "GKDemo003ViewController.h"

@interface GKTab003ViewController ()

@end

@implementation GKTab003ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"tab003";
    self.gk_navBarTintColor = [UIColor magentaColor];
    
    self.contentText = @"我设置了UITabBarController的滑动范围为距离屏幕左边100像素";
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.tabBarController.gk_popMaxAllowedDistanceToLeftEdge = 100;
}

- (void)pushAction {
    GKDemo003ViewController *demo003VC = [GKDemo003ViewController new];
    [self.navigationController pushViewController:demo003VC animated:YES];
}

@end
