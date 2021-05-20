//
//  GKToutiaoMicroViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2017/7/9.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKToutiaoMicroViewController.h"
#import "GKToutiaoDetailViewController.h"

@interface GKToutiaoMicroViewController ()

@end

@implementation GKToutiaoMicroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navigationItem.title = @"微头条";
    
    self.gk_navTitleColor = [UIColor greenColor];
    
    self.gk_navBackgroundColor = [UIColor orangeColor];
    
    self.gk_navRightBarButtonItem = [UIBarButtonItem itemWithTitle:@"关闭" target:self action:@selector(closeAction)];
    
    UIImageView *pageImage = [UIImageView new];
    pageImage.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 - 49);
    pageImage.image = [UIImage imageNamed:@"micro_page"];
    [self.view addSubview:pageImage];
    
    pageImage.userInteractionEnabled = YES;
    [pageImage addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pageAction)]];
}

- (void)pageAction {
    GKToutiaoDetailViewController *detailVC = [GKToutiaoDetailViewController new];
    
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)closeAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
