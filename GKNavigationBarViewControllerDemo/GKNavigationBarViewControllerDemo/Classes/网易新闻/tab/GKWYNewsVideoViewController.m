//
//  GKWYNewsVideoViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2017/7/11.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKWYNewsVideoViewController.h"

@implementation GKWYNewsVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navigationItem.title = @"视频";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.gk_navRightBarButtonItem = [UIBarButtonItem itemWithTitle:@"关闭" target:self action:@selector(closeAction)];
}

- (void)closeAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
