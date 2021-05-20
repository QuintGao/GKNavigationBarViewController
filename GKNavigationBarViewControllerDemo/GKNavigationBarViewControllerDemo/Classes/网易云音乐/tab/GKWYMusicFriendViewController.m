//
//  GKWYMusicFriendViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2017/7/10.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKWYMusicFriendViewController.h"
#import "GKWYMusicDetailViewController.h"

@interface GKWYMusicFriendViewController ()

@end

@implementation GKWYMusicFriendViewController

- (instancetype)init {
    if (self = [super init]) {
        self.gk_statusBarStyle = UIStatusBarStyleLightContent;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navigationItem.title = @"朋友";
    
    self.gk_navBackgroundColor = [UIColor colorWithRed:(200 / 255.0) green:(39 / 255.0) blue:(39 / 255.0) alpha:1.0];
    
    UIBarButtonItem *backItem = [UIBarButtonItem itemWithTitle:@"返回" target:self action:@selector(backAction)];
    
    UIBarButtonItem *moreItem = [UIBarButtonItem itemWithTitle:@"更多" target:self action:@selector(moreAction)];
    
    self.gk_navLeftBarButtonItems = @[backItem, moreItem];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.gk_navRightBarButtonItem = [UIBarButtonItem itemWithTitle:@"关闭" target:self action:@selector(closeAction)];
    self.gk_navItemRightSpace = 20;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)backAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)moreAction {
    GKWYMusicDetailViewController *detailVC = [GKWYMusicDetailViewController new];
    [self.navigationController pushViewController:detailVC animated:YES];
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
