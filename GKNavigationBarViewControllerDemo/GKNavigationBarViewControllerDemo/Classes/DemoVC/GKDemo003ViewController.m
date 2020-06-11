//
//  GKDemo003ViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by gaokun on 2019/6/26.
//  Copyright © 2019 gaokun. All rights reserved.
//

#import "GKDemo003ViewController.h"

@interface GKDemo003ViewController ()

@end

@implementation GKDemo003ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.gk_statusBarHidden = YES;
    
    self.navigationItem.title = @"系统导航";
    
//    if (@available(iOS 11.0, *)) {
//        self.navigationItem.searchController = [[UISearchController alloc] init];
//    } else {
//        // Fallback on earlier versions
//    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    NSLog(@"%@", NSStringFromCGRect(self.navigationController.navigationBar.frame));
}

@end
