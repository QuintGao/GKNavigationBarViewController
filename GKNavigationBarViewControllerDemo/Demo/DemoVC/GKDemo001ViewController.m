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
    
    self.gk_navLineHidden   = YES;
    
    self.gk_navRightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(dismiss)];
    
    UIButton *btn = [UIButton new];
    btn.frame = CGRectMake(100, 400, 60, 20);
    btn.backgroundColor = [UIColor blackColor];
    [btn setTitle:@"Push" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.gk_pushDelegate = self;
    
    self.gk_statusBarStyle = UIStatusBarStyleLightContent;
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

#pragma mark - GKNavigationItemCustomProtocol
- (UIBarButtonItem *)gk_customBackItemWithTarget:(id)target action:(SEL)action {
    UIButton *backBtn  = [UIButton new];
    [backBtn setImage:[UIImage imageNamed:@"btn_back_white"] forState:UIControlStateNormal];
    [backBtn sizeToFit];
    [backBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}

@end
