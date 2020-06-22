//
//  GKDemo003ViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by gaokun on 2019/6/26.
//  Copyright © 2019 gaokun. All rights reserved.
//

#import "GKDemo003ViewController.h"
#import "GKDemo000ViewController.h"

@interface GKDemo003ViewController ()

@end

@implementation GKDemo003ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"系统导航";
    
    self.gk_navItemRightSpace = 20;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"哈哈" target:self action:@selector(click)];
}

- (void)click {
    GKDemo000ViewController *demo000VC = [GKDemo000ViewController new];
    [self.navigationController pushViewController:demo000VC animated:YES];
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
