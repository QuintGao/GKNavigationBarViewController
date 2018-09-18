//
//  GKDouyinHomeViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by gaokun on 2018/9/11.
//  Copyright © 2018年 gaokun. All rights reserved.
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
    
    // 数据来源 - 伙拍小视频
    // 请求类型：post
    // url: http://c.tieba.baidu.com/c/f/nani/recommend/list  推荐列表
    // 参数:_client_type=1&_client_version=2.1.2&_os_version=12.0&_phone_imei=40323C7A236388EE16EA1DB6E2C00953%7Ccom.baidu.nani&_phone_newimei=40323C7A236388EE16EA1DB6E2C00953%7Ccom.baidu.nani&_timestamp=1536889887055&brand=iPhone&brand_type=iPhone%206S&cuid=40323C7A236388EE16EA1DB6E2C00953%7Ccom.baidu.nani&diuc=8968E69E7046FB255A50ECEF8A9A0355E975697DFOHESTFSFJS&dl=A4FE971A301188ABA87253190977D4D1&from=AppStore&model=iPhone%206S&nani_idfa=7452C340-6659-4F0B-8BBA-5F7C45041255&pn=1&rn=20&sign=FA9AE0014A434DFAD8627B18F3AB3235&subapp_type=nani&timestamp=1536889887055&z_id=zgrHWX4foa0MFiKiSZ01IoKGNA7GPWqOmGUenKGOqDMfhMwgcn6ish2El63B2g5vBPmN58xhygeAFPiW_lhoZMg
}

- (void)closeAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    self.gk_pushDelegate = nil;
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
