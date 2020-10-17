//
//  GKWXHomeViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2020/10/17.
//  Copyright © 2020 gaokun. All rights reserved.
//

#import "GKWXHomeViewController.h"
#import "GKFloatView.h"

@interface GKWXHomeViewController ()

@end

@implementation GKWXHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navTitle = @"微信";
    
    UIButton *showBtn = [[UIButton alloc] init];
    showBtn.frame = CGRectMake(100, 100, 100, 60);
    showBtn.backgroundColor = [UIColor blackColor];
    [showBtn setTitle:@"显示" forState:UIControlStateNormal];
    [showBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [showBtn addTarget:self action:@selector(showAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showBtn];
}

- (void)showAction {
    [GKFloatView create];
}

@end
