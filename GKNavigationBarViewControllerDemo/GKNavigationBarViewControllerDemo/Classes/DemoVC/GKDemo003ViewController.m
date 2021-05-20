//
//  GKDemo003ViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2019/6/26.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GKDemo003ViewController.h"
#import "GKDemo000ViewController.h"
#import "GKDemoTransitionViewController.h"

@interface GKDemo003ViewController ()<GKViewControllerPushDelegate, GKViewControllerPopDelegate>

@end

@implementation GKDemo003ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"系统导航";
    
    self.gk_navItemRightSpace = 20;
    UIBarButtonItem *rightItem = [UIBarButtonItem itemWithTitle:@"跳转" target:self action:@selector(click)];
    rightItem.customView.backgroundColor = UIColor.blackColor;
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.gk_pushDelegate = self;
    self.gk_popDelegate = self;
}

- (void)click {
    GKDemo000ViewController *demo000VC = [GKDemo000ViewController new];
    [self.navigationController pushViewController:demo000VC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
}

- (BOOL)navigationShouldPopOnClick {
    self.navigationController.navigationBar.hidden = YES;
    
    return YES;
}

#pragma mark - GKViewControllerPushDelegate
- (void)pushToNextViewController {
    GKDemoTransitionViewController *transitionVC = [GKDemoTransitionViewController new];
    [self.navigationController pushViewController:transitionVC animated:YES];
}

- (void)viewControllerPushScrollBegan {
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewControllerPushScrollUpdate:(float)progress {
    self.navigationController.navigationBar.alpha = 1 - progress;
}

- (void)viewControllerPushScrollEnded:(BOOL)finished {
    self.navigationController.navigationBar.alpha = 1;
    self.navigationController.navigationBarHidden = finished;
}

#pragma mark - GKViewControllerPopDelegate
- (void)viewControllerPopScrollBegan {
    
}

- (void)viewControllerPopScrollUpdate:(float)progress {
    // 由于已经出栈，所以self.navigationController为nil，不能直接获取导航控制器
    UIViewController *vc = [GKConfigure visibleViewController];
    vc.navigationController.navigationBar.alpha = 1 - progress;
}

- (void)viewControllerPopScrollEnded:(BOOL)finished {
    // 由于已经出栈，所以self.navigationController为nil，不能直接获取导航控制器
    UIViewController *vc = [GKConfigure visibleViewController];
    vc.navigationController.navigationBar.alpha = 1;
    vc.navigationController.navigationBarHidden = finished;
}

@end
