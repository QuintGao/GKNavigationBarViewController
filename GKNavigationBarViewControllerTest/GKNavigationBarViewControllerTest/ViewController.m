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

@property (nonatomic, assign) BOOL show;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor   = [UIColor whiteColor];
        
    self.gk_navigationItem.title = @"你好啊";
    
    self.gk_navBackgroundColor = [UIColor blueColor];
    
    self.show = YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    SecondViewController *vc = [SecondViewController new];
    
    [self.navigationController pushViewController:vc animated:YES];
//    self.gk_StatusBarHidden = !self.gk_StatusBarHidden;
//    if (self.show) {
//        self.show = NO;
//        
//        [self hideNavLine];
//        
//    }else {
//        self.show = YES;
//        
//        [self showNavLine];
//    }
    
}


@end
