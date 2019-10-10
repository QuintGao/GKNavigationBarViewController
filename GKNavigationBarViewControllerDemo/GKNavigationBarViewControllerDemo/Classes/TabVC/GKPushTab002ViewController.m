//
//  GKPushTab002ViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by gaokun on 2019/10/10.
//  Copyright © 2019 gaokun. All rights reserved.
//

#import "GKPushTab002ViewController.h"
#import "GKDemoBaseViewController.h"

@interface GKPushTab002ViewController ()<GKViewControllerPushDelegate>

@end

@implementation GKPushTab002ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"tab001";
    self.gk_navBackgroundColor = [UIColor cyanColor];
    
    if (self.isScale) {
        self.contentText = @"我支持左滑push，不隐藏tabbar，带缩放";
    }else {
        self.contentText = @"我支持左滑push，不隐藏tabbar，不带缩放";
    }
    
    self.gk_navRightBarButtonItem = [UIBarButtonItem itemWithTitle:@"返回" target:self action:@selector(dismiss)];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.gk_pushDelegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.gk_pushDelegate = nil;
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - GKViewControllerPushDelegate
- (void)pushToNextViewController {
    GKDemoBaseViewController *vc = [GKDemoBaseViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
