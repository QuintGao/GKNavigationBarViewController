//
//  GKWYNewsNewViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2017/7/11.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKWYNewsNewViewController.h"

@implementation GKWYNewsNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navigationItem.title = @"要闻";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.gk_navRightBarButtonItem = [UIBarButtonItem itemWithTitle:@"关闭" target:self action:@selector(closeAction)];
}

- (void)closeAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
