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
    
    self.navigationItem.title = @"系统导航";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
}

@end
