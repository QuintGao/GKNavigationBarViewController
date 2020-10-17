//
//  GKWXDetailViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2020/10/17.
//  Copyright © 2020 gaokun. All rights reserved.
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
    showBtn.frame = CGRectMake(100, 100, 100, 60);
    showBtn.backgroundColor = [UIColor blackColor];
    [showBtn setTitle:@"隐藏" forState:UIControlStateNormal];
    [showBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [showBtn addTarget:self action:@selector(showAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showBtn];
}

- (void)showAction {
    [GKFloatView destory];
}

@end
