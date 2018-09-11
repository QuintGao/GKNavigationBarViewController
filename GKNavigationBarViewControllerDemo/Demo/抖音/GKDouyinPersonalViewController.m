//
//  GKDouyinPersonalViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by gaokun on 2018/9/11.
//  Copyright © 2018年 gaokun. All rights reserved.
//

#import "GKDouyinPersonalViewController.h"

@interface GKDouyinPersonalViewController ()

@end

@implementation GKDouyinPersonalViewController

- (void)loadView {
    self.view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WechatIMG238"]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navigationBar.hidden = YES;
    self.gk_statusBarHidden = YES;
}

@end
