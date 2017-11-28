//
//  ThirdViewController.m
//  GKNavigationBarViewControllerTest
//
//  Created by QuintGao on 2017/10/25.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

//    [self.navigationController setNavigationBarHidden:YES];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
}

@end
