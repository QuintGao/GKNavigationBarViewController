//
//  GKWYMusicAccountViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2017/7/10.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKWYMusicAccountViewController.h"
#import "GKWYMusicDetailViewController.h"

@interface GKWYMusicAccountViewController ()

@end

@implementation GKWYMusicAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navigationItem.title = @"账号";
    
    self.gk_navBackgroundColor = [UIColor colorWithRed:(200 / 255.0) green:(39 / 255.0) blue:(39 / 255.0) alpha:1.0];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.gk_navRightBarButtonItem = [UIBarButtonItem itemWithTitle:@"关闭" target:self action:@selector(closeAction)];
    self.gk_navItemRightSpace = 10;
    
    [self.gk_navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor greenColor]}];
}

- (void)hideTabBar {
    GKWYMusicDetailViewController *detailVC = [GKWYMusicDetailViewController new];
    
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)closeAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
