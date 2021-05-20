//
//  GKWXDetailViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2020/10/17.
//  Copyright © 2020 QuintGao. All rights reserved.
//

#import "GKWXDetailViewController.h"
#import "GKFloatView.h"
#import "GKFloatTransition.h"

@interface GKWXDetailViewController ()

@end

@implementation GKWXDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navTitle = @"详情";
    
    UIButton *showBtn = [[UIButton alloc] init];
    showBtn.frame = CGRectMake(100, 200, 100, 60);
    showBtn.backgroundColor = [UIColor blackColor];
    [showBtn setTitle:@"悬浮" forState:UIControlStateNormal];
    [showBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [showBtn addTarget:self action:@selector(floatAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showBtn];
    
    UIButton *dismBtn = [[UIButton alloc] init];
    dismBtn.frame = CGRectMake(100, 300, 100, 60);
    dismBtn.backgroundColor = [UIColor blackColor];
    [dismBtn setTitle:@"取消" forState:UIControlStateNormal];
    [dismBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [dismBtn addTarget:self action:@selector(dismAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dismBtn];
}

- (void)floatAction {
    [GKFloatView create];
    
    [GKFloatView dismissVC];
}

- (void)dismAction {
    [GKFloatView destory];
}

@end
