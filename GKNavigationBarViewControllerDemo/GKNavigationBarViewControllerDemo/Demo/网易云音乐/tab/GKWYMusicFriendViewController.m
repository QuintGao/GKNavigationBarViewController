//
//  GKWYMusicFriendViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2017/7/10.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "GKWYMusicFriendViewController.h"
#import "GKWYMusicDetailViewController.h"

@interface GKWYMusicFriendViewController ()

@end

@implementation GKWYMusicFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"朋友";
    
    self.gk_navBackgroundColor = [UIColor colorWithRed:(200 / 255.0) green:(39 / 255.0) blue:(39 / 255.0) alpha:1.0];
    
    UIBarButtonItem *backItem = [UIBarButtonItem itemWithTitle:@"返回" imageName:@"btn_back_white" target:self action:@selector(backAction)];
    
    UIBarButtonItem *moreItem = [UIBarButtonItem itemWithTitle:@"更多" target:self action:@selector(moreAction)];
    
    self.gk_navLeftBarButtonItems = @[backItem, moreItem];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.gk_navRightBarButtonItem = [UIBarButtonItem itemWithTitle:@"关闭" target:self action:@selector(closeAction)];
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
