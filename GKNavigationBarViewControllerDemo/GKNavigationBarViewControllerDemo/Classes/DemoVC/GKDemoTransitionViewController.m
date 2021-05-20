//
//  GKDemoTransitionViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2020/11/30.
//  Copyright © 2020 QuintGao. All rights reserved.
//

#import "GKDemoTransitionViewController.h"

@interface GKDemoTransitionViewController ()<GKViewControllerPopDelegate>

@end

@implementation GKDemoTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    self.gk_navTitle = @"自定义导航栏";
    self.gk_popDelegate = self;
}

#pragma mark - GKViewControllerPopDelegate
- (void)viewControllerPopScrollBegan {
    
}

- (void)viewControllerPopScrollUpdate:(float)progress {
    // 由于已经出栈，所以self.navigationController为nil，不能直接获取导航控制器
    UIViewController *vc = [GKConfigure visibleViewController];
    vc.navigationController.navigationBar.alpha = progress;
}

- (void)viewControllerPopScrollEnded:(BOOL)finished {
    // 由于已经出栈，所以self.navigationController为nil，不能直接获取导航控制器
    UIViewController *vc = [GKConfigure visibleViewController];
    vc.navigationController.navigationBarHidden = !finished;
    vc.navigationController.navigationBar.alpha = 1;
}

@end
