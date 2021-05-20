//
//  GKWYNewsCommentViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2017/7/11.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKWYNewsCommentViewController.h"

@interface GKWYNewsCommentViewController ()

@end

@implementation GKWYNewsCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navigationItem.title = @"评论";
    self.gk_navTitleColor = [UIColor blackColor];
    
    self.gk_navBackgroundColor = [UIColor whiteColor];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
