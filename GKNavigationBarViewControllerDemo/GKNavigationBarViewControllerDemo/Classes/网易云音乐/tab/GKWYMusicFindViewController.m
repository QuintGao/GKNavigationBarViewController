//
//  GKWYMusicFindViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2017/7/10.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKWYMusicFindViewController.h"
#import "GKWYMusicDetailViewController.h"

@interface GKWYMusicFindViewController ()

@end

@implementation GKWYMusicFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navBackgroundColor = [UIColor colorWithRed:(200 / 255.0) green:(39 / 255.0) blue:(39 / 255.0) alpha:1.0];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.gk_navLeftBarButtonItem = [UIBarButtonItem itemWithImageName:@"cm2_topbar_icn_playing" target:self action:@selector(hideTabBar)];
    
    self.gk_navRightBarButtonItem = [UIBarButtonItem itemWithTitle:@"关闭" target:self action:@selector(closeAction)];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 250, 30)];
    textField.layer.cornerRadius = 15;
    textField.layer.masksToBounds = YES;
    textField.backgroundColor = [UIColor whiteColor];
    textField.placeholder = @"搜索音乐、歌手、电台";
    
    self.gk_navTitleView = textField;
    
    UIImageView *pageImage = [UIImageView new];
    pageImage.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 - 49);
    pageImage.image = [UIImage imageNamed:@"discover_page"];
    [self.view addSubview:pageImage];
    
    pageImage.userInteractionEnabled = YES;
    [pageImage addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pageAction)]];
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
