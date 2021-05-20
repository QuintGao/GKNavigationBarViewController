//
//  GKWYNewsHomeViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2017/7/11.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKWYNewsHomeViewController.h"
#import "GKWYNewsDetailViewController.h"

@implementation GKWYNewsHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navTitleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"news_titleView"]];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.gk_navRightBarButtonItem = [UIBarButtonItem itemWithTitle:@"关闭" target:self action:@selector(closeAction)];

    UIImageView *pageImage = [UIImageView new];
    pageImage.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 - 49);
    pageImage.image = [UIImage imageNamed:@"news_homepage"];
    [self.view addSubview:pageImage];
    
    pageImage.userInteractionEnabled = YES;
    [pageImage addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pageAction)]];
}

- (void)pageAction {
    GKWYNewsDetailViewController *detailVC = [GKWYNewsDetailViewController new];
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)closeAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
