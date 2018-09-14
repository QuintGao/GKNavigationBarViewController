//
//  GKDemo005ViewController.m
//  GKNavigationController
//
//  Created by QuintGao on 2017/6/22.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "GKDemo006ViewController.h"

@interface GKDemo006ViewController ()<UIGestureRecognizerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) NSInteger rowCount;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation GKDemo006ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UITableView";
    self.gk_navBackgroundColor = [UIColor orangeColor];
    
    self.gk_navRightBarButtonItem = self.editButtonItem;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NAVBAR_HEIGHT, self.view.frame.size.width, self.view.frame.size.height - NAVBAR_HEIGHT) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate   = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    
//    self.gk_fullScreenPopDisabled = YES;
    
    // 禁止滑动push，防止与UITableView cell滑动删除冲突
    self.navigationController.gk_openScrollLeftPush = NO;
    
    self.rowCount = 20;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    // 开启滑动push
    self.navigationController.gk_openScrollLeftPush = YES;
}

- (void)dealloc {
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%zd行", indexPath.row + 1];
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        self.rowCount --;
        
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

@end
