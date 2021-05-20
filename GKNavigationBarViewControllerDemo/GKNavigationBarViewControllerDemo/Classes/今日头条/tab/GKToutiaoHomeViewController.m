//
//  GKToutiaoHomeViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2017/7/9.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKToutiaoHomeViewController.h"
#import "GKToutiaoDetailViewController.h"

@interface GKToutiaoHomeViewController ()<GKViewControllerPushDelegate>

@end

@implementation GKToutiaoHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navigationItem.title = @"首页";
    
    self.gk_navBackgroundColor = [UIColor colorWithRed:(212 / 255.0) green:(25 /255.0) blue:(37 / 255.0) alpha:1.0];
    
    self.gk_navRightBarButtonItem = [UIBarButtonItem itemWithTitle:@"关闭" target:self action:@selector(closeAction)];
    
    UIImageView *pageImage = [UIImageView new];
    pageImage.frame = CGRectMake(0, GK_STATUSBAR_NAVBAR_HEIGHT, self.view.frame.size.width, self.view.frame.size.height - GK_STATUSBAR_NAVBAR_HEIGHT - GK_TABBAR_HEIGHT);
    pageImage.image = [UIImage imageNamed:@"home_page"];
    [self.view addSubview:pageImage];
    
    pageImage.userInteractionEnabled = YES;
    [pageImage addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pageAction)]];
    
    self.gk_pushDelegate = self;
}

- (void)pushToNextViewController {
    [self pageAction];
}

- (void)pageAction {
    GKToutiaoDetailViewController *detailVC = [GKToutiaoDetailViewController new];
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)closeAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
