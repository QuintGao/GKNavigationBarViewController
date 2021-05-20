//
//  GKWYMusicDetailViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2017/7/10.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKWYMusicDetailViewController.h"

@interface GKWYMusicDetailViewController ()

@end

@implementation GKWYMusicDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navigationItem.title = @"详情页";
    
    self.gk_navBackgroundColor = [UIColor colorWithRed:(200 / 255.0) green:(39 / 255.0) blue:(39 / 255.0) alpha:1.0];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
