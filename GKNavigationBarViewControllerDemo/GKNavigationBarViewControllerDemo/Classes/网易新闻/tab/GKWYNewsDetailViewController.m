//
//  GKWYNewsDetailViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2017/7/11.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKWYNewsDetailViewController.h"
#import "GKWYNewsCommentViewController.h"

@interface GKWYNewsDetailViewController ()<GKViewControllerPushDelegate>

@end

@implementation GKWYNewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navigationItem.title = @"详情";
    self.gk_navTitleColor = [UIColor blackColor];
    
    self.gk_navBackgroundColor = [UIColor whiteColor];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置push的代理
    self.gk_pushDelegate = self;
    
    UIImageView *pageImage = [UIImageView new];
    pageImage.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    pageImage.image = [UIImage imageNamed:@"news_detailpage"];
    [self.view addSubview:pageImage];
    
    pageImage.userInteractionEnabled = YES;
    [pageImage addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pageAction)]];
}

- (void)pageAction {
    GKWYNewsCommentViewController *detailVC = [GKWYNewsCommentViewController new];
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - GKViewControllerPushDelegate
- (void)pushToNextViewController {
    [self pageAction];
}

@end
