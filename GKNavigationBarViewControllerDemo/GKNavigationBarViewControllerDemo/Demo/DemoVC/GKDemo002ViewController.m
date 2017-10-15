//
//  GKSecondViewController.m
//  GKNavigationController
//
//  Created by QuintGao on 2017/6/21.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "GKDemo002ViewController.h"
#import "GKDemo003ViewController.h"

@interface GKDemo002ViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation GKDemo002ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor grayColor];
    self.scrollView.contentSize = CGSizeMake(0, self.view.frame.size.height + 500);
//    [self.view addSubview:self.scrollView];
    [self.view insertSubview:self.scrollView atIndex:0];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.gk_navBackgroundColor = [UIColor redColor];
    self.gk_navBarAlpha     = 0.0;
    
    self.title = @"控制器002";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIButton *btn = [UIButton new];
    btn.frame = CGRectMake(100, 400, 60, 20);
    btn.backgroundColor = [UIColor blackColor];
    [btn setTitle:@"Push" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    self.gk_navBarAlpha = 0.0;
    NSLog(@"%@", self.gk_navigationBar.subviews);
}

- (void)btnAction {
    GKDemo003ViewController *demo003VC = [GKDemo003ViewController new];
    demo003VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:demo003VC animated:YES];
}

// 自定义返回按钮：GKNavigationController.useSystemBackBarButtonItem 为NO时生效

- (UIBarButtonItem *)gk_customBackItemWithTarget:(id)target action:(SEL)action {
    UIButton *btn = [UIButton new];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn sizeToFit];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

#pragma mark - UIScrollViewDelegate

// 渐变导航栏
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat contentY = scrollView.contentOffset.y;
    
    if (contentY <= 0) {
        self.gk_navBarAlpha = 0;
        return;
    }
    
    // 渐变区间 (0 - 80)
    if (contentY > 0 && contentY < 160) {
        CGFloat alpha = contentY / (160 - 0);
        
        self.gk_navBarAlpha = alpha;
    }else {
        self.gk_navBarAlpha = 1.0;
    }
}

@end
