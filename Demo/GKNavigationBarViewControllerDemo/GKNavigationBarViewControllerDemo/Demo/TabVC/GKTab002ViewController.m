//
//  GKTab002ViewController.m
//  GKNavigationControllerDemo
//
//  Created by QuintGao on 2017/6/25.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "GKTab002ViewController.h"
#import "GKDemo002ViewController.h"

@interface GKTab002ViewController ()

@end

@implementation GKTab002ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"tab002";
    self.gk_navBackgroundColor = [UIColor orangeColor];
    
    self.contentText = @"我禁止了UITabBarController的全屏滑动手势，可使用边缘滑动返回。\n我push的时候隐藏tabbar";
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.tabBarController.gk_fullScreenPopDisabled = YES;
}

- (void)pushAction {
    GKDemo002ViewController *demo002VC = [GKDemo002ViewController new];
    demo002VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:demo002VC animated:YES];
}

@end
