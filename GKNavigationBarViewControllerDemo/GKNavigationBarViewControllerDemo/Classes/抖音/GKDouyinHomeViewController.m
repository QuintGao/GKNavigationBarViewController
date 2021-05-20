//
//  GKDouyinHomeViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2018/9/11.
//  Copyright © 2018年 QuintGao. All rights reserved.
//

#import "GKDouyinHomeViewController.h"
#import "GKDouyinHomeSearchViewController.h"
#import "GKDouyinHomePlayerViewController.h"
#import "GKDouyinPersonalViewController.h"
#import "GKDouyinScrollView.h"


@interface GKDouyinHomeViewController ()<GKViewControllerPushDelegate>

@property (nonatomic, strong) GKDouyinScrollView                *scrollView;

@property (nonatomic, strong) GKDouyinHomeSearchViewController  *searchVC;
@property (nonatomic, strong) GKDouyinHomePlayerViewController  *playerVC;

@property (nonatomic, strong) NSArray                           *childVCs;

@end

@implementation GKDouyinHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navBackgroundColor = [UIColor clearColor];
    self.gk_statusBarHidden = YES;
    
    self.gk_navRightBarButtonItem = [UIBarButtonItem itemWithTitle:@"关闭" target:self action:@selector(closeAction)];
    
    [self.view addSubview:self.scrollView];
    self.scrollView.frame = self.view.bounds;
    
    self.childVCs = @[self.searchVC, self.playerVC];
    
    CGFloat w = self.view.frame.size.width;
    CGFloat h = self.view.frame.size.height;
    
    [self.childVCs enumerateObjectsUsingBlock:^(UIViewController *vc, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addChildViewController:vc];
        [self.scrollView addSubview:vc.view];
        
        vc.view.frame = CGRectMake(idx * w, 0, w, h);
    }];
    
    self.scrollView.contentSize = CGSizeMake(self.childVCs.count * w, 0);
    
    // 默认显示播放器页
    self.scrollView.contentOffset = CGPointMake(w, 0);
    
    // 设置左滑push代理
    self.gk_pushDelegate = self;
}

- (void)closeAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.gk_pushDelegate = self;
    
    self.gk_statusBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.gk_pushDelegate = nil;
    
    self.gk_statusBarHidden = NO;
}

- (void)dealloc {
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

#pragma mark - GKViewControllerPushDelegate
- (void)pushToNextViewController {
    GKDouyinPersonalViewController *personalVC = [GKDouyinPersonalViewController new];
    [self.navigationController pushViewController:personalVC animated:YES];
}

#pragma mark - 懒加载
- (GKDouyinScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [GKDouyinScrollView new];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO; // 禁止弹簧效果
        if (@available(iOS 11.0, *)) {
            _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
    }
    return _scrollView;
}

- (GKDouyinHomeSearchViewController *)searchVC {
    if (!_searchVC) {
        _searchVC = [GKDouyinHomeSearchViewController new];
    }
    return _searchVC;
}

- (GKDouyinHomePlayerViewController *)playerVC {
    if (!_playerVC) {
        _playerVC = [GKDouyinHomePlayerViewController new];
    }
    return _playerVC;
}

@end
