//
//  GKWBSubViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by gaokun on 2018/10/24.
//  Copyright © 2018 gaokun. All rights reserved.
//

#import "GKWBSubViewController.h"

@interface GKWBSubViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView   *tableView;

@property (nonatomic, copy) void(^listViewScrollCallBack)(UIScrollView *scrollView);

@end

@implementation GKWBSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navigationBar.hidden = YES;
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第%zd行", indexPath.row + 1];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    !self.listViewScrollCallBack ? : self.listViewScrollCallBack(scrollView);
}

//#pragma mark - GKPageListScrollViewDelegate
//- (UIScrollView *)listScrollView {
//    return self.tableView;
//}
//
//- (void)listViewDidScrollCallback:(void (^)(UIScrollView * _Nonnull))callBack {
//    self.listViewScrollCallBack = callBack;
//}

#pragma mark - JXPagerViewListViewDelegate
- (UIView *)listView {
    return self.view;
}

- (UIScrollView *)listScrollView {
    return self.tableView;
}

- (void)listViewDidScrollCallback:(void (^)(UIScrollView *))callback {
    self.listViewScrollCallBack = callback;
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
