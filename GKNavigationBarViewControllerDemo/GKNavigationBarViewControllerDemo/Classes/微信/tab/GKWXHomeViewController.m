//
//  GKWXHomeViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2020/10/17.
//  Copyright © 2020 gaokun. All rights reserved.
//

#import "GKWXHomeViewController.h"
#import "GKFloatView.h"
#import "GKWXDetailViewController.h"

@interface GKWXHomeViewController ()

@end

@implementation GKWXHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navTitle = @"微信";
    
    UIButton *showBtn = [[UIButton alloc] init];
    showBtn.frame = CGRectMake(100, 200, 100, 60);
    showBtn.backgroundColor = [UIColor blackColor];
    [showBtn setTitle:@"跳转" forState:UIControlStateNormal];
    [showBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [showBtn addTarget:self action:@selector(showAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showBtn];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)showAction {
    GKWXDetailViewController *detailVC = [GKWXDetailViewController new];
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
