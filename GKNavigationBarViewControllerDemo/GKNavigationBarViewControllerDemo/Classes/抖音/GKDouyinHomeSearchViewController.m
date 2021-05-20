//
//  GKDouyinHomeSearchViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2018/9/11.
//  Copyright © 2018年 QuintGao. All rights reserved.
//

#import "GKDouyinHomeSearchViewController.h"

@interface GKDouyinHomeSearchViewController ()

@end

@implementation GKDouyinHomeSearchViewController

- (void)loadView {
    self.view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WechatIMG240"]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navigationBar.hidden = YES;
    self.gk_statusBarHidden = YES;
}

@end
