//
//  SecondViewController.m
//  GKNavigationBarViewControllerTest
//
//  Created by QuintGao on 2017/8/25.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navBackgroundColor   = [UIColor brownColor];
    
    self.view.backgroundColor    = [UIColor lightGrayColor];
    
    self.gk_statusBarStyle       = UIStatusBarStyleDefault;
    
    self.gk_navigationItem.title = @"😁😁😁";
}

- (void)dealloc {
    NSLog(@"SecondViewController 销毁了");
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

@end
