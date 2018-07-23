//
//  GKThirdViewController.m
//  GKNavigationController
//
//  Created by QuintGao on 2017/6/21.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "GKDemo003ViewController.h"

@interface GKDemo003ViewController ()

@end

@implementation GKDemo003ViewController

- (void)loadView {
    [super loadView];
    
    self.view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"001"]];
    self.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.userInteractionEnabled = YES;
//    self.navigationController.navigationBar.hidden = YES;
    self.gk_navigationBar.hidden = YES;
    
    self.navigationItem.title = @"控制器003";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton new];
    btn.frame = CGRectMake(100, 400, 60, 20);
    btn.backgroundColor = [UIColor blackColor];
    [btn setTitle:@"Pop" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnAction {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
