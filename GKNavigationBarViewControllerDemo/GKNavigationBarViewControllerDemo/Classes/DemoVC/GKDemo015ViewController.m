//
//  GKDemo015ViewController.m
//  GKNavigationBarExample
//
//  Created by gaokun on 2020/1/13.
//  Copyright © 2020 QuintGao. All rights reserved.
//

#import "GKDemo015ViewController.h"

@interface GKDemo015ViewController ()

@property (nonatomic, strong) UIBarButtonItem *backBtn;
@property (nonatomic, strong) UIBarButtonItem *closeBtn;

@end

@implementation GKDemo015ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navigationItem.title = @"WebView跳转";
    self.gk_navLeftBarButtonItem = self.backBtn;
    self.gk_navRightBarButtonItem = self.closeBtn;
}

- (UIBarButtonItem *)backBtn {
    if (!_backBtn) {
        UIButton *back = [UIButton new];
        back.frame = CGRectMake(0, 0, 44, 44);
        [back setImage:[UIImage gk_imageNamed:@"btn_back_black"] forState:UIControlStateNormal];
        back.backgroundColor = [UIColor redColor];
        
        _backBtn = [[UIBarButtonItem alloc] initWithCustomView:back];
    }
    return _backBtn;
}

- (UIBarButtonItem *)closeBtn {
    if (!_closeBtn) {
        UIButton *close = [UIButton new];
        close.frame = CGRectMake(0, 0, 44, 44);
        [close setTitle:@"关闭" forState:UIControlStateNormal];
        [close setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        close.backgroundColor = [UIColor redColor];
        
        _closeBtn = [[UIBarButtonItem alloc] initWithCustomView:close];
    }
    return _closeBtn;
}

@end
