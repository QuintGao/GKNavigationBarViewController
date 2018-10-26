//
//  GKPageScrollView.m
//  GKNavigationBarViewControllerDemo
//
//  Created by gaokun on 2018/10/24.
//  Copyright © 2018 gaokun. All rights reserved.
//

#import "GKPageScrollView.h"
#import "GKPageTableView.h"

@interface GKPageScrollView()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) GKPageTableView   *tableView;

// 水平滑动的scrollView
@property (nonatomic, strong) UIScrollView  *horizontalScrollView;

// 列表scrollView
@property (nonatomic, strong) UIScrollView  *currentListScrollView;

@property (nonatomic, assign) BOOL          isLoad;

// tableView是否可滑动
@property (nonatomic, assign) BOOL          isCanScroll;
// 列表scrollView是否可滑动
@property (nonatomic, assign) BOOL          islistViewCanScroll;
// 是否到达临界点
@property (nonatomic, assign) BOOL          isCriticalPoint;

@end

@implementation GKPageScrollView

- (instancetype)initWithDelegate:(id<GKPageScrollViewDelegate>)delegate {
    if (self = [super init]) {
        self.delelgate = delegate;
        
        [self initSubviews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.tableView.frame = self.bounds;
}

- (void)initSubviews {
    self.isCanScroll = YES;
    self.islistViewCanScroll = NO;
    
    self.tableView = [[GKPageTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource       = self;
    self.tableView.delegate         = self;
    self.tableView.separatorStyle   = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator     = NO;
    self.tableView.showsHorizontalScrollIndicator   = NO;
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    // 设置tableView偏移量
//    self.tableView.contentInset = UIEdgeInsetsMake([self.delelgate headerViewHeightInPageScrollView:self], 0, 0, 0);
//    // 添加headerView
//    [self.tableView insertSubview:[self.delelgate headerViewInPageScrollView:self] atIndex:0];
    self.tableView.tableHeaderView = [self.delelgate headerViewInPageScrollView:self];
    
    [self addSubview:self.tableView];
    
    [self listViewDidScroll];
}

- (void)reloadData {
    self.isLoad = YES;
    
    [self.tableView reloadData];
}

- (void)listViewDidScroll {
    [[self.delelgate listViewsInPagerView:self] enumerateObjectsUsingBlock:^(id<GKPageListScrollViewDelegate>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        __weak typeof(self) weakSelf = self;
        [obj listViewDidScrollCallback:^(UIScrollView * _Nonnull scrollView) {
            [weakSelf listScrollViewDidScroll:scrollView];
        }];
    }];
}

#pragma mark - Private Methods
// 列表滑动
- (void)listScrollViewDidScroll:(UIScrollView *)scrollView {
    // 当前偏移量
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (!self.islistViewCanScroll) {
        scrollView.contentOffset = CGPointZero;
    }
    
//    NSLog(@"%f", offsetY);
    // listScrollView下滑至offsetY小于0，禁止其滑动，此时让mainTableView可下滑
    if (offsetY <= 0) {
        self.islistViewCanScroll = NO;
        self.isCanScroll = YES;
        scrollView.contentOffset = CGPointZero;
        scrollView.showsVerticalScrollIndicator = NO;
    }else {
        if (self.islistViewCanScroll) {
            scrollView.showsVerticalScrollIndicator = YES;
        }
    }
}

// tableView滑动
- (void)mainTableViewDidScroll:(UIScrollView *)scrollView {
    // 当前偏移量
    CGFloat offsetY = self.tableView.contentOffset.y;
    // 临界点
    CGFloat criticalPoint = [self.tableView rectForSection:0].origin.y - GK_STATUSBAR_NAVBAR_HEIGHT;
    
    // 根据偏移量判断是否上滑到临界点
    if (offsetY >= criticalPoint) {
        self.isCriticalPoint = YES;
    }else {
        self.isCriticalPoint = NO;
    }
    
    if (self.isCriticalPoint) {
        // 上滑到达临界点后，固定其位置
        scrollView.contentOffset = CGPointMake(0, criticalPoint);
        self.islistViewCanScroll = YES;
        self.isCanScroll = NO;
    }else {
        // 下滑时listScrollView未滑动到原位置时，固定其位置，此时让listScrollView滑动
        if (self.isCanScroll) {
            [[self.delelgate listViewsInPagerView:self] enumerateObjectsUsingBlock:^(id<GKPageListScrollViewDelegate>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                // mainTableView可滑动，重置listScrollView的位置
                UIScrollView *listScrollView = [obj listScrollView];
                listScrollView.contentOffset = CGPointZero;
                listScrollView.showsVerticalScrollIndicator = NO;
            }];
        }else {
            scrollView.contentOffset = CGPointMake(0, criticalPoint);
        }
    }
    
    if ([self.delelgate respondsToSelector:@selector(mainTableViewDidScroll:)]) {
        [self.delelgate mainTableViewDidScroll:scrollView];
    }
}

#pragma mark - UITableViewDataSource & UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.isLoad ? 1 : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.contentView addSubview:[self.delelgate pageViewInPageScrollView:self]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return GK_SCREEN_HEIGHT - GK_STATUSBAR_NAVBAR_HEIGHT;
}

#pragma mark - UIScrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self mainTableViewDidScroll:scrollView];
}

@end
