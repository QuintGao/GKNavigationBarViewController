//
//  GKDouyinHomePlayerViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2018/9/11.
//  Copyright © 2018年 QuintGao. All rights reserved.
//

#import "GKDouyinHomePlayerViewController.h"

@interface GKDouyinHomePlayerViewController ()

@end

@implementation GKDouyinHomePlayerViewController

- (void)loadView {
    self.view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WechatIMG239"]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navigationBar.hidden = YES;
    self.gk_statusBarHidden      = YES;
}

@end
