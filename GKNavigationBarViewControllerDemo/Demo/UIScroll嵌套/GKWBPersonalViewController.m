//
//  GKWBPersonalViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by gaokun on 2018/10/24.
//  Copyright © 2018 gaokun. All rights reserved.
//

#import "GKWBPersonalViewController.h"
#import "GKWBSubViewController.h"
#import "JXCategoryView.h"
#import "GKPageScrollView.h"

#define kHeaderHeight 200.0f

@interface GKWBPersonalViewController ()<GKPageScrollViewDelegate, JXCategoryViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) GKPageScrollView      *pageScrollView;

@property (nonatomic, strong) UIView                *headerView;
@property (nonatomic, strong) UIImageView           *topImgView;

@property (nonatomic, strong) JXCategoryTitleView   *categoryView;

@property (nonatomic, strong) UIScrollView          *mainScrollView;

@property (nonatomic, strong) UIView                *pageView;

@property (nonatomic, strong) NSArray               *titles;

@property (nonatomic, strong) NSArray               *childVCs;

@end

@implementation GKWBPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navBackgroundColor = [UIColor clearColor];
    
    self.gk_navTitle = @"微博";
    self.gk_navTitleColor = [UIColor whiteColor];
    self.gk_navLeftBarButtonItem = [UIBarButtonItem itemWithTitle:nil image:GKImage(@"btn_back_white") target:self action:@selector(backAction)];
    self.gk_statusBarStyle = UIStatusBarStyleLightContent;
    
    [self.view addSubview:self.pageScrollView];
    [self.pageScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.pageScrollView reloadData];
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - GKPageScrollViewDelegate
- (UIView *)headerViewInPageScrollView:(GKPageScrollView *)pageScrollView {
    return self.headerView;
}

- (CGFloat)headerViewHeightInPageScrollView:(GKPageScrollView *)pageScrollView {
    return GK_SCREEN_WIDTH - 120.0f;
}

- (UIView *)pageViewInPageScrollView:(GKPageScrollView *)pageScrollView {
    return self.pageView;
}

- (NSArray<id<GKPageListScrollViewDelegate>> *)listViewsInPagerView:(GKPageScrollView *)pageScrollView {
    return self.childVCs;
}

- (void)mainTableViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    
//    // headerView下拉放大
//    if(offsetY <= -(kHeaderHeight)) {
//        CGRect f = self.headerView.frame;
//        //上下放大
//        f.origin.y      = offsetY;
//        f.size.height   = -offsetY;
//        //左右放大
//        f.origin.x = (offsetY * GK_SCREEN_WIDTH / kHeaderHeight + GK_SCREEN_WIDTH)/2;
//        f.size.width = -offsetY * GK_SCREEN_WIDTH / kHeaderHeight;
//        //改变头部视图的frame
//        self.headerView.frame = f;
//    }
    
    // headerView下拉放大
    CGRect frame = CGRectMake(0, 0, GK_SCREEN_WIDTH, kHeaderHeight);
    frame.size.height -= offsetY;
    frame.origin.y = offsetY;
    self.topImgView.frame = frame;
}

#pragma mark - 懒加载
- (GKPageScrollView *)pageScrollView {
    if (!_pageScrollView) {
        _pageScrollView = [[GKPageScrollView alloc] initWithDelegate:self];
    }
    return _pageScrollView;
}

- (UIView *)headerView {
    if (!_headerView) {
        UIView *headerView = [UIView new];
        headerView.frame = CGRectMake(0, 0, GK_SCREEN_WIDTH, kHeaderHeight);
        [headerView addSubview:self.topImgView];
        _headerView = headerView;
    }
    return _headerView;
}

- (UIImageView *)topImgView {
    if (!_topImgView) {
        _topImgView = [UIImageView new];
        _topImgView.frame = CGRectMake(0, 0, GK_SCREEN_WIDTH, kHeaderHeight);
        _topImgView.image = [UIImage imageNamed:@"bg"];
        _topImgView.contentMode = UIViewContentModeScaleAspectFill;
        _topImgView.clipsToBounds = YES;
    }
    return _topImgView;
}

- (JXCategoryTitleView *)categoryView {
    if (!_categoryView) {
        _categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(40, 0, GK_SCREEN_WIDTH - 80, 40)];
        _categoryView.titles = self.titles;
        _categoryView.backgroundColor = [UIColor whiteColor];
        _categoryView.delegate = self;
        _categoryView.titleColor = [UIColor grayColor];
        _categoryView.titleSelectedColor = [UIColor blackColor];
        _categoryView.titleFont = [UIFont systemFontOfSize:15.0f];
        _categoryView.titleSelectedFont = [UIFont systemFontOfSize:15.0f];
        
        JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
        lineView.indicatorLineViewColor = [UIColor purpleColor];
        lineView.indicatorLineWidth = 36.0f;
        lineView.lineStyle = JXCategoryIndicatorLineStyle_JD;
        _categoryView.indicators = @[lineView];
        
        _categoryView.contentScrollView = self.mainScrollView;
    }
    return _categoryView;
}

- (UIScrollView *)mainScrollView {
    if (!_mainScrollView) {
        CGFloat scrollW = GK_SCREEN_WIDTH;
        CGFloat scrollH = GK_SCREEN_HEIGHT - GK_STATUSBAR_NAVBAR_HEIGHT - 40.0f;
        
        _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, scrollW, scrollH)];
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.bounces = NO;
        _mainScrollView.showsVerticalScrollIndicator = NO;
        _mainScrollView.showsHorizontalScrollIndicator = NO;
        _mainScrollView.delegate = self;
        
        for (NSInteger i = 0; i < self.childVCs.count; i++) {
            UIViewController *vc = self.childVCs[i];
            [self addChildViewController:vc];
            [_mainScrollView addSubview:vc.view];
            
            vc.view.frame = CGRectMake(i * scrollW, 0, scrollW, scrollH);
        }
        _mainScrollView.contentSize = CGSizeMake(scrollW * self.childVCs.count, 0);
    }
    return _mainScrollView;
}

- (UIView *)pageView {
    if (!_pageView) {
        _pageView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, GK_SCREEN_WIDTH, GK_SCREEN_HEIGHT - GK_STATUSBAR_NAVBAR_HEIGHT)];
        _pageView.backgroundColor = [UIColor clearColor];
        
        [_pageView addSubview:self.categoryView];
        
        UIView *btmLineView = [UIView new];
        btmLineView.backgroundColor = [UIColor lightGrayColor];
        btmLineView.frame = CGRectMake(0, 40 - 0.5, GK_SCREEN_WIDTH, 0.5);
        [_pageView addSubview:btmLineView];
        
        [_pageView addSubview:self.mainScrollView];
    }
    return _pageView;
}

- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"主页", @"微博", @"视频", @"故事"];
    }
    return _titles;
}

- (NSArray *)childVCs {
    if (!_childVCs) {
        GKWBSubViewController *homeVC = [GKWBSubViewController new];
        
        GKWBSubViewController *wbVC = [GKWBSubViewController new];
        
        GKWBSubViewController *videoVC = [GKWBSubViewController new];
        
        GKWBSubViewController *storyVC = [GKWBSubViewController new];
        
        _childVCs = @[homeVC, wbVC, videoVC, storyVC];
    }
    return _childVCs;
}

@end
