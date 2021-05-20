//
//  GKWXHomeViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2020/10/17.
//  Copyright © 2020 QuintGao. All rights reserved.
//

#import "GKWXHomeViewController.h"
#import "GKFloatView.h"
#import "GKWXDetailViewController.h"
#import "GKBaseTransitionAnimation.h"

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
    
    self.gk_captureImage = [self getCaptureWithView:self.view.window];
}

- (UIImage *)getCaptureWithView:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0);
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:NO];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)showAction {
    GKWXDetailViewController *detailVC = [GKWXDetailViewController new];
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
