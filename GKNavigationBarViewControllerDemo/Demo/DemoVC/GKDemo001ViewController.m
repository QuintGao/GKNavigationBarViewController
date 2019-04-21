//
//  GKFirstViewController.m
//  GKNavigationController
//
//  Created by QuintGao on 2017/6/22.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "GKDemo001ViewController.h"
#import "GKDemo002ViewController.h"
#import "GKDemo005ViewController.h"

@interface GKDemo001ViewController ()<GKViewControllerPushDelegate>

@end

@implementation GKDemo001ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navTitle = @"控制器001";
    
    self.view.backgroundColor    = [UIColor whiteColor];
    self.gk_navBackgroundColor   = [UIColor grayColor];
    
    self.gk_navRightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(dismiss)];
    
    UIButton *btn = [UIButton new];
    btn.frame = CGRectMake(100, 400, 60, 20);
    btn.backgroundColor = [UIColor blackColor];
    [btn setTitle:@"Push" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.gk_statusBarStyle = UIStatusBarStyleLightContent;
    
    self.gk_backStyle = GKNavigationBarBackStyleWhite;
    
    self.gk_navLineHidden = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 设置左滑push代理
    self.gk_pushDelegate = self;
    
    UIView *v = [UIView new];
    v.backgroundColor = [UIColor redColor];
    v.frame = CGRectMake(100, 10, 44, 34);
    [self.gk_navigationBar addSubview:v];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // 取消左滑push代理
    self.gk_pushDelegate = nil;
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

#pragma mark - GKNavigationControllerPushDelegate
- (void)pushToNextViewController {
    GKDemo002ViewController *demo002VC = [GKDemo002ViewController new];
    [self.navigationController pushViewController:demo002VC animated:YES];
}

- (void)dismiss {
    if ([self.tabBarController isKindOfClass:[GKDemo005ViewController class]]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)btnAction {
    GKDemo002ViewController *demo002VC = [GKDemo002ViewController new];
    demo002VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:demo002VC animated:YES];
}

@end
