//
//  GKDemo004ViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2021/4/6.
//  Copyright © 2021 QuintGao. All rights reserved.
//

#import "GKDemo004ViewController.h"

@interface GKDemo004ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewTop;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation GKDemo004ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navTitle = @"UITableView xib";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.tableViewTop.constant = self.gk_navigationBar.frame.size.height;
}

#pragma mark - <UITableViewDataSource, UITableViewDelegate>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第%zd行", indexPath.row + 1];
    return cell;
}

@end
