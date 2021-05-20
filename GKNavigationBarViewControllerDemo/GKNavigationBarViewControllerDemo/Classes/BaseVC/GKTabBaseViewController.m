//
//  GKTabBaseViewController.m
//  GKNavigationControllerDemo
//
//  Created by QuintGao on 2017/6/25.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKTabBaseViewController.h"
#import "UIView+Extension.h"

@interface GKTabBaseViewController ()

@property (nonatomic, strong) UIBarButtonItem *closeItem;

@end

@implementation GKTabBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navRightBarButtonItem = self.closeItem;
}

- (void)closeAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIBarButtonItem *)closeItem {
    if (!_closeItem) {
        UIButton *btn = [UIButton new];
        btn.frame = CGRectMake(0, 0, 44, 44);
        [btn setTitle:@"关闭" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
        
        _closeItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    return _closeItem;
}

@end
