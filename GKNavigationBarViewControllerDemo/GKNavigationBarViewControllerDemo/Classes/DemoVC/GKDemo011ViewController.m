//
//  GKDemo011ViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by gaokun on 2019/3/15.
//  Copyright © 2019 gaokun. All rights reserved.
//

#import "GKDemo011ViewController.h"
#import <MJRefresh/MJRefresh.h>

@interface GKDemo011ViewController ()<JXCategoryViewDelegate, JXCategoryListContainerViewDelegate>

@property (nonatomic, strong) JXCategoryTitleView   *segmentedView;

@property (nonatomic, strong) JXCategoryListContainerView *containerView;

@property (nonatomic, strong) NSArray   *titles;

@end

@implementation GKDemo011ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navTitle = @"分页滑动";
    
    [self.view addSubview:self.segmentedView];
    [self.view addSubview:self.containerView];
    
    [self.segmentedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.gk_navigationBar.mas_bottom);
        make.height.mas_equalTo(50.0f);
    }];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.segmentedView.mas_bottom);
    }];
}

#pragma mark - JXCategoryListContainerViewDelegate
- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.titles.count;
}

- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    GKDemoListView *listView = [GKDemoListView new];
    return listView;
}

#pragma mark - 懒加载
- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"推荐", @"热点", @"北京", @"视频", @"图片", @"问答", @"娱乐", @"科技", @"财经", @"军事"];
    }
    return _titles;
}

- (JXCategoryTitleView *)segmentedView {
    if (!_segmentedView) {
        _segmentedView = [JXCategoryTitleView new];
        _segmentedView.backgroundColor = [UIColor whiteColor];
        _segmentedView.titles = self.titles;
        _segmentedView.titleColor = [UIColor blackColor];
        _segmentedView.titleSelectedColor = [UIColor redColor];
        _segmentedView.titleFont = [UIFont systemFontOfSize:15.0f];
        _segmentedView.titleSelectedFont = [UIFont systemFontOfSize:15.0f];
        _segmentedView.contentScrollViewClickTransitionAnimationEnabled = NO;
        
        JXCategoryIndicatorLineView *lineView = [JXCategoryIndicatorLineView new];
        lineView.lineStyle = JXCategoryIndicatorLineStyle_Lengthen;
        _segmentedView.indicators = @[lineView];
        
        _segmentedView.listContainer = self.containerView;
        
        _segmentedView.collectionView.gk_disableGestureHandle = YES;
    }
    return _segmentedView;
}

- (JXCategoryListContainerView *)containerView {
    if (!_containerView) {
        _containerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_CollectionView delegate:self];
    }
    return _containerView;
}

@end

@interface GKDemoListView()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView   *tableView;

@property (nonatomic, assign) NSInteger      count;

@end

@implementation GKDemoListView

- (instancetype)init {
    if (self = [super init]) {
        [self addSubview:self.tableView];
        
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.count = 30;
                
                [self.tableView reloadData];
                
                [self.tableView.mj_header endRefreshing];
            });
        }];
        
        [self.tableView.mj_header beginRefreshing];
    }
    return self;
}

#pragma mark - <UITableViewDataSource, UITableViewDelegate>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第%zd行", indexPath.row+1];
    return cell;
}

#pragma mark - JXCategoryListCollectionContentViewDelegate
- (UIView *)listView {
    return self;
}

#pragma mark - 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

@end
