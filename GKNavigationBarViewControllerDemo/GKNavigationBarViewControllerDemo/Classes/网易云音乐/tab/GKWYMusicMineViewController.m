//
//  GKWYMusicMineViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2017/7/10.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKWYMusicMineViewController.h"
#import "GKWYMusicDetailViewController.h"

@interface GKWYMusicMineViewController ()

@end

@implementation GKWYMusicMineViewController

- (instancetype)init {
    if (self = [super init]) {
        self.gk_statusBarStyle = UIStatusBarStyleLightContent;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navigationItem.title = @"我的音乐";
    
    self.gk_navLeftBarButtonItem = [UIBarButtonItem itemWithTitle:@"更多" target:self action:@selector(hideTabBar)];
    
    self.gk_navRightBarButtonItem = [UIBarButtonItem itemWithTitle:@"关闭" target:self action:@selector(closeAction)];
    
    self.gk_navBackgroundColor = [UIColor colorWithRed:(200 / 255.0) green:(39 / 255.0) blue:(39 / 255.0) alpha:1.0];
    
    self.gk_navTitleColor = [UIColor whiteColor];
    self.gk_navTitleFont  = [UIFont systemFontOfSize:18];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *pageImage = [UIImageView new];
    pageImage.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 - 49);
    pageImage.image = [UIImage imageNamed:@"music_page"];
    [self.view addSubview:pageImage];
    
    pageImage.userInteractionEnabled = YES;
    [pageImage addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pageAction)]];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)pageAction {
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
