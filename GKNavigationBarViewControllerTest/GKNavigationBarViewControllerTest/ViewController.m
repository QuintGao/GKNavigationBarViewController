//
//  ViewController.m
//  GKNavigationBarViewControllerTest
//
//  Created by QuintGao on 2017/8/23.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor   = [UIColor redColor];
    
    self.gk_navBackgroundColor = [UIColor blueColor];
    
    self.gk_navigationItem.title = @"你好啊";
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    SecondViewController *vc = [SecondViewController new];
    
    [self.navigationController pushViewController:vc animated:YES];
}


@end
