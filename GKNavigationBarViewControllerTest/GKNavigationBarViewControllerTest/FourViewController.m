//
//  FourViewController.m
//  GKNavigationBarViewControllerTest
//
//  Created by QuintGao on 2018/3/8.
//  Copyright © 2018年 高坤. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *rightBtn = [UIButton new];
    [rightBtn setTitle:@"取消" forState:UIControlStateNormal];
    rightBtn.backgroundColor = [UIColor redColor];
    self.gk_navRightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    [rightBtn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.navItem_space = 0;
}

- (void)cancelAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
