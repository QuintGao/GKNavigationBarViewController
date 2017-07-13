//
//  GKTabBaseViewController.m
//  GKNavigationControllerDemo
//
//  Created by QuintGao on 2017/6/25.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "GKTabBaseViewController.h"
#import "UIView+Extension.h"
#import "GKDemo005ViewController.h"

@interface GKTabBaseViewController ()

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UIButton *pushBtn;

@end

@implementation GKTabBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.pushBtn = [UIButton new];
    self.pushBtn.frame = CGRectMake(0, 199, 60, 20);
    self.pushBtn.centerX = self.view.centerX;
    self.pushBtn.backgroundColor = [UIColor blackColor];
    [self.pushBtn setTitle:@"push" forState:UIControlStateNormal];
    [self.pushBtn addTarget:self action:@selector(pushAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.pushBtn];
    
    self.contentLabel = [UILabel new];
    self.contentLabel.textColor = [UIColor blackColor];
    self.contentLabel.font = [UIFont systemFontOfSize:16.0];
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.textAlignment = NSTextAlignmentCenter;
    self.contentLabel.width = self.view.width - 80;
    [self.view addSubview:self.contentLabel];
    
    [self showBackBtn];
}

- (void)showBackBtn {
    UIButton *btn = [UIButton new];
    [btn setImage:[UIImage imageNamed:@"btn_back_white"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

- (void)btnClick:(id)sender {
    
    if ([self.tabBarController isKindOfClass:[GKDemo005ViewController class]]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)pushAction{}

- (void)setContentText:(NSString *)contentText {
    _contentText = contentText;
    
    self.contentLabel.text = contentText;
    [self.contentLabel sizeToFit];
    self.contentLabel.center = self.view.center;
}

@end
